self:
	docker run -itv `pwd`/emacs:/root/.emacs \
                     -v `pwd`/zshrc:/root/.zshrc \
                     -v `pwd`/emacs.d/auto-save-list:/root/.emacs.d/auto-save-list \
                     -v `pwd`/emacs.d/config.org:/root/.emacs.d/config.org \
                     -v `pwd`/emacs.d/elpa:/root/.emacs.d/elpa \
                     -v `pwd`/emacs.d/init.el:/root/.emacs.d/init.el \
          biscarch/emacs

org:
	docker run -itv `pwd`/zshrc:/root/.zshrc -v `pwd`/emacs.d:/root/.emacs.d biscarch/emacs
