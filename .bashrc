# Specify the $PATH enviroment variable
export PATH="$HOME/bin:$HOME/.local/bin:$PATH";
export PATH="/usr/local/bin:$PATH";

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_path,bash_prompt,bash_exports,bash_aliases,bash_local}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
done;
unset file;