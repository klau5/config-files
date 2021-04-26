
# New system setup
> **install**
  *nitrogen lxappearance i3 rofi redshift-gtk vlc zsh kitty git nodejs neovim yaru-theme*
  - vscodium, brave-browser, github-cli
  - enable firewall : **sudo ufw enable**

### i3status bar
> i3status.conf
- Location: /etc

### i3 config file
> config
- Location: ~/.config/i3/

### rofi config file
> config.rasi
- Location: ~/.config/rofi/

### For Vim
> Single file for vim & neovim (init.vim)
- Install [Lazygit](https://github.com/jesseduffield/lazygit) on system, required for vim plugin to work
- Install gcc-c++ for treesitter parsers

#### Fix for wi-fi issues in Debian/Ubuntu
> [Ubuntu] cd **/etc/NetworkManager/conf.d/default-wifi-powersave-on.conf**
  // set wifi power saving to off (default value is 3)
  ***wifi.powersave = 2***
  [Debian] cd **/etc/network/if-up.d**
  (create new file *powersave_off* & make it executable)
  **sudo chmod +x powersave_off**

#### Fix for i3 not showing Network icon
> install ***network-manager-applet***

