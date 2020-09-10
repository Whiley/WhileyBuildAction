# WhileyBuildAction

A Github action for building Whiley project repositories.  You can example repositories using the action [here](https://github.com/Whiley/STD.wy/) and [here](https://github.com/DavePearce/Conway.wy).

## Example

To add a build action to your Whiley project, create a file
`.github/workflows/main.yml` as follows:

```
on: push

jobs:
   build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Build Whiley Project
        uses: Whiley/WhileyBuildAction@v1
```

This signals the action to run whenever someone pushes to your
repository.

### Version

By default, the action uses the latest version of the
[WhileyDevelopmentKit](https://github.com/Whiley/WhileyDevelopmentKit).
However, you can specify a specific version if you want stability.  To
do this, add a `with` clause as follows:


```
        ...
        uses: Whiley/WhileyBuildAction@v1
        with:
          version: 'v0.5.0'
```

### QuickCheck

By default, QuickCheck for Whiley is not enabled to run on your
repository.  However, you can signal this to run by adding a `with`
clause as follows:

```
        ...
        uses: Whiley/WhileyBuildAction@v1
        with:
          checking: true
```
