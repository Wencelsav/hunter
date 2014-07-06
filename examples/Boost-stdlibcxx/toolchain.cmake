# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# emulate polly/Libstdcxx (https://github.com/ruslo/polly)

if(DEFINED EXAMPLE_TOOLCHAIN_CMAKE)
  return()
else()
  set(EXAMPLE_TOOLCHAIN_CMAKE 1)
endif()

string(COMPARE EQUAL "${CMAKE_CXX_COMPILER_ID}" "Clang" is_clang)
string(COMPARE EQUAL "${CMAKE_CXX_COMPILER_ID}" "AppleClang" is_apple_clang)

if(is_clang OR is_apple_clang)
  set(
      CMAKE_CXX_FLAGS
      "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libstdc++"
      CACHE
      STRING
      "C++ compiler flags"
  )

  set(
      CMAKE_EXE_LINKER_FLAGS
      "${CMAKE_EXE_LINKER_FLAGS} -stdlib=libstdc++"
      CACHE
      STRING
      "Executable linker flags"
      FORCE
  )

  set(
      CMAKE_SHARED_LINKER_FLAGS
      "${CMAKE_SHARED_LINKER_FLAGS} -stdlib=libstdc++"
      CACHE
      STRING
      "Shared library linker flags"
      FORCE
  )
endif()
