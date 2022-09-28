echo "原始的ll是: "
cat test_for_reassociate.ll
echo 

echo "利用 opt 优化IR后的结果是: "
opt -enable-new-pm=0 -load ../build/reassociate/libreassociate.so -reassociate -S < test_for_reassociate.ll 
echo 