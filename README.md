# fibonacci-image-generator

This ruby script generates mosaics of a given pixel size from an input
image.

## Usage

Requires Bundler.

Make sure your directory contains an image file named `image.jpg` and
run:

```
$ bundle install
$ ./fibig.rb
```

Output mosaics will be named `mosaic_xxx.jpg` where `xxx` is the step in
the `fib` array (see below).

## Interesting variables

This script doesn't accept parameters, so you need to modify the code to
get the desired results.

`fib` is an array containing a fibonacci sequence. Add or remove steps
at will.

`output_width` and `output_height` determine the size of the image
generated.

## Credit

Original idea by David Barreiro
