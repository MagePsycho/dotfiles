# Simplistic Dotfiles
Simplistic Dotfiles lets you manage your dotfiles in repository with some read-to-use scripts.

## Installation
```
cd ~
git clone git@github.com:MagePsycho/dotfiles.git
cd dotfiles
```

### Structure
```
.
├── .aliases
├── .bash_profile
├── .bash_prompt
├── .bashrc
├── bin
│   └── mp
├── .composer
│   └── auth.json.dist
├── .config
│   └── terminator
│       └── config
├── .exports
├── .gitconfig
├── .gitconfig.local.dist
├── .gitignore
├── .gitignore_global
├── .local.dist
├── .my.cnf.dist
├── .mytop.dist
├── .path.dist
├── scripts
│   └── dotfiler.sh
└── .ssh
    ├── config.dist
    ├── id_rsa.dist
    └── id_rsa.pub.dist

```

Finally, install
```
chmod +x scripts/dotfiler.sh

# to check options
./scripts/dotfiler.sh --help

# to install
./scripts/dotfiler.sh --install
```

## References
- https://github.com/webpro/awesome-dotfiles (curated list)
- https://github.com/mathiasbynens/dotfiles (highest stars)
- https://github.com/paulirish/dotfiles (looks promising)
- https://github.com/alrra/dotfiles
- https://github.com/Filriya/minimal-dotfiles
- https://github.com/die-antwort/dotfiles
- https://github.com/ajmalsiddiqui/dotfiles
