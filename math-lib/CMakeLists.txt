include_directories(${BLAS_INCLUDE_DIR})
add_executable(ma-blas ma-blas.cpp)
target_link_libraries(ma-blas ${BLAS_LIBRARIES})
