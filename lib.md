##静态库的生成


<<<<<<< HEAD
###1.编写头文件
=======
1.编写头文件
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

lib.h
```
int add(int, int);
int minus(int, int);
```

<<<<<<< HEAD
###2.编写实现文件
=======
2.编写实现文件
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

bill.c
```
int add(int a, int b)
{
	return a+b;
}
```
fred.c
```
int minus(int a, int b)
{
	return a-b;
}
```

<<<<<<< HEAD
###3.将.c文件编译生成.o文件

` gcc -c bill.c fred.c`

###4.将.o文件打包成库
=======
3.将.c文件编译生成.o文件

` gcc -c bill.c fred.c`

4.将.o文件打包成库
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

`ar crv libfoo.a bill.o fred.o`

生成libfoo.a文件

<<<<<<< HEAD
###5.编写主函数

=======
5.编写主函数
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37
main.c
```
#include <stdio.h>
#include "lib.h"

int main(void)
{
	printf("%d %d\n",add(5,3),minus(5,3));
    
    return 0;
}
```

<<<<<<< HEAD
###6.编译程序
=======
6.编译程序
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

`gcc -o main main.c -I . -L . -lfoo`

`-I`后面是.h所在的目录

`-L`后面是.a所在的目录

`-lfoo`表示所用的库存是libfoo.a

##共享库的生成

<<<<<<< HEAD
###1.编写头文件
=======
1.编写头文件
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

lib.h
```
int add(int, int);
int minus(int, int);
```

<<<<<<< HEAD
###2.编写实现文件
=======
2.编写实现文件
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

bill.c
```
int add(int a, int b)
{
	return a+b;
}
```
fred.c
```
int minus(int a, int b)
{
	return a-b;
}
```

<<<<<<< HEAD
###3.将.c文件编译生成.o文件
=======
3.将.c文件编译生成.o文件
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

`gcc -fPIC -c bill.c -o bill.o`

`gcc -fPIC -c fred.c -o fred.o`

<<<<<<< HEAD
###4.生成共享库
=======
4.生成共享库
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37

`gcc -shared -Wl,-soname,libcalc.so.1 -o libcalc.so.1.0.0 bill.o fred.o`

`ln -s libcalc.so.1.0.0 libcalc.so.1`

`ln -s libcalc.so.1.0.0 libcalc.so`

先利用gcc生成.so.1.0.0文件，再利用ln命令生成.so .so.1文件

<<<<<<< HEAD
###5.编写主函数
=======
5.编写主函数
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37
main.c
```
#include <stdio.h>
#include "lib.h"

int main(void)
{
	printf("%d %d\n",add(5,3),minus(5,3));
    
    return 0;
}
```

<<<<<<< HEAD
###6.编译程序

`gcc -o main main.c -I . -L . -lcalc`

###7.将动态库位置添加到/etc/ld.so.conf中
=======
6.编译程序

`gcc -o main main.c -I . -L . -lcalc`

7.将动态库位置添加到/etc/ld.so.conf中
>>>>>>> 94726b53ec93cd502d7d46636a89d2558c8afa37




