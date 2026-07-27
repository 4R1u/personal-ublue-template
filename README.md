# image-template

This is an OS image meant to ship the Niri tiling window manager, the
DankMaterialShell config for it, on top of an immutable Bazzite base with
dev tooling, Secure Boot support, and sb-ready Nvidia
drivers (bazzite-dx-nvidia-gnome).

> [!NOTE]
> This image doesn't set up the DMS files and keybinds for you. You will have
> to set it all up in the settings window yourself. You will also have to run
> `dms greeter sync`.

This image will most likely be a temporary thing until
[Zirconium's](https://github.com/zirconium-dev) Nvidia images support Secure
Boot fully.
