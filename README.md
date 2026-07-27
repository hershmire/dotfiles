# Dotfiles

This repo is a fork of [holman's dotfiles](https://github.com/holman/dotfiles) with some modifications specific to my own needs.

Before starting, make sure your terminal is running in ZSH:

```sh
chsh -s /bin/zsh
```

## Install

Run this:

```sh
git clone https://github.com/hershmire/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you may want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine. However, if you are just looking to add paths or other setup to things outside these dotfiles, create a `.localrc` file in your home directory and this will automatically pick it up.

## Refresh

### Quick refresh

`dot` is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Run `dot` from time to time to keep your environment fresh and up-to-date. You can find this script in `bin/`.

### Full refresh

To pull the latest changes from the repo and fully refresh your environment:

```sh
cd ~/.dotfiles
git pull
dot
reload!
```

For a completely clean slate, restart your terminal after running these commands.

## What's Included

### Shell
- [Starship](https://starship.rs) prompt with git status, Node.js version, battery, and directory info
- [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [zoxide](https://github.com/ajeetdsouza/zoxide) for smarter directory navigation

### Font

These dotfiles install [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) via Homebrew and configure iTerm2 to use it. Nerd Fonts patch in thousands of icons (Powerline symbols, devicons, etc.) that tools like Starship and eza use to display glyphs in your prompt and file listings.

To verify the font is working, run:

```sh
echo "\ue0b0 \ue0b2 \uf113 \uf015 \uf09b \uf07c"
```

You should see Powerline arrows and various icons. If you see boxes or question marks, make sure the font is selected in your terminal (iTerm2: Settings → Profiles → Text).

### Starship Prompt

[Starship](https://starship.rs) is a cross-shell prompt that shows contextual info about your environment. Here's what a typical prompt looks like:

```
.dotfiles on  edits [!] on ☁️  frank@example.com
❯
```

| Segment | Module | Meaning |
|---|---|---|
| `.dotfiles` | `directory` | Current directory |
| ` edits [!]` | `git_branch` + `git_status` | Git branch; `[!]` = modified files |
| `☁️ frank@example.com` | `gcloud` | Active Google Cloud account |

Starship enables modules automatically when it detects relevant tools (gcloud, node, python, etc.). To see what your prompt is currently showing and why, run:

```sh
starship explain
```

The config lives at `starship/starship.toml.symlink` (symlinked to `~/.starship.toml`). Starship doesn't support config includes, so personal customizations go directly in this file. Since it's tracked by git, use `git update-index --skip-worktree starship/starship.toml.symlink` to keep local changes from showing up in diffs. For example, to disable the gcloud module, add:

```toml
[gcloud]
disabled = true
```

### Modern CLI Replacements
- [eza](https://github.com/eza-community/eza) replaces `ls`
- [bat](https://github.com/sharkdp/bat) replaces `cat`
- [ripgrep](https://github.com/BurntSushi/ripgrep) for fast text search
- [fd](https://github.com/sharkdp/fd) for fast file finding

### Version Management
- [asdf](https://asdf-vm.com) manages Node.js, Ruby, Java, and Yarn versions

### Editors
- Windsurf and Antigravity PATH support in `editors/`

### Other Tools
- Git utilities and aliases in `git/` and `bin/`
- Homebrew dependencies managed via `Brewfile` (run `brew bundle` to install)
- macOS system defaults in `macos/`

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Go" — you can simply add a `go` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for Homebrew to install: things like Caddy, asdf, Git, etc. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Bugs

I want this to work for everyone; that means when you clone it down it should
work for you. That said, I do use this as _my_ dotfiles, so there's a good
chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/hershmire/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## Thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
