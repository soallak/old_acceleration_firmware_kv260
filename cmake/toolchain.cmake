set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_VERBOSE_MAKEFILE:BOOL ON) # pushed to here, instead of as within
                                    # --cmake-args

set(FIRMWARE_DIR __FIRMWARE_DIR__)
set(VITIS_DIR __VITIS_DIR__)
set(INSTALL_DIR __INSTALL_DIR__)

# Specify the cross compiler
set(COMPILER_PREFIX ${VITIS_DIR}/gnu/aarch64/lin/aarch64-linux/)
set(CMAKE_C_COMPILER
    /home/swallak/Dev/work/plc2/kv260/crosscompiler/install/bin/aarch64-linux-gnu-gcc
)
set(CMAKE_CXX_COMPILER
    /home/swallak/Dev/work/plc2/kv260/crosscompiler/install/bin/aarch64-linux-gnu-g++
)

# Specify the target file system
set(CMAKE_SYSROOT /home/swallak/Dev/work/plc2/kv260/crosscompiler/sysroot)
set(CMAKE_FIND_ROOT_PATH "${INSTALL_DIR}-kv260-soallak" ${CMAKE_SYSROOT}
                         ${CMAKE_SYSROOT}/opt/ros/foxy/)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# for the same reason, i do this manually
set(LINKER_FLAGS_INIT
    "-Wl,--unresolved-symbols=ignore-all --sysroot=${CMAKE_SYSROOT} -L${CMAKE_SYSROOT}/lib -L${CMAKE_SYSROOT}/usr/lib/ -L${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu -L${CMAKE_SYSROOT}/lib/aarch64-linux-gnu  -Wl,-rpath-link=${CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu,-rpath-link=${CMAKE_SYSROOT}/usr/lib,-rpath-link=${CMAKE_SYSROOT}/lib/aarch64-linux-gnu"
)
set(CMAKE_SHARED_LINKER_FLAGS_INIT ${LINKER_FLAGS_INIT})
set(CMAKE_EXE_LINKER_FLAGS_INIT ${LINKER_FLAGS_INIT})

set(CMAKE_INSTALL_RPATH ${CMAKE_SYSROOT}/usr/lib
                        {CMAKE_SYSROOT}/usr/lib/aarch64-linux-gnu)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# to fix FindThread
set(CMAKE_THREAD_LIBS_INIT "-lpthread")
set(CMAKE_HAVE_THREADS_LIBRARY 1)
set(CMAKE_USE_WIN32_THREADS_INIT 0)
set(CMAKE_USE_PTHREADS_INIT 1)
set(THREADS_PREFER_PTHREAD_FLAG ON)
