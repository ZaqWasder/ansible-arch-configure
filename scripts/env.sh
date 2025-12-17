export CONSOLE_FONT="ter-132b"
HOSTNAME="archlinux"
export INTERFACE_NAME="wlan0"
export WIFI_NAME="347"

export DISK="/dev/nvme0n1"
export EFI_PARTITION="${DISK}p1"
export ROOT_PARTITION="${DISK}p2"
export SWAP_PARTITION="${DISK}p3"
export HOME_PARTITION="${DISK}p4"

export ROOT_MOUNTPOINT="/mnt"
export EFI_MOUNTPOINT="${ROOT_MOUNTPOINT}/boot/efi"
export HOME_MOUNTPOINT="${ROOT_MOUNTPOINT}/home"

export PACMAN_PACKAGES=(
    ansible
    base
    base-devel
    bind
    bluetui
    bluez
    bluez-utils
    btrfs-assistant
    btrfs-progs
    chezmoi
    conntrack-tools
    dunst
    earlyoom
    efibootmgr
    fastfetch
    fzf
    git
    gnupg
    gopass
    grim
    grub
    grub-btrfs
    gst-plugin-pipewire
    htop
    hyprland
    hyprshot
    hyprpaper
    hyprpicker
    inotify-tools
    intel-media-driver
    intel-ucode
    iptables
    irqbalance
    iwd
    kitty
    less
    libpulse
    libva-intel-driver
    linux
    linux-firmware
    lsof
    lvm2
    man-db
    man-pages
    nano
    neovim
    networkmanager
    network-manager-applet
    nwg-look
    obsidian
    openssh
    pacman-contrib
    pavucontrol
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    polkit-kde-agent
    pulsemixer
    qt5-wayland
    qt6-virtualkeyboard
    qt6-wayland
    reflector
    rsync
    sddm
    shellcheck
    slurp
    smartmontools
    snapper
    sof-firmware
    strace
    stylua
    swww
    telegram-desktop
    terminus-font
    thunar
    tmux
    tree
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    unzip
    uwsm
    vim
    vulkan-intel
    vulkan-nouveau
    vulkan-radeon
    waybar
    wget
    wev
    wireless_tools
    wireplumber
    wofi
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    xdg-utils
    xf86-video-amdgpu
    xf86-video-ati
    xf86-video-nouveau
    xorg-server
    xorg-xinit
    yazi
    zed
    zram-generator
    zsh
)

export AUR_PACKAGES=(
    bibata-cursor-theme-bin
    clipse
    google-chrome
    matugen-bin
    rar
)

export TIMEZONE="Europe/Moscow"
export DEFAULT_LOCALE="en_US.UTF-8"
export ADDITIONAL_LOCALES=(
    "ru_RU.UTF-8"
)
export LOCALES=( "$DEFAULT_LOCALE" "${ADDITIONAL_LOCALES[@]}" )

export REPO_NAME="ansible-arch-configure"
export ARCH_CONFIGURE_REPO="https://github.com/ZaqWasder/${REPO_NAME}.git"
export REPO_DIR="/opt/${REPO_NAME}"
