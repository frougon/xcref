# `xcref` — Extension of `cleveref` for non-English languages

## Abstract

In non-English languages, words such as prepositions and articles need to be
adapted in function of the noun they are used with, as well as possibly in
function of cases such as nominative, accusative, dative, and genitive as used
in German. As far as I know, these are things that the `cleveref` package does
not allow to do in any practical way, short of programming it. This package
works on top of `cleveref` and, given language-specific knowledge as well as
additional user input (at least to select a preposition), it makes it possible
to produce references that cope with the various forms of ancillary words such
as articles and prepositions, and don't break when the underlying noun is
changed (for instance, from chapter to section or theorem to proposition).

## Release notes

This is an alpha release. Some interfaces may change if they prove to be
suboptimal. The documentation isn't finished. The code has received reasonable
testing but might still have bugs.

If you think the interface (API) could be improved, please submit your ideas.
If you are a native speaker of one of the languages for which a
language-specific module is already implemented and you discover that `xcref`
needs more language-specific data, please submit it. For instance,
`xcref-ngerman.tex` created from `xcref.dtx` has code such as:

```
\prop_set_from_keyval:Nn \l_@@_ngerman_article_and_prep_prop
  {
    an~dem = am,
    in~dem = im,
    von~dem = vom,
    zu~dem = zum,
    zu~der = zur,
    bei~dem = beim,
  }
```

These kinds of variables are starting points but may need to be completed. My
mother tongue is French; the data I wrote for German might have mistakes.

Finally, if you want to write a language-specific module for a new language,
read the `french` and `ngerman` modules extracted from `xcref.dtx`. Both have
a similar structure, but the former is probably a bit simpler.

## Documentation

The `xcref` manual can be produced by running `l3build doc` from the directory
containing `build.lua` and `xcref.dtx`. The result is an `xcref.pdf` file. It
is not complete yet, but along with the `.tex` files present in the `examples`
directory, that should be enough to get you started.

## Installation

`xcref` can be installed to a suitable place under `TEXMFHOME` with the
command `l3build install`. For more details, read the corresponding section of
the `xcref` manual (see above).

## License

`xcref` may be distributed and/or modified under the conditions of the LaTeX
Project Public License, either version 1.3 of this license or (at your option)
any later version. See the `LICENSE` file for the complete text of this
license.

## History

Writing of this package was triggered by [this TeX.SE question][question],
although I had already felt the need for something like that long ago. In
fact, I've never used `cleveref` for myself in a document, because the lacking
features make it almost useless for writing in French, in my opinion (it is
possible, but you have to restrict yourself to the same article-less,
inelegant way of citing references, or you lose the ability to change
reference names without breaking the surrounding text). However, with
appropriate wrapping code—which `xcref` attempts to provide—the missing
features can be added on top of `cleveref`.

`xcref` could be made to work without `cleveref`, but the latter does a nice
job at compressing references in a language-dependent way, therefore I took
the shortest path to benefit from this feature, which was to work on top of
`cleveref`.

  [question]: https://tex.stackexchange.com/q/505792/73317
