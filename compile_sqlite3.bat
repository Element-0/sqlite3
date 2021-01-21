@echo off
setlocal
set DISTFILE=sqlite3.dll
if exist %DISTFILE% (
  echo skipped
  exit
)
clang-cl ^
  -m64 -MD -O1 -Qvec -Wno-deprecated-declarations ^
  -DSQLITE_API=__declspec(dllexport) ^
  -DSQLITE_DQS=0 ^
  -DSQLITE_THREADSAFE=0 ^
  -DSQLITE_DEFAULT_MEMSTATUS=0 ^
  -DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1 ^
  -DSQLITE_LIKE_DOESNT_MATCH_BLOBS=1 ^
  -DSQLITE_MAX_EXPR_DEPTH=0 ^
  -DSQLITE_OMIT_DEPRECATED ^
  -DSQLITE_OMIT_PROGRESS_CALLBACK ^
  -DSQLITE_OMIT_SHARED_CACHE ^
  -DSQLITE_USE_ALLOCA ^
  -DSQLITE_OMIT_AUTOINIT ^
  -DSQLITE_OMIT_DEPRECATED ^
  -DSQLITE_WIN32_MALLOC ^
  -DSQLITE_ENABLE_FTS5 ^
  -DSQLITE_ENABLE_JSON1 ^
  -DSQLITE_ENABLE_RTREE ^
  -DSQLITE_ENABLE_SNAPSHOT ^
  -DSQLITE_DISABLE_LFS ^
  -DSQLITE_DISABLE_DIRSYNC ^
  /LD ^
  /Fe%DISTFILE% ^
  deps/sqlite3.c deps/sqlite3init.c