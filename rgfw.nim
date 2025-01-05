{.deadCodeElim: on.}

when defined(windows):
  {.passL: "-lopengl32 -lwinmm -lshell32 -lgdi32".}
elif defined(linux):
  {.passL: "-lX11 -lXrandr -lGL -lm".}
elif defined(macosx):
  {.passL: "-framework Foundation -framework AppKit -framework OpenGL -framework IOKit".}

from os import splitPath
{.passC:"-I" & currentSourcePath().splitPath.head .}

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
  RGFW_Escape* = cast[uint32]('\033')
  RGFW_Backtick* = cast[uint32]('`')
  RGFW_0* = cast[uint32]('0')
  RGFW_1* = cast[uint32]('1')
  RGFW_2* = cast[uint32]('2')
  RGFW_3* = cast[uint32]('3')
  RGFW_4* = cast[uint32]('4')
  RGFW_5* = cast[uint32]('5')
  RGFW_6* = cast[uint32]('6')
  RGFW_7* = cast[uint32]('7')
  RGFW_8* = cast[uint32]('8')
  RGFW_9* = cast[uint32]('9')
  RGFW_Minus* = cast[uint32]('-')
  RGFW_Equals* = cast[uint32]('=')
  RGFW_BackSpace* = cast[uint32]('\b')
  RGFW_Tab* = cast[uint32]('\t')
  RGFW_Space* = cast[uint32](' ')
  RGFW_a* = cast[uint32]('a')
  RGFW_b* = cast[uint32]('b')
  RGFW_c* = cast[uint32]('c')
  RGFW_d* = cast[uint32]('d')
  RGFW_e* = cast[uint32]('e')
  RGFW_f* = cast[uint32]('f')
  RGFW_g* = cast[uint32]('g')
  RGFW_h* = cast[uint32]('h')
  RGFW_i* = cast[uint32]('i')
  RGFW_j* = cast[uint32]('j')
  RGFW_k* = cast[uint32]('k')
  RGFW_l* = cast[uint32]('l')
  RGFW_m* = cast[uint32]('m')
  RGFW_n* = cast[uint32]('n')
  RGFW_o* = cast[uint32]('o')
  RGFW_p* = cast[uint32]('p')
  RGFW_q* = cast[uint32]('q')
  RGFW_r* = cast[uint32]('r')
  RGFW_s* = cast[uint32]('s')
  RGFW_t* = cast[uint32]('t')
  RGFW_u* = cast[uint32]('u')
  RGFW_v* = cast[uint32]('v')
  RGFW_w* = cast[uint32]('w')
  RGFW_x* = cast[uint32]('x')
  RGFW_y* = cast[uint32]('y')
  RGFW_z* = cast[uint32]('z')
  RGFW_Period* = cast[uint32]('.')
  RGFW_Comma* = cast[uint32](',')
  RGFW_Slash* = cast[uint32]('/')
  RGFW_Bracket* = cast[uint32]('{')
  RGFW_CloseBracket* = cast[uint32]('}')
  RGFW_Semicolon* = cast[uint32](';')
  RGFW_Apostrophe* = cast[uint32]('\'')
  RGFW_BackSlash* = cast[uint32]('\\')
  RGFW_Return* = cast[uint32]('\n')
  RGFW_Delete* = cast[uint32]('\177')
  RGFW_F1* = 128'u32
  RGFW_F2* = 129'u32
  RGFW_F3* = 130'u32
  RGFW_F4* = 131'u32
  RGFW_F5* = 132'u32
  RGFW_F6* = 133'u32
  RGFW_F7* = 134'u32
  RGFW_F8* = 135'u32
  RGFW_F9* = 136'u32
  RGFW_F10* = 137'u32
  RGFW_F11* = 138'u32
  RGFW_F12* = 139'u32
  RGFW_CapsLock* = 140'u32
  RGFW_ShiftL* = 141'u32
  RGFW_ControlL* = 142'u32
  RGFW_AltL* = 143'u32
  RGFW_SuperL* = 144'u32
  RGFW_ShiftR* = 145'u32
  RGFW_ControlR* = 146'u32
  RGFW_AltR* = 147'u32
  RGFW_SuperR* = 148'u32
  RGFW_Up* = 149'u32
  RGFW_Down* = 150'u32
  RGFW_Left* = 151'u32
  RGFW_Right* = 152'u32
  RGFW_Insert* = 153'u32
  RGFW_End* = 154'u32
  RGFW_Home* = 155'u32
  RGFW_PageUp* = 156'u32
  RGFW_PageDown* = 157'u32
  RGFW_Numlock* = 158'u32
  RGFW_KP_Slash* = 159'u32
  RGFW_Multiply* = 160'u32
  RGFW_KP_Minus* = 161'u32
  RGFW_KP_1* = 162'u32
  RGFW_KP_2* = 163'u32
  RGFW_KP_3* = 164'u32
  RGFW_KP_4* = 165'u32
  RGFW_KP_5* = 166'u32
  RGFW_KP_6* = 167'u32
  RGFW_KP_7* = 168'u32
  RGFW_KP_8* = 169'u32
  RGFW_KP_9* = 170'u32
  RGFW_KP_0* = 171'u32
  RGFW_KP_Period* = 172'u32
  RGFW_KP_Return* = 173'u32
  RGFW_final_key* = 174'u32

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
