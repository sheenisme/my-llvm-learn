# cmake版本
cmake_minimum_required(VERSION 3.22)

# 设置项目名字
project(mypass)

# 配置LLVM
find_package(LLVM REQUIRED CONFIG)
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})
include_directories(${LLVM_INCLUDE_DIRS})
# 打印LLVM配置信息
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LT_LLVM_INSTALL_DIR}")
message("LLVM STATUS:
  Definitions ${LLVM_DEFINITIONS}
  Includes    ${LLVM_INCLUDE_DIRS}
  Libraries   ${LLVM_LIBRARY_DIRS}
  Targets     ${LLVM_TARGETS_TO_BUILD}"
)

# # 配置LLVM_CMAKE，以支持add_llvm_library()
# list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# include(AddLLVM)
# message(STATUS "Using LLVMCMAKEConfig.cmake in: ${LLVM_CMAKE_DIR}")

# 添加Pass的子目录
add_subdirectory(funcblockcount)
