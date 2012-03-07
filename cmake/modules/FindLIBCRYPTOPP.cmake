# - Find libCryptopp
# Find the native LIBCRYPTOPP includes and library
#
#  LIBCRYPTOPP_INCLUDE_DIR - where to find sha.h, etc.
#  LIBCRYPTOPP_LIBRARIES   - List of libraries when using libCryptopp.
#  LIBCRYPTOPP_FOUND       - True if libCryptopp found.


IF (LIBCRYPTOPP_INCLUDE_DIR)
  # Already in cache, be silent
  SET(LIBCRYPTOPP_FIND_QUIETLY TRUE)
ENDIF (LIBCRYPTOPP_INCLUDE_DIR)

FIND_PATH(LIBCRYPTOPP_INCLUDE_DIR cryptopp/sha.h)

SET(LIBCRYPTOPP_LIBRARY_NAMES_RELEASE ${LIBCRYPTOPP_LIBRARY_NAMES_RELEASE} ${LIBCRYPTOPP_LIBRARY_NAMES} cryptopp)
FIND_LIBRARY(LIBCRYPTOPP_LIBRARY_RELEASE NAMES ${LIBCRYPTOPP_LIBRARY_NAMES_RELEASE} )

# Find a debug library if one exists and use that for debug builds.
# This really only does anything for win32, but does no harm on other
# platforms.
SET(LIBCRYPTOPP_LIBRARY_NAMES_DEBUG ${LIBCRYPTOPP_LIBRARY_NAMES_DEBUG} cryptoppd)
FIND_LIBRARY(LIBCRYPTOPP_LIBRARY_DEBUG NAMES ${LIBCRYPTOPP_LIBRARY_NAMES_DEBUG})

INCLUDE(LibraryDebugAndRelease)
SET_LIBRARY_FROM_DEBUG_AND_RELEASE(LIBCRYPTOPP)

# handle the QUIETLY and REQUIRED arguments and set LIBCRYPTOPP_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(PoDoFoFindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBCRYPTOPP DEFAULT_MSG LIBCRYPTOPP_LIBRARY LIBCRYPTOPP_INCLUDE_DIR)

IF(LIBCRYPTOPP_FOUND)
  SET( LIBCRYPTOPP_LIBRARIES ${LIBCRYPTOPP_LIBRARY} )
ELSE(LIBCRYPTOPP_FOUND)
  SET( LIBCRYPTOPP_LIBRARIES )
ENDIF(LIBCRYPTOPP_FOUND)

MARK_AS_ADVANCED( LIBCRYPTOPP_LIBRARY LIBCRYPTOPP_INCLUDE_DIR )
