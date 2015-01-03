FROM haskell:7.8

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get install git zsh -y
RUN apt-get update
RUN apt-get -t wheezy-backports install "emacs24" -y
RUN cabal update && cabal install stylish-haskell
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ADD zshrc /root/.zshrc
ADD emacs /root/.emacs
ADD emacs.d /root/.emacs.d
RUN emacs --batch -f batch-byte-compile ~/.emacs.d/manually/js3-mode/js3.el
ENV PATH /root/.cabal/bin:$PATH
CMD ["zsh"]
