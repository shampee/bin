#include <ncurses.h>
#include <stdlib.h>

#define show "xdo show -N Polybar"
#define hide "xdo hide -N Polybar"

int main() {
  int on = 1;
  int ch;
  while ((ch = getch()) != '#') {
    switch (ch) {
    case KEY_F(12):
      if (on) {
        system(hide);
        on = 0;
      }
      if (!on) {
        system(show);
        on = 1;
      }
      break;
    }
  }

  return 0;
}
