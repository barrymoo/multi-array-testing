cmake_minimum_required (VERSION 3.3.0)

# Boost
find_package(Boost)
include_directories(${Boost_INCLUDE_DIRS})

# CUDA
find_package(CUDA)

# OpenMP
find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

# CUDA Programs
cuda_add_executable(ma-cuda-daxpy ma-cuda-daxpy.cu)
target_link_libraries(ma-cuda-daxpy ${CUDA_LIBRARIES})
