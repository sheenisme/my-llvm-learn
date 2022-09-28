echo "利用clang -emit-llvm生成LLVM IR "
clang -O0 -S -emit-llvm test_for_funcblockCount.c -o test_for_funcblockCount.ll
# cat test_for_funcblockCount.ll
echo 

echo "利用 opt 优化IR "
opt -enable-new-pm=0 -load ../build/funcblockcount/libfuncblockcount.so -funcblockcount < test_for_funcblockCount.ll > /dev/null
# opt -enable-new-pm=0 -load ../build/funcblockcount/libfuncblockcount.so -funcblockcount test_for_funcblockCount.ll  -time-passes
echo 

echo "利用 llvm-as 和 lli 执行"
llvm-as test_for_funcblockCount.ll
lli test_for_funcblockCount.bc
echo
