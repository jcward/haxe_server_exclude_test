# haxe_server_exclude_test

This is a simplified testcase of my Haxe/JS modular build system. It makes heavy use of
class exclusion macros to get modular JS output. The issue is when I try to use the
completion server, class definitions are missing.

test.sh automates the test, but it's fairly simple:

Running `haxe build.hxml` without the completion server results in output .js files with each
class (ClassA, ClassB, and Main) defined in its own module, while the majority of the Haxe
standard lib is in lib.js.

Running `haxe --connect 6000 build.hxml` results in the output .js files that are missing
ClassA, ClassB, and Main.

Suspect is the exclusion macros, `--macro exclude` and `--macro excludeFiles`. Presumably
`--next` cleans out these definitions properly without the completion server, but with
the completion server, these excludes are not properly scrubbed between `--next`.
