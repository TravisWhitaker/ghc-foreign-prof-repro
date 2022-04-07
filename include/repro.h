#ifndef REPRO_H
#define REPRO_H

#include <stdint.h>
#include <pthread.h>

int repro_init();
void repro_cleanup();
double repro(double y, double x);

#endif
