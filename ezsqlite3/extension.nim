import std/[dynlib, strformat, strutils]
import ./bindings

proc loadExtension*(name: string) =
  let lib = loadLib(fmt"{name}.dll")
  if lib == nil:
    raise newException(LibraryError, "could not found library: " & name)
  let lower = name.toLowerAscii()
  let sym = lib.checkedSymAddr(fmt"sqlite3_{lower}_init")
  let tmp = sqlite3_auto_extension(sym)
  if tmp != sr_ok:
    raise newSQLiteError tmp
