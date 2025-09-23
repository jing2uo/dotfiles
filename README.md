# Dotfiles Repository

This repository contains my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/), a tool for declaratively managing configuration files across multiple machines. These dotfiles configure various tools and applications for a customized Linux desktop environment, primarily focused on a Wayland-based workflow.

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
