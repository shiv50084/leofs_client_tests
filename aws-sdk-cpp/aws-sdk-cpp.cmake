MACRO(SUBDIRLIST result curdir)
  FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
  SET(dirlist "")
  FOREACH(child ${children})
    IF(IS_DIRECTORY ${curdir}/${child})
      LIST(APPEND dirlist ${child})
    ENDIF()
  ENDFOREACH()
  SET(${result} ${dirlist})
ENDMACRO()

SET(AWS_PREFIX extern/aws-sdk-cpp)
SET(AWS_INCLUDE_DIRECTORIES "")
SET(AWS_LIBRARY_DIRECTORIES "")

SUBDIRLIST(SUBDIRS ${CMAKE_SOURCE_DIR}/${AWS_PREFIX})

FOREACH(subdir ${SUBDIRS})
  SET(AWS_INC_DIR ${CMAKE_SOURCE_DIR}/${AWS_PREFIX}/${subdir}/include)
  SET(AWS_BIN_DIR ${CMAKE_BINARY_DIR}/${AWS_PREFIX}/${subdir})
  IF(IS_DIRECTORY ${AWS_INC_DIR})
      LIST(APPEND AWS_INCLUDE_DIRECTORIES ${AWS_INC_DIR})
      LIST(APPEND AWS_LIBRARY_DIRECTORIES ${AWS_BIN_DIR})
  ENDIF()
ENDFOREACH()
# message(STATUS ${AWS_INCLUDE_DIRECTORIES})
# get_property(inc_dir DIRECTORY PROPERTY INCLUDE_DIRECTORIES)

add_subdirectory(extern/aws-sdk-cpp)
