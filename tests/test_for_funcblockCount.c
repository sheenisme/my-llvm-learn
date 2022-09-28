#include<stdio.h>

int foo(int n, int m)
{
    int sum = 0;
    int c0;
    for (c0 = n; c0 > 0; c0--)
    {
        int c1 = m;
        for (; c1 > 0; c1--)
        {
            sum += c0 > c1 ? 1 : 0;
        }
    }
    return sum;
}

int main()
{
    int a = foo(5, 6);
    printf("foo(5, 6)'s result is : %d \n", a);
    return 0;
}