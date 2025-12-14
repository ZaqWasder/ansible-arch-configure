
STATION_NAME="wlan0"
WIFI_NAME="347"

DISK="/dev/nvme0n1"
EFI_PARTITION="${DISK}p1"
ROOT_PARTITION="${DISK}p2"
SWAP_PARTITION="${DISK}p3"
HOME_PARTITION="${DISK}p4"

ROOT_MOUNTPOINT="/mnt"
EFI_MOUNTPOINT="${ROOT_MOUNTPOINT}/boot/efi"
HOME_MOUNTPOINT="${ROOT_MOUNTPOINT}/home"

PACKAGES=(
    base
    base-devel
    linux
    linux-firmware
    less
    vim
    git
    ansible
    grub
    btrfs-progs
    grub-btrfs
    efibootmgr
    networkmanager
    openssh
)

LOCALTIME="Europe/Moscow"
LOCALES=(
    "en_US.UTF-8"
    "ru_RU.UTF-8"
)

REPO_NAME="ansible-arch-configure"
ANSIBLE_ARCH_CONFIGURE_REPO="https://github.com/ZaqWasder/${REPO_NAME}.git"
ANSIBLE_REPO_DIR="/opt/${REPO_NAME}"
