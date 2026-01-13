{ inputs, pkgs, ... }:
{
  # ctrl  + alt   + arrow_down            goto_split:down
  # ctrl  + alt   + arrow_left            goto_split:left
  # ctrl  + alt   + arrow_right           goto_split:right
  # ctrl  + alt   + arrow_up              goto_split:up
  # ctrl  + shift + ,                     reload_config
  # ctrl  + shift + enter                 toggle_split_zoom
  # ctrl  + shift + tab                   previous_tab
  # ctrl  + shift + page_down             jump_to_prompt:1
  # ctrl  + shift + page_up               jump_to_prompt:-1
  # ctrl  + shift + arrow_left            previous_tab
  # ctrl  + shift + arrow_right           next_tab
  # ctrl  + shift + a                     select_all
  # ctrl  + shift + c                     copy_to_clipboard:mixed
  # ctrl  + shift + e                     new_split:down
  # ctrl  + shift + f                     start_search
  # ctrl  + shift + i                     inspector:toggle
  # ctrl  + shift + j                     write_screen_file:paste,plain
  # ctrl  + shift + n                     new_window
  # ctrl  + shift + o                     new_split:right
  # ctrl  + shift + p                     toggle_command_palette
  # ctrl  + shift + q                     quit
  # alt   + digit_2                       goto_tab:2
  # alt   + digit_3                       goto_tab:3
  # alt   + digit_4                       goto_tab:4
  # alt   + digit_5                       goto_tab:5
  # alt   + digit_6                       goto_tab:6
  # alt   + digit_7                       goto_tab:7
  # alt   + digit_8                       goto_tab:8
  # alt   + 1                             goto_tab:1
  # alt   + 2                             goto_tab:2
  # alt   + 3                             goto_tab:3
  # alt   + 4                             goto_tab:4
  # alt   + 5                             goto_tab:5
  # alt   + 6                             goto_tab:6
  # alt   + 7                             goto_tab:7
  # alt   + 8                             goto_tab:8
  # alt   + 9                             last_tab
  # alt   + f4                            close_window
  # ctrl  + +                             increase_font_size:1
  # ctrl  + ,                             open_config
  # ctrl  + -                             decrease_font_size:1
  # ctrl  + 0                             reset_font_size
  # ctrl  + enter                         toggle_fullscreen
  # ctrl  + =                             increase_font_size:1
  # ctrl  + tab                           next_tab
  # ctrl  + insert                        copy_to_clipboard:mixed
  # ctrl  + page_down                     next_tab
  # ctrl  + page_up                       previous_tab
  # shift + end                           scroll_to_bottom
  # shift + home                          scroll_to_top
  # shift + insert                        paste_from_selection
  # shift + page_down                     scroll_page_down
  # shift + page_up                       scroll_page_up
  # shift + arrow_down                    adjust_selection:down
  # shift + arrow_left                    adjust_selection:left
  # shift + arrow_right                   adjust_selection:right
  # shift + arrow_up                      adjust_selection:up

  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
    installBatSyntax = true;
    installVimSyntax = true;
    clearDefaultKeybinds = true;
    settings = {
      gtk-titlebar = false;
      window-decoration = false;
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      keybind = [
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+p=toggle_command_palette"
      ];
    };
  };
}
