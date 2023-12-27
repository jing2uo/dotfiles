# My dotfiles

> 使用  [chezmoi](https://www.chezmoi.io) 管理

### tools

| 工具                                | 备注                      |
| ----------------------------------- | ------------------------- |
| [alacritty](https://alacritty.org/) | 终端                      |
| [zellij](https://zellij.dev/)       | 分屏，类 tmux             |
| [asdf-vm](https://asdf-vm.com)      | 语言、工具多版本管理      |
| [starship](https://starship.rs/)    | 终端提示                  |
| [ov](https://github.com/noborus/ov) | paper，替代 less more 等  |
| virtualenvwrapper                   | Python venv 管理          |
| rofi                                | 启动器，类 alfred、albert |

### apt-install 

```bash
sudo apt install git curl zsh alacritty virtualenvwrapper rofi
```

### asdf-install

https://asdf-vm.com/guide/getting-started.html

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
source ~/.asdf/asdf.sh

plugins=("chezmoi" "golang" "helm" "java" "kubectl" "nodejs" "rust" "starship")

for plugin in "${plugins[@]}"; do
    asdf plugin-add "$plugin"
    asdf install "$plugin" latest
done
```

### fontconfig

from： https://catcat.cc/tags/fontconfig/


### rofi
from: https://github.com/adi1090x/rofi
