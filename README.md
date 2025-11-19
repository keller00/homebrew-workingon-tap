# Keller00 Workingon-tap

## How do I install these formulae?

`brew install keller00/workingon-tap/<formula>`

Or `brew tap keller00/workingon-tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "keller00/workingon-tap"
brew "<formula>"
```

## How to do a new release

After `workingon` was released in GitHub copy the `.tar.gz` URL and run:

```shell
brew bump-formula-pr workingon --url <url> --write-only
```

Then open PR, let tests finish and label the PR with `pr-pull`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
