add_library(reassociate MODULE Reassociate.cpp)

# # 可将add_library改为add_llvm_library，这样可以很方便加入到LLVM源码中
# # 但是需配置LLVM_CMAKE，以支持add_llvm_library()
# add_llvm_library(funcblockcount MODULE funcblockcount.cpp)