#!/usr/bin/env bash
set -eu

source .env

# postinstall
ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
hwclock --systohc

for lcl in ${LOCALES[@]}; do
    sed -i "/${lcl}/s/^#//" /etc/locale.gen
done

locale-gen

# add btrfs module to mkinitcio.conf
sed -i 's/^MODULES.*/MODULES=(btrfs)/' /etc/mkinitcpio.conf
mkinitcpio -P

# grub-install
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg


useradd -m -s ${USER_SHELL} ${USER_NAME}
echo "Enter password for root:"
passwd
echo "Enter password for ${USER_NAME}:"
passwd ${USER_NAME}

rm -rf $REPO_DIR
git clone --branch $REPO_BRANCH $ARCH_CONFIGURE_REPO $REPO_DIR
