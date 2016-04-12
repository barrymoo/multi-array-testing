add_executable(ma-parallel ma-parallel.cpp)
add_executable(ca-parallel ca-parallel.cpp)

target_link_libraries(ma-parallel ${Boost_LIBRARIES})
