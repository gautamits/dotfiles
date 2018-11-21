powerline-all: powerline-tool powerline-fonts powerline-bash powerline-vim
	@echo powerline configured. please relogin
powerline-tool:
	@echo installing powerline
	pip install powerline-status
	@echo powerline tool installed
powerline-fonts:
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	sudo fc-cache -vf /usr/share/fonts/
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
	@echo powerline fonts installed
powerline-bash:
	echo ". ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh" >> ~/.bashrc
	@echo powerline enabled for bash
powerline-vim:
	echo "set rtp+=~/.local/lib/python2.7/dist-packages/powerline/bindings/vim/" >> ~/.vimrc
	echo "set laststatus=2" >> ~/.vimrc
	echo "set t_Co=256" >> ~/.vimrc
oh-my-zsh:
	sudo apt install zsh -y
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo bash
fonts-awesome-terminal:
	git clone https://github.com/gabrielelana/awesome-terminal-fonts.git
	bash awesome-terminal-fonts/install.sh
	fc-cache -fv ~/.fonts
	@echo terminal should now support awesome icons
vte-ng:
	sudo apt install -y g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf build-essential -y
	git clone https://github.com/thestinger/vte-ng.git
	export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
	cd vte-ng && ./autogen.sh && make && sudo make install 
	cd ..
	sudo ldconfig
termite: vte-ng
	git clone --recursive https://github.com/thestinger/termite.git
	cd termite && make && sudo make install
	sudo ldconfig
	sudo mkdir -p /lib/terminfo/x
	sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite

i3-gaps:
	#!/bin/bash
	sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
	# clone the repository
	git clone https://www.github.com/Airblader/i3 i3-gaps
	cd i3-gaps
	# compile & install
	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/
	# Disabling sanitizers is important for release versions!
	# The prefix and sysconfdir are, obviously, dependent on the distribution.
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	$(MAKE)
	sudo $(MAKE) install
polybar-dependencies:
	sudo apt-get install python-xcbgen libxcb-ewmh-dev libxcb-icccm4-dev libxcb1-dev \
xcb-proto libxcb-util-dev libxcb-image0-dev libxcb-randr0-dev libxcb-xkb-dev \
libalsaplayer-dev wireless-tools  libmpdclient-dev libpulse-dev libjsoncpp-dev \
libasound2-dev ibcairo2-dev libcurlpp-dev libiw-dev libcurl4-openssl-dev -y
polybar: polybar-dependencies
	git clone --branch 3.2 --recursive https://github.com/jaagr/polybar
	mkdir polybar/build
	cd polybar/build
	cmake ..
	sudo make install
	cd ..
nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nerd-fonts:
	git clone https://github.com/ryanoasis/nerd-fonts.git
	cd nerd-fonts
	./install.sh
