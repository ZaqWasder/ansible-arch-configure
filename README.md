# ansible-arch-linux


Ansible playbook to setup my Arch Linux machine

## Requirements

1. Install the necessary packages
   ```
   sudo pacman -S git python
   ```
2. Clone this repo
   ```
   git clone
   cd ansible-arch-configure
   ```
3. Install Ansible
   ```
   python3 -m venv venv
   source venv/bin/activate
   pip3 install -r requirements.txt
   ```
4. Install the Ansible requirements
   ```
   ansible-galaxy install -r requirements.yml
   ```
5. (Optional) Run the playbook in check mode to view potential changes
   ```
   ansible-playbook main.yml --check
   ````
6. Run the playbook (enter your user's password when prompted)
   ```
   ansible-playbook main.yml
   ```
