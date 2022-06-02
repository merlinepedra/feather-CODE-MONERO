find_package(PkgConfig)

if(PkgConfig_FOUND)
    pkg_check_modules(PC_ZLIB QUIET ZLIB)
    if(PC_ZLIB_FOUND)
        set(ZLIB_DEFINITIONS ${PC_ZLIB_CFLAGS_OTHER})
        find_library(ZLIB_LIBRARIES NAMES ZLIB HINTS ${PC_ZLIB_LIBDIR} ${PC_ZLIB_LIBRARY_DIRS})
        find_path(ZLIB_INCLUDE_DIR Decoder.h HINTS ${PC_ZLIB_INCLUDEDIR} ${PC_ZLIB_INCLUDE_DIRS})
    endif()
endif()

if(NOT ZLIB_INCLUDE_DIR)
    find_path(ZLIB_H_PATH ZLIB.h)
    if(ZLIB_H_PATH)
        set(ZLIB_INCLUDE_DIR "${ZLIB_H_PATH}")
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ZLIB  DEFAULT_MSG  ZLIB_LIBRARIES ZLIB_INCLUDE_DIR)
message(STATUS "Found ZLIB libraries ${ZLIB_LIBRARIES}")
