#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
    echo Please run this script as root or using sudo!
    exit
fi

enter_pwd() {
    read -r -s -p "Password: " password
    local confirm_pwd
    read -r -s -p "Password: " confirm_pwd
    if [ "$password" != "$confirm_pwd" ]; then
        echo "Passwords are different! Try again."
        enter_pwd
    fi
}

enter_user() {
    echo -ne "Enter username: "
    read -r user
    test "$user" || enter_user
    enter_pwd
}

echo -e "\n### UPDATE SYSTEM\n"
apt update -y
apt upgrade -y

echo -e "\n### INSTALL PACKAGES\n"
pkgs=(
    less
    man
    curl
    kitty-terminfo
    ca-certificates
    build-essential
    btop
    neovim
    ranger
    git
)
echo '->>' "${pkgs[@]}"
apt install -y "${pkgs[@]}"

echo -e "\n### INSTALL SHELL\n"
prompt_pkgs=(
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-common
    zsh-doc
)
echo "->>" "${prompt_pkgs[@]}"
apt install -y "${prompt_pkgs[@]}"

echo -e "\n### ADD USER\n"
enter_user
enter_pwd
sudo useradd -m -s "$(which zsh)" -U "$user"
echo "${user}:${password}" | sudo chpasswd

echo -e "\n### SET GROUPS (user)\n"
grps=(admin adm sudo network netdev input storage docker)
echo "->>" "${grps[@]}"
for grp in "${grps[@]}"; do
    (cut -d: -f1 /etc/group | sort | grep -q "^$grp\$") || groupadd "$grp"
    usermod -aG "$grp" "$user"
done

echo -e "\n### SETUP USER DIRECTORY: ubuntu 24\n"
homedir="/home/$user"
cp -r .config/* "$homedir/.config/"
cp .*.zsh .zshrc "$homedir/"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$homedir/powerlevel10k"
chown -R "$user:$user" "/home/$user"

echo -e "\n### NEXT STEPS\n"
ip_addr="$(curl -s ifconfig.me || echo 'SERVER_IP')"
echo -e "1. Configure pubkey auth. Close password auth:\n"
echo "On host:   \$> ssh-copy-id ${user}@${ip_addr}"
echo "On server: \$> sudo nvim /etc/ssh/sshd_config/*-cloud_init.conf"
echo "       # Paste:"
echo "---"
echo "PasswordAuthentication no"
echo "PermitRootLogin no"
echo "PubkeyAuthentication yes"
echo -e "---\n"
echo -e "Then run: sudo service ssh restart\n"

echo -e "2. Configure Firewall:\n"
echo "  iptables (netfilter) or UFW"

echo -e "3. Install docker:\n"
echo "\$> sudo curl -fsSL https://get.docker.com | sh"

# echo -e "\n### INSTALL SHELL PROMPT\n"
# echo ">>> install romkatv/p10k"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'if no p10k in .zshrc, run:'
# echo '  source ~/powerlevel10k/powerlevel10k.zsh-theme >>~/.zshrc'
