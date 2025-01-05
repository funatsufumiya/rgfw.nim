# Package
version       = "1.06.001"
author        = "Fumiya Funatsu"
description   = "Nim bindings for RGFW"
license       = "MIT"

skipDirs      = @["examples"]

# Dependencies
requires "nim >= 1.6.0"

# Include RGFW.h header file
installFiles = @["RGFW.h"]