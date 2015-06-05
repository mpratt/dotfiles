# Vindle on Linux
## Quick Start

1. Introduction:

   Installation requires [Git] and triggers [`git clone`] for each configured repository to `~/.vim/bundle/` by default.
   Curl is required for search.

   If you are using Windows, go directly to [Windows setup]. If you run into any issues, please consult the [FAQ].
   See [Tips] for some advanced configurations.

2. Set up [Vundle]:

   `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

#Vundle on Windows
## Requirements
1. [Git]
2. [Curl]

### Git on Windows

Thanks to [msysgit] installation is trivial:

1. Download [msysgit installer]
2. run downloaded installer and follow instructions
    It's important to configure `PATH` environment variable properly.
    That's why it's recommended to select *Run git from Windows command prompt* option, as shown:
    ![add git to PATH](https://lh6.googleusercontent.com/_SriKiRB4s00/TaJ0MBL7HwI/AAAAAAAAHN0/THGn03fvNkg/msysgit.png)

After installation try running `git --version` within _command prompt_ (press Win-R,  type `cmd`, press Enter) to make sure all good:

```
C:\> git --version
git version 1.7.4.msysgit.0
```

### Curl on Windows

Installing Curl on Windows is easy as [Curl] is bundled with [msysgit]!
But before it can be used with [Vundle] it's required make `curl` run in _command prompt_.
The easiest way is to create `curl.cmd` with [this content](https://gist.github.com/912993)

```
@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
@set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@curl.exe %*
```

And copy it to `C:\Program Files\Git\cmd\curl.cmd`, assuming [msysgit] was installed to `c:\Program Files\Git`

to verify all good, run:

```
C:\> curl --version
curl 7.21.1 (i686-pc-mingw32) libcurl/7.21.1 OpenSSL/0.9.8k zlib/1.2.3
Protocols: dict file ftp ftps http https imap imaps ldap ldaps pop3 pop3s rtsp smtp smtps telnet tftp
Features: Largefile NTLM SSL SSPI libz
```

## Vundle on Windows

### Different File Names

By default, Vim on Windows will still look for `.vimrc` and install to `~/.vim`. Since this isn't standard on Windows (you would have to enable hidden files) an alternative is to use _ files. That means instead of having a `.vimrc` file it will be a `_vimrc` in your home. Instead of `.vim`, we usually use a folder called `vimfiles`.

To make these changes, open the cmd prompt or msysgit bash and execute the following lines. If you do not have gvim on your path, use vim instead.

```
cd %USERPROFILE%
git clone https://github.com/gmarik/Vundle.vim.git vimfiles/bundle/Vundle.vim
gvim _vimrc
```

### Edit The Config For Windows
From here, go to step 3 in the [quick start] and copy the sample config of [Vundle] into the `_vimrc` file. Importantly, you must change the text below...

```vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
```

into

```vim
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
```

Now return to the [quick start] and follow step 4 to continue using [Vundle]. If you run into any problems, see the [FAQ].

## Trailing slash issue

Sometimes `Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}` may not work for you. Note the `vim/` part. The trailing slash causes Vim on windows to not load the plugin and may affect others.
The fix is simple; change it to:

    Bundle 'rstacruz/sparkup', {'rtp': 'vim'}

See [#193](https://github.com/gmarik/Vundle.vim/issues/193) for more details.


[Vundle]:https://github.com/gmarik/Vundle.vim
[FAQ]:https://github.com/gmarik/Vundle.vim/wiki
[quick start]:https://github.com/gmarik/Vundle.vim#quick-start
[Git]:http://git-scm.com
[Curl]:http://curl.haxx.se
[msysgit]:http://msysgit.github.io/
[msysgit installer]:https://github.com/msysgit/msysgit/releases/download/Git-1.9.2-preview20140411/Git-1.9.2-preview20140411.exe
