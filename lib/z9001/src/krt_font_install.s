;--------------------------------------------------------------------------
;  krt_font_install.s
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
        .module krt_font_install
        .include 'krt.inc'

        .globl _krt_font

;
; Annahmen testen
;
.if ne(FONT_HEIGHT-8)
        .error wir setzen 8 Bytes pro Zeichen vorgegeben voraus
.endif

        .area   _CODE
;
; void krt_font_install(unsigned char *source, unsigned int firstCharacter,
;        unsigned int length) __z88dk_callee;
_krt_font_install::
        pop     hl ;
        pop     bc ; source
        pop     de ; firstCharacter
        ex      (sp),hl ; HL length
        push    bc

        add     hl,hl
        add     hl,hl
        add     hl,hl
        ld      b,h
        ld      c,l

        ld      h,d
        ld      l,e
        add     hl,hl
        add     hl,hl
        add     hl,hl
        ld      de,#_krt_font
        add     hl,de   ; destination address
        ld      d,h
        ld      e,l

        pop     hl

        ldir
        ret