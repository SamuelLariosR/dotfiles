# dotfiles

My personal setup for **MX Linux** with the **i3** window manager and a **Polybar** status bar. I'm a software engineering student, and I keep this repo to document how my environment evolves as I learn.

![Desktop screenshot](screenshots/desktop.png)

## What's inside

- `i3/config` – i3 window manager configuration (gaps, borders, workspaces, keybindings, autostart).
- `polybar/config.ini` – Polybar bar layout and colors.
- `polybar/modules.ini` – Polybar modules (workspaces, window title, memory, brightness, battery, date, tray).

## Dependencies

Tested on MX Linux (Debian-based). You'll need:

`i3`, `polybar`, `feh`, `flameshot`, `brightnessctl`, `network-manager-gnome` (nm-applet), `dex`, `xss-lock`, `i3lock`, `dmenu`, `gnome-keyring`

Fonts: **JetBrainsMono Nerd Font** and **Material Icons**.

## Installation

Back up your current config first, then copy the files:

```bash
git clone https://github.com/SamuelLariosR/dotfiles.git
cd dotfiles

mkdir -p ~/.config/i3 ~/.config/polybar
cp i3/config ~/.config/i3/config
cp polybar/*.ini ~/.config/polybar/
```

Reload i3 with `Super + Shift + C`.

## Notes

- The mod key is `Super` (`Mod4`).
- The wallpaper path in the i3 config (`~/Imágenes/WALPA.jpeg`) is mine; point it to your own image.
- This is a work in progress: I'll keep tweaking it as I learn.
