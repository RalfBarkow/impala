# - Find SASL security library.
# This module defines
#  SASL_INCLUDE_DIR, where to find SASL headers
#  SASL_STATIC_LIBRARY, the library to use.
#  SASL_FOUND, If false, do not try to use.

set(SASL_SEARCH_LIB_PATH
  ${CMAKE_SOURCE_DIR}/thirdparty/cyrus-sasl-2.1.23/build/lib
)

set(SASL_INCLUDE_DIR 
  ${CMAKE_SOURCE_DIR}/thirdparty/cyrus-sasl-2.1.23/build/include
)

find_library(SASL_LIB_PATH NAMES sasl2
  PATHS ${SASL_SEARCH_LIB_PATH}
        NO_DEFAULT_PATH
        DOC   "Cyrus-sasl library"
)

if (SASL_LIB_PATH)
  set(SASL_FOUND TRUE)
  set(SASL_STATIC_LIBRARY ${SASL_SEARCH_LIB_PATH}/libsasl2.a)
else ()
  set(SASL_FOUND FALSE)
endif ()

if (SASL_FOUND)
  if (NOT SASL_FIND_QUIETLY)
    message(STATUS "Found SASL ${SASL_STATIC_LIBRARY}")
  endif ()
else ()
  message(STATUS "SASL includes and libraries NOT found.")
endif ()


mark_as_advanced(
  SASL_STATIC_LIBRARY
  SASL_INCLUDE_DIR
)
