#!/usr/bin/env bash
set -eu

source env.sh

# postinstall
ln -sf /usr/share/zoneinfo/${LOCALTIME} /etc/localtime
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


#passwd

#rm -rf $ANSIBLE_REPO_DIR
#git clone $ANSIBLE_ARCH_CONFIGURE_REPO $ANSIBLE_REPO_DIR
#cd $ANSIBLE_REPO_DIR
#python -m venv venv
#source venv/bin/activate
#pip3 install -r requirements.txt
#ansible-galaxy install -r requirements.yml
