# makeboot
Simple tool for making a [Chez Scheme](https://github.com/cisco/ChezScheme) boot file using Chez Scheme itself. Not intended to be run under other flavors of Scheme.

## Setting up
Uses [Akku](https://akkuscm.org/) (the Scheme package manager), so install that on your system first.

After cloning the repository and navigating to the directory you placed it in,
```sh
akku install # install dependencies
```

If you'd like to install for use on the command line, the way I would recommend is creating a symlink to `run.sh` and placing that link somewhere registered in your PATH. I personally placed a link under my home directory at `~/.local/bin/` (and I named the link `makeboot` so I can use it as below), but anywhere and any name will work just fine as long as it's registered on your PATH.

`bin/makeboot.sps` depends on `scheme-script` being available on your PATH to run directly. `scheme-script` should be equivalent to `scheme --script`. If you have multiple flavors of Scheme available on your system, or for some other reason would prefer not to make `scheme-script` available on your PATH, modify `run.sh` to call `<path/to/chezscheme> --script bin/makeboot.sps "$@"` instead of `bin/makeboot.sps "$@"`.

## Usage
Assuming you have placed a symlink to `run.sh` somewhere accessible to your PATH and named it `makeboot`,
```
makeboot scheme|petite path_to_new_bootfile paths_to_sources_or_objects...
```
So, if you want a boot file dependent on the full Chez Scheme image named `magic.boot` using the source files `magic0.ss`, `magic1.ss`, `magic2.ss`:
```sh
makeboot scheme magic.boot magic0.ss magic1.ss magic2.ss
```
You can also use paths for any of these filenames.