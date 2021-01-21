# Package

version       = "0.1.2"
author        = "CodeHz"
description   = "Sqlite3 bindings for ElementZero project"
license       = "LGPL-3.0"
srcDir        = "."
installExt    = @["nim", "dll"]


# Dependencies

requires "nim >= 1.4.2"
requires "ezutils >= 0.1.0"

before install:
  exec "compile_sqlite3.bat"