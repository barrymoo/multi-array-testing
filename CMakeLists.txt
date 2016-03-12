cmake_minimum_required (VERSION 3.4.3)

# Boost
find_package(Boost)
include_directories(${Boost_INCLUDE_DIRS})

#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -ftree-vectorize -fopt-info-vec -fopt-info-vec-missed")

# CBLAS
find_package(CBLAS)

# OpenMP
find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

add_executable(ma-serial ma-serial.cpp)
add_executable(ma-parallel ma-parallel.cpp)
add_executable(ca-serial ca-serial.cpp)
add_executable(ca-parallel ca-parallel.cpp)
add_executable(ma-blas ma-blas.cpp)

target_link_libraries(ma-serial ${Boost_LIBRARIES})
target_link_libraries(ma-parallel ${Boost_LIBRARIES})
target_link_libraries(ma-blas ${CBLAS_LIBRARIES})
