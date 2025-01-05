{.deadCodeElim: on.}

when defined(windows):
  {.passL: "-lopengl32 -lwinmm -lshell32 -lgdi32".}
elif defined(linux):
  {.passL: "-lX11 -lXrandr -lGL -lm".}
elif defined(macosx):
  {.passL: "-framework Foundation -framework AppKit -framework OpenGL -framework IOKit".}

type
  RGFW_rect* = object
    x*, y*, w*, h*: cint

  RGFW_window* = object
    src*: TRGFW_window_src

  TRGFW_window_src* = object
      window*: pointer
      display*: pointer

  KeyCallback* = proc(win: ptr RGFW_window, key: uint32, keyChar: uint32, 
                     keyName: array[16, char], lockState: uint8, pressed: uint8) {.cdecl.}
  
  WindowResizeCallback* = proc(win: ptr RGFW_window, rect: RGFW_rect) {.cdecl.}

const
  # Window creation flags
  RGFW_CENTER* = 1'u16 shl 10
  RGFW_TRANSPARENT_WINDOW* = 1'u16 shl 9
  RGFW_NO_BORDER* = 1'u16 shl 3
  RGFW_NO_RESIZE* = 1'u16 shl 4
  RGFW_ALLOW_DND* = 1'u16 shl 5
  RGFW_HIDE_MOUSE* = 1'u16 shl 6
  RGFW_FULLSCREEN* = 1'u16 shl 8
  RGFW_OPENGL_SOFTWARE* = 1'u16 shl 11
  RGFW_COCOA_MOVE_TO_RESOURCE_DIR* = 1'u16 shl 12
  RGFW_SCALE_TO_MONITOR* = 1'u16 shl 13
  RGFW_NO_INIT_API* = 1'u16 shl 2
  RGFW_NO_GPU_RENDER* = 1'u16 shl 14
  RGFW_NO_CPU_RENDER* = 1'u16 shl 15
  RGFW_WINDOW_HIDE* = 1'u16 shl 16
  
  # Key codes
  RGFW_KEY_NULL* = 0'u32
  RGFW_Escape* = '\033'
  RGFW_Backtick* = '`'
  RGFW_0* = '0'
  RGFW_1* = '1'
  RGFW_2* = '2'
  RGFW_3* = '3'
  RGFW_4* = '4'
  RGFW_5* = '5'
  RGFW_6* = '6'
  RGFW_7* = '7'
  RGFW_8* = '8'
  RGFW_9* = '9'
  RGFW_Minus* = '-'
  RGFW_Equals* = '='
  RGFW_BackSpace* = '\b'
  RGFW_Tab* = '\t'
  RGFW_Space* = ' '
  RGFW_a* = 'a'
  RGFW_b* = 'b'
  RGFW_c* = 'c'
  RGFW_d* = 'd'
  RGFW_e* = 'e'
  RGFW_f* = 'f'
  RGFW_g* = 'g'
  RGFW_h* = 'h'
  RGFW_i* = 'i'
  RGFW_j* = 'j'
  RGFW_k* = 'k'
  RGFW_l* = 'l'
  RGFW_m* = 'm'
  RGFW_n* = 'n'
  RGFW_o* = 'o'
  RGFW_p* = 'p'
  RGFW_q* = 'q'
  RGFW_r* = 'r'
  RGFW_s* = 's'
  RGFW_t* = 't'
  RGFW_u* = 'u'
  RGFW_v* = 'v'
  RGFW_w* = 'w'
  RGFW_x* = 'x'
  RGFW_y* = 'y'
  RGFW_z* = 'z'
  RGFW_Period* = '.'
  RGFW_Comma* = ','
  RGFW_Slash* = '/'
  RGFW_Bracket* = '{'
  RGFW_CloseBracket* = '}'
  RGFW_Semicolon* = ';'
  RGFW_Apostrophe* = '\''
  RGFW_BackSlash* = '\\'
  RGFW_Return* = '\n'
  RGFW_Delete* = '\177'
  RGFW_F1* = 128'u8
  RGFW_F2* = 129'u8
  RGFW_F3* = 130'u8
  RGFW_F4* = 131'u8
  RGFW_F5* = 132'u8
  RGFW_F6* = 133'u8
  RGFW_F7* = 134'u8
  RGFW_F8* = 135'u8
  RGFW_F9* = 136'u8
  RGFW_F10* = 137'u8
  RGFW_F11* = 138'u8
  RGFW_F12* = 139'u8
  RGFW_CapsLock* = 140'u8
  RGFW_ShiftL* = 141'u8
  RGFW_ControlL* = 142'u8
  RGFW_AltL* = 143'u8
  RGFW_SuperL* = 144'u8
  RGFW_ShiftR* = 145'u8
  RGFW_ControlR* = 146'u8
  RGFW_AltR* = 147'u8
  RGFW_SuperR* = 148'u8
  RGFW_Up* = 149'u8
  RGFW_Down* = 150'u8
  RGFW_Left* = 151'u8
  RGFW_Right* = 152'u8
  RGFW_Insert* = 153'u8
  RGFW_End* = 154'u8
  RGFW_Home* = 155'u8
  RGFW_PageUp* = 156'u8
  RGFW_PageDown* = 157'u8
  RGFW_Numlock* = 158'u8
  RGFW_KP_Slash* = 159'u8
  RGFW_Multiply* = 160'u8
  RGFW_KP_Minus* = 161'u8
  RGFW_KP_1* = 162'u8
  RGFW_KP_2* = 163'u8
  RGFW_KP_3* = 164'u8
  RGFW_KP_4* = 165'u8
  RGFW_KP_5* = 166'u8
  RGFW_KP_6* = 167'u8
  RGFW_KP_7* = 168'u8
  RGFW_KP_8* = 169'u8
  RGFW_KP_9* = 170'u8
  RGFW_KP_0* = 171'u8
  RGFW_KP_Period* = 172'u8
  RGFW_KP_Return* = 173'u8
  RGFW_final_key* = 174'u8
  
  # Mouse buttons
  RGFW_MOUSE_LEFT* = 1'u8
  RGFW_MOUSE_MIDDLE* = 2'u8
  RGFW_MOUSE_RIGHT* = 3'u8

{.emit: """
#define RGFW_IMPLEMENTATION
#define RGFW_NO_API
#define RGFWDEF
#include "RGFW.h"
""".}

{.push importc, cdecl.}

proc RGFW_createWindow*(title: cstring, rect: RGFW_rect, flags: uint16): ptr RGFW_window
proc RGFW_window_close*(window: ptr RGFW_window)
proc RGFW_window_checkEvent*(window: ptr RGFW_window): bool
proc RGFW_window_shouldClose*(window: ptr RGFW_window): bool
proc RGFW_window_setShouldClose*(window: ptr RGFW_window)
proc RGFW_setKeyCallback*(callback: KeyCallback)
proc RGFW_setWindowResizeCallback*(callback: WindowResizeCallback)

{.pop.}