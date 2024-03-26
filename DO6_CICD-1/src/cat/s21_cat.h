#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct options {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
};

int flag_parse(int argc, char **argv, struct options *opt);
void output(char **argv, struct options *opt);
