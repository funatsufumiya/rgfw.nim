import rgfw

proc keyCallback(win: ptr RGFW_window, key: uint32, keyChar: uint32,
                keyName: array[16, char], lockState: uint8, pressed: uint8) {.cdecl.} =
  if key == RGFW_Escape and pressed == 1:
    RGFW_window_setShouldClose(win)

let window = RGFW_createWindow("Hello RGFW", RGFW_rect(x: 0, y: 0, w: 1024, h: 768), RGFW_CENTER)
if window == nil:
  quit(1)

RGFW_setKeyCallback(keyCallback)

while not RGFW_window_shouldClose(window):
  discard RGFW_window_checkEvent(window)

RGFW_window_close(window)