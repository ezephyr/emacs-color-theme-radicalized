Radicalized Colorscheme for Emacs
===============================

Stolen from Ethan Schoonover <es@ethanschoonover.com> by Greg Pfeil <greg@technomadic.org>

Based on the excellent Solarized Theme
------------------------------

Visit the [Solarized homepage]

[Solarized homepage]:    http://ethanschoonover.com/solarized
[color-theme]: http://www.nongnu.org/color-theme

Installation & Usage
--------------------

### Emacs 24

1. Add the `emacs-color-theme-radicalized` directory to your Emacs `custom-theme-load-path`, or install from marmalade using `package-install color-theme-radicalized`
2. Add `(load-theme 'radicalized-[light|dark] t)` to your Emacs init file.
3. Reload the init file, or restart Emacs.

### [color-theme] \(pre-Emacs 24\)

1. Download and install [color-theme].
2. Add the `emacs-color-theme-radicalized` directory to your Emacs `load-path`.
3. Add `(require 'color-theme-radicalized)` to your Emacs init file (usually `~/.emacs`).
3. Reload the init file, or restart Emacs.
4. Use the usual [color-theme] mechanism to select one of the Radicalized themes, or `M-x color-theme-radicalized-[light|dark]`.

Advanced Configuration
----------------------

Radicalized will work out of the box with just the instructions specified above
but does include several variables that can be customized.

    variable name            default   optional
    --------------------------------------------
    radicalized-termcolors =   16    |   256
    radicalized-degrade    =   nil   |   t
    radicalized-bold       =   t     |   nil
    radicalized-underline  =   t     |   nil
    radicalized-italic     =   t     |   nil
    radicalized-contrast   =   normal|   high, low
    radicalized-visibility =   normal|   high, low
    radicalized-broken-srgb=   nil   |   t (see details for Mac behavior)
    --------------------------------------------

### Option Details

*   radicalized-termcolors

    This is set to *16* by default, meaning that Radicalized will attempt to use
    the standard 16 colors of your terminal emulator, assuming that you've set
    these colors to the correct Radicalized values either manually or by
    importing one of the many colorscheme available for popular terminal
    emulators and Xdefaults.
    If you don't want to use the Radicalized colors via the terminal
    emulator's palette, you can set this to *256*, which will use a degraded
    version of the Radicalized palette by displaying the closest colors in
    the terminal's default 256 colors as shown in [Xterm's color
    chart](http://en.wikipedia.org/wiki/File:Xterm_color_chart.png).

*   radicalized-degrade

    For test purposes only; in GUI mode, this forces Radicalized to use the 256
    degraded color mode to test the approximate color values for accuracy.

*   radicalized-bold | radicalized-underline | radicalized-italic

    If you wish to stop Radicalized from displaying bold, underlined or
    italicized typefaces, simply set the appropriate variable to `nil`.

*   radicalized-contrast

    Stick with normal! It's been carefully tested. Setting this option to high
    or low does use the same Radicalized palette but simply shifts some values
    up or down in order to expand or compress the tonal range displayed.

*   radicalized-visibility

    Special characters such as trailing whitespace, tabs, newlines, when
    displayed using `:set list` can be set to one of three levels depending on
    your needs. Default value is `normal` with `high` and `low` options.

*   radicalized-broken-srgb

    Emacs [bug #8402](http://debbugs.gnu.org/cgi/bugreport.cgi?bug=8402)
    results in incorrect color handling on Macs. If this is `t` (the default
    on Macs), Radicalized works around it with alternative colors. However,
    these colors are not totally portable, so you may be able to edit the
    "Gen RGB" column in `radicalized-definitions.el` to improve them further.

Code Notes
----------

I have attempted to modularize the creation of Emacs colorschemes in this script and, while it could be refactored further, it should be a good foundation for the creation of any color scheme. By simply changing the values in the `radicalized-colors` table in `radicalized-definitions.el` and testing in a GUI Emacs, you can rapidly prototype new colorschemes without diving into the weeds of line-item editing each syntax highlight declaration.

The Values
----------

L\*a\*b values are canonical (White D65, Reference D50), other values are
matched in sRGB space.

    RADICALIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
    --------- ------- ---- -------  ----------- ---------- ----------- -----------
    base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
    base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
    base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
    base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
    base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
    base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
    base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
    base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
    yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
    orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
    red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
    magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
    violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
    blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
    cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
    green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60

### Bug Reporting

Here are some things to keep in mind when submitting a bug report:

*   include the output of `M-x version` in your report,
*   mention whether you’re using color-theme or the Emacs 24 theme,
*   include the names of Emacs faces that you have a problem with (`M-: (face-at-point)` and `M-x describe-face` will tell you the name of the face at point),
*   include the output of `M-: (display-color-cells)` (that lets us know which set of colors your Emacs is using),
*   screenshots are very helpful (before and after if you made a change),
*   if you’re using a terminal, the name of the terminal and (if you can find out) the number of colors the terminal app is using,
*   also if you’re using a terminal, try running Emacs in GUI mode, and see if the problem exists there (if it does, report the bug that way, if not, just mention that it’s a terminal-only bug),
*   it’s very helpful (but not expected) if you can compare it to a similar situation in VIM (especially if you know the VIM highlight name or have a screenshot), and
*  `M-x customize-apropos-faces` can help you find all the relevant faces if you are submitting faces for a mode.
