# image-template

This is an OS image meant to ship the Niri tiling window manager, the
DankMaterialShell config for it, on top of an immutable Bazzite base with
dev tooling, Secure Boot support, and sb-ready Nvidia
drivers (bazzite-dx-nvidia-gnome).

## Usage

Rebase from a Fedora Atomic Install. Preferably something with GNOME, but it
shouldn't matter too much besides broken themes.

```bash
# bootc switch ghcr.io/4r1u/personal-ublue-template
```

I would have created ISOs, but the Actions workflow is broken for some reason,
and it's too much work fixing it.

> [!NOTE]
> This image doesn't set up the DMS files and keybinds for you. You will have
> to set it all up in the settings window yourself. You will also have to run
> `dms greeter sync`, `sudo systemctl disable gdm`,
> `sudo systemctl enable greetd`, `systemctl --user enable --now dsearch`,
> and `systemctl --user add-wants niri.service dms`.

This image will most likely be a temporary thing until
[Zirconium's](https://github.com/zirconium-dev) Nvidia images support Secure
Boot fully.
