A nice, colored logger
Implemented using a lightweight resource.

Colored log outputs.

Usage:

    logg "a cyan message by default..."

    logg("a magenta-colored warning...") { level :warn; color :magenta }

    logg("a fatal red log...") { level :fatal; color :red }
