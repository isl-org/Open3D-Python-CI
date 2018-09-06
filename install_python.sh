#!/bin/bash

# MacOS is Python runtime is not supported on Travis
# We need to install Python manually. See
# https://docs.travis-ci.com/user/multi-os/#python-example-unsupported-languages

- echo "osname in sh" $TRAVIS_OS_NAME
if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    # Install some custom requirements on OS X
    # e.g. brew install pyenv-virtualenv
    brew update
    brew install pyenv

    case "${TOXENV}" in
        py35)
            pyenv install 3.5
            pyenv global system 3.5
            ;;
        py36)
            pyenv install 3.6
            pyenv global system 3.6
            ;;
    esac
else
    echo "Python environment already supported on Travis Ubuntu"
fi