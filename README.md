# Dotfiles Repository

This repository contains my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/), a tool for declaratively managing configuration files across multiple machines. These dotfiles configure various tools and applications for a customized Linux desktop environment, primarily focused on a Wayland-based workflow.

## Structure

The repository includes configuration files and directories for the following tools and applications:

- **alacritty**: Configuration for the Alacritty terminal emulator.
- **autostart**: Scripts and settings for automatically starting applications on login.
- **Code**: Settings and extensions for Visual Studio Code or compatible editors.
- **code-flags.conf**: Custom flags for Visual Studio Code, such as startup options or environment settings.
- **direnv**: Configuration for direnv, an environment variable manager for project-specific settings.
- **fastfetch**: Customizations for fastfetch, a system information tool.
- **fontconfig**: Font configuration files for consistent font rendering across applications.
- **fuzzel**: Settings for Fuzzel, a Wayland-native application launcher.
- **hypr**: Configuration for Hyprland, a dynamic tiling Wayland compositor.
- **pip**: Configuration for Python's package manager, including custom package settings.
- **starship.toml**: Configuration for the Starship prompt, a customizable cross-shell prompt.
- **swaync**: Settings for Sway Notification Center, a notification daemon for Wayland.
- **waybar**: Configuration for Waybar, a highly customizable status bar for Wayland.
- **wlogout**: Settings for wlogout, a logout menu for Wayland environments.
- **zellij**: Configuration for Zellij, a terminal workspace and multiplexer.

## Management with chezmoi

This repository uses chezmoi to manage and deploy dotfiles. Chezmoi allows for easy synchronization, templating, and application of configurations across different systems while keeping sensitive data secure.

### Setup Instructions

1. **Install chezmoi**:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. **Clone and apply the dotfiles**:
   ```bash
   chezmoi init --apply https://github.com/<your-username>/<your-repo>.git
   ```

3. **Update dotfiles**:
   To pull and apply the latest changes:
   ```bash
   chezmoi update
   ```

4. **Manage dotfiles**:
   To add or modify files:
   ```bash
   chezmoi add ~/.config/<file-or-directory>
   chezmoi cd
   # Edit files, commit, and push
   chezmoi apply
   ```

## Notes

- The configurations are tailored for a Wayland-based Linux environment with Hyprland as the primary compositor.
- Some directories (e.g., `hypr`, `waybar`, `swaync`) are specific to Wayland workflows.
- The `starship.toml` file customizes the shell prompt for a consistent experience across terminals.
- Ensure dependencies for each tool (e.g., Alacritty, Hyprland, Waybar) are installed before applying configurations.

## License

This repository is licensed under the MIT License. Feel free to adapt these configurations for your own use.