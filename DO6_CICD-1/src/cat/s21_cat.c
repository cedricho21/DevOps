#include "s21_cat.h"

int main(int argc, char **argv) {
  struct options opt = {0};
  flag_parse(argc, argv, &opt);
  while (optind < argc) {
    output(argv, &opt);
    optind++;
  }
  return 0;
}

int flag_parse(int argc, char **argv, struct options *opt) {
  int g;
  static struct option options[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };
  while ((g = getopt_long(argc, argv, "bEnsTvet", options, NULL)) != -1) {
    switch (g) {
      case 'b':
        opt->b = 1;
        break;
      case 'E':
        opt->e = 1;
        break;
      case 'n':
        opt->n = 1;
        break;
      case 's':
        opt->s = 1;
        break;
      case 'T':
        opt->t = 1;
        break;
      case 'v':
        opt->v = 1;
        break;
      case 'e':
        opt->e = 1;
        opt->v = 1;
        break;
      case 't':
        opt->t = 1;
        opt->v = 1;
        break;
      default:
        exit(1);
    }
    if (opt->b && opt->n) opt->n = 0;
  }
  return 0;
}

void output(char **argv, struct options *opt) {
  FILE *f;
  f = fopen(argv[optind], "r");
  if (f != NULL) {
    int str_count = 1;
    int empty_str_count = 0;
    int last = '\n';
    while (!feof(f)) {
      int now = fgetc(f);
      if (now == EOF) break;
      if (opt->s && now == '\n' && last == '\n') {
        empty_str_count++;
        if (empty_str_count > 1) {
          continue;
        }
      } else {
        empty_str_count = 0;
      }
      if (last == '\n' && ((opt->b && now != '\n') || opt->n))
        printf("%6d\t", str_count++);
      if (opt->t && now == '\t') {
        printf("^");
        now = 'I';
      }
      if (opt->e && now == '\n') printf("$");
      if (opt->v) {
        if ((now >= 0 && now < 9) || (now > 10 && now < 32) ||
            (now > 126 && now <= 160)) {
          printf("^");
          if (now > 126) {
            now -= 64;
          } else {
            now += 64;
          }
        }
      }
      printf("%c", now);
      last = now;
    }
    fclose(f);
  } else {
    fprintf(stderr, "cat: %s: No such file or directory\n", argv[optind]);
    exit(1);
  }
}
