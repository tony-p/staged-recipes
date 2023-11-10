
del cmake\FindZeroMQ.cmake

mkdir build
cd build

cmake -G "NMake Makefiles" ^
  %CMAKE_ARGS% ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=release ^
  -DCMAKE_C_COMPILER=%CC% ^
  -DCMAKE_CXX_COMPILER=%CXX% ^
  ..
  
if errorlevel 1 exit /b 1

cmake --build . --parallel -DPython3_EXECUTABLE="%PYTHON%"
if errorlevel 1 exit /b 1
cmake --install . -v
if errorlevel 1 exit /b 1

$env:PATH+=";Release"; tests/Release/behaviortree_cpp_test.exe