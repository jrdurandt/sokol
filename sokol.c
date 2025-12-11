#define SOKOL_IMPL
#if defined(_WIN32)
	#define SOKOL_D3D11
#elif defined(__linux__)
	#define SOKOL_GLCORE
#elif defined(__APPLE__)
	#define SOKOL_METAL
#else
	#panic "Unsupported platform"
#endif

#include "sokol_app.h"
#include "sokol_args.h"
#include "sokol_fetch.h"
#include "sokol_gfx.h"
#include "sokol_glue.h"
#include "sokol_log.h"
#include "sokol_time.h"