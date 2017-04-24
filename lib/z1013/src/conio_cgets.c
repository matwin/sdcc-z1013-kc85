#include <conio.h>

#if defined(__Z1013__)
#include <z1013.h>
#define CURSOR_ABS Z1013_CURSR

void cursor_on() {
    Z1013_CODE = *CURSOR_ABS;
    *CURSOR_ABS = 0xff;
}

void cursor_off() {
    *CURSOR_ABS = Z1013_CODE; //cursor off
}

void cursor_right() {
    CURSOR_ABS++;
    Z1013_CODE = *CURSOR_ABS;
    *CURSOR_ABS = 0xff;
}

void cursor_left(char c) {
    *CURSOR_ABS = Z1013_CODE;
    CURSOR_ABS--;
    Z1013_CODE = c;
    *CURSOR_ABS = 0xff;
}

#elif defined(__Z9001__)
#include <z9001.h>

void cursor_on() {
    *(CURSOR_ABS - 0x400) |= 0x80;
}

void cursor_off() {
    *(CURSOR_ABS - 0x400) &= 0x7f;
}

void cursor_right() {
    *(CURSOR_ABS - 0x400) &= 0x7f;
    CURSOR_ABS++;
    *(CURSOR_ABS - 0x400) |= 0x80;
}

void cursor_left(char c) {
    *(CURSOR_ABS - 0x400) &= 0x7f;
    CURSOR_ABS--;
    *(CURSOR_ABS - 0x400) |= 0x80;
    *CURSOR_ABS = c;
}
#endif

char * cgets(char *buffer) {
    char *input = buffer + 2;
    char c;
    unsigned char max = buffer[0];
    unsigned char len = 0;
    unsigned char cur = 0;
    char *ptr = CURSOR_ABS;

    for (int i = 0; i < max; i++) {
        *ptr++ = '_';
    }

    ptr = buffer + 2;
    for (int i = 0; i < max; i++) {
        *ptr++ = 0;
    }

    cursor_on();

    do {
        c = getch();
        if (c < 0x20) {
            //andere wichtige keycodes sind: 1f DEL 7f BACKSP
            if (c == 8 && len) {
                cursor_left('_');
                *input-- = 0;
                len--;
            }
            //seit dem KC85/4 kann man die aktuelle Eingabe mit CTRL-C abbrechen
            if (c == 0x03) {
                buffer[1] = 0;
                buffer[2] = 0;
                c = 0x0d;
            }
        } else {
            if (len < max) {
                *CURSOR_ABS = c;
                cursor_right();
                *input++ = c;
                len++;
            }
        }

    } while (c != 0x0d);

    buffer[1] = len;
    *input = 0;
    cursor_off();

    return buffer + 2;
}
