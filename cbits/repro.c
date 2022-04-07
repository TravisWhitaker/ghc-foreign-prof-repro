#include <HsFFI.h>
#include <Rts.h>

#include <repro.h>

int repro_init()
{
    RtsConfig conf = defaultRtsConfig;
    conf.rts_opts_enabled = RtsOptsAll;
    int argc = 5;
    char *argv[] = { "librepro"
                   , "+RTS"
                   , "-N3"
                   , "-A64M"
                   , "--install-signal-handlers=no"
                   , 0
                   };
    char **rargv = argv;
    hs_init_ghc(&argc, &rargv, conf);
    return 0;
}

void repro_cleanup()
{
    hs_exit();
}
