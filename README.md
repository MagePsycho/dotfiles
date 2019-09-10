# Simplistic Dotfiles
Simplistic Dotfiles lets you manage your dotfiles in repository with some read-to-use scripts.

## Installation
```
cd ~
git clone git@github.com:MagePsycho/dotfiles.git
cd dotfiles
```

Structure will look like:
```
.
├── .bash_aliases
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
├── .bash_exports
├── .gitconfig
├── .gitconfig.local.dist
├── .gitignore
├── .gitignore_global
├── .bash_local.dist
├── .my.cnf.dist
├── .mytop.dist
├── .bash_path.dist
├── scripts
│   └── dotfiler.sh
└── .ssh
    ├── config.dist
    ├── id_rsa.dist
    └── id_rsa.pub.dist

```

Finally, install the dotfiles
```
chmod +x scripts/dotfiler.sh

# to check options
./scripts/dotfiler.sh --help

# to install
./scripts/dotfiler.sh --install
```

### Customization
In your local machine, you might want to set some custom settings which you don't want to keep in repository.  
Here we will highlight on local customizations.

#### Git
**~/.gitconfig.local**
```
cd ~/dotfiles
cp .gitconfig.local.dist ~/.gitconfig.local
vi ~/.gitconfig.local
```

Here you can set git user config
```
[user]
    email = magepsycho@gmail.com
    name = Raj KB
```

To check all the available git configurations
```
git config --list
```

#### `$PATH`
If `~/.bash_path` exists, it will be sourced along with the other files.

You can use this file if you want to add your new path to the `$PATH` environment.  
Here’s an example `~/.bash_path` file that adds `/usr/local/bin` to the `$PATH`:
```
export PATH="/usr/local/bin:$PATH"
```


*Don't forget to reload the `~/.bashrc`*
```
source ~/.bashrc
```

#### Others


**~/.local**  
This file will be sourced at last if exists.

Here you can add custom commands without creating a new fork.

## References
- https://github.com/webpro/awesome-dotfiles (curated list)
- https://github.com/mathiasbynens/dotfiles (highest stars)
- https://github.com/paulirish/dotfiles (looks promising)
- https://github.com/alrra/dotfiles
- https://github.com/Filriya/minimal-dotfiles
- https://github.com/die-antwort/dotfiles
- https://github.com/ajmalsiddiqui/dotfiles
