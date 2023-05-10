if ("${OPTIONS_DONE}" STREQUAL "")
  set (OPTIONS_DONE 1)

# General Options ---
option(CONTAINERIZED "Build for container images." OFF)
option(CLIENTTOOLS "Enable the building/inclusion of a Client Tools component." ON)
option(PLATFORM "Enable the building/inclusion of a Platform component." ON)
option(DEVEL "Enable the building/inclusion of a Development component." OFF)
option(CLIENTTOOLS_ONLY "Enable the building of Client Tools only." OFF)
option(INCLUDE_PLUGINS "Enable the building of platform and all plugins for testing purposes" OFF)
option(USE_CASSANDRA "Include the Cassandra plugin in the base package" ON)
option(PLUGIN "Enable building of a plugin" OFF)
option(USE_SHLIBDEPS "Enable the use of dpkg-shlibdeps on ubuntu packaging" OFF)

option(SIGN_MODULES "Enable signing of ecl standard library modules" OFF)
option(USE_CPPUNIT "Enable unit tests (requires cppunit)" OFF)
option(USE_OPENLDAP "Enable OpenLDAP support (requires OpenLDAP)" ON)
option(USE_ICU "Enable unicode support (requires ICU)" ON)
option(USE_BOOST_REGEX "Configure use of boost regex" ON)
option(CENTOS_6_BOOST "Supply regex library on CentOS 6" OFF)
# USE_C11_REGEX is only checked if USE_BOOST_REGEX is OFF
# to disable REGEX altogether turn both off
option(USE_C11_REGEX "Configure use of c++11 std::regex" ON)
option(Boost_USE_STATIC_LIBS "Use boost_regex static library for RPM BUILD" OFF)
option(USE_OPENSSL "Configure use of OpenSSL" ON)
option(USE_OPENSSLV3 "Configure use of OpenSSL Version 3 or newer" ON)
option(USE_ZLIB "Configure use of zlib" ON)
option(USE_AZURE "Configure use of azure" ON)
option(USE_GIT "Configure use of GIT (Hooks)" ON)
if (WIN32)
    option(USE_AERON "Include the Aeron message protocol" OFF)
else()
    option(USE_AERON "Include the Aeron message protocol" ON)
endif()
option(USE_LIBARCHIVE "Configure use of libarchive" ON)
option(USE_URIPARSER "Configure use of uriparser" OFF)
if (APPLE OR WIN32)
    option(USE_NUMA "Configure use of numa" OFF)
else()
    option(USE_NUMA "Configure use of numa" ON)
endif()
option(USE_AWS "Configure use of aws" ON)
option(STRIP_RELEASE_SYMBOLS "Strip symbols from release builds" OFF)

IF (WIN32)
    option(USE_NATIVE_LIBRARIES "Search standard OS locations (otherwise in EXTERNALS_DIRECTORY) for 3rd party libraries" OFF)
ELSE()
    option(USE_NATIVE_LIBRARIES "Search standard OS locations (otherwise in EXTERNALS_DIRECTORY) for 3rd party libraries" ON)
ENDIF()

option(USE_GIT_DESCRIBE "Use git describe to generate build tag" ON)
option(CHECK_GIT_TAG "Require git tag to match the generated build tag" OFF)
option(USE_XALAN "Configure use of xalan" OFF)
option(USE_APR "Configure use of Apache Software Foundation (ASF) Portable Runtime (APR) libraries" ON)
option(USE_LIBXSLT "Configure use of libxslt" ON)
option(MAKE_DOCS "Create documentation at build time." OFF)
option(MAKE_DOCS_ONLY "Create a base build with only docs." OFF)
option(DOCS_DRUPAL "Create Drupal HTML Docs" OFF)
option(DOCS_EPUB "Create EPUB Docs" OFF)
option(DOCS_MOBI "Create Mobi Docs" OFF)
option(DOCS_AUTO "DOCS automation" OFF)
option(USE_RESOURCE "Use resource download in ECLWatch" OFF)
option(GENERATE_COVERAGE_INFO "Generate coverage info for gcov" OFF)
option(USE_SIGNED_CHAR "Build system with default char type is signed" OFF)
option(USE_UNSIGNED_CHAR "Build system with default char type is unsigned" OFF)
option(USE_JAVA "Include support for components that require java" ON)
option(USE_MYSQL "Enable mysql support" ON)
option(USE_LIBMEMCACHED "Enable libmemcached support" ON)
option(USE_PYTHON2 "Enable python2 language support for platform build" OFF)
option(USE_PYTHON3 "Enable python3 language support for platform build" ON)
option(USE_OPTIONAL "Automatically disable requested features with missing dependencies" ON)
option(JLIB_ONLY  "Build JLIB for other projects such as Configurator, Ganglia Monitoring, etc" OFF)
# Generates code that is more efficient, but will cause problems if target platforms do not support it.
if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    option(USE_INLINE_TSC "Inline calls to read TSC (time stamp counter)" ON)
else()
    option(USE_INLINE_TSC "Inline calls to read TSC (time stamp counter)" OFF)
endif()
if (APPLE OR WIN32)
    option(USE_TBB "Enable Threading Building Block support" OFF)
else()
    option(USE_TBB "Enable Threading Building Block support" OFF)
    option(USE_TBBMALLOC "Enable Threading Building Block scalable allocator proxy support" OFF)
    option(USE_TBBMALLOC_ROXIE "Enable Threading Building Block scalable allocator proxy support in Roxie" OFF)
endif()
option(LOGGING_SERVICE "Configure use of logging service" ON)
option(WSSQL_SERVICE "Configure use of ws_sql service" ON)
option(USE_DIGISIGN "Use digisign" ON)
option(INCLUDE_EE_PLUGINS "Install EE Plugins in Clienttool" OFF)
option(INCLUDE_TREEVIEW "Build legacy treeview" OFF)
option(INCLUDE_CONFIG_MANAGER "Build config manager" ON)
option(USE_ELASTICSTACK_CLIENT "Configure use of Elastic Stack client" ON)
option(SKIP_ECLWATCH "Skip building ECL Watch" OFF)
option(USE_ADDRESS_SANITIZER "Use address sanitizer to spot leaks" OFF)
option(INSTALL_VCPKG_CATALOG "Install vcpkg-catalog.txt" ON)

if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
    set ( CMAKE_BUILD_TYPE "Release" )
elseif (NOT "${CMAKE_BUILD_TYPE}" MATCHES "^Debug$|^Release$|^RelWithDebInfo$")
    message (FATAL_ERROR "Unknown build type ${CMAKE_BUILD_TYPE}")
endif ()
message ("-- Making ${CMAKE_BUILD_TYPE} system")

if (NOT USE_JAVA)
    if (WSSQL_SERVICE)
        message(WARNING "WSSQL_SERVICE requires USE_JAVA, forcing WSSQL_SERVICE OFF")
        set (WSSQL_SERVICE OFF)
    endif ()
    if ((INCLUDE_PLUGINS AND NOT SUPPRESS_JAVAEMBED) OR INCLUDE_JAVAEMBED)
        message(WARNING "JAVAEMBED requires USE_JAVA, forcing SUPPRESS_JAVAEMBED ON")
        set (SUPRESS_JAVAEMBED ON)
    endif ()
endif ()

endif ()