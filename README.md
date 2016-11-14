# octo
octo - a simple (pseudo) package manager based off of the ports concept.

# how to build?
technically you COULD use octo without ever building it, but thats highly discouraged.
to build octo from source you can use `sudo shc -f octo.sh -o octo && cp octo /bin`
<br>
after building octo and installing it to `/bin` you still need to set your `$OCTODIR` variable *permenantly*
by doing this:

`sudo mkdir <directory> && sudo echo "export OCTODIR=<directory path>" >> ~/.bash_profile && sudo echo "export OCTODIR=<directory path>" >> /root/.bash_profile` (directory obviously meaning the directory you want to keep you package source at)

# what's coming next?
well, right now I'm working on actually setting up a web based package repository with someone else.
I'm not gonna give away specifics, but it's gonna be really cool. I'm also going to work on porting octo.sh to Python, and adding more features (like command line flags, deleting packages, updating packages, etc). I'm also going to move to a new domain for the project homepage (preferably octo.pw), and I'll be moving away from Jekyll in favour of actual html and CSS.
