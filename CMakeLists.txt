cmake_minimum_required(VERSION 4.1)
project(sokol)

set(CMAKE_C_STANDARD 99)

set(SOKOL_HEADERS
        sokol_gfx.h
        sokol_app.h
        sokol_audio.h
        sokol_time.h
        sokol_glue.h
        sokol_args.h
        sokol_fetch.h
        sokol_log.h
)
add_library(sokol STATIC sokol.c ${SOKOL_HEADERS})
target_include_directories(sokol PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
