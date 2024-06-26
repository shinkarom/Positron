################################
# bin2txt cart2prj prj2cart xplode wasmp2cart
################################

if(BUILD_DEMO_CARTS)

    set(TOOLS_DIR ${CMAKE_SOURCE_DIR}/build/tools)

    add_executable(cart2prj ${TOOLS_DIR}/cart2prj.c ${CMAKE_SOURCE_DIR}/src/studio/project.c)
    target_include_directories(cart2prj PRIVATE ${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(cart2prj tic80core)

    add_executable(prj2cart ${TOOLS_DIR}/prj2cart.c ${CMAKE_SOURCE_DIR}/src/studio/project.c)
    target_include_directories(prj2cart PRIVATE ${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(prj2cart tic80core)

    add_executable(bin2txt ${TOOLS_DIR}/bin2txt.c)
    target_link_libraries(bin2txt zlib)

    add_executable(xplode
        ${TOOLS_DIR}/xplode.c
        ${CMAKE_SOURCE_DIR}/src/ext/png.c
        ${CMAKE_SOURCE_DIR}/src/studio/project.c)

    target_include_directories(xplode PRIVATE ${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(xplode tic80core png)

    if(LINUX)
        target_link_libraries(xplode m)
    endif()

    set(DEMO_CARTS_IN ${CMAKE_SOURCE_DIR}/demos)
    set(DEMO_CARTS_OUT)

    if(BUILD_WITH_LUA)
        list(APPEND DEMO_CARTS
            ${CMAKE_SOURCE_DIR}/config.lua
        )
    endif()

    if(BUILD_WITH_LUA)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/luademo.lua)
    endif()

    if(BUILD_WITH_MOON)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/moondemo.moon)
    endif()

    if(BUILD_WITH_FENNEL)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/fenneldemo.fnl)
    endif()

    if(BUILD_WITH_JS)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/jsdemo.js)
    endif()

    if(BUILD_WITH_SCHEME)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/schemedemo.scm)
    endif()

    if(BUILD_WITH_SQUIRREL)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/squirreldemo.nut)
    endif()

    if(BUILD_WITH_PYTHON)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/pythondemo.py)
    endif()

    if(BUILD_WITH_WREN)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/wrendemo.wren)
    endif()

    if(BUILD_WITH_JANET)
        list(APPEND DEMO_CARTS ${DEMO_CARTS_IN}/janetdemo.janet)
    endif()

    foreach(CART_FILE ${DEMO_CARTS})

        get_filename_component(CART_NAME ${CART_FILE} NAME_WE)

        set(OUTNAME ${CMAKE_SOURCE_DIR}/build/assets/${CART_NAME}.posi.dat)
        set(OUTPRJ ${CMAKE_SOURCE_DIR}/build/${CART_NAME}.posi)

        list(APPEND DEMO_CARTS_OUT ${OUTNAME})

        add_custom_command(OUTPUT ${OUTNAME}
            COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/prj2cart ${CART_FILE} ${OUTPRJ} && ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/bin2txt ${OUTPRJ} ${OUTNAME} -z
            DEPENDS bin2txt prj2cart ${CART_FILE}
    )

    endforeach(CART_FILE)

endif()