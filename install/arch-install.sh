#!/usr/bin/env bash
set -eu

source .env

loadkeys us

iwctl station ${INTERFACE_NAME} scan 
iwctl station ${INTERFACE_NAME} connect ${WIFI_NAME}

timedatectl set-ntp true

# Disk partition
parted $DISK --script mklabel gpt
parted $DISK --script mkpart efi fat32 2048s 1128447s
parted $DISK --script set 1 esp on
parted $DISK --script mkpart root btrfs 1128448s 210843647s
parted $DISK --script mkpart swap linux-swap 210843648s 277952511s
parted $DISK --script mkpart home ext4 277952512s 100%
parted $DISK --script align-check optimal 1
parted $DISK --script align-check optimal 2
parted $DISK --script align-check optimal 3
parted $DISK --script align-check optimal 4

# Create filesystems
mkfs.fat -F 32 $EFI_PARTITION
mkfs.btrfs -f $ROOT_PARTITION
mkswap $SWAP_PARTITION
mkfs.ext4 -F -m 0 $HOME_PARTITION

# Mount filesystems and enable swap
mount $ROOT_PARTITION $ROOT_MOUNTPOINT
btrfs subvolume create ${ROOT_MOUNTPOINT}/@root
btrfs subvolume create ${ROOT_MOUNTPOINT}/@log
umount $ROOT_MOUNTPOINT
mount -o relatime,compress=zstd:3,ssd_spread,commit=300,subvol=@root $ROOT_PARTITION $ROOT_MOUNTPOINT
mount --mkdir -o relatime,compress=zstd:3,ssd_spread,commit=300,subvol=@log $ROOT_PARTITION ${ROOT_MOUNTPOINT}/var/log
mount --mkdir $EFI_PARTITION $EFI_MOUNTPOINT
mount --mkdir $HOME_PARTITION $HOME_MOUNTPOINT
swapon $SWAP_PARTITION

#Install archlinux to root mountpoint
#reflector --country Russia --sort rate --threads $(nproc) --ipv4 --save /etc/pacman.d/mirrorlist
pacman -Sy archlinux-keyring
pacman -S archlinux-keyring
pacstrap -Ki $ROOT_MOUNTPOINT ${PACMAN_PACKAGES[@]}

# Generate fstab
genfstab -U $ROOT_MOUNTPOINT >> ${ROOT_MOUNTPOINT}/etc/fstab

echo "LANG=${DEFAULT_LOCALE}" > ${ROOT_MOUNTPOINT}/etc/locale.conf
echo "KEYMAP=us" > ${ROOT_MOUNTPOINT}/etc/vconsole.conf
echo "${HOSTNAME}" > ${ROOT_MOUNTPOINT}/etc/hostname

# Clone repo and run chroot-install.sh
git clone --branch $REPO_BRANCH --recurse-submodules $ARCH_CONFIGURE_REPO ${ROOT_MOUNTPOINT}${REPO_DIR}
arch-chroot $ROOT_MOUNTPOINT ${REPO_DIR}/install/chroot-install.sh
