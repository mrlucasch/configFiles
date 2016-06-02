

source /Users/lucasch/.iterm2_shell_integration.bash


# Added by Canopy installer on 2015-11-02
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1

VIRTUAL_ENV_DISABLE_PROMPT='' source /Users/lucasch/Library/Enthought/Canopy_64bit/User/bin/activate

VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/lucasch/Library/Enthought/Canopy_64bit/User/bin/activate
#/Users/lucasch/Library/Enthought/Canopy_64bit/User/bin/activate


alias pdflatex="docker run --rm -i -v $PWD:/data jsalvarredy/latex pdflatex -shell-escape"
