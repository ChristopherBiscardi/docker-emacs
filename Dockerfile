FROM haskell:7.10

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list

# Updates
RUN apt-get update
RUN apt-get install curl git zsh make graphviz bzip2 -y
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# clone nvm/node
RUN git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
RUN source /root/.nvm/nvm.sh && \
    nvm install v0.10.38 && \
    nvm alias default v0.10.38 && \
    npm install -g eslint babel-eslint
# Install Emacs
RUN apt-get install "emacs24" -y

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

# install sbcl
RUN curl -O http://prdownloads.sourceforge.net/sbcl/sbcl-1.2.11-x86-64-linux-binary.tar.bz2
RUN cd /opt && bzip2 -cd sbcl-1.2.11-x86-linux-binary.tar.bz2 | tar xvf -
RUN ./opt/sbcl-1.2.11-x86-linux-binary/install

# Default to zsh when running a container
CMD ["zsh"]
