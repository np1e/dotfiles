git pull origin master;

function doIt () {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source $HOME/.zshrc;
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt;
else
	read "reply?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $reply =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
