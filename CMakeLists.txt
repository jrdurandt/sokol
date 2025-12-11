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

if (WIN32)
    target_link_libraries(sokol PRIVATE
            d3d11
            dxgi
    )
elseif (APPLE)
    find_library(COCOA_LIBRARY Cocoa)
    find_library(QUARTZ_CORE_LIBRARY QuartzCore)
    find_library(METAL_LIBRARY Metal)
    find_library(METALKIT_LIBRARY MetalKit)

    target_link_libraries(sokol PRIVATE
            ${COCOA_LIBRARY}
            ${QUARTZ_CORE_LIBRARY}
            ${METAL_LIBRARY}
            ${METALKIT_LIBRARY}
    )
elseif (UNIX AND NOT APPLE)
    find_package(X11 REQUIRED)

    target_link_libraries(${PROJECT_NAME} PRIVATE
            GL
            ${X11_LIBRARIES}
            Xi
            Xcursor
            dl
            pthread
            m
    )
endif ()