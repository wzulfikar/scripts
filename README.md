# Scripts

Collection of scripts I use often. Installation:

1. Clone the repo somewhere (eg. `~/code/scripts`):

   ```sh
   git clone --depth 1 https://github.com/wzulfikar/scripts ~/code
   ```

2. Add the scripts into your `PATH` (eg. in `~/.bashrc` or `~/.zshrc`):

   ```sh
   GH_SCRIPTS=$HOME/code/github/scripts
   export $(grep -v '^#' $GH_SCRIPTS/.env | xargs) # load env vars
   export PATH=$GH_SCRIPTS:$PATH
   ```

3. Run `eq` for test run (it checks if two values match):
   ```sh
   eq 123 123
   ```

## Patterns

- Use `hash ...` to check dependencies before running the script:

  ```sh
  hash gh 2>/dev/null || { echo "ERROR: missing dependencies: 'gh'" && exit 1; } # check dependencies

  # ... run the actual script
  ```

  Example: `gistup`, `collate`

- Use `$(basename $0)` to display the script name:

  ```sh
  if [ -z "$1" ] || [ "$1" = "-h" ]; then
    echo "$(basename $0) – converts given file (.mov, .gif, etc.) to .mp4 using ffmpeg."
    # ...
  fi
  ```

  Example: `makemp4`, `makegif`
