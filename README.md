# Babel-Node Base

Simple repository to reduce some boilerplate. Check the `package.json` for some simple scripts.

# Docker

## Build

In the cloned root directory:

```shell
docker build -t username/babel-node-base .
```

You can tag the image with whatever name you'd like.

## Run Image

After you build the image you can run:

```shell
docker run -d -it -v $(pwd):/home/app/src -p 3000:3000 your/image
```

`babel-watch` will reload the `src` file changes.
