source /usr/share/cachyos-fish-config/cachyos-config.fish
set -x TERM xterm-256color
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/void/miniforge3/bin/conda
    eval /home/void/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/void/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/void/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/void/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

# =========================================================================
# MAMBA / CONDA INITIALIZATION
# =========================================================================
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!

# 'set -gx' creates a global, exported variable.
# This line tells the system exactly where your mamba executable is located.
set -gx MAMBA_EXE "/home/void/miniforge3/bin/mamba"

# This sets the root directory for your miniforge installation.
set -gx MAMBA_ROOT_PREFIX "/home/void/miniforge3"

# This line runs the mamba setup script specifically tailored for the fish shell.
# The pipe (|) feeds the output into the 'source' command to apply it immediately.
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<


# =========================================================================
# GENERAL ABBREVIATIONS
# Abbreviations physically expand into the full command when you press space.
# =========================================================================

# >>> Conda Deactivate >>>
abbr -a dc "conda deactivate"
# <<< Conda Deactivate <<<

# >>> Conda Activate >>>
abbr -a c "conda activate"
# <<< Conda Activate <<<

# >>> Stacking Conda Environment >>>
# Usage: type 'cstack <env_name>' and hit space, then enter.
abbr -a cstack "conda activate --stack"
# <<< Stacking Conda Environment <<<


# Monitor Brightness Controls (MSI External Monitor)
# Monitor Brightness Controls (Abbreviations)
abbr -a dset 'ddcutil setvcp 10'
abbr -a dget 'ddcutil getvcp 10'
abbr -a dup 'ddcutil setvcp 10 + 10'
abbr -a ddown 'ddcutil setvcp 10 - 10'

# Qylock SDDM Theme Management
abbr -a theme "cd ~/Downloads/qylock && ./sddm.sh"
abbr -a theme-test "sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/"

# shortcut for zeditor.
abbr -a z "zeditor"

# shortcut for fastfetch -c full
abbr -a fetchfull "fastfetch -c full"

# =========================================================================
# Functions run silently in the background and allow for multi-step tasks.
# =========================================================================

# >>> Dolphin Cache Reload >>>
function rdolphin
    # Step 1: Run the KDE cache reload command silently
    kbuildsycoca6 --noincremental
    # Step 2: Change text color
    set_color blue
    # Step 3: Print the confirmation message
    echo "Dolphin cache reloaded"
    # Step 4: Reset text color
    set_color normal
end
# <<< Dolphin Cache Reload <<<

# =========================================================================
# CONDA ENVIRONMENT FUNCTIONS
# Functions run silently in the background and allow for multi-step tasks.
# =========================================================================

# >>> conda activate pyraf >>>
# 'function [name]' defines the shortcut word you will type in the terminal.
function pyrafinit
    # Step 1: Tell conda to activate the specific environment.
    conda activate pyraf
    # Step 2: Change the terminal text color.
    set_color cyan
    # Step 3: Print your custom confirmation message.
    echo "pyraf env activated"
    # Step 4: Reset the text color back to normal so your prompt doesn't stay colored.
    set_color normal
# 'end' closes the function definition.
end
# <<< conda activate pyraf <<<


# >>> conda activate henv >>>
function henvinit
    conda activate henv
    set_color green
    echo "henv env activated"
    set_color normal
end
# <<< conda activate henv <<<


# >>> conda activate fermi >>>
function fermiinit
    conda activate fermi
    set_color yellow
    echo "fermi env activated"
    set_color normal
end
# <<< conda activate fermi <<<


# >>> conda activate threeML >>>
# Note: I made the function name entirely lowercase (threeml) so it is faster to type.
function threemlinit
    conda activate threeML
    set_color magenta
    echo "threeML env activated"
    set_color normal
end
# <<< conda activate threeML <<<
