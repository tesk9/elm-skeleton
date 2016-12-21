## Elm Skeleton

Set up a new Elm project or add a feature to an existing project.

Creates files for Main, Flags, Model, Styles, Update, and View at the location of your choice.

The skeleton produced will be set up to be used as a `programWithFlags`, so will not work with elm-reactor.

It also assumes that the user will be using [rtfeldman's elm-css](http://package.elm-lang.org/packages/rtfeldman/elm-css/latest), and will start a stylesheet with a single container class. This container class will be namespaced to match the path passed to elm-skeleton initially.

### Install:

```
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
