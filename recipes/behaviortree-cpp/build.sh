#!/usr/bin/env bash
rm cmake/FindZeroMQ.cmake

mkdir -p build
cd build
cmake \
  -G "Unix Makefiles" \
  ${CMAKE_ARGS} \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_BUILD_TYPE=release \
  -DCMAKE_C_COMPILER=${CC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  -DCMAKE_FIND_FRAMEWORK=NEVER \
  -DCMAKE_FIND_APPBUNDLE=NEVER \
  .. 
  
cmake --build . --parallel -DPython3_EXECUTABLE="$PYTHON"
cmake --install . -v

./tests/behaviortree_cpp_test