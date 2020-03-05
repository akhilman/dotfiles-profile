if not functions -q fisher
    if ! curl --version > /dev/null
        return
    end
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
    fish -c fisher add akhilman/fish-prompt-hline
end
