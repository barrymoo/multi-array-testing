cuda_add_executable(ma-cuda-daxpy ma-cuda-daxpy.cu)
target_link_libraries(ma-cuda-daxpy ${CUDA_LIBRARIES})
