self:
	docker run -itv `pwd`/emacs:/root/.emacs -v `pwd`/zshrc:/root/.zshrc -v `pwd`/emacs.d:/root/.emacs.d biscarch/emacs

org:
	docker run -itv `pwd`/zshrc:/root/.zshrc -v `pwd`/emacs.d:/root/.emacs.d biscarch/emacs
