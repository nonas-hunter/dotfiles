# dotfiles
Welcome! You have found my dotfiles repository which contains the configurations for all my favorite utilities (or at least the ones I find myself downloading on almost every computer I interact with). I use ansible to apply all of the configurations.

## Setup (installing ansible)
Ansible is a python package. I like to install python packages with my favorite python package/environment manager, [`uv`](https://docs.astral.sh/uv/). `uv` will handle all of the python version and package management so you don't even need to worry about having python already downloaded on your system. `uv` will handle all of that for us!

### 1. Install uv
Go to the [installation page on the `uv` website](https://docs.astral.sh/uv/getting-started/installation/) and follow the instructions. I recommend using the standalone installer.

### 2. Install ansible
Once `uv` is installed, we'll use `uv tool` to install ansible using the following command.

```bash
uv tool install --with pexpect --with passlib --with argcomplete ansible-core
```

### 3. Celebrate
And that's it! You're now ready to use ansible!

## Running the playbook
Once ansible is installed, clone this repository to your local machine. Then run `cd` into the cloned repository and run `ansible-playbook local.yml` and ansible will begin the automated configuration process.

In the playbook there are multiple plays in the playbook where each play is associated with a different host. The `localhost` play will always run. If you want to run other plays you'll need to provide an inventory file that maps the FQDN (Fully Qualified Domain Name) of your computer to the desired hosts as specified in the playbook. This can be done by [creating an inventory file](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#hosts-in-multiple-groups) and providing it's location to the relevant ansible command. Specifically when running `ansible-playbook` you can skip the creation of the inventory file and provide a list of host names to apply to the local machine (ex. `ansible-playbook local.yml -i "work,"`).