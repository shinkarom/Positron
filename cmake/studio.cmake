################################
# TIC-80 studio
################################

set(TIC80LIB_DIR ${CMAKE_SOURCE_DIR}/src)
set(TIC80STUDIO_SRC
    ${TIC80LIB_DIR}/studio/screens/console.c
    ${TIC80LIB_DIR}/studio/screens/run.c
    ${TIC80LIB_DIR}/studio/screens/menu.c
    ${TIC80LIB_DIR}/studio/screens/mainmenu.c
    ${TIC80LIB_DIR}/studio/screens/surf.c
    ${TIC80LIB_DIR}/studio/screens/start.c
    ${TIC80LIB_DIR}/studio/editors/code.c
    ${TIC80LIB_DIR}/studio/editors/sprite.c
    ${TIC80LIB_DIR}/studio/editors/map.c
    ${TIC80LIB_DIR}/studio/editors/world.c
    ${TIC80LIB_DIR}/studio/editors/sfx.c
    ${TIC80LIB_DIR}/studio/editors/music.c
    ${TIC80LIB_DIR}/studio/studio.c
    ${TIC80LIB_DIR}/studio/config.c
    ${TIC80LIB_DIR}/studio/demos.c
    ${TIC80LIB_DIR}/studio/fs.c
    ${TIC80LIB_DIR}/studio/net.c
    ${TIC80LIB_DIR}/ext/md5.c
    ${TIC80LIB_DIR}/ext/history.c
    ${TIC80LIB_DIR}/ext/gif.c
    ${TIC80LIB_DIR}/ext/png.c
)

    set(TIC80STUDIO_SRC ${TIC80STUDIO_SRC} ${TIC80LIB_DIR}/studio/project.c)

set(TIC80_OUTPUT tic80)

add_library(tic80studio STATIC
    ${TIC80STUDIO_SRC}
    ${DEMO_CARTS_OUT})

if(WIN32)
    target_include_directories(tic80studio PRIVATE ${THIRDPARTY_DIR}/dirent/include)
endif()

target_include_directories(tic80studio PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries(tic80studio tic80core zip wave_writer argparse giflib png)

if(USE_NAETT)
    target_compile_definitions(tic80studio PRIVATE USE_NAETT)
    target_link_libraries(tic80studio naett)
endif()

    target_compile_definitions(tic80studio PRIVATE TIC80_PRO)

if(BUILD_SDLGPU)
    target_compile_definitions(tic80studio PUBLIC CRT_SHADER_SUPPORT)
endif()

target_compile_definitions(tic80studio PUBLIC BUILD_EDITORS)