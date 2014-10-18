FROM debian:jessie

RUN apt-get update
RUN apt-get install emacs git zsh -y
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ADD zshrc /root/.zshrc
ADD emacs /root/.emacs
ADD emacs.d /root/.emacs.d
CMD ["zsh"]
