# Sass-Inline-Svg

Inline url-encoded SVG with Sass. Optional variable string replacement included!


## Installation

    gem install sass_inline_svg

Add this line to your application's Gemfile:

    gem 'sass_inline_svg'



## Usage

Sass-inline-svg adds a `inline-svg` function you can use with Sass. It url-encodes the contents of the specified file and inlines it in your CSS.

###Basic

    .my-thing {
        background-image: inline-svg('my-file.svg');
    }

###Replace Variable Strings

Replacing variable strings in SVG when inlining them with Sass makes sense e.g. if you need multiple variants of the same graphic with different fill colors:

![Close Icon Black](close-blk.svg)
![Close Icon Black](close-rd.svg)

With Sass-Inline-Svg you only need one source svg file with a variable string for `fill`:

	…
	<polygon fill="fillcolor" points="29.43 25.19 20.24 16 29.43 6.81 25.19 2.57 16 11.76 6.81 2.57 2.57 6.81 11.76 16 2.57 25.19 6.81 29.44 16 20.24 25.19 29.44 "/>
	…

The variants needed can be created during inlinig with Sass. Pass a Sass map of replacements as a second parameter:

    .my-thing {
        background-image: inline-svg('my-file.svg', ( fillcolor: '#fff' ));
    }

This will replace all occurences of `fillcolor` in your SVG with `#fff`.

__Note:__ If you use `$`- or `@`-prefixed variable names in your SVG, you'll have to quote the keys in your raplement Sass map:

    .my-thing {
        background-image: inline-svg('my-file.svg', ( '$fillcolor': '#fff' ));
    }

