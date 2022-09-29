#### 在LLVM源码外创建一个自己的PASS.

1. 执行`mkdir build`
2. 执行`cd build`
3. 执行`cmake ../`
4. 执行`make`即可获取PASS的动态链接库文件。
5. 测试流程如下：
   1. 执行`cd ../tests/`
   2. 执行`bash test_xxx.sh`(该脚本将分别执行:利用clang -emit-llvm生成LLVM IR、利用 opt 优化IR、利用 llvm-as 和 lli 执行，详细请参见脚本源码)

##### Notes:

1. funcblockcount十分类似Hello PASS。
2. reassociate重新关联优化PASS（例如4+（x+5）->x+（4+5））代码源自<https://github.com/llvm/llvm-project/blob/release/14.x/llvm/lib/Transforms/Scalar/Reassociate.cpp>。

##### 参考链接：
   <https://zhuanlan.zhihu.com/p/392381317>
   <https://www.jianshu.com/p/9f450969121b>
   <https://blog.csdn.net/ZCMUCZX/article/details/80856655>
   <https://llvm.org/docs/CMake.html>
   <https://llvm.org/docs/WritingAnLLVMPass.html>
   <https://github.com/banach-space/llvm-tutor>
