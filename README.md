# My dotfiles

> 使用  [chezmoi](https://www.chezmoi.io) 管理

### tools

| 工具              | 备注                      |
| ----------------- | ------------------------- |
| alacritty         | 终端                      |
| zellij            | 分屏，类 tmux             |
| asdf-vm           | 语言、工具多版本管理      |
| starship          | 终端提示                  |
| virtualenvwrapper | Python venv 管理          |
| rofi              | 启动器，类 alfred、albert |

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
