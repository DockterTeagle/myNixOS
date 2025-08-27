## [unreleased]

### 🚀 Features

- *(dev)* Add more flake-parts modules I will never use
- *(dev)* Purge the unclean
- Got luarc working with this framework and remove symlink

### 🚜 Refactor

- Add nix subdir, also add home-manager expire

### ⚙️ Miscellaneous Tasks

- Updated CHANGELOG
- Apply treefmt
- Stashing lazy.nvim

### ◀️ Revert

- Remove partitions
## [2.7] - 2025-08-22

### 🚀 Features

- Add submap indicator
- Simplify submaps
- Make binds specific
- Made movefocus bindings and also changed to bool
- Added meld
- Make neovim follow every commit
- Update to lix latest
- Fuzzel
- Add yaziPlugins
- Add shuffle to spotify
- Yazi plugins
- Readd scripts
- [**breaking**] Go back to lanzaboote
- [**breaking**] Go to lanzaboote
- Hyprshell
- *(dev)* Add tmuxp.yaml
- [**breaking**] Use limine instead of lanzaboote, also flake updates
- [**breaking**] Add hyprspace and other plugins
- Add biosdevice
- *(hypr)* Various improvements and removals
- *(idk)* Various non-breaking changes
- Nixify hyprshell(?)
- Move nvim config here
- Nvim config
- Hypr
- Use cachyos
- Split up mappings
- Add neogit mappings
- *(discord)* Remove preview as it is annoying
- *(nvim)* Add markdown snippets and move around luasnip loading
- *(nvim)* Start TS
- *(nvim)* With treefmt now in conform removed custom cmd
- Hyprland
- Add jj to flake
- Added convco to jj, and also added pre-push
- Trying to get pre-commit hooks to read the commit
- *(dev)* Added flakePartions, might revert
- *(dev)* Added cliff,and removed unused

### 🐛 Bug Fixes

- This shouldve been in an earlier commit
- *(disko)* Reference correct device
- Update stylix to be correct

### 💼 Other

- Add more yazPlugins

### 🚜 Refactor

- [**breaking**] Remove unused files
- Figured out why things looked like shite
- Make flake smaller
- Nix
- Solaar
- [**breaking**] Remove nixcord
- [**breaking**] Go back to home-manager module
- Make default.nix nothing more than imports
- Switch to nixfmt
- [**breaking**] Move wayland to GUI
- Make the flake refernece my github repo, instead of abs path
- *(dev)* Remove unused pacakges(ltex-ls-plus) and format
- *(dev)* Use flake-parts with system
- Move nvim correctly
- Compress lines
- Move out to mappings
- Reorganize flake and update
- Switched back to lix git, and updated neovim

### ⚙️ Miscellaneous Tasks

- Remove deprecated
- Flake
- Flake
- Update
- Comments
- Update flake and todo
- Troubleshoot
- Flake(not hyprpanel)
- Remove unused and duplicate mappings
- Flake(not hyprpanel)
- Update flake.lock
- Flake.lock
- [**breaking**] Remove unused packages and configs
- Remove unused pakcages
- Remove duplicate packages
- Flake
- Update todo, as well as other shite
- Compress flake
- Update TODO
- Update todos
- Update all bindings
- Remove unused inputs
- Flake.lock: ghostty
- Remove duplicate inputs, also update
- Update secrets
- Update hyprland
- Flake
- Fix hyprlock
- Fix hyprpanel(the file this time)
- Remove unused options
- Remove unused pacakges
- Switch from home-manager to just using a package
- Remove unused abbrs
- Flake.lock
- Remove useless comment
- Remove breaking overlay
- Remove comments
- Remove unused packages
- Remove comment
- Vale.ini
- Change name to not break
- [**breaking**] Remove unused flake inputs
- Remove unused packages
- *(docs)* Update and make TODO more readable
- [**breaking**] Go to latest hyprpanel
- [**breaking**] Remove unused packages
- Remove unused packages
- Remove unused devenv pacakges
- Update hyprland bindings
- [**breaking**] Remove unused packages
- Remove duplicate todo
- Move todo to root
- Update to actual home-manager
- Update keys
- Remove unused and old CHANGELOG.md
- Remove lfs, also renamed flakeModules
- Remove unused packages and convert to modules

### ◀️ Revert

- Remove thefuck, unmaintained
- Now using linux6_15
- Remove jj starship
- Use nixpkgs wayland again, also formatting
## [2.6] - 2025-06-02

### 🚀 Features

- [**breaking**] Remove yq as sops is wacky
- FUCK YOU MARKDOWNLINT
- I am euphoric, had two versions of markdownlint
- [**breaking**] Ditto of last one
- *(docs)* Add note open prs
- Add and use prettier
- Added treefmt
- Added hyprsunset and hyprpolkit
- Fix issue with multiple packages of hyprland
- Merge old wsl
- Begin adding branching to figure if tui only
- Remove isoImage and add more signing
- Removed single line
- Change signing keys, again
- Added gpg home-manager
- Add various gaming packages
- Added gitleaks
- Remove middle
- Switched to all flake parts for devenv
- Start breaking up this massive flake
- Fixed  gpu
- Fix gpu again and updated all non-broken flakes
- Add powertop
- Add doas
- Add specailworkspace in hyprland
- Remove manohud
- Added treefmt to the devenv and pre-commit-hook
- Actually use the nixAccesTokens in the config
- Ditto
- Removed hyprcursor as it is provided by flake
- Move nixAccessTOkens to home
- Add tmuxinator
- Change hyprlock version
- Added activity watch and refactored out services
- Refactor to services
- Fixed the high temps I think(?)
- Move systemFlake to its own file
- Add screenshots dir and get it working, remove useless env vars
- Update flake.lock
- Change hyprland config
- Apply formatting, overlays and also change zen-package
- Remove dbus package as it is already in services
- Change wallpaper
- Switch to lix
- Switch to lix
- Continue work on hyprland, added todo
- Add hyprland env variables for qt
- Updated animations
- Make btop show gpu
- Disable confirmation prompt
- Update home, remove tmuxinator, and other enchancments
- Added neovim config here, though it isn't working rn
- [**breaking**] Remove nvim for now
- Add github cli
- Add shell aliases to nushell
- Make tmux use nushell and added gh.nix
- Add git-sync
- Enable hyprlock integration in stylix
- Add windowrules
- Change back to nix version
- Add nufmt
- Add bootloader timeout
- Add nushell
- Change back to fish
- Add services location
- Remove lix module and add nix-topoology
- No_hardware_cursors no longer needed
- Make .envrc  actually check the correct files
- Add cliphist as a service
- Add sesh
- Get the correct settings set in vesktop
- Fiexd cpu
- Start using chaotic-nix, broken tho
- Use chaotic and cachy_os
- *(package)* Add coolercontrol
- *(hyprpanel)* Reintroudce the wsicons as it is no longer broken
- [**breaking**] Remove ventoy apparently insecure
- Smart borders
- Use default.nix and imports = [];
- Add home-manager flakemodule
- Started using disko again
- Fuck impermance for now
- Fuck impermance for now
- Change sops keys
- Remove unneeded options
- Add element
- Make base16Scheme a variable
- Add nixindex
- Add steam back to autostart and remove pyprland
- Remove nix-index from system packages
- ExtraSpecialArgs now passes pkgs
- Obsidian added
- Update flake and add lix-dev
- Add oxidizers
- Change sorting to natural for yazi
- Jujustu
- This weird
- Stuff
- Ditto
- Ditto
- [**breaking**] Switch to wayprompt
- Test
- [**breaking**] Removed funni,was a tesdt for siginig
- Moved around browsers
- Add jj support

### 🐛 Bug Fixes

- Revert hyprland update
- Fix protonhax
- Remove truffle hog for now
- Update all non-broken flakes
- Change from self to self' also update flake.lock
- Turns out that self doesnt work how I thought
- Remove TMUX_SESSION_NAME
- GPU SHOULD work now
- Use correct path
- Alejandra input is broken
- Revert tlp changes
- No longer use neovim in nix
- Remove gpg nonstandard homedir
- Make stylix work with my firefox
- Nixcord deprecate,using home-manager
- Remove nixpkgs-wayland, caused problems
- Remove unused powertop management
- Typo causing hyprlock to crash
- *(power)* Reduced MIN_POWER_ON_AC
- Use latest insteado f cachyos for now
- Remove unneeded options
- Hypr, make it work
- Go back to nixcord
- Start trying to fix unable to use greetd
- Remove chaotic-mesa dont use it as sync
- Add trusted-substituters to make them actually used
- Remove unused overlay now that nixpkgs unshit itself
- Include secrets
- Update secrets
- Lix now works with nh and removed unused
- JJ funny
- Cachyos broken
- [**breaking**] Remove abbreviations/aliases that would fail
- Remove solaar and also add signing

### 🚜 Refactor

- [**breaking**] Remove black-hole as it is not used
- [**breaking**] Remove gitlint and add cursorSize variable
- Make it more clear what each section is
- Using prettier proper now
- Use treefmt instead of alejandra as fmt
- Remove nix-gaming packages
- Factor out flakeModules
- Move nix accesstokens to home
- Tmux changes
- Remove file-search bin
- [**breaking**] Remove zramSawp file as it is unnecessary
- Zram was too small to justify its own file
- Fix todo and make systemFlake
- Start the hyprland config rewrite
- Continue working on the hyprland rewrite
- Remove std flake
- Binds now has its own dir and removed redundant dir
- Remove unused packages
- Things are now where they should be
- Remove nix overlay and inputs
- No more useless overrides
- Remove duplicate qmk package
- Since home-manager has a sesh module, remove pkg
- Removing tmux options that are now moot with hmmodule
- Remove hyprlock flake, not source of issue(also formatted)
- Attempt to reorganize and bring sanity
- SystemFlake is now in top-level
- Move programs.hyprland to correct location
- Devenv.nix  now uses les redundant packages
- Remove unused and unusable options
- Move configuration.nix to system/default.nix
- Move home to have a default.nix, also update flake
- Override devenv inputs
- Move playerctld to home-manager
- Move git to its own file
- Move carapace to shells
- Remove bin directory
- Remove unused topology module
- Remove unused package
- Remove unused modules
- Add more packages and remove let
- [**breaking**] Replace lsd with eza
- Move nix config to configs dir
- Move from system clipboard to hm
- Make more concise
- [**breaking**] Remove fastfetch
- *(docs)* Update readme
- Moved all to systems/config
- Moving systemsettings to systemSetttings in flake
- Moving service config around
- Move nix.nix into configs
- Move xdotool to home, also remove neovim.nix
- Move persystem/shared up, also flake.lock
- Remove redundant dir

### 📚 Documentation

- Update TODO
- Update TODO
- Start moving finished TODOs out
- Update markdown files
- Update TODO
- *(TODO)* Update todo
- *(TODO)* Remove duplicate TODO
- Update TODO
- *(md)* Update TODO
- Update markdown and TODO
- Update changelog and todo
- *(md)* Update todo and add vale

### ⚙️ Miscellaneous Tasks

- Remove unnecessary settings
- Style
- Update flake inputs
- Updated prettier and flake inputs
- Continue to implement suggestions for nvidia on hyprland
- Update flake.lock
- Really need to make it detect
- Changed signing key
- Continued work on gpg
- Update flake.lock
- Remove unused launcher
- Apply formatting
- Update flake.lock and condense flake
- Modify envrc and also use cachix
- Minimize repeated dependencies
- Update flake inputs
- Update flake.lock
- Update flake.nix and add more inputs
- Update flake.lock
- Update flake.lock
- Remove unused packages
- Update flake inputs
- Removed completed TODOs
- Remove unused and unplaned comments
- Remove less used inputs
- Remove unused caches, and settings
- Update flake.lock
- Update flake.lock
- Update flake inputs and also remove nixgl
- Remove unused tmuxp
- Update flake.lock
- Make todos more explicit
- Update
- Update flake inputs, everything looks fine
- Change zen version
- Remove unused packages
- Remove unneeded options
- Update inputs
- Update inputs
- Trim flake inputs
- Remove unused things
- Update inputs(hyprpanel broken)
- Update flake, and flake.lock
- Fix home-manager
- Fix warnings and removed unused packages
- Update flake inputs
- Remove unused arguments
- Remove unused options
- Update flake inputs, and also fix xbox controller
- Update flake.lock, nixcord broken
- Update docs and remove alejandra
- Remove unused packages
- Switch to dprint
- Update nixpkgs
- Update flake.lock
- Remove unused packages
- Update secrets
- Clean up comments
- Update flake.lock
- Update flake.lock
- Remove unused and faulty options
- Update flake.lock
- Remove comments that are unnecessary
- Update flake.lock
- Update flake.lock
- Comment out unused things
- Update environments
- Hyprland prefix updates
- Fix paths
- Comply with latest home-manager
- Remove unused options and also try and fix status bar
- Comply with latest home-manager
- Update flake.lock
- Troubleshooting
- Update flake.lock
- Remove unused systemFlake
- Use actual descriptive names
- Refactor and also update flake inputs
- Update flake.lock
- Update flake.lock
- Update inputs
- Update flake.lock
- Remove unplanned comments
- Remove unused features from conf.nix
- Stashing
- *(dev)* Use lfs for pngs
- Update flake.lock
- Make statix happy
- Update flake.lock and remove impermanence
- *(flake)* Update inputs and refactor
- Remove unused packages from devenv
- Update flake.lock
- Removed protonhax script, doesnt work anyway
- Update services and remove old,problematic ones
- Remove duplicate packages
- Remove unused comment
- Remove unused comment, not going to do impermance
- Remove unused comments
- Remove unused and duplicate packages
- Remove rarely used argument
- Update flake.lock
- Update flake.lock
- Update flake.lock
- Update flake.lock
- Update flake.lock
- Remove unused
- [**breaking**] Make rofi work
- Remove unused arguemnts and options
- Update home
- *(WHOOPS)* Forgot to add this to earlier
- Update nixcord
- Update non-broken(nixpks) inputs
- Update flake.lock
- Update flake.lock
- Update flake.lock
- *(docs)* Update TODO
- *(docs)* Update TODO
- Update TODO
- Removed libnotify package
- Remove unused packages
- Flake
- Update TODO
## [2.5] - 2025-02-25

### 🚀 Features

- Fix issue #3 as lanzaboote newest version builds
- Remove grub
- Make stylix actually use a package
- Added more pre-commit-hooks
- Add codespell
- Topgrade now updates config
- Add bash-language-server
- Add mango-hud
- Added commitlint
- Get libSQLITE to work
- Remove nur and firefox addons
- Added sqlite
- [**breaking**] Removed nur

### 🐛 Bug Fixes

- Make os switch actually build

### 💼 Other

- Flake.lock

### 🚜 Refactor

- Remove python3

### ⚙️ Miscellaneous Tasks

- Update flake.lock
- Remove unused comment, and also make code hints work better
- Update inputs
- Update flake inputs
- Update flake inputs
- Update flake inputs
- Update flake.lock
- Update flake.lock
- Update flake inputs
- Update flake inputs
- Update flake.lock
- Update flake.lock
- Update inputs
- Update flake inputs
- Update flake.lock
- Update flake inputs
- Update flake inputs
- Update flake.lock
- Update flake.lock
- Update flake inputs
- Updated inputs
- Change names
- Update README
- Update flake.lock
- Update secrets.yaml also removed yaml checkers
- [**breaking**] Removed language tool, was unnecessary
- Removed gnumake and java, better suited for flakes
- Remove unplanned comments
- Update flake inputs
- Update flake inputs
## [2.0] - 2025-01-14

### 🚀 Features

- Added tmux-clinet to gitignroe
- Update zsh and tmux
- Added discord execution and added more flakes
- Categorized yet to be categorized directory
- Updated hyprland to latest non-breaking commit
- Add noto-emoji as the emoji font
- Remove the hardcoded path and instead use the module
- Add ghosty to the default
- Remove unused option
- Remove unused firmware
- Update to ghostty
- Hyprland now uses stylix( I think)
- Add nixcord
- Add nixcord
- Remove reference to discord in system-config
- Topgrade now updates lazy.nvim as well
- Made a default.nix for system
- Add gitlint
- [**breaking**] Prepare for merge with wsl

### 🐛 Bug Fixes

- Remove call to ghostty
- Topgrade now updates neovim and also updates flakes in parallel
- Actually use the yazi overlay and added n3, though might not use it
- Hyprland now has a reasonable mouse cursor refresh rate
- Typo correction

### 💼 Other

- Update
- Update
- Hyprland
- Hyrpland now uses vesktop
- WLR_NO_HARDWARE_CURSORS as it is no longer supported by hyprland

### ⚙️ Miscellaneous Tasks

- Update flake.lock and also removed useless comments
- Removed packages that are now in flakes elsewhere
- Remove unplanned comments
- Update inputs
- Remove unused overlays
- Remove unused overlays
- Remove unused inputs
## [1.0] - 2024-04-23
