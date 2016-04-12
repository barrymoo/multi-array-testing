add_executable(ma-serial ma-serial.cpp)
add_executable(ca-serial ca-serial.cpp)

target_link_libraries(ma-serial ${Boost_LIBRARIES})
