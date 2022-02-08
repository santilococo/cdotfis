# dotfiles

Personal dotfiles saved and deployed using [sadedot][3].

## Table of contents
  - [Installation <a name="installation"></a>](#installation-)
  - [Usage <a name="usage"></a>](#usage-)
  - [Contributing <a name="contributing"></a>](#contributing-)
  - [License <a name="license"></a>](#license-)

## Installation <a name="installation"></a>

[Fork][1] this repository and clone it running:

```bash
git clone --recursive ${REPO_URL}
```

where `${REPO_URL}` is your github repository remote url (HTTPS or SSH). For example, in my case:

```bash
git clone --recursive git@github.com:santilococo/cdotfis.git
```

## Usage <a name="usage"></a>

You have to move all your dotfiles to the dotfiles folder and then a `sadedot` script will do the symbolic links. Doing it this way, you can now upload them to your repository (to have a backup of them).

You should note that all these dotfiles (files or folders) will be symlinked in `$HOME`. So, if you want to symlink, for example, something in `/etc`, you have to put it in the `dotfiles/other` folder. Here you have to be careful as they will be installed in `/`. You can see an example [here][2].

So, to run the script:

```bash
sh sadedot/scripts/bootstrap.sh
```

You can modify the `sadedot/scripts/install.sh` if you want to install some programs on your machine when this script is run. By default, `sadedot/scripts/bootstrap.sh` will not run this script, so you will need to use the `-p` flag if you want it to run `sadedot/scripts/install.sh` (it will run at the end of the script).

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/dotfiles/master/LICENSE.md)

[1]: https://github.com/santilococo/dotfiles/fork
[2]: https://github.com/santilococo/dotfiles/tree/master/dotfiles/other
[3]: https://github.com/santilococo/sadedot

