#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

// 引入llvm命名空间，可以让其使用LLVM当中的函数
using namespace llvm;

// 设置 DEBUG_TYPE 是字符串funcblockcount，即设置命令行中的选项为 funcblockcount
#define DEBUG_TYPE "funcblockcount"

STATISTIC(COUNTER, "Counts number of functions greeted");
// 创建一个匿名的命名空间
namespace
{
    // 声明Pass
    struct FuncBlockCount : public FunctionPass
    {
        // 声明Pass的标识符，会被LLVM用作识别Pass
        static char ID;
        // 对父类进行初始化
        FuncBlockCount() : FunctionPass(ID) {}

        /* 其实就是runOnFunction的一个虚函数，这里对它进行了实现。
         * runOnFunction()就是以函数为单位进行处理，LLVM会以一次一个function为单位，喂进来给你处理，接下来就是将喂进来的function的名字打印出来。
         * 一个FunctionPass的子类要想做一些实际的工作，就必须对这个虚函数进行实现。
         */
        bool runOnFunction(Function &F) override
        {
            COUNTER++;
            // errs()是一个LLVM提供的C++输出流，我们可以用它来输出到控制台
            errs() << "FuncBlockCount pass get the function's name is: ";
            errs().write_escaped(F.getName()) << ", counter is : " << COUNTER << '\n';
            // 函数返回false说明它没有改动函数F。之后，如果我们真的变换了程序，我们需要返回一个true。
            return false;
        }
    };
}

// 初始化Pass ID
char FuncBlockCount::ID = 0;
// 需要注册Pass、填写名称和命令行参数
static RegisterPass<FuncBlockCount> X("funcblockcount", "Function Block Count",
                                      false /* Only looks at CFG */,
                                      false /* Analysis Pass */);
