#### 在LLVM源码外创建一个自己的PASS.

1. 执行`mkdir build`
2. 执行`cd build`
3. 执行`cmake ../`
4. 执行`make`即可获取PASS的动态链接库文件。
5. 测试流程如下：
   1. 执行`cd ../tests/`
   2. 执行`bash test_xxx.sh`(该脚本将分别执行:利用clang -emit-llvm生成LLVM IR、利用 opt 优化IR、利用 llvm-as 和 lli 执行，详细请参见脚本源码)
