#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 copr enable avengemedia/dms -y
dnf5 copr enable avengemedia/danklinux -y
dnf5 copr enable scottames/ghostty -y

useradd -m -G wheel r41u 

dnf5 install -y niri dms dms-greeter dankcalendar-git cava alacritty ghostty swaylock fuzzel qt6ct matugen khal danksearch

runuser -u r41u dms setup alttaab
runuser -u r41u dms setup binds
runuser -u r41u dms setup colors
runuser -u r41u dms setup cursor
runuser -u r41u dms setup layout
runuser -u r41u dms setup outputs
runuser -u r41u dms setup windowrules
# systemctl disable gdm.service
# systemctl enable greetd.service
runuser -u r41u dms greeter enable
runuser -u r41u dms greeter sync
# systemctl enable greetd.service
runuser -u r41u systemctl --user enable --now dsearch
runuser -u r41u systemctl --user add-wants niri.service dms
# dnf5 copr disable avengemedia/dms
# dnf5 copr disable avengemedia/danklinux
# dnf5 copr disable scottames/ghostty

# headless install command from dms website
# sudo -u \#1000 -v
# sudo -u \#1000 curl -fsSL https://install.danklinux.com | sh -s -- \
#   -c niri -t ghostty --include-deps dms-greeter --replace-configs-all -y

#### Example for enabling a System Unit File

systemctl enable podman.socket
