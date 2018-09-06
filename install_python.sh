#!/bin/bash

# MacOS is Python runtime is not supported on Travis
# We need to install Python manually. See
# https://docs.travis-ci.com/user/multi-os/#python-example-unsupported-languages

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

    HOMEBREW_NO_AUTO_UPDATE=1 brew install pyenv

    case "${TOXENV}" in
        py27)
            pyenv install 2.7.15
            pyenv global system 2.7.15
            ;;
        py35)
            pyenv install 3.5.6
            pyenv global system 3.5.6
            ;;
        py36)
            pyenv install 3.6.5
            pyenv global system 3.6.5
            ;;
    esac
else
    echo "Python environment already supported on Travis Ubuntu"
fi