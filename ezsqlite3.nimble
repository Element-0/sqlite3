# Package

version       = "0.1.1"
author        = "CodeHz"
description   = "Sqlite3 bindings for ElementZero project"
license       = "LGPL-3.0"
srcDir        = "."
installDirs   = @["dist"]


# Dependencies

requires "nim >= 1.4.2"
requires "ezutils >= 0.1.0"

before install:
  exec "compile_sqlite3.bat"