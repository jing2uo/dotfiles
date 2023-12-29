# dotfiles

> 使用 [chezmoi](https://www.chezmoi.io) 管理

## 常用工具

| 工具                                | 备注                      |
| ----------------------------------- | ------------------------- |
| [asdf-vm](https://asdf-vm.com)      | 语言、工具多版本管理      |
| [alacritty](https://alacritty.org/) | 终端                      |
| [zellij](https://zellij.dev/)       | 分屏，类 tmux             |
| [starship](https://starship.rs/)    | 终端提示                  |
| [ov](https://github.com/noborus/ov) | paper，替代 less more 等  |
| batcat                              | 彩色的，更多功能的 cat    |
| direnv                              | 进入目录自动激活变量      |
| fzf                                 | 模糊搜索                  |
| virtualenvwrapper                   | Python venv 管理          |
| rofi                                | 启动器，类 alfred、albert |

## 初始化新环境

### apt-install

```shell
# cmd apps
sudo apt install git curl zsh virtualenvwrapper direnv bat fzf -y
# gui apps
sudo apt install alacritty rofi -y
```

### asdf-install

https://asdf-vm.com/guide/getting-started.html

```shell
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
source ~/.asdf/asdf.sh

#/bin/bash
common="chezmoi starship"
language="golang nodejs rust"
tools="helm kubectl zellij"

asdf_install() {
  plugins=()
  for var in "$@"; do
    eval "plugins+=(\$${var})"
  done

  for plugin in "${plugins[@]}"; do
    IFS=' ' read -ra values <<< "$plugin"
    for value in "${values[@]}"; do
      echo "\nasdf install $plugin"
      asdf plugin-add "$plugin"
      asdf install "$plugin" latest
    done
  done
}

asdf_install common tools language
```

### chezmoi 

```shell
 chezmoi init --apply jing2uo
 chezmoi update -v
 
 exec zsh 
```

## 参考项目

### fontconfig

from： https://catcat.cc/tags/fontconfig/

### rofi

from: https://github.com/adi1090x/rofi
