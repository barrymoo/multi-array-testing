cmake_minimum_required (VERSION 3.3.0)

# We need Boost multiarray
find_package(Boost)
if (NOT ${Boost_FOUND})
    message(FATAL_ERROR "boost::multi_array required for these tests!")
endif (NOT ${Boost_FOUND})
# Need this include for all subtests
include_directories(${Boost_INCLUDE_DIRS})

# Serial should work on all machines
add_subdirectory(serial)

# OpenMP Tests
find_package(OpenMP)
if (${OPENMP_FOUND})
    add_subdirectory(openmp)
else ()
    message(WARNING "Couldn't find OpenMP, skipping this directory")
endif ()

# BLAS, on Apple use Intel MKL
if (APPLE)
    message(WARNING "Someone help me with this! I am a dummy.")
elseif (UNIX)
    find_package(BLAS)
    if (${BLAS_FOUND})
        add_subdirectory(math-lib)
        message(STATUS "${BLAS_LIBRARIES}")
    else ()
        message(WARNING "Couldn't find BLAS, skipping this directory")
    endif ()
endif ()

find_package(CUDA)
if (${CUDA_FOUND})
    add_subdirectory(cuda-tests)
else ()
    message(WARNING "Couldn't find CUDA, skipping this directory")
endif ()

# I will deal with this later. I don't have an OpenACC compiler at the moment
# add_subdirectory(openacc)
