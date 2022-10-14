# scripts

```sh
GH_SCRIPTS=$HOME/code/github/scripts
export $(grep -v '^#' $GH_SCRIPTS/.env | xargs) # load env vars
export PATH=$GH_SCRIPTS:$PATH
```
