FROM haskell:7.8

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list

# Updates
RUN apt-get update
RUN apt-get install git zsh make graphviz -y

# Install Emacs
RUN apt-get -t wheezy-backports install "emacs24" -y

# Install Stylish-Haskell
RUN cabal update && cabal install stylish-haskell

# Install zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Add custom configs
ADD zshrc /root/.zshrc
ADD emacs.d /root/.emacs.d

# Install js3-mode for JavaScript
RUN git clone https://github.com/thomblake/js3-mode.git ~/.emacs.d/manually/js3-mode
RUN emacs --batch -f batch-byte-compile ~/.emacs.d/manually/js3-mode/js3.el

# make stylish-haskell, etc available on $PATH
ENV PATH /root/.cabal/bin:$PATH

# install structured-haskell-mode
RUN git clone https://github.com/chrisdone/structured-haskell-mode.git ~/.emacs.d/manually/shm
RUN cd ~/.emacs.d/manually/shm && cabal install
RUN cd ~/.emacs.d/manually/shm/elisp && make

# Default to zsh when running a container
CMD ["zsh"]
