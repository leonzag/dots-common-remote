from os import getenv
from subprocess import Popen, PIPE, run
import time

from ranger.ext.img_display import register_image_displayer, ImageDisplayer, KittyImageDisplayer, SixelImageDisplayer

if getenv("TERM", "") == "xterm-kitty":
    @register_image_displayer('kitty_or_sixel')
    class KittyImageDisplayerProvider(KittyImageDisplayer):
        ...
else:
    @register_image_displayer('kitty_or_sixel')
    class SixelImageDisplayerProvider(SixelImageDisplayer):
        ...


@register_image_displayer("imv")
class IMVImageDisplayer(ImageDisplayer):
    """
    Implementation of ImageDisplayer using imv
    """
    is_initialized = False

    def __init__(self):
        self.process = None

    def initialize(self):
        """ start imv """
        if (self.is_initialized and self.process.poll() is None and
                not self.process.stdin.closed):
            return

        self.process = Popen(['imv'], cwd=self.working_dir,
                             stdin=PIPE, universal_newlines=True)
        self.is_initialized = True
        time.sleep(1)

    def draw(self, path, start_x, start_y, width, height):
        self.initialize()
        run(['imv-msg', str(self.process.pid), 'close'])
        run(['imv-msg', str(self.process.pid), 'open', path])

    def clear(self, start_x, start_y, width, height):
        self.initialize()
        run(['imv-msg', str(self.process.pid), 'close'])

    def quit(self):
        if self.is_initialized and self.process.poll() is None:
            self.process.terminate()
