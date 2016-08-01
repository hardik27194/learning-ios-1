//
//  main.c
//  placeholder
//
//  Created by hongtao on 16/8/1.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    printf("%c\n", 'a');  // %c 表示字符
    printf("%s\n", "hello world");  // %s 表示字符串

    printf("%d\n", 123);  // %d 表示十进制整数
    printf("%u\n", 123);  // %u 表示十进制无符号整数
    printf("%o\n", 123);  // %o 表示八进制整数
    printf("%x\n", 123);  // %x 表示16进制整数

    printf("%ld\n", 123L);  // %ld 表示十进制长整数
    printf("%lu\n", 123L);  // %lu 表示十进制无符号长整数
    printf("%lo\n", 123L);  // %lo 表示八进制长整数
    printf("%lx\n", 123L);  // %lx 表示16进制长整数

    printf("%f\n", 3.14F);  // %f 表示浮点数
    printf("%e\n", 3.14F);  // %e 表示浮点数（科学表示法）
    printf("%lf\n", 3.14);  // %lf 表示双精度浮点数
    printf("%le\n", 3.14);  // %le 表示双精度浮点数（科学表示法）

    char *str = "hello world";
    printf("%p\n", str);  // %p 表示指针
    printf("%zu\n", sizeof(str));  // %zu 表示size_t

    return 0;
}
