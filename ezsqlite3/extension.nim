import std/[os, dynlib, strformat, strutils, options]
import ezutils/matching
import ./bindings

proc loadExtension*(path: string; name: Option[string] = none string) =
  let lib = loadLib(path)
  if lib == nil:
    raise newException(LibraryError, "could not found library: " & path)
  (name: @exname) := splitFile path
  let lower = name.get(exname).toLowerAscii()
  let sym = lib.checkedSymAddr(fmt"sqlite3_{lower}_init")
  let tmp = sqlite3_auto_extension(sym)
  if tmp != sr_ok:
    raise newSQLiteError tmp
