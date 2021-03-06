## Elm Skeleton

![](https://travis-ci.org/tesk9/elm-skeleton.svg?branch=master)

Set up a new Elm project or add a feature to an existing project.

The skeleton produced will be set up to be used as a `programWithFlags`, so will not work with elm-reactor.

### Install:

```
$ npm install -g elm-move
$ npm install -g elm-skeleton
```

### To Use:

#### For a new project

```
$ elm-skeleton BrandNewProject
```

Verify that the path and namespace are correct when prompted, and then include the new elm-package.json.

#### For building on an existing project

A larger project might have many elm-architecture-adherent folders and files.

Supposing the following folder structure, let's add another feature to `Miscellany/Doohickeys`.

```
assets
|
|-- elm
|    |
|    |-- Widgets
|    |
|    |-- Miscellany
|    |    |
|    |    |-- Doohickeys
|    |
...
```


```
$ cd assets/elm
$ elm-skeleton Miscellany/Doohickeys/Whatsit
```

Verify that the prompt and namespace are correct when prompted.

```
Creating a new elm skeleton
Path: Miscellany/Doohickeys/Whatsit
Namespace: Miscellany-Doohickeys-Whatsit
Are the path and namespace correct?
1) Yes
2) No
#?
```

Notice that the namespace we'll be using for the stylesheet matches the directory.

Do not add a new elm-package.json.
