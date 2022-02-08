# cdotfis

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

You can add shell scripts to the `scripts` folder that will be run at the end of `bootstrap.sh`. By default, `sadedot/scripts/bootstrap.sh` will not run these scripts, so you will need to use the `-p` flag if you want them to run.

## Contributing <a name="contributing"></a>
PRs are welcome.

## License <a name="license"></a>
[MIT](https://raw.githubusercontent.com/santilococo/cdotfis/master/LICENSE.md)

[1]: https://github.com/santilococo/cdotfis/fork
[2]: https://github.com/santilococo/cdotfis/tree/master/dotfiles/other
[3]: https://github.com/santilococo/sadedot

