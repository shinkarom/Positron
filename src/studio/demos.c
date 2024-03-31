#include <string.h>
#include <stddef.h>
#include <stdio.h>
#include "demos.h"
#include "api.h"

#if defined (TIC_BUILD_WITH_LUA)
static const u8 LuaDemoRom[] =
{
    #include "../build/assets/luademo.posi.dat"
};
tic_script_config_extra LuaSyntaxConfigExtra =
{
    .name                  = "lua",
    .demoRom               = LuaDemoRom,
    .demoRomSize           = sizeof LuaDemoRom,
};
#endif

#if defined (TIC_BUILD_WITH_MOON)
static const u8 MoonDemoRom[] =
{
    #include "../build/assets/moondemo.posi.dat"
};
tic_script_config_extra MoonSyntaxConfigExtra =
{
    .name               = "moon",
    .demoRom            = MoonDemoRom,
    .demoRomSize        = sizeof MoonDemoRom,
};
#endif

#if defined (TIC_BUILD_WITH_FENNEL)
static const u8 FennelDemoRom[] =
{
    #include "../build/assets/fenneldemo.posi.dat"
};

tic_script_config_extra FennelSyntaxConfigExtra =
{
    .name               = "fennel",
    .demoRom            = FennelDemoRom,
    .demoRomSize        = sizeof FennelDemoRom,
};
#endif


#if defined(TIC_BUILD_WITH_JS)

static const u8 JsDemoRom[] =
{
    #include "../build/assets/jsdemo.posi.dat"
};

tic_script_config_extra JsSyntaxConfigExtra =
{
    .name               = "js",
    .demoRom            = JsDemoRom,
    .demoRomSize        = sizeof JsDemoRom,
};

#endif

#if defined(TIC_BUILD_WITH_MRUBY)

static const u8 RubyDemoRom[] =
{
    #include "../build/assets/rubydemo.posi.dat"
};

tic_script_config_extra MRubySyntaxConfigExtra =
{
    .name               = "ruby",
    .demoRom            = RubyDemoRom,
    .demoRomSize        = sizeof RubyDemoRom,
};

#endif

#if defined(TIC_BUILD_WITH_WREN)

static const u8 WrenDemoRom[] =
{
    #include "../build/assets/wrendemo.posi.dat"
};

tic_script_config_extra WrenSyntaxConfigExtra =
{
    .name               = "wren",
    .demoRom            = WrenDemoRom,
    .demoRomSize        = sizeof WrenDemoRom,
};

#endif

#if defined (TIC_BUILD_WITH_SCHEME)
static const u8 SchemeDemoRom[] =
{
    #include "../build/assets/schemedemo.posi.dat"
};

tic_script_config_extra SchemeSyntaxConfigExtra =
{
    .name               = "scheme",
    .demoRom            = SchemeDemoRom,
    .demoRomSize        = sizeof SchemeDemoRom,
};
#endif


#if defined (TIC_BUILD_WITH_SQUIRREL)
static const u8 SquirrelDemoRom[] =
{
    #include "../build/assets/squirreldemo.posi.dat"
};

tic_script_config_extra SquirrelSyntaxConfigExtra =
{
    .name               = "squirrel",
    .demoRom            = SquirrelDemoRom,
    .demoRomSize        = sizeof SquirrelDemoRom,
};
#endif


#if defined(TIC_BUILD_WITH_WASM)

static const u8 WasmDemoRom[] =
{
    #include "../build/assets/wasmdemo.posi.dat"
};

tic_script_config_extra WasmSyntaxConfigExtra =
{
    .name               = "wasm",
    .demoRom            = WasmDemoRom,
    .demoRomSize        = sizeof WasmDemoRom,
};

#endif

#if defined(TIC_BUILD_WITH_JANET)

static const u8 JanetDemoRom[] =
  {
#include "../build/assets/janetdemo.posi.dat"
  };

tic_script_config_extra JanetSyntaxConfigExtra =
  {
    .name               = "janet",
    .demoRom            = JanetDemoRom,
    .demoRomSize        = sizeof JanetDemoRom,
  };

#endif

#if defined(TIC_BUILD_WITH_PYTHON)

static const u8 PythonDemoRom[] =
  {
#include "../build/assets/pythondemo.posi.dat"
  };

tic_script_config_extra PythonSyntaxConfigExtra =
  {
    .name               = "python",
    .demoRom            = PythonDemoRom,
    .demoRomSize        = sizeof PythonDemoRom,
  };

#endif


tic_script_config_extra* getConfigExtra(const tic_script_config* config)
{

    for (tic_script_config_extra** conf = LanguagesExtra ; *conf != NULL; conf++ ) {
        tic_script_config_extra* ln = *conf;
        if (strcmp(config->name, ln->name) == 0)
        {
            return ln;
        }
    }
    return NULL;
}

tic_script_config_extra* LanguagesExtra[] = {
#if defined(TIC_BUILD_WITH_LUA)
   &LuaSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_MOON)
   &MoonSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_FENNEL)
   &FennelSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_WREN)
   &WrenSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_SCHEME)
   &SchemeSyntaxConfigExtra,
#endif

#if defined(TIC_BUILD_WITH_SQUIRREL)
   &SquirrelSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_JS)
   &JsSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_MRUBY)
   &MRubySyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_WASM)
   &WasmSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_JANET)
   &JanetSyntaxConfigExtra,
#endif
#if defined(TIC_BUILD_WITH_PYTHON)
   &PythonSyntaxConfigExtra,
#endif
   NULL
};
