# Subliminal Vim

> A drop-in replacement for Sublime Text based on vim and urxvt

[![Join the chat at https://gitter.im/LuisAlejandro/subliminal-vim](https://badges.gitter.im/LuisAlejandro/subliminal-vim.svg)](https://gitter.im/LuisAlejandro/subliminal-vim)

<img align="right" height="260" src="https://cloud.githubusercontent.com/assets/324683/14374725/0a483732-fd23-11e5-9b56-b0e280b20760.png">

---

Attention: this in an alpha release. Don't use it on production environments as you will probably experience bugs.

Subliminal Vim is a group of Vim plugins and configurations designed to resemble the appeareance and functionality of Sublime Text. Its main purpose is to make users from Sublime to be more comfortable using Vim and perhaps encourage them to switch IDE environments in the future.

Subliminal Vim needs a graphical interface to work because we need urxvt for proper key shorcuts, but in the future this might change. This means it won't work on server environments, sorry. Subliminal Vim ships as a separate binary and does not integrate with Vim (yet). See Usage for details.

Also, for now we are only supporting Debian-based systems on the installation script, but you might want to try installing on a different OS and tell us how you you did it, or submit a greatly appreciated PR.


## Features

* Sublime Text key shorcuts.
* Syntax highlighting of popular languages.
* Integrated linting for Python, Perl, Javascript, Go, Haskell & more.


## Installation

1. First we're going to install the dependencies needed for the installation script to run properly. Open a root terminal and type the following command:

    apt-get install make sudo

2. Next, we have to clone Sublime Vim repository from github with the following command. Remember to previously put the prompt on an appropiate folder and be logged in with your user.

    git clone https://github.com/LuisAlejandro/subliminal-vim

3. Finally, start the installation process with the following commands. This will take a few minutes to complete depending on your internet connection speed.

    make
    make install


## Usage

You can click on Subliminal Vim's icon on the menu or execute it on console by typing `subliminal-vim`.


## License

Copyright (C) 2016 Sublime Vim Developers

Please refer to CONTRIBUTORS.md for a complete list of Copyright holders.

Sublime Vim is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Sublime Vim is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
