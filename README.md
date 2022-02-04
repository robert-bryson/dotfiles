# dotfiles

My dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi). Note that
they are my own dot files, so there maybe certain things with my user/id. 

## init

To set up on a new machine ([docs](https://www.chezmoi.io/user-guide/setup/)): 

```bash
chezmoi init https://github.com/robert-bryson/dotfiles.git
```

## update

To update your local dotfiles from remote ([docs](https://www.chezmoi.io/user-guide/daily-operations/)):

```bash
chezmoi update --verbose --dry-run
```

`-v` or `--verbose`, `-n` or `--dry-run`. Remove `--dry-run` if looks good.
