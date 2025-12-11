clean:
    rm -rf build

build:
    mkdir -p build
    cmake -S . -B build
    cmake --build build