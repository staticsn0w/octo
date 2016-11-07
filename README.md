# octo
octo - a simple (pseudo) package manager based off of the ports concept.

# how to build?
technically you COULD use octo without ever building it, but thats highly discouraged.
to build octo from source you can use `sudo shc -f octo.sh -o octo && cp octo /bin`
<br>
after building octo and installing it to `/bin` you still need to set your `$OCTODIR` variable *permenantly*
by doing this:

`sudo mkdir <directory> && sudo echo "export OCTODIR=<directory path>" >> ~/.bash_profile && sudo echo "export OCTODIR=<directory path>" >> /root/.bash_profile`
