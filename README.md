# New system setup

-   install feh for desktop wallpaper
-   install lxappearance to change themes and icons
-   install rofi
-   install redshift-gtk
-   install vscodium

-   i3status bar

    -   i3status.conf
    -   Location: /etc/

-   i3 config file

    -   config
    -   Location: ~/.config/i3/

-   rofi config file
    -   Location: ~/.config/rofi/config.rasi

For Vim

-   Single file for vim & neovim (init.vim)
-   Install Lazygit on system, required for vim plugin to work
    (https://github.com/jesseduffield/lazygit)

Fix for wi-fi issues in Debian/Ubuntu

-   cd /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
-   // set wifi power saving to off (default value is 3)
-   wifi.powersave = 2
