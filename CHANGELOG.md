## [unreleased]

### 🚀 Features

- *(dev)* Add more flake-parts modules I will never use
- *(dev)* Purge the unclean

### 🐛 Bug Fixes

- Readd things I forgot in last change

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
- \[**breaking**\] Go back to lanzaboote
- \[**breaking**\] Go to lanzaboote
- Hyprshell
- *(dev)* Add tmuxp.yaml
- \[**breaking**\] Use limine instead of lanzaboote, also flake updates
- \[**breaking**\] Add hyprspace and other plugins
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

- \[**breaking**\] Remove unused files
- Figured out why things looked like shite
- Make flake smaller
- Nix
- Solaar
- \[**breaking**\] Remove nixcord
- \[**breaking**\] Go back to home-manager module
- Make default.nix nothing more than imports
- Switch to nixfmt
- \[**breaking**\] Move wayland to GUI
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
- \[**breaking**\] Remove unused packages and configs
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
- \[**breaking**\] Remove unused flake inputs
- Remove unused packages
- *(docs)* Update and make TODO more readable
- \[**breaking**\] Go to latest hyprpanel
- \[**breaking**\] Remove unused packages
- Remove unused packages
- Remove unused devenv pacakges
- Update hyprland bindings
- \[**breaking**\] Remove unused packages
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

- \[**breaking**\] Remove yq as sops is wacky
- FUCK YOU MARKDOWNLINT
- I am euphoric, had two versions of markdownlint
- \[**breaking**\] Ditto of last one
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
- Fixed gpu
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
- \[**breaking**\] Remove nvim for now
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
- Make .envrc actually check the correct files
- Add cliphist as a service
- Add sesh
- Get the correct settings set in vesktop
- Fiexd cpu
- Start using chaotic-nix, broken tho
- Use chaotic and cachy_os
- *(package)* Add coolercontrol
- *(hyprpanel)* Reintroudce the wsicons as it is no longer broken
- \[**breaking**\] Remove ventoy apparently insecure
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
- \[**breaking**\] Switch to wayprompt
- Test
- \[**breaking**\] Removed funni,was a tesdt for siginig
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
- \[**breaking**\] Remove abbreviations/aliases that would fail
- Remove solaar and also add signing

### 🚜 Refactor

- \[**breaking**\] Remove black-hole as it is not used
- \[**breaking**\] Remove gitlint and add cursorSize variable
- Make it more clear what each section is
- Using prettier proper now
- Use treefmt instead of alejandra as fmt
- Remove nix-gaming packages
- Factor out flakeModules
- Move nix accesstokens to home
- Tmux changes
- Remove file-search bin
- \[**breaking**\] Remove zramSawp file as it is unnecessary
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
- Devenv.nix now uses les redundant packages
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
- \[**breaking**\] Replace lsd with eza
- Move nix config to configs dir
- Move from system clipboard to hm
- Make more concise
- \[**breaking**\] Remove fastfetch
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
- \[**breaking**\] Make rofi work
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
- \[**breaking**\] Removed nur

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
- \[**breaking**\] Removed language tool, was unnecessary
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
- \[**breaking**\] Prepare for merge with wsl

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
# Changelog

All notable changes to this project will be documented in this file.

## Unreleased

[166fc72](166fc72794ba5c1940c635ecabf99c42e78fe824)...[73273f6](73273f6f22d9825b6b7e03dfda8c3179933a5fed)

### Bug Fixes

- Readd things I forgot in last change ([f4bd70b](f4bd70b01109adea418147efff0dec07497f9297))
- Remove symlinks ([e9f0743](e9f07431dc4adf18d82cc32559fe8e50ceacbb8c))

### Features

- Add more flake-parts modules I will never use ([33ef059](33ef059e6dbc95081669a3889e7a9e7b641c57d6))
- Purge the unclean ([9738c54](9738c54fbf54943adfce8dd92bff39836ececa2d))
- Update and make devshells work, home COnfigs are still a wip ([36bbce7](36bbce7084961631d5d85664d0ca5c75fc703a12))
- Got luarc working with this framework ([ae8ff6f](ae8ff6fd38c58b3ad8960e31eba62eef45d0ee09))

### Miscellaneous Tasks

- Updated CHANGELOG ([df1854e](df1854ec9a209ca97b5e94454da9884ed254eb25))
- Apply treefmt ([a2675b8](a2675b8474c277a54b739a5ddd5fca17db152c78))
- Stashing lazy.nvim ([ed0b282](ed0b282e935737970401dac77383fbaf565aff05))

### Refactor

- Add nix subdir, also add home-manager expire ([80dd38b](80dd38bfb028d7e0c614ad2c1276138df19c95e5))

### Revert

- Remove partitions ([3d38101](3d38101c96bb41f4fdbed5cfe066fcf9f4a111d2))

## 2.7 - 2025-08-22

[8afab68](8afab68756b8f4d15bbebf62a11a6a2b7bc7ca8d)...[166fc72](166fc72794ba5c1940c635ecabf99c42e78fe824)

### Bug Fixes

- This shouldve been in an earlier commit ([c635013](c635013abb7cba318d02504e36f45e4130cffd01))
- Reference correct device ([37d4741](37d4741ce9819034ae8cc983a07e30c75e505a44))
- Update stylix to be correct ([3053c1a](3053c1a7db4049e87483c4e6fd072a5efe4e1268))

### Features

- Add submap indicator ([70f8c1b](70f8c1be3870ddee5d879b9b33cb7d355a3fd380))
- Simplify submaps ([f31e009](f31e009c8b148a5bbeedb53e43c502f30eea4afb))
- Make binds specific ([ffa7e83](ffa7e838b11d91c30667bc60aaf0faa3e9e079ae))
- Made movefocus bindings and also changed to bool ([4f6522a](4f6522a9f5b3290f41379d63f0b652cf4d963370))
- Added meld ([443174c](443174c18cd3b741adbbac16211006a6b0636d59))
- Make neovim follow every commit ([2e18945](2e189456211747746c940743964429a4d0440f47))
- Update to lix latest ([2227024](2227024ac7e3e00e9037f2eb8ca7315dbdecb121))
- Fuzzel ([cc4778a](cc4778a04454a4b93f11568f3461d2dbc1da3659))
- Add yaziPlugins ([41db8bd](41db8bdeba18519a72d2fdf80b4b8b47d5831f83))
- Add shuffle to spotify ([00732ec](00732ec1e2d7fa5445cacf7cf19166c98bb2d84a))
- Yazi plugins ([59e6d82](59e6d82b637430bd3374e75200a4e47b5aa971f3))
- Readd scripts ([76f9051](76f9051b86ed2ccdd6dd5c60cfe2d54ba55b6086))
- Go back to lanzaboote ([511a2fc](511a2fc56bb77932e826a56583d2e8d551a8198d))
- Go to lanzaboote ([2313017](23130179ddb127f7b2cadfd187f8512d03962f9b))
- Hyprshell ([6b27b96](6b27b9634c1636475cf04b31cf3597d559d49e44))
- Add tmuxp.yaml ([8080a14](8080a143d384a1e4b8d2b05eb117a903ac5ef463))
- Use limine instead of lanzaboote, also flake updates ([281e1ce](281e1ce779875bf876a72e6949333842c291926f))
- Add hyprspace and other plugins ([44538ba](44538ba6f8479eaab79d439efc8d7910ca078218))
- Add biosdevice ([7f90071](7f90071dde11d0accbd93701dce83af1fbe8694d))
- Various improvements and removals ([75ac569](75ac5697b0ef4162d5fc211a3b6af90c02bdb884))
- Various non-breaking changes ([b9884d3](b9884d3a9148d35b3ca78c81a24fa99d9efde709))
- Nixify hyprshell(?) ([086c939](086c9390b22df19fcc5204aa9610a59070bed2ad))
- Move nvim config here ([72768e6](72768e6984f4bcf3022f6db7f2fa049c3f200645))
- Nvim config ([e811e1a](e811e1a3a9b925b284357846e0f741ef1d26fde1))
- Hypr ([5a932ee](5a932eece94d3a758d5e7b40f43fb24333427cf9))
- Use cachyos ([0ba54d0](0ba54d011078d6980b7efafe86b996e8007233da))
- Split up mappings ([d322cf2](d322cf236c015966207850abe7f98627853c9625))
- Add neogit mappings ([15ab559](15ab559b48a2869428edf3b419de3d9564296675))
- Remove preview as it is annoying ([3e34d2c](3e34d2c2195dcf7ed3075070208f2b92e319f034))
- Add markdown snippets and move around luasnip loading ([608558e](608558ecf6eb2728bcbf70eadef49fd4f09ba63f))
- Start TS ([401fc44](401fc447c7e8882a928356205bbdcbadcba52776))
- With treefmt now in conform removed custom cmd ([abe9b88](abe9b887898b95eeef23e86a304427b2defd282c))
- Hyprland ([6feaf41](6feaf41ed7d70ac3876517066b50f250fb3cf8b1))
- Add jj to flake ([d4f987f](d4f987f7e7890857119239f07decea5a6841d875))
- Added convco to jj, and also added pre-push ([12a9435](12a94352069648acc2137022462e265da1ec9268))
- Trying to get pre-commit hooks to read the commit ([265fe45](265fe45b35d769d0c88547ee6a9808add71bcf5f))
- Added flakePartions, might revert ([f4247c4](f4247c4287403f4b953826c21ac3c86662091ba7))
- Added cliff,and removed unused ([166fc72](166fc72794ba5c1940c635ecabf99c42e78fe824))

### Miscellaneous Tasks

- Remove deprecated ([209bff2](209bff2a45ba23639d037dee35989d5a5c7712e4))
- Flake ([dc2e2a3](dc2e2a3ab0f5dc3bfcd5021ecdd0bb969cd77d00))
- Flake ([b9bb485](b9bb485c03ed6523ded003fd6bc7d05f81d7ca00))
- Update ([036ec5c](036ec5c2c7a60d1dc8eeb30d713cc3385d8d4539))
- Comments ([ce056f8](ce056f8976b36d03ad3c8b1cf4e997253015b1f3))
- Update flake and todo ([5b620ad](5b620ad70a4b6c7fb45a449fbbfbeefec82f61be))
- Troubleshoot ([666805c](666805cb4ee381a56407f020cc1434adbd67cfc5))
- Flake(not hyprpanel) ([c714497](c7144975d5247f0abf0b464f6059d13b399167d7))
- Remove unused and duplicate mappings ([b9f4432](b9f44324d8a3eca49bfc1ca24e6d88e5af02f1f7))
- Flake(not hyprpanel) ([abc6b72](abc6b72a3e347239d070c8c4dbba873cfc98d726))
- Update flake.lock ([ad85fde](ad85fde4a1c32b7bd0c2b1f4ec13ec75f300a243))
- Flake.lock ([9f7ba0e](9f7ba0e03ee0e4e0f3050187800223c550663d53))
- Remove unused packages and configs ([4444da8](4444da8cb62f77c19d233d94a8350afa48902622))
- Remove unused pakcages ([f2604c6](f2604c6c62a40aed0e9f740f6b20ff11655c0e28))
- Chore: update flake.lock: ([be54541](be545410055558e0526cae68d6b0f1a1428ee9b1))
- Remove duplicate packages ([7d1ca98](7d1ca98882d392ae0fd1ff07048d76f9fe4d48a1))
- Flake ([87bf2bc](87bf2bc66176cda20f25541d0c9b46312c6a2c9b))
- Chore: flake: ([ec054e1](ec054e15894ba75adbd74bc4610f4048a9e6d902))
- Update todo, as well as other shite ([0532399](05323994f1d4a35a2790cdaa37d70ab5bb0d9b42))
- Compress flake ([c70472a](c70472a6ee72d727e9d4447314c7355eca7e9480))
- Chore: remove unused packages: ([d44381f](d44381f154487d7c9f37a13b1b7e2ee60c9d2d7e))
- Chore: flake.lock: ([70cfb1c](70cfb1c7d43eefa23dec448a13b475c611c82b01))
- Update TODO ([de2e6ed](de2e6ed5a3b9af1584e27598fdf2cb1da0c2cec0))
- Update todos ([e994cba](e994cbaa896734b5134147094327495c389d383c))
- Update all bindings ([724813b](724813be4cc3f2a8439b17c44e21b1389ba8615d))
- Chore: flake.lock: ([e18784d](e18784d5ef2da18395a3f942db855a7dc9c6957f))
- Remove unused inputs ([a4de3d6](a4de3d60a89a8b5667928552a8c5023dee8bb290))
- Flake.lock: ghostty ([6525232](6525232014e9f4be186b0d590ee6afe16dbcd8b0))
- Chore: flake.lock: ([5d2374b](5d2374b4a2a1063f0394221c6b93441ea9838141))
- Remove duplicate inputs, also update ([d3f9446](d3f9446d1ebc74e7f9feb9b33eccd9b2480abe74))
- Update secrets ([d3b933b](d3b933b5324218e8621219d53d1f1c4ae60205ff))
- Update hyprland ([81b0c20](81b0c20af4f96d3f171d587601c99ab3dbc3448e))
- Chore: flake: ([add1b20](add1b2027ab2f7e4cf4265794333b240fdf20ae0))
- Chore: flake: ([89e9352](89e935209ba177b82799569a52930f2e3b1f5157))
- Chore: flake: ([6ab3e13](6ab3e13d972c8dc77709d73c53e475ee0a812298))
- Chore: flake.lock: ([48349ae](48349aef8b5c16f799bcdb0f214caca1e0408767))
- Chore: flake.lock: ([ca529ca](ca529cafebdc582fc4c51d2cda5caa2b78ea5384))
- Chore: flake.lock: ([9d852e1](9d852e118dc91875d5bf43d96119bcd47b7c009d))
- Flake ([2d289c1](2d289c160785ea266eb85703c74727bdd7fdb869))
- Chore: flake: ([5958c1b](5958c1b154e355af1261c279c5e27a648e48597b))
- Chore: flake.lock: ([5c84835](5c848354d8aebded0ebfb273cd95d7f323047066))
- Chore: flake.lock: ([4936373](4936373a34206923a11a7ca60260bfbdd26b449e))
- Chore: flake.lock: ([8f62940](8f62940abd65c2143809876b2c09a6839095e5cb))
- Chore: flake.lock: ([f5fff40](f5fff405573781ff783dd9b10e95cb3f32cfc5e6))
- Fix hyprlock ([100f285](100f2855c7a95aa06aceec258270ea6388c9ce2f))
- Fix hyprpanel(the file this time) ([fc6ef23](fc6ef235fd1de025a3984e4f2f8f60efe0b79b68))
- Remove unused options ([8a2f89d](8a2f89d03ef2b4503400410615d12973160540e6))
- Remove unused pacakges ([4453c0a](4453c0a17a5aeff8b43edd40c1bad08a0f68545d))
- Switch from home-manager to just using a package ([937063e](937063e530904210ffff3c6e5a28e9659a8f9b02))
- Remove unused abbrs ([5e13e22](5e13e22a28f9d74f1cf6fb511f187a900c8558f9))
- Chore: flake.lock: ([0076fb8](0076fb8639711d1137a81f75f44c4aad0f780cbb))
- Chore: flake.lock: ([1496493](1496493f7402e8015118c94035f5a512eaf4fe23))
- Chore: flake.lock: ([4c1f9a0](4c1f9a0e47f106f4a65bf66a7c2de371200fcfff))
- Flake.lock ([70ad362](70ad36201295aa3a187b6b56ff53a6ceead911d8))
- Remove useless comment ([24d1721](24d1721b4e41c81943378ae578f5ecbe6c649c2f))
- Remove breaking overlay ([311eb1f](311eb1f4039c219a677a3d6ad5f7d85bf51aa4a1))
- Remove comments ([a7ed0fa](a7ed0fafe6cb4f714f2176e0afb23a8734509268))
- Remove unused packages ([e3b3a47](e3b3a477505a36d79b40bdbce2138ac2e77a29fa))
- Remove comment ([98c9108](98c91085262251bab608024664ab5c35913c46bb))
- Vale.ini ([3df310b](3df310b4816a896ce16e26b45b438d74aae92399))
- Chore: flake.lock: ([05f2fe1](05f2fe188d89b3dd2ff3984ee963cc93a4fbc73c))
- Change name to not break ([33b86d4](33b86d4b31d1c297e2ecff333d244c01ecf31dee))
- Chore: flake.lock: ([fbcc657](fbcc6573462d8dabf9dedeca1868495fd1e1b485))
- Remove unused flake inputs ([81b0348](81b03488acd0e5b03c32926388f5113d4c60b66c))
- Remove unused packages ([7604548](7604548a4f49144814730a067f882880f1e47599))
- Update and make TODO more readable ([ba2d890](ba2d89080225bc6f70d7609cb76a16d808789db4))
- Go to latest hyprpanel ([9580eb2](9580eb276475733eabcdcb6c3f6729e1d503e28b))
- Remove unused packages ([c192071](c1920715fa7fdedf08e130e66de4ff4a12582d44))
- Remove unused packages ([419634f](419634f85732c921d7b816ea7893969cd5199fa5))
- Remove unused devenv pacakges ([f9b5683](f9b5683c3905efc96c791cd181f52509d475adbf))
- Update hyprland bindings ([88453c1](88453c1459cff8dd994afd9310e863f0fd17408c))
- Remove unused packages ([cfe83e4](cfe83e47028294d8337e746db8666f7c9daf51fc))
- Chore: flake.lock: ([130f290](130f2905a767b9435a0004e2b781a92136ce5245))
- Chore: flake.lock: ([5fbd218](5fbd2182e89078fbf24944036adc08f71b0108bf))
- Chore: flake.lock(also forgot to add chaotic but shhhhh): ([676f566](676f56615502a9f6582d02ec290b556cbc478d95))
- Chore: flake.lock: ([25a43bf](25a43bf288d3d02d386489b7b9f57378edf340b9))
- Chore: flake.lock: ([b7029e2](b7029e2923b41fc4e3b183d3b3a8f3566f559c80))
- Chore: clean: ([1bab741](1bab7414506336b8a4d440080b5a9abf3729cb0d))
- Remove duplicate todo ([536c261](536c26136903efc00024e10e6d14424c97909d8a))
- Move todo to root ([0f378b2](0f378b26e9483660e6320662d319c80450e9d07f))
- Update to actual home-manager ([53ebfee](53ebfeec9740796705bd246e166d7318898467ba))
- Update keys ([6ed8fb3](6ed8fb305f78186abb809c9456ded34e25e63685))
- Remove unused and old CHANGELOG.md ([e6a1532](e6a1532fc4d22f114f0954920dd8690bcc0e718e))
- Remove lfs, also renamed flakeModules ([9e6bc8c](9e6bc8c1043c0d468cc75d3d8825a34f0a87c008))
- Remove unused packages and convert to modules ([b28cd77](b28cd779ff029c539c982b04a50f2a59ce4f7d88))

### Refactor

- Remove unused files ([b53cdf5](b53cdf5b0d858b08823be50b6fb8341d4aae8d61))
- Figured out why things looked like shite ([17f441f](17f441f8e4f28ef9af97c91a058251721c9d7927))
- Make flake smaller ([0aa178a](0aa178a944527628495b3e8c1bdbb89f4a7d9ec2))
- Nix ([402f176](402f1769f7d3f274b68278a4c2508974d85093b8))
- Solaar ([c65bb68](c65bb6835ba1d3105ba27d2928515ef82201da5a))
- Remove nixcord ([e88ebde](e88ebde814692e7d50e4efae294948eaa5e5832d))
- Go back to home-manager module ([6923894](69238942be64ba547e5242f6030697bf55724363))
- Make default.nix nothing more than imports ([4c010c5](4c010c59af7262575ccf2f9c1ab4f2d54d0b0930))
- Switch to nixfmt ([4370e23](4370e2331eb7cb6b5a8eb7f8869b07bced21732d))
- Move wayland to GUI ([03a4358](03a4358a4b822be025bd44274ebec105a8a77d8e))
- Make the flake refernece my github repo, instead of abs path ([091cac0](091cac0c35fff00d74846a9f7d43f6fbd25767f1))
- Remove unused pacakges(ltex-ls-plus) and format ([91b904b](91b904b62521a50e52c64be7486a91d39102117a))
- Use flake-parts with system ([fb57714](fb5771413c572cfa3e102fd1cfbf44cd559a17b5))
- Move nvim correctly ([db2be5a](db2be5a724dbcf466e612d22f789448102f883de))
- Compress lines ([f0f0c34](f0f0c349f7bc050b265fe06a152408f0a3e3025e))
- Move out to mappings ([f491fd8](f491fd840ed8cabe37131f1346dd52483dd5cf80))
- Reorganize flake and update ([865d247](865d247d457e67299001f08396caa62c7464f517))
- Switched back to lix git, and updated neovim ([77c4723](77c47231b5e40e455022bfaf02657fba3664c81b))

### Feawt

- Add more yazPlugins ([4c712ba](4c712ba1ed934b7d3609bd328cdc2a1e98a86b57))

### Revert

- Remove thefuck, unmaintained ([cc4d75c](cc4d75ca1c5285fd8beb21883f9b1e94725275da))
- Now using linux6_15 ([0e5c0c3](0e5c0c3574723450962c227d990bddf3a9e0c63a))
- Remove jj starship ([bb6a1c9](bb6a1c9855b0307a8a17bb26c75a6772f5092d70))

### Revert|feat

- Use nixpkgs wayland again, also formatting ([6f49a71](6f49a716e6fe5bc9b64c835053ace68b61a236b0))

## 2.6 - 2025-06-02

[121a648](121a6487032fdd3f1a75fe9416b551a651272af3)...[8afab68](8afab68756b8f4d15bbebf62a11a6a2b7bc7ca8d)

### Bug Fixes

- Revert hyprland update ([42c064c](42c064c91a8624177928d9d1d2e4c32e223d5ea9))
- Fix protonhax ([966748d](966748df09828944f27b36d2d804acf660c33098))
- Remove truffle hog for now ([82d3689](82d3689bbc89ec469b114222f5d44c6706f82009))
- Update all non-broken flakes ([aec3c0f](aec3c0f90f72f57291511009b1f56957fa2fbee7))
- Change from self to self' also update flake.lock ([6b34d99](6b34d9949f93cf73168ed9619ce15c75f07279b6))
- Turns out that self doesnt work how I thought ([0fb441c](0fb441cabf7a89b39a72a4cee0979b42c44c9870))
- Remove TMUX_SESSION_NAME ([f03805b](f03805ba1526778fd6b0cf49f1a81e99f584cfa3))
- GPU SHOULD work now ([7b43ac8](7b43ac81c41dc944d37fadaacc83f7b0ad45647e))
- Use correct path ([183c09a](183c09a8135df4a50c7fce30429cd236006cb139))
- Alejandra input is broken ([792372a](792372a4047bc37be21b827a5101af922f12edfb))
- Revert tlp changes ([d670900](d670900cdc7faaefdf31fbb2bf8be588c3a629d1))
- No longer use neovim in nix ([e25502e](e25502e3a78bdbf266d71f8ccd752e77267f1bb3))
- Remove gpg nonstandard homedir ([c025bd2](c025bd2adfacd88cc03ad081303dfa9496d17426))
- Make stylix work with my firefox ([7516f5d](7516f5d24cfef67ca0e5517c8286d6fb52eac825))
- Nixcord deprecate,using home-manager ([bfdfc6b](bfdfc6b05781d556814165713020cf2efbe2b246))
- Remove nixpkgs-wayland, caused problems ([b8ba180](b8ba1806742ccd08cb4329a157aaf5b80e04aa4e))
- Remove unused powertop management ([2b578ec](2b578ec8c5dc6daf3933f791675002eeebb5b242))
- Typo causing hyprlock to crash ([ca1666e](ca1666e2dfed36624f42c875abb13fab18cfc02b))
- Reduced MIN_POWER_ON_AC ([323e52a](323e52a2e6adb4146f24b93450882007a43c0393))
- Use latest insteado f cachyos for now ([078587e](078587eebdf4bf599f96019c3f824891ac310051))
- Remove unneeded options ([0d7023c](0d7023cbc48fe266828c3b210b33024c7b30aa82))
- Hypr, make it work ([749a1c1](749a1c18275f09c4ab03657e34b858a85f6243e7))
- Go back to nixcord ([348008a](348008a538f06b0535fc0548c78d8f50863faddc))
- Start trying to fix unable to use greetd ([f6e5fdf](f6e5fdfc051867f44b8f35724add2136d7577d32))
- Remove chaotic-mesa dont use it as sync ([d5042c2](d5042c25876860e7da3d119ba50bb4649038a8e7))
- Add trusted-substituters to make them actually used ([ecc0ea6](ecc0ea67c0eda1214ac8eb2284ab531b978e6867))
- Remove unused overlay now that nixpkgs unshit itself ([6b08741](6b0874100f23d856460886a1518a244083fb95a2))
- Include secrets ([9714423](9714423e8cdd6695db57395d543cd5a37fb9a60d))
- Update secrets ([6ba41f4](6ba41f46b8f5db74955a21fb610c8995a1705efc))
- Lix now works with nh and removed unused ([8224d25](8224d25d069a906436a5721a6bb537dd2a5b162f))
- JJ funny ([8af6cec](8af6cec4e7c1767b79523e5e82bd4a9671a3e09d))
- Cachyos broken ([937a773](937a77311a446658f9ca2c82f5a4d5d5efbcf08a))
- Remove abbreviations/aliases that would fail ([e428cf6](e428cf6020222daeebeba4650c78a477a5ac229b))
- Remove solaar and also add signing ([de0c1dd](de0c1dd2509a414d9903f7b0a817315d6160ec2b))

### Documentation

- Update TODO ([2ee46c2](2ee46c2540ef799fd2d5ba2dcadd1bd2962b8e2b))
- Update TODO ([d24562f](d24562fdf7e92d695d57507ab1e8da4e06da18e0))
- Start moving finished TODOs out ([2719601](271960163b6c70022a6436a09c7614fab97f8469))
- Update markdown files ([a21ffb8](a21ffb8de0b49eaa454babd4b3edd634b2f4b3fa))
- Update TODO ([3c46485](3c46485a5d0d947234a1ebb1a0e862bc11da1412))
- Update todo ([29bee4c](29bee4cebad8dab1d30b6d61069f4cce551a6a70))
- Remove duplicate TODO ([924f377](924f37774f745589d9c52a32782414b78141ecd4))
- Update TODO ([96e9102](96e9102f01b73ae0180f966781095e1eb8e85620))
- Update TODO ([d801527](d80152783ef1ccd9345fc96bd787288165cda107))
- Update markdown and TODO ([2a182e7](2a182e725197f6b242c1a60b4eb7f6c5c4b6d7e2))
- Update changelog and todo ([1c5ce9c](1c5ce9c8e7bf40dd72bb5278613044973a66f9c3))
- Update todo and add vale ([687a99c](687a99c17e8cc46b3857c03cefb2a7f51baaa295))

### Features

- Remove yq as sops is wacky ([5f2cada](5f2cadac4d7901c06ad327e795c76affb2f45fa0))
- FUCK YOU MARKDOWNLINT ([3dfd912](3dfd9128eb0a9e8a05d2cf81fcceed99ed988cc4))
- I am euphoric, had two versions of markdownlint ([d035716](d0357161ac789658b5120c37b4008d14ce65d61b))
- Ditto of last one ([29dc193](29dc19310cd8fb5fb4631525342a28ea216da242))
- Add note open prs ([1b7cfc7](1b7cfc7354571dfbd39cdcfad7cc633f0207dd8b))
- Add and use prettier ([6810fed](6810fedabf4f9b98f4f9d9418fc4fb6622f58fd9))
- Added treefmt ([46af1b1](46af1b141134673ceaf4af95c307a1a98f40c3dd))
- Added hyprsunset and hyprpolkit ([c33b519](c33b519b9a5447025a4163a03c73b9d1a2065582))
- Fix issue with multiple packages of hyprland ([ac33d16](ac33d16236f0d7bf3fc6921a58f6eb0ee3b2d722))
- Merge old wsl ([1ac177e](1ac177e8c9264867d79bb4e8c92d9d62bad573df))
- Begin adding branching to figure if tui only ([86bba7b](86bba7b279dfa9bf0875d5beecaf90e4296bd78b))
- Remove isoImage and add more signing ([ba9db56](ba9db56798ac7092413806c40a7ab3a7ebcdb933))
- Removed single line ([1b5b4a9](1b5b4a9d95432e46b7443c2b1167d07972923337))
- Change signing keys, again ([f882b59](f882b596598408f930851da755771497cdc84951))
- Added gpg home-manager ([a82f3ff](a82f3ff9c5507d9e0440bafd14249dd022c46828))
- Add various gaming packages ([bb5dba1](bb5dba189dfdc69fe755d820168b36e3bdc1b355))
- Added gitleaks ([cb340eb](cb340eb49b84f7847a42f423b175dea39609a486))
- Remove middle ([3548187](3548187174b7843ba5c87d77589cb5eb2c3cb7a9))
- Switched to all flake parts for devenv ([5b8e803](5b8e803b02412ff851d6dd1248833c4d80099061))
- Start breaking up this massive flake ([c26b7c5](c26b7c53b7fcfb3801615535c2019bc41e01d39d))
- Fixed  gpu ([4089920](40899205d6513f4093d092afe615e9976c8b621f))
- Fix gpu again and updated all non-broken flakes ([af61d02](af61d023507f93aaac5496e5464902840e21df75))
- Add powertop ([8fed27b](8fed27bfe7d4ef2a7c0f3c4276725e62deba08b5))
- Add doas ([e29f741](e29f741b6372e97207e62682017b316e2656b1b3))
- Add specailworkspace in hyprland ([f5c7f9a](f5c7f9aa1ebdbaff269cbc40755ff78f2616e558))
- Remove manohud ([535fead](535feadfef0a5f1fa0e55da1cd11db5a9210df8b))
- Added treefmt to the devenv and pre-commit-hook ([98241a6](98241a638a908bdc8a631aadc866406e37249686))
- Actually use the nixAccesTokens in the config ([fbe11db](fbe11db248f0a8925efa05a3a413288c9ceb0ea2))
- Ditto ([9b11a5d](9b11a5dd60487efff3bc4e50ec9c8b1fd701da54))
- Removed hyprcursor as it is provided by flake ([6c173ef](6c173efbdbf2cc764f134dd7cdc3c9bb775016e5))
- Move nixAccessTOkens to home ([be35ff9](be35ff903458bb8235db9efe1836272db904c523))
- Add tmuxinator ([2b94348](2b9434839c2062b80dd872046564c83cc2199565))
- Change hyprlock version ([8abd5ea](8abd5ea3e1204ef1e9e5b1156edecd0f4510d2fb))
- Added activity watch and refactored out services ([c7b34a0](c7b34a0388687b25ff28e1647784ae3f49127dd8))
- Refactor to services ([43dd5d4](43dd5d4ecc3bae7bbaaab4f8a77e8d5f1367c6e5))
- Fixed the high temps I think(?) ([2299126](22991265e77db5e10c8bbe68352b2097dcd7b2f5))
- Move systemFlake to its own file ([1ba3e3d](1ba3e3d7c8441944b1ae6af1bf014f9f770c4700))
- Add screenshots dir and get it working, remove useless env vars ([2216504](2216504e62e40e4442a4bab7c2f8b2457520c50a))
- Update flake.lock ([c6f574a](c6f574a989c0020ef9e29b71d7b591b545f7a80a))
- Change hyprland config ([32b3583](32b35835f64cb9a2cc2db851f7df54b8591b057c))
- Apply formatting, overlays and also change zen-package ([40a71ab](40a71ab061cb597a59f033a60c94464a66902597))
- Remove dbus package as it is already in services ([6624f91](6624f91853939c3504c4c51327fe990647bc60b7))
- Change wallpaper ([0dfd13d](0dfd13d95176278290ecdb8017398b19ed66e4ec))
- Switch to lix ([e2fa105](e2fa1052f1b9a210c64b23eeb688f39b980f03a3))
- Switch to lix ([c066894](c066894e350cba8e6dd9393a92ae4e484e92e72a))
- Continue work on hyprland, added todo ([5c88982](5c889824f9b47ce41114b457a037fb34536eb523))
- Add hyprland env variables for qt ([0c5f8c2](0c5f8c2cd1c9bdbfe45a6affbfbee80e8c19648e))
- Updated animations ([e8adf25](e8adf259140388e3289d49bb47b56da7f4143717))
- Make btop show gpu ([65f5293](65f5293e6df3c6ee1874fa347c82319201a64d41))
- Disable confirmation prompt ([997e12c](997e12cdda45ef3621e18bc79de4428ad0caeab5))
- Update home, remove tmuxinator, and other enchancments ([fda6ce2](fda6ce21e7830b1069c01b51ae1c72f9956c52fb))
- Added neovim config here, though it isn't working rn ([0b56abb](0b56abb7cfd52287f0aa18e11f663fc3cab27285))
- Remove nvim for now ([06b4de0](06b4de0348b1da0849008b8502e6d85d813f4276))
- Add github cli ([e35dc57](e35dc57c00a26504ac3912443cb47680b8cafc52))
- Add shell aliases to nushell ([bf2cf22](bf2cf22cb212d197c4662ab51210be889b75c1df))
- Make tmux use nushell and added gh.nix ([3247473](324747389ad9eb484aa532f7b744b2670c2cdcc4))
- Add git-sync ([227b3a8](227b3a807de8a600df7b95180a071397ebacb6ba))
- Enable hyprlock integration in stylix ([42df6c0](42df6c0a8698c01fbd9e229d6acfca8810a2ca29))
- Add windowrules ([e930f50](e930f50e5fded1fc1c3093e5243350e8d68a7085))
- Change back to nix version ([f1bec76](f1bec76009ee34a6597e435d5d4f4f4daf3e92a7))
- Add nufmt ([0766f31](0766f319b0f959eff49a433bd20082462ba05dfc))
- Add bootloader timeout ([330898c](330898ce7ffa7c4d866d5f80208424958b295565))
- Add nushell ([3e5394f](3e5394fb6314d4f9d22526dd99d1536201d12737))
- Change back to fish ([15cce2b](15cce2bdd9d3ba34efeca3f36877d96ea994cfb9))
- Add services location ([eb81203](eb812031e4b54a1a3b7f9fc750632e8aba1e4b15))
- Remove lix module and add nix-topoology ([7a50b14](7a50b14b3c4f213d7499be6edb5acdd3b999bfde))
- No_hardware_cursors no longer needed ([01b7bb5](01b7bb58ce0d1d9fa8381f50bd0a63835e851290))
- Make .envrc  actually check the correct files ([b3c1563](b3c1563910ec715d09dd3f74ab02de77c3b21a44))
- Add cliphist as a service ([408d46e](408d46eecee02123871e503b2b93435910e0dbc7))
- Add sesh ([90f4dae](90f4dae8a0d84366e878e3eff073172980114200))
- Get the correct settings set in vesktop ([54d5a8b](54d5a8b3cba68197106da7982d323be34c9aaecf))
- Fiexd cpu ([76149a5](76149a5d713771b301b5b67112b347f97b1fe4bf))
- Start using chaotic-nix, broken tho ([6266bc7](6266bc761dcb1e4e6615bd8a03d14aca66e1527b))
- Use chaotic and cachy_os ([9a92c11](9a92c11427f2e7ccd48619512446b2882fcd57c0))
- Add coolercontrol ([edaba3b](edaba3bffb3c8dca33f01b9539eea452aed1daf4))
- Reintroudce the wsicons as it is no longer broken ([cf43a18](cf43a18f250277d403355cfcf5c835286e82a073))
- Remove ventoy apparently insecure ([f3e3e08](f3e3e0840cefec8f246eadcd1a606b385374bcf1))
- Smart borders ([faa18f8](faa18f86b4486d0f32500ab475231e0aa87d43dc))
- Use default.nix and imports = []; ([003b013](003b01395c524e2d13e45450a03983023ef8bda1))
- Add home-manager flakemodule ([c154b61](c154b6117d9c82a21b1d9dc82d09888f224df059))
- Started using disko again ([bb57d6b](bb57d6bb60428c46b48e852698502fa608588cb3))
- Fuck impermance for now ([c095734](c0957347b5dee2e61778932bd4c55f89208a9c65))
- Fuck impermance for now ([01fb31c](01fb31c69d1adef684bddc906b6990133c7c6e44))
- Change sops keys ([75fdffd](75fdffde9bf4fe17bb954fdc862b56adc80be4f9))
- Remove unneeded options ([83f9fa8](83f9fa8a2188b672d71679d523d02a5dd7503686))
- Add element ([9f56781](9f56781628c06ab519bb343f490c9cb5311d6479))
- Make base16Scheme a variable ([0cc4604](0cc4604cec46a83c8bc985a4cfa4a97255114337))
- Add nixindex ([9c09e5b](9c09e5ba19fa29460be34afaba116f4a9aea1bed))
- Add steam back to autostart and remove pyprland ([643c3da](643c3daf5a5c6a9f19e3e505fdfd701ba2e69b3c))
- Remove nix-index from system packages ([8d4e21b](8d4e21bbbb68b3fb9fba814a84ff8867be80979a))
- ExtraSpecialArgs now passes pkgs ([dbc996a](dbc996af6bee58604dd37c5b68fbab9f3ef0e2de))
- Obsidian added ([8871f17](8871f177c20b74d476f1df2dacc3bccea28dfaa1))
- Update flake and add lix-dev ([76d835f](76d835f6fe6c6fe34356645bafee830b9312d8dc))
- Add oxidizers ([2a9ea20](2a9ea20d67421eb960115d2734dc8fef3f4e1b49))
- Change sorting to natural for yazi ([dc16cfa](dc16cfaaf7c9bedf568bf18b07cda20953203157))
- Jujustu ([572dacc](572dacc722891d881fa0b61cd35de1e5cea29752))
- This weird ([7e7ac32](7e7ac329a3a871bdc33aa4995de2efe02ab74551))
- Stuff ([f6ea055](f6ea055ece3e1b2d73484f0fd510aa069a470474))
- Ditto ([6123edf](6123edfc608d0a4ff7386bef7d51c3aae64cc3f6))
- Ditto ([49e7688](49e768887d6138e3e04ff80df9c90ce7d77f5595))
- Switch to wayprompt ([872e491](872e491b14a52e8b24f45a0073e0f174a22caed1))
- Test ([2a8ea30](2a8ea3077dd5ba949b762abdb848547b97d1d6e7))
- Removed funni,was a tesdt for siginig ([6937133](69371331918232126bfb0fcd3316e8b18168562b))
- Moved around browsers ([0d9ce4e](0d9ce4e78cf28e72062dd59a53f04940a94b1832))
- Add jj support ([d01fd37](d01fd37b439271831cb9603919b0e2d9410a71b6))

### Miscellaneous Tasks

- Remove unnecessary settings ([9f76d54](9f76d540356b531f9738a0d3f2b0b52c7242a9de))
- Style ([9ac3263](9ac3263f9c48f70ab81c9539550c413b59bc2a93))
- Update flake inputs ([4c11965](4c119653d5196bb241b097fb16cda30781a4bd34))
- Updated prettier and flake inputs ([eb17aa4](eb17aa4c40a9c736ed1db37a259f9ee31f6b1464))
- Continue to implement suggestions for nvidia on hyprland ([b8653c0](b8653c017d9bf5f9c0fbc825161081d10070e93c))
- Update flake.lock ([7e76361](7e76361fd65bd12ce68438bf8789ddfc9d990447))
- Really need to make it detect ([95a4c1b](95a4c1b882eaa2813bd1b0ec7e371b98d4cec5e7))
- Changed signing key ([7e2901c](7e2901ccc3a8793cb5384aa52f289bf360bda991))
- Continued work on gpg ([deff461](deff461627b689307b7b1b5d70eaf8179dc4b76f))
- Update flake.lock ([43172b4](43172b4449fee19ebb6a457c6dbc400732993ed4))
- Remove unused launcher ([18554e9](18554e93ef65cdc868f9b1589fba396fc702d464))
- Apply formatting ([b929bdf](b929bdfc9b8920aa64a58d6bc1c5acbe050dc4fc))
- Update flake.lock and condense flake ([9ca3006](9ca3006c691467a476f376f45c5ec3e44827b3b0))
- Modify envrc and also use cachix ([521a0d2](521a0d2ec196dc995579cd9c49c0c6473bc648f1))
- Minimize repeated dependencies ([d860f7b](d860f7bcf2179d25d3d0eebb9060f290da2462c8))
- Update flake inputs ([5af65f7](5af65f7024857dc18137c426950ece2ba41a7f7b))
- Update flake.lock ([528f30e](528f30e7320aa2ceea04e184b3ce190549cfdbaf))
- Update flake.nix and add more inputs ([21220b2](21220b28a3a71d14a673f16c71668e11331e0e35))
- Update flake.lock ([58400b9](58400b9724113792bf93e4e5a04b1a5cffa30ba1))
- Update flake.lock ([c868a55](c868a55ca0f585fcdc2ba5103735e0b413001bfe))
- Remove unused packages ([ebf2779](ebf2779474dd5e41c56718e6527c9867a60e207d))
- Update flake inputs ([b0751ea](b0751ea6fd391219a414c17b8911812f60210b42))
- Removed completed TODOs ([e216f85](e216f85351bc7a366be5188604c555e803a52cd6))
- Remove unused and unplaned comments ([938c9e8](938c9e88e94a406859ab3d61425be4629aa2ef2c))
- Remove less used inputs ([7168f09](7168f092b5b84f1a757aec8c227e85c0da1746e0))
- Remove unused caches, and settings ([7c168ae](7c168ae1bd40a1fd7615433b749a13b3d3529e1b))
- Update flake.lock ([a286d7c](a286d7ca6d7c9256ce9efe250be83c034906e749))
- Update flake.lock ([3b9e736](3b9e73689f01ab06a43102e7d0ac899587f10d84))
- Update flake inputs and also remove nixgl ([2c98d3d](2c98d3ddb1e87132e9528baa08499ece5090720f))
- Remove unused tmuxp ([43efd2f](43efd2f9299838ae334358fe97873cfaf3ae4c30))
- Update flake.lock ([3912a68](3912a689ad4a4c90ebfee34221b7eaa99999e259))
- Make todos more explicit ([dad0f32](dad0f323545c2275a1b9c09a8d56a349a06dba4c))
- Update ([e2f2537](e2f2537d59c8a3e985dc5b3c3a7743eace6ebb82))
- Update flake inputs, everything looks fine ([2752ad4](2752ad415209e34b6108735a7db7e28fd9bb01c5))
- Change zen version ([9067c93](9067c938b254f6f2355067c10d48fe8abcb070b2))
- Remove unused packages ([db39d89](db39d895c827311291471005c3fb3ef757b85324))
- Remove unneeded options ([64899fe](64899feeb3453c60d0af34c59c641b4a5cfd1716))
- Update inputs ([2c7140a](2c7140ad84df677b06513713364559cabc19efe8))
- Update inputs ([70e4663](70e46635feab05d3b6473bd345386b93fd20c2f4))
- Trim flake inputs ([5e71978](5e71978719f60845c4b76b2bd6fb03e37792b6a2))
- Remove unused things ([c0d44a0](c0d44a0ac3a1d596f99fc69be63f2dc4dc99768b))
- Update inputs(hyprpanel broken) ([2ec5db2](2ec5db2dc5bd67abfeef6adf90493d6c0261196b))
- Update flake, and flake.lock ([648c649](648c6493e5a14562bc085b26979dbcec370e7901))
- Fix home-manager ([6ea07c7](6ea07c7539f3c55be0ef09f0cdb5a6aede98caf8))
- Fix warnings and removed unused packages ([7eaad49](7eaad49f711f7282e6c75bf1cd90d01c2091b96e))
- Update flake inputs ([136af6f](136af6f9ea58857d532de3ad672b0c469eddea5b))
- Remove unused arguments ([906c6cc](906c6cc4c3d95dd996743569f1328cb272836718))
- Remove unused options ([a20bb89](a20bb8915fd9b74e8864a650f5136aa2552c4d9e))
- Update flake inputs, and also fix xbox controller ([f601d4a](f601d4a64c50b3f3a1fe89a8526f193c797566ba))
- Update flake.lock, nixcord broken ([36083f2](36083f2febe8d0b7300389f01b9ecaffd6567a14))
- Update docs and remove alejandra ([b9af713](b9af71374fac9cac22c3bf196fe2172f19d86625))
- Remove unused packages ([af86141](af8614128386fc8b4809f0f4169fdeeb5bfa1ff5))
- Switch to dprint ([be01314](be01314200498c733f598e032e40d6857cbc9048))
- Update nixpkgs ([bf7f80a](bf7f80a8c9ed1f9fb025a435e581ad77784c87f2))
- Update flake.lock ([c92e24a](c92e24a56dc30452f127f865e5eacbf46fe4ffc9))
- Remove unused packages ([67e6d6e](67e6d6ebee3214f158e3cc0ea91ba43467d62a80))
- Update secrets ([24abdd9](24abdd93b9e2d1ceebe8f8fc5edb37ee695d2000))
- Clean up comments ([dcd3bd8](dcd3bd8eaf3ee0807d4601302ecaf5c22fe0429b))
- Update flake.lock ([551827a](551827a538b0bc274b4d05d5a488928c4d83403e))
- Update flake.lock ([3afaa98](3afaa985cfa831239f1fc2f6502cd17a64a871af))
- Remove unused and faulty options ([a02e01f](a02e01faa1553c308327ceaef7c601e0338bea34))
- Update flake.lock ([f3eaf64](f3eaf6491f2275a0ab8de96c8d8fd0e85e7d56bc))
- Remove comments that are unnecessary ([4c147e1](4c147e1124f2632ff17d0ef3809f93a5b8720a62))
- Update flake.lock ([03ef00b](03ef00b42ef951fb4ca300c61004388a88f92432))
- Update flake.lock ([13b7338](13b73380aa25a98b491cbc52f205db54ba988346))
- Comment out unused things ([c7f6852](c7f68529533774efe0c42b336f7ef81b0f3c18d8))
- Update environments ([5dceab5](5dceab5d3804684017a40622e5e41c0f17cc5d5e))
- Hyprland prefix updates ([81f3e78](81f3e78bc80d558a4bd33a23be4526a3d58ed389))
- Fix paths ([355e3bd](355e3bda0263687f1e69f6eeb132f01e65872699))
- Comply with latest home-manager ([32ce6bf](32ce6bf37497acb632932d58fd98a92efb8f2b0e))
- Remove unused options and also try and fix status bar ([734e3b9](734e3b9e81865996590f5840ce748934c934020a))
- Comply with latest home-manager ([4df450d](4df450de807a66a07db10b1a32c2401b194ad258))
- Update flake.lock ([feb9c61](feb9c61dc2eac774606f8cf0d2858423a6e0f155))
- Troubleshooting ([e222a28](e222a28d696f24c50ebfc6151412abd326b9d1d6))
- Update flake.lock ([537d44d](537d44da9f21a812f08ffd1ae62731f1655a860e))
- Remove unused systemFlake ([b4e30ea](b4e30ea6f831ac4a39a9034abe8751f81f5f9f45))
- Use actual descriptive names ([64929f7](64929f76669f78bb55153e70fad31ce8f1e968b2))
- Refactor and also update flake inputs ([bce9ec4](bce9ec481892cd3a6f9175368620a9ff0282a08b))
- Update flake.lock ([590ef6f](590ef6f93106502e169a663f1646621f84538f79))
- Update flake.lock ([8407ae3](8407ae392586430c7d659230dc2466f5d23d547d))
- Update inputs ([96abc51](96abc510975a441d472c1b67bb57221f8716f797))
- Update flake.lock ([ac3f034](ac3f034c4bfe981a153d0187ee9430bc9efe8ee0))
- Remove unplanned comments ([705268d](705268d136d1dd4d61579e0eac58608c04b3c451))
- Remove unused features from conf.nix ([a0ac6b2](a0ac6b2e6ad366402bf00f9d2df1e872be13b808))
- Stashing ([0fc0643](0fc0643c48d4466d2b1be6569cb4fa7f6c44f9a7))
- Use lfs for pngs ([04064bd](04064bd453580b4a885cdecf4831921d30400ec4))
- Update flake.lock ([2a85420](2a85420cf3c07f71113a0fe40296d9a6479e7c74))
- Make statix happy ([005e1b3](005e1b3458cb2dc901a94fd65c1b76a7a540bc48))
- Update flake.lock and remove impermanence ([8a26e43](8a26e433cd646f2db3640d93fc4359170f2ba2a3))
- Update inputs and refactor ([2f6b3da](2f6b3da68cfc5cd2bf386bda0a0b62f4fe590eac))
- Remove unused packages from devenv ([6ae36e7](6ae36e7c7249fc13d77442067f65929b40de3922))
- Update flake.lock ([578df03](578df034ce9f93022225b700f37fa45642243169))
- Removed protonhax script, doesnt work anyway ([30790e2](30790e2f57f17d9102fc943181d53a9047c0bfc9))
- Update services and remove old,problematic ones ([aa0196f](aa0196ff98fbbabb0674705d5b54166250a900db))
- Remove duplicate packages ([6b87400](6b874000ab0c14adcf95570ada44db8d756fbdd2))
- Remove unused comment ([9edaeac](9edaeac025934f1f54216664881b9504fe29bc4d))
- Remove unused comment, not going to do impermance ([ce477f6](ce477f69b72d8188a682696b34069ca97b6e3ad6))
- Remove unused comments ([8063cde](8063cde2aa26a920e36368b44b0bf915d4e65b13))
- Remove unused and duplicate packages ([71f391a](71f391aa15ec447bfbcbb29040ab8eaa45a6c427))
- Remove rarely used argument ([137abc4](137abc4f5115e7859144c656391ae1a140ca4754))
- Update flake.lock ([5653a97](5653a97c3455f394d8d037953e1e263cf93e71df))
- Update flake.lock ([a281790](a28179079843a72c0bc985f2c90e97447c59d03d))
- Update flake.lock ([549b4d2](549b4d2d92f492dbc2b16bccdfda624821e8625b))
- Update flake.lock ([a8b3eda](a8b3eda75d26492e5010cd177ee0082d8cadd2ff))
- Update flake.lock ([4907e01](4907e01e2ec5aabaacde7ed8eebb85af3a656308))
- Remove unused ([a9a27a4](a9a27a43f1b254e9bec82cce75ecfad0e1c8f087))
- Make rofi work ([cfa3b96](cfa3b965af6bbca45cf258522e22a88b0fbd54ff))
- Remove unused arguemnts and options ([0352a9f](0352a9f8d5016d66197eb4f0d50d4a7c32a73743))
- Update home ([afb8a0d](afb8a0d7d6450df3c707e080e4674603b333199d))
- Forgot to add this to earlier ([eae0189](eae01894691e1547f141c9f22c477de77763c858))
- Update nixcord ([3ca07db](3ca07db813a727fafd21cb637905d35b66a8d01a))
- Update non-broken(nixpks) inputs ([1645034](1645034029338f0d7912f8df2614e5f76a49bf76))
- Update flake.lock ([c5aef68](c5aef6862a2e02a63a52a973ee969ef724fceac4))
- Update flake.lock ([53013af](53013afa7d3b011812412c95025481525f8c6cbe))
- Update flake.lock ([d3057e0](d3057e069d80f72de4f5e6436c94229972f706d5))
- Update TODO ([992e52c](992e52c4fc4761aeb38034a0e1d1a0de2f4ab1fd))
- Update TODO ([fd351c2](fd351c2e5589e610f8c3f9a903b39f1b150b1199)), feat:JJ werid
- Update TODO ([1f0ed6d](1f0ed6d678e5a85e6018d0db43e2bf398816e462))
- Removed libnotify package ([282dc47](282dc473a51a45cd7868483550001c7cad810ca0))
- Remove unused packages ([124c512](124c5122974f3e4dacc66107dfcf1bb742ef07c9))
- Chore: update flake.lock ([77ec862](77ec862c85d8a0671351b5cbaecec0045aee4a5f))
- Flake ([b86c6f5](b86c6f5d7d4a7a2ae001870e8648992eb705fb1c)), chore:flake
- Update TODO ([09a806a](09a806a67846d3ce1b4917908da9c07f0297585f))

### Refactor

- Remove black-hole as it is not used ([89053cd](89053cd7056ceb9280096927012eaaa5506a9de7))
- Remove gitlint and add cursorSize variable ([3cf4ba5](3cf4ba57e7b4b2bc2c0f37078b42c17f117526d0))
- Make it more clear what each section is ([58a1d7a](58a1d7a126ce5ece081690a081bfd5b989175b72))
- Using prettier proper now ([8a675b4](8a675b42c0556cb1efea13814aa737970e5bf9e4))
- Use treefmt instead of alejandra as fmt ([b153cb9](b153cb97d7f833047beeaa391c1e4b83eb8a177c))
- Remove nix-gaming packages ([e87113c](e87113c18ef9d284023f05c7db1fbaac6a46015a))
- Factor out flakeModules ([2e4c24a](2e4c24a6dcb74b9b2068bec4d13908a192e201da))
- Move nix accesstokens to home ([5e9f1af](5e9f1af18bec05770a36216f6ea46f957a4e8c0b))
- Tmux changes ([3e36001](3e3600112b811463d6e445474c33ccdeffea27a4))
- Remove file-search bin ([30043d5](30043d5a1ce598ec14153d0393af2472adfbaf90))
- Remove zramSawp file as it is unnecessary ([6897194](689719455db0532ac295b3bd881fb00cec3c2865))
- Zram was too small to justify its own file ([ffa3409](ffa3409241a6b44fbde894034e90060927ba1a9b))
- Fix todo and make systemFlake ([5d9b146](5d9b14698dbcfa28dc062f0a2c0c78dc7fbbba1a))
- Start the hyprland config rewrite ([dc3913d](dc3913d4c1f83ee5103f8d9ab648c7d8aa061034))
- Continue working on the hyprland rewrite ([1ab7d80](1ab7d80c8e4217f1358bb5109951cfbdd1ae6c34))
- Remove std flake ([16d9ca2](16d9ca27c8204a382278aff578904c292215c2e7))
- Binds now has its own dir and removed redundant dir ([6deeb01](6deeb016026c847df0496bdbc00f10ef5c5f6ccc))
- Remove unused packages ([4011b99](4011b99fa3bbf20a9e947d6979b5ffddf271a38a))
- Things are now where they should be ([36505a3](36505a3d611d582382a0d8f554f14cb6ce50524f))
- Remove nix overlay and inputs ([8db9ece](8db9eceea04f3f40c8367e7ce86ae761f835e09b))
- No more useless overrides ([a83d971](a83d971af272a6f5bea5ff2c5952cdb86705a207))
- Remove duplicate qmk package ([d66716f](d66716f40512d4abb7251e5f7e56c547f751bd99))
- Since home-manager has a sesh module, remove pkg ([efd8574](efd857467700c1b58bad6e3e917be0a90ab37b87))
- Removing tmux options that are now moot with hmmodule ([04378b1](04378b1b608ff32831320e8f449ebc93da013fbc))
- Remove hyprlock flake, not source of issue(also formatted) ([1a3ebc1](1a3ebc1f6c6ad1762b4d94de80b23a5eecba1e10))
- Attempt to reorganize and bring sanity ([9bcd3c6](9bcd3c6f793113b2a2f4320d25c127dd99ae630b))
- SystemFlake is now in top-level ([9f24a18](9f24a18165ed0a093f66cdb00f9631bf863874a3))
- Move programs.hyprland to correct location ([d96d98d](d96d98de2afdbaf711b75fe9d808a60491087fc8))
- Devenv.nix  now uses les redundant packages ([8d06d2a](8d06d2aceed965f83d519a32ca51b31dc614e58d))
- Remove unused and unusable options ([5737473](57374734335604db49eb84d48f15c47210edab4f))
- Move configuration.nix to system/default.nix ([aae9e34](aae9e34ba722f7770c628c8b5ba7a3c47c2dbd54))
- Move home to have a default.nix, also update flake ([a4d51bf](a4d51bf803d5b9a7b44c6716e915754dae52cf2c))
- Override devenv inputs ([9aa30a0](9aa30a0f179892ea260332eb0f43baf1e2f485f3))
- Move playerctld to home-manager ([f69ff49](f69ff49691ebfc830b75fd19f32a968cacf93e71))
- Move git to its own file ([9230c28](9230c28941cb1b9532dbe4925e32a4be1e5f875c))
- Move carapace to shells ([376ec44](376ec44aee05240345d667232a3a8b2ff8c43d34))
- Remove bin directory ([2d1addf](2d1addfa6a6f38b323bf75edb0254bcee90ed8e5))
- Remove unused topology module ([0b142c7](0b142c722c955081fcebb75b0623f4182b5270f3))
- Remove unused package ([0048aaf](0048aaf111fb59199886427b83374eb70cfc3c90))
- Remove unused modules ([b97f981](b97f981230b48481ce50d34bec83bf4af9ff1d64))
- Add more packages and remove let ([7391786](7391786a24703f0e100089d5c38708bd3481b7c1))
- Replace lsd with eza ([fef798b](fef798bc83708cf53aa23fb8adc87432de4f8bda))
- Move nix config to configs dir ([f9a0bf5](f9a0bf5f1079027c62bcbaf2bfa90e5d6e297006))
- Move from system clipboard to hm ([9ae6854](9ae685435c415d52985c375106b788a0031e3441))
- Make more concise ([9e15ec1](9e15ec1c189a84c567429feb57230f74506990e5))
- Remove fastfetch ([cf0eebf](cf0eebf7488985f922190f3d768f52deff77170b))
- Update readme ([045b522](045b5227c3735bb7378a4dd12a30607ac2a4703a))
- Moved all to systems/config ([c165320](c1653201e1104203fac9b97778e5559717ef96b0))
- Moving systemsettings to systemSetttings in flake ([c9e0222](c9e022272906556ae83088226bfb092eb454067b))
- Moving service config around ([abb3f78](abb3f7860c6e621648ea582f196e94eae3743148))
- Move nix.nix into configs ([4caa52e](4caa52ecedef96343b009a28dcf8b764c5f85300))
- Move xdotool to home, also remove neovim.nix ([de19987](de19987e53cbef27cf03a49fd6c86de261a6b4b9))
- Move persystem/shared up, also flake.lock ([b074daa](b074daa798df52c09b1a4b0ae62fa7c5a29ccf6f))
- Remove redundant dir ([8afab68](8afab68756b8f4d15bbebf62a11a6a2b7bc7ca8d))

### Testing

- Test2 ([87537ad](87537ad53d0e246c38fd0b27445f7c78df4cff61))

## 2.5 - 2025-02-25

[26bfed5](26bfed5705a519a4e351e8e627e8f87acbd7b76f)...[121a648](121a6487032fdd3f1a75fe9416b551a651272af3)

### Bug Fixes

- Fixed lanzaboote ([7fde853](7fde8536fb4504d1dfb2099d457aedc22c48e1b9))
- Fix xbox controller issue ([f56c8c9](f56c8c93382521017a6e0c518f539e195bc25e80))
- Fix(?) ghostty build failure ([841bbcb](841bbcb6885b0cb16c6ba9c97100ef82f017ba47))
- Make os switch actually build ([9a0472c](9a0472c214205224b7b49015f4c8600538e7ff26))

### Features

- Fix issue #3 as lanzaboote newest version builds ([ce41bce](ce41bce5096334a17af7cc0480924626e8f8207c))
- Remove grub ([4b9f1ac](4b9f1acb7b9d362cca9ad0de913276773a331cfa))
- Make stylix actually use a package ([ef174b7](ef174b72d87ac2f3459dc715792700e002df8f26))
- Added more pre-commit-hooks ([1328fb9](1328fb9b5b7976332ed952e74dc8d95a47776c5e))
- Add codespell ([d70ad7b](d70ad7ba47257f57f467c5cf74d24cbfc069dbb5))
- Topgrade now updates config ([b0fbab5](b0fbab5909ce638ef73d39404f988a6f3fb444db))
- Add bash-language-server ([07c27e0](07c27e0d3a742f144cbcb9a7a07915b44ac57cae))
- Add mango-hud ([0a172fc](0a172fc3fb0f358fd51366776b05e17b7dbe487f))
- Added commitlint ([74a33b6](74a33b65f777344e39211766cbfb88f2eeb4a7ba))
- Get libSQLITE to work ([7f237c3](7f237c314e5cb2a07f95384840988c9d50967eee))
- Remove nur and firefox addons ([eb0a08a](eb0a08a84bc496695a97e36ce6a6caaabfff6136))
- Added sqlite ([13a3fc5](13a3fc592b4a5851d7b8f3f1544d7d4b7e233000))
- Removed nur ([121a648](121a6487032fdd3f1a75fe9416b551a651272af3))

### Miscellaneous Tasks

- Update flake.lock ([ab8e2c4](ab8e2c461d69d050d5ee7b775cd96aa7a44c96c1))
- Remove unused comment, and also make code hints work better ([3d64d0d](3d64d0d3c6b455acab6a6007d931f0104a216a3b))
- Update inputs ([5241d0b](5241d0b6fe69c12e4ab11dd8b18be8693b690871))
- Update flake inputs ([e4ce616](e4ce6169714b5559b67d72813243e55f2bd55eec))
- Update flake inputs ([f4912c6](f4912c63c961c92f61c92952d4fb0d0f87ca24df))
- Update flake inputs ([cad74c8](cad74c8d26cf37a61e3f3816967da6d49de97c1b))
- Update flake.lock ([df7f21c](df7f21c2885ec5b37409a3be5ab0e2b05366d4cb))
- Update flake.lock ([4bd6cc8](4bd6cc8f698e9fc895fbc2f9d936b511b8bc7679))
- Update flake inputs ([ed70f3a](ed70f3aeae3ce3db1e4b8b2e03853e4bb44448d0))
- Update flake inputs ([9298c3f](9298c3ffe5599b9bcd563990441685e4bac145b2))
- Update flake.lock ([74f0365](74f0365853ca66acc2b0e29694cd4a376ecf3c23))
- Update flake.lock ([b2982af](b2982af98ccd46beaea493537ed0795efdbe2cd8))
- Update inputs ([22da9be](22da9be1dc16f3fc9303489e98255f41a00fc77d))
- Update flake inputs ([58a9c42](58a9c422589142e7a40e50a48b95a6424e453f2f))
- Chore: update flake.lock, waited a bit as stylix was broken for a ([b4621fd](b4621fd6fa20b8b055670080b9365ec033f91d42))
- Update flake.lock ([3999219](3999219125b2433b722a1bf23309805f744ad879))
- Update flake inputs ([022930b](022930b649c38c250987c9faa7d9c888adbe2c7a))
- Update flake inputs ([ad7a66a](ad7a66a6ddbeeabaa5856e91edf7a102024bba85))
- Update flake.lock ([8fd6a0c](8fd6a0c867e7e51946754d7b83eb0db0a925f970))
- Update flake.lock ([200a4e4](200a4e4d7439380837bc7a10c231132f0f819c66))
- Update flake inputs ([a31b5d6](a31b5d619fd4f31753996cda2f7a16d8c83592a1))
- Updated inputs ([f81a2bd](f81a2bd482367a25b239ef06a57e8a72fe24165c))
- Change names ([783ed01](783ed0100a2a687554f5119c924df0bc1242ec0e))
- Update README ([d93a445](d93a4458bffdb1312c5a59858b8e1c41b9a666ac))
- Update flake.lock ([51e453b](51e453bb975551f39dfbb349c4cc7121a28b76ce))
- Update secrets.yaml also removed yaml checkers ([7722e9e](7722e9e9e2c06486f1dd5bd41fd541a1d487f0a4))
- Removed language tool, was unnecessary ([b0ee808](b0ee808416e3c2b92dc9de06b4d4446fcfc27318))
- Removed gnumake and java, better suited for flakes ([f740b88](f740b88073296eb4d6120cca1d814999e3c46374))
- Remove unplanned comments ([b2154d9](b2154d904706475760b4132691ea91c2d9438e2e))
- Update flake inputs ([6a87698](6a87698fa9d6f2ddd48d55e678ce3b479b13ba5f))
- Update flake inputs ([123178e](123178e23c782b3e7f14c6c87fa5d098496259a9))

### Refactor

- Refactor: move around pipewire config and also(probably) fixed audio ([49aada1](49aada138e321a9e331fc4f4106f4e5149ed8598))
- Refactor ([2bc946d](2bc946d020ebb0ed0760cffbd459c09bfd88f8eb))
- Refactor ([a1b238c](a1b238c1348e9b2ebbf2cab33a811874f0c6fd7e))
- Refactor and remove trufflehog excludes ([38bc310](38bc310ab329342267f8a6af9507e4e82f5323af))
- Remove python3 ([13ec967](13ec967271ca3b208a612496ca00876d3b6462e7))

### Update

- Flake.lock ([22b4744](22b4744e1d792bb529a41d4c0481d965b5d20b05))

## 2.0 - 2025-01-14

[24b01de](24b01de4d929d64ddb7c06fc37ea8dfa0ca295da)...[26bfed5](26bfed5705a519a4e351e8e627e8f87acbd7b76f)

### Bug Fixes

- Fixed gnome boot issue ([6cf5117](6cf511765f60a0f55fc2d6abc3190bdb3979b42e))
- Fixed tmux enviroment ([b1e3b0b](b1e3b0be4f8d03150f979a9ba0874af3b122fcfa))
- Fixed issue with packages ([fed72da](fed72da43775ef90cedabf7e5b7fe14d05110854))
- Fixed indentation with on-the-go config ([f621081](f62108103b3895a8976be9798687f710a8301208))
- Fixed issue with firefox ([f251594](f251594b620871c56f547cb09b40cefe2fe29020))
- Fixed error on rebuild of nixos- it was scan ([e1768c5](e1768c562e078d1e89696a459096c22e262bac52))
- Fixed neovim nightly error with flake.nix ([f874f02](f874f02e206bc5d0bf8efd0fb7871b6c0c48d3c3))
- Fixed waybar flake also added the entire nixpkgs-wayland flake ([4c9fc21](4c9fc21dcec88714baec5625ae6dda195df536f3))
- Fixed color problem in tmux ([6cddd73](6cddd73a2fb10648ec029f6eee01637070e70950))
- Fixed fonts error ([ea68b74](ea68b7491f5f254371b4ef3a000918007e022264))
- Fixed merge conflicts with git stash ([af4f66d](af4f66dfa0c941ad097b210cce1d9338c4942799))
- Fixed issue with cursor ([1d80acc](1d80acc47351456f119eda0fb889422060fd78b0))
- Fixed merge issue ([15b0d44](15b0d449347fbf2ac72c5d2c0159bf307100bf39))
- Fixed cursor issue and also changing hyprland looks ([d4d4a69](d4d4a6972115a0cfc237e1a7718c87e54a52396f))
- Fixed booting issues, still have issue with cpu fans, also added more GUI applications ([ec549f5](ec549f5467f929ca6820f8b0a9acb52f6a1b9d6e))
- Fixed the overheating and added shell init ([03b1323](03b13232cef5fd91a8b93b446120abf74b1e347c))
- Fixed regreet issue' ([95619ce](95619cea4d8d05de2be87c5dda67067b1181882b))
- Fixed dolphin looking like shit(there werent icons) ([3141720](31417200fe2f67cd2cb6dfe6c2cace7628eff34c))
- Fixed issue with base16.nix by disabling stylix ([468161f](468161f5f5064fd18a9bcbcfe3d4bccbb4774aab))
- Fixed the issue? ([efbb25e](efbb25e03f5fd659c4f835d752221d0df42a3699))
- Fixed unable to start hyprland issue ([0411a0a](0411a0a477966c4f84444bb5ebc4897e7c97f850))
- Fixed hyprpanel issue and added to exec-once ([565cb00](565cb00772ee4650806042f481bc8b2391d7223b))
- Fixed errors ([02c8cda](02c8cda3f2fb731b6a0bafafa77f75deb294a62e))
- Remove call to ghostty ([e2c1653](e2c1653a8bf7b0ded91876cd33798925042d5ddb))
- Topgrade now updates neovim and also updates flakes in parallel ([d43c815](d43c815d616759f997dd6026bc1217840a2f3d65))
- Actually use the yazi overlay and added n3, though might not use it ([61e2d4f](61e2d4fe1a040a0def626c6c4728a9ee86048ccd))
- Hyprland now has a reasonable mouse cursor refresh rate ([d31e940](d31e9400d2c2251ccfe508e442cc9b8c6df02111))
- Typo correction ([7d62ab0](7d62ab0df37b8fca77a931c3a92010b98615208e))

### Features

- Added tmux-clinet to gitignroe ([aff9958](aff99585be1987d131c07e70595241b48c77a27a))
- Update zsh and tmux ([fcd8f06](fcd8f069d300bff49ad323601fe92f995d8d8fc0))
- Added discord execution and added more flakes ([9a23757](9a237572bf3e5c62daa997fcb4202c2174ffd451))
- Categorized yet to be categorized directory ([57ae6cb](57ae6cb5c7a7a886d3faac61d4ba282e04b4c8d9))
- Updated hyprland to latest non-breaking commit ([bbb3186](bbb31866f3c960b76d1027fe8c037fc4a7088ff8))
- Add noto-emoji as the emoji font ([60f2f18](60f2f188b4c2e96b6e8edb14a821a762355242e3))
- Remove the hardcoded path and instead use the module ([c1d6110](c1d6110df5b123b15ea73d302a59ad2125fb2951))
- Add ghosty to the default ([3dbb7af](3dbb7af9b4be67265b6b0c91881381bea7401204))
- Remove unused option ([40e549c](40e549c8d8ab5c750305d563aaeff038d4e2e9e5))
- Remove unused firmware ([220379e](220379ea77618f01ccf5a18068f15a311d43a53a))
- Update to ghostty ([65adc7f](65adc7f85d34319b06b8922cc7d212625f877e7f))
- Hyprland now uses stylix( I think) ([7c2d543](7c2d543ea14e11467d66450cc09c26bc785c8d36))
- Add nixcord ([62c6089](62c608926acbb5c6734b0e3c30639b60e7a01da6))
- Add nixcord ([7f52ba2](7f52ba2802301518b1b24071c9fdd0faa277750b))
- Remove reference to discord in system-config ([8b8acdb](8b8acdb53e413021881e9ab1708a86442abf64bf))
- Topgrade now updates lazy.nvim as well ([01de964](01de964a59338e8db2ea9d021e17931710a9f53a))
- Made a default.nix for system ([4191450](41914501574565f6e4173312c63c59c40f39ae5c))
- Add gitlint ([18e9cbc](18e9cbc406f1a8b3321ed9e08ba3bcfa9a8af943))
- Prepare for merge with wsl ([c90e182](c90e1822bdb25a42d733f4af370d85a121d0a3a2))

### Miscellaneous Tasks

- Update flake.lock and also removed useless comments ([4893dd7](4893dd762382a5fec9f11d13290d4e0bdc3fca6f))
- Removed packages that are now in flakes elsewhere ([60a9c26](60a9c268d1ecea6acff4baf7281b88cd315fbb65))
- Remove unplanned comments ([726f127](726f12703d559fba5a92e2539a1a57d396673623))
- Update inputs ([57986ac](57986ac83c665fe8648e56b54c4edfb5054dfbce))
- Remove unused overlays ([0e6f3e4](0e6f3e44daa36b9b8e3ca1f2d8b9353e6a195634))
- Remove unused overlays ([00b135b](00b135b8ad3ae56681c8264f98609654b025f126))
- Remove unused inputs ([5fcd442](5fcd442fe183c01fa12b282a293abb9d9d43801a))

### Refactor

- Refactor zsh plugins ([6d65415](6d65415b6b516bee3ffc0a26e98f4c1296894e5a))
- Refactor ([9c6619f](9c6619f039ac25caa33642b25a5f8d54f6eae092))

### Styling

- Style changes ([eadc06f](eadc06f66d935f2417941f41d533f0dfed7f2826))
- Style changes ([4f47c2a](4f47c2a43216b5710d65d85b71231948ffec9c11))
- Style changes ([f9b2e51](f9b2e51e759332f06c478e6f7d7b332adc35be3b))

### Testing

- Testing pre-commit hooks ([62df50d](62df50d6b008c867e02a356d9652bcca7f1d80a7))
- Testing ([7b6518d](7b6518d0057e72a5d42c347a2ced4ba69726832b))

### Flake.lock

- Update ([a5198dc](a5198dceda0046af95723b1b8764eedb805e2df4))
- Update ([4af3bb6](4af3bb6eaa41792a2b49fcae5e1a5d0cdbd91fdc))

### Remove

- WLR_NO_HARDWARE_CURSORS as it is no longer supported by hyprland ([cb09c21](cb09c2130c11077377fe129a6613220ede937c02))

### Update

- Hyprland ([e64946a](e64946aad7cf52c9bbb08fb82b01a1ae118fd1ef))
- Hyrpland now uses vesktop ([d9e1f00](d9e1f005711df0bd0eefb4425af4f63cad6bde2a))

## 1.0 - 2024-04-23

<!-- generated by git-cliff -->
