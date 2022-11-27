# sessdiff

Very simple use of sessioninfo::session_diff to get directly at package/version differences between sessions

The idea is very simple.  Identical sessions cannot be distinguished.

```
> si = sessioninfo::session_info()

> sessdiff(si, si)
$xonly
character(0)

$yonly
character(0)
```

If one of the sessions has an additional package loaded, we find it:

```
> requireNamespace("parody") # unlikely to be loaded
> si2 = sessioninfo::session_info()

> sessdiff(si, si2)
$xonly
character(0)

$yonly
[1] "parody 1.57.0"
```


