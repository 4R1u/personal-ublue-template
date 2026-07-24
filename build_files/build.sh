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
dnf5 copr enable eddsalkield/swaylock-effects -y
dnf5 install -y niri dms dms-greeter dankcalendar-git cava alacritty ghostty swaylock fuzzel qt6ct matugen khal danksearch
# dms setup
systemctl disable gdm.service
# dms greeter enable
# dms greeter sync
# systemctl enable greetd.service
# systemctl --user enable --now dsearch
# systemctl --user add-wants niri.service dms
# dnf5 copr disable avengemedia/dms
# dnf5 copr disable avengemedia/danklinux
# dnf5 copr disable scottames/ghostty

# headless install command from dms website
# sudo -v
# curl -fsSL https://install.danklinux.com | sh -s -- \
#   -c niri -t ghostty --include-deps dms-greeter --replace-configs-all -y

#### Example for enabling a System Unit File

systemctl enable podman.socket
