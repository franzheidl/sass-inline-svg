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
As a second parameter, pass a Sass map of replacements:

    .my-thing {
        background-image: inline-svg('my-file.svg', ( fillcolor: '#fff' ));
    }

This will replace all occurences of `fillcolor` in your SVG with `#fff`.

__Note:__ If you use `$`- or `@`-prefixed variable names in your SVG, you'll have to quote the keys in your raplement Sass map:

    .my-thing {
        background-image: inline-svg('my-file.svg', ( '$fillcolor': '#fff' ));
    }

