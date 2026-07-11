# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Install

Initialize a new machine from GitHub:

```sh
chezmoi init --ssh davidag/dotfiles
chezmoi diff
chezmoi apply
```

When using an existing checkout as the source directory:

```sh
chezmoi --source "$PWD" init
chezmoi diff
```

## Daily use

```sh
chezmoi edit ~/.bashrc       # Edit the source state
chezmoi diff                 # Review pending changes
chezmoi apply                # Update the home directory
chezmoi add ~/.config/foo    # Import a changed or new file
chezmoi cd                   # Open the source repository
chezmoi update               # Pull and apply remote changes
```

Commit and push changes from the source repository with Git as usual.

## Platform behavior

- i3, i3status, Sway, legacy Waybar, X11, and the X11 keyboard-switching
  script are disabled by default. Set `enableLegacyX11 = true` in the local
  chezmoi configuration's `[data]` section to manage them.
- Legacy desktop files and other GNU/Linux-only scripts are always excluded
  on non-Linux systems.
- When the legacy desktop is enabled, host-specific Sway files are selected
  using the hostname.
- Vim reads Omarchy's active color palette when available and falls back to
  Gruvbox elsewhere.
- Machine-local Git identity overrides can be placed in
  `~/.config/git/config.local`; that file is not managed.
- Mutt credentials in `~/.config/mutt/secret` are not managed.

After applying the Vim configuration for the first time, install plugins with
`:PlugInstall`.
