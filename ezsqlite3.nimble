# Package

version       = "0.1.4"
author        = "CodeHz"
description   = "Sqlite3 bindings for ElementZero project"
license       = "LGPL-3.0"
srcDir        = "."
installExt    = @["nim", "dll", "pdb"]


# Dependencies

requires "nim >= 1.4.2"
requires "ezutils >= 0.1.0"

before install:
  exec "cl @compile_options.txt -Fesqlite3.dll deps/sqlite3.c deps/sqlite3init.c"