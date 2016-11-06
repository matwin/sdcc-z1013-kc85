;--------------------------------------------------------------------------
;  krt_cputs.s
;
;  Copyright (C) 2016, Andreas Ziermann
;
;  This library is free software; you can redistribute it and/or modify it
;  under the terms of the GNU General Public License as published by the
;  Free Software Foundation; either version 2, or (at your option) any
;  later version.
;
;  This library is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License 
;  along with this library; see the file COPYING. If not, write to the
;  Free Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
;   MA 02110-1301, USA.
;
;  As a special exception, if you link this library with other files,
;  some of which are compiled with SDCC, to produce an executable,
;  this library does not by itself cause the resulting executable to
;  be covered by the GNU General Public License. This exception does
;  not however invalidate any other reasons why the executable file
;   might be covered by the GNU General Public License.
;--------------------------------------------------------------------------
        .module krt_cputs

        .globl  _krt_color
        .globl  _krt_cursor
        .globl  _krt_putchar

        .area   _CODE
;
;   void krt_cputs(unsigned char *str) __z88dk_callee;
;
_krt_cputs::
        pop     iy
        ex      (sp),iy ; IY str
100$:
        ld      c,(iy)
        ld      a,c
        or      a,a
        ret     z

        ld      hl,#_krt_color
        ld      e, (hl)
        ld      d,#0x00
        ld      b,#0x00
        ld      hl,(_krt_cursor)
        push    iy
        push    de
        push    bc
        push    hl
        inc     hl
        ld      (#_krt_cursor),hl
        call    _krt_putchar
        pop     iy
        inc     iy
        jr      100$
