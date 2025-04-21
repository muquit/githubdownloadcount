# github downloads count

A tiny ruby script to show github download counts of a project's binary
assets. I wrote it in ruby after seeing [github-downloads-count](http://mmilidoni.github.io/github-downloads-count/) python script

Requires to install the following gems:

    sudo gem install rest-client
    sudo gem install trollop
    sudo gem install json

# Update

This project is deprected. Please use
[githubdownloadcount-go](https://github.com/muquit/githubdownloadcount-go) instead

# Usage

    $ ./githubdownloadcount.rb --user github-user --project github-project

# Example

    $./githubdownloadcount.rb --user muquit --project hod
    hod-1.7.tar.gz 0 downloads
    hod.exe.zip 1 downloads
    hod_1.7-ubuntu_i386.deb 0 downloads
