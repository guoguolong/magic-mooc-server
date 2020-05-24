DELETE FROM role;
INSERT INTO role (id, code, name, config, memo) VALUES
(1, 'ROLE_ADMIN', '管理员', '{"actions":"user_read,user_manage,group_read,group_manage,feed_read,feed_manage,question_read,question_manage,tag_read,tag_manage,course_read,course_manage,order_read,order_manage,privilege_manage"}', '除权限管理外的所有权限');

DELETE FROM "user";
INSERT INTO "user" (phone,username,email, password,job_title) VALUES
('18551710938', 'allen', 'elon.guo@gmail.com', md5('12345'), 'Software Engineer'),
('13817653718', 'admin', 'admin@magicmooc.com', md5('admin'), 'UI Designer')
;

DELETE FROM "course";
INSERT INTO course(id, name, summary, start_article_id) VALUES
(10, 'C Language', 'C语言是计算机中最基础的高级编程语言，是***训练程序思维***和***理解计算机原理***最佳的语言。', 1),
(20, 'Foundation of CS', 'Foundation of Computer Science 是进入计算机专业领域应该学习的第一课，目的是使初学者了解整个计算机知识体系，建立基本的专业知识结构，为后续学些打下坚实的理论基础', 75)
;

INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (2, '开发前的准备', NULL, 10, NULL, NULL, '', 1, 1, NULL, '2020-05-21 18:21:30.69955', '2020-05-21 18:21:30.69955', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (3, '开发环境准备', NULL, 10, NULL, NULL, '## 安装C代码编辑器：Sublime Text

<img src="https://img-camp.banyuan.club/online/c/ch1/sublime-logo.svg" width="150px" /> 我们推荐使用 Sublime Text: https://www.sublimetext.com/ 作为C语言代码编辑器，本课如有代码、视频演示都将采用它来示范。 Sublime Text 是前面提及的***预备知识***，基本安装我们这里不做展开。

### 代码格式化工具

***注：如果本节内容让你感觉晦涩，该工具可以稍后安装.***

要提及的是Sublime Text 的  [SublimeAStyleFormatter](https://packagecontrol.io/packages/SublimeAStyleFormatter) 插件，可以让我们保持良好的代码规范，以下是安装和设置 SublimeAStyleFormatter 插件的步骤（假设我们已经提前安装好了Sublime Text）：

* **安装和设置  [SublimeAStyleFormatter](https://packagecontrol.io/packages/SublimeAStyleFormatter) **
1. 打开Sublime Text，按CMD + SHIFT + P，在弹出的下拉列表里选择输入 `install`， 在过滤出来的列表中选择 `Package Control: Install Package`，按回车键，等在加载.

2. 加载完成，显示插件列表，在输入框里输入 `SublimeAStyleFormatter` 按回车，等待安装完成。安装完成时，会弹出一段文本说明该插件的用法。

   > 检验：写一段C代码，同时按 CTRL + ALT + f 组合键看看代码格式是不是干净整洁。

* **应用 [Google C 代码风格](https://github.com/google/styleguide)**

编辑文件 `.astylerc`，存储在当前用户目录下（即 ~/）

```
--style=google

--indent=spaces=4

--attach-namespaces
--attach-classes
--attach-inlines

--add-brackets

--align-pointer=name
--align-reference=name

--max-code-length=200
--break-after-logical

--pad-oper
--unpad-paren

--break-blocks
--pad-header
```

然后，定制插件配置：选择Sublime Text菜单的 Preferences->Package Settings->SublimeAStyleFormatter->Settings User 打开编辑器，输入下面的文本：

```json
{
    "options_default": {
        "indent": "spaces",
        "indent-spaces": 4,
    },
    "options_c": {
        "additional_options_file": "$HOME/.astylerc"
    },    
}
```

存储并关闭。

> 检验：写一段C代码，同时按 CTRL + ALT + f 组合键看看代码格式是不是干净整洁，和设置 `.astylerc` 之前有什么区别。

更多关于该插件的信息， 请参考 https://guoguolong.tech/2019/05/17/c/c-coding-style/

## 安装C代码编译器：GCC

<img src="https://img-camp.banyuan.club/online/c/ch1/gccegg-65.png" width="30px" /> ***编译器***和***编辑器***一字之差，却差别万里。编译器由 `compiler`直译，不过称之为***翻译器***更通用，意为：把书写的C语言代码翻译成计算机能识别的代码（即机器码），能担此重任中的软件有很多，在 macOS下我们通常使用 [gcc](https://www.gnu.org/software/gcc/)。

这里假设你已了解 [brew](https://brew.sh/)（你应该了解，因为这是预备知识的要求），进入终端（Terminal）安装 gcc，简单执行

> brew install gcc

不过，如果你正在配置一台新的 Mac 电脑，你可能发现当执行上述命令时，要求前置条件：安装 Xcode的 Command Line Tools，

> sudo xcode-select --install

根据提示输入你的 macOS 当前用户密码，完成安装 Command Line Tool，再执行安装 gcc 命令直到安装完成。

在命令行输入：

> gcc --version

如果回显类似下面的文字，那就证明安装对了。

> Configured with: --prefix=/Applications/Xcode.app/Contents/Develop....    
> Apple clang version 11.0.0 (clang-1100.0.33.17)

这里不得不多提及一句：如果不做特别设置，macOS 下用 brew 安装的 gcc 实际指向苹果公司的 clang 编译器，它是兼容 gcc 的，并且能更好地使用 macOS 系统特性。', 1, 2, NULL, '2020-05-21 18:21:30.735392', '2020-05-21 18:21:30.735392', 2);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (4, '第一个C语言程序', NULL, 10, NULL, NULL, '为了更清晰地管理自己的代码，我们创建 ~/projects/demo目录（以下多用 $demo_proj 代指），将所有工作成果（代码等）都放在该目录下。

## 编写 hello.c

用 Sublime Text 打开 $demo_proj 目录，添加 hello.c 文件，编辑内容如下：

```c
/* 第一个C语言程序 */
#include <stdio.h>

// C语言入口函数
int main() {
    puts("半圆学社");
    return 0;
}
```

编辑完后存储.

## 编译 hello.c

打开终端（Terminal），进入 $demo_proj 目录：

> cd ~/projects/demo

然后，运行 gcc 编译：

> gcc hello.c

将在当前目录生成 a.out 文件，该文件就是 hello.c 对应的机器码，即可以直接运行的程序。

## 运行程序

此时 $demo_proj 目录下的文件应该如下所示：

```
~/projects/demo
    |_ hello.c
    |_ a.out
```
在 终端（Terminal）下运行刚刚编译好的程序  a.out （当前已经在 $demo_proj 目录）

> ./a.out

屏幕显示：

> 半圆学社

## 分析

重新观察 hello.c 

```c
① /* 第一个C语言程序 */
② #include <stdio.h>

① /* C语言入口函数 */
③ int main() {
      ④ puts("半圆学社");
      ③ return 0;
③ }
```

将其分解为 4 个部分：

**①  注释**

`/* 第一个C语言程序 */` 和 `// C语言入口函数` 是代码注释或代码说明，两种风格而已，gcc编译代码时完全不理会里面的内容。
    
`//` 仅支持单行注释，代码说明放在  `//`  后面。   
`/* */` 支持多行注释，代码说明写在 /* */` 中间，上买的例子可以修改为：

```c
/*
 第一个C语言程序
 */
```

**② 包含别人的代码**

`#include <stdio.h>` 意为：包含（include）stdio.h 这个代码文件。
只要想向屏幕上输出文字，就要包含 stdio.h 文件，否则后面的 `puts("半圆学社");` 就会报错。逻辑上理解就是：只有包含 <stdio.h>，才能使用输出字符串到屏幕这个功能。

#include 语句放在文件的头部。

**③ 函数定义**

```c
int main() {
    /* 这里才是程序员要写的代码 */
    return 0;
}
```

`main` 是一个函数定义。gcc 编译的时候会寻找形如 `int main()` 的函数，代码运行的时候，就是从这个函数体 ` {}` 的第一行开始执行。因此  `int main()`  函数也称为C语言的入口函数。
    
***深入函数一点点***：回忆一下初中就学习过的函数：数字 x、y 经过运算得到 z，写成  `z = func(x, y)`。假设要实现功能：给定边长为x、y 的整数，求长方形的周长 z，那么在C语言里 `func` 函数的写法如下：

```c
/*
 函数定义包括：
    I. 函数名：func 是函数名
    II. 输出参数：函数名左侧描述函数计算结果的类型（不用写z），称输出参数。
       z 的类型是整数，C语言里整数用 int 表示。
    III. 输入参数：函数的输入参数用 () 括起来，依次书写参数类型 参数名，中间用逗号分隔
    IV. 函数体：功能实现的代码书写在 {} 中。
*/
int func (int x, int y) {
    int z = x + x + y + y; // 这里的 + 和数学里的加号一样，计算结果传给 z
    return z;  // 函数结果需要返回，用 return。
}
```

仔细类比一下，这和纸上的数学函数没什么本质区别，不过就是写法规则变化了。
    
**函数定义**和**函数调用**是一组相对的概念。即使 `func` 函数定义好了，如果没有明确说明使用它（即函数调用），那根本不会执行。调用  `func` 函数的语法如下：

```c
// 函数调用语法： 函数名()，括号里填入实际的参数值，即实参；如果函数有计算结果值，可以将值返回给一个符号。
// 函数调用后，将结果传给 result。也就是说：result代表的结果就是 22。
// 稍后我们可以通过puts输出到屏幕上验证。
int result = func(3, 8); 
```

现在回顾一下C语言入口函数 `main`，再比较前面代码注释中的 I、II、III、IV，是不是完全符合函数定义的规则呢？有一点点差别，就是 `main` 函数没有**输入参数**，C语言函数中没有输入参数、输出参数都是合法的。
    
最后，示例代码中并没有对 `main`做**函数调用**，它是怎么执行的呢？再强调用一次：`main` 函数是C 语言入口函数，gcc 编译运行的时候，会找到 `main` 函数体`{}` 内的代码一次执行。

**④ 函数调用**

`puts("半圆学社");` 是一条**函数调用**语句（语句总是以 ; 结尾）。`put` 函数的作用是把一串文字显示在屏幕上。书写格式符合前面举例的函数调用规则。函数名是 `puts`，`"半圆学社"`是一个字符串类型的参数，要求用 `""` 包围。

那么该 **函数定义**在哪里呢？现在，可以逻辑上认为它的定义在名字为 `"stdio.h"` 的文件里。如若不然，将 `#include <stdio.h>` 语句删除，再执行 gcc 一定是编译不通过的。

正如你所见，必须遵循如上种种 C 语言编写规则，屏幕上才能显示 “半圆学社”。既然说C语言如此接近硬件，那么 **hello.c** 为什么没有让人有找到真相的感觉呢？必须承认，我们仍然被牢牢地地控制于[异次元世界](https://baike.baidu.com/item/%E5%BC%82%E6%AC%A1%E5%85%83%E9%AA%87%E5%AE%A2/7326298?fr=aladdin)。自由是相对的，但这已经可能是接近真理的最好的开端。
', 2, 2, NULL, '2020-05-21 18:21:30.822923', '2020-05-21 18:21:30.822923', 2);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (5, '正确地书写源代码', NULL, 10, NULL, NULL, '## 理解源代码

“源代码” 即C语言代码，是英文 Source Code 的直译，和“目标代码”是相对的。目标代码即计算机可识别的机器码。为了让编译器能够正确将 “源代码”  翻译成目标代码，需要遵循正确的书写规范。

在开发软件的过程中，我们需要将编写好的源代码（简称代码或 Code）保存到一个文件中，这样代码才不会丢失。在合适的时候编译器编译该文件，最终变成可执行程序（文件）。这种用来保存代码的文件就叫做 **源文件（Source File）**。

每种编程语言的源文件名都有特定的后缀，以方便被编译器识别，被程序员理解。源文件后缀大都根据编程语言本身的名字来命名，例如：

- C语言源文件的后缀是`.c`；
- C++语言（C Plus Plus）源文件的后缀是`.cpp`；
- Java 源文件的后缀是`.java`；

源文件的后缀仅仅是为了表明该文件中保存的是某种语言的代码（例如`.c`文件中保存的是C语言代码），这样程序员更加容易区分，编译器也更加容易识别，它并不会导致该文件的内部格式发生改变。

> C\++ 文件扩展名： C++ 是站在C语言的肩膀上发展起来的，是在C语言的基础上进行的扩展，C++ 包含了C语言的全部内容，将C语言代码放在`.cpp`文件中不会有错，很多初学者都是这么做的，很多大学老师也是这么教的。但是强烈建议将C语言代码放在`.c`文件中，这样能够更加严格地遵循C语言的语法，也能够更加清晰地了解C语言和C++的区别。

## 使用半角字符

计算机起源于美国，C语言、C++、Java、JavaScript 等很多流行的编程语言都是美国人发明的，所以在编写代码的时候必须使用**英文半角输入法**，尤其是标点符号，初学者一定要引起注意。

例如，上节我们使用 puts 语句在显示器上输出内容：

```c
puts("半圆学社");
```

这里的括号、双引号、分号都必须是英文符号，而且是半角的。下面的书写会导致编译出错

```c
puts(“半圆学社”);
```

英文符号要么在英文输入法下输入，如果使用中文输入法，必须切换符号为半角状态：

* 搜狗输入法切换到英文半角状态![img](https://img-camp.banyuan.club/online/c/ch1/sogo-input.png)

* macOS 自带拼音输入法切换半角

<img src="https://img-camp.banyuan.club/online/c/ch1/mac-pinyin.jpg" width="280px"/>

一些相似的中英文标点符号，请注意区分：

|符号名字|中文|英文|
|---|---|---|
|分号|；|;|
|逗号|，|,|
|括号|（）|()|
|问号|？|?|
|冒号|：|:|
|双引号|“|"|
|单引号|‘|''|
|竖线|｜|\||

> NOTE:  初学者请务必注意标点符号的问题，它们在视觉上的差别很小，一旦将英文符号写成中文符号就会导致错误，而且往往不容易发现。

## 空白字符

空格、制表符、换行符等统称为空白符（space character），它们只用来占位，并没有实际的内容，也显示不出具体的字符。

* 空格： 按 Space键 输入空格;
* 制表符：现代计算机只有水平制表符了。对于大部分编辑器，按下 Tab 键默认就是输入一个水平制表符，默认4个空格缩进的效果，但实际是一个字符。通常我们都对编辑器进行设置，使Tab键按下时，实际输入空格替代，对于Sublime Text ，可以进入菜单 `View->Indentation` ，勾选 `Ident Using Spaces`。
* 换行符：按 Enter 键换行。

对于编译器，代码中有的空白符会被忽略，有的却不能。之前 hello.c 的代码写成下几种格式都是合法的：

```c
/* 第一个C语言程序 */
#include <stdio.h>
// C语言入口函数
int main()
{
puts  ("半圆学社");
return 0;
}
```

```c
/* 第一个C语言程序 */
#include <stdio.h>
// C语言入口函数
int main(){puts("半圆学社");return 0;}
```
再看下面几种 puts 的写法：

```c
#include <stdio.h>

int main() {
    puts("半圆");
    puts("学社");
   
    puts
    ("半圆学社");
   
    puts
    (
    "半圆学社"
    )
    ;
   
    puts   ("半圆学社");

    puts    (    "半圆学社"    )    ;

    return 0;
}
```

运行结果：

>半圆    
>学社    
>半圆学社    
>半圆学社    
>半圆学社    
>半圆学社    

看到输出结果，说明代码没有错误，以上几种 puts 的用法是正确的。`puts`和`()`之间、`" "`和`()`之间可以有任意的空白符，它们会被编译器忽略，编译器不认为它们是代码的一部分，它们的存在只是在编辑器中呈现一定的格式，让程序员阅读方便。

需要注意的是，由`" "`包围起来的字符串中的空白符不会被忽略，它们会被原样输出到控制台上；并且字符串中间不能换行，否则会产生编译错误。请看下面的代码：

```c
#include <stdio.h>

int main() {
    puts("半圆  学 社");
    puts("半圆
    学社");
    return 0;
}
```

这个同学自己动手编译检验一下。

> 程序员要善于利用空白符：缩进（制表符）和换行可以让代码结构更加清晰，空格可以让代码看起来不那么拥挤。专业的程序员同样追求专业的代码格式。', 3, 2, NULL, '2020-05-21 18:21:30.959276', '2020-05-21 18:21:30.959276', 2);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (6, '理解程序翻译过程', NULL, 10, NULL, NULL, '我们平时所说的程序，是指双击后就可以直接运行的程序，这样的程序被称为可执行程序（Executable Program）。在 Windows 下，可执行程序的后缀有`.exe`和`.com`（其中`.exe`比较常见）；在类 UNIX 系统（Linux、macOS 等）下，可执行程序没有特定的后缀，系统根据文件的头部信息来判断是否是可执行程序。

可执行程序的内部是一系列计算机指令和数据的集合，它们都是二进制形式的，CPU 可以直接识别，毫无障碍；但是对于程序员，它们非常晦涩，难以记忆和使用。

例如，在屏幕上输出“VIP会员”，C语言的写法为：

```c
puts("VIP会员");
```

二进制的写法为：

![img](https://img-camp.banyuan.club/online/c/ch1/machine-codes.jpg)


你感受一下，直接使用二进制是不是想撞墙，是不是受到一吨重的伤害？

> 在计算机发展的初期，程序员就是使用这样的二进制指令来编写程序的，那个拓荒的年代还没有编程语言。

直接使用二进制指令编程对程序员来说简直是噩梦，尤其是当程序比较大的时候，不但编写麻烦，需要频繁查询指令手册，而且除错会异常苦恼，要直接面对一堆二进制数据，让人眼花缭乱。另外，用二进制指令编程步骤繁琐，要考虑各种边界情况和底层问题，开发效率十分低下。

这就倒逼程序员开发出了编程语言，提高自己的生产力，例如汇编、C语言、C++、Java、Python、Go语言等，都是在逐步提高开发效率。至此，编程终于不再是只有极客能做的事情了，不了解计算机的读者经过一定的训练也可以编写出有模有样的程序。

## 编译（Compile）

C语言代码由固定的词汇按照固定的格式组织起来，简单直观，程序员容易识别和理解，但是对于CPU，C语言代码就是天书，根本不认识，CPU只认识几百个二进制形式的指令。这就需要一个工具，将C语言代码转换成CPU能够识别的二进制指令，这个工具是一个特殊的软件，叫做**编译器（Compiler）**。

编译器能够识别代码中的词汇、句子以及各种特定的格式，并将他们转换成计算机能够识别的二进制形式，这个过程称为**编译（Compile）**。

编译也可以理解为“翻译”，类似于将中文翻译成英文、将英文翻译成象形文字，它是一个复杂的过程，大致包括词法分析、语法分析、语义分析、性能优化、生成可执行文件五个步骤，期间涉及到复杂的算法和硬件架构。对于学计算机或者软件的大学生，“编译原理”是一门专业课程，有兴趣的读者请自行阅读《[编译原理](https://book.douban.com/subject/3296317/)》一书，这里我们不再展开讲解。

> 注意：不了解编译原理并不影响我们学习C语言，我也不建议初学者去钻研编译原理，贪多嚼不烂，不要把自己绕进去。

C语言的编译器有很多种，不同的平台下有不同的编译器，例如：

- Windows 下常用的是微软开发的 MSVC，它被集成在 Visual Studio 中；

- Linux 下常用的是 GUN 组织开发的 GCC，很多 Linux 发行版都自带 GCC；

- macOS 下常用的是 LLVM/Clang，它被集成在 Xcode 中（Xcode 以前集成的是 GCC，后来由于 GCC 的不配合才改为 LLVM/Clang，LLVM/Clang 的性能比 GCC 更加强大）。

  > 用前文提及的 brew install gcc 的方法安装gcc，实际指向的仍然是 clang，这是我们本课使用的方法。


你的代码语法正确与否，编译器说了才算，我们学习C语言，从某种意义上说就是学习如何使用编译器。

编译器可以 100% 保证你的代码从语法上讲是正确的，因为哪怕有一点小小的错误，编译也不能通过，编译器会告诉你哪里错了，便于你的更改。

## 链接（Link）

C语言代码经过编译以后，并没有生成最终的可执行文件，而是生成了一种叫做目标文件（Object File）的中间文件（或者说临时文件）。目标文件也是二进制形式的，它和可执行文件的格式是一样的。对于 MSVC，目标文件的后缀是`.obj`；对于 GCC，目标文件的后缀是`.o`。

目标文件经过链接（Link）以后才能变成可执行文件。既然目标文件和可执行文件的格式是一样的，为什么还要再链接一次呢，直接作为可执行文件不行吗？

不行的！因为编译只是将我们自己写的代码变成了二进制形式，它还需要和其他程序（比如标准库、动态链接库里提供的功能）结合起来，这些都是程序运行所必须的。

**链接（Link）**其实就是一个“打包”的过程，它将所有二进制形式的目标文件和系统组件组合成一个可执行文件。完成链接的过程也需要一个特殊的软件，叫做**链接器（Linker）**。

随着我们学习的深入，我们编写的代码越来越多，最终需要将它们分散到多个源文件中，编译器每次只能编译一个源文件，生成一个目标文件，这个时候，链接器除了将目标文件和系统组件组合起来，还需要将编译器生成的多个目标文件组合起来。

再次强调，编译是针对一个源文件的，有多少个源文件就需要编译多少次，就会生成多少个目标文件。

## 总结

不管我们编写的代码有多么简单，都必须经过「编译 --> 链接」的过程才能生成可执行文件：

- 编译就是将我们编写的源代码“翻译”成计算机可以识别的二进制格式，它们以目标文件的形式存在；
- 链接就是一个“打包”的过程，它将所有的目标文件以及系统组件组合成一个可执行文件。

如果不是特别强调，一般情况下我们所说的“编译器”实际上也包括了链接器，比如，你使用了哪种编译器？去哪里下载C语言编译器？我的编译器为什么报错了呢？

>  所以我们通常说 “gcc 是编译器” 是广义的，实际上它涵盖了代码编译 和 链接等多个步骤，是一站式代码翻译软件。', 4, 2, NULL, '2020-05-21 18:21:30.990272', '2020-05-21 18:21:30.990272', 2);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (7, 'C语言开发调试', NULL, 10, NULL, NULL, '## 编译链接时警告和错误

一段C语言代码，在编译、链接和运行的各个阶段都可能会出现问题。编译器只能检查编译和链接阶段出现的问题，而可执行程序已经脱离了编译器，运行阶段出现问题编译器是无能为力的。

尝试一下前面代码，存储到 $demo_proj/main.c ：

```c
#include <stdio.h>

int main() {
    puts("半圆  学 社");
    puts("半圆
    学社");
    return 0;
}
```
在终端（Terminal）里运行：
>gcc main.c -o main

注：这里我们使用 gcc 的 -o 参数，试图生成可执行的文件名 main （而不采用默认的a.out）。现在结果是编译失败，根本没生成可执行文件 main， 屏幕回显：

>
>```
>main.c:5:10: warning: missing terminating ''"'' character [-Winvalid-pp-token]
>    puts("半圆
>         ^
>main.c:5:10: error: expected expression
>main.c:6:11: warning: missing terminating ''"'' character [-Winvalid-pp-token]
>    学社");
>        ^
>main.c:8:2: error: expected ''}''
>}
> ^
>main.c:3:12: note: to match this ''{''
>int main() {
>           ^
>2 warnings and 2 errors generated.
>```

根据提示将
```
puts("半圆
    学社");
```
修正为：
```c
puts("半圆学社");
```
再次编译就成功生成 main 可执行文件了。编译时问题一般分为错误（Error）和警告（Warning）：

* 错误（Error）表示程序不正确，不能正常编译、链接或运行，必须要纠正。
* 警告（Warning）表示可能会发生错误（实际上未发生）或者代码不规范，但是程序能够正常运行，有的警告可以忽略，有的要引起注意。

> 一个技巧是：每写一点代码就去执行 gcc 编译和运行，有错误立即纠正。小步前进，保持对自己的代码有持续的信心。

## 调试运行时错误：使用 printf 输出中间值

当运行码时，如果总是得到难以理解的错误运算结果（此时是成功完成编译链接了的，没有 Error 和 Warning），一个基本的方法是：在代码合适的地方打印中间变量值，观察边界处是否处理正确。

比如，写一个计算数字 [阶乘](https://baike.baidu.com/item/%E9%98%B6%E4%B9%98/4437932?fr=aladdin) 的函数，文件存储为 $demo_proj/main.c：

```c
#include <stdio.h>

int factorial(int n) {
    int result = 1;
    for(int i = 1; i < n; i++) {
        result = i * result;
    }
    return result;
}

int main() {
    int r = factorial(4);
    printf("Result: %d\n", r);
    return 0;
}
```
上面是一个简单的阶乘实现，计算 4 的阶乘，预期结果应该是：1 * 2 * 3  * 4 = 24，但是结果是 6 

>Result: 6

为此，我们在代码中加入 printf 中间值 result，看看哪里出错了

```c
#include <stdio.h>

int factorial(int n) {
    int result = 1;
    for(int i = 1; i < n; i++) {
        printf("Times %d, result = %d x %d\n", i, i , result);
        result = i * result;
    }
    return result;
}

int main() {
    int r = factorial(4);
    printf("Result: %d\n", r);
    return 0;
}
```
再次编译运行 main.c

>gcc main.c -o main
>./main

屏幕回显：

>Times 1, result = 1 x 1    
>Times 2, result = 2 x 1    
>Times 3, result = 3 x 2    
>Result: 6    

显然，循环少了一次，所以代码：

```c
for(int i = 1; i < n; i++) {
```

应该修正为：

```CQL
for(int i = 1; i <= n; i++) {
```

## 调试运行时错误：使用专门 debugger 工具

### Linux 下的 GDB

<img src="https://img-camp.banyuan.club/online/c/ch1/gdb-logo.svg" width="60px"/> [gdb](https://www.gnu.org/software/gdb/) 适合 Unix Like 系统。

>注：由于不同版本 gdb 在 macOS 下可能存在或大或小的 bug， 如果 gdb 不能在你的 macOS 下工作，请使用 macOS 自带的 lldb，它和gdb基本兼容，并且更优秀。

####  1. 安装 gdb

>brew install gdb

Ubuntu linux 使用 `sudo apt install gdb` 安装。

####  2. 写一个例程
仍然以上文求阶乘的 `main.c` 为例，去掉 printf 打印中间值语句，转而使用 gdb 调试。为了使用 gdb，需要在编译源代码时植入调试信息，如果用 gcc 编译 的，即增加 -g 参数。从终端进入 main.c 所在目录，运行：

>gcc main.c -o main -g

这样就生成了一个包含调试信息的可执行文件 main

#### 3. 运行gdb调试
仍然在可执行i文件 main 所在目录，运行：

>sudo gdb main 

由于 macOS 对 gdb 的权限安全要求，使用 sudo 来避免繁琐的设置。不过在 Linux 就不用 sudo 了。    
这时就进入 gdb 调试命令行状态，等待接受更多 gdb 命令

>(gdb) 

本示范用到的 gdb 命令包括：
* l 查看源代码
* b 设置断点
* r 运行代码
* n 单步运行
* s 进入函数内部
* watch 设置观察点（变量）
* c 继续进行到下一断点
* q 退出 gdb

**步骤 1: l 查看源代码，找到要加断点的行**

```c
(gdb) l
1    #include <stdio.h>
2    
3    int factorial(int n) {
4        int result = 1, i = 1;
5        for(i = 1; i < n; i++) {
6            result = i * result;
7        }
8        return result;
9    }
10    
(gdb) 
11    int main() {
12        int r = factorial(4);
13        printf("Result: %d\n", r);
14        return 0;
15    }
(gdb) 
```
输入 l，显示 10 行代码，按回车键继续下10行，直到查看源代码完毕。如果想重新查看输入l 1，表示从第一行重新查看。

我们关注的行显然是第 13 行 `int r = factorial(4);`，因为就它运算结果出错了嘛 。

**步骤 2: b 给指定的行加上断点**

给第 13 行代码加上断点
```
(gdb) b 13
Breakpoint 1 at 0x40057e: file main.c, line 13.
```

**步骤 3: r 运行程序 main**

```
(gdb) r
Starting program: /Users/koda/projects/demo/main 

Breakpoint 1, main () at main.c:12
12        int r = factorial(4);
```
程序停在第 12 行。

**步骤 4: s 进入函数内部调试**

输入 s 命令进入函数 factorial 内部：
```
(gdb) s
factorial (n=4) at main.c:4
4        int result = 1, i = 1;
```
停在函数内部的第一条语句。

**步骤 5: watch 设置关注的变量**

```
(gdb) watch i
Hardware watchpoint 2: i
```
**步骤 6: n 单步执行观察关注的变量 i 的变化**

应该说步骤1～5都是准备工作，这一步才是核心，输入 n 单步执行代码看 i 的变化，每次 i发生了变化，屏幕都将输出 i 的当前和上一次的值，如：

```
Old value = 0
New value = 1
0x000000000040053b in factorial (n=4) at main.c:5
```
通过 n 完整地运行完函数 factorial，操作如下：

```
(gdb) n

Hardware watchpoint 2: i

Old value = 0
New value = 1
factorial (n=4) at main.c:5
5        for(i = 1; i < n; i++) {
(gdb) n
6            result = i * result;
(gdb) n
5        for(i = 1; i < n; i++) {
(gdb) n

Hardware watchpoint 2: i

Old value = 1
New value = 2
0x0000000000400552 in factorial (n=4) at main.c:5
5        for(i = 1; i < n; i++) {
(gdb) n
6            result = i * result;
(gdb) n
5        for(i = 1; i < n; i++) {
(gdb) n

Hardware watchpoint 2: i

Old value = 2
New value = 3
0x0000000000400552 in factorial (n=4) at main.c:5
5        for(i = 1; i < n; i++) {
(gdb) n
6            result = i * result;
(gdb) n
5        for(i = 1; i < n; i++) {
(gdb) n

Hardware watchpoint 2: i

Old value = 3
New value = 4
0x0000000000400552 in factorial (n=4) at main.c:5
5        for(i = 1; i < n; i++) {
(gdb) n
8        return result;
```
是有点乱，查看 (gdb)  开头的行，都是要用户输入交互命令才能继续执行程序。从上图可以看到 i 的值最终是 4 的 时候，退出循环走到函数末尾，此时 `result = i * result` 才执行 3次啊。所以答案已经找到了，代码 `i< n` 需要修正为 `i <= n` 。

**步骤 7: c 完成后面的步骤**

```
(gdb) c
Continuing.

Watchpoint 2 deleted because the program has left the block in
which its expression is valid.
0x0000000000400571 in main () at main.c:12
12        int r = factorial(4);
(gdb) c
Continuing.
Result: 6
[Inferior 1 (process 27602) exited normally]
```
既然已经找到出问题的原因了，执行 c 表示继续执行到下一个断点。本例首先退出函数，删除 watch 设置的观察点，然后再执行 c，由于没有下一个断点，程序一路执行完毕。

最后，输入 q 退出 gdb 调试。

更多 gdb 用法，请参考： http://gnu.org/software/gdb

###  macOS 下的 LLDB

macOS 下 XCode 自带的调试器，基本兼容 gdb ，又比 gdb 更胜一筹。

####  1. 安装 lldb

安装 Xcode 或者 brew install gcc 都会要求安装 Command Line Tools工具，这都会自动安装好 lldb，不需要单独安装。

####  2. 准备例程

>gcc main.c -o main -g

仍然是前面的例子。

#### 3. 运行 lldb

> lldb main

lldb 和的基本命令和 gdb 兼容， watch 不同，将：

> watch i

改成

> watchpoint set var i

然后，模仿 gdb 的过程调试 main， 看看是不是非常类似？', 5, 2, NULL, '2020-05-21 18:21:31.019568', '2020-05-21 18:21:31.019568', 2);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (8, '指针', NULL, 10, NULL, NULL, '', 10, 1, NULL, '2020-05-21 18:21:31.110227', '2020-05-21 18:21:31.110227', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (9, '指针', NULL, 10, NULL, NULL, '在c语言编程中，指针是非常重要的一个概念，它的作用是“指示对象”。本节我们就来学习指针的相关内容。

## 函数的参数

代码清单 demo1.c 中的程序是用来计算两个整数的和与差的。

**代码清单 demo1.c**

```c
/*
计算两个整数的和与差（误例）
*/
#include <stdio.h>

/*将n1和n2的和、差分别保存至sum、diff（误例）*/
void sum_diff(int n1, int n2, int sum , int diff) {
    sum = n1 + n2;
    diff = (n1 > n2) ? n1 - n2 : n2 - n1;
}

int main() {
    int na, nb;
    int wa = 0, sa = 0;

    puts("请输入两个整数。");
    printf("整数A："); scanf("%d", &na);
    printf("整数B："); scanf("%d", &nb);

    sum_diff(na, nb, wa, sa);

    printf("两数之和为%d，之差为%d。\n", wa, sa);

    return 0;
}    
```

sum_diff函数会求出参数n1和n2所接收的值的和与差，并赋给sum和diff。

main函数调用sum_diff函数时，实参na、nb、wa、sa的值会分别传给形参n1、n2、sum、diff。这个复制过程是单向的，这种参数传递方式称为值传递。这样，即使改变sum_diff函数中形参sum、diff的值，原来的wa、sa也不会发生任何变化。

因此，在调用sum_diff函数之后，在main函数中被初始化为0的wa和sa的值依然是0。

另外，通过前面的学习我们知道，函数返回到调用源的返回值只能有1个，不能返回两个以上的值。因此也不能将和、差返回给函数。

为了解决这个问题，必须掌握C语言学习的难点之一——**指针(pointer)**。本章中我们将学习指针的基础知识。

## 对象和地址

变量是“保存数值的盒子”，它并不是像图1(a)那样无序存放的，而是如图1(b)那样有序地排列在内存空间里。

<img src="https://img-camp.banyuan.club/online/c/ch10/1.png" width="600px" /> 
**图1 对象**

“变量”具有多个侧面或者说多个属性。举例来说，其中一个属性就是**数据类型长度**。图中int型变量n和double型变量x就具有不同的长度。这两个变量的长度可分别通过sizeof(n)和sizeof(x)求得。

>► 当然，在有些编译器中sizeof(int)和sizeof(double)是相等的，但是构成它们的每一位的意义却不尽相同，这在前面章节已经进行了说明。

**数据类型**决定了变量可以表示的数值范围。除此之外，表示变量在内存中生命期范围的**存储期**以及n、x等**变量名**也都是变量的重要属性。

在广阔的内存空间上，存在着很多对象，这就需要用某种方式来表示各个对象在内存中的“位置”，这就是**地址(address)**。

英语单词address可以表示“演说”“地址”等意思。这里我们不妨把它理解为“地址”。因为它正好和地址中的门牌号是一样的。

>■注意■ 对象的地址是指对象在内存中的存储位置编号。

在图1(b)中，int型对象n的地址为212，double型对象x的地址为216。

## 取址运算符

每个对象都有地址，那么我们来看看地址究竟是怎么样的。请见代码清单 demo2.c 所示程序。

**代码清单 demo2.c**

```c
/*
显示对象的地址
*/
#include <stdio.h>

int main() {
    int n;
    double x;
    int a[3];

    printf("n   的地址：%p\n", &n);
    printf("x   的地址：%p\n", &x);
    printf("a[0]的地址：%p\n", &a[0]);
    printf("a[1]的地址：%p\n", &a[1]);
    printf("a[2]的地址：%p\n", &a[2]);

    return 0;
}
```
>► 对象的地址通常是用十六进制数表示的。但是不同的编译器或不同的运行环境下，基数、位数等显示形式以及具体数值都会有所不同。这里给出是一例子，并不是是说一定要这样表示。

我们一直使用的**单目运算符&(unary & operator)**通常被称为**取址运算符(address operator)**。将&运算符写在对象名之前，就可以得到该对象的地址(表1)。如果对象的长度为2,占用212号和213号内存单元，那么该对象的地址就是它的首地址212号。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-2.png?x-oss-process=image/resize,w_250/sharpen,100)

**图2 取址**

**■表1 单目运算符&(取址运算符)**

|---|---|---|
|---|---|---|
|单目运算符&|&a|取得a的地址(生成指向a的指针)|


>► 在此之前的程序中，都在传递给scanf函数的实参中应用了取址运箄符。另外，双目运算符&为前面学习的按位与(AND)逻辑运算符。

>■注意■ 取址运算符&的功能是取得对象的地址。

表示对象地址的转换说明为%p。

>► 转换说明%p中的p是pointer的首字母。

## 指针

只显示对象的地址没有太大的用处，我们还是来看代码清单 demo3.c 中更具实际作用的程序吧。

**代码清单 demo3.c**

```c
/*
通过指针间接的操作身高
*/
#include <stdio.h>

int main() {
    int sato = 178;/*佐藤的身高*/
    int sanaka = 175;/*佐中的身高*/
    int masaki = 179;/*真崎的身高*/

    int *isako, *hiroko;

    isako = &sato;/*isako指向sato（喜欢佐藤）*/
    hiroko = &masaki;/*hiroko指向masaki（喜欢真崎）*/

    printf("伊沙子喜欢的人的身高%d\n", *isako);
    printf("洋子喜欢的人的身高%d\n", *hiroko);

    isako = &sanaka;/*isako指向sanaka（移情别恋）*/

    *hiroko = 180;/*将hiroko指向的对象赋值为180*/

    putchar(''\n'');
    printf("佐藤的身高%d\n", sato);
    printf("佐中的身高%d\n", sanaka);
    printf("真崎的身高%d\n", masaki);
    printf("伊沙子喜欢的人的身高%d\n", *isako);
    printf("洋子喜欢的人的身高%d\n", *hiroko);

    return 0;
}
```

在对变量isakco和hiroko的声明中，变量名前带有*。通过该声明定义了两个“指向int型变量的指针变量”，它们指向的是int型对象。

通过以下声明定义的hiroko不是指针变量，而是整型变量。

```
int *isako,hiroko;/*isako是指针变量，hiroko是整型变量*/
```

我们首先明确一下“int型变量”和“指向int型变量的指针变量”有什么区别。

```
int型变量: 保存“整数”的盒子。
指向int型变量的指针变量: 保存“存放整数对象的地址”的盒子。
```

下面我们以图3为例进行说明。int型sato的地址是212号。因此，若执行“isako=&sato”，isako中就会被存入212号。这时isako和sato的关系就是: ***isako指向sato***。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-3.png?x-oss-process=image/resize,w_300/sharpen,100)

**图3 int型变量和指向im型变量的指针变量**

>■注意■ 当指针p的值为对象x的地址时，一般说“p指向x”。

“指向”这一表述比较抽象，在这里可以理解成:

```isako喜欢sato```

接着进行hiroko=&masaki的赋值，那就可以得出

```hiroko喜欢masaki```

我们可以用图4来表示指针指向对象的情形。这里箭头指向的是喜欢的人。

isako的数据类型是“指向int型变量的指针型”。

```c
isako = &sato;
```

![image](https://img-camp.banyuan.club/cc001/chapter10/10-4.png?x-oss-process=image/resize,w_400/sharpen,100)

**图4 指针**

从以上赋值语句亦可发现，&sato的类型也是“指向int型变量的指针型”。取址运算符与其说是取得地址，不如说是生成指针。

表达式&sato如是指向sato的指针，其值为sato的地址。

>■注意■ 将取址运算符&写在Type型对象x前得到的&x为Type *型指针，其值为x的地址。

## 指针运算符

在进行显示的地方，就要用到叫作 **指针运算符(indirect operator)** 的**单目运算符 \*(unary \* operator)**了。将指针运算符 * 写于指针之前，就可以显示该指针指向的对象内容(表2）。

**■表2 单目运算符\*(指针运算符)**

|---|---|---|
|---|---|---|
|单目运算符\*|*a|a指向的对象|


因此，\*isako就等于“isako指向的对象”(伊沙子喜欢的男子的身高)。\*isako就是sato。\*isako是sato的别名(alias)。

本书中使用图5这种形式来表示指针。用虚线与对象连接的盒子中写有名字，这就是对象的别名。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-5.png?x-oss-process=image/resize,w_200/sharpen,100)

**图5 指针运算符和别名**

>■注意■ 当p指向x时，*p就是x的别名。

接下来我们继续思考赋值的情况。将指向sanaka的指针赋给isako,使isako指向sanaka。这样一来就变成了下面这样。

```isako喜欢sanaka```

isako移情别恋了呢!同理，如果将指向其他对象的指针赋给指针变量，那么该指针变量就会指向这些对象。

```
isako=&sanaka;
```

我们再来看另一种赋值形式。我们知道当\*hiroko指向masaki时，\*hiroko就是masaki的别名。那么，将180赋值于\*hiroko就等同于将180赋值于masaki。

```
*hiriko=180;
```
大家自行尝试运行程序，分析结果。', 1, 2, NULL, '2020-05-21 18:21:31.19964', '2020-05-21 18:21:31.19964', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (10, '指针和函数', NULL, 10, NULL, NULL, '在C语言程序中，指针的一个重要作用就是作为函数参数使用。本节就来学习作为函数参数的指针的相关内容。

## 作为函数参数的指针

洋子对于恋人的要求比较高，不过她具有超能力，所以如果恋人的身高低于180cm,她就能将他变为180cm。现在我们就用函数来实现洋子的超能力。

当然，如下所示的程序是实现不了的。原因正如本章开头所述，函数形参无论怎么修改，都只是临时性的复制，并不会反映到主调函数的实参中。

```c
void hiroko(int height) {
    if(height < 180)
        height = 180;
}
```

如果不能直接修改这个值，那么就通过指针间接地修改吧。见代码清单demo1.c所示程序。

**代码清单 demo1.c**

```c
/*
通过指针间接修改身高
*/
#include <stdio.h>

/*洋子（让身高不到180的人长到180）*/
void hiroko(int *height) {
    if (*height < 180)
        *height = 180;
}

int main() {
    int sato = 178;/*佐藤的身高*/
    int sanaka = 175;/*佐中的身高*/
    int masaki = 179;/*真崎的身高*/

    hiroko(&masaki);

    printf("佐藤的身高%d\n", sato);
    printf("佐中的身高%d\n", sanaka);
    printf("真崎的身高%d\n", masaki);

    return 0;
}
```



hiroko函数中，形参height被声明为“指向int型变量的指针变量”。函数被调用时,将&masaki(即216号)复制到height中，指针height便指向了masaki。即

```height喜欢masaki```

由于在指针前加上指针运算符*，就可显示该指针指向的对象。因此是masaki的别名。

若\*height的值小于180,则将180赋值给它。对\*height赋值，也就是对masaki赋值，所以即使从hiroko函数返回 ***main*** 函数，masaki中保存的依然是180。

综上所述，如果要在函数中修改变量的值，就需要传入指向该变量的指针，即告诉程序:

***传入的是指针哦，请对该指针指向的对象进行处理吧。***

只要在被调用的函数里的指针前写上指针运算符\*,就能间接地处理该指针指向的对象。这也是\*运算符又称为间接访问运算符的原因。

另外，通过在指针前写上指针运算符\*来访问该指针指向的对象，称为**解引用(dereference)**。

>► 图中假设masaki所在的地址为216号。今后若文中无特别说明，则都将在图中任意假定一个地址。

## scanf函数和指针

我们在遇到scanf函数的时候，曾这样讲过：与printf函数不同，在使用scanf函数进行读取时，变量名前必须加上一个特殊符号 &。。

scanf函数的使命是为主调函数中定义的对象保存值，倘若它接收到的纯粹是变量的“值”，是无法进行保存的。因此，scanf函数接收的是指针(具有地址的“值”)，由该指针所指对象保存从标准输入(一般为键盘)读到的值。

因此，调用scanf函数的一方必须发出如下请求。

```请放入该地址中存储的对象所读取的值!!```

## 指针的类型

前面代码中：

```c
void hiroko(int *height) {
```
如果调用时，使用 double * 类型的指针，编译器一般都会给出警告，所以应该避免指针类型不同。
```CQL
double *h;
hiroko(h);
```

## 空指针

**空指针(null pointer)** 是能够和指向对象的指针明确区分的“什么也不指向”的特殊指针。

表示空指针的对象式宏，是称为 ***空指针常量(null pointer constant)***的**NULL**。

>■注意■ 什么也不指向的特殊指针是空指针，表示空指针的对象式宏NULL是空指针常量。

空指针常量 NULL 在 `<stddef.h>`中定义。只要在预处理命令中包含 `<stdio.h>`、`<stdlib.h>`、`<string.h>`、`<time.h>` 中任意一个头文件，便可使用该宏定义。

下面是一个定义示例。

```
#define NULL 0/*定义示例：值因编译器而异*/
```

>► 实际使用空指针的程序和练习，我们將在以后学习。

## 作业

**● 练习 1**

>编写函数adjust_point，如果n指向的值小于0,就将其改为0:如果值大于100,就将其改为100(如果是0〜100的值，则不修改)。
>
>```
>void adjust_point(int *n){/*...*/}
>```

**● 练习 2**

>编写如下函数，将\*y年\*m月\*d日的日期，修改为其前一天或后一天的曰期。
>
>```
>void decrement_date(int *y,int *m,int *d){/*...*/}
>void increment_date(int *y,int *m,int *d){/*...*/}
>```
>
>注意计算时要考虑到闰年的问题。


**● 练习 3**

>编写如下函数，将n1、n2、n3指向的三个int型整数按升序排列。
>
>```c
>void sort3(int *n1,int *n2,int *n3){/*...*/}
>```', 2, 2, NULL, '2020-05-21 18:21:31.248715', '2020-05-21 18:21:31.248715', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (11, '指针和数组', NULL, 10, NULL, NULL, '指针和数组虽然是不同的东西，但有着千丝万缕的联系。本节我们就来学习二者的相同点和不同点。

## 指针和数组

关于数组，有很多规则需要理解。首先是下面这条规则。

>■注意■ 数组名原则上会被解释为指向该数组起始元素的指针。

也就是说，如果a是数组，那么表达式a的值就与a[0]的地址，即&a[0]—致。如果数组a的元素类型为Type型，那么不管元素个数是多少，表达式a的类型就是Type*型。

>► 有时数组a也不会被解释为指向其起始元素的指针(专题10-2)。

将数组名视为指针，也催生出了数组和指针的密切关系。让我们结合图A【a】来看一下。这里声明了数组a和指针p。指针p的初始值是a。因为数组名a会被解释为&a[0],所以存入p的值为&a[0]的值。也就是说，指针p会被初始化为指向数组a的起始元素a[0]。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-13.png?x-oss-process=image/resize,w_500/sharpen,100)

**图A 指向数组及各元素的指针**

>► 注意指针p指向的是“起始元素而不是“整个数组”。

围绕着指向数组元素的指针，有以下规则成立。

■注意■

>指针P指向数组中的元素e时，    
>p+i为指向元素e后第i个元素的指针。     
>p-i为指向元素e前第i个元素的指针。

让我们结合图【a】来理解一下。例如，p+2指向a[0]后第2个元素a[2]，p+3指向a[0]后第3个元素a[3]。

***☆专题10-2 数组名在什么情况下不被视为指向起始元素的指针***

在下述两种情况下，数组名不会被视为指向起始元素的指针。    
【1】作为sizeof运算符的操作数出现时     
sizeof(数组名)不会生成指向起始元素的指针的长度，而是生成数组整体的长度。      
【2】作为取址运算符&的操作数出现时      
&数组名不是指向起始元素的指针的指针，而是指向数组整体的指针。

也就是说，指向各元素的指针p+i和&a[i]是等价的。当然,&a[i]是指向元素a[i]的指针，其值是a[i]的地址。

我们通过代码清单 demo1.c来确认一下。该程序的作用是显示表达式&a[i]的值和表达式p+i的值。

**代码清单 demo1.c**

```c
/*
显示数组元素的地址（指向元素的指针）
*/
#include <stdio.h>

int main() {
    int i;
    int a[5] = {1, 2, 3, 4, 5};
    int *p = a;/*p指向a[0]*/

    for (i = 0; i < 5; i++)
        printf("&a[%d] = %p  p+%d = %p\n", i, &a[i], i, p + i);

    return 0;
}
```

从运行结果中可知，指向各元素的指针&a[i]和p+i的值是一致的。

但是，“p+i指向a[i]”，仅限于p指向a[0]的时候。例如，如图【b】所示，如果指针p指向a[2],那么指针p-1就指向a[1],指针p+1指向a[3]。

## 指针运算符和下标运算符

如果在指向数组内元素的指针p+i前写上指针运算符\*,会变成什么情况呢?

因为p+i是指向P所指元素后第i个元素的指针，所以在其前加上指针运算符后得到的\*(p+i)就是该元素的别名。因此，如果p指向a[0]，那么表达式*(p+i)就表示a[i]本身。

请大家记住下面这条规则。

>■注意■ 
>
>指针p指向数组中的元素e时，       
>指向元素e后第i个元素的\*(p+i),可以写为p[i]。      
>指向元素e前第i个元素的\*(p-i),可以写为p[-i]。

大家可以结合图B来理解这条规则，同时图B也对上一节中的图【a】进行了细化。让我们以第3个元素a[2]为例来看一下。

* 因为p+2指向a[2]，所以\*(p+2)是a[2]的别名(图【C】)。  
* 因为\*(p+2)可以写成p[2],所以p[2]也是a[2]的别名(图【B】)。
* 数组名a是指向起始元素a[0]的指针，所以a+2就是指向第3个元素a[2]的指针(图中左侧的箭头)。
* 因为指针a+2指向元素a[2],所以在其前写上指针运算符后得到的\*(a+2)就是a[2]的别名(图【A】)。

也就是说，图【A】〜【C】中的表达式\*(a+2)、p[2]、*(p+2),都是数组元素a[2]的别名。

上面我们以a[2]为例进行了说明，接下来我们来看一下一般情况。

以下4个表达式都是访问各元素的表达式。

```
【1】a[i] *(a+i) p[i] *(p+i)  从开头数第i个元素
```

以下4个表达式都是指向各元素的指针。

```
【2】&a[i] a+i &p[i] p+i    指向从开头数第i个元素的指针
```

![image](https://img-camp.banyuan.club/cc001/chapter10/10-14.png?x-oss-process=image/resize,w_500/sharpen,100)

**图B 指向数组元素的指针和元素的别名**

>► 指向起始元素的指针a+0和p+0,可以直接写作a和p。另外，它们的别名\*(a+0)和\*(p+0).也可分别用\*a和\*p表示。

我们结合实际程序来确认一下上述内容，如代码清单 demo2.c所示。代码清单 demo2.c

**代码清单 demo2.c**

```c
/*
显示数组元素的值和地址
*/
#include <stdio.h>

int main() {
    int i;
    int a[5] = {1, 2, 3, 4, 5};
    int *p = a;
    for (i = 0; i < 5; i++)
        printf("a[%d] = %d  *(a+%d) = %d  p[%d] = %d  *(p+%d) = %d\n",
               i, a[i], i, *(a + i), i, p[i], i, *(p + i));

    for (i = 0; i < 5; i++)
        printf("&a[%d] = %p  a+%d = %p  &p[%d] = %p  p+%d = %p\n",
               i, &a[i], i, (a + i), i, &p[i], i, (p + i));

    return 0;
}
```

该程序的作用是显示int[5]型数组a的所有元素的值和指向元素的指针。

【1】的4个表达式和【2】的4个表达式，表示的都是同一个值。

>► 数组a的元素个数为n时，构成数组a的元素是a[0]到a[n-1].共“n个”。但是，指向数组元素的指针,则可以是&a[0]到&a[n]共“n+1”个。例如，数组a由a[0]到a[4]共5个元素构成，而指向各元素的指针除了有&a[0]、&a[1]、...、&a[4]之外，还有&a[5]\(共6个)。
>
>之所以会出现这种情况，是因为在对遍历数组元素的结束条件(是否到达了末尾)进行判定时，如果可以利用指向末尾元素后一个元素的指针的话将会非常方便。但是，并不是说&a[6]、&a[7]、...可以正确指向a[4]之后的第2、3...个元素。

综上，我们可以总结出下面一条规则。

>■注意■ Type*型指针p指向Type型数组a的起始元素a[0]时，指针p的行为就和数组a本身一样。

表达式a[i]和p+i中的i,表示位于指针a和p所指的元素后第几个元素的位置。因此，数组起始元素的下标必须是0。原则上不允许像其他编程语言那样，下标从1开始，或者自由地指定上限值和下限值。

>■注意■ 数组的下标表示位于起始元素后的第几个元素的位置，因此必须从0开始。

虽然可以为指针加上整数，但是指针之间相加是不可以的。

>► 不过，指针之间做减法是OK的。

## 数组和指针的不同点

上面我们学习了数组和指针的相似之处。下面我们来学习二者的不同之处。

首先来看代码段【1】，p是指向int型变量的指针，被赋给p的是y,即&y[0]。赋值后，指针p指向y[0]。

**【1】**

```c
int *p;
int y[5];
p = y;
```
**【2】**

```c
int a[5];
int b[5];
a = b;/*错误*/
```

再来看代码段【2】。执行a=b会出现编译错误。这一点我们已经在前面介绍过了。虽说a会被解释为指向数组起始元素的指针，但不可改写其值。

如果可以这样赋值，那么数组的地址就会被改变，变为别的地址。因此，**赋值表达式的左操作数不可以是数组名**。

>■注意■ 赋值表达式的左操作数不可以是数组名。

>► 前面章节我们提到了不可使用赋值运算符复制数组的所有元素，不过更为准确的说法可能是“不可使用赋值运算符改变指向数组起始元素的指针”。

***☆专题下标运算符的操作数***

下面我们来看一下在指针p和整数i相加的式子前写上指针运算符的表达式*(p+i)。

括号内的p+i，是p和i的加法运算。和算术类型的数值间的加法运算a+b等同于b+a—样，p+i也等于i+p。

也就是说，\*(p+i)和\*(i+p)是等价的。

这样一来，是不是访问数组元素的表达式p[i]也可以写成i[p]呢。实际上确实是可以的。下标运算符[]，是具有两个操作数的双目运算符。其中一个操作数的类型是

```● 指向Type型对象的指针```

另一个操作数的类型是

```● 整数类数据类型```

下标运算符[]的操作数的顺序是随意的。就像a+b等同于b+a—样，a[3]和3[a]也是一样的。
下标运算符[]所生成的值的类型是

```● Type型```

之前我们己经提到，指针p指向数组a的起始元素a[0]时，

```
a[i] *(a+i) p[i] *(p+i)
```

这4个表达式表示相同的元素。实际上

```
a[i] i[a] *(a+i) *(i+a) p[i] i[p] *(p+i) *(i+p)
```

这8个表达式表示的都是相同的元素。

看到代码清单demoa.c的程序，几乎所有的人都会大吃一惊吧。

**代码清单demoa.c**

```c
/*
下标运算符和指针运算符
*/
#include <stdio.h>

int main() {
    int i, a[4];

    0[a] = a[1] = *(a + 2) = *(3 + a) = 7;
    for (i = 0; i < 4; i++)
        printf("a[%d] = %d\n", i, a[1]);

    return 0;
}
```

当然，我们最好不要使用i[a]等容易出错的写法。

## 数组的传递

在函数间传递数组时，可以灵活应用指针和数组的相似性。下面让我们结合代码清单 demo3.c来看一下。

**代码清单 demo3.c**

```c
/*
数组的传递
*/
#include <stdio.h>

/*将数组v的开头的n个元素赋值val*/
void ary_set(int v[], int n, int val) {
    int i;
    for (i = 0; i < n; i++)
        v[i] = val;
}

/*
void ary_set(int *v, int n, int val)
{
    int i;
    for (i = 0; i < n; i++)
        *(v + i) = val;
}
*/

int main() {
    int i;
    int a[] = {1, 2, 3, 4, 5};

    ary_set(a, 5, 99);

    for (i = 0; i < 5; i++)
        printf("a[%d] = %d\n", i, a[i]);

    return 0;
}
```

ary_set函数按照图C【a】的形式声明

实际上，图【a】和图【b】都可以解释为图【c】。

也就是说，形参v的类型不是数组，而是指针。即使像图【b】那样指定元素个数，该值也会被无视。

>像图【b】这样声明吋附带元素个数的函数，可以为其传递不同元素个数的数组。例如，将元素个数为10的数组d传递给图【b】的函数的函数调租表达式ary_set(d,10,99)，在编译时并不会出错。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-15.png?x-oss-process=image/resize,w_300/sharpen,100)

**图C 接收数组的形参的声明**

这就意味着，在传递数组时有必要将其元素个数作为别的参数来处理（该程序的情况下为n）。

我们来看一下程序中调用ary_set函数的部分。单独出现的数组名是指向该数组起始元素的指针。第一个参数a是&a[0]。

如图D所示，调用ary_set函数时，int*型的形参v将使用实参a,即&a[0]\(图中为216号)进行初始化。

>► 图中省略了数组a和指针v以外的变量和参数等。

![image](https://img-camp.banyuan.club/cc001/chapter10/10-16.png?x-oss-process=image/resize,w_700/sharpen,100)

**图D 函数调用中数组的传递**

由于指针v指向数组a的起始元素a[0]，因此在ary_set函数内，指针v的行为就像数组a其本身一样。

当然，如果改写所接收的数组元素的值，结果就会反映到调用方的数组元素的值上。

>■注意■ 函数间数组的传递，是以指向第一个元素的指针的形式进行的。在被调用的函数中作为指针接收的数组，实际上就是调用方传递的数组。

这样我们就更深入地了解了前面章节一提而过的函数间数组的传递的相关内容了。

>► 这垂有效利用了“指针和数组的密切关系”。

## 作业

**● 练习 1**

>编写如下set_idx函数，接收元素类型为int型、元素个数为n的数组，并为所有元素赋上和下标相同的值。
>
>```
>void set_idx(int *v,int n){/*•••*/}
>```

**● 练习 2** 

>如果用ary_set(&a[2],2,99)调用代码清单 demo3.c中的ary_set函数会怎样呢?请试着执行一下并探讨其结果。

', 3, 2, NULL, '2020-05-21 18:21:31.297221', '2020-05-21 18:21:31.297221', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (12, '字符串和指针', NULL, 10, NULL, NULL, '字符串和指针有着密切的关系。本节我们就来学习字符串和指针的相似点和不同点。

## 用数组实现的字符串和用指针实现的字符串


请看代码清单 demo1.c的程序。这里声明了两个字符串str和ptr。str和我们前面学习的字符串是同样的形式，ptr这种形式则是第一次见到。

**代码清单 demo1.c**

```c
/*
用数组实现的字符串和用指针实现的字符串
*/
#include <stdio.h>

int main() {
    char str[] = "ABC";               // 用数组实现的字符串
    char *ptr = "123";                // 用指针实现的字符串

    printf("str = \"%s\"\n", str);    // str 是指向第一个字符的指针
    printf("ptr = \"%s\"\n", ptr);    // ptr 是指向第一个字符的指针

    return 0;
}
```

本书中将str那样的字符串称为用数组实现的字符串，将ptr那样的字符串称为用指针实现的字符串(这只是一种粗略的分类方法)。

下面让我们结合图 1 来看一下这两种字符串的相似之处和不同之处。

* 用数组实现的字符串str(图 1【a】)

str是char[4]型的数组(元素类型为char型、元素个数为4的数组)。各元素从头开始依次用''A''、''B''、''C''、''\0''进行初始化。

char数组占据的内存空间和数组的元素个数一致。这里是4字节，可以通过表达式sizeof(str)求得。

* 用指针实现的数组ptr(图 1【b】)

ptr是指向char型变量的指针变量，它的初始值为字符串字面量''123''。对字符串字面量进行判定，可以得到指向该字符串字面量第一个字符的指针。所以ptr被初始化为指向保存在内存中的字符串字面量"123"的第一个字符T的指针(图中为216号)。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-1.png?x-oss-process=image/resize,w_500/sharpen,100)  
**图 1 用数组实现的字符串和用指针实现的字符串**

另外，一般情况下，我们把指针P指向字符串字面量"string"的首个字符_s_，称为“指针P指向"string"”。,在该程序中，指针p指向"123"。

>► 由于指针指向的不是字符串字面量.而是字符串字面量的首个字符，因此该表述方法不太准确。不过这是经常使用的表述方法.所以有必要了解一下。

另外，指针ptr不可进行如下声明。

```c
char *ptr ={''1'', ''2'', ''3'', ''\0''}; /* 错误 */
```

数组用的{}形式的初始值，不可用于单一的变量。

另外，从图中可知，指针ptr和字符串字面量"123"双方都占据了内存空间。

指针ptr占用的内存空间为sizeof(ptr)，即sizeof(char*)字节，其长度因编译器而异。另外，字符串字面量"123"占用sizeof("123")字节，和字符个数4(包含null在内)是一致的。

请注意，用指针实现的字符串比用数组实现的字符串需要更多的内存空间。

>■注意■
>
>用指针实现的字符串是按照如下形式进行声明、初始化的。
>
>```c
>char *p = "XY2";
>```
>

指针p和字符串字面量"XYZ"分别占用内存空间。

指针p是指向字符串首个字符的指针。另外，数组str也是指向首个字符的指针(因为数组名会被解释为指向起始元素的指针)。

综上，通过使用下标运算符[]，可以访问字符串中的各个字符，这是二者的共同点。

>► 例如，str[0]为''A''，ptr[1]为''2''。

## 用数组实现的字符串和用指针实现的字符串的不同点

在了解了用数组实现的字符串和用指针实现的字符串的概况之后，接下来让我们一起来学习二者的不同之处。首先来看下面两个程序。

**代码清单 demo2.c**

```c
/*
    用数组实现的字符串的改写
*/
#include <stdio.h>

int main() {
    char s[] = "ABC";
    printf("s = \"%s\"\n", s);
    s = "DEF";
    printf("s = \"%s\"\n", s);

    return 0;
}
```

**代码清单 demo3.c**

```c
/*
    用指针实现的字符串的改写
*/
#include <stdio.h>

int main() {
    char *p = "123";
    printf("p = \"%s\"\n", p);
    p = "123456";
    printf("p = \"%s\"\n", p);

    return 0;
}
```

首先来看代码清单 demo2.c的程序。

该程序的目的是将"DEF"赋给初始值为"ABC"的数组，并显示赋值前后的字符串。

因为蓝色底纹部分在编译时会出现错误，所以程序无法执行。对数组不能进行赋值，这一点我们在前面已经学习过了。虽说左边的数组名会被解释为数组起始元素的地址，但依然不能改写其值。

>► 如果可以赋值.就会改变数组的地址(即数组在内存空间上移动了)。

对用指针实现的字符串进行同样的处理，程序如代码清单 demo3.c所示。该程序在编译时不会误，能够顺利执行。

让我们结合图 2来看一下。

图 2【a】指针P的初始值为字符串字面量"123",所以指针p指向字符串字面量"123"的第一个字符''1''。

图 2【b】在代码清单 demo3.c的灰色底纹部分处，将"456"赋给p。这样一来，原本指向字符串字面量"123"的第一个字符''1''的p,就变成指向别的字符串字面量"4S6"的第一个字符''4''了。

>■注意■ 可以为指向字符串字面量(中的字符)的指针赋上指向别的字符串字面量(中的字符)的指针。赋值后，指针指向新的字符串字面量(中的字符)。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-2.png?x-oss-process=image/resize,w_500/sharpen,100)  
**图 2 为指针赋上字符串字面量**

注意不要误以为这里是完全复制了字符串，其实不过是指针的指向发生了变化而己。即

```p喜欢"123" ♥赋值前```

后来p见异思迁，变成

```p喜欢"456"♥赋值后```

另外，因为不再有指针指向"123",所以"123"将不能被访问，也就是说变成了无法被清的垃圾。

►图【a】和图【b】中都既有"123"又有"456"(二者都占用内存空间)，是因为字符串字面量具有静态存储期。并不是说不需要的话就会自动被从内存空间清除。

## 字符串数组

在此之前，我们学习了两种表示字符串的方法，即用数组实现字符串和用指针实现字符串。而字符串数组就是通过将字符串“数组化”来实现的。

让我们结合代码清单 demo4.c来看一下。

**代码清单 demo4.c**

```c
/*
    字符串数组
*/
#include <stdio.h>

int main() {
    int i;
    char a[][5] = {"LISP", "C", "ADA"};
    char *p[] = {"PAUL", "X", "MAC"};

    for (i = 0; i < 3; i++)
        printf("a[%d] = \"%s\"\n", i, a[i]);
    
    for (i = 0; i < 3; i++)
        printf("p[%d] = \"%s\"\n", i, p[i]);
    
    return 0;
}
```

数组a和p的结构和特征如图 3所示。让我们参照着图 3来比较一下这两个数组。

**【a】“用数组实现的字符串”的数组......二维数组**

数组a是3行5列的二维数组，占用的内存空间是15字节(行数X列数)。因为并非所有字符串的长度都是一致的，所以数组中会产生未使用的部分。例如，存储第二个字符"C"的a[1]，就有3个字符的空间a[1][2]〜a[1][4]没有被使用。

>► 非常长和非常短的字符串同吋存在的情况下.从空间的利用效率上来说，存在未使用的空间这一问题不容忽视。另外，这种形式的字符串数组，我们在前面己经学习过了。

**【b】“用指针实现的字符串”的数组......指针数组**

指针P是元素类型为char\*型、元素个数为3的数组。

数组各元素p[0]、p[1]、p[2]的初始值分别是指向各字符串字面量的首字符"P"、"X"、"M"的指针。因此，除了数组p占用的3个sizeof(char\*)长度的空间之外，还占用3个字符串字面量的空间。

字符串字面量"PAUL"中的字符，可以从头开始按顺序通过p[0][0]、p[0][1]、...来访问。通过连续使用下标运算符[]，可以像处理二维数组那样来处理指针数组。

>► 一般情况下，指针ptr指向数组的起始元素吋，数组内的各元素可以从头幵始按顺利通过ptr[0]、ptr[1]、...来访问。ptr可以替换为p[0]。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-3.png?x-oss-process=image/resize,w_600/sharpen,100)  
**图 3 字符串数组的两种实现**

这里以p[0]为例进行了考察，p[1] 和 p[2] 的情况也是一样的。

>► 因为无法保证初始值的字符串字面鼉是在连续的内存单元中保存的，所以在图【b】中.各字符串字面置并不是相邻的。在编写程序的时候，不能想当然地认为保存"PAUL"的内存空间卮面一定紧接着保存了”X",保存"X"的内存空间后面_定紧接着保存了"MAC"。否则，在有些编译器和运行环境中，这样的程序将不能运行。
', 4, 2, NULL, '2020-05-21 18:21:31.351101', '2020-05-21 18:21:31.351101', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (13, '通过指针操作字符串', NULL, 10, NULL, NULL, '本节我们来学习通过灵活应用指针来操作字符串的方法。

## 判断字符串长度

下面编写一个程序，用指针实现字符串长度的 str_length 函数，如代码清单 demo1.c 所示。

**代码清单demo1.c**

```c
/*
    判断字符串的长度（使用指针遍历）
*/
#include <stdio.h>

int str_length(const char *s) {
    int len = 0;
    while (*s++) {
        len++;
    }
    return len;
}

int main() {
    char str[128];

    printf("请输入字符串：");
    scanf("%s", str);

    printf("字符串 \"%s\" 的长度是 %d。\n", str, str_length(str));

    return 0;
}
```

首先，函数形参的声明由使用[]变为了使用*，但这些声明方式都是一样的，这一点我们在上一章中已经讲过了。这些只是表面上的改变，实质上并没有什么变化。

程序中发生实质性变化的是函数体。让我们结合图A来看一下。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-4.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图A 求字符串的长度**

如图【a】所示，函数开始执行时，s指向所接收的字符串str的第一个字符str[0]，即"five"的第一个符''f''。

当*s为0(即null字符)时，while语句将结束循环。因此，在遍历的过程中，只要还没有遇到null字符，指针s和变量len都会递增。

>►指针S在判断控制表达式时递增.变量len在循环体中递增。

关于指针的递增和递减，我们需要记住下面这一点。

>■注意■ 指向数组元素的指针递增后将变为指向下一个元素，递减后将变为指向上一个元素。

指针的情况下，递增运算符++和递减运算符--也不会发挥什么特别的作用。不管p是否为指针，都有以下规则成立。

>■注意■ p++ 即 p = p + 1，p-- 即 p = p - 1。

前面已经提到，指针p指向数组内的元素时，p+1指向数组中下一个元素。因此，执行p++后，p将变为指向其后的一个元素。

>►递减也是如此。p-1指向前_个元素因此，执行p--后，p将变为指向其前的一个元素。

s最初指向的是str[0],即''f''。如图【b】所示，递增后，s变为指向str[1],即''i''。

如图所示，随着遍历的进行，s指向的字符在逐个向后推移。

如图【e】所示，当*s为null字符时，while语句的循环结束。

while语句结束时，变量len的值为重复执行循环体的次数。该值和字符串的长度一致。

这里的str_length函数中没有使用下标运算符[],而是使用了指针运算符*和递增运算符++。

在C语言编程中，这种技巧很常用，大家一定要好好理解。

## 字符串的复制

代码清单 demo2.c 所示为制字符串的程序。

**代码清单 demo2.c**

```c
/*
    复制字符串
*/
#include <stdio.h>

/*--- 将字符串复制从 s 到 d ---*/
char *str_copy(char *d, const char *s) {
    char *t = d;

    while ((*d++ = *s++));

    return t;
}

int main() {
    char str[128] = "ABC";
    char tmp[128];
    printf("str = \"%s\"\n", str);

    printf("复制的是：");
    scanf("%s", tmp);

    str_copy(str, tmp);

    puts("复制了");

    printf("str = \"%s\"\n", str);

    return 0;
}
```

首先来看str_copy函数内实现字符串复制功能的while语句，控制表达式\*d++ = \*s++是比较复杂的。

后置递增运算符++在对操作数进行判定后会进行递增，因此控制表达式的判定和执行分为以下两个阶段进行。

**① 通过\*d = \*s进行赋值**

首先进行的是*^=的赋值。指针S指向的字符会被赋值给指针d指向的字符

**② 指针d和s递增**

赋值结束后，d和s递增。指针d和s分别指向了下一个字符。

函数开始执行时，如图C【a】所示，指针s指向字符串tmp的第一个字符，指针d指向字符串str的第一个字符。

根据①处的赋值表达式\*d=\*s的判定结果，决定是否继续执行while语句的循环。对赋值表达式进行判定后，将得到赋值后左操作数的类型和值。因此，只要赋给\*d的字符的值不是0,即不是null字符，就会循环进行上述①、②步的操作。

也就是说，复制按照下述方式进行。

只要s指向的字符不是mill字符，就将s指向的字符赋给d指向的字符，然后使d和s递增，再处理下一个字符。

当赋给\*d的字符为null字符时，while语句的循环就结束了，如图【e】所示。

>► 在图【e】中.对赋值表达式\*d=\*s进行判断后，会得到赋值后的\*d.即null字符。因为该值为0,所以while语句结束。

另一方面，如果对指针d和s使用下标运算符，strr_copy函数的while语句就如下所示(假设i是int型变量)。

```c
/* —-另一种解法一 */
while(d[i]=s[i])
    i++;
```
“另一种解法”相比，该程序具有以下优点。

```
【a】不需要用于下标的变量:i,可以节约少量内存。
【b】运行效率有望更高。
```

我们来考虑一下【b】。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-5.png?x-oss-process=image/resize,w_400/sharpen,100)  
**图C 字符串的复制**

**■ “另一种解法”的代码**

d[i]和S[i]分别是\*(d+i)和\*(s+i),即访问指针d和S所指向的字符之后第i个字符的表达式。为了访问指针所指元素后第i个字符，分别对指针d和s进行了两种运算—使用+运算符的加法运算和使用\*运算符的解引用。

**■ 该程序的代码**

每循环一次，指针d和s就会递增。但是，在对表达式\*d和\*s的判定中，虽然使用\*运算符进行了解引用，但没有使用+运算符进行加法运算。因此，要执行的程序变小，程序的运行速度也有望提升。

str_copy函数的参数名d和s,分别是destination(目的地)和source(出发地)的首字母。在C语言编程中，经常会使用这种极短的名称，有时需要多少了解一些英文。

>►关于该函数的返回值，我们将结合下一节的程序来学习。

## 不正确的字符串复制

请看代码清单 demo3.c 所示的程序，这和前面的程序大致相同。str_copy函数一样，main函数有所不同。

**代码清单 demo3.c**

```c
/*
    复制字符串（误例）
*/
#include <stdio.h>

/*--- 将字符串复制从 s 到 d ---*/
char *str_copy(char *d, const char *s) {
    char *t = d;

    while ((*d++ = *s++));

    return t;
}

int main() {
    char *ptr = "1234";
    char tmp[128];
    printf("ptr = \"%s\"\n", ptr);

    printf("复制的是：");
    scanf("%s", tmp);

    str_copy(ptr, tmp);

    puts("复制了。");
    printf("ptr = \"%s\"\n", ptr);

    return 0;
}
```

>► 该程序不能保证运行正确。

这个程序犯了以下两个错误。

* 改写了字符串字面量

这个程序改写了指针ptr指向的字符串字面量的内容。但是，是否可以改写字符串字面量中的字符，是取决于编译器的。在不支持改写字符串字面量的编译器中，该程序不能正确运行。

* 可能会写入非空的内存空间。

指针ptr指向了字符串字面量"1234"的第一个字符，该字符串字面量包括null在内长度为5位。如图D 所示，向该内存空间复制包括null在内的9个字符"ABCDEFGH"。

![image](https://img-camp.banyuan.club/cc001/chapter11/11-6.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图D  不正确的字符串复制**

例如，即使字符串字面量"1234"的空间能够改写，也不能保证复制需要的内存空间是空着的，在该内存空间中可能保存着其他变量，甚至是系统的关键信息。

所以，这样复制的话可能会破坏其他变量的值，甚至可能导致程序运行异常。

## 返回指针的函数

str_copy函数的返回值类型为指向char型变量的指针型，只要是用到这种数据类型的地方都能调用该函数。

函数的返回值是指针t，它复制于传入的形参rf。这就意味着函数返回的是“指向复制后的字符串的第一个字符的指针”。

灵活应用该返回值，代码清单 demo3.c** 中的

```c
str_copy{str, tmp); /* 将tmp复制到str */
printf("str = \"%s\"\n", str); /* 显示复制后的str */
```

就可以改写为下面这样简短的形式。

```c
printf("str=\"%s\"\n", str_copy(str, tmp)); /* 复制 + 显示 */
```

首先将字符串tmp复制到字符串str，然后再将复制后的str显示出来。

>►传入printf函数的正是“指向复制后的字符串的第一个字符的指针”。

', 5, 2, NULL, '2020-05-21 18:21:31.39901', '2020-05-21 18:21:31.39901', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (14, '字符串处理库函数', NULL, 10, NULL, NULL, '字符串处理所需的库函数主要由<string.h>头文件提供。本节我们就来对一些常用的函数进行说明。

## strlen 函数:求字符串的长度

strlen函数是求字符串长度的函数，该函数返回不包含null字符在内的字符串长度。

**▣ strlen**

|头文件|include \<string.h>|
|---|---|
|原型|size_t strlen(const char *s)|
|说明|求出s指向的字符串的长度(不包括null字符)|
|返回值|返回s指向的字符串的长度。|

**代码清单 demo1.c**

```c
/*--- 返回字符串 s 的长度 ---*/
size_t strlen(const char *s) {
    size_t len = 0;

    while (*s++)
        len++;
    return len;
}
```

>► 本节中不对代码进行详细说明.请大家自己去理解。

## strcpy函数、strncpy函数:复制字符串

strcpy函数、stmcpy函数是复制字符串的函数。使用后者还可以对要复制的字符数设限。


**▣strcpy**

|头文件|#include\<string.h>|
|---|---|
|原型|char *strcpy{char *s1, constchar *s2);|
|说明|将s2指向的字符串复制到s1指向的数组中。若s1和s2指向的内存空间重叠，则作未定义处理。|
|返回值|返如s1的值。|

**▣ strncpy**

|头文件|#include\<string.h>|
|---|---|
|原型|char * strncpy(char *s1, const char *s2, size_t n);|
|说明|将s2指向的字符串复制到si指向的数组中。若的长度大于等于n，则复制到第n个字符为止。否则用null字符填充剩余部分。若s1和s2指向的内存空间重叠，则作未定义处理。|
|返回值|返回s1的值|

**代码清单 demo2.c**

```c
/*--- 使用 strcpy 函数的例子 ---*/
char *strcpy(char *s1, const char *s2) {
    char *tmp = s1;

    while (*s1++ = *s2++)
        ;
    return tmp;
}

/*--- 使用 strncpy 函数的例子 ---*/
char *strcpy(char *s1, const char *s2, size_t n) {
    char *tmp = s1;

    while (n) {
        if (!(*s1++ = *s2++)) break;
        n--;
    }
    while (n--)
        *s1++ = ''\0'';
    return tmp;
}
```

**strcat函数、strncat函数:连接字符串**

strcat函数、strncat函数是在己有的字符串后连接别的字符串的函数。使用后者还可以对要连接的字符串个数设限。

**▣ strcat**

|头文件|#include \<string.h>|
|---|---|
|原型|char *strcat(char *s1, const char *s2)|
|说明|将s2指向的字符串连接到s1指向的数组末尾。若s1和s2指向的内存空间重叠，则作未定义处理。|
|返回值|返的s1值。|

**▣strncat**

|头文件|#include \<string.h>|
|---|---|
|原型|char *strncat(char *s1, constchar *s2)|
|说明|将s2指向的字符串连接到s1指向的数组末尾。若s2的长度大于n则截断超出部分。若s1和s2指向的内存空间重叠，则作未定义处理。|
|返回值|返的s1值。|

**代码清单 demo3.c**

```c
/*--- 使用 strcat 函数的例子 ---*/
char *strcat(char *s1, const char *s2) {
    char *tmp = s1;

    while (*s1)
        s1++;                // 前进到 s1 的末尾处
    while (*s1++ = *s2++)    // 循环复制直至遇到 s2 中的 ''\0''
        ;
    return tmp;
}

/*--- 使用 strmcat 函数的例子 ---*/
char *strncat(char *s1, const char *s2, size_t n) {
    char *tmp = s1;

    while (*s1)
        s1++;                    // 前进到 s1 的末尾处
    while (n--) {
        if (!(*s1++ = *s2++)) break; // 遇到 ''\0'' 就结束循环
    *s1 = ''\0'';                  // 在 s1 的末尾插入 ''\0''
    return tmp;
}

```

>►函 数名中的cat,不是指“猫”，而是表示“连接”的单词concatenate的省略。

## strcmp函数、strncmp函数:比较字符串的大小关系

strcmp函数和strncmp函数是对两个字符串的大小关系进行比较的函数(专题11-1)。

**▣ strcmp**

|头文件|#include\<string.h>|
|---|---|
|原型|int strcmp(const char *s1, const char *s2)|
|说明|比较s1指向的字符串和s2指向的字符串的大小关系(从第一个字符开始逐一进行比较，当出现不同的字符时，便可确定这些字符的大小关系)。|
|返回值|若s1和s2和相等，则返回0；若s1大于s2,则返回正整数值；若s1小于s2,则返回负整数值。|

**▣ strcmp**

|头文件|#include\<string.h>|
|---|---|
|原型|int strncmp(const char *s1, const char *s2)|
|说明|比较s1指向的字符的数组和s2指向的字符的数组的前n个字符的大小关系。|
|返回值|若s1和s2和相等，则返回0；若s1大于s2,则返回正整数值；若s1小于s2,则返回负整数值。|

**代码清单 demo4.c**

```c

// 将字符串s2添加到s1之后
char *strcat(char *s1, const char *s2) {
    char *tmp = s1;
    
    while (*s1)    s1++;            // 前进到s1的末尾处 
    while (*s1++ = *s2++);          // 循环复制直至遇到s2中的‘\0’ 
    return (tmp);      
} 
 
// 将字符串s2的前n个字符复制到s1 
char *strcat(char *s1, const char *s2, size_t n) {
    char *tmp = s1;
    while (*s1)    s1++;                   // 前进到s1的末尾处 
    while (n--)
        if (!(*s1++ = *s2++))    break;    // 遇到 ‘\0’就结束循环 
    *s1 = ''\0'';                            // 在s1的末尾插入‘\0’ 
    return (tmp);
}
```

## atoi函数、atol函数、atof函数:转换字符串

有时我们需要将"123"、"51.7"这样的字符序列从数字字符串转换为整数123以及浮点数51.7。为此，C语言标准函数库提供了字符串转换函数。下面就来看看这些函数的说明。

**▣ atoi**

|头文件|#include \<stdlib.h>|
|---|---|
|原型|int atoi(const char *nptr)|
|说明|将nptr指向的字符串转换为int型表示。|
|返回值|返回转换后的值。结果值不能用int型表示时的处理未定义。|

**▣ atol**

|头文件|#include \<stdlib.h>|
|---|---|
|原型|long atol(const char *nptr)|
|说明|将nptr指向的字符串转换为long型表示。|
|返回值|返回转换后的值。结果值不能用long型表示时的处理未定义。|

**▣ atof**

|头文件|#include \<stdlib.h>|
|---|---|
|原型|long atof(const char *nptr)|
|说明|将nptr指向的字符串转换为float型表示。|
|返回值|返回转换后的值。结果值不能用float型表示时的处理未定义。|

atoi函数的运行情况如代码清单 demo12所示。

**代码清单 demo12**

```c
// 比较字符串s1和s2
int strcmp(const char *s1, const char *s2) {
    while (*s1 == *s2) {
        if (*s1 == ''\0'')
            return (0);                         // 相等 
        s1++;
        s2++;
    }
    return ((unsigned char)*s1 - (unsigned char)*s2);
} 
 
// 比较字符串s1和s2的前n个字符 
int strncmp(const char *s1, const char *s2, size_t n) {
    while (n && *s1 && *s2) {
        if (*s1 != *s2)                         // 不相等 
            return ((unsigned char)*s1 - (unsigned char)*s2);
        s1++;
        s2++;
        n--; 
    }    
    if (!n)    return (0);                      // 相等
    if (*s1)   return (1);                      // s1 > s2
    return (-1);                                // s1 < s2
}
```

\<stdlib.h>的名称源于standard library。它不同于“字符串”相关的\<string.h>以及“输入输出”相关的\<stdio.h>等其他头文件，从名称上看不出\<stdlib.h>与什么有关。这也是因为\<stdlib.h>集中将各种函数和宏定义归类于各个头文件之后，不属于任何分类。

**★ 专题 字符串的大小关系**

判断字符串大小的基准是什么呢?从常识来考虑，"AAA"应该比"ABC"或"XYZ"小。像这样，如果是按照词典中的顺序排列的话，位置靠前的字符串就比较小，位置靠后的字符串则比较大，这是基本原则。

但是，如果作为判断对象的字符串都是由同一种字符构成的，比如大写字母、小写字母或数字等，问题还比较简单，否则将会更加复杂。例如，我们不能说"abc"和"123"谁大谁小。

因此，strcmp 函数和 strncmp 函数对字符串大小的判断，是基于字符编码进行的。

字符编码表示字符的值，它依赖于该运行环境中所采用的字符编码体系。至于"abc"比"ABC"或"123"还是小，要由运行环境而定。

换句话说，strcmp 函数和 strncmp 函数不能进行具有可移植性(不依赖于运行环境中采用的字符编码等)的字符串的比较。

在strcmp函数的说明中，我们没有使用“字符串”，而是用了“字符的数组”。这是因为开头n个字符内没有null字符也可以(不是字符串也可以)。



## 作业

**● 练习 1**

>不使用下标运算符，编写如下函数，显示字符串s。
>
>```c
>void put_string(const char *s) { /* ... */ }
>```

**● 练习 2**

>不使用下标运算符，编写如下函数，返回字符串s中字符c的个数(若不存在,则为0)。
>
>```c
>int str_chnum(const char *s, int c){/*
>```

**● 练习 3**

>不使用下标运算符，编写如下函数，若字符串S中含有字符C(若含有多个，以先出现的为准)，则返回指向该字符的指针，否则返回空指针。
>
>```c
>char *strchr(const char *s, int c) { /* ... */ }
>```

**● 练习 4**

>不使用下标运算符，实现字符串转大写str_toupper函数和转小写str_totower函数。

**● 练习 5**

>编写如下函数，删除字符串str内的所有数字字符。
>
>```c
>void del_digit(char *str) { /* ... */ }
>```
>例如，如果接收"AB1C9",就返回"ABC"。注意不要使用下标运算符。
>

**● 练习 6**

>使用本节中学习的库函数(strten函数、strcpy函数、strncpy函数、strcot函数、strncat函数、strcmp函数、strncmp函数)编写程序。

**● 练习 7**

>编写如下函数，实现与库函数atoi、atoJ、atof相同的功能。
>
>```c
>int strtoi(const char *nptr) { /* ... */ }
>long strtoi(const char *nptr) { /* ... */ }
>double strtof(const char *nptr) { /* ... */ }
>```
>', 6, 2, NULL, '2020-05-21 18:21:31.446556', '2020-05-21 18:21:31.446556', 8);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (15, '结构体', NULL, 10, NULL, NULL, '', 11, 1, NULL, '2020-05-21 18:21:31.491233', '2020-05-21 18:21:31.491233', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (16, '结构体', NULL, 10, NULL, NULL, '同一种类型的数据的集合是数组，和数组不同，结构体是多种类型的数据的集合。本节我们就来学习结构体的相关内容。

## 数据关联性

首先来看代码清单 demo1.c的程序。该程序的作用是将表示学生“姓名”的数组和“身高”的数组按照身高由低到高的顺序排列。

两个数组在main函数中定义。int型数组height表示身高，char[NAME_LEN]型数组name表示姓名。

在sort函数中，形参num接收身高数组，str接收姓名数组。因此，按照身高由低到高的顺序进行排序的冒泡排序法，需要基于数组num的元素的大小关系进行。在排序的过程中会交换两个元素的位置。不过在交换身高数组num的元素时，同时也会交换姓名数组str的元素。

这样一来，排序前为同一下标的两个元素(例如下标为1的身高175和姓名"Sanaka"),在排序后也会存储在同一下标(下标2)的元素中，如图A 所示。

>► 交换整数数值使用swap_int函数，交换字符串使用swap_str函数。如果不交换姓名数组的元素，只对身高进行排序，就会变得混乱。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-1.png?x-oss-process=image/resize,w_500/sharpen,100)

**图A  排序前后两个数组的状态**

假设除了姓名和身高，还需要添加float型的体重和long型的奖学金数据，该怎么办呢?这时可以将每个项目定义为元素个数为5的数组。当然，还必须添加用于交换float型和long型数据的函数。而且除了身高和姓名之外，还**需要同时交换体重和奖学金数组的元素，如果忘记交换，就会变得混乱**。

**代码清单 demo1.c**

```c
/*对5名学生的“姓名和身高”按身高进行升序排列*/
#include <stdio.h>
#include <string.h>

#define NUMBER 5        /*学生人数*/
#define NAME_LEN 64     /*姓名的字符数*/

/*交换x和y指向的整数值*/
void swap_int(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}

/*交换sx和sy指向的字符串*/
void swap_str(char *sx, char *sy) {
    char temp[NAME_LEN];

    strcpy(temp, sx);
    strcpy(sx, sy);
    strcpy(sy, temp);
}

/*基于num对数组num和str的前n个元素进行升序排列*/
void sort(int num[], char str[][NAME_LEN], int n) {
    int i, j;
    for (i = 0; i < n - 1; i++) {
        for (j = n - 1; j > i; j--) {
            if (num[j - 1] > num[j]) {
                swap_int(&num[j - 1], &num[j]);
                swap_str(str[j - 1], str[j]);
            }
        }
    }
}

int main() {
    int i;
    int height[] = {178, 175, 173, 165, 179};
    char name[][NAME_LEN] = {"Sato", "Sanaka", "Takao", "Mike", "Masaki"};

    for (i = 0; i < NUMBER; i++)
        printf("%2d:%-8s%4d\n", i + 1, name[i], height[i]);

    sort(height, name, NUMBER);

    puts("\n按身高进行升序排列");
    for (i = 0; i < NUMBER; i++)
        printf("%2d:%-8s%4d\n", i + 1, name[i], height[i]);

    return 0;
}
```

如果再进一步，添加上8位职员的数据和12个月的销售数据的话，又该怎么办呢?在只处理学生数组的情况下，我们还能够理解“height[1]和name[1]是同一个学生的数据”这种关联性。但如果要同时处理多个数组，数组和下标的关联性就不那么容易理解了。

可见，无视数据的关联性，根据数据的集合分别创建数组的方法存在局限性。我们有必要将数据间的关联性嵌入到程序中。

## 结构体

请想象在现实世界中我们是如何处理名字和身高的。假设现在要汇总学生的体检信息。我们会为名字、身高、体重等分别建表吗?显然不会。通常是每人发一张“体检卡”，在卡片上面记录名字、身高等信息(图 B )。如果一个班有50名学生，那么50张“体检卡”即为一个集合。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-2.png?x-oss-process=image/resize,w_400/sharpen,100)  
**图 B  体检卡集合**

在C语言中，像这种卡片形式的数据结构是通过 **结构体(structure)** 来实现的。

下面代码所示为对以下4个数据进行结构体的声明。

* char[64]型的姓名
* int型的身高
* float型的体重
* long型的奖学金

```c
/*---表示学生的结构体的声明---*/
struct student{
    char name[64];  /*名字*/
    int height;     /*身高*/
    float weight;   /*体重*/
    long schols;    /*奖学金*/
};
```

其中，结构体的名字student称为结构名(structure tag)。{}中声明的name、height等称为结构体成员(member)。

这样一来，我们可以像下面这样对图 C的声明进行简单的说明。

```将4个数据集中起来生成struct student型。```

也就是说，这是数据类型的声明，并不定义对象(变量)的实体。

如图 D所示，只画出了卡片格式的框架。实际上要写入的卡片，还需要另外生成。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-4.png?x-oss-process=image/resize,w_300/sharpen,100)

**图 D 结构体的框架**

要保存名字、身高等数据，需要像下述语句那样声明和定义实体对象（变量）。    
```c
struct student sanaka; /*声明struct student型的变量sanaka*/
```

>► “student”只是结构名。由两个单词构成的“struct student”是类型名。就如同枚举类型中“enum 枚举名”是类型名一样。


再来看一个比较简单的结构体。结构体的声明以及该类型对象的定义通常如图 E所示。如果进行了如图【a】所示的结构体的声明，类型名就是“struct xyz”。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-5.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 E 结构体的声明和对象的定义**

这就相当于做章鱼烧的模具。真正要吃的章鱼烧必须作为变量(对象)生成，即图【b】中的声明和定义。

各成员在内存空间上按照声明的顺序排列。本例中的顺序是x、y、z。

>► 也就是说，位于前面的成员的地址较小，位于后面的成员的地址较大。

在声明结构体的类型时，也可以同时定义该类型的对象。以图 E为例，可以像下边这样声明和定义。

```c
struct xyz{
    int x;
    long y;
    double z;
}a，b;
```

>► 也可以在声明中省略结构名。例如
>
>```c
>struct{
>/*中略*/
>}a,b;
>```
>其中将a和b定义为此处声明的结构体类型的对象。但由于该结构体是匿名的，因此程序的其他地方就不能方便地声明相同类型的结构体。

## 结构体成员和.运算符

下面让我们使用结构体来编写一个程序。程序如代码清单 demo2.c所示。

**代码清单 demo2.c**

```c
/*
用表示学生的结构体来现实佐中的信息
*/
#include <stdio.h>
#include <string.h>

#define NAME_LEN 64   /*姓名的字符数*/

struct student {
    char name[NAME_LEN];   /*姓名*/
    int height;            /*身高*/
    float weight;          /*体重*/
    long schols;           /*奖学金*/
};

int main() {
    struct student sanaka;
    strcpy(sanaka.name, "Sanaka");
    sanaka.height = 175;
    sanaka.weight = 62.5;
    sanaka.schols = 73000;

    printf("姓名 = %s\n", sanaka.name);
    printf("身高 = %d\n", sanaka.height);
    printf("体重 = %.1f\n", sanaka.weight);
    printf("奖学金 = %ld\n", sanaka.schols);

    return 0;
}
```

struct student型的对象sanaka的情况如图 F所示。访问结构体对象的各个成员时使用 **.运算符(.operator)** ，该运算符称为句点运算符(表1)。

**■表1 .运算符**

|---|---|---|
|---|---|---|
|.运算符|a.b|表示结构体a的成员b|

![image](https://img-camp.banyuan.club/cc001/chapter12/12-6.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图 F 访问成员**

例如，访问对象sanaka的成员height的表达式如下所示。

```c
sanaka.height /*对象名.成员名*/
```

sanaka.height是int型对象，所以它和普通的int型变量一样可以进行赋值和取值操作。

## 成员的初始化

因为生成变量的时候要进行初始化，所以我们不为结构体的成员赋值，而是来进行初始化。程序如代码清单 demo3.c所示。

>► 该程序中的学生和上一个程序中的学生不是同一个。

**代码清单 demo3.c**

```c
/*
用表示学生的结构体来现实高尾的信息
*/
#include <stdio.h>

#define NAME_LEN 64

struct student {
    char name[NAME_LEN];   /*姓名*/
    int height;            /*身高*/
    float weight;          /*体重*/
    long schols;           /*奖学金*/
};

int main() {
    struct student takao = {"Takao", 173, 86.2};

    printf("姓名 = %s\n", takao.name);
    printf("身高 = %d\n", takao.height);
    printf("体重 = %.1f\n", takao.weight);
    printf("奖学金 = %ld\n", takao.schols);

    return 0;
}
```

为结构体赋初始值的形式与数组相同。各个结构体成员的初始值依次排列在{}里面，并用逗号进行分割，如图 G所示。

>► 各成员的初始值的排列顺序和成员声明的顺序(这里是name,height,weight,schols)—致。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-7.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图 G 成员的初始化**

再则，未赋初始值的元素被初始化为0,这一点也和数组相同。在该程序中，未定义奖学金takao.schols的初始值，所以奖学金的值为0,这从运行结果中也可以看出。

>■注意■ 
>
>结构体对象o中的成员m可以通过o.m来访问。
>
>声明结构体时所赋的初始值的形式是，将各个结构体成员的初始值依次排列在{}里面，并用逗号分割。未赋初始值的成员被初始化为0。

## 结构体成员和->运算符

记得前面指针示例程序中的hiroko函数吗?那时提到洋子对恋人的要求比较高，她还拥有超能力，如果恋人的身高低于180cm,就能将他变为180cm。实际上洋子也不喜欢太胖的人，她还有一个超能力，那就是如果体重超过80kg就能将他变为80kg。

下面我们就来改写hiroko函数，将其用于struct student。程序如代码清单 demo4.c所示。

因为hiroko函数需要改变学生的身高和体重，所以将指针作为参数接收。因此形参std就是指向student结构体的指针类型。

**代码清单 demo4.c**

```c
/*
拥有超能力的洋子
*/
#include <stdio.h>

#define NAME_LEN 64

struct student {
    char name[NAME_LEN];   /*姓名*/
    int height;            /*身高*/
    float weight;          /*体重*/
    long schols;           /*奖学金*/
};

/*将std指向的学生的身高变为180cm，体重变为80kg*/
void hiriko(struct student *std) {
    if ((*std).height < 180) (*std).height = 180;
    if ((*std).weight > 80) (*std).weight = 80;

    /*另一种写法*/
    if (std->height < 180) std->height = 180;
    if (std->weight > 80) std->weight = 80;
}


int main() {
    struct student sanaka = {"Sanaka", 175, 62.5, 73000};

    hiriko(&sanaka);

    printf("姓名 = %s\n", sanaka.name);
    printf("身高 = %d\n", sanaka.height);
    printf("体重 = %.1f\n", sanaka.weight);
    printf("奖学金 = %ld\n", sanaka.schols);

    return 0;
}
```

在该函数中，身高和体重分别通过以下表达式来访问。

```c
(*std).height /*std指向的学生的身高*/
(*std).weight /*std指向的学生的体重*/
```

让我们结合图 H来理解。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-8.png?x-oss-process=image/resize,w_500/sharpen,100)

**图 H 访问指针指向的结构体对象的成员**

hiroko函数的形参std接收的是指向保存有佐中数据的结构体对象sanaka的指针(图中的地址为214号)。

在指针变量前加上指针运算符\*,就表示该指针指向的对象实体，即\*std是sanaka的别名。所以，通过(\*std).height和(\*std).weight等表达式可以表示std指向的对象的成员。

>不能用\*std.height来表示\*std的身高成员。因为运算符的优先级比指针运算符\*高，表达式会被解释成\*(std.height),产生语法错误。

当然，(\*std).height和(\*std).weight的写法比较麻烦，很容易漏写前面的括号。不过素以简洁著称的C语言可不会有此疏漏。

C语言中提供了如表2所示的 **->运算符(->operator)** ，使得能够通过简洁的表达式来访问指针指向的对象成员。

**■表2 ->运算符**

|---|---|---|
|---|---|---|
|->运算符|a->b|用指针访问结构体a中的成员b|


->运算符形如箭头，因此通常称为箭头运算符。使用该运算符，std所指的结构体对象的
成员就可以用以下表达式来表示。

```c
std->height  /*std指向的学生的身高，即(*std).height */
std->weight  /*std指向的学生的体重，即(*std).weight */
```

显然这种写法更为简洁。

>■注意■ 在表示指针p指向的结构体成员m时，推荐使用->运算符将(*p).m简写为p->m。

另外，.运算符和->运算符统称为访问运算符(member-access operator)。

## 结构体和typedef

我们在前面学习过typedef声明，它可以给原有的数据类型定义“同义词”，它的作用等同于数据类型名称。有效利用typedef声明，可以简化struct student这种冗长的写法。

改写后的程序见代码清单 demo5.c。

**代码清单 demo5.c**

```c
/*
拥有超能力的洋子（在结构体中引入typedef名）
*/
#include <stdio.h>

#define NAME_LEN 64

typedef struct student {        /*student可以省略*/
    char name[NAME_LEN];   /*姓名*/
    int height;            /*身高*/
    float weight;          /*体重*/
    long schols;           /*奖学金*/
} Student;

/*将std指向的学生的身高变为180cm，体重变为80kg*/
void hiriko(Student *std) {
    if (std->height < 180) std->height = 180;
    if (std->weight > 80) std->weight = 80;
}


int main() {
    Student sanaka = {"Sanaka", 175, 62.5, 73000};

    hiriko(&sanaka);

    printf("姓名 = %s\n", sanaka.name);
    printf("身高 = %d\n", sanaka.height);
    printf("体重 = %.1f\n", sanaka.weight);
    printf("奖学金 = %ld\n", sanaka.schols);

    return 0;
}
```

如前所述，结构名是student,“struct student”是类型名(图 I)。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-9.png?x-oss-process=image/resize,w_150/sharpen,100)  
**图 I 结构名和类型名**

在类型名“struct student”中，同义词“Student”被作为typedef名定义。因此，单独的“Student”也可以作为类型名发挥作用。

另外，如果类型名使用“Student”，不使用“struct student”的话，程序中的结构名“student”就可以省略(该程序中可以省略)。

>■注意■ 可以使用typedef声明为结构体赋上简洁的typedef名。

► 结构名和typedef的区别在于首字母是否大写。像这种容易出错的命名方法，笔者不建议大家使用(也就是说，该程序中的命名方法是不好的)。

## 结构体和程序

在表示人的身高时，通常使用int型或double型对象。这时，为了在程序世界中表示人的身高这一现实世界对象(物)，需要将它对应至对象(变量)并为它定义一个名字height(图J)。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-10.png?x-oss-process=image/resize,w_350/sharpen,100)

**图 J 整型对象**

如果程序中还需要“体重”，那么也同样需要进行对应，例如定义一个名为weight的对象。

毋庸置疑，现实世界和程序世界显然是不同的。因此，我们所关注的“身高”“体重”等属性，在程序中是用height、weight等变量来实现的。

本章学习的结构体，不仅关注人的某一个属性，而且关注其他多个属性，即并非分别处理身高、体重等数据，而是将“身高的对象”“体重的对象”等对象聚合为一个对象进行表示(图K)。

![image](https://img-camp.banyuan.club/cc001/chapter12/12-11.png?x-oss-process=image/resize,w_350/sharpen,100)

**图K 结构体对象**

将现实世界与程序世界对应起来的时候，对应方法会因问题的类型和范围而各不相同，但是比较自然的做法是遵循“聚合应聚合的对象”这一方针。

使用结构体可以使程序变得简洁明了。

## 聚合类型

数组和结构体在处理多个对象的集合方面具有诸多相同点，它们统称为**聚合类型**(aggregatetype)。

下面，我们来看看数组与结构体有哪些不同点。

**■元素类型**

数组用于高效地操作“相同类型”数据的集合。而结构体这种数据结构通常用于高效地操作“不同类型”数据的集合(当然，偶尔也会有成员类型全部相同的情况)。

**■可否赋值**

即便两个数组的元素个数相同，也不能相互赋值。但是，相同类型的结构体可以相互赋值。如下所示，y中的所有成员都赋给了x中相应的成员

```c
int a[6],b[6];
a=b;/*错误*/
struct student x,y;
x=y;/*OK*/
```

## 返回结构体的函数

因为结构体可以进行赋值，所以可用作函数的返回值类型。让我们通过代码清单 demo6.c的程序来确认一下。

>► 因为数组不可以进行赋值，所以不可用作函数的返回值类型。


xyz_of函数将形参x、y、z接收到的值赋给struct xyz型的temp的各成员，并将该结构体的值原样返回。

如图A 2所示，xyz_of函数返回的结构体的值被直接赋给了变量s。

>► 我们知道，对函数调用表达式进行判断会得到函数的返回值。因此,对函数调用表达式xyz_of(12,7654321,35.689)进行判断后，所得到的返回值的类型为struct xyz型，值为三个成员{12,7654321,35.689}组成的值。

**代码清单 demo6.c**

```c
/*
返回结构体的函数
*/
#include <stdio.h>

struct xyz {
    int x;
    long y;
    double z;
};

struct xyz xyz_of(int x, long y, double z) {
    struct xyz temp;

    temp.x = x;
    temp.y = y;
    temp.z = z;
    return temp;
}

int main() {
    struct xyz s = {0, 0, 0};

    s = xyz_of(12, 7654321, 35.689);

    printf("xyz.x = %d\n", s.x);
    printf("xyz.y = %ld\n", s.y);
    printf("xyz.z = %f\n", s.z);

    return 0;
}
```

## 命名空间

前面简单地介绍了命名空间(name space)。只要命名空间不同，就可以使用拼写相同的标识符(名字)。命名空间的分类有以下四种。

```
(1) 标签(label)名
(2) 小标签(tag)名
(3) 成员名
(4) 一般性标识符
```

在下面所示的程序中，x分别用作小标签名、成员名、对象(变量)名、标签名

```c
int main() {
    struct x{     /*小标签名*/
        int x;    /*成员名*/
        int y;
    }x;           /*变量名*/
x:                /*标签名*/
    x.x = 1;      /*变量名.成员名*/
    x.y = 5;      /*变量名.成员名*/
    
    return 0;
}
```

像这样，只要不属于同一个命名空间，即使在同一有效范围内使用相同的名字，也不会产生任何问题。

## 结构体数组

先回到本章开头的问题，即用聚合了姓名、身高、体重、奖学金数据的结构体表示各位学生的信息。

要表示 5名学生的信息，可以定义元素类型为结构体的数组，并将该数组按身高进行升序排列，程序如代码清单 demo7.c所示。

>► 该程序中，没有为结构体赋结构名，仅赋了typedef名。

swap_Student函数直接交换指针x和指针y指向的Student类型的结构体对象的值。结构体的所有成员都会被交换。

这样就不需要分别编写交换身高的函数、交换姓名的函数......了。不过也产生了数组和下标的关联性不清晰的问题。

**代码清单 demo7.c**

```c
/*
将5名学生的身高按升序排列
*/
#include <stdio.h>
#include <string.h>

#define NUMBER 5
#define NAME_LEN 64

/*表示学生的结构体*/
typedef struct {
    char name[NAME_LEN];
    int height;
    float weight;
    long schols;
} Student;

/*将x和y指向的学生进行交换*/
void swap_Student(Student *x, Student *y) {
    Student temp = *x;
    *x = *y;
    *y = temp;
}

/*将学生数组a的前n个元素按身高进行升序排列*/
void sort_by_height(Student a[], int n) {
    int i, j;
    for (i = 0; i < n - 1; i++) {
        for (j = n - 1; j > i; j--) {
            if (a[j - 1].height > a[j].height)
                swap_Student(&a[j - 1], &a[j]);
        }
    }
}

int main() {
    int i;
    Student std[] = {
        {"Sato", 178, 61.2, 80000},
        {"Sanaka", 175, 62.5, 73000},
        {"Takao", 173, 86.2, 0},
        {"Mike", 165, 72.3, 70000},
        {"Masaki", 179, 77.5, 70000},
    };

    for (i = 0; i < NUMBER; i++)
        printf("%-8s  %6d %6.1f %7ld\n",
               std[i].name, std[i].height, std[i].weight, std[i].schols);

    sort_by_height(std, NUMBER);

    puts("\n按身高排序。");
    for (i = 0; i < NUMBER; i++)
        printf("%-8s  %6d %6.1f %7ld\n",
               std[i].name, std[i].height, std[i].weight, std[i].schols);
    return 0;
}
```

## 派生类型

“结构体”聚合了各种类型的对象。这里创建了结构体集合的“数组”。像这样，在C吾言中可以组合各种方法创建出无穷的数据类型。

通过这种方式创建的数据类型称为**派生类型(derived type)**。能够通过派生创建的类型如下(可以自由组合)。

* 数组类型(array type)

将某一种元素类型对象的集合分配在连续的内存单元中。

* 结构体类型(structure type)

按成员的声明顺序分配内存单元。各成员的数据类型可以不同。

* 共用体类型(uniontype)

不同的成员可以放入同一段内存单元，使之相互重叠。

* 函数类型(functiontype)

由1个返回类型和0个以上的形参及其数据类型构成。

* 指针类型(pointer type)

创建为指向对象或函数的数据类型。

>► 有关共用体和指向函数的指针的知识.超过了本书的范围，就不详细展幵了。

## 作业

**● 练习 1**

>编写如下函数，从键盘输入int型、long型和double型的值，将这些值作为xyz结构体的成员，返回该结构体的值。
>
>```c
>struct xyz scan_xyz() { /*•••*/ }
>```', 1, 2, NULL, '2020-05-21 18:21:31.499152', '2020-05-21 18:21:31.499152', 15);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (17, '作为成员的结构体', NULL, 10, NULL, NULL, '结构体的成员不仅可以是int型和double型等基本类型，还可以是数组或结构体。本节我们就来学习作为结构体的成员的结构体。

## 表示坐标的结构体

代码清单 demo1.c 所示的程序定义了由X坐标和Y坐标定位的点的结构体，并使用该结构体计算两点之间的距离。

**代码清单demo1.c**

```c
/*
计算两点之间的距离
*/
#include <stdio.h>
#include <math.h>

#define sqr(n) ((n)*(n))/*计算平方*/

/*表示点的坐标的结构体*/
typedef struct {
    double x; /*X坐标*/
    double y; /*Y坐标*/
} Point;

/*返回点pa和点pb之间的距离*/
double distance_of(Point pa, Point pb) {
    return sqrt(sqr(pa.x - pb.x) + sqr(pa.y - pb.y));
}

int main() {
    Point crnt, dest;
    printf("当前地点的X坐标："); scanf("%lf", &crnt.x);
    printf("当前地点的Y坐标："); scanf("%lf", &crnt.y);
    printf("目的地的X坐标："); scanf("%lf", &dest.x);
    printf("目的地的Y坐标："); scanf("%lf", &dest.y);

    printf("到目的地的距离为%.2f\n", distance_of(crnt, dest));

    return 0;
}
```

这里没有为表示点的坐标的结构体赋结构名，仅为其赋了typedef名Point。该结构体由double型的成员x和y构成。

distance_of函数是求pa和pb这两点之间的距离的函数。在main函数中，读取当前地址crnt和目的地dest的值，并显示其距离。

## 具有结构体成员的结构体

下面我们来考虑表示汽车的结构体。该结构体的成员有两个——当前位置的坐标和剩余燃料。坐标直接使用Point。

下面来看一下按如下方式声明的Car型的对象。

```
Car c;   /*Car型的对象c*/
```

使用汽车Car的程序如代码清单 demo2.c 所示。该程序是以对话的形式移动汽车的程序。因为这里将燃料消耗设为了1,所以每移动1个距离，燃料就减少1。

**代码清单 demo2.c**

```c
/*
汽车行驶
*/
#include <stdio.h>
#include <math.h>

#define sqr(n) ((n)*(n))/*计算平方*/

/*表示点的坐标的结构体*/
typedef struct {
    double x; /*X坐标*/
    double y; /*Y坐标*/
} Point;

/*表示汽车的结构体*/
typedef struct {
    Point pt;    /*当前位置*/
    double fuel; /*剩余燃料*/
} Car;

/*返回点pa和点pb之间的距离*/
double distance_of(Point pa, Point pb)
{
    return sqrt(sqr(pa.x - pb.x) + sqr(pa.y - pb.y));
}

/*显示汽车的当前位置和剩余燃料*/
void put_info(Car c) {
    printf("(%.2f,%.2f)\n", c.pt.x, c.pt.y);
    printf("%.2f\n", c.fuel);
}

/*使c指向的汽车向目标坐标dest行驶*/
int move(Car *c, Point dest) {
    double d = distance_of(c->pt, dest);
    if (d > c->fuel)
        return 0;
    c->pt = dest;
    c->fuel -= d;
    return 1;
}

int main() {
    Car mycar = {{0.0, 0.0}, 90.0};
    while (1) {
        int select;
        Point dest;
        put_info(mycar);
        printf("开动汽车吗【YES---1/NO--0】：");
        scanf("%d", &select);
        if (select != 1)break;
        printf("目的地的X坐标："); scanf("%lf", &dest.x);
        printf("目的地的Y坐标："); scanf("%lf", &dest.y);
        if (!move(&mycar, dest))
            puts("\a燃料不足无法行驶。");
    }

    return 0;
}
```

>► 函数式宏sqr和结构体Point以及函数distance_of都和之前的程序一样。

使汽车行驶的move函数接收两个参数。第一个参数c是指向Point型的汽车对象(这里是main函数定义的对象mycar)的指针，dest是目的地的点的坐标。

行驶处理按如下方式进行。

**【1】求到目的地的距离**

调用distance_of函数，求出当前位置c->pt和目的地dest之间的距离。使用该距离的值初始化变量d。

>► c->pt是main函数中定义的mycar.pt的别名。

**【2】检查剩余燃料**

如果行驶距离d大于剩余燃料，则无法行驶。这时将暂停处理，并返回0。

**【3】更新当前位置**

更新汽车当前所处的位置。具体来说，就是把c->pt修改成和dest相同的值。

**【4】更新燃料**

随着汽车的行驶，燃料会相应地减少。用c->fuel减去d即可。
', 2, 2, NULL, '2020-05-21 18:21:31.550003', '2020-05-21 18:21:31.550003', 15);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (18, '文件处理', NULL, 10, NULL, NULL, '', 12, 1, NULL, '2020-05-21 18:21:31.596999', '2020-05-21 18:21:31.596999', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (19, '文件与流', NULL, 10, NULL, NULL, '对文件、画面、键盘等的数据的输入输出操作，都是通过流进行的。我们可以将流想象成流淌着字符的河。

## 文件与流

程序的处理结果或计算结果会随着程序运行结束而消失。因此要将程序运行结束后仍需保存的数值和字符串等数据保存在文件(file)中。

针对文件、键盘、显示器、打印机等外部设备的数据读写操作都是通过流(stream)进行的。
我们可以将流想象成流淌打r符的河。

由此可见，在前几章的学习中所有用到printf函数或scan/函数的程序都使用了流。

图1是流和输入输出的示意图。printf函数将字符''A''、''B''、''C''输出到连接显示器的流。而从键盘输入的字符会进入流中，scanf函数会将它们取出来，并将它们的值保存至变量x。

![image](https://img-camp.banyuan.club/cc001/chapter13/13-1.png?x-oss-process=image/resize,w_400/sharpen,100)

**图 1 流和输入输出**

## 准流

我们之所以能够如此简单方便地执行使用了流的输入输出操作，是因为C语言程序在启动时已经将标准流(standard stream)准备好了。

标准流有以下三种。

**■stdin---标准输入流(standard input stream)**  
用于读取普通输入的流。在大多数环境中为从键盘输入。sconf与getchar等函数会从这个流中读取字符。

**■stdout---标准输出流(standard output stream)**  
用于写入普通输出的流。在大多数环境中为输出至显示器界面。printf、puts与putchar等函数会向这个流写入字符。

**■stderr---标准错误流(standard error stream)**  
用于写出错误的流。在大多数环境中为输出至显示器界面。

## FILE型

表不标准流的stdin、stdout、stderr都是指向FILE型的指针型。FILE型是在\<stdio.h>*文件中定义的，该数据类型用于记录控制流所需要的信息，其中包含以下数据。

* 文件位置指示符(file position indicator)
记录当前访问地址。

* 错误指示符(error indicator)
记录是否发生了读取错误或写入错误。

* 文件结束指示符(end-of-file indicator)
记录是否己到达文件末尾。

通过流进行的输入输出都是根据上述信息执行操作的。而且这些信息也会随着操作结果更新。FILE型的具体实现方法因编译器而异，一般多以结构体的形式实现。

## 打开文件

大家在使用纸质笔记本时通常都是先打开，然后再翻页阅读或在适当的地方书写。

程序中的文件处理过程也同样如此。首先打开文件并定位到文件开头，然后找到要读取或写入的目标位置进行读写操作，最后将文件关闭。

打开文件的操作称为打开(open)。函数库中的/open函数用于打开文件，请看下一页中的函数说明。

>■注意■ 使用文件时，需要事先用fopen函数打开文件。

该函数需要两个参数。第1个参数是要打开的文件名，第2个参数是文件类型及打开模式。以图2为例，使用"r"模式打开文件”abc.txt"。

>► 文件类型有两种，即文本文件和二进制文件。本节先学习文本文件，下一节再学习二进制文件。

![image](https://img-camp.banyuan.club/cc001/chapter13/13-2.png?x-oss-process=image/resize,w_400/sharpen,100)

**图 2 文件的打开**

fopen函数会为要打开的文件新建一个流，然后返回一个指向FILE型对象的指针，该FILE型对象中保存了控制这个流所需要的信息。

文件一旦打开后，就可以通过FILE*型指针对流进行操作。

>► 和程序启动吋便准备好的标准流不同.要打开文件时必须先在程序中定义FILE*型的指针变置。然后将fopen函数返回的指针赋于该变置，就可以通过该指针变量对文件进行操作了。

变量可以任意命名，这里我们将它命名为fp。fp不是流的实体，而是指向流的指针，严格来讲应称之为“指针办所指向的流”，本书为简单起见称为“流fp”。

**▣fopen**

◈ 头文件 #include \<stdio.h>

◈ 原型FILE \*fopen(const char \*filename, const char \*mode);

◈ 描述：

```
打开文件名为 filename 所指字符串的文件，并将该文件与流相关联。
实参 mode 指向的字符串，以下述字符序列中的某一项开头。
r 以只读模式打开文本文件。
W 以只写模式建立文本文件，若文件存在则文件长度清为0。
a 以追加模式(从文件末尾处开始的只写模式)打开或建立文本文件。
rb 以只读模式打开二进制文件。
wb 以只写模式建立二进制文件，若文件存在则文件长度清为0。
ab 以追加模式(从文件末尾处开始的只写模式)打开或建立二进制文件。
r+ 以更新(读写)模式打开文本文件。w+以更新模式建立文本文件，若文件存在则文件长度清为0。
a+ 以追加模式(从文件末尾处开始写入的更新模式)打开或建立文本文件。
r+b 或 rb+ 以更新(读写)模式打开二进制文件。
w+b 或 wb+ 以更新模式建立二进制文件，若文件存在则文件长度清为0。
a+b 或 ab+ 以追加模式(从文件末尾处开始写入的更新模式)打开或建立二进制
文件。

以读取模式(mode以字符 ''r'' 开头)打开文件时，如果该文件不存在或者没有读取权限，则文件打开失败。

对于以追加模式(mode以字符‘a‘开头)打开的文件，打开后的写入操作都是从文件末尾处开始的。此时fseek函数的调用会被忽略。在有些用null字符填充二进制文件的编译器中，以追加模式(mode以字符古开头，并且第2或第3个字符是''b'')打开二进制文件时，会将流的文件位置指示符设为超过文件中数据末尾的位置。

对于以更新模式(mode的第2或第3个字符为_+_)打开的文件相关联的流，可以进行输入和输出操作。但若要在输出操作之后进行输入操作，就必须在这两个操作之间调用文件定位函数(fseefc、fsetpos或rewind)。除非输入操作检查到文件末尾，其他情况下若要在输入操作之后进行输出操作，也必须在这两个操作之间调用文件定位函数。有些编译器会将以更新模式打开(或建立)文本文件改为以相同模式打开(或建立)二进制文件，这不会影响操作。

当能够识别到打开的流没有关联通信设备时，该流为全缓冲。打开时会清空流的错误指示符和文件结束指示符
```

◈ 返回值

返回一个指向对象的指针，该对象用于控制打开的流。打开操作失败时，返回空指针。

打开文件时可以指定以下四种模式。

* 只读模式—只从文件输入。
* 只写模式—只向文件输出。
* 更新模式—既从文件输入，也向文件输出。
* 追加模式—从文件末尾处开始向文件输出。

## 闭文件
当我们读完一本书时会将它合上，文件也同样如此。在文件使用结束后，就要断开文件与流的关联将流关闭。这个操作就称为关闭(close)文件。

以下是用于关闭文件的fclose函数说明。

**▣ fopen**

◈ 头文件 #include \<stdio.h>

◈ 原型 FILE \*fclose(FILE *stream);

◈ 描述：

>刷新stream所指向的流，然后关闭与该流相关联的文件。流中留在缓冲区里面尚未写入的数据会被传递到宿主环境气由宿主环境将这些数据写入文件。而缓冲区里面尚未读取的数据将被丢弃。然后断开流与文件的关联。如果存在系统自动分配的与该流相关联的缓n冲区，则会释放缓冲区。

◈ 返回值

若成功地关闭流，则返回0。检査到错误时返回EOF。

图3为关闭文件的示意图。只要将打开文件时fopen函数返回的指针传给fclose函数即可。

![image](https://img-camp.banyuan.club/cc001/chapter13/13-3.png?x-oss-process=image/resize,w_400/sharpen,100)  
**图3函数的关闭**

## 打开与关闭文件示例

代码清单 demo1.c中的程序演示了如何通过调用；fopen函数和fclose函数来打开和关闭文件。

**代码清单 demo1.c**

```c
/*
    打开与关闭文件
 */
#include <stdio.h>

int main() {
    FILE *fp;

    fp = fopen("abc", "r");

    if (fp == NULL)
        printf("\a无法打开文件 \"abc\"。\n");
    else
        printf("\a成功打开了文件 \"abc\"。\n");
    fclose(fp);

    return 0;
}
```

这个程序所做的工作是先以只读模式"r"打开名为"abc"的文件，然后将它关闭。

当文件打开失败，fopen函数返回NULL时，会显示“无法打开文件"abc"。否则则证明文件可以正常打开，所以显示“成功打开文件"abc"，并关闭文件。

>► 该程序也可判断"abc"文件是否存在。

## 文件数据汇总

代码清单 demo2.c所示的程序会将保存在文件中的姓名、身高、体重(个人信息)逐条读入并显示出来，最后还会显示平均身高和平均体重。

个人信息保存在如图4所示的“hw.dat"文件中。

>► 请在编辑器中输入图4的数据，将文件命名为"hw.dat"并保存至程序所在目录。

```
// 图4"hw.dat"文件
Aiba16059.3
Kurata16251.6
Masaki18216.5
Tanaka17060.7
Tsuji17583.9
Washio17572,5
```

变量ninzu保存人数(读入了几个人的数据)，变量hsu/7i和wsum分别保存身高总和和体重总和。这些变量都初始化为0或0.0。

FILE*型指针fp的声明以及打开与关闭文件的所有程序结构都和上一页的程序相同。

要从文件读取数据就需要使用fscanf函数了。fscanf函数可以对任意流执行与scanf函数相同的输入操作。它比scanf函数多了1个参数，具体函数说明如下。

**▣ fscanf**

◈ 头文件  #include \<stdio.h>

◈ 原型 int fscanf (FILE \*stream, const char \*format,...);

◈ 描述：

>从strean指向的流(而不是从标准输入流)中读取数据。除此以外，与scanf函数完全相同。

◈ 返回值

>若没有执行任何转换就发生了输入错误，则返回宏定义EOF的值。否则，返回成功赋值的输入项数。若在输入中发生匹配错误，则返回的输入项数会少于转换说明符对应的实参个数，甚至为0。

函数的用法很简单。例如，要从流fp中读取十进制的整数值并保存至变量x,只需使用下述语句调用函数即可。

```c
fscanf(fp,"%d",&x);
```

与scanf函数相比，仅增加了第一个参数，即输入流。

本程序通过下述语句读取个人信息。

```c
fscanf(fp,"%s%lf%lf", name, height, &weight);
```

意思是从流fp中读取1个字符串和2个double型实数，分别将它们保存至name、height和weight中。

**代码清单 demo2.c**

```c
/*
    读入身高和体重，计算并显示它们的平均值。
 */
#include <stdio.h>

int main() {
    FILE *fp;
    int ninzu = 0;
    char name[100];
    double height, weight;
    double hsum = 0.0;
    double wsum = 0.0;

    if ((fp = fopen("hw.dat", "r")) == NULL) 
        printf("\a打开文件失败。\n");
    else {
        while (fscanf(fp, "%s%lf%lf", name, &height, &weight) == 3) {
            printf("%-10s %5.1f %5.1f\n", name, height, weight);
            ninzu++;
            hsum += height;
            wsum += weight;
        }
        fclose(fp);
    }

    return 0;
}
```

请大家一定要记住下面这条规则。

>■注意■ scanf函数和fscanf函数会返回读取到的项目数。

该程序中，当正常读取到姓名、身高、体重项目返回3时，就会继续while语句循环直至读取不到个人信息(己读取完所有信息，或因出错而不能进行读取)。

在这个while语句中，首先会显示读取到的个人信息，然后让变量 ninzu 自增，最后将读取到的身高和体重累加到hsum和wsum。

当读取不到三个项目时，while语句就会结束循环，这时再显示身高和体重的平均值。

## 写入日期和时间

大家己经掌握了如何从文件读取，那么本节就来看看如何写入。

printf函数是向标准输出流进行输出的函数，而向任意流执行同样操作的就是fprintf函数，它的说明如下。

**▣ fprintf**

|◈ 头文件|#include \<stdio.h>|
|---|---|
|◈ 原型|int fprintf(FILE \*stream, const char \*format,...);|
|◈ 说明|向stream指向的流(而不是标准输出流)写入数据。除此以外，与printf函数完全相同。|
|◈ 返回值|返回发送的字符数。当发生输出错误时，返回负值。|

fprintf函数的用法也很简单。例如，要向流fp写入整数x的十进制数值，只需使用下
述语句调用函数即可。

```c
fprintf(fp,"%d", x);
```

与printf函数相比，仅增加了第一个参数，即输出流。

下面让我们看看如何将程序运行时的日期和时间写入文件。请看代码清单 demo3.c所示的程序。

>► 仅通过调用标准库函数，也可以获得当前曰期和吋间。具体做法请参考专题13-1。

FILE*型指针fp的声明以及打开与关闭文件等程序结构都与之前的程序相同。唯一不同
的一点是本程序是以只写模式"W"打开文件的。

>► 由于是以只写模式打开文件，所以要注意此吋如果存在同名文件，就会清空文件原来的内容，只保存由本程序写入的内容。

其中，蓝色底纹部分是负责将日期和时间写入文件的代码。

公历年、月、日、时、分、秒是以十进制数写入的，所以程序运行以后"dt_dat"文件的内容如图5所示。

![image](https://img-camp.banyuan.club/cc001/chapter13/13-5.png?x-oss-process=image/resize,w_400/sharpen,100)  
**图5 "dt_dat" 文件**

>► 图中显示的数值仅供参考。实际写入文件的内容为程序运行吋的日期和吋间。

**代码清单 demo3.c**

```c
#include <time.h>
#include <stdio.h>

int main() {
    FILE *fp;

    time_t current = time(NULL);
    struct tm *timer = localtime(&current);

    if ((fp = fopen("dt.dat", "w")) == NULL) {
        printf("\a文件打开失败。\n");
    } else {
        printf("写出当前的日期和时间。\n");
        fprintf(fp, "%d %d %d %d %d %d\n",
                timer->tm_year + 1900,
                timer->tm_mon + 1,
                timer->tm_mday,
                timer->tm_hour,
                timer->tm_min,
                timer->tm_sec
               );

        fclose(fp);
    }

    return 0;
}
```

在前面我们提到过标准输入流和标准输出流stdout都是指向FILE的指针型。因此这些变量会直接传递给fscanf函数和fprintf函数的第一个参数。

因此，下面两条语句的功能相同，都是从标准输入流读取整数值，并保存至变量

```c
scanf("%d",&x);
fscanf(stdin, "%d", &x); /* 等同于 scanf("%d", &x); */
```

同样，下面两条语句的功能也相同，它们都向标准输出流写入整数x的十进制数值。

```c
printf("%d", x);
fprintf(stdout, "%d", x); /* 等同于 printf("%d", x);*/
```


这样看来，scanf函数也可以说是输入源被限定为标准输入流的fscanf函数，printf函数则是输出目标被限定为标准输出流的fprintf函数。

>► 也就是说，fscanf函数的功能限定版是scanf函数.fprintf函数的功能限定版是printf函数。

***专题 ：获取当前日期和时间***

仅通过调用标准库函数，也可以获取当前(执行程序时)日期和时间。下面让我们结合代码清单demox.c 的程序来学习其方法。

**代码清单 demox.c**

```c
#include <time.h>
#include <stdio.h>

int main() {
    time_t current = time(NULL);
    struct tm *timer = localtime(&current);
    char *wday_name[] = {"日", "一", "二", "三", "四", "五", "六"};
    printf("当前日期和时间为%d年%d月%d日（%s）%d时%d分%d秒。\n", 
            timer->tm_year + 1900,
            timer->tm_mon + 1,
            timer->tm_mday,
            wday_name[timer->tm_wday],
            timer->tm_hour,
            timer->tm_min,
            timer->tm_sec
        );

    return 0;
}
```

* time_t类型:日历时间

time_t数据类型表示日历时间(calendartime)，其实体是可以进行long型、double型等数据类型的加减乘除运算的算术类型。至于它会成为哪种数据类型的同义词因运行环境而异，因此其在\<time.h>头文件中定义。下面是一个定义示例。

```c
typedef unsigned long time_t; /* 定义示例:因运行环境而异 */
```

不仅仅是类型，日历时间的具体数值也依赖于运行环境。

很多运行环境中都将time_t型作为unsignedint型或unsignedlong型的同义词，将从1970年1月1日0时0分0秒起至今经过的秒数作为具体数值。

* time函数: 获取当前日历时间

time函数可以获取当前日历时间。该函数不仅会将所求得的日历时间作为返回值返回，还会
将其保存在参数指向的对象中。

因此，在如下所示的三种调用方式下，当前时间都被存储在了变量current中。上面的程序为【b】

```
【a】time(&current);
【b】current = time(NULL);
【c】current = time(&current)
```

* tm结构体:分解时间

表示日历时间的，是算术类型的数值，对计算机来说计算起来比较容易，但是对我们人类来说却不是那么直观。为此，c语言中还提供了另外一种表示时间的方法，即称为分解时间(broken-downtime)的结构体数据类型tm。

如下所示为结构体tm的定义示例。与年、月、日、星期等日期和时间相关的元素是其成员。各成员表示的值都记录在了注释中。

```c
struct tm {    /* 定义示例: 因运行环境而异 */
    int tm_sec;    /* 秒 (0〜61) */
    int tm_min;    /* 分 (0〜59) */
    int tm_hour;   /* 时 (0〜23) */
    int tm_mday;   /* 日 (1~31) */
    int tm_mon;    /* 从1月起至今经过的月数(0~11) */
    int tm_year;   /* 从190-0年起至今经过的年数 */
    int tm_wday;   /* 星期: 星期日~星期六(0~6) */
    int tm_yday;   /* 从1月1日起至今轻过的天数(0〜365) */
    int tm_isdst;  /* 夏时令 */
};
```

这只是一个定义示例，成员的声明顺序等细微之处还要依赖于运行环境。

■成员tm_sec的取值范围是0〜61,而非0〜59。这是因为考虑到了闰秒。  
■如果采用的是夏时令，则成员tm_isdst的值为正;如果没有采用夏时令，则值为0;如果不清楚是否为夏时令，则值为负(夏时令是指在夏季将时间提前一小时)

* localtime函数: 从日历时间转换为分解时间

localime函数可以将日历时间转换为分解时间。

该函数的行为如图C-1所示。基于单一的算术类型的值，计算并设定结构体各成员的值。localtime这个名称所示，转换得到的是当地时间。

![image](https://img-camp.banyuan.club/cc001/chapter13/13C-1.png?x-oss-process=image/resize,w_500/sharpen,100)  
**图 C-1使用localtime函数将日历时间转换为分解时间**

下面让我们来看一下整个程序。

【1】使用time函数获取型的当前日历时间。  
【2】将其值转换为tm结构体类型的分解时间。  
【3】用公历表示分解时间。这时，tm_year加1900，tm_mon加1。由于星期日到星期六分别对应0到6,因此利用数组wday_name将表示星期的tm_day转换为字符串"日"、"月"、.....。

## 获取上一次运行时的信息

我们将刚才的程序改得更实用一些，请看代码清单 demo4.c中的程序。运行后会得到图6所示的结果

![image](https://img-camp.banyuan.club/cc001/chapter13/13-6.png?x-oss-process=image/resize,w_370/sharpen,100)  
**图6代码清单 demo4.c的运行结果**

如果程序是第一次运行，就会显示表明是第一次运行的消息。如果程序运行了两次以上,就会显示上一次运行时的日期和时间。

本程序中定义的get_data函数和put_data函数的功能如下所示。

* get_data 函数

在程序开头调用。根据"datetime.dat"文件是否打开成功，执行下述分支处理。

▷ 打开失败时  
判断为程序第一次运行，显示“程序第一次运行。”。

▷ 打开成功时  
将程序上一次运行时写入的日期和时间读入文件并显示。

* put_data 函数

在程序最后调用。用与先前的程序同样的方法，将运行时的日期和时间写入"datetime,dat"文件。

**代码清单 demo4.c**

```c
/*
    显示程序上一次运行时的日期和时间
*/
#include <time.h>
#include <stdio.h>

char data_file[] = "datetime.dat";

/*取得并显示上一次运行时的日期和时间*/
void get_data(void) {
    FILE *fp;

    if ((fp = fopen(data_file, "r")) == NULL) {
        printf("本程序第一次运行\n");
    } else {
        int year, month, day, h, m, s;

        fscanf(fp, "%d%d%d%d%d%d", &year, &month, &day, &h, &m, &s);
        printf("上一次运行是在%d年%d月%d日%d时%d分%d秒\n", year, month, day, h, m, s);

        fclose(fp);
    }
}

/*写入本次运行时的日期和时间*/
void put_data(void) {
    FILE *fp;
    time_t current = time(NULL);
    struct tm *timer = localtime(&current);

    if ((fp = fopen(data_file, "w")) == NULL) {
        printf("文件打开失败\n");
    } else {
        fprintf(fp, "%d  %d  %d  %d  %d  %d\n",
                timer->tm_year + 1900, timer->tm_mon + 1, timer->tm_mday,
                timer->tm_hour, timer->tm_min, timer->tm_sec);
        fclose(fp);
    }
}

int main() {
    get_data();
    put_data();
    return 0;
}
```

## 显示文件内容


**代码清单 demo5.c**

```c
/*
    将标准输入的数据复制到标准输出
*/
#include <stdio.h>

int main() {
    int ch;

    while ((ch = getchar()) != EOF) {
        putchar(ch);
    }

    return 0;
}
```

如果程序不从标准输入流读取数据，而是从任意文件读取，那就变成更实用的查看文件内容(在界面上显示)的程序了。请看代码清单 demo6.c。

程序首先提示输入文件名，将文件名读入字符串fname。如果文件打开失败，就会显示“文件打开失败。”，这和之前的程序相同。

两个程序中的while语句如出一辙。区别仅在于将getchar()的调用改成了fgetc(fp)。fgetc函数说明如下。

**▣ fgetc**

|◈ 头文件|#include \<stdio.h>|
|---|---|
|◈ 原型|int fgetc(FILE *stream);|
|◈ 说明|从stream指向的输入流(若存在)中读取unsignedchar型的下一个字符的值，并将它转换为int型，然后，若定义了流的文件位置指示符，则将其向前移动。|
|◈ 返回值|返回stream所指输入流的下一个字符。若在流中检查到文件末尾，则设置该流的文件结束指示符并返回EOF。如果发生读取错误，就设置该流的错误指示符并返回EOF。|

与getchar函数相比，仅增加了一个参数，即输入流。

当从文件正常读取到字符时，就会进入while循环语句，通过下述语句将读取到的字符ch显示界面上。

```c
putchar(ch);
```

当达到文件末尾(后面没有字符)或者有错误发生时，就会结束while语句循环并关闭文件,程序结束运行。

**代码清单 demo6.c**

```c
/*
    显示文件内容
*/
#include <stdio.h>

int main() {
    int ch;
    FILE *fp;
    char fname[FILENAME_MAX];

    printf("文件名:");
    scanf("%s", fname);

    if ((fp = fopen(fname, "r")) == NULL) {
        printf("\a文件打开失败\n");
    } else {
        while ((ch = fgetc(fp)) != EOF) {
            putchar(ch);
        }

        fclose(fp);
    }

    return 0;
}
```

另外，在本程序中，存储文件名的数组fname的元素个数是FILENAME_MAX。在\<stdio.h>头文件中定义的该对象式宏，表示以下数值(标准C语言中的定义)。

在该运行环境中保证能够打开文件，保持这样的文件名的最大长度所需的数组元素个数。

如下所示为一个定义示例。

```c
#define FILENAME_MAX 1024;
```
## 文件的复制

如果将从文件读取到的字符输出到任意文件，而不是输出到标准输出流，那就变成更为实用的文件复制程序了。

请看代码清单 demo7.c所示的程序。

**代码清单 demo7.c**

```c
/*
    复制文件
*/
#include <stdio.h>

int main() {
    int ch;
    FILE *sfp;/*原文件*/
    FILE *dfp;/*目标文件*/
    char sname[FILENAME_MAX];/*原文件名*/
    char dname[FILENAME_MAX];/*目标文件名*/

    printf("打开原文件:"); scanf("%s", sname);
    printf("打开目标文件:"); scanf("%s", dname);

    if ((sfp = fopen(sname, "r")) == NULL) { /*打开原文件*/
        printf("原文件打开失败\n");
    } else {
        if ((dfp = fopen(dname, "w")) == NULL) { /*打开目标文件*/
            printf("目标文件打开失败\n");
        } else {
            while ((ch = fgetc(sfp)) != EOF) {
                fputc(ch, dfp);
            }

            fclose(dfp);/*关闭目标文件*/
        }

        fclose(sfp);/*关闭原文件*/
    }

    return 0;
}
```

这个程序涉及两个文件的操作，较之前面的程序稍显复杂。

程序首先会询问需要复制的“原文件”和“目标文件”的文件名，并将它读入字符串sname和dname。

>► 各数组的元素个数都是FILENAME_MAX。在声明存储文件名的字符数组时.原则上要使用该宏。

然后以只读模式打开原文件，并将指向与该文件相关联的流的指针赋给sfp。

如果文件打开成功，就以只写模式打开目标文件，并将指向该文件相关联的流的指针赋给dfp。

如果两个文件都打开成功，就运行蓝色底纹处的while语句。

while语句和前面的程序类似，只是将putchar(ch)改成了fputc(ch,dfp),fputc函数的说明如下。

**▣fputc**

|◈ 头文件|#include \<stdio.h>|
|---|---|
|◈ 原型|int fputc(intc, FILE \*stream);|
|◈ 说明|将C指定的字符转换为unsignedchar型后写入stream指向的输入流。此时如果定义了流的文件位置指示符，就会向指示符指向的位置写入字符，并将文件位置指示符适当地向前移动。在不支持文件定位或者以追加模式打开流的情况下，总是以向输出流的末尾追加字符的方式进行字符输出。|
|◈ 返回值|返回写入的字符。如果发生写入错误，就设置该流的错误指示符并返回EOF。|

与putchar函数相比，仅增加了第二个参数，即输出流。

当从文件读入字符时，会进入while循环语句，通过fputc(ch,dfp)将读入的字符ch输出至流dfp。

当遇到文件末尾(后面没有字符)或者有错误发生时，就会结束循环并关闭文件，程序结束运行。至此，文件复制完成。

## 作业

**● 练习 1**

>代码清单 demo1.c中的程序只能打开名为"abc"的文件。请将程序改为从键盘读入文件名，如果存在该名称的文件，就显示“该文件存在。”，否则就显示“该文件不存在。”。
>

**● 练习 2**

>编写程序，从键盘读入文件名，消去该名称的文件的内容。  
>以只写模式打开文件即可(用只写模式"w"打开文件后，文件的内容就被消除了)。

**● 练习 3**

>编写程序实现从键盘读入文件名，计算该文件的行数(换行符的个数)并显示在界面上。

**● 练习 4**

>编写程序实现从键盘读入文件名，计算该文件的字符数并显示在界面上。

**● 练习 5**

>请参考代码清单 demo7.c编写一个程序，在界面上显示文件内容的同时执行复制操作(即同时输出到目标文件和界面)。

**● 练习 6**

>请参考代码清单 demo7.c编写一个程序，将所有英文小写字母转换为大写字母的同时执行复制操作。
', 1, 2, NULL, '2020-05-21 18:21:31.604624', '2020-05-21 18:21:31.604624', 18);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (20, '文件和二进制', NULL, 10, NULL, NULL, '至今为止的程序，都是进行“文本文件”的读写。本节我们来学习“二进制文件”的读写。在文本文件中保存实数。

请看代码清单 demo8.c所示的程序。程序先将初始化为圆周率 3.14159265358979323846 的变量pi的值写出至"PI.txt"文件，然后再进行读取和显示。

**代码清单 demo8.c**

```c
/*
    将圆周率的值写入文本文件，再进行读取
*/
#include <stdio.h>

int main() {
    FILE *fp;
    double pi = 3.14159265358979323846;

    printf("从变量pi得到的圆周率为%23.21f\n", pi);

    /*写入操作*/
    if ((fp = fopen("./data/PI.txt", "w")) == NULL) {
        printf("文件打开失败\n");
    } else {
        fprintf(fp, "%f\n", pi);
        fclose(fp);
    }

    /*读取操作*/
    if ((fp = fopen("./data/PI.txt", "r")) == NULL) {
        printf("文件打开失败\n");
    } else {
        fscanf(fp, "%lf", &pi);
        printf("从文件读取的圆周率为%23.21f\n", pi);
        fclose(fp);
    }

    return 0;
}
```

浮点数的精度是有限的，因此变量pi的值并非为初始值。从文件中读取的圆周率的值，精度还会更低。

如图A所示，这个程序建立的"PI.txt"文件的内容是3.141593。这是因为调用fprintf函数时未指定精度，浮点数默认只输出小数点后6位数字。

>► 当然.printf函数同样如此。

```
3.141593
```

**图A "PI.txt"文件内容**

我们无法通过这个数据恢复丢失的部分。

>► fscanf函数将从文件读取到的3.141593保存至变置pi。由于double型并不能毫无误差地显示实数的所有位数，所以在printf函数中指定显示小数点后21位吋，无法保证恰好显示3.141593000000000000000。

要做到不丢失任何一位数据，就必须写入所有位数。所以我们要注意向文件写入时的精度(位数)，写出的字符数(位数)可能会相应地增大。

## 文本文件和二进制文件

我们用二进制文件来解决这个问题。首先要明确文本文件和二进制文件的区别。

**■文本文件**

在文本文件中，数据是以字符序列的形式表示的。例如，整数357是''3''、''5''、''7''三个字符的序列。若使printf函数和fprintf函数将值写入控制台界面或文件，则会占去3个字节。同理，如果是数值2057的话，就会写出''2''、''0''、''5''、''7''四个字符。

如果字符编码是ASCII码，那么这些数值数据就会由图B(a)所示的二进制位构成。

由此可见，文本文件的字符数取决于数值位数。

**■二进制文件**

在二进制文件中，数据是以二进制位串的形式表示的。具体位数虽因编译器而异，但int型整数的长度必定为sizeof(int)的值。

如果是用2个字节(16位)表示int型整数的环境，那么整数357和2057就将由图丨3-8(b)所示的二进制位构成。

由此可见，二进制文件的字符数(字节数)不依赖于数值位数。

![image](https://img-camp.banyuan.club/cc001/chapter13/13-8.png?x-oss-process=image/resize,w_650/sharpen,100)

**图B文本和二进制**

## 在二进制文件中保存实数

代码清单 demo9.c所示的程序改用二进制模式对圆周率的值进行读写。

fwrite函数和fread函数分别用于数据的写入和读取。以下是函数说明。

**▣fwrite**

|◈头文件|#include \<stdio.h>|
|---|---|
|◈原型|size_t fwrite(const void \*ptr, size_t size，size_t nmemb，FILE \*stream);|
|◈说明|从ptr指向的数组中将最多个长度为size的元素写入stream指向的流中。若定义了流的文件位置指示符，则以成功写入的字符数为单位向前移动。当发生错误时，该流的文件位置指示符的值不可预测。|
|◈返回值|返回成功写入的元素个数。仅当发生写入错误时，元素个数会少于nmemb。|


**▣fread**

|◈头文件|#include \<stdio.h>|
|---|---|
|◈原型|size_t fread(const void *ptr,size_t size, size_t nmemb, FILE \*stream);|
|◈说明|从stream指向的流中最多读取nmemb个长度为size的元素到ptr指向的数组。若定义了流的文件位置指示符，则以成功读取的字符数为单位向前移动。当发生错误时，该流的文件位置指示符的值不可预测。只读取到某一元素的部分内容时，值不可预测。|
|◈返回值|返回成功读取的元素个数。当发生读取错误或达到文件末尾时，元素个数会少于nmemb。若size或nmemb为0，则返回0。这时数组内容和流的状态都不发生变化。|

这两个函数会接收4个参数。第一个参数是指向读写数据的首地址的指针，第二个参数是数据的长度，第三个参数是数据的个数，第四个参数是指向读写对象的流的指针。

在本程序中，向文件写入的函数是：

```c
fwrite(&pi,sizeof(double),1,fp);/*从pi写入*/
```

从文件读取的函数是:

```c
fread(&pirsizeof(double),1,fp);/*®取至pi*/
```

第二个参数sizeof(double)指定了double型的长度，第三个参数指定了要读写的变量个数为i个。

>► sizeof(数据类型名称)是取得该数据类型长度的运算符。

这两个函数是为一次完成对数组元素(不是单独的变量)的读写而设计的。如果读写对象不是数组，而是单独的变量，那么函数的调用方式将和读写数组的典型调用方式有所不同。表1中对这两者进行了对比。

**代码清单 demo9.c**

```c
/*
    将圆周率的值写入二进制文件再进行读取
*/
#include <stdio.h>

int main() {
    FILE *fp;
    double pi = 3.14159265358979323846;

    printf("从变量pi得到的圆周率为%23.21f\n", pi);

    /*写入操作*/
    if ((fp = fopen("./data/PI.bin", "wb")) == NULL) {
        printf("文件打开失败\n");
    } else {
        fwrite(&pi, sizeof(double), 1, fp);
        fclose(fp);
    }

    /*读取操作*/
    if ((fp = fopen("./data/PI.bin", "rb")) == NULL) {
        printf("文件打开失败\n");
    } else {
        fread(&pi, sizeof(double), 1, fp);
        printf("从文件读取的圆周率为%23.21f\n", pi);
        fclose(fp);
    }

    return 0;
}
```

**■表1 fwrite函数和fread函数的典型用例**

||int型x的读写|int[n]型数组a的读写|
|---|---|---|
|写入操作fwrite(&x,sizeof(int),1,fp);|fwrite(a,sizeof(int),10,fp);|
|读取操作fread(sizeof(int),1,fp);|fread(a,sizeof(int),10,fp);|

另外，该程序中对内存空间中存储的double型变量的所有位直接进行了读写。像对文本文件进行读写的程序一样，精度不会被限定在6位。

## 显示文件自身

如果查看文件内容的程序是以文本文件为对象的。现在用来查看包含非打印字符的二进制文件，那么输出内容看起来就会比较混乱，不能正确显示。

>► 有可能出现乱码，或者输出了轚告、换行符等。

代码清单 demo10.c 所示的程序分别用“字符”和“字符编码(十六进制)”显示了以二进制文件类型打开的文件内容。

在显示“字符”时，使用了isprint函数对字符进行判断，如果是打印字符就显示该字符,如果不是打印字符就用V代替(蓝色底纹处)。

isprint函数的说明如下所示。

**▣isprint**

|◈头文件|#include \<ctype.h>|
|---|---|
|◈原型|int isprint(int c);|
|◈说明|判断字符c是否为可打印字符(含空格)。|
|◈返回值|若判断成功则返回0以外的值(真)，否则返回0。|


**代码清单 demo10.c**

```c
/*
    用字符和字符码显示文件内容
*/
#include <ctype.h>
#include <stdio.h>

int main() {
    int n;
    unsigned long count = 0;
    unsigned char buf[16];
    FILE *fp;
    char fname[FILENAME_MAX];

    printf("文件名:");
    scanf("%s", fname);

    if ((fp = fopen(fname, "rb")) == NULL) {
        printf("\a文件打开失败\n");
    } else {
        while ((n = fread(buf, 1, 16, fp)) > 0) {
            int i;

            printf("%08lX\n", count);

            for (i = 0; i < n; i++) {
                printf("%02X", (unsigned)buf[i]);
            }

            if (n < 16)
                for (i = n; i < 16; i++) {
                    printf("    ");
                }

            for (i = 0; i < n; i++) {
                putchar(isprint(buf[i]) ? buf[i] : ''.'');
            }

            putchar(''\n'');

            count += 16;
        }

        fclose(fp);
    }

    return 0;
}
```

像该程序这样，将文件和内存的内容一下子显示出来的程序，一般称为dump程序。

>► dump的原意是自动倾卸车一下子把货物全部卸下。

运行该程序，显示代码清单 demo10.c的源文件的内容。
', 2, 2, NULL, '2020-05-21 18:21:31.653841', '2020-05-21 18:21:31.653841', 18);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (21, '内存操作', NULL, 10, NULL, NULL, '', 13, 1, NULL, '2020-05-21 18:21:31.70076', '2020-05-21 18:21:31.70076', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (22, '手动管理内存', NULL, 10, NULL, NULL, '其实在 C 语言编程时，无时无刻不在使用内存。如定义变量 `char code;`，就是在内存中使用了一个字节的空间。不过我们这里要说的是手动管理内存：申请一个指定尺寸的内存空间，自己觉得放入什么类型的数据，什么时候释放内存（给计算机其他用户使用）。

举例说明，定义 Product 结构体，main函数调用 create_product 创建两个产品：

```c
#include <stdio.h>

typedef struct _Product {
    char code;
    char *name;
} Product;

void create_product(char code, char *name) {
    Product product = {code, name};
    printf("%s, %c\n", product.name, product.code);
}

int main() {
    create_product(''A'', "Juice");
    create_product(''B'', "Cola");
    return 0;
}
```

运行后，屏幕输出：

>Juice, A
>
>Cola, B

如果换做手动管理内存，代码应该像这样：

```c
#include <stdio.h>
#include <stdlib.h>

typedef struct _Product {
    char code;
    char *name;
} Product;

void create_product(char code, char *name) {
    Product *ptr = (Product*)malloc(sizeof(Product));  // 申请内存
    ptr->code = code;
    ptr->name = name;

    printf("%s, %c\n", ptr->name, ptr->code);
    free(ptr); // 释放内存
}

int main() {
    create_product(''A'', "Juice");
    create_product(''B'', "Cola");
    return 0;
}
```

引入 stdlib.h 头文件，使用 malloc 申请分配内存、free 释放内存。申请分配内存大小即结构体 Product 的大小，然后将再使用类型转换 (Product*) 指定该内存的指针类型。

free函数的重要意义在于，如果不释放内存，那么在程序运行过程中，内存一直被占用。上例中 create_product 函数执行完输出，该指针的内存就不需要了，如果反复调用  create_product 很多次，将无端消耗浪费了大量内存，最终可能导致内存耗尽，这种问题叫**内存泄漏（Memory Leak）**，一定要避免。

>注意：free(ptr) 并不能改变指针 ptr 的值，ptr 依然指向以前的内存，为了防止再次使用该内存，建议将 p 的值手动置为 NULL。使用者在后续 ptr 使用时候养成总是通过 if (ptr == NULL) 的方式检查指针是否有效。

C语言标准库提供以下四个函数用于动态内存管理：

**▷ 1、malloc()**

**原型**：void* malloc (size_t size);  
**作用**：在堆区分配 size 字节的内存空间。  
**返回值**：成功返回分配的内存地址，失败则返回NULL。

>**注意**：分配内存在动态存储区（堆区），手动分配，手动释放，申请时空间可能有也可能没有，需要自行判断，由于返回的是void*，建议手动强制类型转换。

**▷ 2、calloc()**

**原型**：void* calloc(size_t n, size_t size);  
**功能**：在堆区分配 n*size 字节的连续空间。  
**返回值**：成功返回分配的内存地址，失败则返回NULL。

>**注意**：calloc() 函数是对 malloc() 函数的简单封装，参数不同，使用时务必小心，第一参数是第二参数的单元个数，第二参数是单位的字节数。

**▷ 3、realloc()**

**原型**：void* realloc(void *ptr, size_t size);  
**功能**：对 ptr 指向的内存重新分配 size 大小的空间，size 可比原来的大或者小。  
**返回值**：成功返回更改后的内存地址，失败则返回NULL。 

**▷4、free()**

**原型**：void free(void* ptr);  
**功能**：释放由 malloc()、calloc()、realloc() 申请的内存空间。
', 1, 2, NULL, '2020-05-21 18:21:31.747167', '2020-05-21 18:21:31.747167', 21);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (23, '组织大规模应用', NULL, 10, NULL, NULL, '', 14, 1, NULL, '2020-05-21 18:21:31.794341', '2020-05-21 18:21:31.794341', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (24, '项目组织和初始化', NULL, 10, NULL, NULL, '## 建立项目目录结构

在项目开发中除了自己写的源代码，通常还包括引用的第三方库、数据文件和构建出来的可执行文件，应该从一开始就养成良好的代码组织习惯。

一个典型的工程目录布局如下：

```
$proj_dir
    ├── README.md        # 为项目写一份使用说明
    ├── [bin]            # 存放代码编译生成可执行文件等
    ├── build.sh         # 编译构建脚本
    ├── [data]           # 存放可能的数据文件
    ├── [lib]            # 存放引用的第三方库目录
    └── [src]            # 存放.c源代码目录
          └── [includes] # 存放.h头文件目录
```

如果使用macOS，建议总是创建 ~/projects/\<your project name> 目录（以下我们假项目名是 luma），存放上述子目录。

>为什么是 ~/projects？因为你的电脑可能有多个用户，当前用户可能同时开发多个项目。

## 用 git 管理源代码

git 是一个著名源代码控制器软件。如果你修过半圆《入门预备课》，应该已经掌握了基本的 git 使用操作。如果你完全不了解 git，官网 https://git-scm.com/book/zh/v2 是最好开始的地方。

* git 服务器：建议使用 [github](https://github.com) 
* git 客户端：`brew install git`


跟随下面的操作步骤使你的项目受控于 git：

*  服务端
1. 去 gitub.com 网站建立一个账号，假设为 tom；
2. 创建一个项目仓库（Repository），名称任意，假设为 luma。

刚建好的仓库就是用来存放代码的地方，仓库主页是：https://github.com/tomo/luma , 页面上提示了 git 客户端执行如何 git 操作序列才能将代码提交上来。
```
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/tom/luma.git
git push -u origin master
```

* 客户端
1. 如果运行 `git --vesion` 提示未知命令，运行 `brew install git` 安装
2. 进入 ~/projects/luma ，依次运行 github 上项目主页提示的命令。

一旦操作完成，你的代码就受控于 git 服务器了。以后每次修改代码文件，都可以用 git 跟踪代码的演化路径，回溯分析代码。更重要的是：无处不在的团队协作中，如果没有 git 充当了代码交换的中间媒介，团队沟通效率和准确性都将大打折扣，因此是不可或缺的一环。
', 1, 2, NULL, '2020-05-21 18:21:31.842702', '2020-05-21 18:21:31.842702', 23);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (25, '多文件编译', NULL, 10, NULL, NULL, '## 快速开始

**关键字 extern 大显身手**。示例项目工程目录布局如下：

```
[proj_dir]
    |_ [src]
         |_ machine.c
         |_ simulator.c         
```

* machine.c：实现售卖机的信息初始化。

```c
typedef struct _Machine {
    int revenue;
    int coins;
    char chose_product_code;
} Machine;


Machine machine;

void machine_init() {
    machine.revenue = 0;
    machine.coins = 200;
    machine.chose_product_code = ''*'';
}
```

* simulator.c 包含主程序，调用 machine.c中的 machine_init 函数：

```c
#include <stdio.h>

typedef struct _Machine {
    int revenue;
    int coins;
    char chose_product_code;
} Machine;

extern void machine_init(void);
extern Machine machine;

int main() {
    machine_init();
    printf("Machine revenue: %d, coins: %d, chose_product_code: %c.\n",
           machine.revenue ,
           machine.coins,
           machine.chose_product_code
          );
    return 0;
}
```

编译运行

> $ cd ${proj_dir}
>
> $ gcc ./src/simulator.c ./src/machine.c -o simulator && ./simulator
>
> $ ./simulator

屏幕显示

> Machine revenue: 0, coins: 200, chose_product_code: *.

基本地，只要在 gcc 参数中说明所有的 .c文件，就会智能地编译和链接生成可执行文件。背后执行过程可以粗糙地分两步理解：

1. 编译汇编：将每一个 .c 文件编译成对应的 .o 目标文件（gcc 增加 -c参数）；

2. 链接：将步骤  1 生成的 .o 文件，一起链接生成可执行文件 simulator。

   <img src="https://img-camp.banyuan.club/online/c/ch14/compile-link.svg" width="350px" />

编译汇编阶段生成的 .o 文件，可以理解为：确保每个.c 源代码文件符合C的语法规则。比如 simulator.c 用到了 machine.c 实现的 machine_init 函数和定义的变量 machine，如果不用 `extern` 声明该函数源自外部.c文件：

```c
extern Machine machine_init(void);
extern Machine machine;
```

simulator.c 就会被认为 不符合C语法的规则，导致编译失败。

当执行链接操作的时候，simulator.o 才会把用到的 machine.o 中的 machine_init 函数代码嵌入进来，生成最终可执行文件。

> 注： 声明函数定义来自外部文件，可以省略 extern ， 可以将 `extern void machine_init(void);` 修改为： `void machine_init(void);`

实践一下，将上述 gcc 命令分解为如下命令，仔细体会一下翻译的两阶段。

> $ gcc -c ./src/machine.c -o .machine.o
>
> $ gcc -c ./src/simulator.c -o ./simulator.o
>
> $ gcc ./machine.o ./simulator.o -o simulator
>
> $ ./simulator

## 头文件的使用

### 1. 类型定义放在头文件

观察上节中的两个 .c 文件，里面有一段相同的结构定义代码：

```c
typedef struct _Machine {
    int revenue;
    int coins;
    char chose_product_code;
} Machine;
```

我们可以创建 machine.h ，把 .c 文件里的这段代码移动到 machine.h，此时项目目录结构如下：

```
[proj_dir]
    |_ [src]
         |_ machine.h
         |_ machine.c
         |_ simulator.c
```

在 simulator.c 和 machine.c 的文件头部使用 

```CQL
#include "machine.h"
```

等同于上一节的效果。

### 2. 外部变量和函数声明放在头文件

```c
extern Machine machine_init(void);
extern Machine machine;
```

通常我们也将外部变量和函数的声明也放到头文件中，如此一来，代码的存放更加规整，请自行再次执行 gcc 编译运行，检验是否工作。

### 3. 宏定义放在头文件

现在增加一个产品模块，也使用了头文件，还定义个了一个宏 PRODUCT_MAX。

**product.h**

```c
typedef struct _Product {
    char code;
    char *name;
    int price;
    int stock;
} Product;
#define PRODUCT_MAX 5
extern Product* product_list(void);
```

**product.c**

```c
#include "product.h"

Product products[PRODUCT_MAX] = {
    {''A'', "Juice", 10, 4},
    {''B'', "Cola", 6, 2},
    {''C'', "Tea", 5, 30},
    {''D'', "Water", 8, 3},
    {''E'', "Coffee", 7, 2},
};

Product* product_list() {
    return products;
}
```

此时项目代码文件布局如下：

```c
[proj_dir]
    |_ [src]
         |_ machine.h
         |_ product.h
         |_ product.c
         |_ machine.c
         |_ simulator.c
```



在 machine 模块中要新增一个函数 puchase：检查是否有足够的货币（coins）购买指定的产品，足够返回1，否则返回0。

**machine.h** 增加函数声明

```c
extern int purchase(Product prd, int qty);
```

该函数入参用到结构 Product，所以 `machine.h` 文件头部还要包含 `product.h`

```
#include "product.h"
....
extern int purchase(Product prd, int qty);
```

**machine.c** 实现 `purchase` 函数

```c
/* 如果指定产品的库存充足返回1， 否则返回0 */
int purchase(Product prd, int qty) {
    int can_buy = 1;

    Product *p = product_list();
    for (int i = 0; i < PRODUCT_MAX; ++i) {
        if (prd.code == p->code && machine.coins < p->price * qty) {
            can_buy = 0; break;
        }
        p++;
    }

    return can_buy;
}
```

接下来在主程序 **simulator.c** 里调用 `purchase`

```c
#include "product.h"

int main() {
     ....
     Product prd = {''C'', "Tea"};
    int can_buy = purchase(prd, 20);

    if (can_buy) {
        printf("货币充足，可以购买\n");
    } else {
        printf("货币不够，不可以购买\n");
    }
    return 0;
}
```

此时可以把源代码对头文件的依赖关系（据 #include）勾勒出来。

   <img src="https://img-camp.banyuan.club/online/c/ch14/c-dependencies.svg" width="400px" />

现在 gcc 编译 .c 文件

> $ gcc ./src/simulator.c ./src/machine.c ./src/product.c -o simulator && ./simulator

不出意外，应该都会产生下面的编译错误而失败：

> /product.h'' included multiple times, additional include site here....

对比上图，simulator.c 在编译的时候，

* 直接包含`product.h` 一次
* 间接包含了`product.h`一次，即在 machine.h 中包含了 `product.h`

重复包含导致宏 `PRODUCT_MAX` 和`typedef struct _Product`的重定义 ，显然是非法的。

解决方法是在头文件  `product.h` 头尾使用宏定义判断 #ifndef 包裹：

```c
#ifndef __PRODUCT_H__
#define __PRODUCT_H__
typedef struct _Product {
    char code;
    char *name;
    int price;
    int stock;
} Product;

#define PRODUCT_MAX 5
extern Product* product_list(void);
#endif
```
这样，当重复包含 `product.h`的时候，由于`__PRODUCT_H__`已经定义， `#ifndef` 语句包裹的代码就不会再次被执行了。

像上面使用的 `__PRODUCT_H__` 这种风格定义宏名一样，应总是使用头文件名的变种，或其他独一无二的名字来作为宏定义的判断条件。并将项目中所有的头文件如法炮制，用 `#ifndef` 来包含。

然后，可以肆无忌惮地多次包含头文件了。

**示例代码下载：** https://github.com/guoguolong/codes.c/tree/master/multi-files/src

', 2, 2, NULL, '2020-05-21 18:21:31.890715', '2020-05-21 18:21:31.890715', 23);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (26, '引用第三方库', NULL, 10, NULL, NULL, '## 引入第三方库

软件能发展到今天的庞大规模，无不是在前人成果上不断累积构建起来的。可以说，每个开发者都站在在巨人的肩膀上，这个巨人就是前辈开发者工作出来的软件程序。我们不能总是从头再来，使用他人写好的程序，来构建自己的程序，是软件开发者必备的的基本技能。

### 什么是库 Library

其实我们写第一个 C 语言程序的时候，就已经在使用库（Library）了，可以说“库”，无处不在。“库” 顾名思义，是一组功能实现函数的集合，`puts` 函数就来自于 `stdio.h` 这个库，只有在代码中引用 `#include <stdio.h>` ，`puts` 才能被使用。

几乎所有C语言教材和书籍都称 `stdio.h`等头文件为库，其实是不严谨的，迷惑了很多初学者。实际库涵盖“库文件” 和 “头文件”两个要素文件。在逻辑上，想调用一个库里的函数，就需要找到：

>1. 源代码实现：**函数定义（.c）**文件;   
>2. 对外接口的说明：函数声明（.h）**文件;   

相比之下，**函数定义（.c）**文件应该更重要才对。不过，库的开发者通常都会同时提供**函数声明（.h）**文件，便于他人使用。

因此，可以肯定的是，`stdio.h` 的背后一定存在着对应的 `stdio.c`。没错，就是这样：安装 gcc 的时候 `stdio.h` 和 `stdio.c` 都会被自动安装好，只不过 `stdio.c` 经过编译打包成了二进制的代码——库文件而已。

比如，在 macOS 下，由于 gcc 实际指向的是 clang 的链接，因此 stdio 库的位置：

>1. 头文件：/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h    
>2. 库文件：/usr/lib/libSystem.B.dylib （macOS 库文件扩展名通常是 .dylib）

当代码中  `#include <stdio.h>` 之后，使用 `put` 函数，gcc 在编译链接的时候，自动寻找 stdio.h 对应的库文件里相应函数实现，生成可执行文件。

### 什么是C标准库

C 语言标准定义了一系列函数标准如  `stdio.h`、`stdlib.h`、`string.h` 等，要求编译器厂商发行编译器软件的时候提供库的实现。对于标准库里的函数，只要像  `#include <stdio.h>` 一样包含在代码中，通常不用做任何设置，编译器就会在工作的时候自动去编译和链接。

完整的 ANSI C标准库（定义，即头文件）：https://en.cppreference.com/w/c/header

### 什么是第三方库

C标准库以外的库，就是第三方库，由第三方厂商实现的函数集合。

## 引用CSV库

### 什么是 CSV

逗号分隔值（Comma-Separated Values，CSV，有时也称为字符分隔值，因为分隔字符也可以不是逗号），其文件以纯文本形式存储表格数据（数字和文本），是一个比较古老的文件格式。Excel可以直接打开CSV文件

一个CSV文件的例子：

**▷代码清单 users.csv**

```csv
姓名,年龄,性别,所在城市
王羲之,35,1,"California, America"
王安石,24,0,"Beiking, China"
王明阳,38,1,Taiwan
```
这些数据通俗易懂，第一行是显然标题，剩下的每行是一条人物信息。

### CSV Parser库

[csv-parser](https://github.com/semitrivial/csv_parser) 是C语言里一个优秀的 CSV 解析处理库。

假设我要解析上面这个 users.csv 里的用户数据，以友好的格式显示在屏幕上，遵循步骤如下：

#### A. 源码方式引用

##### 1). 建立实验用工程目录
```
[~/demo]
    |_ [src]
    |     |_ quickstart.c
    |_ [data]
    |     |_ users.csv
    |_  build.sh
```

##### 2). 下载 csv-parser 库

去官网 https://github.com/semitrivial/csv_parser 下载源代码放到项目的 lib/csv_parser 目录；user.csv 放到 data 目录下。操作完成后目录结构如下：
```
[quickstart]
    |_ [src]
    |    |_ quickstart.c
    |_ [lib]
    |    |_ [csv_parser]
    |            |_ [csv.h]
    |            |_ [csv.c]
    |            |_ [split.c]
    |            |_ [fread_csv_line.c]
    |_ [data]
    |    |_ users.csv
    |_  build.sh
```

##### 3). 使用 csv-parser 库

quickstart.c 演示了如何调用 csv-parser 库里的函数

**▷代码清单 quickstart .c**

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../lib/csv_parser/csv.h"

/**
 * 用csv_parser解析一行逗号分隔字符串，并输出到屏幕上
 */
void print_one_row(char *line) {
    char **parsed = parse_csv(line);
    char **orginal = parsed;
    printf("| ");

    while (*parsed) {
        printf(" %s | ", *parsed);
        parsed++;
    }

    printf("\n|-----------------------------------|");
    printf("\n");

    parsed = orginal;
    free_csv_line(parsed);
}

/**
 * 从文件读取CSV数据解析。
 */
int parse_csv_file() {
    char* file = "./data/users.csv";
    FILE *fp = fopen(file, "r");

    if (fp == NULL) {
        printf("File %s not found.\n", file);
        return -1;
    }

    int max_line_size = 1024;
    int err, done = 0;

    while (!done) {
        char *line = fread_csv_line(fp, max_line_size, &done, &err);
        print_one_row(line);
    }
    fclose(fp);
    return 0;
}

int main() {
    parse_csv_file();
    return 0;
}
```

##### 4). 编译 quickstart.c

进入项目目录 `cd ~/demo`，编译

>  gcc src/quickstart.c ./lib/csv_parser/*.c -o quickstart

分析我们写的源代码：

1. 当 gcc 编译 quickstart.c 时依赖 csv相关头文件，所以代码中有 `#include "../lib/csv_parser/csv.h"`；
2. 当 gcc 进行链接，准备生成可执行文件时，必须要找到 `csv.h`  对应的函数实现，所以，gcc 参数增加了参数`./lib/csv_parser/*.c ` 和 `src/quickstart.c` 一起联编。

##### 5). 运行 quickstart

> ./quickstart

屏幕显示：

```
|  姓名 |  年龄 |  性别 |  所在城市 | 
|-----------------------------------|
|  王羲之 |  35 |  1 |  California, America | 
|-----------------------------------|
|  王安石 |  24 |  0 |  Beiking, China | 
|-----------------------------------|
|  王明阳 |  38 |  1 |  Taiwan | 
|-----------------------------------|
```

有个好的习惯，当命令行足够长的时候，我宁愿把它写到一个shell脚本里。把编译运行命令写到 build.sh 文件，内容如下：

```
LIB_PATH=./lib/csv_parser
SRC_PATH=./src
gcc $SRC_PATH/quickstart.c \
    $LIB_PATH/*.c \
    -o quickstart \
    && ./quickstart
```

执行shell脚本：

> sh build.sh

编译完可执行文件，立即执行，看看是是不是有一气呵成感觉？

★ **示例源码** https://github.com/guoguolong/codes.c/tree/master/3rd-libs/csv/quickstart

#### B. 目标代码方式引用

很幸运，[csv-parser](https://github.com/semitrivial/csv_parser) 作者免费为大家提供了 CSV 解析函数的源代码，使我们工作变得容易，只要 gcc 编译的时候将其加入源码列表即可。

并不是每个开发者都那么慷慨，如果 [csv-parser](https://github.com/semitrivial/csv_parser)  作者并不打算分享 csv_parser 源代码，而希望售卖它的成果，可以提供二进制代码给他人。基本原理就是 “多文件编译” 一节提到的：把 fread_csv_line.c、split.c、csv.c 编译汇编后生成 fread_csv_line.o、split.o、csv.o目标文件，再用 ar 命令打包成一个库文件，然后连同头文件一起公开出去。

这里不介绍生成库文件的细节，先集中精力在函数调用方。假设我们已经拥有了 [csv-parser](https://github.com/semitrivial/csv_parser)  作者公开的库，作为一般的库，本质上一定具备两个要素：**函数声明** 和 **函数定义**

1. `libcsv.a` 库文件 （fread_csv_line.o、split.o、csv.o目标文件的合集）—— 函数声明，我干了什么
2. `csv.h` 头文件 ——函数实现（定义），我怎么干的。

此时项目目录布局如下：

```
[quickstart]
    |_ [src]
    |    |_ quickstart.c
    |_ [lib]
    |    |_ [csv_parser]  # 这里是 csv_parser 库提供的两个要素文件，不再有 .c 源代码
    |            |_ [csv.h]
    |            |_ [libcsv.a]
    |_ [data]
    |    |_ users.csv
    |_  build.sh
```

跟前文 quickstart.c 相比，仅做了一处改动：将  

```c
#include "../lib/csv_parser/csv.h"
```

修改为：

```c
#include <csv.h>
```

 <> 在 “多文件编译” 节提到的标准库头文件有使用，如果想应用 <> 到其他头文件，需要配合 gcc 构建参数 -I来使其生效。

具体地，在gcc 编译时，需要使用 `-L`、`-l`（L的小写）和`-I`参数（H后面的字母）正确编译和链接：

```shell
$ gcc ./src/quickstart.c -o ./bin/quickstart -I./lib/csv_parser -L./lib/csv_parser -lcsv
```

-L 参数指定依赖库文件（.a）所在的目录

-l 参数（L的小写）指定库文件的名称，要"掐头"、"去尾"："掐头"就是剥离文件名开头的 `lib`；"去尾"是剥离文件的扩展名 `.a`。对于 `libcsv.a`来说，"掐头"、"去尾"之后就剩下 `csv`了，因此，此处参数应为 `-lcsv`

-I 参数（H后面的字母）指定头文件 `csv.h` 所在的目录，一旦指定了`-I`，你的代码中就可以用尖括号而不是双引号来包含头文件了，即 `#include <csv.h>`。因此，这一步也不是必须的。你完全可以用双引号的绝对或相对路径引用它，如：`#include "../lib/csv_parser/csv.h"`

再次编译运行，看看程序是不是照常顺利运行？

★ **示例源码** https://github.com/guoguolong/codes.c/tree/master/3rd-libs/csv/quick-lib-ref', 3, 2, NULL, '2020-05-21 18:21:31.938469', '2020-05-21 18:21:31.938469', 23);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (27, '构建和分发', NULL, 10, NULL, NULL, '## 项目构建

当项目开发到运行需要一系列操作的时候，我们通常都会用 shell 或 make 脚本来改进构建过程。本节仍以 csv 的 quickstart 源码引用为例讲解项目构建。


### 1. 使用 shell 脚本

“引用第三方库” 节 “CSV 库源码引用” 已经示例了简单的 shell 脚本（build.sh）构建和运行程序和方法。


```shell
LIB_PATH=./lib/csv_parser
SRC_PATH=./src
gcc $LIB_PATH/*.c \
    -o quickstart \
    && ./quickstart
```
* **集中存放** csv 处理例程运行时依赖的：可执行文件、供读取的csv 文件属于一类，何不把它们集中放入一个目录下，比如 bin，改进后的 build.sh 如下：

```shell
LIB_PATH=./lib/csv_parser
SRC_PATH=./src
BIN_PATH=./bin

rm -rf ./${BIN_PATH}      # 删除上次构建的目标目录
mkdir -p ./${BIN_PATH}    # 重新创建构建目标目录
cp -R ./data ${BIN_PATH}  # 将整个data目录复制到目标目录

gcc $SRC_PATH/quickstart.c $LIB_PATH/*.c -o ${BIN_PATH}/quickstart

cd ${BIN_PATH}
./quickstart
```

运行 build.sh，生成了目标目录结构如下：

```
[bin]
  ├── [data]
  │     └── users.csv
  └── quickstart
```

是不是很清爽 —— 拥有 bin，就拥有了整个软件。

* **二进制方式引用库** 

前文已经了解了如何引用第三方二进制库。牵强一点，这里先模拟 csv_parser 作者构建源代码为库文件，然后再以二进制方式引用。

因为已经拥有了 csv_parser 的源代码，构建 libcsv.a 库文件的过程如下：

```shell
$ cd ./lib/csv_parser

# -c 参数使仅仅生成的编译汇编后的目标文件，不是链接的可执行文件
$ gcc -c csv.c -o csv.o
$ gcc -c split.c -o split.o
$ gcc -c fread_csv_line.c -o fread_csv_line.o

# 使用 ar 命令把上面生成的所有.o文件打包出一个库文件，就像平时大家用的 zip 文件一样
$ ar cr libcsv.a *.o
```

不出意外，`./lib/csv_parser` 目录就已经生成了 libcsv.a 文件。

接下来，编译 `quickstart.c` 的代码的 gcc 命令就是这样的：
```shell
$ gcc ./src/quickstart.c -o ./bin/quickstart -I./lib/csv_parser -L./lib/csv_parser -lcsv
```
显然，作为调用方，生成  libcsv.a 库文件后，就不再需要那些 .c 源码文件了。

现在大家可以自行修改一下 build.sh，看看是否仍然可以编译和运行 quickstart。

### 2. 使用 makefile 脚本

在 macOS下，通常在前期准备C编译环境的时候，安装苹果的 XCode Command Line，就连带安装好了 gcc、make等工具，否则需要单独安装 [make](https://www.gnu.org/software/make/)。

```shell
brew install make
```

简言之，make 是一个使用类似 shell 的脚本批处理命令来构建 C 语言项目的工具。

将上一节的构建过程替换为 make 脚本（名字为 Makefile）存放在项目根目录，内容如下：

```Makefile
BASE_DIR=.
LIB_CSV_PATH=$(BASE_DIR)/lib/csv_parser
SRC_PATH=$(BASE_DIR)/src
BIN_PATH=$(BASE_DIR)/bin
EXE_NAME=quickstart

# all 或 main 是默认执行任务 
all: clean compile
compile: lib-package
    gcc $(SRC_PATH)/quickstart.c -o $(BIN_PATH)/$(EXE_NAME) -I$(LIB_CSV_PATH) -L$(LIB_CSV_PATH) -lcsv
lib-package: lib-compile
    ar cr $(LIB_CSV_PATH)/libcsv.a $(LIB_CSV_PATH)/*.o
lib-compile: init
    gcc -c $(LIB_CSV_PATH)/csv.c -o $(LIB_CSV_PATH)/csv.o
    gcc -c $(LIB_CSV_PATH)/split.c -o $(LIB_CSV_PATH)/split.o
    gcc -c $(LIB_CSV_PATH)/fread_csv_line.c -o $(LIB_CSV_PATH)/fread_csv_line.o
init: 
    mkdir -p $(BIN_PATH)
    cp -R $(BASE_DIR)/data $(BIN_PATH)
clean:
    rm -rf $(BIN_PATH)
run:
    $(BASE_DIR)/bin/$(EXE_NAME)
```

 进入项目目录，运行 make 和 make run。

```shell
$ make
$ make run
```

运行结果：

```
|  姓名 |  年龄 |  性别 |  所在城市 | 
|-----------------------------------|
|  Bob |  35 |  1 |  California, America | 
|-----------------------------------|
|  Jay |  24 |  0 |  Beiking, China | 
|-----------------------------------|
```

对于 make，这里简单解释几点：

1. 执行 make 命令默认寻找当前目录下名字为 Makefile 的文件，如果是合法的 make 脚本文件，就开始运行。

2. Makefile 将构建过程分成多个“任务”，用一个标识符和:开头，如果 make 命令后不加任何参数，默认执行名字为 all 或者 main 的任务名，本例默认任务是 all。

3. 任务可以指定前置任务，对于本例，当运行 all 的时候，实际执行的任务顺序是：

>clean->init->lib-compile->lib-package->compile->all

4. 任务里面执行的命令序列，书写要求必须用 **TAB 缩进（不能使用空格）**。

关于更多 Make，请参考附录 Make 简明操作指南。

★ **示例源码** https://github.com/guoguolong/codes.c/tree/master/3rd-libs/csv/quickstart

## 软件分发

分发（Distribution）也叫发行（Release）。如果想把 quickStart 程序分发给用户使用，首先需要构建项目，这正式上一节讲解的。上节生成的 bin 目录就运行时依赖的所有文件，简单地把 bin 目录打包成压缩文件如 quickstart.zip，分享或直接发送给他人。

平时大家使用的程序看起来更加友好。比如安装 macOS 下的 Sublime Text：从官网下载一个 .dmg 压缩包文件，触控板双击解压，据提示拖动指定的文件到 “应用程序” 目录，然后就可以通过 “启动台” 找到相应程序图标打开了。

实际应用中，大部分软件、特别是图形化软件，都是通过**安装包制作软件**为其制作良好的用户交互接口，让使用者更易安装和使用。macOS 下通常使用 [XCode](https://developer.apple.com/xcode/)、 [Packages](http://s.sudre.free.fr/Software/Packages/about.html) 来制作安装包；Windows下安装包制作软件则很多，如： [Inno Setup](http://www.jrsoftware.org/)、[NSIS](https://sourceforge.net/projects/nsis/)、[Advanced Installer](https://www.advancedinstaller.com/)、[Setup Factory](https://setupfactory.com/)、[Smart Install Maker](http://www.sminstall.com/)、[InstallShield](https://www.flexerasoftware.com/install/products/installshield.html) 等候。

我们这里只是帮助大家建立软件分发的概念，并不展开描述如果制作安装包。

', 4, 2, NULL, '2020-05-21 18:21:31.986447', '2020-05-21 18:21:31.986447', 23);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (28, '使用IDE开发项目', NULL, 10, NULL, NULL, '实际C语言开发时除了编辑器（Sublime Text）、编译器（gcc）是必须的工具，我们往往还需要很多其他辅助软件，如：

- 代码提示器：输入部分代码，即可提示全部代码，加速代码的编写过程；
- 调试器：观察程序的每一个运行步骤，发现程序的逻辑错误；
- 项目管理工具：对程序涉及到的所有资源进行管理，包括源文件、图片、视频、第三方库等；
- 项目的打包和发布和源代码控制

把开发过程中用到的这些工具集成在一个软件里给开发者使用，这样的软件称为集成开发环境，常简称IDE（Integrated Development Environment）。著名的 C 集成开发环境有很多，例如 Visual Studio、Dev C++、Xcode、Visual Studio、Code::Blocks 等，

macOS 下由 Apple 公司自己开发的 XCode是一个非常优秀的IDE。

下面以  https://github.com/guoguolong/codes.c/tree/master/3rd-libs/csv/quick-lib-ref 二进制方式引入 CSV 库为例，解析 XCode 如何组织 C 语言工程。

## 好比把大象装进冰箱，就3 步

1. 新建工程(Command Line Tool类型)：加入源码、资源等文件到工程
2. 项目设置
   - 头文件路径
   - 设置库文件路径
   - 检查编译的源码文件
   - 复制依赖的资源文件到指定位置
3. 构建运行

', 5, 2, NULL, '2020-05-21 18:21:32.026697', '2020-05-21 18:21:32.026697', 23);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (29, '项目', NULL, 10, NULL, NULL, '', 15, 1, NULL, '2020-05-21 18:21:32.116952', '2020-05-21 18:21:32.116952', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (30, '项目介绍', NULL, 10, NULL, NULL, '## 项目介绍

我们以一个 "饮料自动售卖机" 的虚拟应用作为实践项目，项目需求使用英文描述。

项目参考源代码地址： https://git.banyuan.club/projects/C/repos/simulator/browse，可以运行在 Window 、macOS 和 Linux系统下。

代码有 4 个 git 分支：

*  master   内存版操作
*  v1-simple 同 master 分支
* v2-storage 采用 csv 文件持久化存储
* v3-hashmap 使用 hashmap 库读取和检索产品

## 技术要点

通过实践，你可能巩固如下 C 的知识和技能：

1. malloc 内存分配如何支持 Product结构被其他代码引用。

2. 头文件如何运用 #ifndef / #endif 避免重复包含。

3. typedef struct _Product 使引用 Product时更优雅。

4. os.h 的定义如何使 window_screen_clear 跨平台运行

5. 使用第三方库 csv 格式保存数据，使数据持久化。

6. 学习多文件组织项目方法。

7. build.sh 和 make 如何分别用来构建运行应用。
', 1, 2, NULL, '2020-05-21 18:21:32.161151', '2020-05-21 18:21:32.161151', 29);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (31, '需求说明书', NULL, 10, NULL, NULL, '## A Vending Machine Simulator (v1.5)

### 1. Introduction

Vending machines are automated machines that provide different products to consumers after payment is accepted. For simplicity, we will be focusing on vending machines that take coins (available in Hong Kong) and provide beverages. A functional vending machine should also allow service personnel to collect revenue and refill inventory.

<img src="https://img-camp.banyuan.club/online/c/ch15/machine.jpg" width="400px" />

In this project, your task is to use C language to write a vending machine simulator that mimics its real counterpart.

### 2. Functionalities

Similar to a real vending machine, the simulator should provide the following functions.

* **For normal consumers:**
   (a) Display product names and prices
   (b) Indicate if a product is out-of-stock
   (c) Take inserted coins
   (d) Indicate if inserted coin is sufficient for a product (e) Dispense product
   (f) Return inserted coins and change

* **For service personnel:**

   (g)  Allow withdrawal of all inserted coins
   (h)  Allow a product to be refilled
   (i)  Allow a different product to be displayed

### 3. Menu Map

<img src="https://img-camp.banyuan.club/online/c/ch15/menu-map.png" width="800" />

### 4. Detailed Program Flow

When the program starts, it should print the following front of the vending machine. Then a main menu with available options should be shown.

```
*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [ ]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 0]  |
|                           |
|           [===]           |
*---------------------------*


****************************************
What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu
R. Reset machine & product data
0. Quit
Your choice: 
```

Whenever an invalid choice is entered for **any menu**, the program should report and keep looping. For example (**input is after ''Your choice''**):

```
What would you like to do? 
1. Read product information 
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required) 
0. Quit
Your choice: 8
Invalid choice!

What would you like to do? 
1. Read product information 
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required) 
0. Quit
Your choice:
```

**(1) Read product information**

If option 1 is chosen, the product names and the corresponding price will be displayed. Then the main menu is displayed again.

```
What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu(code required)
R. Reset machine & product data
0. Quit
Your choice: 1

(1) The displayed products are: 
A. Juice ($10)
B. Cola ($6)
C. Tea ($5)
D. Water ($8)
E. Coffee ($7)
Press any key to continue
```

**(2) Insert coin**

* If option 2 is chosen, a sub-menu with available coin options should be shown. After a coin is inserted, the front of vending machine with correct value of deposited coins should be shown (maximum: $99), then the sub-menu is shown again.

(Assume the machine has $0 deposited at the beginning.)

```
(2) Which coin would you like to insert?
1. Insert $1
2. Insert $2
3. Insert $5
4. Insert $10
0. Go back
Your choice: 2
You have inserted $10.

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [ ]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 2]  |
|                           |
|           [===]           |
*---------------------------*
```

* If the deposited money is sufficient to purchase a product, indicate it by “turning on the light” using a capital “O”.

(Continuing from previous step.)

```
(2) Which coin would you like
1. $1
2. $2
3. $5
4. $10
0. Go back 
Your choice: 3
Going back!

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [O]  [O]  [ ]  [O]  |
*---------------------------*
|                    [$ 7]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do? 
1. Read product information
2. Insert coin
3. Press product button to insert?
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

* Selecting option 0 (Go back) will show the vending machine, and then return to the main menu.

(Continuing from previous step.)

```
(2) Which coin would you like
1. $1
2. $2
3. $5
4. $10
0. Go back
Your choice: 0
Going back!

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [O]  [O]  [ ]  [O]  |
*---------------------------*
|                    [$ 7]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button to insert?
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

**(3) Press product button**

If option 3 is chosen, a sub-menu with available product options should be shown. If the deposited money is sufficient to purchase the product chosen, the product will be dispensed. The front of vending machine with correct product dispensed, button lights and deposited value should be shown, then the main menu is shown.

(Assume that the machine has $7 deposited, and product B, C and E are affordable and available. And there is only one product B left.)

```terminal
(3) Which product button would you like to press?
1. A
2. B
3. C
4. D
5. E
0. Go back
Your choice: 2
You have pressed button B.

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [X]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 1]  |
|                           |
|           [=B=]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

Note that product B has just been sold out. There is an “X” on its button now. Also note that the remaining deposited amount will not be returned automatically. The product dispensed is assumed to be taken when available, so that future display will not show this dispensed product again.

If a button for an out-of-stock product or an unaffordable product is pressed, nothing will happen.

(Continuing from the setup of the previous step, but starting from the Press Product Button sub-menu.)

```terminal
(3) Which product button would you like to press?
1. A
2. B
3. C
4. D
5. E
0. Go back
Your choice: 1
You have pressed button A.

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [X]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 1]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

Selecting option 0 (Go back) will show the vending machine, and then return to the main menu (same as before; not shown).


**(4) Press return button**

If option 4 is chosen, all the deposited money will be returned. The front of vending machine with correct information should be shown, then the main menu is shown again.

(Continuing from previous step.)

```
(4) Return button is pressed.
$1 has been returned.

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [X]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 0]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

**(9) Service menu**

If option 9 is chosen, the user is required to enter an access code (default: 1101). Incorrect code will cause the simulator to return to the front display and the main menu after showing an error message.

```
(9) Opening service menu. Access code is required. 
Enter access code: 1234
Incorrect code!

*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [X]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 0]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required)
0. Quit
Your choice:
```

Correct access code will allow the service menu to be shown.

```
(9) Opening service menu. Access code is required.
Enter access code: 1110
Correct code!

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice:
```

**(9-1) Inspect machine status**

If option 1 is chosen in the service menu, the information about the revenue (money comes from sales), inserted coins (money inserted but not used) and the products will be displayed. Then the service menu is shown again.

```
(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice: 1

(9-1) Machine status
Amount of revenue: $6
Amount of inserted coins: $0
Product information:
A. Juice ($10) (5 left)
B. Cola ($6) (sold out)
C. Tea ($5) (2 left)
D. Water ($8) (1 left)
E. Coffee ($7) (9 left)

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice:
```

**(9-2) Withdraw all money**

If option 2 is chosen in the service menu, all money in the machine (including coins that are inserted but not used) will be withdrawn. Then the service menu is shown again.

(Continuing from previous step.)

```
(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice: 2

(9-2) All money is being withdrawn.
$6 is withdrawn.

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice: 2

(9-2) All money is being withdrawn.
$0 is withdrawn.

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice:
```

**(9-3) Refill product**

If option 3 is chosen in the service menu, a sub-menu will be shown for the user to select the product to refill to the full quantity (fixed at 10 items). Then the service menu will be shown again.

```
(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice: 3

(9-3) Which product would you like to refill?
1. A
2. B
3. C
4. D
5. E
0. Go back
Your choice: 2
You have refilled product B to full.

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product 0. Go back
Your choice:
```

**(9-4) Change product**

If option 4 is chosen in the service menu, a sub-menu will be shown for the user to select the product to change.

```
(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product
0. Go back
Your choice: 4

(9-4) Which product would you like to change?
1. A
2. B
3. C
4. D
5. E
0. Go back
Your choice: 5
You are changing product E.
```

**(9-4-1) Changing product**

After the product has been selected, the user is prompted to enter a new product name (maximum 20 characters with no space) and new product price ($1–$99 with one dollar increments). The quantity will be filled to full. Then the service menu is shown again.

```
Enter new product name: Milk
Enter new product price: 4
The new product E has been filled to full.

(9) What would you like to do?
1. Inspect machine status
2. Withdraw all money
3. Refill product
4. Change product 0. Go back
Your choice:
```

**(0) Quit**

If option 0 is chosen in the top menu, the program will terminate. No message is given.

```
*---------------------------*
|      Vending Machine      |
*---------------------------*
|   A    B    C    D    E   |
|  $10  $ 6  $ 5  $ 8  $ 7  |
|  [ ]  [ ]  [ ]  [ ]  [ ]  |
*---------------------------*
|                    [$ 0]  |
|                           |
|           [===]           |
*---------------------------*

What would you like to do?
1. Read product information
2. Insert coin
3. Press product button
4. Press return button
9. Open service menu (code required) 0. Quit
Your choice: 0

>
```

**5. Copyright Declaration Statement**

Please put the following declaration statement as the comment in the beginning of your source code and fill in your information.

```
/**
* Vending Machine Simulator *
*
* Copyright (c) 2020 <Your Name>. All rights reserved.
*/
```

**6. Code Submission**
Please submit your on [github](https://github.com) and send the project link to your teacher for checking.

**9. Assumptions and Initial Conditions**

You can safely assume the following conditions during program execution.

(1).  All menu inputs from user are integers.    
(2).  All product names have maximum 20 characters and no spaces in between.    
(3).  All product prices are between $1 and $99. When single-digit money is displayed on the machine (prices and inserted coins), it is shown as “$ 0”. When double-digit money is displayed on the machine, it is shown as “$10”. When displayed in messages, there is no space after “$” in both cases.    
(4).  Maximum amount of inserted coins is $99. Behavior is not defined if more than $99 are inserted.    
(5).  Access code for service menu (option 9) will be entered as integer, and will be treated as integer. So both entered codes **1110** and **001110** will grant access.     
(6).  When changing product (action 9-4-1), newly entered product name and price will obey the above assumptions (2) and (3).    
(7).  The newly entered product name and price will be shown in Product Information (in Main menu) and Inspect Machine Status (in Service menu), until the program terminates.     
(8).  No need preserve machine status (i.e., revenue, inserted coins, product names and prices) between program executions. Every time the program starts, it should be reset to the initial conditions (as described below).     

Your vending machine should have the following initial conditions every time the program starts.

- 􏰀  Amount of revenue: $0
- 􏰀  Amount of inserted coins: $0
- 􏰀  Product information:
    - A. Juice ($10) (5 left)
    - B. Cola($6)(1left)
    - C. Tea ($5) (2 left)
    - D. Water ($8) (1 left)
    - E. Coffee ($7) (9 left)', 2, 2, NULL, '2020-05-21 18:21:32.21225', '2020-05-21 18:21:32.21225', 29);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (32, '附录', NULL, 10, NULL, NULL, '', 16, 1, NULL, '2020-05-21 18:21:32.249105', '2020-05-21 18:21:32.249105', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (33, 'C语言简介', NULL, 10, NULL, NULL, '## C语言的历史

C语言的前身是 [Martin Richards](https://en.wikipedia.org/wiki/Martin_Richards_(computer_scientist)) 开发的BCPL语言。1970年 [Ken Thompson]((https://en.wikipedia.org/wiki/Ken_Thompson)) 对BCPL语言进行了改进，发明了B语言。

1972年 [Dennis M.Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) 又在 ***B语言*** 的基础上开发出了C语言。

<img src="https://upload.wikimedia.org/wikipedia/commons/2/23/Dennis_Ritchie_2011.jpg" width="200px" />

当时，Ritchie和 [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) 等人一同致力于小型机操作系统UNIX的开发。UNIX操作系统最初是用汇编语言开发的，之后用C语言进行了重写。

C语言是为了移植早期的UNIX而开发出来的，所以从某种意义上说“C语言是UNIX的副产品”。

不只是UNIX本身，就连运行在UNIX系统上的许多应用程序也是接二连三地使用C语言开发出来的。

因此，C语言首先普遍应用于UNIX世界，接着又凭借其势不可挡的魅力在大型计算机和个人计算机领域得到了广泛普及。

>► 而且C语言对 C++ 和 Java 等后来产生的很多编程语言也都产生了直接或间接的影响。


## K&R — C语言的圣经

Ritchie 与 [Brian W.Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan) 合著了一本C语言教材:

>The C Programming Language, Prentice-Hall, 1978(中文版名为《C程序设计语言》)

这是C语言设计者亲自撰写的书，被众人奉为C语言的“圣经”，热心的读者们还结合两位作者的姓氏首字母“K&R”，将其作为书的昵称。

在K&R的附录部分收录了C语言规范的参考手册(Reference Manual)。这个语言规范被认为是C语言的标准。

## C语言标准规范

K&R 的参考手册中规定的C语言规范还存在着不少未完全明确的部分。而且，随着C语言的普及，衍生出了许多“方言”，这些各自拥有扩展功能的C语言随处可见。

C语言并没有一个官方机构，也不属于哪个公司，它只有一个制定标准的委员会，任何其他组织或者个人都可以开发C语言的编译器，而这个编译器要遵守哪个C语言标准，是 100% 遵守还是部分遵守，并没有强制性的措施，也没有任何约束。

换句话说，各个厂商可以为了自己的利益、根据自己的喜好来开发编译器。

原本C语言的优势就在于可移植性强，能方便地将一种计算机平台上开发的C语言程序移植到另一种平台上运行。但是由于这些方言的影响，可移植性逐渐下降。

这时制定C语言国际标准的活动便应运而生。由于关系到全球C语言标准的统一，此项工作是在非常严谨的过程中展开的。

国际标准化组织 [ISO(International Organization for Standardization)](https://www.iso.org) 和美国国家标准学会 [ANSI(American National Standards Institute)](https://www.ansi.org/) 通力合作完成了这项艰巨的工作。

### C89 标准

为统一C语言版本，1983 年美国国家标准局（American National Standards Institute，简称 ANSI）成立了一个委员会，专门来制定C语言标准。1989 年C语言标准被批准，被称为 ANSI X3.159-1989 "Programming Language C"。这个版本的C语言标准通常被称为 ANSI C。又由于这个版本是 89 年完成制定的，因此也被称为 C89。

后来 ANSI 把这个标准提交到 ISO（国际化标准组织），1990 年被 ISO 采纳为国际标准，称为 ISO C。又因为这个版本是1990年发布的，因此也被称为 C90。

因为 ANSI 与 ISO 的C标准内容基本相同，所以对于C标准，可以称为 ANSI C，也可以说是 ISO C，或者 ANSI / ISO C。以后大家看到 ANSI C、ISO C、C89、C90，要知道这些标准的内容都是一样的。

目前常用的编译器，例如微软编译器、GCC、LLVM/Clang 等，都能很好地支持 ANSI C 的内容。

### C99标准

在 ANSI C 标准确立之后，C语言的规范在很长一段时间内都没有大的变动。1995 年C程序设计语言工作组对C语言进行了一些修改，增加了新的关键字，编写了新的库，取消了原有的限制，加入了可变长数组、long long int型，取消了不写函数返回类型默认就是int型的规定，扩充了数学函数库(其中包括增加对复数运算的支持)等。并于 1999 年形成新的标准——ISO/IEC 9899:1999 标准，通常被成为 C99。

但是这个时候的C语言编译器基本已经成熟，各个组织对 C99 的支持所表现出来的兴趣不同。当 GCC 和其它一些商业编译器支持 C99 的大部分特性的時候，微软和 Borland 却似乎对此不感兴趣，或者说没有足够的资源和动力来改进编译器，最终导致不同的编译器在部分语法上存在差异。

例如，ANSI C 规定，局部变量要在函数开头定义，而 C99 取消了这个限制，变量可以在任意位置定义。

但目前几乎没有一个编译器完全支持新标准，该标准没有得到广泛应用。

### C11 标准

C11 标准由国际标准化组织（ISO）和国际电工委员会（IEC） 旗下的C语言标准委员会于 2011 年底正式发布，支持此标准的主流C语言编译器有 GCC、LLVM/Clang、Intel C++ Compile 等。

C11 标准主要增加了以下内容：

- 增加了安全函数，例如 gets_s()、fopen_s() 等；
- 增加了 <threads.h> 头文件以支持多线程；
- 增加了 <uchar.h> 头文件以支持 Unicode 字符集；
- 以及其它一些细节。


', 1, 2, NULL, '2020-05-21 18:21:32.255549', '2020-05-21 18:21:32.255549', 32);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (34, 'GCC简明操作', NULL, 10, NULL, NULL, '## 1 简介

写完的C语言源代码要翻译成机器可识别的机器代码，我们需要一个翻译器。C翻译器很多，最流行的当属：[GCC](http://gcc.gnu.org/)

[GCC](http://gcc.gnu.org/) 的意思也只是 GNU C Compiler 而已。经过了这么多年的发展，GCC 已经不仅仅能支持 C 语言；它现在还支持 Ada 语言、C++ 语言、Java 语言、Objective C 语言、Pascal 语言、COBOL语言，以及支持函数式编程和逻辑编程的 Mercury 语言，等等。而 GCC 也不再单只是 GNU C 语言编译器的意思了，而是变成了 GNU Compiler Collection 也即是 GNU 编译器家族的意思了。另一方面，说到 GCC 对于操作系统平台及硬件平台支持，概括起来就是一句话：无所不在。

## 2 简单编译

示例程序如下：

```c
// test.c
#include <stdio.h>
int main() {
    printf("Hello World!\n");
    return 0;
}
```

这个程序，一步到位的编译指令是:

```
gcc test.c -o test
```

在命令行窗口中，执行./test, 让它说HelloWorld吧！

屏幕上显示：
```
Hello World!
```

## 3 翻译四步分解

实质上，上述编译过程是分为四个阶段进行的，即：
* 预处理(也称预编译，Preprocessing)
* 编译(Compilation)
* 汇编 (Assembly)
* 链接(Linking)。

### 3.1 预处理
```shell
gcc -E test.c -o test.i 或 gcc -E test.c
```

可以输出test.i文件中存放着test.c经预处理之后的代码。打开test.i文件，看一看，就明白了。后面那条指令，是直接在命令行窗口中输出预处理后的代码.

gcc的-E选项，可以让编译器在预处理后停止，并输出预处理结果。在本例中，预处理结果就是将stdio.h 文件中的内容插入到test.c中了。

### 3.2 编译为汇编代码(Compilation)

预处理之后，可直接对生成的test.i文件编译，生成汇编代码：

```
gcc -S test.i -o test.s
```
gcc的-S选项，表示在程序编译期间，在生成汇编代码后，停止，-o输出汇编代码文件。

### 3.3 汇编(Assembly)
对于上一小节中生成的汇编代码文件test.s，gas汇编器负责将其编译为目标文件，如下：

```
gcc -c test.s -o test.o
```

### 3.4 链接(Linking)
gcc链接器是gas提供的，负责将程序的目标文件与所需的所有附加的目标文件链接起来，最终生成可执行文件。附加的目标文件包括静态链接库和动态链接库。

对于上一小节中生成的test.o，将其与Ｃ标准输入输出库进行链接，最终生成程序test

```
gcc test.o -o test
```

## 4 多个程序文件的编译

通常整个程序是由多个源文件组成的，相应地也就形成了多个编译单元，使用GCC能够很好地管理这些编译单元。假设有一个由test1.c和 test2.c两个源文件组成的程序，为了对它们进行编译，并最终生成可执行程序test，可以使用下面这条命令：

```shell
gcc test1.c test2.c -o test
```

如果源文件特别多，可以使用通配符：

```shell
gcc *.c -o test
```
如果源代码目录布局如下：
```
[src]
  |_ test1.c
  |_ test2.c
  |_ [csv]
       |_ csv.c
       |_ split.c
```
一起编译所有源代码，可以运行下面的命令：

```shell
gcc *.c **/*. -o test
```


当同时处理的文件不止一个，GCC仍然会按照预处理、编译和链接的过程依次进行。如果深究起来，上面这条命令大致相当于依次执行如下三条命令：

```shell
gcc -c test1.c -o test1.o
gcc -c test2.c -o test2.o
gcc test1.o test2.o -o test
```

## 5 检错

GCC有一些编译选项能够产生有用的警告信息。这些选项大多以-W开头，其中最有价值的当数-Wall了，使用它能够使GCC产生尽可能多的警告信息。

```shell
gcc -Wall illcode.c -o illcode
```

GCC给出的警告信息虽然从严格意义上说不能算作错误，但却很可能成为错误的栖身之所。一个优秀的Linux程序员应该尽量避免产生警告信息，使自己的代码始终保持健壮的特性。所以将警告信息当成编码错误来对待，是一种值得赞扬的行为！所以，在编译程序时带上-Werror选项，那么GCC会在所有产生警告的地方停止编译，迫使程序员对自己的代码进行修改，如下：

```shell
gcc -Werror test.c -o test
```

## 6 引用第三方库

开发软件时，完全不使用第三方函数库的情况是比较少见的，通常来讲都需要借助许多函数库的支持才能够完成相应的功能。从程序员的角度看，函数库实际上就是一些头文件（.h）和库文件（a、so、或lib、dll）的集合。。虽然Unxi/Linux/macOS下的大多数函数都默认将头文件放到/usr/include/目录下，而库文件则放到/usr/lib/目录下。但也有的时候，我们要用的库在特定的目录下，所以GCC在编译时必须用自己的办法来查找所需要的头文件和库文件。

例如我们的程序 test.c 是在linux上使用c链接mysql，这个时候我们需要去mysql官网下载MySQL Connectors的C库，下载下来解压之后，有一个include文件夹，里面包含mysql connectors的头文件，还有一个lib文件夹，里面包含二进制so文件libmysqlclient.so

其中inclulde文件夹的路径是/usr/dev/mysql/include,lib文件夹是/usr/dev/mysql/lib

### 6.1 编译成目标文件(.o)

首先我们要进行编译test.c为目标文件，这个时候需要执行gcc时候使用 -c 参数

```shell
gcc –c –I /usr/dev/mysql/include test.c –o test.o
```

### 6.2 链接出可执行文件
最后我们把所有目标文件链接成可执行文件:

```
gcc –L /usr/dev/mysql/lib –lmysqlclient test.o –o test
```

### 6.3 强制链接时使用静态链接库

默认情况下，GCC在链接时优先使用动态链接库，只有当动态链接库不存在时才考虑使用静态链接库，如果需要的话可以在编译时加上-static选项，强制使用静态链接库。

比如，在 /usr/dev/mysql/lib 目录下有链接时所需要的库文件 libmysqlclient.so 和 libmysqlclient.a，为了让GCC在链接时只用到静态链接库，可以使用下面的命令:

```
gcc –L /usr/dev/mysql/lib –static –lmysqlclient test.o –o test
```

○ **静态库链接时搜索路径顺序**

1. ld会去找GCC命令中的参数-L
2. 再找gcc的环境变量LIBRARY_PATH
3. 再找内定目录 /lib /usr/lib /usr/local/lib 这是当初compile gcc时写在程序内的

○ **动态链接时、执行时搜索路径顺序**

1. 编译目标代码时指定的动态库搜索路径
2. 环境变量LD_LIBRARY_PATH指定的动态库搜索路径
3. 配置文件/etc/ld.so.conf中指定的动态库搜索路径
4. 默认的动态库搜索路径/lib
5. 默认的动态库搜索路径/usr/lib

○ **有关环境变量**
1. LIBRARY_PATH环境变量：指定程序静态链接库文件搜索路径 
2. LD_LIBRARY_PATH环境变量：指定程序动态链接库文件搜索路径  

## 7 打包自己的代码为库文件

假设有源代码：
```
test1.h
test1.c
test2.h
test2.c
test3.h
test3.c
```

### 1). 打包成静态文件

将要打包的所有代码.c编译成.o文件，然后用ar命令打包为.a包文件。

```
gcc -c test1.c test1.o
gcc -c test2.c test2.o
gcc -c test3.c test3.o

ar cr libtest.a *.o
```

将生成的libtest.a和.h文件再打一个压缩包(比如.tar.gz)一起分发给你的用户，包的内容包括：
```
[include]
    |_ test1.h
    |_ test2.h
    |_ test3.h
libtest.a
```

用户那个这些分发的文件，怎么使用，参考4来尝试.

## 8. GCC最常用的几个参数
* -Ldir  
  指定编译的时候，搜索库的路径。比如你引用第三方库 libcjson.a 在/usr/mylibs，那么-L参数写为：-L/user/mylibs，如果库分散在多个目录下，就要用多个 -L。


* -llibrary  
指定编译时候使用的库文件的名字，仍以 /usr/mylibs/libcjson.a 为例，完整参数如下：
```
gcc -L/usr/mylibs/ -ljson hello.c 
```
-L指定库文件所在目录，-l参数指定的库是将库文件名“掐头”、“去尾”的得到，即将 libcjson.a 的前缀 lib 、后缀（扩展名）.a 去掉，就是 json。

*-IDIRECTORY 
指定额外的头文件搜索路径DIRECTORY


* -static  
此选项将禁止使用动态库，所以，编译出来的东西，一般都很大，也不需要什么动态链接库，就可以运行.  

* -share  
此选项将尽量使用动态库，所以生成文件比较小，但是需要系统由动态库.  

* -c  
只激活预处理、编译和汇编，也就是他只把程序做成obj文件。
例子用法:  
```
gcc -c hello.c  
```
他将生成.o的obj文件
```
gcc -c test.s
```
将汇编输出文件test.s编译输出test.o文件。  

* -S  
只激活预处理和编译，就是指把文件编译成为汇编代码。  
例子用法:  
```
gcc -S hello.c
```
他将生成.s的汇编代码，你可以用文本编辑器察看
```
gcc -S test.i
```
将预处理输出文件test.i汇编成test.s文件 

* -E  
只激活预处理，这个不生成文件，你需要把它重定向到一个输出文件里面.  
例子用法: 
```
gcc -E hello.c > pre.txt  
gcc -E hello.c | more 
```
慢慢看吧，一个hello word 也要与处理成800行的代码
```
gcc -E test.c -o test.i
```

* -o  
指定目标名称。缺省的时候，gcc 编译出来的文件是a.out，很难听，如果你和我有同感，改掉它。
例子用法:  
```
gcc -o hello hello.c 
```

* -O0 # -O0 表示没有优化
* -O1 # -O1 为缺省值
* -O2 # -O2 Gcc将执行几乎所有的不包含时间和空间折中的优化
* -O3 # -O3 优化级别最高 

编译器的优化选项的4个级别。
例子用法：
```
gcc -O1 test.c -o test
```
使用编译优化级别1编译程序。级别为1~3，级别越大优化效果越好，但编译时间越长。

* -g  
指示编译器，在编译的时候，产生调试信息。这样就可以用GDB、LLDB等专业调试工具进行调试了。  

* -Wall 
  生成所有警告信息', 2, 2, NULL, '2020-05-21 18:21:32.303031', '2020-05-21 18:21:32.303031', 32);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (35, 'Make 简明操作', NULL, 10, NULL, NULL, '## 1 make简介

下面是我的一个C项目进行编译和链接要执行的命令序列，我把它写在shell脚本文件里了。

**▷ 文件清单 run.sh**  
```shell
LIB_PATH=./lib/csv_parser
SRC_PATH=./src
BIN_PATH=./bin
rm -rf $BIN_PATH && mkdir -p $BIN_PATH
gcc -g -Wall $LIB_PATH/csv.c \
    $LIB_PATH/split.c \
    $LIB_PATH/fread_csv_line.c \
    $SRC_PATH/sample1.c
```
每次修改代码，运行 run.sh，就会在 bin目录下生成 sample1 可执行文件。

首先，每次修改源代码，都要编译所有代码；其次，run.sh 里命令序列写法有着强烈的**个人色彩**，如果你的代码移交给其他Team维护，他们不得不按照你书写 run.sh 脚本的思路来理解项目构建的逻辑。小的工程尚不是问题，一旦工程扩大，run.sh 将变得极其难以维护。

make工具此时粉末登场了，make的思路很简单：当你改变了源文件并想重新构建程序或者其他的输出文件时，make检查时间戳看哪些改变了，并按要求重新构建这些文件，而不需要浪费时间重新构建其他文件。但是在这个基本的原则之上，make提供了丰富的选项集合，让你能够操作多个目录，为不同平台构建不同的版本，能够以其他的方式定制你的构建过程。

总结一句话：**采用易于理解的语法规则声明构建的目标，让项目构建工作更简单**。

目前市面上主要流行的 make 有以下几种版本：

* GNU make：
GNU make对make的标准功能进行了重新改写，并加入作者自认为值得加入的新功能，常和GNU编译系统一起被使用，是大多数GNU Linux默认安装的工具。

* BSD make：
该版本是从Adam de Boor制作的版本上发展起来的。它在编译目标的时有并发计算的能力。主要应用于FreeBSD，NetBSD和OpenBSD这些系统。

* Microsoft nmake：
该版本主要用于微软的Windows系统中，需要注意的是，微软的nmake与Unix项目中的nmake是两种不同的东西，千万不要混淆。

其中当属 [GNU Make](http://www.gnu.org/software/make) 最为著名，我们以下介绍都以 GNU make为例。

## 2 安装GUN make软件

在 macOS下，通常在前期准备C编译环境的时候，安装苹果的 XCode Command Line，就连带安装好了 gcc、make等工具，否则需要单独安装make。
```
brew install make
```

## 3 Makefile 基本规则

make 的细节都在 Makefile 中，make命令会自动在当前文件夹下找到 Makefile 并执行，而 Makefile 的核心内容就是**规则**，它是 Makefile 的主要组成。每项规则可以由三部分组成：

* 目标（target）
* 必要条件（prerequisite），也称依赖目标（dependencies）
* 命令(command)

书写格式如下所示，目标和条件之间由冒号隔开，命令写在下一行，并以TAB开头，每条规则中可以有多个目标，多个条件以及多条命令

```
目标(target): 依赖目标(dependencies)
    命令(command)
    命令(command)
    命令(command)
```
对于规则的理解，就是如果目标文件不存在或者必要条件中的某个文件时间戳比目标文件的时间戳要新，那么就执行下面的若干条命令，最后生成新的目标文件。

## 4 一个快速的例子：shell脚本改为make构建

前面的 run.sh 如果用 Makefile 文件改造，可能是下面的样子：
**▷ 文件清单 Makefile**  
```
LIB_PATH=./lib/csv_parser
SRC_PATH=./src
BIN_PATH=./bin
EXE_NAME=sample2
OBJECTS=$(LIB_PATH)/csv.c $(LIB_PATH)/split.c $(LIB_PATH)/fread_csv_line.c
main: compile
    gcc $(OBJECTS) -o $(BIN_PATH)/$(EXE_NAME) $(BIN_PATH)/$(EXE_NAME).o 
compile: init
    gcc -c $(SRC_PATH)/$(EXE_NAME).c -o $(BIN_PATH)/$(EXE_NAME).o
init: 
    mkdir -p $(BIN_PATH)
clean:
    rm -rf $(BIN_PATH)
```

它的大致含义是：将构建分解为多个目标（可以理解为任务、步骤），这里的目标就是：main、compile、init、compile，LIB_PATH、SRC_PATH和shell脚本类似，是变量定义，引用时用 $(变量名)，这和 shell 脚本的变量引用 ${} 是不痛的，请注意。在命令行下，运行任何一个目标的方法是：
```
make [目标名]
````
1. 执行：```make clean``` 将删除名字为bin的目录
2. 执行：```make compile``` ，由于 compile 依赖 init 目标，所以先执行 init 目标，由于 init 没有依赖目标，所以会无条件执行"创建 bin 目录"的操作，合起来执行的命令序列就是：
>创建 bin 目录
>编译sample1.c 为 bin目录下的sample2.o

3. 执行 ```make main``` 同理：它将依次行 init、compile、main目标。

**make 还有一个便捷操作：就是当执行 make 命令不带任何参数的时候，将默认执行 Makefile 里的第一个任务，即等同于执行 ```make main``` 操作**

GNU Make 构建规则涉及内容庞大，为了深入学习，你可以去看官网文档学习。同时，这里也推荐一本系统性的书籍：

[GNU Make项目管理](https://item.jd.com/36881221734.html) ，电子书在[这里](http://by-camp.oss-cn-shanghai.aliyuncs.com/books/C/GNU%20Make%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86(%E7%AC%AC%E4%B8%89%E7%89%88).pdf)下载。  
![](http://by-camp.oss-cn-shanghai.aliyuncs.com/wiki/books/images/gnu-make.png?x-oss-process=image/resize,w_250/sharpen,100)

## 5 了解 CMake
CMake（ 官网：https://cmake.org/ ）是一个跨平台的安装（编译）工具，可以用简单的语句来描述所有平台的安装(编译过程)。他能够输出各种各样的makefile或者project文件，能测试编译器所支持的C++ 特性,类似UNIX下的automake。只是 CMake 的组态档取名为 CMakeLists.txt。
Cmake 并不直接建构出最终的软件，而是产生标准的建构档（如 Unix 的 Makefile 或 Windows Visual C++ 的projects/workspaces），然后再依一般的建构方式使用。这使得熟悉某个集成开发环境（IDE）的开发者可以用标准的方式建构他的软件，这种可以使用各平台的原生建构系统的能力是 CMake 和 SCons 等其他类似系统的区别之处。

**cmake 的特点主要有：**

1. **开放源代码**，使用类 BSD 许可发布。http://cmake.org/HTML/Copyright.html
2. **跨平台**，并可生成 native 编译配置文件，在 Linux/Unix 平台，生成 makefile，在苹果平台，可以生成 xcode，在 Windows 平台，可以生成 MSVC 的工程文件。
3. **能够管理大型项目**，KDE4 就是最好的证明。
4. **简化编译构建过程和编译过程**。Cmake 的工具链非常简单：cmake + make。
5. **高效率**，按照 KDE 官方说法，CMake 构建 KDE4 的 kdelibs 要比使用 autotools 来构建 KDE3.5.6 的 kdelibs 快 40%，主要是因为 Cmake 在工具链中没有 libtool
6. **可扩展**，可以为 cmake 编写特定功能的模块，扩充 cmake 功能。



在 linux/macOS等 平台下使用 CMake 生成 Makefile 并编译的流程如下：

1. 编写 CMake 配置文件 CMakeLists.txt。
2. 执行命令 cmake PATH 或者 ccmake PATH 生成 Makefile。其中， PATH 是 CMakeLists.txt 所在的目录。
3. 使用 make 命令进行编译。

“CMake”这个名字是“cross platform make”的缩写。虽然名字中含有“make”，但是CMake和Unix上常见的“make”系统是分开的，而且更为高阶，是产生 Makefile 的好帮手。

在macOS下，使用 ```brew install cmake```安装 CMake，cJSON库( https://github.com/DaveGamble/cJSON ) 是一个使用CMake 和 make 构建的一个现实好例子，大家可以下载体验一下。', 3, 2, NULL, '2020-05-21 18:21:32.35044', '2020-05-21 18:21:32.35044', 32);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (36, 'C代码规范', NULL, 10, NULL, NULL, '半圆推荐使用 Google C Style： https://google.github.io/styleguide/cppguide.html

使用Sublime Text编码，可以安装C格式化插件来美化代码。市面上可用的插件几乎只有 [SublimeAStyleFormatter](https://packagecontrol.io/packages/SublimeAStyleFormatter)可用，不过它确实足够优秀，SublimeAStyleFormatter 主要关注在C、Java代码格式化。

## 安装Sublime下的SublimeAStyleFormatter插件

Mac OS下打开Sublime Text，按CMD + SHIFT + P，弹出窗口输入install，下拉列表第一个显示的条目是："Package Control: Install Package"，选中按回车键，输入 SublimeAStyleFormatter ，甚至只输入部分文字就会下拉列出该插件的名字，选中然后按回车键，稍等片刻，安装完毕。

>***1. 什么？按CMD + SHIFT + P，输入install的时候就卡住，你没有看到这个下拉条目？***   
>这是你应该去 https://packagecontrol.io 首先安装 Sublime Text 的插件的管理工具。
>
>***2. 什么？按CMD + SHIFT + P完全没有反应？***  
>Terrible，你不得不先学会科学上网！

## SublimeAStyleFormatter的基本用法

写一段C代码
```
#include <stdio.h>

int main()
{
printf ("Hello World\n") ;
int sum =3+4;
return 0;
}}Ï
```

打开右键菜单 AStyleFormater->Format（快捷键：CTRL + OPTION + F），点击确认后格式成：
```c
#include <stdio.h>

int main()
{
    printf ("Hello World\n") ;
    int sum = 3 + 4;
    return 0;
}
```

的确好看了不少，不过还不足够，比如prinf函数和(之间有一个多余的空格，另外缩进是TAB，不是我想要的4个spaces。怎么办？

分别打开插件设置：Preferences->Package Settings->SublimeAStyleFormatter->Settings - Default 和 Settings - User，将Settings - Default里项修改的项复制到Settings - User里进行修改，如下：

``` json
{
    "options_default": {
        "indent": "spaces",
        "indent-spaces": 4,
    }
}
```
保存后再格式化一次，看看缩进的TAB是不是变成了4个spaces。

## SublimeAStyleFormatter使用Google C Style

我的项目代码遵从了 [Google C Style](https://google.github.io/styleguide/cppguide.html)(Google的代码风格指南开源在 https://github.com/google/styleguide )，Oops，那么多代码格式设定看来都要在 SublimeAStyleFormatter 里设置。

参考 SublimeAStyleFormatter文档（开源在 https://github.com/timonwong/SublimeAStyleFormatter ），文档介绍极其简单，原来它是基于 [Artistic Style](https://sourceforge.net/projects/astyle/)，其实是要学会 Artistic Style 如何设置代码风格，然后将设置参数存成一个文本文件，如 .astylerc，然后被 SublimeAStyleFormatter 引用即可。

符合Google C Style的Artistic Style参数设置如下：
```
--style=google

--indent=spaces=4

--attach-namespaces
--attach-classes
--attach-inlines

--add-brackets

--align-pointer=name
--align-reference=name

--max-code-length=200
--break-after-logical

--pad-oper
--unpad-paren

--break-blocks
--pad-header
```
文件存储为.astylerc，放到家目录，插件的Settings - User再次修改为：

```
{
    "options_default": {
        "indent": "spaces",
        "indent-spaces": 4,
    },
    "options_c": {
        "additional_options_file": "$HOME/.astylerc"
    },    
}
```
>注：$HOME就指代你的家目录

再按快捷键 CTRL + OPTION + F格式化代码，看看是不是变成下面这样：
```c
#include <stdio.h>

int main() {
  printf("Hello World\n") ;
  int sum = 3 + 4;
  return 0;
}
```

-- 完 --', 4, 2, NULL, '2020-05-21 18:21:32.397327', '2020-05-21 18:21:32.397327', 32);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (37, 'printf与scanf函数', NULL, 10, NULL, NULL, '本节我们来详细介绍 printf 函数和 scanf 函数。

## printf函数:带格式输出

**▣ printf**

|◈ 头文件|#include \<stdio.h>|
|---|---|
|◈ 原型|int printf(const char...);|

### 功能

printf函数会将format后面的实参转换为指定的字符序列输出形式，再将它发送至标准输出流。这个转换是根据format所指的格式控制字符串中的命令进行的。格式控制字符串中可以不包含任何命令，也可以包含多个命令。

实参个数比格式控制字符串少时的操作未定义。实参个数比格式控制字符串多时，多余的实参将被忽略。

命令可分为下述两类:

    ♦ %以外的字符，不作转换按原样复制到输出流。      
    ♦ 转换说明，对后面给出的〇个以上的实参作格式转换。

%后会依次出现下面的(a)~(e)。

**(a)转换标志(可省略)**

使用标志字符-、+、空格、#、0可以修饰转换说明的含义，可指定0个以上(包括0)的标志，顺序任意。

|符号|含义|
|---|---|
|-|将转换结果在字段宽度范围内左对齐。未指定时右对齐。|
|+|是在要转换的带符号数值之前加上正号或负号。未指定时只对负值加负号。|
|空格|若带符号的转换结果不以符号开头或者字符数为0,则在数值前加上空格。<br/>► 若同时指定了?格标志和+标志，贝!Kh标志无效。|
|#|以下数值表示形式(基数等)作格式转换。<br/>•o转换—第一个数字为0(增加精度)。<br/>•X、X转换—在数值之前加上前缀0x(或0X)。数值为0时不加前缀。<br/>•e、E、f、g、G转换一无论小数点之后是否有数字，都加上小数点(一般只在小数点后有数字的情况下才加)。<br/>•g、G转换一保留转换结果末尾的0。<br/>•其他转换操作未定义。|
|0|•d、i、o、u、x、e、E、f、g、G转换—在字段宽度范围的左侧使用〇而非空格进行填充(符号和基数位于0的前面)。<br/>•其他转换操作未定义。<br/>► 若同吋指定0标志和-标志，则0标志无效。<br/>► 若在d、i、o、u、x、X转换中指定了精度，则0标志无效。|

**(b)最小字段宽度(可省略)**

可以用"*"或十进制整数表示。

若转换结果的字符数小于指定的最小字段宽度，则在左侧(指定-标志时在右侧)补空格(若未指定0标志)，直到填满字段宽度。

**(c)精度(可省略)**

可以用小数点(.)后的星号(*)或十进制整数表示。省略十进制整数时精度为0。对于各种转换的说明如下:

•d、i、o、u、x、X转换——最小输出位数。  
•e、E、f转换——小数点之后的输出位数。  
•g、G转换——最大有效位数。  
•s转换——最大字符数。  

>► 当用星号指定字段宽度、精度时.需要有相应的int型实参(定义在要转换的实参之前)。当指定了字段宽度的实参为负数时，则字段宽度解释为前置-标志的正数。当指定了精度的实参为负数时.则精度解择为未指定。

**(d)转换修饰符(可省略)**

可以用h、l、L表示。

|符号|含义|
|---|---|
|h|•d、i、o、u、x、X转换---表示实参的数据类型为short型或unsignedshort型(实参会根据数据类型自动提升规则转换成高精度的数值进行计算。计算完成后再将值转回short型或unsignedshort型进行显示)。<br/>•n转换—表示实参的数据类型为指向short型的指针。|
|l|•d、i、o、u、x、X转换---表示实参的数据类型为long型或unsignedlong型。<br/>•n转换—表示实参的数据类型为指向long型的指针。|
|L|.e、E、f、g、G转换一表示实参的数据类型为longdouble型。|

>► 转换修饰符与上述以外的其他转换说明符一起使用吋的操作未定义。

**(e)转换说明符(可省略)**

可以用d、i、o、u、X、X、f、e、E、g、G、c、s、p、n、%表示。

|符号|含义|
|---|---|
|d、i|将int型的实参转换为[-]dddc(形式的带符号十进制数进行输出。精度指定了应输出的数字的最少个数。若转换结果的数字个数(位数)小于指定的精度，则在前面补0直到满足精度要求。省略时的精度默认为1。精度为0且参数为0时，转换结果的位数为0(null字符串)。|
|o、u、x、X|unsigned型的实参转换为dddd形式的无符号八进制数(o)、无符号十进制数(u)、无符号十六进制数(X或X)。在x转换中，使用字符abcdef。在X转换中，使用字符ABCDEF。<br/>精度指定了应输出的最少位数。若转换结果的位数小于指定的精度，则在前面补0直到满足精度要求。省略时的精度默认为1。精度为0且参数为0时，转换结果的位数为0(null字符串)。|
|f|将double型的实参转换为[-]cidd.ddc形式的十进制数进行输出。<br/>此时小数点之后的位数等于指定的精度。省略时的精度默认为6。如果精度为0且未指定#标志，则不会输出小数点。小数点之前至少有1个数字时才会输出小数点。<br/>该转换会根据位数适当地四舍五入。|
|e、E|double型的实参转换为[-]d.ddde土dd形式的十进制数进行输出。<br/>此时小数点之前输出1位(实参为0时除外，不为0的)数字，小数点之后输出与指定精度相同位数的数字。省略时的精度默认为6。如果精度为0且未指定#标志，则不会输出小数点。该转换会根据位数适当地四舍五入。指定E转换时，指数前的字符是E而不是0。<br/>指数总是至少显示2位。值为0时，指数的值为0。|
|g、G|根据指定了有效位数的精度，将double型的实参转换为f形式或e形式(指定G转换时为E形式)。<br/>精度为0时，解释为1。<br/>使用哪种形式取决于待转换的值。若转换结果中的指数小于-4或大于等于精度，则使用e形式(或E形式)。无论使用哪种形式，都会去掉转换结果小数部分缀尾的0。只有当小数点后还有数字的情况下，才会输出小数点。|
|c|将int型的实参转换为unsignedchar型之后，再输出转换后的字符。|
|s|实参必须为指向字符型数组的指针。输出数组中null之前的字符。当指定了精度时，不会输出超出精度范围的字符。当精度未指定或精度大于数组长度时，数组必须包含null字符。|
|p|实参必须为指向void的指针。用编译器所定义的格式将该指针的值转换为可显示的字符序列。|
|n|实参必须为指向整数的指针。这个整数保存了到调用该printf函数为止发送至输出流的字符数。不进行实参的转换。|
|%|输出%。无实参。转换说明必须写作%%。|

指定无效的转换说明符时的操作未定义。

当实参为共用体或聚合体，抑或是指向这两者的指针时(除了%S转换时的字符型数组和%p转换时的指针)，操作未定义。

字段宽度未指定或比转换结果的长度小时，不会截断转换结果。即当转换结果的字符数大于字段宽度时，将宽度扩大至正好能容纳转换结果。

### 返回值

printf函数会返回输出的字符数。发生输出错误时，返回负值。

printf函数的第一个参数接收的是指定格式所需的字符串。因此，第一个参数format的类型会被声明为constchar*。

另外，第二个参数之后的参数类型和个数是可变的。声明中的...是表示接收个数可变的参数的省略符号(ellipsis)。因此，在函数调用方，可以传递任意个数的任意类型的参数。

>► 省略符号，和...中可以加入空格，但...必须连续。

实际的程序中经常会使用标志字符0。例如，在表示年、月时，在只有一位的数值的左侧加上0,就可以以“两位”的形式显示该数。如下所示。

```
pcintf("%02d月%2d日");
```
这样就可以输出“05月12日”“11月08日”等结果。

当输出成功时，printf函数会返回输出的字符数:当输出错误时，则会返回负值。比如下
面这个函数调用，只要没有发生输出错误，就会返回3。

```c
w = printf(''%3d", x);
```

灵活应用这一点，可以对下述显示结果进行判断

```c
w = printf("%3d",x);
if(w < 0)
    /* 输出错误 */
elseif(w==3)
    /* 输出3位 */
else
    /* 输出 4 位以上（x为4位以上）
```

## scanf函数:带格式的输入

与进行输出的printf函数相对的，是进行输入的scanf函数。该函数的说明如下所示。

**▣scanf**

|◈ 头文件|#include \<stdio.h>|
|---|---|
|◈ 原型|int scanf(const char *format, ...);|

### 功能

scanf函数的功能是对来自于标准输入流的输入数据作格式转换，并将转换结果保存至format后面的实参所指向的对象。format指向的字符串为格式控制字符串，它指定了可输入的字符串及其赋值时转换方法。格式控制字符串中可以不包含任何命令，也可包含多个命令。

实参个数比格式控制字符串少时的操作未定义。

实参个数比格式控制字符串多时，多余的实参将被忽略。命令可分为下述三类:

♦1个以上的空白字符。  
♦(%和空白字符以外的)字符。  
♦转换说明。  

%后面依次是下述的(a)〜(d)。

**(a)赋值屏蔽字符\*(可省略)**  
用“*”表示。

**(b)最大字段宽度(可省略)**  
用0以外的十进制整数表示。

**(c)转换修饰符(可省略)**  
表示保存转换结果的对象的长度。可以用h、l、L表示。

|||
|---|---|---|
|h|•d、i、n转换一表示实参为指向short型的指针，而不是指向int型的指针。<br/>•o、u、x转换——表示实参为指向unsignedshort型的指针，而不是指向unsigned型的指针。|
|l|•d、i、n转换^■一表示实参为指向long型的指针，而不是指向int型的指针。<br/>•o、u、x转换——表示实参为指向unsignedlong型的指针，而不是指向unsigned型的指针。<br/>•e、f、g转换——表示实参为指向double型的指针，而不是指向float型的指针。|
|L|•e、f、g转换——表示实参为指向longdouble型的指针，而不是指向float型的指针。|

>► 转换修饰符与上述以外的其他转换说明符一起使用吋的操作未定义。

scanf函数会依次执行格式控制字符串中的各项命令。命令执行失败时，scanf函数会返回主调函数。以下两个原因会导致命令执行失败。

♦输入错误—由于获取不到输入字符而导致。  
♦匹配错误—由于不恰当的输入而导致。

由空白字符构成的命令会读取输入的空白字符，直至出现第一个非空白字符(该字符不会被读取，保留在流中)或者不能继续读取为止。命令通常会从流中读取下一个字符。当输入字符与构成命令的字符不匹配时，这项命令失败并且该输入字符及其后面的字符都不会被读取，仍然保留在流中。

转换说明的命令根据各个转换说明符相应的规则定义输入匹配项的集合。转换说明按下述步骤执行。

若转换说明中不包含[、C、n指定符，则在读取时会跳过空白字符串。若转换说明中不包含n指定符，则会从流中读取输入项。输入项为输入字符串中最长的匹配项。但如果最长的匹配项的长度超过了指定的字段宽度，就截取匹配项中与字符宽度相等的前几个字符作为输入项。即使在输入项后面还有字符也不会被读取，该字符及其后面的字符都将保留在流中。当输入项的长度为0时，命令执行失败，此时状态为匹配错误。而因某些错误导致不能在流中进行输入，则为输入错误。

除非使用%指定符，其他情况下转换说明都会根据转换说明符将输入项(或%n指定时的输入字符数)转换为合适的数据类型。当输入项不为匹配项时，命令执行失败，此时状态为匹配错误。如果没有指定输入屏蔽字符*，那就会将转换结果赋于format之后还未赋值的第一个实参指向的对象中。该对象的数据类型不正确或不能在内存单元中表示转换结果时的操作未定义。

**(d)转换说明符(可省略)**

可以用d、i、o、u、x、X、e、E、f、g、G、s、[、c、p、n、%表示。

|符号|含义|
|---|---|
|d|可省略符号十进制整数。实参必须为指向整数的指针。|
|i|可省略符号的整数。实参必须为指向整数的指针。|
|o|可省略符号的八进制整数。实参必须为指向无符号整数的指针。|
|u|可省略符号的十进制整数。实参必须为指向无符号整数的指针。|
|x、X|可省略符号的十六进制整数。实参必须为指向无符号整数的指针。|
|e、E、f、g、G|可省略符号的浮点数。实参必须为指向浮点数的指针。|
|s|非空白字符序列。实参必须为指向字符型数组第一个字符的指针。该数组的长度须足够容纳所有字符序列以及null字符。该转换会自动添加一个表示字符串末尾的null字符。|
|\[|描字符集(scanset)元素的非空序列。实参必须为指向字符型数组第一个字符的指针。该数组的长度须足够容纳所有字符序列以及null字符。该转换会自动添加一个表示字符串末尾的null字符。<br/>换说明符为左方括号与右方括号]之间的格式控制字符串中的所有字符序列。当紧跟在左方括号后面的字符不是折音符''时，扫描字符集由左右方括号之间的扫描列表(scanlist)构成。当紧跟在左方括号后面的字符是。时，扫描集为未出现在与右方括号之间的扫描列表中的所有字符。当转换说明符以[]或字符开始时，第一个右方括号为扫描列表中的一个字符元素，而第二个出现的右方括号才是转换说明的结束符。当转换说明符不以和[a]开始时，第一个出现的右方括号就是转换规范的结束符。当扫描列表中含有连字符并且既非第一个字符(如果以开头，则为第二个字符)也非最后一个字符时，其定义因编译器而异。|
|c|字符宽度(命令中没有指定字段宽度时默认为1)中指定长度的字符序列。该指定符对应的实参必须为指向字符型数组的第一个字符的指针。该数组的长度须能足够容纳接收到的字符序列。该转换不会添加null字符。|
|p|编译器定义的字符序列的集合。该集合与printf函数中的%9转换所生成的字符序列集合相同。该指定符对应的实参必须为指向void的指针的指针。对输入项的解释根据编译器而定。如果输入项为同一程序中己转换过的值，那么转换结果的指针值与转换前的值相等。其他情况时的%?转换操作未定义。|
|n|不读取输入。该指定符对应的实参必须为指向整数的指针。这个整数保存了到调用san/函数为止从输入流读取到的字符数。执行%1命令并不会增加scanf函数结束时返回的输入项数。|
|%|匹配一个%。不会执行转换和赋值操作。转换说明必须写作%%。|

指定无效的转换说明符时的操作未定义。

如果在输入中检测到文件末尾就结束转换操作。如果在检测到文件末尾之前，未读取到任何1个字符匹配当前命令，那么就视该命令在执行中发生输入错误，结束转换操作。如果在检测到文件末尾之前，至少读取到1个字符匹配当前命令，那么只要该命令不发生匹配错误，后续命令(若存在)就会因发生输入错误而结束操作。

若因输入字符与命令不匹配使得转换操作结束，那么这个不匹配的输入字符就不会被读取，仍然保留在流中。只要输入中后续的空白字符(包括换行符)与命令不匹配，就会保留在流中不被读取。除非使用%n命令，通常字符命令以及包含赋值屏蔽的转换规范都无法直接判断执行是否成功。

### 返回值

如果不作任何转换就发生了输入错误，scanf函数会返回宏定义EOF的值。否则，scanf函数会返回成功赋值的输入项数。如果输入时发生了匹配错误，那么这个项数就会比转换说明符对应的实参个数少，甚至为0。


请注意对double型和float型的值进行读写所需的格式字符串的区别。二者通过printf函数进行显示所用的格式字符串都是”而通过scanf函数进行输入的格式字符串则根据类型的不同而不同(表1)。

**■表1 double型和float型的读写**

||double型|float型|
|---|---|---|
|printf函数|printf("%f",x)|printf("%f",x)|
|scanf函数|scanf("%lf",&x)|scanf("%f",&x)|

scanf函数返回所读取的项目数。灵活利用该返回值，可以像下面这样对读取结果进行判断。

```c
if(scon/("%d%d",&x,&y)==2)
    /* 成功读取x和y */
else
    /* 读取失败 */
```

另外，如果一项也没有读取，则返回EOF。
', 5, 2, NULL, '2020-05-21 18:21:32.444645', '2020-05-21 18:21:32.444645', 32);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (38, '初识C语言', NULL, 10, NULL, NULL, '', 2, 1, NULL, '2020-05-21 18:21:32.473052', '2020-05-21 18:21:32.473052', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (39, '显示计算结果', NULL, 10, NULL, NULL, '## 计算整数的和并显示结果

计算整数 20 和 45 的和，并显示结果。在编辑器中键入如代码清单 demo1.c 所示的程序代码。

**代码清单 demo1.c**

```c
/*
显示整数 20 和 45 的和
*/
#include <stdio.h>

int main() {
    printf("%d", 20 + 45);

    return 0;
}
```

### 程序编译和运行

编译程序 demo1.c，生成可执行文件 demo1

> gcc  demo1.c -o demo1

运行程序 demo1

> ./demo1

屏幕显示：

> 65

### 程序分析

#### printf函数: 格式化输出函数

***printf*** 函数 可以在显示器上进行输出操作(末尾的f源自format(格式化)这个单词)。

***printf*** 函数的第一个实参"%d"指定了输出格式，它告诉程序：以十进制数的形式显示后面的实参。因此，通过调用printf函数显示出了第二个实参 20 + 45 的值，即 20 与 45 的和 65。


>► "%d"的d源自decimal(十进制数)。

#### 语句

请大家仔细观察之前的程序代码，调用printf函数的时候使用了分号，那段固定代码(return 0;) 中也使用了分号。这里的分号就相当于中文里的句号。

正如在句子末尾加上句号才能构成完整的一句话，C语言中也需要在末尾加上分号来构成正确的语句(statement)。

开始执行程序后，固定代码中 { 和 } 之间的语句会被按顺序执行。

## 格式化字符串和转换说明

程序运行的时候如果只显示和或者差的值，理解上会比较困难，接下来我们让结果显示得更加人性化一些，修改 demo1.c，这次我们把printf函数的第一个实参设置得更长更复杂一些。

**代码清单 demo2.c**

```c
/*
人性化的显示整数 20 和 45的和
*/
#include <stdio.h>

int main()  {
    printf("20与45的和是%d。\n", 20 + 45);
    
    return 0;
}
```

代码清单 demo2.c 中的 `"20与45的和是%d。\n"` 是printf函数的第一个实参，称为 ***格式化字符串***(format string)。

格式化字符串中的%d指定了实参要以十迸制数的形式显示，这就是 ***转换说明***(conversion specification)。格式化字符串中没有指定转换说明的字符基本上都会原样输出。

格式化字符串结尾的\n是代表换行(new line)的符号，\和n组成了一个特殊的 ***换行符***。

►画面中不会显示\和n，而是会输出一个(看不见的)换行符。

***★ 专题 换行的必要性***

>下面所示为代码清单 demo1.c 的运行情况（$ 表示操作系统提示符，实际根据自己所用操作系统决定），
>
>```shell
>$ ./demo1↙
>65
>```
>在大多数运行环境中，程序执行后，程序的输出结果65后面都会紧跟着提示符。
>
>如代码清单 demo2.c 所示，若在程序的最后输出了换行符(\n)，则不会紧跟着提示符。如下所示：
>
>```shell
>$ ./demo2↙
>20与45的和是65。
>$
>```

## 符号的称呼

C语言里符号的称呼如表 1 所示。

**■ 表 1 符号的称呼**

|+|加号、正号、加|{|左大括号|
|---|---|---|---|
|-|减号、负号、连字符、减|}|_右太括号|
|*|星号、乘号、米号、星|[|左方括号、左中括号|
|/|斜线、除号|}|右方括号、右中括号|
|\\|反斜线|<|小于|
|¥|货币符号|>|大于|
|%|百分号|?|问号|
|.|点|!|感叹号|
|,|逗号|&|and符|
|:|冒号|~|波浪线|
|;|分号|>|音调符号|
|''|单引号|#|井号|
|"|双引号|_|下划线|
|(|左括号、左圆括号、左小括号|=|等号、等于|
|)|右括号、右圆括号、右小括号|\||竖线|



## 无格式化输出

调用 printf 函数的时候也可以只使用一个参数。这时，格式化字符串内的字符将按照原样显示。显示 `您好!我叫小明。“` 的程序如代码清单 demo3.c 所示。

>► 大家在编写程序吋可以将这里的 `小明` 改为自己的名字。

**代码清单 demo3.c**

```c
/*
    打招呼并进行自我介绍
*/
#include <stdio.h>

int main() {
    printf("您好！我叫小明。\n");

    return 0;
}
```
下面我们稍微把程序修改一下，让 `“您好!”` 和 `“我叫小明。”`分别在两行显示。修改后的程序如代码清单 demo4.c 所示。

**代码清单 demo4.c**

```c
/*
    打招呼并进行自我介绍
*/
#include <stdio.h>

int main() {
    printf("您好！\n我叫小明。\n");

    return 0;
}
```

在格式化字符串中间插入 \n 就可以实现换行操作。而像代码清单 demo5.c 那样，调用两次printf函数也可以得到同样的效果。

**代码清单 demo5.c**

```c
/*
    打招呼并进行自我介绍
*/
#include <stdio.h>

int main() {
    printf("您好！\n");
    printf("我叫小明。\n");

    return 0;
}
```

这样程序是不是更易读了呢?

## 字符串常量
像”ABC"和"您好!"这样用双(")括起来的一连串连续排列的文字，称为**字符串常量(string literal)**。
## 转义字符
我们已经介绍了能够实现换行的特殊符号 `\n`，像这样的特殊符号称为转义字符(escape sequence)。

响铃（alert）的转义字符是 `\a` 。代码清单 demo6.c 中的程序，在显示 `您好!` 之后响铃3次。

**代码清单 demo6.c**

```c
/*
打招呼并响铃3次
*/
#include <stdio.h>

int main() {
    printf("您好！\a\a\a\n");

    return 0;
}
```

>► 程序在某些环境下运行吋可能不响铃（通常情况下都是发出蜂鸣音，即“哔”的声音，但有吋并不发出声音，而是通过视觉来发出警报）或者连续响铃3次。

## 作业
**● 练习 1**

编写一段程序，计算出20减去45的结果，并以“20减去45的结果是-22。”的格式进行显示。


**● 练习 2**

>写一段程序，调用一次printf函数，显示下面内容。
>
>```
>天
>地
>人
>```
>

**● 练习 3**

>编写一段程序，调用一次printf函数，显示下面内容。
>
>```
>喂
>
>你好!
>再见。
>```', 1, 2, NULL, '2020-05-21 18:21:32.502379', '2020-05-21 18:21:32.502379', 38);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (40, '变量', NULL, 10, NULL, NULL, '为了记录下计算过程中的结果以及最终结果，需要使用变量。本节我们就来学习变量的使用方法。

## 变量和声明

到目前为止，我们都是对传入程序中的 **常量(constant)** 进行求和、求差等操作，并显示出计算结果。如果遇到比较复杂的计算，为了在中途记录结果就需要使用 **变量(variable)** 了。

听到“变量”这个词，不喜欢数学的人可能会联想到上中学时学到的方程式，产生畏难情绪。其实并不用担心，请看下文。

变量其实就是用来放置数值和字符等的“盒子”。

在用来存放数值的魔法盒—变量中放入数值后，只要该盒子还在，值就会一直被保存，而且还可以自由地取出或替换数值。

要想使用变量，必须遵循一定的流程。首先需要进行如下声明(declaration)。

```c
int n; /* 声明一个int类型的变量n */
```

我们通过声明准备出了一个名为的变量(盒子)。这个变量只能用来存放整数值，因此变量n就称为整型(int型)。

>► int是表示整数的英文单词integer的缩写。关于数据类型，我们将在后面章节详述。

本例中的变量名是n，但其实变量可以自由命名。而且作为变量名的字符的个数(在一定程度上)也是自由的，比如变量名为i、no或year都是可以的。

>■注意■ 要使用变量，必须通过声明明确其类型和名称。

让我们考虑下面这个问题，实际使用变量编写一段程序。

给两个变量赋上合适的值并显示。写成的程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
为两个变量赋整数值并显示
*/
#include <stdio.h>

int main()  {
    int vx, vy;

    vx = 57; // ❶
    vy = vx + 10; // ❷

    printf("vx的值是%d。\n", vx);
    printf("vy的值是%d。\n", vy);

    return 0;
}
```

上述程序在一行中声明了两个变量vx和vy,并通过逗号分隔，这样就创建了名为vx的变量和名为vy的变量。

当然也可以像下边这样分行声明两个变量。

```c
int vx; /* 变量 vx*/
int vy; /* 变量 vy*/
```

>► 分行声明变量更便于添加注释，并且也能更容易地添加和删除声明，但是程序的代码行数会有所增加。所以请大家根据实际情况灵活使用这两种声明方式。

## 赋值

在本程序中我们第一次使用了等号“=”，它表示把右侧的值赋给左侧的变量。因此，首先会在❶处把 57 赋给变量vx。

>► 需要注意，这里的等号并不像数学中那样代表vx和57相等之意。

另外，任何时候都可以取出变量的值。在❷处，我们取出了vx的值并加上10,然后再赋值给vy,这样vy的值就变成了67。

## 初始化

下面让我们做个试验，从上面的程序中删除为变量赋值的部分，看看结果会怎么样。首先来执行代码清单 demo3.c。

**代码清单 demo2.c**

```c
/*
在不为两个变量赋值的情况下显示
*/
#include <stdio.h>

int main() {
    int vx, vy;

    printf("vx的值是%d。\n", vx);
    printf("vy的值是%d。\n", vy);

    return 0;
}
```

变量vx和vy变成了奇怪的值。这是因为在生成变量的时候，变量会被放入一个不确定的值，即 ***垃圾值***。

因此，如果从没有设定值的变量中取出数值，结果就会变得出乎意料。

>► 根据运行环境和编译器的不同，显示的值也不同(有时会发生运行时错误，导致程序运行中断)。即使是相同的运行环境.每次执行程序吋也有可能显示的值都有所不同。

## 声明时初始化

如果事先己经知道了变量中要存放的值，就应该首先将该值赋给变量。现在我们对上述程序进行修改，修改后的程序如代码清单 demo3.c 所示。

通过蓝色底纹部分的声明，变量VX和vy分别被初始化(initialize)为了57和vx+10(即67)。变量声明中等号右边的部分，用来指定变量生成时的值，称为 ***初始值（initializer）***。

之前我们把变量比作了放置数值的盒子，如果我们已经知道了其中应该存放的数值，那么自然就可以在制作这个盒子的同时把它也放进去。

>■注意■  变量在生成的时候会被放入不确定的值。因此，在声明变量的时候，除了有特别的要求之外，一定要对其进行初始化。

**代码清单 demo3.c**

```c
/*
为两个变量进行初始化并显示
*/
#include <stdio.h>

int main() 
{
    int vx = 57;
    int vy = vx + 10;

    printf("vx的值是%d。\n", vx);
    printf("vy的值是%d。\n", vy);

    return 0;
}
```

## 初始化和赋值

初始化和赋值，它们在变量中放入数值的时间是不同的。可以像下面这样理解：

* 初始化：在生成变量的时候放入数值。
* 赋值：在己生成的变量中放入数值。

## 作业

* **练习 1**

如果在 int 型变量的声明中为变量赋一个实数值的初始值（如3.14或5.7等）会怎样呢？请试着生成程序并确认。


', 2, 2, NULL, '2020-05-21 18:21:32.529002', '2020-05-21 18:21:32.529002', 38);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (41, '输入显示', NULL, 10, NULL, NULL, '本节中将介绍如何读取通过键盘输入的整数值，并将其存放在变量中。

## 通过键盘进行输入

仅仅输出显示没有什么意思，下面我们来读取通过键盘输入的值，模拟人机对话。

读取一个整数值，并显示出来进行确认。程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
显示并确认输入的整数值
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    printf("您输入的是%d。\n", no);

    return 0;
}
```

## 格式化输入函数scanf

scanf函数可以从键盘读取输入的信息。

这里同样可以像printf函数那样，通过转换说明"%d"来限制函数只能读取十进制数。因此，上述程序就向计算机传达了这样一个指令:

从键盘读取输入的十进制数，并把它保存到 no 中。

另外，下面一点需要注意。

>■注意■ printf函数不同，在使用scanf函数进行读取时，变量名前必须加上一个特殊的符号&。

这样一来，程序中首先就会显示“请输入一个整数:”，提示输入整数值。scanf函数读取结束后，就会显示“您输入的是〇〇。”(变量no中读入的数值显示为〇〇)。

## 乘法运算

下面让我们来改写程序，读取一个整数，但并不将其直接显示出来，而是显示其5倍数的值。该程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/*
读取一个整数并显示其5倍数的值
*/
#include <stdio.h>

int main() {
    int no;
    printf("请输入一个整数：");
    scanf("%d", &no);

    printf("它的5倍数是%d\n", 5 * no);

    return 0;
}
```

大家在这里第一次接触到了符号\*，它是乘法运算的运算符。当然，把程序中的 5\*no 改为 no * 5，所得的结果也是一样的。

## 输出函数puts

接下来让我们利用变量来解决稍微复杂一些的问题。读取两个整数的值，显示它们的和。程序如代码清单 demo3.c 所示。

**代码清单 demo3.c**

```c
/*
显示出读取到的两个整数的和
*/
#include <stdio.h>

int main() {
    int n1, n2;
    puts("请输入两个整数。");
    printf("整数1:"); scanf("%d", &n1);
    printf("整数2:"); scanf("%d", &n2);

    printf("它们的和是%d\n", n1 + n2);

    return 0;
}
```

本例中第一次使用到了puts函数(末尾的s取自string)。

puts函数可以按顺序输出作为实参的字符串，并在结尾换行。也就是说，puts("...") 与 printf("...\n") 的功能基本相同。

在需要换行且不用进行格式化输出的时候，就可以使用 puts 函数来代替 printf 函数。

对本例中的程序进行一些修改(代码清单 demo4.c)，把读取出的整数的和保存在变量 wa 中,然后显示出 wa 的值。程序的结果和代码清单demo3.c 是完全一样的。

**代码清单 demo4.c**

```c
/*
显示出读取到的两个整数的和
*/
#include <stdio.h>

int main() {
    int n1, n2;
    int wa;

    puts("请输入两个整数。");
    printf("整数1:"); scanf("%d", &n1);
    printf("整数2:"); scanf("%d", &n2);

    wa = n1 + n2;

    printf("它们的和是%d\n", wa);

    return 0;
}
```

因为本程序中仅仅是显示加法运算的结果，所以引入变量wa的优势并没有显现出来。但是，如果在加法运算的基础上再进行别的运算，引入变量的优势就十分明显了。

## 作业

* 练习 1

>编写一段程序，像下面那样读取一个整数并显示该整数加上12之后的结果。
>
>```
>输入一个整数:57↙
>整数加上12的结果是69。
>```

* 练习 2

>编写一段程序，像下面那样读取一个整数并显示该整数减去6之后的结果。
>
>```
>输入一个整数:57↙
>该整数减去6的结果是51。
>```

* 练习 3

>编写一段程序，使其显示“天”“地”“人”。注意用puts函数而非printf函数来进行显示。
>
>```
>天
>地
>人
>```

* 练习 4

>编写一段程序，像下面这样显示读取到的两个整数的乘积。
>
>```
>请输入两个整数。
>整数1:27↙
>整数2:35↙
>它们的乘积是945。
>```

* 练习 5

>编写一段程序，像下面这样显示读取到的三个整数的和。
>
>```
>请输入三个整数。
>整数1:7↙
>整数2:15↙
>整数3:23↙
>它们的和是45。
>```

', 3, 2, NULL, '2020-05-21 18:21:32.560494', '2020-05-21 18:21:32.560494', 38);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (42, '运算和数据类型', NULL, 10, NULL, NULL, '', 3, 1, NULL, '2020-05-21 18:21:32.58484', '2020-05-21 18:21:32.58484', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (43, '运算', NULL, 10, NULL, NULL, '进行加法运算的+和进行乘法运算的*等符号，称为运算符。本节我们就来学习基本的运算符。

## 运算符和操作数

前一章我们进行了加法、减法和乘法运算，下面我们来尝试除法运算。

读取两个整数的值，然后显示出它们的和、差、积、商和余数。程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
读取两个整数的值，然后显示出它们的和、差、积、商和余数
*/
#include <stdio.h>

int main() {
    int x, y;

    printf("请输入两个整数：\n");
    printf("整数x："); scanf("%d", &x);
    printf("整数y："); scanf("%d", &y);

    printf("您输入的两个整数是：%d %d\n", x, y);
    printf("x + y = %d\n", x + y);
    printf("x - y = %d\n", x - y);
    printf("x * y = %d\n", x * y);
    printf("x / y = %d\n", x / y);
    printf("x %% y = %d\n", x % y);

    return 0;
}
```

>► x-y,只是算出从x中减去y的值，并不是真正的求差运算。也就是说，如果y比x大的话，x-y的值就是负数。

像+、*这样可以进行运算的符号称为**运算符(operator)**,作为运算对象的变量或常量称为**操作数(operand)**。

代码清单 demo1.c 中，在加法运算x+y中，+就是运算符，x和y就是操作数。

运算符左侧的操作数称为第一操作数或者左操作数，运算符右侧的操作数称为第二操作数或者右操作数。

>► C语言中有很多运算符，后面章节为大家提供了所有运算符的一览表。

## 乘除运算符和加减运算符

本程序中使用的五个运算符，可以大致区分为 表1 所示的乘除运算符(multiplicative operator)和表2所示的加减运算符(additive operator)。

请大家牢记这些运算符的名称。

**■表1 乘除运算符**

|双目*运算符|a\*b|a和b的积|
|---|---|---|
|/运算符|a/b|a除以b所得到的商(整数之间运算的时候需要舍弃小数点之后的值)|
|%运算符|a%b|a除以b所得到的余数(a和b都必须是整数)|

**■表2 加减运算符**

|双目+运算符|a+b|a和b的和|
|---|---|---|
|双目-运算符|a-b|a减去b的值|

## 除法运算的商和余数

除法运算符有两种。通过除法求商的运算符是/。

```
整数/整数    商的整数部分
```

如上所示，除法运算只取商的整数部分，也就是说会舍弃小数点以后的部分。例如，5/3的结果是1,3/5的结果是0。

```
整数/整数    余数
```

“%”是求余运算符。例如，5%3的结果是2，3 % 5的结果是3。

## 使用printf函数输出%

让我们来看一下程序中输出余数的地方。格式化字符串中写的是%%。这里的格式化字符串中的%符号具有转换说明的功能。因此，当不需要进行转换说明，而只想输出%的时候，就必须写成%%。

>► 当使用不具有转换说明功能的puts函数来进行输出的时候，就不能写成%%(这样会输出%%的)。

## 获取整数的最后一位数字

通过灵活地运用求余运算符，我们可以解决下面的问题。

显示读取出的整数的最后一位数字。程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/*
显示读取出的整数的最后一位数字
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    printf("最后一位是：%d。\n", no % 10);

    return 0;
}
```

**■两个操作数都是正时**

不管是哪种编译器，商和余数都是正数。举例如下。

||x / y|x % y|
|---|---|---|
|正/正 例 x=22 , y=5|4|2|

**■两个操作数中至少有一个为负时**

至于/运算符的结果是“小于代数商的最大整数”还是“大于代数商的最小整数，要取决于编译器。举例如下。

||x / y|x % y|
|---|---|---|
|负/负 例 x = -22, y = -5|4|-2|
||5|3|
|负/正 例 x = -22, y = 5|-4|-2|
||-5|3|
|正/负 例 x = -22 , y = -5|-4|2|
||-5|-3|

※ 和x、y的符号无关(只要y不是0)，(x / y) * y + x % y 的值和 x —致。

## 多个转换说明

读取两个整数，并显示它们的商和余数。程序如代码清单 demo3.c 所示。

**代码清单 demo3.c**

```c
/*
读取两个整数，显示它们的商和余数
*/
#include <stdio.h>

int main() {
    int a, b;

    puts("请输入两个整数。");
    printf("整数a："); scanf("%d", &a);
    printf("整数b："); scanf("%d", &b);

    printf("a除以b得%d余%d。\n", a / b, a % b);

    return 0;
}
```

程序中 printf 包含两个转换说明%d， 这些转换说明分别对应从左边数第二个和第三个参数。

>► 需要同时显示两个以上格式化数值吋，可以像这样在格式化字符串中使用多个转换说明。

另外，使用scanf函数为变量输入数值时，也可以指定两个以上的转换说明。如下所示为为int类型的变量a和b输入整数值。

```c
scanf("%d%d",&a,&b); /* 按顺序为a和b输入十进制数 */
```

## 单目运算符

我们来考虑一下下面这个问题。

对读取的整数值进行符号取反操作，并输出结果。也就是说，输入75就显示-75,输入-64就显示64。程序如代码清单 demo4.c 所示。

**代码清单 demo4.c**

```c
/*
对读取的整数值进行符号取反操作，并输出结果
*/
#include <stdio.h>

int main() {
    int num;

    printf("请输入一个整数：");
    scanf("%d", &num);

    printf("符号取反之后的值是%d。\n", -num);

    return 0;
}
```

到目前为止我们用到的运算符都需要两个操作数，这样的运算符称为双目运算符(binary operator)。在C语言中，还有只需要一个操作数的**单目运算符**(unary operator),以及需要三个操作数的**三目运算符**(ternary operator)。

在这里第一次出现的运算符就是单目运算符中的**单目-运算符**(unary-operator)。可能大家都很清楚，它的功能就是对运算符进行符号取反操作。另外还有一个跟它成对的运算符——单目+运算符(unary+operator),具体请参考表3。

**■ 表3 单目+运算符和单目-运算符**

|单目+运算符|+a|a的值|
|----|----|----|
|单目-运算符|-a|对a进行符号取反后的值|

对+和-来说，存在双目和单目两个版本。单目+运算符实际上并没有进行什么运算，只是为了对应单目-运算符而准备的。

另外，单目+运算符、单目-运算符、!运算符(4-1节)和〜运算符(7-2节)这四个运算符统称为单目算术运算符(unary arithmetic operator)。

## 赋值运算符

在我们前面所列举的示例程序中，有些用到了**基本赋值运算符(simple assignment operator)**=，如 表4 所示。

**■ 表 4 基本赋值运算符**

|---|---|---|
|---|---|---|
|基本赋值运算符| a=b |把b的值赋给a|


基本赋值运算符一般简称为赋值运算符，更通俗。

## 表达式和赋值表达式

表达式(expression)由变量和常量，以及连接它们的运算符组成。例如，在

```c
vx + 32 // 进行加法运算的表达式
```

中，vx、32和vx + 32都是表达式。

```c
vc = vx + 32 // 赋值表达式
```

中，vc、vx、32、vx + 32和vc = vx + 32都可以看作表达式。当然，vc是赋值运算符=的第一操作数，vx + 32 是第二操作数。

一般情况下，使用〇〇运算符的表达式，称为〇〇表达式。因此，使用赋值运算符的表达式，就称为赋值表达式(assignment expression)。

## 表达式语句

我们在前面介绍过，C语言规定语句必须要以分号结尾，因此前面提到的赋值表达式写成如下形式，才能成为正确的语句。

```c
vc = vx + 32; /* 表达式语句 */
```

这种由表达式和分号组成的语句称为**表达式语句(expression statement)**。
', 1, 2, NULL, '2020-05-21 18:21:32.590108', '2020-05-21 18:21:32.590108', 42);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (44, '数据类型', NULL, 10, NULL, NULL, '到目前为止，我们所使用的int类型是仅处理整数的数据类型。而除了int类型之外，还有很多种数据类型。本节我们就来学习处理实数的double类型等。

## 求平均值

让我们来考虑一下这个问题:读取两个整数，求出它们的平均值。程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
读取两个整数，显示它们的平均值
*/
#include <stdio.h>

int main() {
    int a, b;

    puts("请输入两个整数。");
    printf("整数a："); scanf("%d", &a);
    printf("整数b："); scanf("%d", &b);

    printf("它们的平均值是%d。\n", (a + b) / 2);

    return 0;
}
```

将表达式 a + b 括起来的()，是优先运算的标记。如果该表达式是：

```c
a + b / 2
```

就变成了求 a 和 b / 2 的和。这实际上与我们平时所做的数学计算相同，即要遵循先乘除后加减的顺序。

## 数据类型

通过运行实例我们可以发现输出的平均值并不是 42.5 而是 42，也就是说，小数点以后的部分被舍弃了。只处理数值的整数部分—这就是int类型(type)的特征。

C语言中以 **浮点数(floating-pointnumber)** 的形式来表示实数，浮点数有几种不同的类型，这里我们来学习一下double(双精度浮点数)类型。让我们通过代码清单 demo2.c 来看看 int 型整数和 double 型浮点数之间的区别。

**代码清单 demo2.c**

```c
/*
    整数和浮点数
*/
#include <stdio.h>

int main() {
    int    n;  /* 整数 */
    double x;  /* 浮点数 */

    n = 9.99; /* Warning */
    x = 9.99;

    printf("int   型变量n的值：%d\n", n);
    printf("           n / 2：%d\n", n / 2);

    printf("double型变量x的值：%f\n", x);
    printf("           x/2.0：%f\n", x / 2.0);

    return 0;
}
```

我们声明一个int型变量n和一个double型变量x，并把9.99作为值赋给它们。把实数值赋给int型变量时，小数点以后的部分会被舍弃，因此存储在n中的值就变成了9。

当然，对于n /。2,也就是 9 / 2 来说，由于是整数/整数运算，所以结果的小数点后的部分也被舍弃了。

另外需要注意的是，在使用 printf 函数输出 double 型值的时候，转换说明不能使用 %d，而要使用%f。

>► 转换说明中的f就是浮点数floating-point的首字母。%f默认显示小数点后6位数字，变更显示位数的方法将会在后面介绍。

## 数据类型和对象

接下来我们进一步学习数据类型和变量。

从前面的程序可以看出，int类型只能用来存储整数，即使把实数值赋给它，也只能保留整数部分。与之相对，浮点数中的 double 类型可以用来存储包含小数的实数值。

C语言中有很多种数据类型，后面会介绍。不过，每种类型可存储的值都是有范围的。例如，int类型的取值范围是-32767到32767。

这些数据类型都有一些固有的属性，继承了这些属性而创建出来的实体变量称为对象(object)。由于“变量”这个词应用广泛，听起来比“对象”更习惯一些，本教程统一使用“变量”这个称呼。

## 整型常量和浮点型常量
直接在程序中指定数值的常量也有类型的区别。像 5 和 45 这样的常量，它们都是整数类型的，所以称为整型常量(integer constant)。像3.14这样包含小数的常量，称为浮点型常量(floating constant)。

通常整型常量都是int类型，而浮点型常量都是double类型。

>► 当数值过大，或者有特殊需求的吋候，也可以使用其他类型。

## double类型的运算

编写一段程序，读取两个实数值，显示出它们的和、差、积、商。具体如代码清单 demo3.c 所示。

**代码清单 demo3.c**

```c
/*
    读取两个实数值，用实数显示出它们的和、差、积、商
*/
#include <stdio.h>

int main() {
    double x, y; /* 浮点数 */

    puts("请输入两个数。");
    printf("实数x："); scanf("%lf", &x);//小写英文字母l
    printf("实数y："); scanf("%lf", &y);

    printf("x + y = %f\n", x + y);
    printf("x - y = %f\n", x - y);
    printf("x * y = %f\n", x * y);
    printf("x / y = %f\n", x / y);

    return 0;
}
```

如表 5 所示，double类型的变量通过 scanf 函数赋值的时候需要使用格式字符串%lf，请注意这一点。

**■ 表 5 转换说明**

||int类型|double类型|
|---|---|---|
|使用printf函数显示|printf("%d”,no)|printf("%f”,no)|
|使用scanf函数读取|scanf("%d",&no)|scanf("%lf",&no)|


## 数据类型和运算

进行整数/整数运算的时候，商的小数部分会被舍弃，但是浮点数之间的运算就不会舍弃处理。

>► 运算符%本身的特性决定了它只能用于整数之间的运算.而不能用于浮点数之间的运箅。

像 “int/int” 和 “double/double”这样两个类型相同的操作数之间的运算，所得结果的数据类型和运算对象的数据类型是一致的。

另外，像 “double/int”和“int/double”这样一个操作数是int类型，另一个操作数是double类型的情况，int类型的操作数会进行隐式类型转换，自动向上转型为double类型，运算演变为double类型之间的运算。因此，运算的结果也就变成了double类型。

当然，这样的规则对于+或者*等其他运算也适用。

由于c语言包含了很多种数据类型，详细的规则非常复杂，因此我们可以大致理解如下。

>■注意■ 运算对象，即操作数的类型不同时，较小的数据类型的操作数会转换为较大的数据类型(范围更大)，然后再进行运算。

>► 所谓的“较大的数据类型”，并不是说 double 类型实际上比 int 类型更大，而是说它还可以保存小数点之后的部分。

让我们通过代码清单 demo4.c 所示的程序来验证一下这一规则。

**代码清单 demo4.c**

```c
/*
验证数据类型和运算
*/
#include <stdio.h>

int main() {
    int    n1, n2, n3, n4; /*整数*/
    double d1, d2, d3, d4; /*浮点数*/

    n1 = 5   / 2;
    n2 = 5.0 / 2.0;
    n3 = 5.0 / 2;
    n4 = 5   / 2.0;

    d1 = 5   / 2;
    d2 = 5.0 / 2.0;
    d3 = 5.0 / 2;
    d4 = 5   / 2.0;

    printf("n1 = %d\n", n1);
    printf("n2 = %d\n", n2);
    printf("n3 = %d\n", n3);
    printf("n4 = %d\n\n", n4);

    printf("d1 = %f\n", d1);
    printf("d2 = %f\n", d2);
    printf("d3 = %f\n", d3);
    printf("d4 = %f\n", d4);

    return 0;
}
```

* int型变量的赋值

把 2 赋给 int 型变量 n1，把 2.5 分别赋给n2、n3和n4。由于在赋值的时候会舍弃掉小数点之后的部分，因此最后这四个变量的值都是2。

* double型变量的赋值

把 2 赋值给double型变量 d1 (但是因为 d1 是double型，所以 2 会被解释为 2.0)。把2.5分别赋给d2、d3和d4的时候，它们都能把这些值完整地保存起来。

## 类型转换

代码清单 demo1.c 是计算两个整数的平均值的程序，只是输出了平均值的整数部分。这次我们尝试将小数部分也一起输出。程序如代码清单 demo5.c 所示。

**代码清单 demo5.c**

```c
/*
读取两个整数并用浮点数显示出它们的平均值
*/
#include <stdio.h>

int main() {
    int a, b;

    puts("请输入两个整数。");
    printf("整数a："); scanf("%d", &a);
    printf("整数b："); scanf("%d", &b);

    printf("它们的平均值是%f。\n", (a + b) / 2.0);

    return 0;
}
```

让我们来看一下求平均值的表达式。

首先计算的是括号内的a+b部分。由于该运算是“int+int”的运算，所以结果也是int型整数。因此，整体的运算如下所示。

```
int/double    整数除以实数
```

运算结果是double型。程序执行后将求出 41 和 44 的平均值 42.5。

但是，日常生活中计算平均值的时候，我们都会说“除以2”，而不会说“除以 2.0”。将两个整数的和转换为实数，然后再除以2计算平均值的程序如代码清单 demo6.c 所示。/ 运算符左边的操作数——表达式 (double)(a+b) 的形式如下。

>(数据类型)表达式    类型转换表达式

通常这种形式的表达式会把表达式的值转换为该数据类型对应的值。

例如，(int)5.7 会把浮点数 5.7 的小数部分舍去，从而转换为int类型的5；(double)5 会将整数 5 转换为 double 类型的5.0。

**代码清单 demo6.c**

```c
/*
读取两个整数并用实数显示出它们的平均值（类型转换）
*/
#include <stdio.h>

int main() {
    int a, b;

    puts("请输入两个整数。");
    printf("整数a："); scanf("%d", &a);
    printf("整数b："); scanf("%d", &b);

    printf("它们的平均值是%f。\n", (double)(a + b) / 2);

    return 0;
}
```

这样的显式转换就称为类型转换(cast)，()称为类型转换运算符(cast operator)，如表6所示。

>► 英语的cast有很多种意思。比如，作为动词来说，有“扮演某角色”“投掷”“使转向”“计算”“使弯曲”等意思。

**■ 表 6 类型转换运算符**

|----|----|----|
|----|----|----|
|类型转换运算符|(类型名)a|把a的值转换为指定数据类型对应的值|


在求平均值的时候，首先根据
> (double)(a + b)    类型转换表达式:将a + b的结果转换为double类型

把a + b的值转换为double类型的值(例如整数 85 会转换为浮点数85.0)。

由于表达式(a + b)的运算结果会被转换为double类型，因此求平均值的运算就变成了下面这样。

>double/int    实数除以整数

这时，int 类型的右操作数会向上转型为 double 类型。变成“double/double”的除法运算，所得的运算结果是 double 类型的实数。

## 转换说明

读取三个整数，并显示它们的和以及平均值的程序如代码清单 demo7.c 所示。和前面的程序一样，在求平均值的时候进行了类型转换。

**代码清单 demo7.c**

```c
/*
读取三个整数，并显示出它们的合计值和平均值
*/
#include <stdio.h>

int main() {
    int a, b, c;
    int sum;       /*合计值*/
    double ave;    /*平均值*/

    puts("请输入三个整数。");
    printf("整数a："); scanf("%d", &a);
    printf("整数b："); scanf("%d", &b);
    printf("整数c："); scanf("%d", &c);

    sum = a + b + c;
    ave = (double)sum / 3;    /*类型转换*/

    printf("它们的合计值是%5d。\n", sum);    /*输出99999*/
    printf("它们的平均值是%5.1f。\n", ave);  /*输出999.9*/

    return 0;
}
```

在这个程序中，传递给 printf 函数的格式化字符串中的两个转换说明 %5d 和 %5.1f 的含义分别如下所示。

```
%5d  ...显示至少5位的十进制整数。
%5.1f...显示至少5位的浮点数。但是，小数点后只显示1位。
```

转换说明的形式通常如图 A 所示。也就是说，包括%和.在内，总共由六部分构成。

请对比代码清单 demo8.c 的运行结果来理解。



<img src="https://img-camp.banyuan.club/online/c/ch3/printf-format.svg" width="350px" /> 

**图A 转换说明**



**【A】0标志**

设定了0标志之后，如果数值的前面有空余位，则用0补齐位数(如果省略了0标志，则会用空白补齐位数)。

**【B】最小字段宽度**

也就是至少要显示出的字符位数。不设定该位数或者显示数值的实际位数超过它的时候，会根据数值显示出必要的位数。

另外，如果设定了"-",数据会左对齐显示，未设定则会右对齐显示。

**代码清单 demo8.c**

```c
/*
格式化整数和浮点数并显示
*/
#include <stdio.h>

int main() {
    printf("[%d]\n", 123);
    printf("[%.4d]\n", 123);
    printf("[%4d]\n", 123);
    printf("[%04d]\n", 123);
    printf("[%-4d]\n\n", 123);

    printf("[%d]\n", 12345);
    printf("[%.3d]\n", 12345);
    printf("[%3d]\n", 12345);
    printf("[%03d]\n", 12345);
    printf("[%-3d]\n\n", 12345);

    printf("[%f]\n", 123.13);
    printf("[%.1f]\n", 123.13);
    printf("[%6.1f]\n\n", 123.13);

    printf("[%f]\n", 123.13);
    printf("[%.1f]\n", 123.13);
    printf("[%4.1f]\n\n", 123.13);

    return 0;
}
```

【C】精度

指定显示的最小位数，如果不指定，则整数的时候默认为1，浮点数的时候默认为6。

【D】转换说明符

    d...显示十进制的int型整数。
    f...显示十进制的double型浮点数。

## 作业

**● 练习 1**

>编写一段程序，读取两个整数，然后显示出前者是后者的百分之几。

**● 练习 2**

>编写一段程序，读取两个整数，然后输出它们的和以及积。

**● 练习 3**

>编写一段程序，像下面那样显示出读取的实数的值
>
>```
>请输入一个实数:57.3
>你输入的是57.300000
>```

**● 练习 4**

>编写程序对整型常量、浮点型常量、int型变量和double型变量进行乘除等各种运算，从而验证本节介绍的规则。


**● 练习 5**

>编写一段程序，读取两个整数的值，计算出前者是后者的百分之几，并用实数输出结果。

**●  练习 6**

>编写一段程序，读取表示身高的整数，显示出标准体重的实数值。标准体重根据公式(身高-100)X0.9进行计算，所得结果保留一位小数。
>
>```
>请输入您的身高：175
>您的标准体重是67.5
>```', 2, 2, NULL, '2020-05-21 18:21:32.617285', '2020-05-21 18:21:32.617285', 42);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (45, '分支和循环', NULL, 10, NULL, NULL, '', 4, 1, NULL, '2020-05-21 18:21:32.64448', '2020-05-21 18:21:32.64448', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (46, 'if 语句', NULL, 10, NULL, NULL, '几乎没有只会按照预先设计好的流程执行的程序。本章就来学习通过条件来改变程序流程的方法。

## if语句

如果输入的整数不能被5整除，就显示出相应的信息。程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
输入的整数能被5整除吗
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    if (no % 5) {
        puts("输入的整数不能被5整除。");
    }
    return 0;
}
```

这里的if和英语中的一样，是“如果”的意思。这部分的格式如下所示。

> if(表达式)语句

这样的语句称为**if语句(if statement)**。

if语句会判断表达式的值，如果结果不为0,则执行相应的语句。括号内对条件进行判断的表达式称为控制表达式(control expression)。本程序中对控制表达式no%5的判断结果为no除以5的余数。只有当这个余数不为0,也就是no的值不能被5整除时，才会执行下列语句。

```
puts("输入的整数不能被5整除。");
```

而当输入的整数能被5整除的时候，后续语句则不会执行，屏幕上不会显示任何内容。

## else语句

执行代码清单 demo1.c 中的程序时，当输入的值能被5整除时不输出任何信息。这样很可能会让使用者不放心，所以这次我们来修改一下程序，让它在输入能被5整除的整数时也显示出相应的信息。程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/*
输入的整数能被5整除吗
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    if (no % 5) {
        puts("该整数不能被5整除。");
    }else {
        puts("该整数能被5整除。");
    }
    return 0;
}
```

本程序中使用的是下面这种形式的if语句。

> if (表达式) 语句1 else 语句2


当然，else是“否则”的意思。

当表达式的值不为0的时候执行语句1，，当表达式的值为0的时候执行语句2。对于上面的例子，当输入的值能被5整除的时候，也要输出相应的信息，这样我们就能清晰地通过运行结果来判断了.

## else if 语句

到目前为止，我们已经见过了包含两个分支的程序流程，现在来看看三个分支的情况。请大家考虑一下下面的问题。

输入一个整数，判断该整数的符号。

程序如代码清单 demo3.c 所示。

**代码清单 demo3.c**

```c
/*
判断输入的整数的符号
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    if (no == 0)
        puts("该整数为0");
    else if (no > 0)
        puts("该整数为正数");
    else
        puts("该整数为负数");

    return 0;
}
```

else if 很好理解。另外代码中涉及了几个新的知识：

* if 、 else if 、 else等后面的语句么有被 {} 包围。当分支条件里仅有一条语句时，{}可以省略。
* 使用 == 符号，判断两侧的值是否相等，==是运算符的一种，即**相等运算符(equality operator)**。
* 使用 > 符号，判断 > 左侧的值是否大于右侧的值，> 是运算符的一种，即**关系运算符(relational operator)**。

### 相等运算符
与==运算符相反，用来判断两个操作数是否不相等的是 **!=运算符** 。这两种运算符统称为 **相等运算符(equality operator)** (表A)。

**■ 表A 相等运算符**

|==运算符|a==b|如果a和b的值相等则为1,不等则为0(结果的类型是int)|
|---|---|---|
|!=运算符|a!=b|如果a和b的值不相等则为1,相等则为0(结果的类型是int)|

### 关系运算符

**■ 表B 关系运算符**

|<运算符|a<b|a小于b时结果为1，反之为0（结果的类型为int）|
|----|----|----|
|>运算符|a>b|a大于b时结果为1，反之为0（结果的类型为int）|
|<=运算符|a<=b|a小于等于b时结果为1，反之为0（结果的类型为int）|
|>=运算符|a>=b|a大于等于b时结果为1，反之为0（结果的类型为int）|

请大家注意，将<=运算符和>=运算符中的等号放在左侧(=<和=>)，或者在<与=之间有空格都是不对的。

## 嵌套的if语句

如前所述，if语句有以下三种形式。

```
if(表达式)语句
if(表达式)语句 else语句
if(表达式)语句 else if语句 else语句
```

代码清单 demo4.c 所示为使用嵌套的if语句的另一个程序示例。

**代码清单 demo4.c**

```c
/*
如果输入的整数值为正，则判断该值的奇偶性并显示
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);
    if (no > 0) {
        if (no % 2 == 0)
            puts("该整数为偶数。");
        else
            puts("该整数为奇数。");
    } else {
        puts("您输入的不是正数。\a\n");
    }
    return 0;
}
```

如果输入的整数值为正，则显示该值为奇数或偶数；否则，就和响铃一起显示相应的信息。

## 更多运算符

### 条件运算符

代码清单 demo5.c 所示为用别的方法来实现计算输入的两个整数中较大的数。

**代码清单 demo5.c**

```c
/*
显示所输入的两个整数中较大的值（条件运算符）
*/
#include <stdio.h>

int main() {
    int n1, n2, max;

    puts("请输入两个整数：");
    printf("整数1："); scanf("%d", &n1);
    printf("整数2："); scanf("%d", &n2);

    max = (n1 > n2) ? n1 : n2;

    printf("较大的数是%d。\n", max);

    return 0;
}
```

上述程序中使用了表C中的**条件运算符(conditional operator)**。该运算符是需要三个操作数的三目运算符。

>► 只有条件运算符属于三目运算符，其他的运算符都是单目或者双目运算符。

**■ 表C 条件运算符**

|---|---|---|
|---|---|---|
|条件运算符|a ? b : c|如果a不为0,则结果是b的值，否则结果为c的值|

### 逻辑运算符

这次让我们来思考下面的问题：显示出所输入的月份所处的季节。即根据输入的整数月份，显示成下面这样（其中X是代表月份的数值）。

```
 3, 4, 5      X月是春季
 6, 7, 8      X月是夏季
 9,10,11      X月是秋季
12, 1, 2      X月是冬季
其他           X月不存在!!!
```

程序如代码清单 demo6.c 所示：

**代码清单 demo6.c**

```c
/*
显示所输入的月份所处的季节
*/
#include <stdio.h>

int main() {
    int month;

    printf("请输入月份：");
    scanf("%d", &month);

    if (month >= 3 && month <= 5)
        printf("%d月是春季。\n", month);
    else if (month >= 6 && month <= 8)
        printf("%d月是夏季。\n", month);
    else if (month >= 9 && month <= 11)
        printf("%d月是秋季。\n", month);
    else if (month == 1 || month == 2 || month == 12)
        printf("%d月是冬季。\n", month);
    else
        printf("%d月不存在。！！\n", month);

    return 0;
}
```

代码里面使用的 **&&** 称为 **逻辑与运算符(logical AND operator)**。代码中对冬天的判断。这里用到的 **||** 称为**逻辑或运算符(logical OR operator)**。

**■ 表D 逻辑运算符**

|逻辑与运算符|a&&b|如果a和b都不为0,则表达式的结果为1,否则结果为0(结果的类型为int)|
|---|---|---|
|逻辑或运算符|a \|\| b|如果a和b中有一个不为0,则表达式的结果为1,否则结果为0(结果的类型为int)|


>► &&运算符在a的判断结果为0吋不会对b进行判断。而||运算符则相反，当a的判断结果不为0时不会对b进行判断。以上这种情况称为短路求值。


**短路求值**

* 对于 && ，代码中if语句首先进行的是判断季节是否为“春季”。这里假设变量month的值为2,我们来判断下述表达式。

```
month >= 3 && month <= 5
```
如果 month = 0 不满足  month >= 3 的条件，后面的条件就也不必计算了。

也就是说，**&&运算符在左操作数的判断结果为0时不对右操作数进行判断。**

* 对于||运算符，会怎样呢？结合下面这个判断季节是否是“冬季”的表达式来看。

```
month == 1 || month == 2 || month = 12
```

如果month为1，则根本不用判断month为2月或12月的情况，整个表达式的判断结果就为1(是冬季)。

也就是说，**||运算符在左操作数的判断结果不为0时不会对右操作数进行判断。**

>像这样，在仅根据左操作数的判断结果就可知逻辑表达式的判断结果的情况下，不会对右操作数进行判断，这就称为**短路求值(short circuit evaluation)**。

## 作业

**● 练习 1**

>编写一段程序，输入两个整数值，如果后者是前者的约数，则显示“B是A的约数”，如果不是，则显示“B不是A的约数”。
>
>```
>请输入两个整数。
>整数A:17
>整数A:5
>B不是A的约数。
>```

**● 练习 2**

>编写一段程序，输入一个整数值，显示出它的绝对值。

**● 练习 3**

>编写一段程序，输入两个整数，如果两数值相等，则显示“A和B相等。”。如果A大于B,则显示“A大于B。”。如果A小于B,则显示“A小于B。”。
>
>```
>整数A：54
>整数B：12
>A大于B
>```

**● 练习 4**

>编写一段程序，确认相等运算符和关系运算符的运算结果是1和0。

**● 练习 5**

>编写一段程序，计算出输入的三个整数中的最小值并显示。
>

**● 练习 6**

>编写一段程序，计算出输入的四个整数中的最大值并显示。
>

**● 练习 7**

>编写一段程序，输入三个整数，如果三个数都相等，则显示“三个值都相等”。如果其中任意两个值相等，则显示“有两个值相等”。如果上述两种情况都不满足，则显示“三个值各不相同”。

**● 练习 8**

>编写一段程序输入两个整数，如果它们的差值小于等于10,则显示“它们的差小于等于10”。否则，显示“它们的差大于等于11”。
>
>请使用逻辑或运算符。', 1, 2, NULL, '2020-05-21 18:21:32.671926', '2020-05-21 18:21:32.671926', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (47, 'switch语句', NULL, 10, NULL, NULL, '你可以仅仅使用 if / else 判断程序分支，但是学习下switch没有坏处，在多分支的情况下代码常常比 if /else 语法更简洁。

if语句和switch语句，都是用来实现程序流程的选择性分支的，因此统称为**选择语句(selection statement)**。

## switch语句和break语句

显示输入的整数除以3所得余数的程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
显示所输入的整数除以3的余数
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    if (no % 3 == 0)
        puts("该数能被3整除。");
    else if (no % 3 == 1)
        puts("该数除以3的余数是1。");
    else
        puts("该数除以3的余数是2。");

    return 0;
}
```

本程序中使用了两次计算no除以3的余数的表达式no%3,多次输入同一个表达式，容易造成输入错误。不仅如此，同一个除法执行两次也会使程序略显冗长。

使用switch语句修改后的程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/*
显示所输入的整数除以3的余数（switch语句）
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个整数：");
    scanf("%d", &no);

    switch (no % 3) {
    case 0: puts("该数能被3整除。"); break;
    case 1: puts("该数除以3的余数是1。"); break;
    case 2: puts("该数除以3的余数是2。"); break;
    }

    return 0;
}
```

像“case 1:”这样用来表示程序跳转的标识称为**标签(label)**。

标签的值必须为常量，不可为变量。另外，不允许多个标签同为一个值。程序跳到该标签后，会按顺序执行其后的语句，因此画面中会显示“该数除以3的余数是1。”。

当程序执行到 **break语句(break statement)** 时，switch语句执行结束。

break有“打破”“脱离”之意。执行break语句之后，程序就会跳出将它围起来的switch语句。

## 复杂的switch语句

代码清单 demo3.c 中的switch语句比较复杂。下面我们就以该程序为例，来加深对switch语句中的标签和break语句的动作的理解。

**代码清单 demo3.c**

```c
#include <stdio.h>

int main() {
    int sw;

    printf("整数:");
    scanf("%d", &sw);

    switch (sw) {
    case 1: puts("A"); puts("B"); break;
    case 2: puts("C");
    case 5: puts("D"); break;
    case 6:
    case 7: puts("E"); break;
    default: puts("F"); break;
    }
    
    return 0;
}
```
* 有些 case 语句没有写 break，如果此时检查到条件满足该 case，程序执行完该 case 的语句，会继续执行下一个case的语句，直到遇到 break。
* 当控制表达式的判断结果与任何一个case都不一致的时候，程序就会跳转到 default: 继续执行。


>► 如果改变本程序switch语句中标签的顺序，程序的执行结果也会发生改变.所以在使用switch语句的时候，一定要正确书写标签的顺序。

## 作业

**● 练习 1**

>用 switch 语句实现输入月分值，判断是什么季节并输出到屏幕上。
', 2, 2, NULL, '2020-05-21 18:21:32.699516', '2020-05-21 18:21:32.699516', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (48, 'do 语句', NULL, 10, NULL, NULL, '

## do语句
请输入一个整数，显示出它是奇数还是偶数。然后询问是否重复同样的操作，并按要求进行处理。

**代码清单 demo1.c**

```c
/*
输入的整数是奇数还是偶数呢（按照自己的意愿进行循环操作）
*/
#include <stdio.h>

int main() {
    int retry;

    do {
        int no;

        printf("请输入一个整数：");
        scanf("%d", &no);

        if (no % 2)
            puts("这个整数是奇数。");
        else
            puts("这个整数是偶数。");

        printf("需要重复一次吗？【YES……0/NO……9】:");
        scanf("%d", &retry);
    } while (retry == 0);

    return 0;
}
```

本程序的情况下，如果读取到的变量retry的值为0,那么控制表达式 `retry == 0` 的判断结果就为1。因为1不等于0，所以身为复合语句的循环体会再次执行。

>► 也就是说，判断结果不为0的话，程序会返回到复合语句的幵头，然后重新执行复合语句。

如果读取到的变量retry的值不为0，那么控制表达式retry==0的判断结果就为0，do语句就结束了。

**总结：** do是“执行”的意思，while是“在......期间”的意思。根据do语句的处理流程，只要 `()` 中的表达式 `(控制表达式)` 的判断结果不是0，语句就会循环执行。

另外，do语句循环的对象语句称为**循环体(loop body)**。

>► 今后将要学习的while语句和for语句所循环的语句也称为循环体。


### 逻辑非运算符•德摩根定律

再看一个剪刀、石头、布的例子。

**代码清单 demo2.c**

```c
/* 根据读取的整数值显示所出的拳（只接收0、1、2）*/
#include <stdio.h>

int main() {
    int hand;  /*出拳*/
    do {
        printf("请选择出什么拳【0……石头/1……剪刀/2……布】：");
        scanf("%d", &hand);
    } while (hand < 0 || hand > 2);
    //!(hand >=0 && hand <= 2)

    printf("你选择了");
    switch (hand) {
    case 0: printf("石头\n"); break;
    case 1: printf("剪刀\n"); break;
    case 2: printf("布\n"); break;
    }

    return 0;
}
```

我们来看一下判断do语句的循环是否继续的控制表达式。

```c
hand < 0 || hand > 2 /* hand 小于0或者大于2 */
```
和
```c
!(hand >=0 && hand <= 2)
```
两者是等价的。! 被称为**逻辑非运算符(logical negation operator)**，是用来判断操作数是否等于0的单目运算符，满足**德摩根定律**：

>对各条件取非，然后将逻辑与变为逻辑或、逻辑或变为逻辑与，然后再取其否定，结果和原条件一样。这称为**德摩根定律(De Morgan’s theorem)**。该定律一般表示为下面这样。
>  
>x && y 和 !(!x || !y)相等。   
>x || y 和 !(!x && !y)相等。   

**■ 表A 逻辑非运算符**

|---|---|---|
|---|---|---|
|逻辑非运算符|!a|当a的值是0的时候值为1,当a的值不是0的时候值为0(它的结果是int类型)|

##  运算符：复合赋值运算符

请考虑下面这个问题，不停地输入整数，显示其和及平均值。该程序如代码清单 demo3.c：

**代码清单 demo3.c**
```c
/* 不停的输入整数，显示其和及平均值 */
#include <stdio.h>

int main() {
    int sum = 0; /*和*/
    int cnt = 0; /*整数个数*/
    int retry;   /*是否继续处理*/

    do {
        int t;
        printf("请输入一个整数：");
        scanf("%d", &t);
        sum = sum + t;
        cnt = cnt + 1;

        printf("是否继续？【YES……0/NO……9】:");
        scanf("%d", &retry);
    } while (retry == 0);

    printf("和为：%d，平均值为：%.2f。\n",  sum, (double)sum / cnt);

    return 0;
}
```

```c
sum = sum + t;
```
可以写成

```c
sum += t; 
```

此处使用的 `+=` 称为**复合赋值运算符(compound assignment operator)**。

包括 += 在内，复合赋值运算符一共有10个。如下表所示，对于\*、/、%、+、-、<<、>>、&、^、| 这些运算符来说，和a@=b和a=a@b的效果是一样的。运算符<<、>>、&、^、| 将会在后买章节进行讲解。

>注：这里的@指代前面提到的各种运算符

**■ 表B 复合赋值运算符**

|运算符|说明|
|---|---|
|+=|加赋值|
|-=|减赋值|
|\*=|乘赋值|
|/=|除赋值|
|%=|取模赋值|
|<<=|位左移赋值|
|>>=|位右移赋值|
|&=|位与赋值|
|^=|位非赋值|
|\|=|位或赋值|


## 运算符：后置递增/递减运算符

上节代码中
```c
cnt = cnt + 1;
```
可以写成

```c
cnt ++;
```
++ 是**后置递增运算符(postfixed increment operator)** 。使用该运算符的表达式 a++，能够使操作数的值仅增加1。这种只增加1的情况，我们称之为**递增**。

**■ 表C 后置递增运算符和后置递减运算符**

|后置递增运算符|a++|使a的值增加1(该表达式的值是增加前的值)|
|---|---|---|
|后置递减运算符|a--|使a的值减少1(该表达式的值是减小前的值)|

如上表所示，使操作数的值减1(递减)的 `--` 运算符是**后置递减运算符(postfixed decrement operator)**。

>■注意■ 使用复合赋值运算符和后置递增运算符、后置递减运算符，能够使程序更简洁、更易读。

后置递增运算符和后置递减运算符的名称中之所以有“后置”二字，是因为++、--等运算符位于操作数的后面。

>► 将++、--置于操作数之前的前置递增运算符++和前置递减运箅符，我们之后会进行介绍。

## 作业

**● 练习 1**

>编写一段程序，读取两个整数的值，然后计算出它们之间所有整数的和。', 3, 2, NULL, '2020-05-21 18:21:32.726934', '2020-05-21 18:21:32.726934', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (49, 'while 语句', NULL, 10, NULL, NULL, '和上一节介绍的do语句不同，在**循环体执行前**对循环的继续条件进行判断的是while语句。

## while语句

输入一个整数值，显示出从它开始递减到0的每一个整数的程序如代码清单demo1.c所示。

**代码清单 demo1.c**

```c
/*
从输入的整数开始倒数到0
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个正整数：");
    scanf("%d", &no);

    while (no >= 0) {
        printf("%d ", no);
        no--;
    }
    printf("\n");

    return 0;
}
```

顺便学下巧用递减运算符简化程序代码，将
```c
    printf("%d ", no);
    no--;
```
修改为：
```c
printf("%d ", no--);
```
运行效果是一样滴。调用printf"函数显示 `no--` 的值的时候会按照如下步骤执行。

【1】显示no的值。    
【2】然后对no的值进行递减操作。

也就是说，在显示no的值之后，立刻对其进行递减操作。

> ■注意■ do语句的循环体至少会执行一次，而while语句的循环体则有可能一次也不会执行。

## 字符常量和putchar函数

考虑下面例程：输入一个整数后，并排连续显示出该整数个*,具体的程序如代码清单 demo2.c 所示。

**代码清单  demo2.c**

```c
/*
输入一个整数，连续显示出该整数个数*
*/
#include <stdio.h>

int main() {
    int no;

    printf("请输入一个正数：");
    scanf("%d", &no);

    while (no-- > 0)
        putchar(''*'');
    putchar(''\n'');

    return 0;
}
```

在while语句执行的过程中，“putchar(''\*'');” 被执行；while语句结束之后，“putchar(''\n’);” 被执行。像 ''*‘ 和 ''\n‘ 这样，用单引号 “''” 括起来的字符称为**字符常置(character constant)**。字符常量是int类型。

字符常量 `''\*''` 和字符串常量 `"*"` 的区别如下所示。

* 字符常量 `''\*''` ......表示单一的字符*。
* 字符串常量 `"\*"`......表示单纯由字符 * 构成的一连串连续排列的字符。

为了显示单一的字符，本程序中使用了putchar函数。()中的实参，就是需要显示的字符。本程序中的参数是 `''*''` 和 `''\n''` 。后者会进行换行。

另一方面，以下代码(程序)都是错误的。

```c
putchar("A");  /*错误:传递给putchar的是字符。正确表述为putchar(''A'');*/
printf(''A'');  /*错误:传递给printf的是字符串。正确表述为printf("A");*/
```

## 运算符：前置递增/递减运算符

程序清单 demo2.c ，首先输入一个整数，然后再依次输入该整数个整数，显示出它们的合计值和平均值。

**代码清单 demo2.c**

```c
/*
输入规定个数整数并显示出它们的合计值和平均值
*/
#include <stdio.h>

int main() {
    int i = 0;
    int sum = 0;
    int num, tmp;

    printf("要输入多少个整数：");
    scanf("%d", &num);

    while (i < num) {
        printf("No.%d:", ++i);
        scanf("%d", &tmp);
        sum += tmp;
    }

    printf("合计值：%d\n", sum);
    printf("平均值：%.2f\n", (double)sum / num);

    return 0;
}
```

以上代码中使用了表 A 中介绍的**前置递增运算符(prefixed increment operator)**。当然也存在与之对应的**前置递减运算符(prefixed decrement operator)**。

**■ 表A 前置递增运算符和前置递减运算符**

|前置递增运算符|++a|使a的值增加1(该表达式的值是递增后的值)|
|---|---|---|
|前置递减运算符|--a|使a的值减少1(该表达式的值是递减后的值)|

前置递增运算符的作用和后置递增运算符一样，都能使操作数自动增长。

显示 ++i 时，经过了以下两个步骤。

【1】i的值递增1。    
【2】显示i的值。

也就是说，“在显示i的值之前递增”。因此，最初显示的i的值，是0递增后得到的1。

>■注意■ 对使用后置(前置)递增运算符/递减运算符的表达式进行判断后得到的是递增/递减前(后)的值。

## 作业

**● 练习 1**●

>编写一段程序，按照升序显示出小于输入值的所有正偶数。

**● 练习 2**

>编写一段程序，显示出小于输入的整数的所有2的乘方。



**● 练习 3**

>编写一段程序，使之交替显示+和-，总个数等于所输入的整数值。另外，当输入0以下的整数时，则什么也不显示。
>
>```
>+-+-+-+-+-+-+-+-+-+-+-+-
>```

**● 练习 4**

>编写一段程序，使之连续显示*,总个数等于所输入的整数值。另外，当输入0以下的整数时，则什么也不显示。
>
>```
>*
>*
>*
>*
>```

**● 练习 5**

>编写一段程序，读取一个正整数，显示其位数。  ', 4, 2, NULL, '2020-05-21 18:21:32.755192', '2020-05-21 18:21:32.755192', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (50, 'for 语句', NULL, 10, NULL, NULL, 'do语句、while语句、for语句，都是循环执行程序流程的语句。这样的语句统称为**循环语句(iteration statement)**。 比起使用while语句，使用for语句实现循环会使程序更加简洁、易读。本节就来学习for语句。

## for语句

仍然来编写一段跟之前的程序相反的程序，显示出从0开始递增到输入的整数的各个整数，详见代码清单 demo1.c。

**代码清单 demo1.c**

```c
/* 递增显示从0到输入的正整数为止的各个整数（for） */
#include <stdio.h>

int main() {
    int i, no;

    printf("请输入一个正整数：");
    scanf("%d", &no);

    for (i = 0; i <= no; i++) {
        printf("%d ", i);
    }
    putchar(''\n'');

    return 0;
}
```

程序变得更加简洁了。for语句后面的括号中由三部分构成，分别用分号隔开。

for 语句的流程用语言表述的话，就像下面这样。

【1】作为“预处理”，判断并执行【A】部分。    
【2】如果作为“继续条件”的【B】部分控制表达式不为0,则执行语句(循环体)。    
【3】执行语句后，判断并执行作为“收尾处理”或“下一个循环的准备处理”的【C】部分，返回到【2】。    

>所有的for语句都可置换为while语句，所有的while语句也都可置换为for语句。

关于for语句中的各表达式，有几点需要注意的地方。

**A 预处理**

表达式【A】仅在循环执行之前执行一次。当程序无需预处理的时候，该表达式可以省略。

**B 控制表达式**

表达式【B】是用来判定循环操作是否继续执行的表达式。如果该表达式成立(判断结果不为0),则执行循环体。

当省略表达式【B】的时候，通常认为控制表达式的值始终不为0。因此，除非使用 break 语句，否则该循环将成为永远执行的**无限循环**。

**C 收尾处理**

表达式【C】作为“收尾处理”或“下个循环的准备处理”，会在循环体执行后被判断、执行。

如果没有需要执行的内容，则该表达式可以省略。

>►下面是while语句的无限循环和for语句的无限循环的执行示例。
>
>```c
>/*while语句的无限循环*/
>while(1)
>    语句
> 
>/*for语句的无限循环*/
>for(;;)
>    语句
>```

## 训练：偶数的枚举

下面让我们编写一段程序，实现输入一个整数值，显示该整数值以下的正偶数，如2,4,...，程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/* 显示输入的整数值以下的偶数 */
#include <stdio.h>

int main() {
    int i , n;

    printf("整数值：");
    scanf("%d", &n);

    for (i = 2; i <= n; i += 2) {
        printf("%d ", i );
    }
    putchar(''\n'');

    return 0;
}
```

for 语句的 i+=2 部分中使用了复合赋值运算符 +=，其作用是将右操作数的值加左操作数的值。

因为是将变量i加2,所以每次循环时：i的值都会加2。

**思辨：表达式语句和空语句**

请看下面两行代码，感觉这段代码是要显示变量n个''*''。

```
for(i = 1;i <= n;i++);
    putchar(''*'');
```

但是，无论n是什么值，结果都只显示1个 `''\*''`

原因在于i++)后面的分号。只包含一个分号的语句，称为**空语句(null statement)**。执行空语句什么也不会发生。也就是说，上面的代码可以像下面这样理解。

```
for(i = 1;i <= n;i++)
    ;
putchar(''*'');
```

当然，不仅是for语句，while语句中也应该注意避免这样的错误。

## 多重循环

使用二重循环显示九九乘法表的程序如代码清单 demo3.c 所示

**代码清单 demo3.c**

```c
/* 显示九九乘法表 */
#include <stdio.h>

int main() {
    int i , j;

    for (i = 1; i <= 9; i ++) {
        for (j = 1; j <= 9; j++) {
            printf("%3d", i * j);
        }
        putchar(''\n'');
    }

    return 0;
}
```

程序运行结果如下：

```
  1  2  3  4  5  6  7  8  9
  2  4  6  8 10 12 14 16 18
  3  6  9 12 15 18 21 24 27
  4  8 12 16 20 24 28 32 36
  5 10 15 20 25 30 35 40 45
  6 12 18 24 30 36 42 48 54
  7 14 21 28 35 42 49 56 63
  8 16 24 32 40 48 56 64 72
  9 18 27 36 45 54 63 72 81
```

* **continue 语句用法**

如果遇到被乘数是偶数的时候，跳过计算 ，代码修改如下：
```c
/*
显示九九乘法表
*/
#include <stdio.h>

int main() {
    int i , j;

    for (i = 1; i <= 9; i ++) {
        for (j = 1; j <= 9; j++) {
            if (j % 2 == 0) continue;
            printf("%3d", i * j);
        }
        putchar(''\n'');
    }

    return 0;
}
```
程序运行结果是：
```
  1  3  5  7  9
  2  6 10 14 18
  3  9 15 21 27
  4 12 20 28 36
  5 15 25 35 45
  6 18 30 42 54
  7 21 35 49 63
  8 24 40 56 72
  9 27 45 63 81
```

* **break 语句用法**

让我们牵强一点，如果遇到：被乘数乘以乘数等于 24 的时候，停止计算，退出程序 ，代码修改如下：

```c
/* 显示九九乘法表 */
#include <stdio.h>

int main() {
    int i , j;
    int exit = 0;
    for (i = 1; i <= 9; i ++) {
        if (exit) break;
        for (j = 1; j <= 9; j++) {
            printf("%3d", i * j);
            if ((i * j) == 24) {
                exit = 1;
                break;
            }
        }
        putchar(''\n'');
    }

    return 0;
}
```

程序运行结果是：

```
  1  2  3  4  5  6  7  8  9
  2  4  6  8 10 12 14 16 18
  3  6  9 12 15 18 21 24
```

这里就是设置一个退出变量 exit，当内层循环满足条件时候，break 的同时设置 exit 为非0，就可以退出循环了。

## 作业

**● 练习 1**

>编写一段程序，根据输入的整数，循环显示1234567890，显示的位数和输入的整数值相同。
>
>```
>123456789012345678901234
>```

**● 练习 2**

>编写一段程序，显示出身高和标准体重的对照表。显示的身高范围和间隔由输入的整数值进行结控制，标准体重精确到小数点后2位。
>
>```
>开始数值（cm）：155
>结束数值（cm）：190
>间隔数值（cm）：5
>
>155cm    49.50kg
>160cm    54.00kg
>...(以下省略)...
>```

**● 练习 3**

>编写一段程序，输入一个整数值，显示该整数值以下的所有奇数。
>
>```
>整数值:15
>1 3 5 7 9 11 13 15
>```

**● 练习 4**

>编写一段程序，显示1到n的整数值的二次方。
>
>```
>n的值:3
>1的二次方是1
>2的二次方是4
>3的二次方是9
>```

**● 练习 5**

>编写一段程序，输入一个整数值，显示该整数个''*''。每显示5个就进行换行。
>
>```
>显示多少个*:12
>*****
>*****
>**
>```

● **练习 6**

> 编写一段程序，输入一个整数，显示出输入整数层的金字塔形状。 提示:第i行显示(i-1)*2+1个''*''。
>
> ```
> 让我们来画一个金子塔。
> 金字塔有几层：3
>   *
>  ***
> *****
> ```', 5, 2, NULL, '2020-05-21 18:21:32.781577', '2020-05-21 18:21:32.781577', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (51, '程序的组成元素和格式', NULL, 10, NULL, NULL, '此处，我们插入一小结，再次总结和学习程序的各组成元素(关键字、运算符等)和格式相关的内容。

## 关键字

在C语言中，像if和else这样的标识符被赋予了特殊的意义。这种具有特殊意义的标识符称为**关键字(keyword)**,它们是不能用作变量名的。C语言中的32个关键字如下所示[C99标准中又加入了inline、restrict、_Bool、_Complex和_Imaginary等关键字。]。

**■表 A C语言的关键字**

|auto|break|case|char|const|continue|
|---|---|---|---|---|---|
|default|do|double|else|enum|extern|
|float|for|goto|if|int|long|
|register|return|short|signed|sizeof|static|
|struct|switch|typedef|union|unsigned|void|
|volatile|while|||||

## 运算符

目前为止我们己经介绍了 `+` 和 `-` 等**运算符(operator)**。所有运算符的一览表后面章节有述。

>► `>=` 和 `+=` 等由多个字符构成的运篝符中不可加入空格(即不可写成 `> =` 和 `+ =` 等)。

## 标识符

**标识符(identifier)** 等的名称规则：

>► 必须以非数字开头，之后可以是非数字和数字的组合。这里的非数字包括大小写字母和下划线。

C语言区分大小写，ABC、abc和aBc分别代表不同的标识符。

合法的标识符示例如下所示:

>x1 a __y abc_def max_of_group xyz Ax3 If iF IF if3

非法的标识符示例如下所示:

>if 123 98pc abc$ abc$xyz abc@def



>► 以下划线幵头的标识符(如 \_x、\_comp)和仅有一个大写英文字母的标识符(如A、Z)，有可能是编译器内部使用的，因此最好不要用作变量和函数的标识符。

## 分隔符

关键字和标识符都可以理解为构成语句的单位，用来分隔这些单位的符号就是**分隔符(punctuator)**。分隔符一共有13种，如下所示。

**■ 表B 分隔符**

```
[ ] ( ) { } * , : = ; ... #
```

## 常量和字符串常量

字符常量、整数常量、浮点数常量和字符串常量都是程序的构成要素。



## 自由的书写格式

代码清单 demo1.c 是前面九九乘法表代码的重写，程序本质上是一样的，显示的运行结果也一样。

**代码清单 demo1.c**

```c
/* 显示九九乘法表 */
#include <stdio.h>

int main(void) {
    int i, j;
    for (i = 1; i <= 9; i++) {
        for (j = 1; j <= 9; j++) {
            printf("%3d", i * j);
            putchar(''\n'');
        }
    }
    return 0;
}
```

c语言原则上允许开发人员以自由的格式编写程序。它并不像有些编程语言那样，规定了程序中必须从第几个字符开始写，或者每条语句必须写在一行之内等。

上述程序就是一个自由书写的例子。不过再怎么自由也还是有一些限制的。

**【1】构成语句的单位中间不能插入空格类字符**

例如 `int` 和 `return` 这样的关键字，变量 `n1` 和 `n2` 这样的标识符，`+=` 和 `++` 这样的运算符，都是构成语句的单位。在它们中间是不能插入空格类字符(空格、制表符、换行等)的。如下的书写格式是不允许的。

```c
ret
   urn
```

**【2】预处理指令中间不能换行**

允许使用自由书写格式的C语言中也对 `#include` 这样以 # 开头的预处理指令有特殊要求。原则上这些指令都必须写在一行内。下面这样的方式是不允许的。

```c
#include <stdio.h>
```

**【3】字符串常置和字符常量中间不能换行**

用双引号括起来的字符串常量"..."也是构成语句的单位，因此也不能像下面这样在中间进行换行。

```c
puts("在很久很久以前有个地方住着一位老公公和一位老婆婆。
老公公深深地爱着老婆婆。");
```

## 连接相邻的字符串常量

可以把被空格类字符以及注释分隔开的相邻字符串常量作为一个整体来看待。例如 "ABC" 和 "DEF"，连接起来就是 "ABCDEF"。

使用这种方法，可以将长的字符串常量写得很易读。就刚才的那个例子而言，可以像下面这样写。

```c
puts("在很久很久以前有个地方住着一位老公公和一位老婆婆。"
"老公公深深地爱着老婆婆。");
```

## 缩进

前面已经介绍过缩进，更容易地理解程序结构，更方便阅读。像这样以段落为单位向右移动的书写方式称为缩进（也称为"分段处理"）。

下面演示了在 Sublmie Text中一个不正确的缩进，`....` （空格）和 `——`  （TAB）混用是一定要避免的。

<img src="https://img-camp.banyuan.club/online/c/ch4/sublime-indent.png" width="350px" />

本教程的程序全部使用4个空格缩进。', 6, 2, NULL, '2020-05-21 18:21:32.809256', '2020-05-21 18:21:32.809256', 45);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (52, '数组', NULL, 10, NULL, NULL, '', 5, 1, NULL, '2020-05-21 18:21:32.83637', '2020-05-21 18:21:32.83637', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (53, '什么是数组', NULL, 10, NULL, NULL, '
学生的学籍号码、棒球选手背后的号码，还有飞机的座位号码......在生活中我们经常会遇到相同类型的事物聚集在一起的情况，与其逐一叫出它们的名字，还不如统一使用“号码”更加简单明了。举个例子，对于超过100个的飞机座位来说，如果分别称为“鹤座”“松座”......将会是一种什么样的情形呢?

本章将会为大家介绍为了提高处理效率而把具有相同类型的数据有序地组织起来的一种形式一数组。

相同类型的变量的集合，放在一起处理比较方便。这种情况下可以使用数组。本节就来学习数组的基本知识。

## 数组
依次输入5名学生的分数，显示出他们的总分和平均分。具体程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/* 输入5名学生的分数并显示出他们的总分和平均分 */
#include <stdio.h>

int main() {
    int no1;
    int no2;
    int no3;
    int no4;
    int no5;
    int sum = 0;

    printf("请输入5名学生的分数。\n");
    printf("1号："); scanf("%d", &no1); sum += no1;
    printf("2号："); scanf("%d", &no2); sum += no2;
    printf("3号："); scanf("%d", &no3); sum += no3;
    printf("4号："); scanf("%d", &no4); sum += no4;
    printf("5号："); scanf("%d", &no5); sum += no5;

    printf("总分：%5d\n", sum);
    printf("平均分：%5.1f\n", (double)sum / 5);

    return 0;
}
```

如果学生的人数不是5名而是300名的话会怎么样呢?为了保存分数，需要创建300个变量，而且还必须管理300个变量名。编写程序的时候光是注意不键入错误的变量名就已经很麻烦了。除此之外还有一个问题，那就是虽说变量名、号码不同，但是每次执行的都是几乎相同的处理。

擅长处理这类数据的就是**数组(array)**,它能通过“号码”把相同数据类型的变量集中起来进行管理。

>■注意■ 可以用数组实现相同类型的对象的集合。

同一类型的变量——**元素(element)**集中在一起，在内存上排列成一条直线，这就是数组。元素的类型既可以是**int**类型，也可以是**double**类型等。因为学生的分数都是整数，所以下面以元素为int类型的数组为例进行介绍。

## <span id="数组的声明(使用数组前的准备)">数组的声明(使用数组前的准备)</span>

首先是声明。如图1所示，数组的声明通过指定元素类型(element type)、变量名、元素个数来进行。另外，[]中的元素个数必须是常量。  

这里声明的数组a,是一个元素类型为int类型、元素个数为5个的数组。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-1.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图1 数组**

## <span id="访问数组(数组的使用方法)">访问数组(数组的使用方法)</span>

数组a的各个元素，都是int类型的对象。不允许一些元素是int类型，一些元素是double类型。

当然，对数组内各个元素的访问(读取)都是自由的。访问元素使用如表1所示的**下标运算符(subscript operator)**。[] 中的操作数称为**下标(subscript)**。下标表示该元素是首个元素之后的第几个元素，而不是数组中的第几个元素。比如图1中数组元素 a[2]，其下标为 2，表示 a[2] 是首个元素之后的第 2 个元素，而非数组的第 2 个元素。

>► 数组声明中使用的[]仅仅是一个分隔符，而访问各个元素时使用的[]则是运算符。为了加以区分，本书中将前者写作一般字体.后者写作粗体。

**■表 1 下标运算符**

|---|---|---|
|---|---|---|
|下标运算符|a[b]|从数组a的首个元素算起，访问b个元素后的元素|


第一个元素的下标为0,因此将从第一个元素开始依次访问a[0]、a[1]、a[2]、a[3]、a[4]。元素个数为的数组的各元素是a[0]、a[1]、...、a[n-l]，不存在 a[n]。
>► 访问 a[-1]、a[n] 等不存在的元素吋的结果不确定。请注意不要错误地访问了这些不存在的元素。

## <span id="数组的遍历">数组的遍历</span>
创建一个元素类型为int,包含5个元素的数组，依次把1、2、3、4、5赋给它们并进行显示。程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/* 依次把1、2、3、4、5赋值给数组的每个元素并显示 */
#include <stdio.h>

int main() {
    int v[5];

    v[0] = 1;
    v[1] = 2;
    v[2] = 3;
    v[3] = 4;
    v[4] = 5;

    printf("v[0] = %d\n", v[0]);
    printf("v[1] = %d\n", v[1]);
    printf("v[2] = %d\n", v[2]);
    printf("v[3] = %d\n", v[3]);
    printf("v[4] = %d\n", v[4]);

    return 0;
}
```

图2 所示为数组v的所有元素的下标和元素值。各元素的值为下标加1。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-2.png?x-oss-process=image/resize,w_220/sharpen,100)

**图2 下标和元素的值**

使用for语句对上述程序进行修改后，数组的优势就十分明显了。程序如代码清单 demo3.c 所示。

先来看一下为数组元素赋值的第一个for语句。这个for语句中的i从0开始递增，一共进行了5次循环操作。因此可以分解为以下步骤(和代码清单 demo2.c 的赋值处理完全相同)。

**代码清单 demo3.c**

```c
/*
依次把1、2、3、4、5赋值给数组的每个元素并显示(for)
*/
#include <stdio.h>

int main() {
    int i;
    int v[5];

    for (i = 0; i < 5; i++)
        v[i] = i + 1;

    for (i = 0; i < 5; i++)
        printf("v[%d] = %d\n", i, v[i]);

    return 0;
}
```

```c
i为0的时候    v[0] = 0 + 1;    /*v[0] = 1;*/
i为1的时候    v[1] = 1 + 1;    /*v[1] = 2;*/
i为2的时候    v[2] = 2 + 1;    /*v[2] = 3;*/
i为3的时候    v[3] = 3 + 1;    /*v[3] = 4;*/
i为4的时候    v[4] = 4 + 1;    /*v[4] = 5;*/
```

这样原本5行的赋值处理，就被替换为了单一的for语句，程序变简洁了。进行显示的第二个for语句也是同样。

像这样，按顺序逐个查看数组的元素，就称为**遍历(traverse)**.

一般情况下，元素类型为Type的数组，称为Type数组。我们之前看到的程序中的数组，都是“int数组”。

另外，元素类型为Type类型、元素个数为的数组，写作Type[n]型。本程序中数组v的类型，就是int[5]型。

>► 在表示所有类型共通的规则和法则等吋，一般使用“Type型”这种表述。而实际上并不存在Type这种类型。

接下来考虑double型数组。为 double[7] 的数组(元素类型为double类型、元素个数为7的数组)的全部元素赋值0.0的程序如代码清单 demo4.c 所示。

**代码清单 demo4.c**

```c
/*
将数组的全部元素赋值为0.0并显示
*/
#include <stdio.h>

int main() {
    int i;
    double x[7];

    for (i = 0; i < 7; i++)
        x[i] = 0.0;

    for (i = 0; i < 7; i++)
        printf("x[%d] = %.1f\n", i, x[i]);

    return 0;
}
```

## 数组初始化

之前我们已经提到，在声明变量的时候，除了的确没有必要的情况，都需要对变量进行初始化下面我们对前面的代码进行修改，加入对数组元素进行初始化的处理，程序如代码清单 demo5.c 所示。

数组的初始值就是那些在大括号中的、用逗号分隔并逐一赋给各个元素的值。在上述程序中，分别使用1、2、3、4、5对数组v的各元素v[0]、v[1]、v[2]、v[3]、v[4]进行了初始化，格式如下所示。

```c
int v[5] = {1,2,3,4,5,};
```
像这样，在最后一个初始值的后面，也要加上逗号。

**代码清单 demo5.c**

```c
/*
从头开始依次使用1、2、3、4、5对数组各元素进行初始化并显示
*/
#include <stdio.h>

int main() {
    int i;
    int v[5] = {1, 2, 3, 4, 5};

    for (i = 0; i < 5; i++)
        printf("v[%d] = %d\n", i, v[i]);

    return 0;
}
```
还可以像下面这样在声明数组的时候不指定元素个数，数组会根据初始值的个数自动进行设定。

```
int v[] = {1,2,3,4,5}; /*元素个数可以省略(自动认为是5)*/
```

另外还有一个规则，就是用0对{}内没有赋初始值的元素进行初始化。因此，在下面的声明中，v[2]之后的元素都使用0来初始化。

```
int v[5] = {1,3};/*用{1,3,0.0，0}初始化*/
```

于是，如果要使用0初始化数组中的全部元素，就是下面这样。

```
int [5]={0};/*用{0,0,0.0，0}初始化*/
```

虽然用0对没有赋初始值的V[0]进行初始化是理所应当的，但初始值被省略的v[1]之后的元素也用0进行初始化。

如下所示，当初始值的个数超过数组的元素个数的时候，程序会发生错误。

```
int v[3]={1,2,3,4}; /* 错误:初始值过多 */
```

另外，不能通过赋值语句进行初始化。下面是一个错误的例子。

```
int v[3];
v = {1,2,3};/*错误：不能使用赋值语句进行初始化*/
```

## <span id="数组的复制">数组的复制</span>

请大家先来看一下代码清单 demo6.c 中的程序

**代码清单 demo6.c**

```c
/*
把数组中的全部元素复制到另一个数组中
*/
#include <stdio.h>

int main() {
    int i;
    int a[5] = {17, 23, 36};
    int b[5];

    for (i = 0; i < 5; i++)
        b[i] = a[i];

    puts("  a   b");
    puts("---------");
    for (i = 0; i < 5; i++)
        printf("%4d%4d\n", a[i], b[i]);

    return 0;
}
```

程序中的第一个for语句，其作用是把a中全部元素的值依次赋给b中的元素(图3)。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-3.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图3 数组的复制**

>► 同时通历两个数组，从 `b[0]=a[0];` 执行到 `b[4]=a[4];`。

C语言不支持使用基本赋值运算符=为数组赋值。也就是说，下面这样的语句是错误的。

```c
b = a; /* 错误:不能为数组赋值 */
```

因此，应该像上面的程序那样，使用for语句等对数组的元素逐一赋值。

>■注意■ 不能使用赋值运算符为数组赋值。数组的复制，必须通过使用循环语句等对所有元素逐一赋值来进行。

另外，第二个 for 语句同时遍历两个数组，并显示全部元素的值。

## 输入数组元素的值

下面从键盘输入数组元素的值。输入 int[5] 数组的各元素的值并显示的程序如代码清单 demo7.c 所示。

**代码清单 demo7.c**

```c
/*
输入数组元素的值并显示
*/
#include <stdio.h>

int main() {
    int i;
    int x[5];

    for (i = 0; i < 5; i++) {
        printf("x[%d]:", i);
        scanf("%d", &x[i]);
    }

    for (i = 0; i < 5; i++) {
        printf("x[%d] = %d\n", i, x[i]);
    }
    return 0;
}
```

使用scanf函数存储键盘输入值的方法，与其他(数组以外)变量的情况完全一样。

>► 使用scanf函数读取输入信息的吋候，需要在变量前加上&。

## 对数组的元素进行倒序排列

如果仅仅是输入并显示元素的值，那并没有什么意思。这次我们来对数组的元素进行倒序排列。程序如代码清单 demo8.c 所示。

数组x的元素个数为7个。程序中第二个for语句实现的就是对这7个元素进行倒序排列的功能，具体情况如图 4 所示。也就是像下面这样，进行3次“两个值的交换”。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-4.png?x-oss-process=image/resize,w_220/sharpen,100)  
**图4 数组元素的倒序排列**

```
x[0]和x[6]交换
x[1]和x[5]交换
x[2]和x[4]交换
```
>► 在for语句的循环过程中，i的值在0、1、2之间变化，6-i的值在6、5、4之间变化。

**代码清单 demo8.c**

```c
/*
对数组的全部元素进行倒序排列
*/
#include <stdio.h>

int main() {
    int i;
    int x[7];

    for (i = 0; i < 7; i++) {
        printf("x[%d]:", i);
        scanf("%d", &x[i]);
    }

    for (i = 0; i < 3; i++) {
        int temp = x[i];
        x[i] = x[6 - i];
        x[6 - i] = temp;
    }

    puts("倒序排列了。");
    for (i = 0; i < 7; i++) {
        printf("x[%d] = %d\n", i, x[i]);
    }

    return 0;
}
```

两个值的交换顺序一般如图5所示。要想交换a和b的值，必须使用一个额外的变量。处理流程如下所示。

>1. 把a的值保存在temp中。
1. 把b的值赋给a。
1. 把temp中保存的值赋给b。

在该程序中，x[i]就相当于a,x[6-i]就相当于b。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-5.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图5 两个值的交换**

不可以像下面这样进行两个值的交换。

```
a = b; b = a;
```
这是因为这样一来变量a和b的值都会变为b的初始值。

## 使用数组进行成绩处理

对前面成绩处理程序进行修改使用数组完成同样的功能。修改后的程序如代码清单 demo9.c 所示。

**代码清单 demo9.c**

```c
/*
输入5名学生的分数并显示出他们的总分和平均分
*/
#include <stdio.h>

int main() {
    int i;
    int scores[5];
    int sum = 0;

    printf("请输入5名学生的分数。\n");
    for (i = 0; i < 5; i++) {
        printf("%-2d号:", i + 1);
        scanf("%d", &scores[i]);
        sum += scores[i];
    }

    printf("总分：%5d\n", sum);
    printf("平均分：%5.1f\n", (double)sum / 5);

    return 0;
}
```

数组 scores 用来保存学生的分数。同时，由于数组的下标是从0到4，因此在提示输入学生分数的时候，要使用下标值加1(即“1号:”“2号:”等)来显示。

让我们来想象一下学生人数由5人增加到8人时的情况。根据编辑器的不同，有时不能一下子进行替换。这是因为虽然需要将学生人数由5替换为8,但显示的位数5则不能替换。

也就是说，这里需要进行选择性替换(只替换应该替换的地方)。

## 对象式宏

可以解决上述问题的就是**对象式宏(object-like macro)**。请大家看一下代码清单 demo10.c 中的程序。

本程序的关键部分是 **#define指令(#define directive)** 。该指令的一般形式如下所示。

```c
#define a b  /*将该指令之后的a替换为b*/
```
它的原理和文字处理机或者编辑器的替换处理是一样的，在将该指令之后的a替换为b的基础上再进行编译与执行处理。

**代码清单 demo10.c**

```c
/*
输入5名学生的分数并显示出他们的总分和平均分（宏）
*/
#include <stdio.h>

#define NUMBER 5 /*学生人数*/

int main() {
    int i;
    int scores[NUMBER];/*NUMBER个学生的分数*/
    int sum = 0;

    printf("请输入%d名学生的分数。\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("%-2d号:", i + 1);
        scanf("%d", &scores[i]);
        sum += scores[i];
    }

    printf("总分：%5d\n", sum);
    printf("平均分：%5.1f\n", (double)sum / NUMBER);

    return 0;
}
```

在这里，a称为**宏名(macro name)**。为了易于和通常的变量名等进行区分，宏名一般用大写字母来表示。本程序中，宏名为NUMBER,程序中的 NUMBER 被替换为5。

不过，刚才我们提到了要考虑改变学生的人数。变更人数其实很容易，只需将宏定义改为下面这样即可(程序中NUMBER的在编译时被替换为8)。

```c
#define NUMBER 8 /*学生的人数*/
```

在程序中使用宏，不仅能够在一个地方统一管理，而且通过为常量定义名称，还可以使程序阅读起来更容易。如果能够加上恰当的注释，效果会更加明显。

>► 程序中的 5 等常量，称为幻数(不清楚具体表示什么的数值)。引入对象式宏后，就可以消除程序中的幻数了。

从“只要正确运行就行”的观点出发，其实是没必要使用宏的。但是使用宏有助于提高程序的质量。

>■注意■ 不要在程序中直接使用数值，最好能够通过宏的形式定义出它们的名称。定义宏的时候，请不要忘记添加注释。  

>► 对象式宏并不能够用来替换字符串字面置和字符常置中的部分内容，也不能用来朁换变量名等标识符中的部分内容。

## 数组元素的最大值和最小值

接下来我们来求最高分和最低分，即数组元素的最大值和最小值。程序如代码清单 demo11.c所示。

**代码清单 demo11.c**

```c
/*
输入5名学生的分数并显示出其中的最高分和最低分
*/
#include <stdio.h>

#define NUMBER 5

int main() {
    int i;
    int scores[NUMBER];
    int max, min;

    printf("请输入%d名学生的分数。\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("%-2d号:", i + 1);
        scanf("%d", &scores[i]);
    }

    min = max = scores[0];//【1】

    for (i = 1; i < NUMBER; i++) {
        if (scores[i] > max) max = scores[i];//【2】
        if (scores[i] < min) min = scores[i];
    }

    printf("最高分：%d\n", max);
    printf("最低分：%d\n", min);

    return 0;
}
```

## 赋值表达式的判断

在求最大值和最小值的【1】这一行中，使用了两个赋值运算符=。首先，我们对int型变量进行如下的赋值操作。

```c
n = 2.95;
```

因为整数n不能存放小数点之后的数字，所以其值为2。于是我们需要记住下面这一点。

>■注意■ 赋值表达式的判定结果，和赋值后左操作数的类型和值相同。

也就是说，赋值表达式n = 2.95的判定结果，与赋值后左操作数n的类型和值相同，即“int类型的2”(图6【a】)。

另外，如图【b】所示，如果被赋值一方的变量x为double型，则赋值表达式的判定结果为“double类型的2.95”。

因为陚值运算符=具有右结合性，所以【1】会被解释为

```c
min = (max = scores[0]);
```

![image](http://img-camp.banyuan.club/cc001/chapter5/5-6.png?x-oss-process=image/resize,w_280/sharpen,100)  
**图6 复制表达式的判断**

如图7所示，如果scores[0]为83,则赋值表达式max=ten[0]的判定结果为“int类型的83”。因为该结果会被赋给min}，所以min和max的值都变成了scores[0]的值，也就是83。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-7.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图7 多重赋值表达式的判定**

C语言中经常会使用这样的赋值方法。例如，使用a = b = 0就可以同时把0赋给a和b。

>► 这仅仅是对赋值而言，对带有初始值的声明并不适用。不能像下面这样同时声明两个变置a和b。
>
```c
int a = b = 0;/*错误：不可以这样初始化*/
```
>而需要像下面这样使用逗号分隔幵声明。
>
```c
int a = 0, b = 0;
```
>或者也可以分两行进行声明。
>
```c
int a = 0;
int b = 0;
```

为了便于理解【1】和【2】处求最大值和最小值的流程，我们展开来看，如下所示。

```c
/*求scores[0]~scores[4]的最大值*/
max = scores[0];
if (scores[1] > max) max = scores[1];
if (scores[2] > max) max = scores[2];
if (scores[3] > max) max = scores[3];
if (scores[4] > max) max = scores[4];
```
```c
/*求scores[0]~scores[4]的最小值*/
min = scores[0];
if (scores[1] < min) min = scores[1];
if (scores[2] < min) min = scores[2];
if (scores[3] < min) min = scores[3];
if (scores[4] < min) min = scores[4];
```

求最大值的步骤和求两个、三个数的最大值的程序完全一样。只是整数从3个增加到了5个，从通过多个变量实现变成了通过一个数组来实现。

## 数组的元素个数
截至目前，我们看到的所有成绩处理程序中的学生人数都是5。虽然通过定义宏来变更学生人数非常简单，但是每次都需要对程序进行修改，然后重新编译执行。因此，我们可以定义一个比较大的数组，然后从头开始仅使用其中需要的部分。

采用这种方法实现的程序如代码清单 demo12.c 所示。

**代码清单 demo12.c**

```c
/*
输入学生的分数并显示出分布情况
*/
#include <stdio.h>

#define NUMBER 80    /*人数上限*/

int main() {
    int i, j;
    int num;              /*实际的人数*/
    int scores[NUMBER];    /*学生的分数*/
    int bunpu[11] = {0};  /*分布图*/

    printf("请输入学生人数：");
    do {
        scanf("%d", &num);
        if (num < 1 || num > NUMBER)
            printf("请输入1-%d的数：", NUMBER);
    } while (num < 1 || num > NUMBER);
    
    printf("请输入%d人的分数。\n", num);

    for (i = 0; i < num; i++) {
        printf("%2d号:", i + 1);
        do {
            scanf("%d", &scores[i]);
            if (scores[i] < 0 || scores[i] > 100)
                printf("请输入1-100的数：");
        } while (scores[i] < 0 || scores[i] > 100);
        bunpu[scores[i] / 10]++;
    }

    puts("\n---分布图---");
    printf("  100:");
    for (j = 0; j < bunpu[10]; j++)
        putchar(''*'');
    putchar(''\n'');

    for (i = 9; i >= 0; i--) {
        printf("%2d-%2d:", i * 10, i * 10 + 9);
        for (j = 0; j < bunpu[i]; j++)
            putchar(''*'');
        putchar(''\n'');
    }

    return 0;
}
```

在该程序中，数组scores的元素个数声明为了80。执行程序时，在num中输入1以上80以下的人数，仅利用数组开头的num个元素。

>► 在上述程序运行示例中，因为num为15,所以就使用了80个元素中的头15个元素，即scores[0]~scores[14]。

另外，在该程序中，除了存放分数的scores之外，还使用了 int[11] 数组 bunpu 来存放分数的分布。

求分布的表达式比较复杂。如下所示，它是利用“整数/整数”舍去小数部分来进行递增的。

```c
scores[i] 为 0~9 时: bunpu[0] 递增
scores[i] 为 10~9 时: bunpu[1] 递增
...中略...
scores[i] 为 80~89 时: bunpu[8] 递增
scores[i] 为 90~99 时: bunpu[9] 递增
scores[i] 为 100 时: bunpu[10] 递增
```

通过循环进行上述处理，数组scores的分布就保存在数组bunpu中了。

## 作业

**● 练习 1**

>编写一段程序，读取数组中的数据个数和元素值并显示。显示时，各值之间用逗号和空格分割，并用大括号将所有值括起来。注意利用对象式宏来声明数组的元素个数。

**● 练习 2**

> 编写一段程序，逆向显示代码清单 demo12.c 的分布图(即按照0~9、10〜19、...、100的顺序显示)。

**● 练习 3**

>编写一段程序，纵向显示练习2 中得到的分布图。
>
>```
>                   * 
>           *   *   *      *
>   *   *   *   *   *   *  *  *  *  *
>------------------------------------
>0 10  20  30  40  50 60  70 80 90 100
>```
>', 1, 2, NULL, '2020-05-21 18:21:32.843259', '2020-05-21 18:21:32.843259', 52);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (54, '二维数组', NULL, 10, NULL, NULL, '所谓多维数组，就是多个数组集合在一起形成的数组，即元素本身是数组的数组。本节就来学习多维数组的基础知识。

## 多维数组

上一节中所学习的数组，其元素都是int型或double型等单一类型。实际上，数组的元素也可以是数组本身.

以数组作为元素的数组是二维数组，以二维数组为元素的数组是三维数组。当然也可以生成维数更高的数组。二维数组以上的数组，统称为**多维数组(multi dimensional array)**。

>■注意■ 多维数组是以数组为元素的数组。

另外，为了与多维数组区分开来，我们将上一节中学习的“元素不是数组的数组”称为一维数组。

图1所示为二维数组的生成过程。分为两个阶段。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-8.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图1 —维数组和二维数组的生成**

```
【a】=>【b】：int型元素集中起来生成一维数组（这里集中了3个）
【b】=>【c】：一位数组集中起来生成二维数组（这里集中了4个）
```

类型分别如下所示。

```
【a】：int型
【b】：int[3]型    元素类型为int型、元素个数为3的数组
【c】：int[4][3]型    以“元素类型为int型、元素个数为3的数组”为元素、元素个数为4的数组
```

二维数组就像是一个由“行”和“列”构成的表单，其中各元素纵横排列。因此，图【c】所示的数组，就称为“4行3列的二维数组”。

该4行3列的二维数组的声明和内部结构如图2所示。在多维数组的声明中，最先集中起来的元素个数(二维数组的列数)放在末尾。

>► 元素个数相反的 int a\[3][4]; 是3行4列的二维数组的声明，即以“元素类型为int型，元素个数为4的数组”为元素、元素个数为3的数组。

数组a的元素是a[0]、a[1]、a[2]、a[3]这4个，而各个元素都是由3个int型元素组成的int[3]型。也就是说，元素的元素是int型。

本书中将构成数组的最小单位的元素，称为构成元素。访问各构成元素的表达式的形式为a\[i][j]，即连用下标运算符[]。当然，下标是从0开始的，这一点和一维数组一样。数组a的构成元素有 a\[0][0]、a\[0][1]、a\[0][2]、...、a\[3][2] 共12个。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-9.png?x-oss-process=image/resize,w_650/sharpen,100)

**图2 4行3列的二维数组**

和一维数组一样，多维数组的所有元素/所有构成元素在内存上是排列成一条直线的。构成元素排列时，首先是末尾的下标按照0、1、...的顺序递增，然后是开头的下标按照0、1、...的顺序递增，如下所示。

```
a[0][0] a[0][1] a[0][2] a[1][0] a[1][1] a[1][2]...a[3][1]a[3][2]
```

这样就保证了a\[0][2] 的后面是a\[1][0]，a\[2][2]的后面是a\[3][0]。

>■注意■ 多维数组的构成元素排列时，首先从末尾的下标开始递增。

>► 注意下面这样的排列方式(幵头的下标首先递增)是错误的。
>
>```
>a[0][0] a[1][0] a[2][0] a[3][0] a[0][1] a[1][1]...a[2][2] a[3][2]
>```
>不过也有采用这种排列方式的编程语言。

下面我们使用二维数组编写一段程序。代码清单 demo1.c 是求分数之和的程序。假设有4名学生，3门课程，并进行了两次考试。让我们分别求出各课程的总分并显示出来。

**代码清单 demo1.c**

```c
/*
求4名学生在两次考试中3门课程的总分并显示
*/
#include <stdio.h>

int main() {
    int i, j;
    int scores1[4][3] = {{91, 63, 78}, {67, 72, 46}, {89, 34, 53}, {32, 54, 34}};
    int scores2[4][3] = {{97, 67, 82}, {73, 43, 46}, {97, 56, 21}, {85, 46, 35}};
    int sum[4][3];

    /*求两次考试的分数之和*/
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++)
            sum[i][j] = scores1[i][j] + scores2[i][j];
    }

    /*显示第一次考试的分数*/
    puts("第一次考试的分数");
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++)
            printf("%4d", scores1[i][j]);
        putchar(''\n'');
    }

    /*显示第二次考试的分数*/
    puts("第二次考试的分数");
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++)
            printf("%4d", scores2[i][j]);
        putchar(''\n'');
    }

    /*显示总分*/
    puts("总分");
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++)
            printf("%4d", sum[i][j]);
        putchar(''\n'');
    }

    return 0;
}
```

scores1和scores2分别是存放第一次考试和第二次考试的分数的数组，sum是存放总分的数组，它们都是以12个分数为构成元素的4行3列的二维数组。

如图 3所示，各行对应学生，各列对应课程。

例如，scores1[2][1]表示第3个学生第一次英语考试的分数，scores2[3][2]表示第4个学生第二次数学考试的分数。

另外，二维数组和scores1和scores2的各构成元素都用初始值进行了初始化。另一方面,数组sum因为没有初始值，所以它的所有元素都是不定值。

![image](http://img-camp.banyuan.club/cc001/chapter5/5-10.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 3 4行3列的二维数组中存储的考试分数**

第一个for循环部分是对分数进行加法运算的代码。针对该4行3列的数组，反复执行将scores1[i][j]和scores2[i][j]相加的结果赋值给sum[i][j]的操作(图中显示的sum的构成元素的值是求总分后的值)。

在该程序中，因为进行了两次考试，所以使用了两个二维数组。如果进行了15次考试，则就不要使用15个二维数组了，那种情况下使用由15个二维数组组成的三维数组会更加方便。

下面是一个声明示例。

```c
int scores[15][4][3];/*4名学生在15次考试中3门课程的分数*/
```

通过使用了3重下标运算符的表达式来访问该数组的各构成元素。其排列顺序为 `scores[0][0][0], scores[0][0][1], ..., scores[14][3][2]`。

>► 和一维数组、二维数组一样，所有的构成元素被配置在连续的内存空间中。

## 作业

**● 练习 1**

>编写一段程序，求4行3列矩阵和3行4列矩阵的乘积。各构成元素的值从键盘输入。

**● 练习 2**

>编写一段程序，输入6名学生2门课程(语文、数学)的分数，显示各门课程的总分和平均分，以及各个学生的总分和平均分。', 2, 2, NULL, '2020-05-21 18:21:32.86825', '2020-05-21 18:21:32.86825', 52);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (55, '查找', NULL, 10, NULL, NULL, '', 5, 2, NULL, '2020-05-21 18:21:32.89576', '2020-05-21 18:21:32.89576', 52);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (56, '顺序查找', NULL, 10, NULL, NULL, '**顺序查找（Sequential Search）**，也叫**线性查找（Linear Search）**是一种最简单的查找算法，它的基本思想是：从表的一端开始，顺序扫描线性表，依次讲扫描到的元素的关键字和给定的关键字 k 进行比较。若当前扫描到的结点关键字与 k 相等，则查找成功；若扫描结束后仍未找到关键字与 k 相等的元素，则查找失败。

例如：在数组元素{83、55、77、49、25}中查找49如图 1所示：

![image](https://img-camp.banyuan.club/cc002/chapter7/7-1.png?x-oss-process=image/resize,w_200/sharpen,100)

**图 1 顺序查找成功例**

又如：在数组元素{83、55、77、49、25}中查找16如图 2所示：

![image](https://img-camp.banyuan.club/cc002/chapter7/7-2.png?x-oss-process=image/resize,w_200/sharpen,100)

**图 2 顺序查找失败例**

在你的编程生涯中，无时无刻不在使用顺序查找，在学**顺序表**的时，查找函数使用的就是顺序查找，核心实现代码如下：

```c
#define FAILED -1
int search(int v[], int key, int n) {
    for (int i = 0; i < n; i++) {
        if (v[i] == key)
            return i;
    }
    return FAILED;
}
```

或者：

```c
#define FAILED -1
int search(const int v[], int key, int n) {
    int i = 0;
    while (1) {
        if (i == n)
            return FAILED;  /*查找失败*/
        if (v[i] == key)
            return i;  /*查找成功*/
        i++;
    }
}
```

在满足下述任意条件的时候，就可以跳出while语句。

> 【A】未能找到想要查找的值，最后跳出循环(当i==n成立的时候)     
> 【B】找到了想要查找的值(当v[i]==key成立的时候)

## 哨兵查找

观察上面的程序，进行循环操作的时候，需要不停判断是否满足两个结束循环的条件。虽然说判断很简单，但是经过数次累积之后，也是个不小的负担了。

如果数组的大小(元素个数)还有富余，我们就可以把想要查找的数值存储到数组末尾的元素v[n]中(图3)。这样一来，即使数组中没有想要查找的数值，当遍历到v[n]的时候，也肯定会满足条件【B】，这样条件【A】就可以省略了。

![image](https://img-camp.banyuan.club/cc002/chapter7/7-3.png?x-oss-process=image/resize,w_500/sharpen,100)

**图 3 顺序查找（哨兵查找）**

如上所示在数组末尾追加的数据称为**哨兵**，使用哨兵进行查找的方法称为**哨兵查找法**。

核心代码如下：

```c
#define NUMBER 5
#define FAILED -1

int search(int v[], int key, int n) {
    int i ;
    v[n - 1] = key;
    for (i = 0; i < n; i++) {
        if (v[i] == key)
            break;
    }
    return (i < n - 1) ? i : FAILED;
}

int main() {
    // 元素数量为NUMBER，存储空间 + 1
    int vx[NUMBER + 1];
    // ... 初始化一些数据.
    int idx = search(vx, ky, NUMBER + 1);

    if (idx == FAILED)
        puts("查找失败，数组中无此值！");
    else
        printf("%d是数组的第%d号元素\n", ky, idx + 1);

    return 0;
}
```

## 算法复杂度

对于一个包含 n 个元素的数列，利用顺序查找的方法来查找某个数值：

* 最好的结果是查找一次即找到要找的数，即要查找的元素位于数列的第一个。

* 最坏的结果是直至数列查找结束才找到或者仍然没有找到需要查找的值，所以时间复杂度的最大值为O(n)。

综合考虑，顺序查找查找成功的平均次数为 (n+1) / 2，所以顺序查找的时间复杂度为 O(n)。

', 1, 3, NULL, '2020-05-21 18:21:32.922527', '2020-05-21 18:21:32.922527', 55);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (57, '二分查找', NULL, 10, NULL, NULL, '**折半查找**，也称**二分查找（Binary Search）**，在某些情况下相比于顺序查找，使用折半查找算法的效率更高。但是该算法的使用的前提是静态查找表中的数据必须是有序的。

例如，在`{5,21,13,19,37,75,56,64,88 ,80,92}` 这个查找表使用折半查找算法查找数据之前，需要首先对该表中的数据按照所查的关键字进行排序：`{5,13,19,21,37,56,64,75,80,88,92}`。

> 在折半查找之前对查找表按照所查的关键字进行排序的意思是：若查找表中存储的数据元素含有多个关键字时，使用哪种关键字做折半查找，就需要提前以该关键字对所有数据进行排序。

## 折半查找算法

以静态查找表`{5,13,19,21,37,56,64,75,80,88,92}`为例，首先建立数据结构：
```c
typedef struct _Table {
    int *p;  // p 存放元素
    int length; // 元素的数量
} Table;
```

采用折半查找算法查找关键字为 21 的过程为：

<img src="https://img-camp.banyuan.club/online/alg/ch5/binary_search1.svg" style="width:400px;padding:20px 0;"/>     
**图 1 折半查找的过程（a）**


如上图 1 所示，指针 low 和 high 分别指向查找表的第一个关键字和最后一个关键字，指针 mid 指向处于 low 和 high 指针中间位置的关键字。在查找的过程中每次都同 mid 指向的关键字进行比较，由于整个表中的数据是有序的，因此在比较之后就可以知道要查找的关键字的大致位置。

例如在查找关键字 21 时，首先同 56 作比较，由于`21 < 56`，而且这个查找表是按照升序进行排序的，所以可以判定如果静态查找表中有 21 这个关键字，就一定存在于 low 和 mid 指向的区域中间。

因此，再次遍历时需要更新 high 指针和 mid 指针的位置，令 high 指针移动到 mid 指针的左侧一个位置上，同时令 mid 重新指向 low 指针和 high 指针的中间位置。如图 2 所示：

<img src="https://img-camp.banyuan.club/online/alg/ch5/binary_search2.svg" style="width:400px;padding:20px 0;"/>     
**图 2 折半查找的过程（b）**


同样，用 21 同 mid 指针指向的 19 作比较，`19 < 21`，所以可以判定 21 如果存在，肯定处于 mid 和 high 指向的区域中。所以令 low 指向 mid 右侧一个位置上，同时更新 mid 的位置。

<img src="https://img-camp.banyuan.club/online/alg/ch5/binary_search3.svg" style="width:400px;padding:20px 0;"/>     
**图 3 折半查找的过程（3）**

当第三次做判断时，发现 mid 就是关键字 21 ，查找结束。

核心算法代码

```c
int search(Table table, int key) {
    int low = 0;
    int high = table.length - 1;
    int mid;

    while (low <= high) {
        mid = (low + high) / 2;

        if (key == table.p[mid]) {
            return mid;
        } if (key < table.p[mid]) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }

    return FAILED;
}
```

> 注意：在做查找的过程中，如果 low 指针和 high 指针的中间位置在计算时位于两个关键字中间，即求得 mid 的位置不是整数，需要统一做取整操作。

## 算法复杂度

假设查找数据长度为 16，每次查找后减半：

> 第 1 次  MID = 16 / 2
>
> 第 2 次  MID = 16 / 4
>
> 第 3 次  MID = 16 / 8
>
> 第 4 次  MID = 16 / 16

最坏的情况下第 4 次才找到，此时只剩一个数据，长度为1。

将查找数据长度抽象为 N，次数抽象为K：

> 第 1 次  MID = N / 2<sup>1</sup>
>
> 第 2 次  MID = N / 2<sup>2</sup>
>
> ... ...
>
> 最后一次：第 K 次  MID = N / 2<sup>K</sup> 

 N / 2<sup>K</sup> = 1 ，即：N = 2<sup>K</sup>，推导出时间复杂度 T(N) = O(log<sub>2</sub> N)。', 2, 3, NULL, '2020-05-21 18:21:32.949543', '2020-05-21 18:21:32.949543', 55);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (58, '函数', NULL, 10, NULL, NULL, '', 6, 1, NULL, '2020-05-21 18:21:32.977235', '2020-05-21 18:21:32.977235', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (59, '什么是函数', NULL, 10, NULL, NULL, '程序是由多个零件组合而成的，而函数就是这种“零件”的一个较小的单位。本节我们就来学习函数的基础知识。

## main函数和库函数

截至目前，大家见过的程序格式都如下所示。其中第一行以外的部分称为 main 函数(main function)。C语言程序中，main函数是必不可少的。程序运行的时候，会执行main函数的主体部分。

```c
#include <stdio.h>
int main() {
    /*中略*/
    return 0;
}
```


main函数中使用了printf、scanf、puts等函数。由C语言提供的这些为数众多的函数称为**库函数(library function)**。

>► 通常各个编译器在提供c语言规定的函数之外，还会提供各自不同的函数。具体内容请参考各编译器的说明书。

## 什么是函数
当然，我们也可以自己来创建函数。而实际上，我们也必须要亲自动手创建各种函数。那么首先来尝试一下比较简单的函数。

创建一个函数，接收两个整数参数，返回较大整数的值。

图 A 用一个类似于电路图的图形形象地展示了该函数

![image](https://img-camp.banyuan.club/cc001/chapter6/6-2.png?x-oss-process=image/resize,w_500/sharpen,100)

**图 A 求两个值中较大的函数**

>► 函数这一名称，来源于数学术语函数(function)。function具有“功能”“作用”“职责”等意思。

printf函数和scanf函数等创建得比较好的函数，即使不知道其内容，只要了解使用方法，也可以轻松地使用，就像是“魔法盒”一样。

要想精通这个“魔法盒”一样的函数，需要站在函数创建者和使用者双方的立场上，进行两种学习。

* 函数的创建方法......函数定义
* 函数的使用方法......函数调用

## 函数定义
首先来学习函数的创建方法。这里我们来定义一个名为的函数，如图B 所示。

![image](https://img-camp.banyuan.club/cc001/chapter6/6-3.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 B 函数定义的结构**

这里的 **函数定义(function definition)** 由多个部分构成。

**■ 函数头(function header)**

该部分表示函数的名称和格式。虽然称为函数头，实际上说它是函数的“脸”可能更为合适。

**1. 返回类型(return type)**

函数返回的值—— **返回值(return value)** 的类型。该函数的情况下，返回的是两个int型数值中较大的一个，所以其类型是int。

**2. 函数名(function name)**

函数的名称。从其他零件调用函数时，使用函数名。

**3. 形参声明(parameter type list)**

小括号括起来的部分，是用于接收辅助性提示的变量—— **形式参数(parameter)** 的声明。像该函数这样接收多个形参的情况下，使用逗号将它们分隔开来。

>► 函数max2中，a和b都被声明为了int型的形参。

**■ 函数体(function body)**

函数体是复合语句。仅在某个函数中使用的变量，原则上应在该函数中声明和使用。但要注意不能声明和形参同名的变量，否则会发生变量名冲突的错误。

## 函数调用

我们已经知道了函数的创建方法(函数定义)，接下来让我们一起看一下函数的使用方法(函数调用)。这里我们结合代码清单 demo1.c 来理解。代码清单 demo1.c 所示的程序为定义并使用函数max2。

**代码清单 demo1.c**

```c
/*
求两个整数中较大的值
*/
#include <stdio.h>

/*返回较大整数的值*/
int max2(int a, int b) {
    if (a > b)
        return a;
    else
        return b;
}

int main() {
    int n1, n2;

    puts("请输入两个整数。");
    printf("整数1:"); scanf("%d", &n1);
    printf("整数2:"); scanf("%d", &n2);

    printf("较大整数的值是%d。\n", max2(n1, n2));

    return 0;
}
```

该程序中定义了两个函数 max2 和 main。程序启动时执行的是 main 函数。虽然 max2 函数定义在 main 函数之前，但并没有先执行 max2 函数。

使用函数的过程，称为“调用函数”。本程序中调用函数 max2 的是程序中的 printf 函数的实参。

函数调用的形式是在函数名后面加上小括号。这个小括号称为**函数调用运算符(function call operator)**。

我们知道，使用〇〇运算符的表达式称为〇〇表达式。因此，使用函数调用运算符的表达式就称为**函数调用表达式(function call expression)**。

函数调用运算符括起来的是**实参(argument)**。实参不止一个时，使用逗号将其分隔开。

进行函数调用后，程序的流程将一下子跳转到该函数处。因此，main函数的执行将暂时中断，开始执行max2函数。
在被调用的函数一方，会生成用于形参的变量，并赋予其实参的值。这种情况下，形参a和b会被赋予n1和n2的值，即45和83。

>■注意■ 进行函数调用后，程序的流程会转到被调用的函数处。这时，传递过来的实参的值会被赋给函数接收的形参。

形参的初始化完成后，将执行函数体。程序流在遇到return语句(return statement),或者执行到函数体最后的大括号时，就会从该函数跳转到调用函数。

return语句执行结束后，程序流将返回到原来进行调用的地方，再次执行被中断的main函数。同时，return后面的表达式的值(这里是表达式b的值83)会被返回。

结果就是，函数max2的返回值83被传递给printf函数，并显示出来。

表1中对函数调用运算符进行了概括总结。

**■表1 函数调用运算符**

|---|---|---|
|---|---|---|
|函数调用运算符|x(arg)|向函数x传递实参arg并调用(当实参有多个时，用逗号分隔)。(如果返回值类型不是void)生成函数x返回的值|

>► 关于返回值类型void ，我们将在下一节介绍。

函数调用的时候传递的只是参数的值，因此调用函数时使用的实参既可以是变量，也可以是常量。例如，下面的函数调用，将输出变量n1和5中较大的那一个。

>max2(n1, 5)

函数返回的是“表达式”的值。当然，不能返回两个以上的值。

## 将函数的返回值作为参数传递给函数

输入两个整数，计算它们的平方差并显示。程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/*
计算两个整数的平方差
*/
#include <stdio.h>

/*返回x的平方*/
int sqr(int x) {
    return x * x;
}

/*返回x和y的差值*/
int diff(int a, int b) {
    return (a > b ? a - b : b - a);
}

int main() {
    int x, y;

    puts("请输入两个整数。");
    printf("整数x:"); scanf("%d", &x);
    printf("整数y:"); scanf("%d", &y);

    printf("x和y的平方差是%d。\n", diff(sqr(x), sqr(y)));

    return 0;
}
```

代码示例中：
```c
diff(sqr(x), sqr(y))
```

函数调用表达式 sqr(x) 和 sqr(y) 的判断结果分别是 16 和 25。16和25这两个值，会被直接作为调用函数diff时的实参传递。

因此，函数调用表达式diff(sqr(x)，sqr(y))就是diff(16,25)。对该表达式进行判断，就会得到函数diff返回的9。

## 值传递

下面我们来创建一个计算幂的函数。如果n是整数，则通过对x进行n次乘法运算得出x的n次幂。程序如代码清单 demo3.c 所示。

>► 例如* 4.6的3次幂就是4.6x4.6x4.6=97.336。

**代码清单 demo3.c**

```c
/* 计算幂 */
#include <stdio.h>

/*返回x的n次幂*/
double power(double x, int n) {
    double tmp = 1.0;
    while (n-- > 0) {
        tmp *= x;
    }
    return tmp;
}

int main() {
    double a;
    int b;

    puts("求a的b次幂。");
    printf("实数a:"); scanf("%lf", &a);
    printf("整数b:"); scanf("%d", &b);

    printf("%.2f的%d次幂是%.2f。\n", a, b, power(a, b));

    return 0;
}
```

形参x被赋上实参a的值，形参n 被赋上实参b的值，像这样通过值来进行参数传递的机制称为**值传递(pass by value)**。

这就相当于我们复印一本书，在复印版的书上用红色铅笔写写画画，不会对原来那本书造成任何影响。

形参x是实参a的副本，形参n是实参b的副本。因此，在被调用一方的函数power中，即使改变所接收的形参的值，调用一方的实参也不会受到影响。

函数power执行结束时，power里 n 的值变为-1，而调用方main函数的变量 b 的值并不会变为0。

## 作业

**● 练习 1**

创建一个函数，返回三个int型整数中的最小值。

```c
int min3(int a,int b,int c){/*...*/}
```

**● 练习 2**

```
//创建一个函数，返回int型整数的立方。
int cube(int x){/** * * */}
```

**● 练习 3**

>创建一个函数，返回1到n之间所有整数的和。
>```
>int sumup(int n){/*...*/}
>```', 1, 2, NULL, '2020-05-21 18:21:32.986542', '2020-05-21 18:21:32.986542', 58);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (60, '函数的设计', NULL, 10, NULL, NULL, '上一节中我们学习了函数定义和函数调用相关的基础知识。本节我们来学习更为正式的函数创建方法等。

## 有返回值的函数

我们编写了一段可以通过排列\*显示出等腰直角三角形的程序。把连续显示任意个 * 的部分单独做成一个函数，并通过调用它来显示出一个直角在左下方的等腰直角三角形。完成后的程序如代码清单 demo1.c 所示。

**代码清单 demo1.c**

```c
/*
显示出一个直角在左下方的等腰直角三角形（函数）
*/
#include <stdio.h>

/*连续显示出n个‘*’*/
void put_stars(int n) {
    while (n-- > 0)
        putchar(''*'');
}

int main() {
    int i, len;

    printf("生成一个直角在左下方的等腰直角三角形。\n");
    printf("短边：");
    scanf("%d", &len);

    for (i = 1; i <= len; i++) {
        put_stars(i);
        putchar(''\n'');
    }

    return 0;
}
```

本函数只是用来进行显示的，因此没有需要返回的结果。这种没有返回值的函数类型，要明为**void**。

>► void就是“空”的意思。在C语言中.不论有没有返回值都同样称为函数。而在其他编程语言中，没有返回值的会定义为其他非函数的概念.例如子程序(Fortran)或者过程(Pascal)。

## 通用性

通过使用函数 put_stars 可以把用于显示三角形的二重循环简化为一重循环，从而提高程序的可读性。

显示直角在右下方的等腰直角三角形的程序如代码清单 demo2.c 所示。

**代码清单 demo2.c**

```c
/* 显示出一个直角在右下方的等腰直角三角形（函数） */
#include <stdio.h>

/*连续显示出n个字符ch*/
void put_chars(int ch, int n) {
    while (n-- > 0)
        putchar(ch);
}

int main() {
    int i, len;

    printf("生成一个直角在右下方的等腰直角三角形。\n");
    printf("短边：");
    scanf("%d", &len);

    for (i = 1; i <= len; i++) {
        put_chars('' '', len - i);
        put_chars(''*'', i);
        putchar(''\n'');
    }

    return 0;
}
```


本程序还需要连续显示空白字符，因此需要创建另一个函数put_chars来代替函数putstars。该函数可以连续显示出n个通过形参传递来的字符。

>► 之前给大家介绍过字符常量是int型。除此之外，还存在显示字符的char型。关于char型我们将会在下一章进行说明。

函数 put_chars 和只能显示 * 的函数 put_stars 比起来，具有更加通用的优势。

当然，如果有必要的话，我们也可以这样定义函数 put_stars (不用说，还是需要使用函数put_chars)。

```c
void put_stars(int n) {
    put_chars(''*'', n);
}
```

## 不含形参的函数

输入一个正整数并显示其倒转之后的值，程序如代码清单 demo3.c 所示

**代码清单 demo3.c**

```c
/* 逆向显示输入的正整数 */
#include <stdio.h>

/*返回输入的正整数*/
int scan_pint(void) {
    int tmp;

    do {
        printf("请输入一个正整数：");
        scanf("%d", &tmp);
        if (tmp <= 0)
            puts("请不要输入非正数！！！");
    } while (tmp <= 0);

    return tmp;
}

/*返回正整数倒转后的值*/
int rev_int(int num) {
    int tmp = 0;
    
    if (num > 0) {
        do {
            tmp = tmp * 10 + num % 10;
            num /= 10;
        } while (num > 0);
    }
    return tmp;
}

int main() {
    int nx = scan_pint();//不赋予实参
    printf("该整数倒转后的值是%d。\n", rev_int(nx));
    return 0;
}
```

函数scan_pint读取从键盘输入的正整数并返回。该函数不接收形参，为了加以说明,在小括号中写入了void。

当然，因为调用方也没有必要赋予实参，所以函数调用运算符()中是空的。

>► 固定程序int main()表示main函数不包含形参(另外也存在包含形参的main函数)。

## 函数返回值的初始化

请大家注意main函数中声明变量nx的部分。该变量的初始值是函数scan_pint()的调用表达式。变量nx使用函数的返回值(程序执行时从键盘输入的非负的整数值)进行初始化。

>► 但是.这种初始化方法只适用于拥有自动存储期的对象(将在下节介绍)，不适用于拥有静态存储期的对象

## 作用域

函数 scan_pint 和函数 rev_int 都包含一个拥有相同标识符(名称)的变量tmp,但它们却是各自独立的不同变量。

也就是说，函数scan_pint中的变量tmp是函数scan_pint特有的变量，而函数rev_int中的变量tmp是函数rev_int中特有的变量。

赋给变量的标识符，它的名称都有一个通用的范围，称为**作用域(scope)**。

在程序块(复合语句)中声明的变量的名称，只在该程序块中通用，在其他区域都无效。也就是说，变量的名称从变量声明的位置开始，到包含该声明的程序块最后的大括号}为止这一区间内通用。这样的作用域称为**块作用域(block scope)**。

## 文件作用域

输入5名学生的分数，显示出其中的最高分。程序如代码清单 demo4.c所示。

**代码清单 demo4.c**

```c
/*
计算最高分
*/
#include <stdio.h>

#define NUMBER 5 /*学生人数*/

int scores[NUMBER]; /*数组定义【1】*/

int top(void); /*函数top的函数原型声明【2】*/

int main() {
    extern int scores[]; /*数组的声明（可以省略）【3】*/
    int i;

    printf("请输入%d名学生的分数\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("%d:", i + 1);
        scanf("%d", &scores[i]);
    }

    printf("最高分=%d\n", top());

    return 0;
}

/*返回数组scores的最大值*/
int top(void) {
    extern int scores[]; /*数组的声明（可以省略）【4】*/
    int i;
    int max = scores[0];

    for (i = 1; i < NUMBER; i++) {
        if (scores[i] > max)
            max = scores[i];
    }
    return max;
}
```

在函数的程序块中声明的变量等标识符是该程序块特有的部分。而像数组scores这样，在函数外声明的变量标识符，其名称从声明的位置开始，到该程序的结尾都是通用的。

这样的作用域称为**文件作用域(file scope)**。

## 声明和定义

程序中【1】处的声明，创建了一个元素数为5、元素类型为int的数组scores。像这样创建变量实体的声明称为**定义(definition)**声明。另外，使用了**extern**的【3】和【4】处的声明表示“使用的是在某处创建的scores”。这里并没有真正创建出变量的实体，因此称为**非定义声明**。

由于数组scores是在函数外定义的，所以只需要在main函数或函数top中明确声明要使用它，就可以放心地用了。

>► 由于数组scores被赋予了文件作用域.因此在main函数和函数top中无需特意声明，可以直接使用。也就是说，程序中【3】和【4】处可以省略。

## 函数原型声明

和我们人类一样，编译器在读取数据时，也是按照从头到尾的顺序依次读取的。因为本程序中函数top的函数定义在main函数后，所以要想在main函数中调用top函数，编译器(我们人类也一样)就需要知道
> 函数top无需参数，并且会返回int型的值。

因此需要使用【2】处的声明。

像这样明确记述了函数的返回类型，以及形参的类型和个数等的声明称为**函数原型声明(function prototype declaration)**。

>► 需要注意的是该声明要以分号结尾。

函数原型声明只声明了函数的返回值和形参等相关信息，并没有定义函数的实体。函数定义和函数原型声明的不同之处如下所示。

* 函数top的函数定义......定义声明
* 函数top的函数原型声明......非定义声明


另外，如果函数top的需求(返回值的类型和形式参数等)发生了改变，那么函数定义和函数原型声明两部分都必须进行修改。

> 在编写程序的时候，如果把函数top的函数定义放在main函数之前，就不用特意使用函数原型声明了。

—般情况下，把main函数放在程序最后的位置，而把将被调用的函数放在程序前部是比较好的选择。

## 头文件和文件包含指令

通过函数原型声明，可以指定函数的参数以及返回值的类型等信息，这样就可以放心地调用该函数了。

库函数 printf 或者 putchar 等的函数原型声明都包含在<stdio.h>中，因此必须要使用下述固定的指令。

```c
#include <stdio.h>  /* 包含头文件<stdio.h> */
```

通过#include指令，就可以把<stdio.h>中的全部内容都读取到程序中。

包含库函数的函数原型声明的<stdio.h>称为**头文件(header)** ，而取得头文件内容的 #include 指令称为**文件包含指令**。

例如，putchar函数的函数原型声明在头文件<stdio.h>中的声明格式如下所示。

```c
int putchar(int _c);
```
编译器不同，形参的名称也有可能不同。

另外，由于可以在函数原型声明的时候不指定形参的名称，所以下面这样的声明也是可以的。

```c
int putchar(int);
```

## 数组的传递
上一小节中我们所提到的满足条件的程序就如代码清单 demo5.c 所示。

>► 数学和英语的数组的元素个数.都是NUMBER,即5。而函数max_of的元素个数则是任意的。

**代码清单 demo5.c**

```c
/*
计算英语分数和数学分数中的最高分
*/
#include <stdio.h>

#define NUMBER 5

/*返回元素个数为n的数组v中的最大值*/
int max_of(int v[], int n) {
    int i;
    int max = v[0];

    for (i = 1; i < n; i++)
        if (v[i] > max)
            max = v[i];
    return max;
}

int main() {
    int i;
    int eng[NUMBER];
    int mat[NUMBER];
    int max_e, max_m;

    printf("请输入%d名学生的分数。\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("[%d]英语：", i + 1); scanf("%d", &eng[i]);
        printf("   数学："); scanf("%d", &mat[i]);
    }

    max_e = max_of(eng, NUMBER);
    max_m = max_of(mat, NUMBER);

    printf("英语的最高分=%d\n", max_e);
    printf("数学的最高分=%d\n", max_m);

    return 0;
}
```

函数max_of的动作如下所示。

>找出包含任意个元素的int型数组中元素的最大值，然后返回该值。

像函数top—样，无需使用 scores 或者 NUMBER 等特定的名称就可以进行说明了。请大家注意下述事项。

>■注意■ 进行函数设计的时候，应该尽量提高其通用性。

这样一来，就可以更加简洁地说明函数功能。

在代码清单 demo5.c 的程序中，使用数组eng来存储英语的分数，使用数组mat来存储数学的分数。它们的最高分分别保存在变量max_e和max_m中。

就像之前说明的那样，函数 max_of 可以处理任意的数组(当然数组的元素个数也是任意的)。在本程序中我们使用该函数计算英语和数学分数中的最高分，而其实除了分数之外，例如体重和身高等，只要是int型的数组都可以处理，而且其元素个数也是任意的。

另外，函数 max_of 中用来存储分数的数组形参v的元素个数是通过接收到的n来设定的。该函数的函数头如下所示。

```c
int max_of(int v[], int n)
```

接收数组的形参的声明为 **“类型名 参数名[]”** ，使用别的形参(这里是n)来接收元素个数。另外，调用函数时使用的实参，只要写明数组的名称就可以了。我们可以像下面这样理解。

>在main函数中传递数组eng(或者mat)给函数max_of,函数max_of使用名称v来接收这个数组。

因此，函数调用表达式max_of(eng, NUMBER)调用的函数max_of中，v[0]代表eng[0]的内容，v[1]代表eng[1]的内容。

## 多维数组的传递

前面我们学习过：求两个二维数组的所有元素的和并显示的程序。接下来，我们将求和的部分和进行显示的部分，分别以独立的函数来实现。程序如代码清单 demo9.c 所示。

**代码清单 demo9.c**

```c
/*
求4名学生在两次考试中3门课程的总分并显示（函数）
*/
#include <stdio.h>

/*将4行3列矩阵a和b的和存储在c中*/
void mat_add(const int a[4][3], const int b[4][3] , int c[4][3]) {
    int i, j;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 3; j++)
            c[i][j] = a[i][j] + b[i][j];
}

/*显示4行3列矩阵*/
void mat_print(const int m[4][3]) {
    int i, j;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++)
            printf("%4d", m[i][j]);
        putchar(''\n'');
    }
}

int main() {
    int i, j;
    int scores1[4][3] = {{91, 63, 78}, {67, 72, 46}, {89, 34, 53}, {32, 54, 34}};
    int scores2[4][3] = {{97, 67, 82}, {73, 43, 46}, {97, 56, 21}, {85, 46, 35}};
    int sum[4][3];

    mat_add(scores1, scores2, sum);/*求两次考试的分数之和*/

    puts("第一次考试的分数"); mat_print(scores1); /*显示第一次考试的分数*/

    puts("第二次考试的分数"); mat_print(scores2); /*显示第二次考试的分数*/

    puts("总分"); mat_print(sum); /*显示总分*/

    return 0;
}
```

## 推敲：多维数组的传递

接收多维数组的函数，可以省略相当于开头下标的n维的元素个数。但是，(n-1)维之下的元素个数必须是常量。

下面是接收一维数组~三维数组的参数的声明示例-

```c
void func1(int v[], int n),/*元素类型为int、元素个数随意（n）*/
void func2(int v[][3], int n);/*元素类型为int[3]、元素个数随意（n）*/
void func3(int v[][2][3], int n);/*元素类型为int[2][3]、元素个数随意(n)*/
```
所接收的数组的元素类型必须固定，但元素个数是自由的。

代码清单 demo10.c 的程序就利用了这一特点。

**代码清单 demo10.c**

```c
/*
将n行3列的二维数组的所有构成元素赋上同样的值
*/
#include <stdio.h>

/*将v赋值给元素类型为int[3]、元素个数为n的数组m的所有构成元素*/
void fill(int m[][3], int n, int v) {
    int i, j;
    for (i = 0; i < n; i++)
        for (j = 0; j < 3; j++)
            m[i][j] = v;
}

/*显示4行3列矩阵*/
void mat_print(const int m[][3], int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < 3; j++)
            printf("%4d", m[i][j]);
        putchar(''\n'');
    }
}

int main() {
    int no;
    int x[2][3] = {0};
    int y[4][3] = {0};

    printf("赋值给所有构成元素的值：");
    scanf("%d", &no);

    fill(x, 2, no);
    fill(y, 4, no);

    printf("  --- x ---\n"); mat_print(x, 2);
    printf("  --- y ---\n"); mat_print(y, 4);

    return 0;
}
```
函数fill和函数mat_print接收的参数m的二维的元素个数(行数)被省略，一维的元素个数 (列数)变成了3。因此，对这些函数，可以传递行数 任意、列数为3的数组 (本程序中传递的是2行3列的数组和4行3列的数组)。

## 作业

**● 练习 1**

>创建一个函数，在屏幕上显示出“你好。”并换行。
>
>```c
>void hello(void){/*...*/}
>```

**● 练习 2**

>创建一个函数，返回元素个数为n的int型数组v中的最小值。
>
>```c
>int min_of(const int v[]，int n){/*...*/}
>```

**● 练习 3**

>创建一个函数，对元素个数为n的int型数组v2进行倒序排列，并将其结果保存在数组v1中。
>
>```c
>void intary_rcpy(int v1[],const int v2[],int n){/*...*/}
>```


**● 练习 4**

>创建一个函数search_idx,将和有n个元素的数组v中的key相等的所有元素的下标存储在数组idx中，返回和key相等的元素的个数。
>
>```c
>int search_idx(const int v[] int idx[],int key,int n);
>```

**● 练习 5**

>创建一个函数，将4行3列矩阵a和3行4列矩阵b的乘积，存储在3行3列矩阵c中。
>
>```c
>void mat_mul(const int a[4][3],const int b[3][4],int c[3][3]){/*...*/}
>```', 2, 2, NULL, '2020-05-21 18:21:33.01341', '2020-05-21 18:21:33.01341', 58);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (61, '作用域和存储期', NULL, 10, NULL, NULL, '要创建大规模程序，必须首先理解作用域和存储期。本节我们就来学习相关内容

## 作用域和标识符的可见性

在代码清单 demo1.c 的程序中对变量x的声明总共有三处。

**代码清单 demo1.c**

```c
/*
确认标识符的作用域
*/
#include <stdio.h>

int x = 75;    //【A】：文件作用域

void print_x(void) {
    printf("x = %d\n", x);
}

int main() {
    int i;
    int x = 999;    //【B】：块作用域

    print_x();    //【1】

    printf("x = %d\n", x);    //【2】

    for (i = 0; i < 5; i++)
    {
        int x = i * 100;    //【C】：块作用域
        printf("x = %d\n", x);    //【3】

    }

    printf("x = %d\n", x);    //【4】

    return 0;
}
```


我们来看—下【A】处声明的x。该变量的初始值为75,因为它是在函数外面声明定义的，所以这个x拥有文件作用域。

因此，函数print_x中的“x”就是上述的x,程序执行后，屏幕上会输出

>x=75....显示的是x的值

因为【1】处调用了函数printf_x所以首先会进行上面的显示。

然后我们再来看【B】处声明的x。由于它是在main函数的程序块也就是复合语句中声明的，所以这个名称在main函数结尾的大括号}之前都是通用的。

存在两个相同名称的“x”，适用以下规则。

**■注意■**

>
>如果两个同名变量分别拥有文件作用域和块作用域，那么只有拥有块作用域的变量是“可见”的，而拥有文件作用域的变量会被“隐藏”起来。
>由于【2】处的“x”就是x,因此x的值显示为
>
>X=999....显示的是x的值
>
>在main函数的for语句中声明定义了第三个变量x。这里适用以下规则。

**■注意■**

>当同名变量都被赋予了块作用域的时候，内层的变量是“可见”的，而外层的变量会被“隐藏”起来。

综上所述，for语句循环体这个程序块中的“x”实际上就是上述第三个变量x。由于for语句的循环执行了5次，因此H处x的值显示为

```c
x=0....显示的是x的值x=100
x=100
x=200
x=300
x=400
```
for语句的循环结束之后，该变量x的名称就会失效。因此，在调用最后一个printf函数的【4】处，x的值显示为

```c
x=999....显示的是x的值
```
被声明的标识符从其名称书写出来之后生效。

因此，即使把【B】处对x的声明修改为int x=x;,作为初始值的“x”也是被声明出来的x,而不是拥有文件作用域的在【A】处声明的那个x。因此，x的初始值不是75,而是被初始化为不确定的值。

## 存储期

在函数中声明的变量，并不是从程序开始到程序结束始终有效的。变量的生存期也就是寿命有两种，它们可以通过 **存储期(storage duration)** 这个概念来体现。

下面就通过代码清单 demo2.c 中的程序来具体说明。

在函数func中声明了sx和ax两个变量。但是，声明sx的时候我们使用了**存储类说明符(storage duration specifier)static**。可能正因为如此，虽然是用相同的值进行初始化并递增的，但最终ax和sx的值并不相同。

### ■ 自动存储期
在函数中不使用存储类说明符static而定义出的对象(变量)，被赋予了**自动存储期(automatic storage duration)**,它具有以下特性。

程序执行到对象声明的时候就创建出了相应的对象。而执行到包含该声明的程序块的结尾，也就是大括号}的时候，该对象就会消失。

也就是说，该对象拥有短暂的寿命，另外，如果不显式地进行初始化，则该对象会被初始化为不确定的值。

被赋予自动存储期的对象，在程序执行到int ax=0;的时候，就被创建出来并且进行初始化。

### ■ 静态存储期

在函数中使用**static**定义出来的对象，或者在函数外声明定义出来的对象都被赋予了**静态存储期(static storage duration)**，它具有以下特性。

在程序开始执行的时候，具体地说是在main函数执行之前的准备阶段被创建出来，在程序结束的时候消失。

也就是说，该对象拥有“永久”的寿命。另外，如果不显式地进行初始化，则该对象会自动初始化为0。

被赋予了静态存储期的对象，会在main函数开始执行之前被初始化。因此，虽说程序执行的时候会经过static int sx = 0;的声明，但其实那个时候并没有进行初始化处理，也就是说该声明并未执行赋值处理。

**代码清单 demo2.c**

```c
/*
自动存储期和静态存储期
*/
#include <stdio.h>

int fx = 0;

void func(void) {
    static int sx = 0;
    int ax = 0;

    printf("%3d%3d%3d\n", ax++, sx++, fx++);
}

int main() {
    int i;

    puts(" ax sx fx");
    puts("----------");
    for (i = 0; i < 10; i++)
        func();
    puts("----------");

    return 0;
}
```

表 A 中总结了两种存储期的性质。

**■表 A对象的存储期**

||自动存储期|静态存储期|
|---|---|---|
|生成|程序执行到对象声明的时候创建出相应的对象|在程序开始执行的时候被创建出来|
|初始化|如果不显式地进行初始化，则该对象会被初始化为不确定的值|如果不显式地进行初始化，则该对象会被初始化为0|
|消失|执行到包含该声明的程序块的结尾时，该对象就会消失|在程序结束的时候消失|

>► 在函数中通过存储类说明符auto或者register声明定义出的变量，也被赋予了自动存储期。通过auto int ax=0;进行的声明和不使用auto进行的声明在编译的时候是完全相同的。因此auto就显得有些多余了。
>
>另外，使用register逬行的声明register int ax = 0;，在源程序编译的吋候，变量ax不是保存在内存中，而是保存在更高速的寄存器中。然而，由于寄存器的数量有限，所以也不是绝对的。
>
>现在的编译技术已经十分先逬了，哪个变置保存在寄存器中更好都是通过编译自行判断并逬行最优化处理的(不仅如此，保存在寄存器中的变量在程序执行的吋候也可能发生改变)。
>
>使用register逬行声明也渐渐变得没有意义了。

在理解以上两个存储期的含义的基础之上，我们研究一下程序的处理流程。

**a.** main函数执行之前的状态。拥有静态存储期的变量fx和sx,在程序开始的时候被创建出来，并被初始化为0。在程序执行的整个过程中，它们会一直存在在同一个地方。

**b.** 当main函数开始执行的时候，创建出了拥有自动存储期的变量i

**c.** 在main函数中调用函数func的时候，创建了变量ax并将其初始化为0。这样，变量ax、sx、fx的值分别是0 0 0。之后这三个量全都会自动增加为1。

**d.** 当函数func执行结束的时候变量ax就消失了。

**e.** main函数中的变量i自动增加，然后再调用函数func。这时变量ax再次被创建出来并被量的初始化为0。于是这三个变量的值分别为0 1 1。在显示处理结束之后，这些变值自动增加为1、2、2。main函数总共调用了10次函数func,拥有“永久”寿命的变量fx和sx会一直自动增加。而只存在于函数func中的变量ax,由于每次创建的时候都被初始化为0，因此被创建了10次之后，它的值还是0。

**f.** main函数执行结束的同时，变量i也会消失。


我们可以通过代码清单 demo3.c 中的程序，来确认拥有静态存储期的对象是否会被自动初始化为0。

**代码清单 demo3.c**

```c
/*
确认拥有静态存储期的对象的默认的初始化
*/
#include <stdio.h>

int fx;

int main() {
    int i;
    static int si;
    static double sd;
    static int sa[5];

    printf("fx = %d\n", fx);
    printf("si = %d\n", si);
    printf("sd = %f\n", sd);

    for (i = 0; i < 5; i++)
        printf("sa[%d] = %d\n", i, sa[i]);

    return 0;
}
```

由此可见，拥有静态存储期的int类型的fx和si、double类型的sd、int型数组的所有元素 `sa[0] ,sa[1],...，sa[4]` 都是用 0 (或 0.0 )初始化的。

## 作业

**● 练习 1**

>编写一段程序，为double型数组的所有元素分配静态存储期，并确认它们都被初始化为0.0

**● 练习 2**

>创建函数put_count，显示被调用的次数(如下显示的是调用3次函数put_count的运行结果)
>
>```c
>void put_count() {/*...*/}
>```
>
>```
>put_count:第一次
>put_count:第二次
>put_count:第三次
>```', 3, 2, NULL, '2020-05-21 18:21:33.03829', '2020-05-21 18:21:33.03829', 58);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (62, '基本数据类型', NULL, 10, NULL, NULL, '', 7, 1, NULL, '2020-05-21 18:21:33.064457', '2020-05-21 18:21:33.064457', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (63, '基本数据类型和数', NULL, 10, NULL, NULL, '本章的目的是学习基本数据类型。在此之前，本节我们先来学习“数”。

## 算数类型和基本数据类型

经过前几章的学习，我们知道可以对int型和double型的变量及常量进行加减等算术运算。这种数据类型称为**算术类型(arithmetic type)**。算术类型是多种数据类型的统称大体上可分为以下两种类型：

整数类数据类型(integral type):只表示整数

浮点型(floating type):可表示具有小数部分的数值

**算术类型**

* 整数类数据类型
    * 枚举类型 enum ... 型
    * 字符型
       * char 型
       * signed char 型
       * unsinged char 型
    * 整型
       * signed short int 型
       * unsigned short int 型
       * signed int 型
       * unsigned int 型
       * signed long 型
       * unsigned long 型
* 浮点型
    * float 型
    * double 型
    * long double 型

前者(整数类数据类型)是以下数据类型的统称。

* 枚举型(enumeration type)※在下一章学习
* 字符型(character type):表示字符
* 整型(integer type):表示整数

字符型、整型和浮点型只需使用int或double等关键字就能表示其数据类型，因此将它们统称为**基本数据类型(basic type)**。

## 基数

我们先来学习整数。

我生于1963年——这种数值表现形式很常见，众所周知这是以10为基数的**十进制数**„

>► 在表示数值的时候.基数是进位的基准。基数为10的十进制数，每逢10或10的倍数进位。

不过，在大家使用的电子计算机中所有数据都是用ON/OFF信号(即1和0)来表示的。对我们来说最容易理解的是十进制数，而对计算机来说以2为基数的**二进制数**则更易于理解。

虽说如此，假如我们将所有数值都用二进制数来表示可就太费力劳神了。如果只能使用二进制数，那么在自我介绍时就必须得说“我生于11110101011年”了。

且不说这样的数值如何，就接近硬件底层的程序来说，使用二进制数会更加适宜。二进制数固然有其优点，却也存在位数过多处理不便的问题，所以在写法上还使用了**八进制数**和**十六进制数**。

在十进制数中，如果以下10种数字都用完了，就进位为10。

```
0 1 2 3 4 5 6 7 8 9      1位十进制数
```

在此之后，若2位的10〜99也用完了，就会进位为100。

同样，在八进制数中，用完以下8种数字后就进位为10。

```
0 1 2 3 4 5 6 7     1位八进制数
```

当然，若2位的10〜77也用完了，就进位为100。

以此类推，在十六进制数中使用以下16种数字，那么F后面的数就是10。

```
0 1 2 3 4 5 6 7 8 9 A B C D E F     1位十六进制数
```

另外，如果2位的10-FF用完了，还会再进一位，变为100。

如下所示，将十进制数0〜20分别用八进制、十进制和十六进制数表示。

```
八进制数   0 1 2 3 4 5 6 7 10 11 12 13 14 15 16 17 20 21 22 23 24……
十进制数   0 1 2 3 4 5 6 7  8  9 10 11 12 13 14 15 16 17 18 19 20……
十六进制数 0 1 2 3 4 5 6 7  8  9  A  B  C  D  E  F 10 11 12 13 14……
```
二进制只使用0和1两种数字表示数值。

```
0 1       1位二进制数
```
因此，将十进制的0〜13用二进制表示就是:
```
0 1 10 11 100 101 110 111 1000 1001 1010 1011 1100 1101
```

## 基数转换

接下来我们学习不同基数间的整数值相互转换的方法。

**■由八进制数、十六进制数、二进制数向十进制数转换**

十进制数的每一位都是10的指数幂。所以1998可以解释为

>1998 = 1 x 10<sup>3</sup> + 9 x 10<sup>2</sup>+9 x 10<sup>1</sup> + 8 x 10<sup>0</sup>

将这个思路应用于八进制数、十六进制数和二进制数上，就能轻松地将这些数转换为十进制数。

举例来说，将八进制数123转换为十进制数的步骤如下:

>123 = 1X8<sup>2</sup> + 2X8<sup>1</sup> + 3X8<sup>0</sup>
    = 1X64 + 2X8 + 3X1
    = 83

而将十六进制数1FD转换为十进制数的步骤如下:

>1FD = 1X16<sup>2</sup> + 15X16<sup>1</sup> + 13X16<sup>0</sup>
    = 1X256 + 15X16 + 13X1
    = 509

将二进制数101转换为十进制数的步骤如下:

>101 = 1X2<sup>2</sup> + 0X2<sup>1</sup> + 1X2<sup>0</sup>
    = 1X4 + 0X2 + 1X1
    = 5

**■由十进制数向八进制数、+六进制数、二进制数转换**

二进制数有以下规律
>偶数的末位数字为0。
>
>奇数的末位数字为1。

也就是说，用要转换的数除以2所得的余数就是末位数字的值。

例如，十进制数57除以2的余数为1,那么转换后的二进制数的末位数字就是1，这一点只要稍作计算就能明白了。

在继续十进制数转二进制数的话题之前，我们先对“十进制数转换为十进制数”的方法作一下说明。一个数除以10的余数，与这个数的末尾数字相等。例如，1962除以10的余数为2,与末位数字2相等。

此处除法运算1962/10的商为196,也就是1962右移1位后的值(删去末位的2)。即十进制数除以10的意思就是右移1位。接着用196除以10,得到的余数6就是倒数第2位的值。继续将此时的商19除以10......

将一个数除以10,求得商和余数，再对商作同样的除法计算。重复这一过程，直到商为0为止，最后将求得的所有余数逆向排列，就得到了转换后的十进制数(图A)。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-2.png?x-oss-process=image/resize,w_200/sharpen,100)  
**图A 将十进制数1962转换为十进制数**

![image](https://img-camp.banyuan.club/cc001/chapter7/7-3.png?x-oss-process=image/resize,w_200/sharpen,100)

**图B 将十进制数57转换为二进制数**

在上述步骤中，将10改为2就是“十进制数转二进制数”的方法了。因为用一个数除以2就相当于将它的二进制数右移1位。

现在我们回到将十进制数57转换为二进制数的话题。用57除以2，商为28,余数为1。再用商28除以2,得到商14和余数0。反复这一步骤，直到商为0为止，将所有余数逆向排列就得到了结果111001(图B)。

当然，转换为十进制数、八进制数、十六进制数的步骤是完全相同的。只要将除数改为8或16,最后排列余数就行了。

十进制数57转换为八进制数为71(图C),转换为十六进制数为39(图D)。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-4.png?x-oss-process=image/resize,w_200/sharpen,100)  
**图C 将十进制数57转换为八进制数**

![image](https://img-camp.banyuan.club/cc001/chapter7/7-5.png?x-oss-process=image/resize,w_200/sharpen,100)  
**图D 将十进制数57转换为十六进制数**

如表 A 所示，4位二进制数和1位十六进制数是相互对应的(即4位的二进制数0000~1111,就是1位的十六进制数0~F)。

**■ 表 A 二进制数和十六进制数的对应关系**

|二进制数|十六进制数|二进制数|十六进制数|
|:----:|:----:|:----:|:----:|
|0000|0|1000|8|
|0001|1|1001|9|
|0010|2|1010|A|
|0011|3|1011|B|
|0100|4|1100|C|
|0101|5|1101|D|
|0110|6|1110|E|
|0111|7|1111|F|
利用这一特性，二进制数转十六进制数、十六进制数转二进制数就很容易了。

例如，要将二进制数0111101010011100转换为十六进制数，只需每4位隔开一下，并分别转换为1位的十六进制数。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-99.png?x-oss-process=image/resize,w_300/sharpen,100)

另外，若要将十六进制数转换为二进制数，只需反过来操作即可(将十六进制数的1位转换为二进制的4位)。', 1, 2, NULL, '2020-05-21 18:21:33.091821', '2020-05-21 18:21:33.091821', 62);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (64, '整型和字符型', NULL, 10, NULL, NULL, 'C语言最擅长处理的是整型和字符型。本节我们就来学习这些数据类型。

## 整型和字符型

**整型(integer type)** 和 **字符型(charactor type)** 是用来表示限定范围内连续整数的数据类型。
假设某种数据类型表示10个连续的整数。如果只需表示非负整数(0和正整数)，那么这10个数可以是:

```
(a)0,1,2,3,4,5,6,7,8,9
```

如果又想使用负数，那就可以变为:

```
(b)-5,-4,-3,-2,-1,0,1,2,3,4
```
当然，这个范围也可以是-4至5。(b)虽然有能表示负数的优点，但它可表示的绝对值却几乎只有(a)的一半。

由此可知，如果事先确定要处理的数不会是负数，并且需要处理较大的数，那么使用(a)较为合适。

在C语言中处理整数时，可以根据用途和目的灵活使用以下数据类型:

>无符号整型(unsigned integer type) 表示0和整数的整型
>
>有符号整型(signed integer type) 表示0和正负数的整型

前者相当于(a),后者相当于(b)。

声明变量时，可以通过加上**类型说明符(type specifier)signed**或**unsigned**来指定其中一种数据类型。若不加类型说明符，则默认为有符号。例如:

```c
int          x; /*x是有符号的int型*/
signed int   y; /*y是有符号的int型*/
unsigned int z; /*z是无符号的int型*/
```
整数除了有符号和无符号的分类之外，还可以根据可表示的值的范围分为多种类型。

刚才以表示10个数字为例对整数进行了说明，实际上根据可以表示的数的个数可以将整型分为下述4种类型(C99标准还定义了longlong类型，其长度可以保证至少64位)。

```c
char  short  int  int  long  int
```

当然，这些数据类型都有对应的有符号版和无符号版。不过char型比较特殊，存在既不带signed又不带unsigned的“单独”的char型。

图 A是这些数据类型的汇总。

>► 与signed和unsigned相同，short和long也是一种类型说明符。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-6.png?x-oss-process=image/resize,w_700/sharpen,100)
**图A 表示整数的数据类型分类**

类型名方面存在下列规则。

■ 对于单独的short和long,可以认为是省略了int。

■ 对于单独的signed和unsigned,可以认为是(非short和long的)int。

表A中对这一关系进行了总结。表中同一行代表同一种数据类型。例如，倒数第二行的signed long int和signed long和long int和long,都是同一种类型。接下来我们将使用最简短的表示方法，即各行最右边的写法。

**■表 A 字符型、整型的名称和简称**

**▷ 字符型**

    char
    signed char
    unsigned char

**▷ 整型**

    signed short int   | signed short   | short int | short
    unsigned short int | unsigned short |
    signed int         | signed         | int       |
    unsigned int       | unsigned       |
    signed long int    | signed long    | long int  | long
    unsigned long int  | unsigned long  |

## \<limits.h>头文件
我们已经知道，字符型和整型包含多种类型，而各种数据类型可表示的数值的范围是怎样的呢?

表A 中对各种数据类型可表示的数值的范围(最小值和最大值)进行了总结。

**■表A 字符型和整型能表示的数值的范围(标准C语言中确保的值)**

|数据类型|最小值|最大值|
|:---:|:---:|:---:|
|char|0|255|
|char|-127|127|
|signed char|-127|127|
|unsigned char|0|255|
|short|-32767|32767|
|int|-32767|32767|
|long|-2147483647|2147483647|
|unsigned short|0|65535|
|unsigned|0|65536|
|unsigned long|0|4294967295|

实际上，各种数据类型具体能表示多少个数值因编译器而异。表中显示的是最低限度的范围。很多编译器还可以表示超出本表范围的值。


C语言编译器在 `<limits.h>` 头文件中以宏定义的形式定义了字符型以及其他整型所能表示的数值的最小值和最大值。

如下所示为本书设定的\<limits.h>的部分内容。

**■ 本书设定的 `<limits.h>`的部分内容**

```c
#define UCHAR_MAX 255U         /*unsigned char的最大値*/
#define SCHAR_MIN -128         /*signed char的最小值*/
#define SCHAR_MAX +127         /*signed char的最大值*/
#define CHAR_MIN 0             /*char的最小值*/
#define CHAR_MAX UCHAR_MAX     /*char的最大值*/
#define SHRT_MIN -32768。      /*short的最小值*/
#define SHRT_MAX +32767        /*short的最大值*/
#define USHRT_MAX 65535U       /*unsigned short的最大值*/
#define INT_MIN -32768         /*int的最小值*/
#define INT_MAX +32767         /*int的最大值*/
#define UINT_MAX 65535U        /*unsigned的最大值*/
#define LONG_MIN -2147483648L  /*long的最小值*/
#define L0NG_MAX +2147483647L  /*long的最大值*/
#define ULONG—MAX 4294967295UL /*unsigned long的最大値*/
```

>► 关于部分整型常量后面附带的U、L等符号，我们将在后面学习。

通过调查这些宏的值，就可以判定自己使用的编译器中各数据类型所能表示的数值范围。请看代码清单 demo1.c 的程序。

**代码清单 demo1.c**

```c
/*
显示字符型和整数型数据类型的表示范围
*/
#include <stdio.h>
#include <limits.h>

int main() {
    puts("该环境下各字符型、整型数值的范围");
    printf("char           :%d~%d\n", CHAR_MIN, CHAR_MAX);
    printf("signed char    :%d~%d\n", SCHAR_MIN, SCHAR_MAX);
    printf("unsigned char  :%d~%d\n", 0, UCHAR_MAX);

    printf("short          :%d~%d\n", SHRT_MIN, SHRT_MAX);
    printf("int            :%d~%d\n", INT_MIN, INT_MAX);
    printf("long           :%ld~%ld\n", LONG_MIN, LONG_MAX);

    printf("unsigned short :%u~%u\n", 0, USHRT_MAX);
    printf("unsigned       :%u~%u\n", 0, UINT_MAX);
    printf("unsigned long  :%lu~%lu\n", 0l, ULONG_MAX);

    return 0;
}
```

刚开始学scanf函数时，我们提到“int型能够存储的数值是有限的，不能读取极其大的数值或非常小的负数”。

而执行本程序后，将显示各数据类型所能存储的值(和键盘输入的值一致)的范围。

>► 运行结果因编译器和运行环境而异。

## 字符型

char型是用来保存“字符”的数据类型。

对于没有声明signed和unsigned的char型，视为有符号类型还是无符号类型，由编译器而定。为了弄清楚这一点，我们来创建一个对此进行判定的程序。程序如代码清单 demo2.c所示。

>►运行结果因编译器和运行环境或有不同。

**代码清单demo2.c**

```c
/*
判断char型有无符号
*/
#include <stdio.h>
#include <limits.h>

int main() {
    printf("这个编译器中的char型是：");

    if (CHAR_MIN)
        puts("有符号的。");
    else
        puts("无符号的。");

    return 0;
}
```

char型所能表示的范围，是以下两者中的一个。

* [a]如果char型为有符号类型，则和signed char型的范围一样。
* [b]如果char型为无符号类型，则和unsigned char型的范围一样。

因此，采用[a]的编译器中，\<limits.h>的定义如下。

```c
#define CHAR_MIN SCHAR_MIN  /*与signed char的最小值相同*/
#define CHAR_MAX SCHAR_MAX  /*与signed char的最大值相同*/
```

另外，采用[B]的编译器中，&lt;limits.h&gt;的定义如下。

```c
#define CHAR_MIN 0         /*一定为0*/
#define CHAR_MAX UCHAR_MAX /*与unsigned char的最大值相同*/
```

因此，在这个程序中，通过对CHAR_MIN的值是否为0来判断char的类型。

>►本书中假定char型为无符号数据类型0

另外，通过之前的学习，我们己经知道‘C’和‘\n’等字符常量为int型。请注意它们不是char型(关于字符，我们将在下一章学习)。

## 位和CHAR_BIT

我们一直将变量当作保存数值的魔法盒。计算机中的所有数据都是用0和1(即“位”)的组合来表示的。所以在盒子的内部也是以0和1的位序列来表示数据的。

>► c语言中“位”(bit)的定义如下所示。
>
>“位”是具有大量内存空间的运行环境的数据存储单元，可保存具有两种取值的对象。对象中各二进制位的地址不需要表示。
>
>“位”可取两种值，其中一种是0。将位设为0以外的值，称为“设置位"

根据编译器的不同，Char型在内存上占据的位数也不同。该位数作为对象式宏CHAR_BIT定义`<limits.h>`中。下面是一个定义示例。

```
#define CHAR_BIT 8
```
如果CHAR_BIT为8,则char型的内部如图B所示。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-7.png?x-oss-process=image/resize,w_250/sharpen,100)

**图B char型的内部**

当然，能够用字符型表示的数值的范围，是依存于CHAR_BIT的。字符型和整型(int型、long型等)能够表示的数值范围之所以因编译器而异，是因为在内存上占据的位数因编译器而异。

## sizeof运算符

C语言中将表示字符的char型的长度定义为1。通过使用**sizeof运算符(sizeof operator)**，可以判断出包括char型在内的所有数据类型的长度，如表B所示。

**■表B sizeof运算符**

|---|---|---|
|---|---|---|
|sizeof运籯符|sizeof a|求a(对象、常量、类型名等)的长庠|


该运算符以字节(byte)为单位。

下面让我们使用sizeof运算符，来显示字符型和整型的长度。程序如代码清单 demo3.c所示。

**代码清单 demo3.c**

```c
/*
显示字符型和整型长度
*/
#include <stdio.h>

int main() {
    printf("sizeof(char)  = %u\n", (unsigned)sizeof(char));
    printf("sizeof(short) = %u\n", (unsigned)sizeof(short));
    printf("sizeof(int)   = %u\n", (unsigned)sizeof(int));
    printf("sizeof(long)  = %u\n", (unsigned)sizeof(long));

    return 0;
}
```

本书中所假定的整型对象的位数和字节数的关系示例如图C所示。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-8.png?x-oss-process=image/resize,w_700/sharpen,100)
**图C 整型的长度和内部示例**

>► 程序的运行结果因编译器和运行环境的不同而不同。但sizeof(char)必定为1。在该图中，CHAR_BIT为8.sizeof(short)和size(int)二者为2, sizeof(long)为4。

各种数据类型的有符号版和无符号版的长度相同。例如，sizeof(short)和sizeof(unsigned short)相等，sizeof(long)和sizeof(unsigned long)也相等。

另外，short、int和long具有以下关系。

```
sizeof(short)<=sizeof(int)<=sizeof(long)
```

即右侧的数据类型和左侧的数据类型相等，或者大于左侧的数据类型。

>► 根据编译器的不同，也有可能三者为同样长度。

## size_t型和typedef声明

由sizeof运算符生成的值的数据类型是在\<stddef.h>头文件中定义的size\_t型。在许多编译器中用 **typedef声明(typedef declaration)** 来定义size_t型。

```
typedef unsigned size_t;/*定义示例*/
```

如图D所示，typedef声明是创建数据类型的同义词的声明(而非创建新的数据类型)。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-9.png?x-oss-process=image/resize,w_350/sharpen,100)  
**图D typedef声明**

如图所示，为己有的类型A创建别名B。B将作为类型名使用。该名称一般称为typedef名。

sizeof运算符是不会生成负值的，所以将size_t定义为无符号整型的别名。这里展示的是将size_t作为unsigned型的同义语进行定义的例子。不过有些编译器可能会将size_t定义为unsigned short型或unsigned long型的同义词。

在显示size_t型数值时，必须像本程序这样进行类型转换。这是因为格式字符串内的转换说明必须和要显示的值的类型一致。

>► printf函数中的%u转换说明表示unsigned型的无符号整型数值。
>
>如果要在转换为unsigned long型的基础上进行显示，则应该像下面这样。
>
>printf("sizeof(int)=%lu\n",(unsigned long)sizeof(int));

## 整型的灵活运用
通常，int型是程序运行环境中最易处理并且可以进行高速运算的数据类型。在有些sizeof(long)大于sizeof(int)的编译器中，long型的运算比int型更耗时。因此只要我们不处理特别大的数值，还是尽量使用int型比较好。

我们己经学习了获取数据类型长度的sizeof运算符。该运算符的使用方法有以下两种。

* sizeof(类型名)
* sizeof表达式

如果想了解数据类型的长度，则使用前者:而如果想了解变量或表达式的长度，则使用后者。

>► 后者虽然不需要括起表达式的小括号，但这样可能不方便理解，因此本书中在表示吋都加上了括号。

显示int型和double型以及变量的长度的程序如代码清单 demo4.c所示。

**代码清单 demo4.c**

```c
/*
显示数据类型和变量的长度
*/
#include <stdio.h>

int main() {
    int na,nb;
    double dx,dy;

    printf("sizeof(int)          = %u\n", (unsigned)sizeof(int));
    printf("sizeof(double)       = %u\n", (unsigned)sizeof(double));

    printf("sizeof(na)           = %u\n", (unsigned)sizeof(na));
    printf("sizeof(dx)           = %u\n", (unsigned)sizeof(dx));

    printf("sizeof(na + nb)      = %u\n", (unsigned)sizeof(na + nb));
    printf("sizeof(na + dy)      = %u\n", (unsigned)sizeof(na + dy));
    printf("sizeof(dx + dy)      = %u\n", (unsigned)sizeof(dx + dy));

    return 0;
}
```

将sizeof运算符应用于数组，就可以得到数组整体的大小。让我们来看一个例子，如下所示。

```
inta[5]; /*int[5]型数组(元素类型为int型，元素个数为5的数组)*/
```

使用sizeof(a)求int[5]型数组的大小的情况下，如果是sizeof(int)为2的编译器，则结果为10;而如果是sizeof(int)为4的编译器，则结果为20。

用数组整体的大小除以一个元素的大小，得到的就是数组元素的个数。因此，数组a的元素个数，可以通过下式求得。

```
sizeof(a) / sizeof(a[0]）     求数组a的元素个数的表达式
```

当然，即使不通过数组a的元素类型和元素类型的大小，也可以求得元素个数。我们来看一下代码清单  demo5.c 的程序。

**代码清单 demo5.c**

```c
/*
求数组的元素个数
*/
#include <stdio.h>

int main() {
    int vi[10];
    double vd[25];

    printf("数组vi的元素个数 = %u\n", (unsigned)(sizeof(vi) / sizeof(vi[0])));
    printf("数组vd的元素个数 = %u\n", (unsigned)(sizeof(vd) / sizeof(vd[0])));

    return 0;
}
```

►数组vi和数组vd的元素个数分别通过以下表达式求得。

>```
>■sizeof(vi)/sizeof(int)
>■sizeof(i^d)/sizeof(double)
>```

但是我们应该避免使用这样的表达式来求元素个数。这是因为，如果要将数组的元素类型变为int型或double型之外的其他类型，就要对上面的表达式做出修改。

>**■注意■** 数组的元素个数可以通过sizeof(a)/sizeof(a[0])求得。

## 整型的内部表示

存储着变量(对象)的内存的位的意思(位和值的关系)因数据类型而异。

整型内部的位表示使用的是**纯二进制计数法(pure binary numeration system)**。但对于构成整型的位序列的解释，无符号类型和有符号类型是完全不同的。

下一节我们将详细介绍这方面的内容。

## 无符号整数的内部表示

无符号整数的数值在计算机内部是以二进制数来表示的，该二进制数与各二进制位一一对应。

这里以unsigned型的25为例来考虑。十进制数25用二进制数来表示是11001。如图E 所示，髙位补0后表示为0000000000011001。

>► 这里展示的是unsigned型为16位的编译器中的例子。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-11.png?x-oss-process=image/resize,w_350/sharpen,100)

**图E 16位的无符号整数中整数值25的内部表示**

将n位的无符号整数的各位从低位开始依次表示为B<sub>0</sub>,B<sub>1</sub>,B<sub>2</sub>,...B<sub>n-1</sub>，整数值可以通过下式求得。

>B<sub>n-1</sub>X2<sup>n-1</sup>+B<sub>n-2</sub>X2<sup>n-2</sup>+...+B<sub>1</sub>X2<sup>1</sup>+B<sub>0</sub>X2<sup>0</sup>

例如，位串为0000000010101011的整数为

>0 × 2<sup>15</sup> + 0 × 2<sup>14</sup> + ... + 0 × 2<sup>8</sup> + 1 × 2<sup>7</sup> + 0 × 2<sup>6</sup> + 1 × 2<sup>5</sup> + 0 × 2<sup>4</sup> + 1 × 2<sup>3</sup> + 0 × 2<sup>2</sup> + 1 × 2<sup>1</sup> + 1 × 2<sup>0</sup>


用十进制数表示为171。

在多数编译器中，整型占有的内存的位数都是8, 16, 32, 64...这样的8的倍数。这些位数的无符号整数能够表示的最小值和最大值分别如表C所示。

**■表C 无符号整数的表示范围示例**

|位数|最小值|最大值|
|:----:|:----:|:----:|
|8|0|255|
|16|0|65535|
|32|0|4294967295|
|64|0|18446744073709551615|

例如，在unsignedint型为16位的编译器中，可以表示0到65535共65536个数值。这些数值和位串的对应关系如图F 所示。

最小值0的所有位都为0，最大值65535的所有位都为1。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-12.png?x-oss-process=image/resize,w_500/sharpen,100)  
**图F 16位的无符号整数的内部表示**

一般来说，n位可以表示的无符号整数有0〜2<sup>n</sup>-1 共 2<sup>n</sup> 种。

>► 这和n位十逬制数可表示的数值范围为0〜10<sup>n</sup>-1共10<sup>n</sup>个数字的道理一样(例如，3位十逬制数可表示0〜999共1000个数字)。

**★ 专题负数值的位串的求法**

下一节中我们将学习负数的3种内部表示法。这里我们先来看一下如何由正整数求与其对应的负数的位串。

例如，由正整数5的位串求负整数-5的位串的过程如图G所示。

* 符号和绝对值

>将符号位由0变为1。其他位不变。

* 反码

>反转所有位。

* 补码

>反转所有位后加1。

![image](https://img-camp.banyuan.club/cc001/chapter7/7C-1.png?x-oss-process=image/resize,w_350/sharpen,100)  
**图G 求负数的位串**

## 有符号整数的内部表示

有符号整数的内部表示因编译器而不同。最常用的内部表示法有**补码、反码、符号和绝对值**3种。

首先来看这3种表示方法的共同之处，即用最高位表示数值的符号。如图H所示。

如果该数为负，则符号位为1;如果该数不为负，则符号位为0。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-13.png?x-oss-process=image/resize,w_400/sharpen,100)  
**图H 有符号整数的符号位**

接着来看表示具体数值的其他位的使用方法。这也是3种表示法的不同点。

**■补码(2’s complement representation)**

多数编译器中都使用这种表示方法。这种内部表示的值如下所示。

> -B<sub>n-1</sub>X2<sup>n-1</sup>+B<sub>n-2</sub>X2<sup>n-2</sup>+...+B<sub>1</sub>X2<sup>1</sup>+B<sub>0</sub>X2<sup>0</sup>


如果位数为n,则能够表示-2<sup>n-1</sup>到2<sup>n-1</sup>-1之间的值(表D)。

**■表D 有符号整型的表示范围示例(补码)**

|位数|最小值|最大值|
|:---:|:---:|:---:|
|8|-128|127|
|16|-32768|32767|
|32|-2147483648|2147483647|
|64|-9223372036854775808|9223372036854775807|

在int型(即signed int型)为16位的编译器中，能够表示-32768~32767共65536个值。

**■反码(1‘s complement representation}**

这种内部表示的值如下所示。

> -B<sub>n-1</sub>X(2<sup>n-1</sup>-1)+B<sub>n-2</sub>X2<sup>n-2</sup>+...+B<sub>1</sub>X2<sup>1</sup>+B<sub>0</sub>X2<sup>0</sup>

如果位数为n,则能够表示-2<sup>n-1</sup>+1到2<sup>n-1</sup>-1之间的值，只比补码少一个(表E)。

**■表E 有符号整型的表示示例(反码、符号和绝对值)**

|位数|最小值|最大值|
|:---:|:---:|:---:|
|8|-127|127|
|16|-32767|32767|
|32|-2147483647|2147483647|
|64|-9223372036854775807|9223372036854775807|

在int型为16位的编译器中，能够表示-32767~32767共65535个值。

**■符号和绝对值(sign and magnitude representation)**

这种内部表示的值如下所示。

> (1-2XB<sub>n-1</sub>)X(B<sub>n-2</sub>X2<sup>n-2</sup>+...+B<sub>1</sub>X2<sup>1</sup>+B<sub>0</sub>X2<sup>0</sup>)

能够表示的值的范围和反码一样(表7-7)。

在int型为16位的编译器中，能够表示-32767~32767共65535个值，具体如图I 所示。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-14.png?x-oss-process=image/resize,w_500/sharpen,100)

**图I 16位的有符号整数值和内部表示**

>► 无论是3种表示方法中的哪一种.有符号整型和无符号整型的共通部分，即非负数部分(16位的话为0〜32767)的位串都是一样的。

## 按位操作的逻辑运算

对于整数内部的位，有4种逻辑运算。这4种逻辑运算及其真值表如图J所示。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-15.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图J 逻辑运算真值表**

进行这些逻辑运算的运算符如表F 所示。

**■表F 按位运算符**

|按位与运算符|a&b|按位计算a和b的逻辑与|
|----|----|----|
|按位或运算符|a\|b|按位计算a和b的逻辑或|
|按位异或运算符|a^b|按位计算a和b的逻辑异或|
|~运算符|~a|计算a的反码（将每一位取反之后的值）|

>►这些运算符的操作数必须是整数类数据类型或者枚举型。如果应兩于浮点型等数据类型的操作数，编译吋就会出错。
>
>各运算符的英文名称分别是按位与运算符(bitwise AND operator)、按位或运算符(bitwise inclusive OR operator)、按位异或运算符(bitwise exclusive OR operator)、〜运算符(〜operator)。
>
>另外，~运算符通常称为按位求反运算符。

**★ 专题：逻辑运算符和按位逻辑运算符**

现在学习的&、丨、~运算符的写法和功能都同&&、||、!运算符相似，所以要注意它们的区别。

逻辑运算包括逻辑与、逻辑或、逻辑异或、逻辑非、逻辑与非、逻辑或非等运算，运算结果只有“真”和“假”两种取值。

&、|、~运算符会根据1为真、0为假的规则对操作数的各二进制位进行逻辑运算。

&&、||、!运算符会根据非0为真、0为假的规则对操作数的值进行逻辑运算。

我们通过比较表达式5&4和5&&4的结果就能非常清楚地知道两者的区别了。

```
  5 &   4  →    4             5 &&  4  →  1
101 & 100  →  100           非0 && 非0  →  1
```

代码清单 demo6.c 所示程序的功能是将读取到的两个非负整数按位进行逻辑与和逻辑或等运算，并显示运算结果。

**代码清单 demo6.c**

```c
/*
按位运算
*/
#include <stdio.h>

/*返回整数x中设置的位数*/
int count_bits(unsigned x)
{
    int bits = 0;
    while (x) {
        if (x & 1U) bits++;
        x >>= 1;
    }
    return bits;
}

/*返回unsigned型的位数*/
int int_bits(void)
{
    return count_bits(~0U);
}

/*显示unsigned型的位的内容*/
void print_bits(unsigned x)
{
    int i;
    for (i = int_bits() - 1; i >= 0; i--)
        putchar(((x >> i) & 1U) ? ''1'' : ''0'');
}

int main() {
    unsigned a, b;
    printf("请输入两个非负整数。\n");
    printf("a: "); scanf("%u", &a);
    printf("b: "); scanf("%u", &b);

    printf("\na     = "); print_bits(a);
    printf("\nb.    = "); print_bits(b);
    printf("\na & b = "); print_bits(a & b);
    printf("\na | b = "); print_bits(a | b);
    printf("\na ^ b = "); print_bits(a ^ b);
    printf("\n~a.   = "); print_bits(~a);
    printf("\n~b.   = "); print_bits(~b);
    putchar(''\n'');
    
    return 0;
}
```

函数print_bits是将无符号整数x的所有位都用0和1来表示的函数。函数int_bits和count_bits被用于执行这一工作。

除按位运算符之外，这里首次出现了两个运算符，分别是>>和>>=。首先我们来看一下这两个运算符。

>► 程序会在判断unsigned型的位数之后逬行显示。这里展示的是unsigned型为16位的例子(如果unsigned型为32位，就会显示32位)。

## 位移运算符

&lt;&lt;运算符(&lt;&lt;operator)和&gt;&gt;运算符(&gt;&gt;operator)的作用是求出将整数中的所有位左移或右移之后生成的值。这两个运算符统称为**位移运算符(bitwise shift operator)**(见表G)。

**■ 表G 位移运算符**

|&lt;&lt;运算符|a&lt;&lt;b|将a左移b位。右面空出的位用0填充|
|----|----|----|
|&gt;&gt;运算符|a&gt;&gt;b|将a右移b位|

>► 这些运篇符的操作数必须是整数类数据类型或者枚举型。

从键盘输入无符号整数，并对其进行位移操作的程序如代码清单 demo7.c 所示。下面就让我们结合这个程序，来学习一下这两个运算符的作用。

>► 函数count_bits、int_bits、print_bits和代码清单 demo6.c 相同。这里对函数体进行了注择，而函数体的定义也是必不可少的。

**■使用\<\<运算符进行左移**

表达式x&lt;&lt;n会将x的所有位左移n位，并在右边空出的位(低位)上补0(图K【a】)。如果n为无符号整型，则运算结果为xX2<sup>n</sup>。

>► 因为二进制数的每一位都是2的指数幂，所以左移1位后，只要没有发生数据溢出(后面介绍)，值就会变为原来的2倍。这和十进制数左移1位后，值变为原来的10倍(例如196左移1位后变为1960)是一样的道理。

**■使用>>运算符进行右移**

表达式X&gt;&gt;n会将X的所有位右移n位。如果X为无符号整型，或者有符号整型的非负值，则运算结果为X÷2<sup>n</sup>所得的商的整数部分(图K【b】)。

>► 二进制数右移1位后，值会变为原来的二分之一。这和十进制数右移1位后，值变为原来的十分之一(例如196右移1位后变为19)是一样的道理。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-16.png?x-oss-process=image/resize,w_700/sharpen,100)

**图K 非负整数的位移运算**

**代码清单 demo7.c**

```c
/* 显示对unsigned型的值进行左移和右移后的值 */
#include <stdio.h>

/*返回整数x中设置的位数*/
int count_bits(unsigned x) {
    int bits = 0;
    while (x) {
        if (x & 1U) bits++;
        x >>= 1;
    }
    return bits;
}

/*返回unsigned型的位数*/
int int_bits(void) {
    return count_bits(~0U);
}

/*显示unsigned型的位的内容*/
void print_bits(unsigned x) {
    int i;
    for (i = int_bits() - 1; i >= 0; i--)
        putchar(((x >> i) & 1U) ? ''1'' : ''0'');
}

int main() {
    unsigned x, n;
    printf("非负整数："); scanf("%u", &x);
    printf("位移位数："); scanf("%u", &n);

    printf("\n整数      = "); print_bits(x);
    printf("\n左移后的值 = "); print_bits(x << n);
    printf("\n右移后的值 = "); print_bits(x >> n);
    putchar(''\n'');
    
    return 0;
}
```

当X是有符号整型的负数时，位移运算的结果因编译器而异。在许多编译器中，会执行**逻辑位移(logical shift)** 或 **算术位移(arithmetic shift)**。

无论采用哪种方法都会降低程序的可移植性，所以我们要记住不要对负数进行位移。

**★ 专题：逻辑位移和算术位移**

**■ 逻辑位移**

如图L【a】所示，逻辑位移不考虑符号位，所有二进制位都进行位移。

负整数右移时，符号位由1变为0，位移的结果为0或正整数。

**■ 算术位移**

如图L【b】所示，算术位移会保留最高位的符号位，只有其他位会进行位移。用位移前的符号位来填补空位。位移前后符号不变。

![image](https://img-camp.banyuan.club/cc001/chapter7/7C-2.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图L 负整数的逻辑位移和算术位移**

在学完按位运算符和位移运算符之后，让我们回到代码清单 demo6.c 的程序，来重新理解一下这三个函数。

**■int count_bits(unsigned x);....求整数x中设置的位数**

程序开头的count_bits函数的功能是计算形参x所接收到的无符号整数中有多少个值为1的二进制位，并返回其个数。

让我们结合图M来看一下计算的顺序。该图表示的是x的值为10时的情况。

1.通过求1U(只有低位为1的无符号整数)和x的逻辑与运算，判断x的低位是否为1。如果低位为1,则bits递增。

>► 1U的U是将整型常置设置为无符号整数的符号。如果x的低位为1,则x&1U为1,否则x&1U为0。

![image](https://img-camp.banyuan.club/cc001/chapter7/7-17.png?x-oss-process=image/resize,w_500/sharpen,100)  
**图M位数计算示例**

2.为了弹出低位，将所有位右移1位。

>► >>=为复合赋值运算符，和x=x>>1;的作用一样。

重复进行以上操作，直到x的值变为0(x的所有位都变为0)，这样一来设置的所有位的个数就会存入变量bits。

**■int int_bits();* ...求int型/unsigned型的位数**

int_bits函数会返回int型和unsigned型的位数。

〜0U是所有位都为1的unsigned型整数(将所有位都为0的无符号整数0U的所有位反转得到)。

通过将该整数传给count_bits,就可以得到unsigned型的位数。

>► unsigned型和int型的位数相同。
>
>另外〜0U也可以是<limits.h>中定义的UINT_MAX。因为无符号整数的最大值的所有位都为1。

**■void print_bits(unsigned x);....显示整数x的位串**

函数print_bits是将unsigned型整数的高位到低位的所有位都用1和0来显示的函数。

在for语句的循环体部分，对第i位(即B<sub>i</sub>)是否为1进行判断。如果结果为1,则显示''1''，如果结果为0,则显示''0''。

>► 第i位的i.是从低位幵始，按照0,1....的顺序数数吋的值。

## 整型常量

整型常量可以用十进制、八进制、十六进制三种记法来指定。

**■十进制常量**

我们使用的10、57等整型常量称为**十进制常量(decimal constant)**。

**■八进制常量**

**八进制常量(octal constant)** 以0开头，以区别于十进制常量。以下两个整型常量看似相同,但实际上它们的值完全不同。

```
13  —- 十进制常量(十进制的13)
013 —- 八进制常量(十进制的11)
```

**■十六进制常量**

十六进制常量(hexadecimal constant)以Ox或0X开头。A〜F不区分大小写，相当于十进制的10〜15。示例如下，

```
OxB  -— 十六进制常量(十进制的11)
0x12 —- 十六进制常量(十进制的18)
```

## 整型常量的数据类型

之前我们在学习\<limits.h>的定义时，发现在部分整型常量后附带有U和L等符号，这些符号称为整型后缀(integer suffix)。整型后缀的作用如下所示。

* u和U......表示该整型常量为无符号类型。
* l和L......表示该整型常量为long型。

例如，3517U为unsigned型，127569L为long型。

>► 小写字母l和数字1很容易混淆，推荐使用大写字母L。
>► 负数-10不是整数字面量，而是对整数字面置10使用了单目运算符-。

整型常量的数据类型由以下三个因素决定。

* 该整型常量的值
* 该整型常量的后缀
* 所在编译器中各数据类型的表示范围

表H 中对上述规则进行了归纳。从最左边的类型开始，如果可以用左边的类型表示，则解释为该类型;如果不能表示，则沿着箭头的方向，转移到相邻的右边的类型。

**■表H 整型常量的数据类型**

|(a)无后缀的十进制常量|int →      long → unsigned long|
|---|---|
|(b)无后缀的八进制或十六进制常量|int → unsigned → long → unsigned long|
|(c)带后缀u/U|    unsigned →       unsigned long|
|(d)带后缀l/L|               long → unsigned long|
|(e)带后缀l/L和u/U|                 unsigned long|

举例如下(各种数据类型以本书设定的表示范围为例)。

* 1000.....能用int型表示，所以为int型。
* 60000......不能用int型表示，但能用long型表示，所以为long型。
* 60000U.....能用unsigned型表示，所以为unsigned型。

在上例中，60000是long型。但是，在int型能够表示60000以上的值的编译器中,60000就会被认为是int型，而非long型。

## 整数的显示

我们已经知道：
```
printf函数的第一个实参"%d“指定了输出格式，它告诉程序:以十进制数的形式显示后面的实参。
```

printf函数既能输出八进制数又能输出十六进制数。输出八进制数使用%o,输入十六进制数使用%x或%X。

>► %x的话用小写字母a〜f来表示，%X的话用大写字母A~F来表示。o来自于octal,x来自于hexadecimal

让我们实际来创建一个程序。将0到65535之间的整数，分别用十进制数、二进制数、八进制数、十六进制数来表示，程序如代码清单demo8.c所示。

**代码清单 demo8.c**

```c
/*
以十进制、二进制、八进制和十六进制
*/
#include <stdio.h>

/*返回整数x中设置的位数*/
int count_bits(unsigned x) {
    int bits = 0;
    while (x) {
        if (x & 1U) bits++;
        x >>= 1;
    }
    return bits;
}

/*返回unsigned型的位数*/
int int_bits(void) {
    return count_bits(~0U);
}

/*显示unsigned型整数x的后n位*/
void print_nbits(unsigned x, unsigned n) {
    int i = int_bits();
    i = (n < i) ? n - 1 : i - 1;
    for (; i >= 0; i--)
        putchar(((x >> i) & 1U) ? ''1'' : ''0'');
}

int main() {
    unsigned i;

    for (i = 0; i < 65535U; i++) {
        printf("%5u  ", i);
        print_nbits(i, 16);
        printf("  %06o  %04X\n", i, i);
    }
    
    return 0;
}
```

函数print_nbits显示unsigned型变量x的后n位。因为本程序中显示的最大值65535U能够用16位表示，所以这里将显示后16位。

>► 当形参n中指定了超过int型位数的值时，函数print_nbits显示int型的所有位。例如，在int型为16位的编译器中，即便n被指定为32,显示的位数也是16,而非32。

## 数据溢出和异常

如果在int型可表示的数值范围为 -32768〜32767 的编译器中进行下述运算，结果会如何呢?

```
int x,y,z;
x = 30000;
y = 20000;
z = x + y;
```

X和y中保存的值可以用int型来表示，这点毋庸置疑。但是赋给z的50000却超出了int型的表示范围。

像这样，因**数据溢出(overflow)**(溢位)使运算结果超出可表示的数值范围或违反数学定义(除以0等)时会发生**异常(exception)**。

发生异常时程序如何运行是由编译器决定的。

>► 在某些环境中，异常发生吋有可能会导致程序中断。

实际上，并非所有的运算中都会发生异常。无符号整数型的运算不会发生数据溢出。例如，我们在unsigned型可表示的数值范围为0〜65535的编译器中执行以下运算，看看结果如何。

```c
unsigned x,y,Z;
x = 37000;
y = 30000;
z = x + y;
```

在这段代码中，将 67000 除以 65536 的余数1464赋给了Z。这是因为运算后超出了无符号整数的表示范围的情况下，运算结果为除以1与该数据类型可表示的最大值的和之后所得的余数。

>► 举例如下。
>
>如果数学运算结果为65536,则运算结果为0。
>
>如果数学运算结果为65537,则运算结果为1。
>

即循环使用最小值0～最大值65535
>注意
>
>无符号整型的运算中不会发生数据溢出。当运算结果超出最大值时，结果为“数学运算结果%(该无符号整型能够表示的最大值+1)”。

## 作业

**● 练习 1**

>创建一个程序,显示如下所示的各表达式的值，同时对各表达式的值加以说明。
```
sizeof 1        sizeof(unsigned)-1      sizeof n+2
sizeof +1       sizeof(double)-1        sizeof(n+2)
sizeof -1       sizeof((double)-1)      sizeof(n+2.0)
```
**● 练习 2**

>编写一个程序，确认只要没有发生高位溢出，则
>
>无符号整数位左移后的值等于其乘以2的指数幂后的值。  
>无符号整数位右移后的值等于其除以2的指数幂后的值。


**● 练习 3**

>编写rrotate函数，返回无符号整数x右移n位后的值。
>
>```c
>unsigned rrotate(unsigned x,int n){/*...*/}
>```
>
>编写lrotate函数，返回无符号整数x左移n位后的值。
>```
>unsigned lrotate(unsigned x,in tn){/*...*/}
>```

**● 练习 4**

>编写set函数，返回将无符号整数x的第pos位设为1后的值。
>
>```c
>unsigned set(unsigned x,int pos){/*...*/}
>```
>编写reset函数，返回将无符号整数x的第pos位设为0后的值。
>
>```c
>unsigned reset(unsigned x,int pos){/*...*/}
>```
>
>编写inverse函数，返回将无符号整数x的第pos位取反后的值.
>
>```c
>unsigned inverse(unsigned x,int pos){/*...*/}
>```

**● 练习 5**

>编写set_n函数，返回将无符号整数x的第pos位到第pos+n-1位的n位设为1后的值。
>
>```c
>unsigned set_n(unsigned x,int pos,int n){/*...*/}
>```
>编写reset_n函数，返回将无符号整数x的第pos位开始的n位设为0后的值。
>
>```c
>unsigned reset_n(unsigned x,int pos,int n){/*...*/}
>```
>编写inverse_n函数，返回将无符号整数x的第pos位开始的n位取反后的值。
>
>```c
>unsigned inverse_n(unsigned x,int pos,int n){/*...*/}
>```
', 2, 2, NULL, '2020-05-21 18:21:33.12043', '2020-05-21 18:21:33.12043', 62);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (65, '浮点型', NULL, 10, NULL, NULL, '上一节中学习的整型，不能表示带有小数部分的实数。本节我们就来学习可以表示实数的浮点型。

## 浮点型

浮点型(floatingpointtype)用来表示带有小数部分的实数。浮点型有以下3种类型。

```c
float   double   long double
```

>► 类型名float来源于浮点数(floating-point)，double来源于双精度(double precision)。

代码清单 demo1.c 所示为为这3种类型的变量赋值并显示的程序。

>► 运行结果因编译器而异。

从运行结果中可知，赋给变量的数值没有正确显示。这是因为浮点型的“表示范围”是由长度和精度共同决定的。

例如“长度为12位数字，精度为6位有效数字”。

这里以具体数值为例进行思考。

>a 1234567890

这个数值有10位，长度在12位的表示范围之内，但它在精度为6位时无法正确表示，所以将第7位四舍五入，得到:

>b 1234570000

其中1.23457称为尾数，9称为指数。尾数的位数相当于“精度”，指数的值相当于“长度”。

到目前为止我们都以十进制数为例进行思考，但实际上尾数部分和指数部分都是用二进制数表示的。因此，在诸如长度或精度为“6位”的情况下，并不能用十进制整数正确无误地表示。

指数部分和尾数部分的位数取决于编译器和数据类型。指数部分的位数越多，说明能够表示的值越大;尾数部分的位数越多，说明能够表示的值精度越高。

float、double、long double这3种类型可表示的数值范围大于或等于各自左边的数据类型。

**代码清单 demo1.c**

```c
/*
表示浮点型变量的值
*/
#include <stdio.h>

int main() {
    float a       = 123456789012345678901234567890.0;
    double b      = 123456789012345678901234567890.0;
    long double c = 123456789012345678901234567890.0;

    printf("a = %f\n", a);
    printf("b = %f\n", b);
    printf("c = %Lf\n", c);

    return 0;
}
```

![image](https://img-camp.banyuan.club/cc001/chapter7/7-20.png?x-oss-process=image/resize,w_500/sharpen,100)

**图A 浮点数的内部表示示例**

**★ 专题：带有小数部分的二进制数**

前面我们提到，十进制的每一位都是10的指数幂。其实这一点也适用于小数部分。例如十进制数13.25。整数部分的1是10<sup>1</sup>,3是10<sup>0</sup>,小数部分的2是10<sup>-1</sup>,5是10<sup>-2</sup>。

二进制数也一样。二进制数的每一位都是2的指数幂。因此，二进制数的小数点以后的位和十进制数的对应关系如表A所示。

**■表A 二进制和十进制**

|二进制数|十进制数||
|---|---|---|
|0.1|0.5|※2的-1次幂|
|0.01|0.25|※2的-2次幂|
|0.001|0.125|※2的-3次幂|
|0.0001|0.06255|※2的-4次幂|

不能用0.5，0.25,0.75,...的和来表示的值，就不能用有限位数的二进制数来表示。

举例说明如下。

**■能够用有限位数来表示的例子**

>十进制数0.75 = 二进制数0.11     ⌘0.75是0.5和0.25的和

**■不能用有限位数来表示的例子**

>十进制数0.1 = 二进制数0.00011001...


## 浮点型常量

像3.14和57.3这样，表示实数的常量称为**浮点型常量(floating-point constant)**。

和整型常量有后缀U和L一样，浮点型常量末尾也可以加上指定类型的浮点型后缀(floating
suffix)。

后缀f或F表示float型，后缀l或L表示long double型。举例如下。

```c
57.3     /*double型*/
57.3F    /*float型*/
57.3L    /*long double型*/
```

>► 因为小写的l容易和1混淆，所以推荐使用大写的L(和整型后缀一样)。

如结构图所示，还可以使用指数表示为科学计数法，如下所示：


> 1.23E4    /\*1.23X10<sup>4</sup>*/

> 89.3E-5   /\*89.3X10<sup>-5</sup>*/

另外也可以省略整数部分或小数部分。但不能够将所有部分省略。请结合结构图来理解。下面几个例子。

```c
.5    /*double型的0.5*/
12.   /*double型的12.0*/
.5F   /*float型的0.5*/
1L    /*long dobule型的1.0*/
```

>► 假如省略了小数点和小数部分.就必须给出整数部分。


## \<math.h>头文件

C语言提供了基本的数学函数来支持科学计算。<math.h>头文件中包含了这些函数的声明。如代码清单 demo2.c所示的程序，使用了求平方根的sqrt函数来计算两点间的距离。

**代码清单 demo2.c**

```c
/*
求出两点间的距离
*/
#include <stdio.h>
#include <math.h>

double dist(double x1, double y1, double x2, double y2) {
    return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
}

int main() {
    double x1, y1;   /*点1*/
    double x2, y2;   /*点2*/

    printf("求两点间的距离。\n");
    printf("点1……X坐标："); scanf("%lf", &x1);
    printf("点1……Y坐标："); scanf("%lf", &y1);
    printf("点2……X坐标："); scanf("%lf", &x2);
    printf("点2……Y坐标："); scanf("%lf", &y2);

    printf("两点之间的距离为%f\n", dist(x1, y1, x2, y2));

    return 0;
}
```

|sqrt||
|---|---|
|头文件|#include \<math.h>|
|原型|double sqrt(double x);|
|说明|计算X的平方根(实参为负数时会发生定义域错误)。|
|返回值|返回计算出的平方根。|

>► 平方根是指求平方后和原来的值相等的数。例如.对于数a，如果有b<sup>2</sup>等于a,则b是a的平方根。

## 循环的控制

请看代码清单 demo3.c 所示的程序。该程序显示了 float 变量 x 以 0.01 为单位从0.0递增至1.0的每一步的结果。

**代码清单 demo3.c**

```c
/*
以0.01为单位从0.0递增至1.0的循环
*/
#include <stdio.h>

int main() {
    float x;

    for (x = 0.0; x <= 1.0; x += 0.01)
        printf("x = %f\n", x);
    
    return 0;
}
```

>► 因为运算结果取决于float型的精度.因此运行结果因编译器而异。

最后的X的值不是1.0，而是0.999999。这是因为计算机不能保证其内部转换为二进制的浮点数的每一位都不发生数据丢失。因此将1000份的误差积累在x中。

我们可以对for的控制表达式做如下修改。

```
for(x = 0.0; x! = 1.0; x += 0.01 
```

x的值不会变为1.0。因此，如图b所示，这个for语句会跳过1.0继续循环下去。

将程序改写为用整数控制循环，改写后的程序如代码清单demo4.c 所示。

**代码清单 demo4.c**

```c
/*
以0.01为单位从0.0递增至1.0的循环（用整数控制）
*/
#include <stdio.h>

int main() {
    int i;
    float x;

    for (i = 0; i <= 100; i++) {
        x = i / 100.0;
        printf("x = %f\n", x);
    }

    return 0;
}
```

程序中的for语句，使变量i的值由0到100递增。每循环—次，x都会变为变量i除以100.0后所得的值。

虽然x没有完美地表示出目标实数值，但是通过每次重新求x的值，误差不再累积，从这一点来看，还是有所进步的。

>■注意■ 循环判断基准所使用的变量应为整数而不要用浮点数。

## 作业

**● 练习 1**

> 创建一个程序，从键盘输入float型、double型、long double型的变量，并显示其值。注意试着输入各种各样的值，并验证其动作。

**● 练习 2**

>创建一个程序，使用sizeof运算符显示3种浮点型的长度。

**● 练习 3**

>创建一个程序，输入一个实数作为面积，求面积为该实数的正方形的边长。
', 3, 2, NULL, '2020-05-21 18:21:33.146473', '2020-05-21 18:21:33.146473', 62);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (66, '运算和运算符', NULL, 10, NULL, NULL, '本节我们来学习运算符的优先级和结合性，并将介绍C语言中提供的所有运算符及基本的类型转换规则。

## 运算符的优先级和结合性

至此我们己经学习了许多运算符。表A中罗列了C语言中所有的运算符。

**■ 表A运算符一览表**

|优先级|运算符|形式|名称(通称)|结合性|
|----|----|----|----|----|
|1|()|x(y)|函数调用运算符|左|
|1|[]|x[y]|函数调用运算符|左|
|1|.|x.y|.运算符（句点运算符）|左|
|1|->|x->y|->运算符（箭头运算符）|左|
|1|++|x++|后置递增运算符|左|
|1|--|y--|后置递减运算符|左|
|2|++|++x|前置递增运算符|右|
|2|--|--y|前置递减运算符|右|
|2|sizeof|sizeof x|sizeof运算符|右|
|2|&|&x|单目运算符&（取址运算符）|右|
|2|*|\*x|单目运算符\*（指针运算符）|右|
|2|+|+x|单目运算符+|右|
|2|-|-x|单目运算符-|右|
|2|~|~x|~运算符（按位求补运算符）|右|
|3|!|!x|逻辑非运算符|右|
|3|()|(x)y|类型转换运算符|右|
|4|\*|x\*y|\*运算符|左|
|4|/|x/y|/运算符|左|
|4|%|x%y|%运算符|左|
|5|+|x+y|+运算符|左|
|5|-|x-y|-运算符|左|
|6|<<|x<<y|<<运算符|左|
|6|>>|x>>y|>>运算符|左|
|7|<|x<y|<运算符|左|
|7|<=|x<=y|<=运算符|左|
|7|>|x>y|>运算符|左|
|7|>=|x>=y|>=运算符|左|
|8|==|x==y|==运算符|左|
|8|!=|x!=y|!=运算符|左|
|9|&|x&y|按位与运算符|左|
|10|^|x^y|按位异或运算符|左|
|11|&#124;|x&#124;y|按位或运算符|左|
|12|&&|x&&y|逻辑与运算符|左|
|13|&#124;&#124;|x&#124;&#124;y|逻辑或运算符|左|
|14|?:|x?y:z|条件运算符|右|
|15|=|x=y|基本赋值运算符|右|
|15|+= -= \*= /= %= <<= >>= &= ^= &#124;=|x@=y|复合赋值运算符|右|
|16|,|x,y|逗号运算符|左|


## 优先级

运算符一览表中，运算符越靠上，**优先级(precedence)** 越高。例如，进行乘除法运算的\*和/比进行加减法运算的+和-优先级高，这与我们实际生活中使用的数学规则是一样的。

```c
a + b * c
```

会被解释为a + (b * c)，而不是(a+b) * c。虽然+写在前面，但还是先进行 * 的运算。

## 结合性

这里有必要对 **结合性(associativity)** 作一下说明。假如用 〇 表示需要两个操作数的双目运算符，那么对于表达式 `a 〇 b 〇 c`，左结合运算符会将表达式解释为:

>(a 〇 b) 〇 c  左结合性

右结合运算符会将表达式解释为:

>a 〇 (b 〇 c)  右结合性

也就是说，遇到优先级相同的运算符时，结合性指明了表达式应从左往右运算还是从右往左运算。

例如，执行减法计算的双目运算符-是左结合性的，所以

>5 - 3 - 1 → (5 - 3) - 1  /* 左结合性 */

如果为右结合性，就会解释为5-(3-1),答案就不正确了。执行赋值操作的简单赋值运算符=是右结合性的，所以解释如下:

>a=b=1 → a=(b=1)/\*右结合性*/


## 数据类型转换

我们在前面章节中简单地学习了数据类型转换。本节将说明详细规则，请在需要时作为参考(其中有些语句未展开说明)。

**■ 整型提升**

在可以使用int型或unsigned int型的表达式中，也可以使用有符号或无符号类型的char、short int、int位域，还可以使用枚举对象。 

无论哪种情况，如果用int型可以表示出原数据类型的所有数值，就将值转换为int型，否则转换为unsigned int型。

>► 整型提升不会改变符号和数值。char型是否作为有符号类型来处理，由编译器而定。


**■ 有符号整型和无符号整型**

整数类数据类型之间互相转换时，若原数值能用转换后的数据类型表示，则数值不会发生变化。

将有符号整数转换为位数相同或位数更多的无符号整数时，如果该有符号整数不为负数，则数值不会发生变化。 

否则，若无符号整数的位数较大，则先将有符号整数提升为与无符号整数长度相同的有符号整数。然后再与无符号整数类型可表示的最大数加1后的值相加，将有符号整数转换为无符号整数。 

将整数类数据类型转换为位数更少的无符号整数时，除以比位数较少的数据类型可表示的最大无符号数大1的数，所得的非负余数就是转换后的值。

将整数类数据类型转换为位数更少的有符号整数时，以及将无符号整数转换为位数相同的有符号整数时，如果不能正确表示转换后的值，则此时的操作由编译器而定。  

**■ 浮点型和整数类数据类型**

将浮点型的值转换为整数类数据类型时，会截断小数部分。整数部分的值不能用整数类数据类型表示时的操作未定义。 

将整数类数据类型的值转换为浮点型时，如果数据类型转换后的结果在数值范围内不能正确表示，那么会根据编译器定义的方法取大于或小于原值的最接近的近似值作为转换结果。  

**■ 浮点型**

float型提升为double型或long double型时，以及double型提升为long double型时，值不会发生变化。

double型转换为float型时，以及long double型转换为float型时，会根据编译器定义的方法取大于或小于原值的最接近的近似值作为转换结果。

**■ 普通算术类型转换**

许多具有算术类型操作数的双目运算符都会执行操作数的数据类型转换，并用同样的方法决定转换结果的数据类型。数据类型转换的目的是确定通用数据类型，该数据类型亦是转换结果的数据类型。这一过程称为**普通算术类型转换(usual arithmetic conversion)**。

普通算术类型转换的规如下。

>a 若有一个操作数为long double型，则将另一个操作数转换为long double型。  
>b 若有一个操作数为double型，则将另一个操作数转换为double型。  
>c 若有一个操作数为float型，则将另一个操作数转换为float型。  
>d 若均不符合以上情况，则根据以下规则对两个操作数进行整型提升。  
>
>>1 若有一个操作数为unsigned long型，则将另一个操作数转换为unsigned long型。
>>2 在一个操作数为long型，另一个操作数为unsigned型的情况下，如果long型能表示unsigned型的所有值，则将unsigned型的操作数转换为long型。如果long型不能表示unsigned型的所值，则将两个操作数都转换为unsigned long型。  
>>3 若有一个操作数为long型，则将另一个操作数转换为long型。  
>>4 若有一个操作数为unsigned型，则将另一个操作数转换为unsigned型。  
>>5 否则将两个操作数都转换为int型。  
>

浮点型操作数的值以及浮点型表达式的结果值可以超出数据类型所要求的精度和范围进行显示。但是结果的数据类型不会发生变化。', 4, 2, NULL, '2020-05-21 18:21:33.17421', '2020-05-21 18:21:33.17421', 62);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (67, '字符串', NULL, 10, NULL, NULL, '', 8, 1, NULL, '2020-05-21 18:21:33.19952', '2020-05-21 18:21:33.19952', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (68, '什么是字符串', NULL, 10, NULL, NULL, '字符串就是字符序列。本节我们来学习字符串和字符串字面量的基本知识。

## 字符串字面量

像"ABC"那样带双引号的一系列字符称为**字符串字面量(string literal)**。

>► 上一章中我们学习了用转义字符\\"来表示字符串字面置中的字符。例如.表示字符序列XY"Z的字符串字面置就是"XY\\"Z"。

在字符串字面量的末尾会被加上一个叫作null字符的值为0的字符。用八进制转义字符表示null字符就是''\0''。若用整数常量来表示就是0。

由3个字符组成的字符串字面量"ABC实际上占用了4个字符的内存空间，如图 1(a)所示。而双引号中没有任何字符的字符串字面量""表示的就是null字符，如图 1(b)所示。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-1.png?x-oss-process=image/resize,w_400/sharpen,100)

**图 1 字符串字面量的内部实现**

## 字符串字面量的长度

表示字符串字面量的长度，即所占有的内存空间大小的程序如代码清单 demo.c 所示。

**代码清单 demo.c**

```c
/*
显示字符串字面量的长度
*/
#include <stdio.h>

int main() {
    printf("sizeof(\"123\")      = %u\n", (unsigned)sizeof("123"));
    printf("sizeof(\"AB\\tC\")    = %u\n", (unsigned)sizeof("AB\tC"));
    printf("sizeof(\"abc\\0def\") = %u\n", (unsigned)sizeof("abc\0def"));

    return 0;
}
```

该程序中三个字符串字面量的长度和在内存中的存储形式如图 2所示。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-2.png?x-oss-process=image/resize,w_500/sharpen,100)

**图 2 字符串字面量的长度和内部表示**

通过运行结果可知，对于字符串字面量"abc\0def"，运行环境会另在末尾加上一个null字符。

>► 字符串字面量"AB\tC"中的''\t''表面上是两个字符.实际上是表示水平制表的转义字符，因此算作一个字符。

字符串字面量的长度，和包括末尾的null字符在内的字符数一致。下面我们来总结一下字符串字面量的性质

**■ 具有静态生命周期**

```c
void func() {
    puts("ABCD");
    puts("ABCD");
}
```
如上所示函数的功能是显示两次"ABCD"。调用该函数时必须将字符串字面量"ABCD"传入puts函数。因此字符串字面量"ABCD‘就必须“活在”程序开始到结束的整个生命周期内。   
正因为如此，字符串字面量自然被赋予了静态生命周期。

**■对于同一字符串字面量的处理方式依赖于编译器**

func函数中有两个拼写完全相同的字符串字面量"ABCD"。如果将它们视为相同，并共用同一个字符串字面量，这样只需5个字符的内存空间即可，能够减少所需的内存空间。而如果将其视为不同，并分别存储在内存空间上，则需要10个字符的内存空间。   
至于采用哪种处理方式，则要根据编译器而定，具体请查阅你使用的编译器的说明文档。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-3.png?x-oss-process=image/resize,w_500/sharpen,100)

**9-3 拼写相同的字符串字面量的处理方式**

## 字符串

字符串字面量类似于整数的50、浮点数的3.14等常量。数值型数据可以通过变量(对象)的数据类型转换进行混合运算。而表示字符序列的字符串(string)也可以以对象形式保存并灵活处理。

字符串最适合放在char数组中存储。

例如要表示字符串"ABC",数组元素必须按以下顺序依次保存，如图 3所示。

> ''A'' ''B'' ''C'' ''\0''

末尾的 null 字符''\0''是字符串结束的“标志”

![image](https://img-camp.banyuan.club/cc001/chapter9/9-4.png?x-oss-process=image/resize,w_120/sharpen,100)  
**图3 存储在数组中的字符串**

>■注意■ 字符串最适合放在char数组中存储。字符串的末尾是首次出现的null字符。

>► 字符串字面置的中间也可以有null字符，不过应注意区分。字符串字面量"ABC"是字符串.而字符串字面置"AB\0CD"不是字符串。

以字符数组的形式保存并显示字符串"ABC"的程序如代码清单demo1.c所示

**代码清单 demo1.c**

```c
/*
将字符串存储在数组中并显示（其1:赋值）
*/
#include <stdio.h>

int main() {
    char str[4];

    str[0] = ''A'';
    str[1] = ''B'';
    str[2] = ''C'';
    str[3] = ''\0'';

    printf("字符串str为\"%s\".\n", str);

    return 0;
}
```

通过将字符赋值给char[4]型数组str的各元素，生成字符串"ABC"。另外，printf函数中表示字符串的转换说明为%s,实参传递的是数组名(这里是str)

>► 转换说明中的s是字符串string的缩写。

## 字符数组的初始化赋值

为保存字符串而将每个字符逐一赋予数组的各个元素可不是一件轻松的事，所以我们可以像下面这样进行声明。

```c
char str[4]={''A'',''B'',''C,''\0''};
```

这样不仅简洁，而且也能确保数组元素的初始化，且在形式上与int型、double型等数组的初始化完全一致。另外，该声明还可简化为以下形式。

```c
char str[4]="ABC"; /*和char str[4]={’A'',’B'',''C'',''\0''}一样*/
```

通常这种声明方式更为简洁也更常用。

>■注意■ 以下两种形式都可以实现字符数组的初始化赋值。
>
>```c
>(a)char str[] = {''A'',''B'',''C'',''\0''};
>(b)char str[] = "ABC";
>```

>► 因为初始值的个数决定了数组元素的个数，所以元素个数可以省略。此外，(b)的初始值也可以用{}括起来,如{"ABC"}。

我们来改写一下 demo1.c 的程序，不将字符逐一赋予数组的各个元素，而采用初始化赋值的方法。请见代码清单demo2.c。

**代码清单 demo2.c**

```c
/*
将字符串存储在数组中并显示（其2:初始化）
*/
#include <stdio.h>

int main() {
    char str[] = "ABC";

    printf("字符串str为\"%s\"。\n", str);

    return 0;
}
```

但是除了初始化赋值的时候，我们不能将数组的初始值或字符串直接赋予数组变量。

```c
char s[4]
s = {''A'',''B'',''C'',''\0''};  /*错误：不能赋初始值*/
s = "ABC";               /*错误：不能赋初始值*/
```

## 空字符串

一个字符也没有的字符串，称为**空字符串(null string)**。因为即使没有字符，也需要表示结束的null字符，所以在内存空间上只有一个null字符，如图4所示。如下所示为存储空字符串的数组的声明示例。

```c
char ns[] = "";
```

>► 数组ns的元索个数不是0而是1,当然也可以进行如下声明。
>
>```c
>char ns[] = {''\0''};
>```

![image](https://img-camp.banyuan.club/cc001/chapter9/9-5.png?x-oss-process=image/resize,w_80/sharpen,100)  
**图4 空字符串**

## 字符串的读取

下面我们来学习从键盘读入字符串的方法。代码清单 demo3.c 所示程序的功能是读取一个表示名字的字符串，并显示问候语。

**代码清单 demo3.c**

```c
/*
询问名字并显示问候语（读取字符串）
*/
#include <stdio.h>

int main() {
    char name[48];
    printf("请输入您的名字：");
    scanf("%s", name);//name不带&

    printf("您好，%s先生/女士！！\n", name);

    return 0;
}
```

我们事前无法确定输入的名字会有多少个字符，因此数组的元素数必须能容纳足够多的字符。本例中假设为48个元素。

为了从标准输入读取字符串，需要把scanf函数的转换说明设为%s,还必须传入数组name。请注意这里的name是不带&运算符的。

另外，sconf函数在将从键盘读取的字符串存储到数组中时，会在末尾加上null字符，如图5所示。

>► 也就是说，除了null字符之外，可存储47个字符。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-6.png?x-oss-process=image/resize,w_100/sharpen,100)  
**图5 通过scanf函数进行读取**

## 格式化显示字符串

前面章节中简单介绍了表示整数和浮点数的转换说明。字符串也同样是通过这种方式进行说明的。

请见代码清单 demo4.c 中的几个例子。

**代码清单 demo4.c**

```c
/*格式化字符串“12345”并显示*/
#include <stdio.h>

int main() {
    char str[] = "12345";

    printf("%s\n", str);/*原样输出*/
    printf("%3s\n", str);/*至少显示3位*/
    printf("%.3s\n", str);/*最多显示3位*/
    printf("%8s\n", str);/*右对齐*/
    printf("%-8s\n", str);/*左对齐*/

    return 0;
}
```

转换说明的结构如图 6所示。

<img src="https://img-camp.banyuan.club/online/c/ch8/string-format.svg" width="250px" />

**图 6 转换说明的结构**

**【A】输出最小宽度**

表示至少要输出指定的位数。如果省略本项或实际输出的字符串位数超过指定值，则按实际位数输出。

如果设置了-标志，则表示左对齐，否则表示右对齐(空白部分填补空格)。

**【B】精度**
指定显示位数的上限(即不可能显示超过指定位数的字符，超过则截去)。

**【C】转换说明符**

s表示输出字符串。即输出数组的字符，直到null字符的前一个字符为止。如果没有指定精度或精度大于数组长度，则数组中必须含有null字符。

## 字符串数组

类型相同的数据集合适合用数组来实现。这一点我们己经学习过了。下面我们就来学习字符串的集合，即字符串数组。

首先来看一下生成并显示字符串数组的程序，如代码清单 demo5.c 所示。

**代码清单 demo5.c**

```c
/*
字符串数组
*/
#include <stdio.h>

int main() {
    int i;
    char cs[][6] = {"Turbo", "NA", "DOHC"};

    for (i = 0; i < 3; i++)
        printf("cs[%d] = \"%s\"\n", i, cs[i]);

    return 0;
}
```

该程序考察的是由3个字符串组成的数组，数组cs是3行6列的二维数组(元素类型为char[6]型、元素个数为3的数组)，3个元素cs[0]、cs[1]、cs[2]分别初始化为字符串 "Turbo","NA","DOHC"。

>► 由{}中的初始值个数可知.元素个数会被自动视为3。

数组cs的元素，是char[6]型的数组。数组cs[0]表示"Turbo"、cs[1]表示"NA"、cs[2]表示"DOHC"。

<img src="https://img-camp.banyuan.club/online/c/ch8/string-array.png" width="200px"/>

**图6 由二维数组实现的字符串数组**

>► 如果不算null字符，各元素可表示0〜5个字符长度的字符串。

二维数组的各构成元素都由两个下标来表示。''T'' 为cs\[0][0]、''C'' 为cs\[2][3]。

>► 数组声明中初始值不足吋，用0来初始化该元素。因此各个字符串后面的空白部分都初始化为null字符。

## 取字符串数组中的字符串

代码清单 demo6.c 所示程序的功能是，将从标准输入读到的字符串的各个字符逐个往字符串数组中的各个元素赋值。

**代码清单 demo6.c**

```c
/*
读取并显示字符串数组
*/
#include <stdio.h>

int main() {
    int i;
    char s[3][128];

    for (i = 0; i < 3; i++) {
        printf("s[%d] : ", i);
        scanf("%s", s[i]);
    }

    for (i = 0; i < 3; i++)
        printf("s[%d] = \"%s\"\n", i, s[i]);
    
    return 0;
}
```

该程序中的数组s是3行128列的二维数组，即元素类型为char[128]、元素个数为3的数组。

数组为3行，是因为读取并显示3个字符串。

另外，因为我们事先不知道会从键盘输入什么字符，所以数组的元素个数必须多一些。因此这里将列数设为128。当然，如果不算null字符的话，各数组s[0]、s[1]、s[2]中最多可容纳127个字符。

因为s[0]、s[1]、s[2]都是字符串(字符数组)，所以将它们传入scanf函数时不可以带&运算符。', 1, 2, NULL, '2020-05-21 18:21:33.206903', '2020-05-21 18:21:33.206903', 67);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (69, '字符串处理', NULL, 10, NULL, NULL, '目前为止我们所学的围绕字符串的处理，仅仅是生成字符串、读取并显示字符串。下面我们来学习更灵活地处理字符串的方法。

## 字符串长度

我们来对下述语句声明的数组str进行思考。

```c
char str[6] = "ABC";
```
如图A所示，元素个数为6的数组中保存了长度为3(算上字符串末尾的null字符，则长度为4)的字符串。因此，实际上数组末尾的str[4]、str[5]都是空的。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-9.png?x-oss-process=image/resize,w_150/sharpen,100)  
**图A 数组内的字符串**

由此可知，字符串不一定正好撑满字符数组。

因为字符串中含有表示其末尾的null字符，所以第一个字符到''\0''(的前一个字符)为止的字符数，就是该字符串的长度。

基于以上思路，我们可以写出计算字符串长度的程序，请见代码清单 demo1.c。

**代码清单 demo1.c**

```c
/*
判断字符串的长度
*/
#include <stdio.h>

/*返回字符串str的长度*/
int str_length(const char s[]) {
    int len = 0;
    while (s[len])
        len++;
    return len;
}

int main() {
    char str[128];

    printf("请输入字符串：");
    scanf("%s", str);

    printf("字符串\"%s\"的长度是%d\n", str, str_length(str));

    return 0;
}
```

先来看一下main函数调用str_length函数时传入的实参str。通过数组的传递，函数str_length所接收的s,就是在main函数内定义的数组str本身。

接着，在str_length函数中使用变量len,遍历数组计算字符串的长度。

注意观察程序中的while语句。while语句在循环条件表达式为非0的情况下，会执行循环体语句。该循环语句，会从头开始遍历数组s。

循环继续的条件是，s[len]不是0,即不是null字符。变量len的初始值为0,每次执行循环体语句就自增1,直至出现null字符为止(图B)。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-10.png?x-oss-process=image/resize,w_250/sharpen,100)  
**图B 求字符串的长度**

在这种情况下，当len为3时，s[len]为0,即null字符。于是while语句的循环结束。

当然，也可以将str_length函数想成“返回数组str中首个值为null的元素的下标值的函数”。

这和我们在前面学习的顺序查找的思维方式是一样的。

## 显示字符串

这次我们不使用printf函数和puts函数，而只使用putchar函数来显示字符串。

可以通过对每个字符进行遍历来实现。请见代码清单 demo2.c 所示的程序。

**代码清单 demo2.c**

```c
/*
遍历字符串并显示
*/
#include <stdio.h>

/*显示字符串是（不换行）*/
void put_string(const char s[]) {
    int i = 0;
    while (s[i])
        putchar(s[i++]);
}

int main() {
    char str[128];

    printf("请输入字符串：");
    scanf("%s", str);

    printf("您输入了");
    put_string(str);
    printf("。\n");

    return 0;
}
```

字符串中的字符进行遍历的步骤和代码清单 demo1.c 中的str_length函数一样。对每个字符进行遍历，直到出现null字符为止，如图C所示。

![image](https://img-camp.banyuan.club/cc001/chapter9/9-11.png?x-oss-process=image/resize,w_300/sharpen,100)  
**图C 遍历字符串并显示**

>► 当然，仅显示null字符之前的字符.不显示null字符。

## 数字字符的出现次数

下面让我们深入到字符串的内部。代码清单 demo3.c 所示程序的功能是遍历字符串中的各个字符，并计算其中数字字符切''0'' ~ ''9'' 的个数。

**代码清单 demo3.c**

```c
/* 计算字符串中的数字字符数 */
#include <stdio.h>

/*将字符串s中的数字字符的出现次数保存至数组cnt*/
void str_dcount(const char s[], int cnt[]) {
    int i = 0;
    while (s[i]) {
        if (s[i] >= ''0'' && s[i] <= ''9'')
            cnt[s[i] - ''0'']++;
        i++;
    }
}

int main() {
    int i;
    int dcnt[10] = {0};/*分布*/
    char str[128];/*字符串*/

    printf("请输入字符串：");
    scanf("%s", str);

    str_dcount(str, dcnt);

    puts("数字字符的出现次数");
    for (i = 0; i < 10; i++)
        printf("''%d'':%d\n", i, dcnt[i]);

    return 0;
}
```

遍历字符串的步骤和我们之前见过的程序一样。

## 大小写字符转换

我们来编写两个函数，一个是将字符串中的英文字符全部转为大写字母，另一个则全部转为小写字母。请见代码清单 demo4.c。

**代码清单 demo4.c**

```c
/*
对字符串中的英文字符进行大小写转换
*/
#include <stdio.h>
#include <ctype.h>

/*将字符串中的英文字符转为大写字母*/
void str_toupper(char s[]) {
    int i = 0;
    while (s[i]) {
        s[i] = toupper(s[i]);
        i++;
    }
}

/*将字符串中的英文字符转为小写字母*/
void str_tolower(char s[]) {
    int i = 0;
    while (s[i]) {
        s[i] = tolower(s[i]);
        i++;
    }
}

int main() {
    char str[128];

    printf("请输入字符串：");
    scanf("%s", str);

    str_toupper(str);
    printf("大写字母：%s\n", str);

    str_tolower(str);
    printf("小写字母：%s\n", str);

    return 0;
}
```

该程序中定义的两个函数的作用分别如下所示。

* 函数str_toupper....将s中接收的字符串中的英文字符转换为大写。
* 函数str_tolower....将s中接收的字符串中的英文字符转换为小写。

两个函数的定义几乎相同。从头开始遍历字符串s,发现目标字符后就进行转换。

大小写转换中使用了toupper函数和tolower函数，分别如下所示。

||toupper|
|---|---|
|头文件|#include &lt;ctype.h&gt;|
|原型|int toupper(int c〉;|
|说明|将小写英文字母转换为相应的大写英文字母。|
|返回值|若c是小写英文字母，则返回转换后的大写字母，否则直接返回c。|

||tolower|
|---|---|
|头文件|#include &lt;ctype.h&gt;|
|原型|int tolower(int c〉;|
|说明|将大写英文字母转换为相应的小写英文字母。|
|返回值|若c是大写英文字母，则返回转换后的小写字母，否则直接返回c。|

在使用函数str_toupper和函数str_tolower遍历字符串的过程中，当发现目标字符s[i]时，会为其赋这些函数的返回值。

>► 如果c中接收的字符不是英文字符，则函数toupper和函数totower将原样返回字符c。因此函数str_toupper和函数str_tolower不会误将英文字符以外的字符转换。
>
>需要注意的是，这两个函数转换的对象是半角的英文字符，不能转换汉字等全角字符。

## 字符串数组的参数传递

我们来编写一个程序，在函数之间传递用二维数组实现的“字符串数组”。我们将前面代码显示字符串数组的程序改写了一下，这次使用了函数调用。请见代码清单 demo5.c。

**代码清单 demo5.c**

```c
/*
显示字符串数组（函数版）
*/
#include <stdio.h>

/*显示字符串数组*/
void put_strary(const char s[][6], int n) {
    int i;
    for (i = 0; i < n; i++)
        printf("s[%d] = \"%s\"\n", i, s[i]);
}

int main() {
    char cs[][6] = {"Turbo", "NA", "DOHC"};
    put_strary(cs, 3);

    return 0;
}
```

关于函数间二维数组的传递问题，我们己经学习过了，而字符串数组的传递也是一样的。

>► 在接收二维数组的形参的声明中，只有第一维的数组元素数可以省略。因此下面这样的声明是不正确的。
>
>```c
>void put_strary(const char st[][], int n)
>```
>而put_strary函数的意思是只能接收元素数为6的字符串(字符数组)数组。

***☆专题 非字符串的字符数组***

先看如下声明。

```
char str[4] = "ABCD";
```

算上null字符需要5个字符的空间，但数组只能接收4个字符。

事实上，若像下面这样进行声明，末尾就不会加上null字符。

```
char str[4] = {''A'',''B'',''C'',''D''};
```

这样声明的变量不会被当作字符串，我们把它当作4个字符的集合，也就是“普通的”数组来使用就行了。


通过对字符串中的每个元素(字符)进行遍历，也可以将字符串显示出来。请见代码清单 demo6.c

**代码清单 demo6.c**

```c
/*
显示字符串数组（函数版：逐字符遍历）
*/
#include <stdio.h>

/*显示字符串数组（逐个显示字符）*/
void put_strary2(const char s[][6], int n) {
    int i;
    for (i = 0; i < n; i++) {
        int j = 0;
        printf("s[%d] = \"", i);

        while (s[i][j])
            putchar(s[i][j++]);
        puts("\"");
    }
}

int main() {
    char cs[][6] = {"Turbo", "NA", "DOHC"};
    put_strary2(cs, 3);

    return 0;
}
```


## 作业

**● 练习 1**

>编写一个函数，使字符串s为空字符串。
>
>```c
>void null_string(char s[]){/*...*/}
>```

**● 练习 2**

>写如下函数，若字符串s中含有字符c(若含有多个，以先出现的为准)，则返回该元素的下标值，否则返回-1。
>
>```c
>int str_char(const char s[],int c){/*...*/}
>```

**● 练习 3**

>编写如下函数，返回字符串s中字符c的个数(没有则返回0)。
>
>```c
>int str_chnum(const char s[],int c){/*...*/}
>```

**● 练习 4**

>编写如下函数，使字符串s显示n次。
>
>```c
>void put_stringn(const char s[],int n){/*...*/}
>```
>
>例如，若s和分别为"ABC"和3,则显示"ABCABCABC"。

**● 练习 5**

>编写如下函数，实现字符串的逆向输出。
>
>```c
>void put_stringr(const char s[]){/*...*/}
>```
>
>例如，将"SEC* 显示为"CES"。

**● 练习 6**

>编写如下函数，逆向显示字符串s的字符。
>
>```c
>void rev_string(char s[]){/*...*/}
>```
>
>例如，若s中接收的是"SEC",则将其数组更新为“CES”。

**● 练习 7**

>编写如下函数，将字符串s中的数字字符全部删除。
>
>```c
>void del_digit(char s[]){/*...*/}
>```
>
>例如传入"AB1C9“则返回"ABC"。

**● 练习 8**

>编写如下函数，将所接收的字符串数组中存储的n个字符串的字符逆向显示。
>
>```c
>void rev_string(char s[][128],int n){/*...*/}
>```
>
>例如，若s中接收的是{"SEC","ABC"},则将其更新为{"CES","CBA"}。', 2, 2, NULL, '2020-05-21 18:21:33.231577', '2020-05-21 18:21:33.231577', 67);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (70, '预处理指令', NULL, 10, NULL, NULL, '', 9, 1, NULL, '2020-05-21 18:21:33.257417', '2020-05-21 18:21:33.257417', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (71, '什么是预处理命令', NULL, 10, NULL, NULL, '在编译和链接之前，还需要对源文件进行一些文本方面的操作，比如文本替换、文件包含、删除部分代码等，这个过程叫做预处理，由预处理程序完成。

前面各章中，已经多次使用过`#include`命令。使用库函数之前，应该用`#include`引入对应的头文件。这种以`#`号开头的命令称为**预处理命令**。

常用的预处理指令如下：

| 指令        | 说明                                                      |
| ----------- | --------------------------------------------------------- |
| #           | 空指令，无任何效果                                        |
| #include    | 包含一个源代码文件                                        |
| #define     | 定义宏                                                    |
| #undef      | 取消已定义的宏                                            |
| #if         | 如果给定条件为真，则编译下面代码                          |
| #ifdef      | 如果宏已经定义，则编译下面代码                            |
| #if defined | 多个条件判断时，替代 #ifdef                               |
| #ifndef     | 如果宏没有定义，则编译下面代码                            |
| #elif       | 如果前面的#if给定条件不为真，当前条件为真，则编译下面代码 |
| #endif | 结束一个#if……#else条件编译块 |

## 用途举例

下面我们举个例子来说明预处理命令的实际用途。假如现在要开发一个C语言程序，让它暂停 5 秒以后再输出内容，并且要求跨平台，在 Windows 和 Linux 下都能运行，怎么办呢？

这个程序的难点在于，不同平台下的暂停函数和头文件都不一样：

- Windows 平台下的暂停函数的原型是`void Sleep(DWORD dwMilliseconds)`（注意 S 是大写的），参数的单位是“毫秒”，位于 <windows.h> 头文件。
- Linux 平台下暂停函数的原型是`unsigned int sleep (unsigned int seconds)`，参数的单位是“秒”，位于 <unistd.h> 头文件。


不同的平台下必须调用不同的函数，并引入不同的头文件，否则就会导致编译错误，因为 Windows 平台下没有 sleep() 函数，也没有 <unistd.h> 头文件，反之亦然。这就要求我们在编译之前，也就是预处理阶段来解决这个问题。请看下面的代码：

```c
#include <stdio.h>
//不同的平台下引入不同的头文件
#if _WIN32  //识别windows平台
#include <windows.h>
#elif __linux__  //识别linux平台
#include <unistd.h>
#endif
int main() {
    //不同的平台下调用不同的函数
    #if _WIN32  //识别windows平台
    Sleep(5000);
    #elif __linux__  //识别linux平台
    sleep(5);
    #endif
    puts("https://banyuan.club/");
    return 0;
}
```

\#if、#elif、#endif 就是预处理命令，它们都是在编译之前由预处理程序来执行的。这里我们不讨论细节，只从整体上来理解。

对于 Windows 平台，预处理以后的代码变成：

```c
#include <stdio.h>
#include <windows.h>
int main() {
    Sleep(5000);
    puts("https://banyuan.club/");
    return 0;
}
```


对于 Linux 平台，预处理以后的代码变成：

```c
#include <stdio.h>
#include <unistd.h>
int main() {
    sleep(5);
    puts("https://banyuan.club/");
    return 0;
}
```


你看，在不同的平台下，编译之前（预处理之后）的源代码都是不一样的。这就是预处理阶段的工作，它把代码当成普通文本，根据设定的条件进行一些简单的文本替换，将替换以后的结果再交给编译器处理。', 1, 2, NULL, '2020-05-21 18:21:33.262653', '2020-05-21 18:21:33.262653', 70);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (72, '#include 用法', NULL, 10, NULL, NULL, '## #include

`#include`叫做文件包含命令，用来引入对应的头文件（`.h`文件）。目的很简单：将源代码分成多个文件时，用 #include 组装起来。

### 自定义头文件

假设有开发者 Tom 写了一个数学函数 sum，函数定义放在 arith.c 中；Jerry将在 main.c 中使用 sum 函数，代码目录布局如下：

```c
[~/demo]
    |_ [tom]
    |    |_ arith.c
    |_ main.c
```

tom/arith.c 所包含的代码：

```c
//计算从m加到n的和
int sum(int m, int n) {
    int i, sum = 0;
    for (i = m; i <= n; i++) {
        sum += i;
    }
    return sum;
}
```

main.c 所包含的代码：

```c
#include <stdio.h>
#include "tom/arith.c"
int main() {
    printf("%d\n", sum(1, 100));
    return 0;
}
```

编译运行 main.c

> $ gcc ./main.c 
>
> 5050

回忆一下函数章学习的 `extern`，Jerry 在写 main.c 时，完全可以直接声明 sum 函数原型，让 gcc 编译的时候再将 sum.c 的真正代码包含进来：

```c
#include <stdio.h>
extern int sum(int m, int n);  // 声明其他的地方有实现（Tom实现）
int main() {
    printf("%d\n", sum(1, 100));
    return 0;
}
```

编译链接时 gcc 命令指定 sum 函数定义的 .c文件，同样能运行。

> $ gcc ./main.c ./tom/arith.c
>
> 5050

如此看来，根本不需要使用 #include 啊。考虑这样的问题：随着时间的推移，Tom 提供的 arith.c 越来越强大，除了 sum 函数，还提供了 subtract、divide 等数不清的函数，arith.c 的 "能力" 只有 Tom知道，也就是说，sum、substract、divide 等含函数声明应该由 Tom 提供：

```c
extern int sum(int m, int n);
extern int substract(int m, int n);
extern int divide(int m, int n);
```

最佳实践就是：将上述函数声明统一放到 arith.h 文件。此时源代码目录布局看起来是这样：

```
[~/demo]
    |_ [tom]
    |    |_ arith.h
    |    |_ arith.c
    |_ main.c
```

现在 Jerry 在使用 arith.c 的 "能力" 时，main.c 修改如下：

```c
#include <stdio.h>
#include "tom/arith.h"
int main() {
    printf("%d\n", sum(1, 100));
    return 0;
}
```

和 extern 用法一样，编译链接时 gcc 命令指定 sum 函数定义的 .c文件，就可以正常运行了。

> $ gcc ./main.c ./tom/arith.c
>
> 5050

### 两种格式

```c
#include <stdHeader.h>
#include "myHeader.h"
```

使用尖括号`< >`和双引号`" "`的区别在于头文件的搜索路径不同：

- 而使用双引号`" "`，编译器首先在当前目录下查找头文件，如果没有找到，再到系统路径下查找。
- 使用尖括号`< >`，编译器会到系统路径下查找头文件，比如stdio.h 和 stdlib.h 这些标准头文件；

上面的例子 arith.h，就使用了双引号`" "`，而标准头文件我们一直用 `< >`，现在大家应该能理解了。不过根据这个规则，也可以使用双引号引用标准头文件：

```c
#include "stdio.h"
#include "stdlib.h"
```
不过谁会这么去做呢？完全没有必要。

如果想让你 tom/arith.h 使用 `< >`包含头文件：

```c
#include <stdio.h>
#include <arith.h>
int main() {
    printf("%d\n", sum(1, 100));
    return 0;
}
```

可以在 gcc 编译的时候指定 -I 参数说明头文件所在的路径：

> $ gcc ./main.c ./tom/arith.c -I./tom
>
> 5050

', 2, 2, NULL, '2020-05-21 18:21:33.290373', '2020-05-21 18:21:33.290373', 70);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (73, '#define 宏定义', NULL, 10, NULL, NULL, '**\#define** 叫做**宏定义命令**，它也是C语言预处理命令的一种。所谓宏定义，就是用一个标识符来表示一个字符串，如果在后面的代码中出现了该标识符，那么就全部替换成指定的字符串。

我们先通过一个例子来看一下 #define 的用法：

```c
#include <stdio.h>
#define N 100
int main(){
    int sum = 20 + N;
    printf("%d\n", sum);
    return 0;
}
```

运行结果：

>120

注意第 6 行代码`int sum = 20 + N`，`N`被`100`代替了。

`#define N 100`就是宏定义，`N`为宏名，`100`是宏的内容（宏所表示的字符串）。在预处理阶段，对程序中所有出现的“宏名”，预处理器都会用宏定义中的字符串去代换，这称为“宏替换”或“宏展开”。

宏定义是由源程序中的宏定义命令`#define`完成的，宏替换是由预处理程序完成的。

宏定义的一般形式为：

```c
#define 宏名 字符串
```

`#`表示这是一条预处理命令，所有的预处理命令都以 # 开头。`宏名`是标识符的一种，命名规则和变量相同。`字符串`可以是数字、表达式、if 语句、函数等。

> 这里所说的字符串是一般意义上的字符序列，不要和C语言中的字符串等同，它不需要双引号。

程序中反复使用的表达式就可以使用宏定义，例如：

```c
#define M (n*n+3*n)
```

它的作用是指定标识符`M`来表示`(y*y+3*y)`这个表达式。在编写代码时，所有出现 (y*y+3*y) 的地方都可以用 M 来表示，而对源程序编译时，将先由预处理程序进行宏代替，即用 (y*y+3*y) 去替换所有的宏名 M，然后再进行编译。

将上面的例子补充完整：

```c
#include <stdio.h>
#define M (n*n+3*n)
int main(){
    int sum, n;
    printf("Input a number: ");
    scanf("%d", &n);
    sum = 3 * M + 4 * M + 5 * M;
    printf("sum=%d\n", sum);
    return 0;
}
```

运行结果：

> Input a number: 10↙
> sum=1560

程序的开头首先定义了一个宏 M，它表示 (n\*n+3\*n) 这个表达式。在 9 行代码中使用了宏 M，预处理程序将它展开为下面的语句：

```
sum=3*(n*n+3*n)+4*(n*n+3*n)+5*(n*n+3*n);
```

需要注意的是，在宏定义中表达式`(n*n+3*n)`两边的括号不能少，否则在宏展开以后可能会产生歧义。下面是一个反面的例子：

```
#difine M n*n+3*n
```

在宏展开后将得到下述语句：

```c
s = 3 * n * n + 3 * n + 4 * n * n + 3 * n + 5 * n * n + 3 * n;
```

这相当于：

```c
3n^2 + 3n + 4n^2 + 3n + 5n^2 + 3n
```

这显然是不正确的。所以进行宏定义时要注意，应该保证在宏替换之后不发生歧义。

#### 对 #define 用法的几点说明

1) 宏定义是用宏名来表示一个字符串，在宏展开时又以该字符串取代宏名，这只是一种简单粗暴的替换。字符串中可以含任何字符，它可以是常数、表达式、if 语句、函数等，预处理程序对它不作任何检查，如有错误，只能在编译已被宏展开后的源程序时发现。

2) 宏定义不是说明或语句，在行末不必加分号，如加上分号则连分号也一起替换。

3) 宏定义必须写在函数之外，其作用域为宏定义命令起到源程序结束。如要终止其作用域可使用`#undef`命令。例如：

```c
#define PI 3.14159
int main(){
    // Code
    return 0;
}
#undef PI
void func(){
    // Code
}
```

表示 PI 只在 main() 函数中有效，在 func() 中无效。

4) 代码中的宏名如果被引号包围，那么预处理程序不对其作宏代替，例如：

```c
#include <stdio.h>
#define OK 100
int main(){
    printf("OK\n");
    return 0;
}
```

运行结果：

> OK

该例中定义宏名 OK 表示 100，但在 printf 语句中 OK 被引号括起来，因此不作宏替换，而作为字符串处理。

5) 宏定义允许嵌套，在宏定义的字符串中可以使用已经定义的宏名，在宏展开时由预处理程序层层代换。例如：

```c
#define PI 3.1415926
#define S PI*y*y    /* PI是已定义的宏名*/
```

对语句：

```c
printf("%f", S);
```

在宏代换后变为：

```c
printf("%f", 3.1415926*y*y);
```


6) 习惯上宏名用大写字母表示，以便于与变量区别。但也允许用小写字母。

7) 可用宏定义表示数据类型，使书写方便。例如：

```c
#define UINT unsigned int
```

在程序中可用 UINT 作变量说明：

```c
UINT a, b;
```

应注意用宏定义表示数据类型和用 typedef 定义数据说明符的区别。宏定义只是简单的字符串替换，由预处理器来处理；而 typedef 是在编译阶段由编译器处理的，它并不是简单的字符串替换，而给原有的数据类型起一个新的名字，将它作为一种新的数据类型。

请看下面的例子：

```
#define PIN1 int *
typedef int *PIN2;  // 也可以写作typedef int (*PIN2);
```

从形式上看这两者相似， 但在实际使用中却不相同。

下面用 PIN1，PIN2 说明变量时就可以看出它们的区别：

```c
PIN1 a, b;
```

在宏代换后变成：

```c
int *a, b;
```

表示 a 是指向整型的指针变量，而 b 是整型变量。然而：

```c
PIN2 a,b;
```

表示 a、b 都是指向整型的指针变量。因为 PIN2 是一个新的、完整的数据类型。由这个例子可见，宏定义虽然也可表示数据类型， 但毕竟只是简单的字符串替换。在使用时要格外小心，以避出错。', 3, 2, NULL, '2020-05-21 18:21:33.316561', '2020-05-21 18:21:33.316561', 70);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (74, '#if 条件编译', NULL, 10, NULL, NULL, '假如现在要开发一个C语言程序，让它输出红色的文字，并且要求跨平台，在 Windows 和 Linux 下都能运行，怎么办呢？

这个程序的难点在于，不同平台下控制文字颜色的代码不一样，我们必须要能够识别出不同的平台。

Windows 有专有的宏`_WIN32`，Linux 有专有的宏`__linux__`，以现有的知识，我们很容易就想到了 if/else，请看下面的代码：

```c
#include <stdio.h>
int main(){
    if(_WIN32){
        system("color 0c");
        printf("http://banyuan.club\n");
    }else if(__linux__){
        printf("\033[22;31mhttp://banyuan.club\n\033[22;30m");
    }else{
        printf("http://banyuan.club\n");
    }
    return 0;
}
```

但这段代码是错误的，在 Windows 下提示 __linux__ 是未定义的标识符，在 Linux 下提示 _Win32 是未定义的标识符。对上面的代码进行改进：

```c
#include <stdio.h>
int main(){
    #if _WIN32
        system("color 0c");
        printf("http://banyuan.club\n");
    #elif __linux__
        printf("\033[22;31mhttp://banyuan.club\n\033[22;30m");
    #else
        printf("http://banyuan.club\n");
    #endif
    return 0;
}
```

\#if、#elif、#else 和 #endif 都是预处理命令，整段代码的意思是：如果宏 _WIN32 的值为真，就保留第 4、5 行代码，删除第 7、9 行代码；如果宏 __linux__ 的值为真，就保留第 7 行代码；如果所有的宏都为假，就保留第 9 行代码。

这些操作都是在预处理阶段完成的，多余的代码以及所有的宏都不会参与编译，不仅保证了代码的正确性，还减小了编译后文件的体积。

这种能够根据不同情况编译不同代码、产生不同目标文件的机制，称为条件编译。条件编译是预处理程序的功能，不是编译器的功能。

条件编译需要多个预处理命令的支持，下面一一讲解。

## #if 的用法

\#if 用法的一般格式为：

```c
#if 整型常量表达式1
  程序段1
#elif 整型常量表达式2
  程序段2
#elif 整型常量表达式3
  程序段3
#else
  程序段4
#endif
```

它的意思是：如常“表达式1”的值为真（非0），就对“程序段1”进行编译，否则就计算“表达式2”，结果为真的话就对“程序段2”进行编译，为假的话就继续往下匹配，直到遇到值为真的表达式，或者遇到 #else。这一点和 if else 非常类似。

> NOTE:  需要注意的是，#if 命令要求判断条件为“整型常量表达式”，也就是说，表达式中不能包含变量，而且结果必须是整数；而 if 后面的表达式没有限制，只要符合语法就行。这是 #if 和 if 的一个重要区别。

\#elif 和 #else 也可以省略，如下所示：

```c
#include <stdio.h>
int main(){
    #if _WIN32
        printf("This is Windows!\n");
    #else
        printf("Unknown platform!\n");
    #endif
   
    #if __linux__
        printf("This is Linux!\n");
    #endif
    return 0;
}
```

## #ifdef 的用法

\#ifdef 用法的一般格式为：

```c
#ifdef  宏名
  程序段1
#else
  程序段2
#endif
```

它的意思是，如果当前的宏已被定义过，则对“程序段1”进行编译，否则对“程序段2”进行编译。

也可以省略 #else：

```c
\#ifdef  宏名
  程序段
\#endif
```


MSVC 有两种编译模式，Debug 和 Release。在学习过程中，我们通常使用 Debug 模式，这样便于程序的调试；而最终发布的程序，要使用 Release 模式，这样编译器会进行很多优化，提高程序运行效率，删除冗余信息。

为了能够清楚地看到当前程序的编译模式，我们不妨在程序中增加提示，请看下面的代码：

```c
#include <stdio.h>
#include <stdlib.h>
int main(){
    #ifdef _DEBUG
        printf("正在使用 Debug 模式编译程序...\n");
    #else
        printf("正在使用 Release 模式编译程序...\n");
    #endif
    system("pause");
    return 0;
}
```

当以 Debug 模式编译程序时，宏 _DEBUG 会被定义，预处器会保留第 5 行代码，删除第 7 行代码。反之会删除第 5 行，保留第 7 行。

## #ifndef 的用法

\#ifndef 用法的一般格式为：

```c
#ifndef 宏名
  程序段1 
#else 
  程序段2 
#endif
```

与 #ifdef 相比，仅仅是将 #ifdef 改为了 #ifndef。它的意思是，如果当前的宏未被定义，则对“程序段1”进行编译，否则对“程序段2”进行编译，这与 #ifdef 的功能正好相反。

## 三者之间的区别

最后需要注意的是：

* \#if 后面跟的是“整型常量表达式”；

* 而 #ifdef 和 #ifndef 后面跟的只能是一个宏名，不能是其他的。

例如，下面的形式只能用于 #if：

```c
#include <stdio.h>
#define NUM 10
int main(){
    #if NUM == 10 || NUM == 20
        printf("NUM: %d\n", NUM);
    #else
        printf("NUM Error\n");
    #endif
    return 0;
}
```

运行结果：

> NUM: 10

再如，两个宏都存在时编译代码A，否则编译代码B，应该用 #if defined 替代 #ifdef：

```c
#include <stdio.h>
#define NUM1 10
#define NUM2 20
int main(){
    #if (defined NUM1 && defined NUM2)
        //代码A
        printf("NUM1: %d, NUM2: %d\n", NUM1, NUM2);
    #else
        //代码B
        printf("Error\n");
    #endif
    return 0;
}
```

运行结果：

> NUM1: 10, NUM2: 20

\#ifdef 可以认为是 #if defined 的缩写。', 4, 2, NULL, '2020-05-21 18:21:33.342772', '2020-05-21 18:21:33.342772', 70);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (75, '写在课程之前', NULL, 20, NULL, NULL, '## 课程目的

“导论” 是进入任何一门专业领域应该学习的第一课，目的是使初学者了解整个计算机知识体系，建立基本的专业知识结构，为后续学些打下坚实的理论基础。

## 课程介绍

现代计算机发展几十年来，无论怎样日新月异，基础计算机科学都未曾有多少变化，始终围绕冯·诺依曼模型演化。本课程专述这些绕不过的基础知识，一旦学完，老师和学员之间将可以用专业的术语来交流问题了。

因为采用广度优先的原则，除了数字系统，大家要用学习科普知识一样的心态来学习它，如有特别晦涩不理解的地方，不要钻牛角尖，做好标记，在未来学习编程一段时间再回头来看，可能会豁然开朗。

本

## 预备知识

* 会用Markdown 记录学习笔记，养成习惯；

如果你是一个小白用户，通常在下面的前置课程，就可以掌握 Markdown。

## 前置课程

* 《半圆入学预备课》

', 0, 1, NULL, '2020-05-21 18:21:33.384231', '2020-05-21 18:21:33.384231', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (76, '绪论', NULL, 20, NULL, NULL, '今天，"计算机科学"一词是一个非常广泛的概念。尽管如此，在本课程中，我们将其定义为"和计算机相关的问题"。本章首先阐述什么是计算机，接着探索和计算机直接相关的一些问题。首先我们将计算机看成一个图灵模型，这是从数学上和哲学上对计算的定义。然后，阐明当今的计算机是如何建立在冯·诺依曼模型基础上的。最后介绍计算机这一改变文明的装置的简明历史。

## 图灵模型和图灵机

[Alan Turin吕(阿兰·图灵)](https://en.wikipedia.org/wiki/Alan_Turing)在1937年首次提出了一个通用计算设备的设想。他设想所有的计算都可能在一种特殊的机器上执行，这就是现在所说的图灵机。尽管图灵对这样一种机器进行了数学上的描述，但他还是更有兴趣关注计算的哲学定义，而不是建造一台真实的机器。他将该模型建立在人们进行计算过程的行为上，并将这些行为抽象到用于计算的机器的模型中，这才真正改变了世界。

**通用图灵机**是对现代计算机的首次描述，该机器只要提供了合适的程序就能做任何运算。可以证明，一台很强大的计算机和通用图灵机一样能进行同样的运算。我们所需要的仅仅是为这两者提供数据以及用于描述如何做运算的程序。实际上，通用图灵机能做任何可计算的运算。

## 冯·诺依曼模型

基于通用图灵机建造的计算机都是在存储器中储存数据。在1944～1945年期间，[冯·诺依曼](https://baike.baidu.com/item/%E7%BA%A6%E7%BF%B0%C2%B7%E5%86%AF%C2%B7%E8%AF%BA%E4%BE%9D%E6%9B%BC/986797?fr=aladdin)指出，鉴于程序和数据在逻辑上是相同的，因此程序也能存储在计算机的存储器中。
### 1. 四个子系统

基于冯·诺依曼模型建造的计算机分为4个子系统存储器、算术逻辑单元、控制单元和输入/输出单元(见下图)。

<img src="https://img-camp.banyuan.club/online/foundation/ch01/neumann.svg" style="width:550px;padding:30px 0;"/>

**1). 存储器**
存储器是用来存储的区域，在计算机的处理过程中存储器用来存储数据和程序，我们将在这一章后边讨论存储数据和程序的原因。

**2). 算术逻辑单元**
算术逻辑单元(ALU)是用来进行计算和逻辑运算的地方。如果是一台数据处理计算机，它应该能够对数据进行算术运算(例如进行一系列的数字相加运算)。当然它也应该可以对数据进行一系列逻辑运算，正如我们将在[[course:cs-basic:数学运算|数学运算章]]看到的那样。

**3). 控制单元**
控制单元是对存储器、算术逻辑单元、输入/输出等子系统进行控制操作的单元。

**4). 输入/输出**
输入子系统负责从计算机外部接收输入数据和程序；输出子系统负责将计算机的处理结果输出到计算机外部。输入/输出子系统的定义相当广泛，它们还包含辅助存储设备，例如，用来存储处理所需的程序和数据的磁盘和磁带等。当一个磁盘用于存储处理后的输出结果，我们一般就可以认为它是输出设备，如果从该磁条上读取数据，则该磁盘就被认为是输入设备。

### 2. 存储程序概念

冯·诺依曼模型中要求程序必须存储在内存中。这和早期只有数据才存储在存储器中的计算机结构完全不同。完成某一任务的程序是通过操作一系列的开关或改变其配线来实现的。

现代计算机的存储单元用来存储程序及其响应数据。这意味着数据和程序应该具有相同的格式，这是因为它们都存储在存储器中。实际上它们都是以位模式(0和1序列)存储在内存中的。
### 3. 指令的顺序执行
冯·诺依曼模型中的一段程序是由一组数量有限的指令组成。按照这个模型，控制单元从内存中提取一条指令，解释指令，接着执行指令。换句话说，指令就一条接着一条地顺序执行，当然，一条指令可能会请求控制单元以便跳转到其前面或者后面的指令去执行，但是这并不意味着指令没有按照顺序来执行。指令的顺序执行是基于冯·诺依曼模型的计算机的初始条件。当今的计算机以最高效的顺序来执行程序。

## 计算机组成部分

我们可以认为计算机由三大部分组成计算机硬件、数据和计算机软件。

### 1. 计算机硬件

当今的计算机硬件基于冯·诺依曼模型，且包含四部分，尽管可以有不同类型的存储单元，不同类型的输入/输出子系统等。在 "计算机组成" 章我们将详细讨论计算机硬件。

<a href="https://img-camp.banyuan.club/online/foundation/ch01/computer-composition.png" target="_blank">
<img src="https://img-camp.banyuan.club/online/foundation/ch01/computer-composition.png" width="600" alt="冯诺依曼-计算机硬件" align=center />
</a>

### 2. 数据

冯·诺依曼模型清楚#将一台计算机定义为一台数据处理机。它接收输入数据，处理并输出相应的结果。

#### 1). 存储数据

冯·诺依曼模型并没有定义数据如何存储在计算机中。如果一台计算机是一台电子设备，最好的数据存储方式应该是电子信号，例如以电子信号的出现和消失的特定方式来存储数据，这意味着一台计算机可以以两种状态之一的形式来存储数据。

显然，在日常使用的数据并不是以两种状态之一的形式存在，例如，我们在数字系统中使用的数字可以是0～9十种状态中的任何一个。但是你不能(至少到目前为止)将这类信息存储到计算机内部，除非将这类信息变换成另一种只使用两种状态(0和1)的系统。同样，你也需要处理其他类型的数据(例如文本、图像、声音、视频)，它们同样也不能直接存储到计算机中，除非将它们转变成合适的形式(0和1序列)。

在第3章数据存储中，我们将会了解不同类型的数据是怎样以0和1序列的二进制的形式存储在计算机内部的。第4章数据运算将介绍在计算机内部由二进制组成的数据是怎样被操作处理的。

#### 2). 组织数据

尽管数据只能以一种形式(位模式)存储在计算机内部，但在计算机外部却可以表现为不同的形式。另外，计算机(以及数据处理表示法)开创了一门新兴的研究领城——数据组织。在将数据存储到计算机中之前，能否有效地将数据组织成不同的实体和格式？如今，数据并不是按照杂乱无章的次序来组织信息的。数据被组织成许多小的单元，再由这些小的单元组成更大的单元，等等。在数据结构及后面的章节中，我们将会从这个角度去认识数据。

### 3. 计算机软件

图灵或冯·诺依曼模型的主要特征是程序的概念。尽管早期的计算机并没有在计算机的存储器中存储程序，但它们还是使用了程序的概念。编程在早期的计算机中体现为系列开关的打开或闭合以及配线的改变。编程在数据实际开始处理之前是由操作员或工程师完成的一项工作。

#### 1). 程序必须是存储的

在冯·诺依曼模型中，这些程序被存储在计算机的存储器中，存储器中不仅要存储数据，还要存储程序(见下图)。

<img src="https://img-camp.banyuan.club/online/foundation/ch01/memory.svg" style="width:150px;padding:30px 0;"/>

#### 2). 指令的序列

这个模型还要求程序必须是有序的指令集。每一条指令存储器操作一个或者多个数据项。因此，一条指令可以改变它前面指令的作用。例如，下图显示了一个输入两个数据，将它们相加，最后打印出结果的程序。这段程序包含4个独立的指令集。

<img src="https://img-camp.banyuan.club/online/foundation/ch01/program.svg" style="width:350px;padding:30px 0;"/>

也许我们会问为什么程序必须由不同的指令集组成，答案是重用性。如今，计算机程序完成成千上万的任务，如果每一项任务的程序都是相对独立而且和其他程序之间没有任何的公用段，编程将会变成一件很困难的事情。图灵模型和冯·诺依曼模型通过仔细地定义计算机可以使用的不同指令集，从而使得编程变得相对简单工程序员通过组合这些不同的指令来创建任意数量的程序。每个程序可以是不同指令的不同组合。

#### 3). 算法

要求程序包含一系列指令使得编程变得可能，但也带来了另外一些使用计算机方面的问题工程序员不仅要了解每条指令所完成的任务，还要知道怎样将这些指令结合起来完成一些特定的任务。对于一些不同的问题工程序员首先应该以循序渐进的方式来解决问题，接着尽量找到合适的指令(指令序列)来解决问题。这种按步骤解决问题的方法就是所谓的算法。算法在计算机科学中起到了重要的作用，我们将在第8章中讨论。

#### 4). 语言

在计算机时代的早期，只有一种称为机器语言的计算机语言。程序员依靠写指令的方式(使用位模式)来解决问题。但是随着程序越来越大，采用这种模式来编写很长的程序变得单调乏味。计算机科学家们研究出利用符号来代表位模式，就像人们在日常中用符号(单词)来代替一些常用的指令一样。当然，人们在日常生活中所用的一些符号与计算机中所用的符号不同。这样计算机语言的概念诞生了。自然语言(例如英语)是丰富的语言，并有许多正确组合单词的规则相对而言，计算机语言只有比较有限的符号和单词。第9章将介绍计算机语言。

#### 5). 软件工程

在冯·诺依曼模型中没有定义软件工程，软件工程是指结构化程序的设计和编写。今天，它不仅仅是用来描述完成某一任务的应用程序，还包括程序设计中所要严格遵循的原理和规则。我们所讨论的这些原理和规则综合起来就是第10章中要说的软件工程。

#### 6). 操作系统

在计算机发展演变过程中，科学家们发现有一系列指令对所有程序来说是公用的。例如，一条告诉计算机在哪接收和发送数据的指令在几乎所有的程序中都要用到。如果这些指令只编写一次就可以用于所有程序，那么效率将会大大提高。这样，就出现了操作系统的概念。计算机操作系统最初是为程序访问计算机部件提供方便的一种管理程序。今天，操作系统所完成的工作远不止这些，具体的内容将在第7章介绍。

## 历史

在本节，我们简要回顾一下计算和计算机的历史。我们将其分为三个阶段。

### 1 机械计算机器(1930年以前)

在这个阶段，人们发明了一些用来进行计算的机器，它们与计算机的现代概念几乎没有相似之处。

  * 在17世纪，法国著名的数学家和物理学家[布莱斯·帕斯卡(Blaise Pascal)](https://en.wikipedia.org/wiki/Blaise_Pascal)发明了[Pascaline](https://en.wikipedia.org/wiki/Pascal%27s_calculator)，一个用来进行加减运算的计算机器。到了20世纪，当[尼克劳斯·沃思(Niklaus Wirth)](https://en.wikipedia.org/wiki/Niklaus_Wirth)发明了一种结构化的程序设计语言，他将其命名为[Pascal](https://en.wikipedia.org/wiki/Pascal)语言，用来纪念这位发明首台机械计算器的科学家。
  * 在17世纪后期，德国数学家[戈特弗里德·莱布尼茨(Gottfried Leibnitz)](https://en.wikipedia.org/wiki/Gottfried_Wilhelm_Leibniz)发明了既能够做乘除运算又能做加减运算的一台更加复杂的计算机器。这台机器被称为[莱布尼茨之轮(Leibniz wheel)](https://en.wikipedia.org/wiki/Leibniz_wheel)。
  * 第一台利用存储和编程概念的机器是[雅卡尔提花织机(Jacquard loom)](https://en.wikipedia.org/wiki/Jacquard_loom)，它是由[约瑟夫一玛丽·雅卡尔(Joseph-Marie Jacquard)](https://en.wikipedia.org/wiki/Joseph_Marie_Jacquard)在19世纪初期发明的。这种织布机是利用穿孔卡(类似于存储程序)来控制在织布过程中经线的提升。
  * 1823年，[查尔斯·巴比奇(Charles Babbage)](https://en.wikipedia.org/wiki/Charles_Babbage)发明了一种差分引擎，它不仅能够很容易地进行数学运算，还可以解多项式方程。后来，他发明了一种叫做分析引擎的机器，在某种程度上和现代计算机的概念类似。该机器有4个组成部分，一个制造场(现在的算术逻辑单元)、一个存储单元(存储器)、一个操作者(控制单元)和输出单元(输入/输出)。
  * 1890年，在美国人口普査办公室工作的[赫尔曼·何勒里斯(Herman Hollerith)](https://en.wikipedia.org/wiki/Herman_Hollerith)设计并制造出具有编程能力的机器，该机器可以自动阅读、计数和排列存储在穿孔卡上的数据。

### 2 电子计算机的诞生(1930～1950年)

1930～1950年，那些被视为电子计算机工业先驱的科学家们发明了一些计算机。

#### 1). 早期的电子计算机

这一时期的早期计算机并不是将程序存储到存储器··所有的计算机都是在外部进行编程的。有以下5种比较杰出的计算机

  * 第一台用来完成特定任务的计算机是通过将信息进行电子编码来实现其功能的，它是由[约翰·阿塔纳索夫(John V.Atanasoff)](https://en.wikipedia.org/wiki/John_Vincent_Atanasoff)及其助手[克利福德·贝里(Clifford Berry)](https://en.wikipedia.org/wiki/Clifford_Berry)于1939年发明的。它又被称为[ABC(Atanasoff Berry Computer)](https://en.wikipedia.org/wiki/Atanasoff%E2%80%93Berry_computer)，主要用于实现解线性方程的系统。
  * 在同一时期，名为[康拉德·朱斯(Konrad Zuse)](https://en.wikipedia.org/wiki/Konrad_Zuse)的德国数学家设计出通用计算机，并命名为"[Z1](https://en.wikipedia.org/wiki/Z1_(computer))"。
  * 在20世纪30年代，美国海军和IBM公司在哈佛大学发起创建了一项工程，在[华德·艾肯(Howard Aiken)](https://en.wikipedia.org/wiki/Howard_H._Aiken)的直接领导下发明建造了一台名为[Mark I](https://en.wikipedia.org/wiki/Harvard_Mark_I)的巨型计算机。这种计算机既使用了电子部件，也使用了机械部件。
  * 在英国，阿兰·图灵发明了一台名为[巨人(Colossus)](https://en.wikipedia.org/wiki/Colossus_computer)的计算机，这台计算机是为破译德国[Enigma](https://en.wikipedia.org/wiki/Enigma_machine)密码而设计的。
  * 第一台通用的、完全电子的计算机由[约翰·莫奇勒(John Mauchly)](https://en.wikipedia.org/wiki/John_Mauchly)和[普雷斯波·埃克特(J.Presper Eckert)](https://en.wikipedia.org/wiki/J._Presper_Eckert)发明，这台计算机被称为[ENIAC(Electronic Numerical Integrator and Calculator，电子数字集成器和计算器)](https://en.wikipedia.org/wiki/ENIAC)。它是在1946年完成设计的，利用了将近18 000个集成块，有100英尺长，10米英尺高，重达30吨。

#### 2). 基于冯·诺依曼模型的计算机

前面5种计算机的存储单元仅仅用来存放数据。它们利用配线或开关进行外部编程。冯·诺依曼提出了程序和数据应该存储在存储器中。按照这种方法，每次使用计算机来完成一项新的任务。你只需要改变程序，而不用重新布线或者调节成百上千的开关。

第一台基于冯氏思想的计算机于1950年在宾夕法尼亚大学诞生，命名为[EDVAC](https://en.wikipedia.org/wiki/EDVAC)。与此同时，英国剑桥大学的[莫里斯·威尔克斯(Maurice Wilkes)](https://en.wikipedia.org/wiki/Maurice_Wilkes)制造了同样类型的被称为[EDSAC](https://en.wikipedia.org/wiki/EDSAC)的计算机。

### 3. 计算机的诞生（1950年至今）

1950年以后出现的计算机都差不多基于冯·诺依曼模型。它们变得更快、更小、更便宜，但原理几乎是相同的。历史学家将这一时期划分为几代，每一代计算机的改进主要体现在硬件或软件方面(而不是模型)。

<img src="https://img-camp.banyuan.club/online/foundation/ch01/history3.svg" style="padding:30px 0;"/>

#### 1). 第一代计算机

第一代计算机(大约1950～1959年)以商用计算机的出现为主要特征。在这个时期，计算机只有专家们才能使用。它们被锁在房子里，限制操作者和计算机专家以外的人员进人。计算机体积庞大，且使用真空管作为电子开关。此时的计算机只有大的机构才能负担得起。

#### 2). 第二代计算机

第二代计算机（大约1959～1965年）使用晶体管代替真空管。这既减小了计算机舱体积，也节省了开支，从而使得中小型企业也可以负担得起。[FORTRAN](https://en.wikipedia.org/wiki/Fortran#FORTRAN)和[COBOL](https://en.wikipedia.org/wiki/COBOL)(参见第9章)两种高级计算机程序设计言的发明使得编程更加容易。这两种语言将编程任务和计算机运算任务分离开来。一个土木工程师能够直接编写一个FORTRAN程序来解决问题，而不必涉及计算机结构中的具体电子细节。

#### 3). 第三代计算机

集成电路(晶体管、导线以及其他部件做在一块单芯片上)的发明更加减少了计算机的成本和大小。小型计算机出现在市场上。封装的程序，就是通常所说的软件包也已经有售。小型公司可以买到需要的软件包(如会计程序)，而不必写自己的程序。一个新的工业——软件工业就此诞生了。这个时期大概从1965年持续到1975年。

#### 4). 第四代计算机

第四代计算机(大约1975～1985年)出现了微型计算机。第一个[桌面计算器(Altair
8800)](https://en.wikipedia.org/wiki/Altair_8800)出现在1975年。电子工业的发展允许整个计算机子系统做在单块电路板上。这一时代还出现了计算机网络(参见第6章)。

#### 5). 第五代计算机

这个还未终止的时代始于1985年。这个时代见证了掌上计算机和台式计算机的诞生、第二代存储媒体(CD-ROM、DVD等)的改进、多媒体的应用以及虚拟现实现象。

## 计算机科学作为一门学科

随着计算机的发明，带来了新的学科计算机科学。如同其他任何学科一样，计算机科学现在被划分成几个领域。我们可以把这些领域归纳为两大类：系统领域和应用领域。

* 系统领域：涵盖那些与硬件和软件构成直接有关的领域，例如计算机体系结构、计算机网络、安全问題、操作系统、算法工程序设计语言以及软件工程。

* 应用领域：涵盖了与计算机使用有关的领域，例如数据库和人工智能。例如数据库和人工智能。

本课裁剪了最必要的计算机最基础的知识，采用广度优先的方式介绍，为后续编程课做好理论铺垫。', 1, 1, NULL, '2020-05-21 18:21:33.43585', '2020-05-21 18:21:33.43585', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (77, '数字系统', NULL, 20, NULL, NULL, '## 引言

**数字系统**(或数码系统)定义了如何用独特的符号来表示一个数字。在不同的系统中，一个数字有不同的表示方法。例如，这两个数字 (2A)<sub>16</sub> 和 (52)<sub>8</sub> 都是指同样的数量 (42)<sub>10</sub>，但是他们的表示截然不同。这就如同使用法语单词 cheval 和拉丁语单词 equus 来指称同一个实体"马"一样。

一些数学系统巳经在过去广为使用，并可以分为两类位置化系统和非位置化系统。我们的主要目标是讨论位置化数字系统。

## 位置化数字系统

在位置化数学系统中，数字中符号所占据的位置决定了其表示的值。在该系统中，数字这样表示

>±(S<sub>k-1</sub>...S<sub>2</sub>S<sub>1</sub>S<sub>0</sub>.S<sub>-1</sub>S<sub>-2</sub>...S<sub>-l</sub>)<sub>b</sub>

它的值是

>n = ±S<sub>k-1</sub>×b<sup>k-1</sup>+...S<sub>1</sub>×b<sup>1</sup>+S<sub>0</sub>×b<sup>0</sup>+S<sub>-1</sub>×b<sup>-1</sup>+S<sub>-2</sub>×b<sup>-2</sup>+...+S<sub>-l</sub>×b<sup>-l</sup>

其中，S是一套符号集；b是**底**(或**基数**)，它等于S符号集中的符号总数，其中S<sub>1</sub>和S<sub>k</sub>是代表分数部分或整个数字的符号。注意我们使用的表达式可以从右边或从左边扩展。也就是说，b的幂可以从一个方向由0到k-1，还可以从另一个方向由-1到-l。b的非负数幂与该数字的整数部分有关，而负数幂与该数字的小数部分有关。土符号表示该数字可正可负。

###  1. 十进制系统(以10为底)

首先讨论的位置化数字系统是**十进制系统**。decimal(十进制)来源于拉丁词根decimal(十)。在该系统中，底b=10并且我们用10个符号来表示一个数。符号集是S ={0,1,2,3,4,5,6,7,8,9}。正如我们所知，该系统中的符号常被称为**十进制数码**或仅称为数码。本章中，我们使用土符号表示一个数可正可负。在十进制系统中，数字写为：

>±(S<sub>k-1</sub>...S<sub>2</sub>S<sub>1</sub>S<sub>0</sub>.S<sub>-1</sub>S<sub>-2</sub>...S<sub>-l</sub>)<sub>10</sub>

但是为了简便，我们通常省略圆括号、底和正号(对于正数)。例如，我们把+(552.23)<sub>10</sub>写成552.23，底和加号是隐含的。

**1. 整数**

在十进制系统中，整数(没有小数部分的整型数字)是我们所熟悉的，我们在日常生活中使用整数。实际上，我们使用它已经习以为常。我们把整数表示为±S<sub>k-1</sub>...S<sub>2</sub>S<sub>1</sub>S<sub>0</sub>，其值计算为：

>N=±S<sub>k-1</sub>×10<sup>k-1</sup>+S<sub>k-2</sub>×10<sup>k-2</sup>+...+S<sub>2</sub>×10<sup>2</sup>+S<sub>1</sub>×10<sup>1</sup>+S<sub>0</sub>×10<sup>0</sup>

其中，S<sub>k</sub>是1个数码，b=10是底，k是数码的数量。

另一种在数字系统中显示一个整数的方法是使用**位置量**，即用10的幂(10<sup>0</sup>，10<sup>1</sup>...，10<sup>k-1</sup>)表示十进制数字。图2-1显示了在十进制系统中使用位置量表示一个整数。

![图2-1](https://img-camp.banyuan.club/online/foundation/chapter2/2-1.png?x-oss-process=image/resize,w_700/sharpen,100)

**▷ 例 1** 以下显示了在十进制系统中使用位置量表示整数 +224。  

<pre style="background:#f9f9f9;">
      10<sup>2</sup>         10<sup>1</sup>        10<sup>0</sup>      位置量
      2           2          4       数字
N=+   2 x 10<sup>2</sup>  +  2 x 10<sup>1</sup>  + 4 x 10<sup>0</sup>  值
</pre>

**▷ 例2** 以下显示了在十进制系统中使用位置量表示整数 -7508。我们已经使用1、10、100和1000来代替10的幂。

![例2](https://img-camp.banyuan.club/online/foundation/chapter2/2-1-a.png?x-oss-process=image/resize,w_650/sharpen,100)

**2.实数**

在十进制系统中，实数(带有小数部分的数字)也是我们所熟悉的。例如，使用该系统来表示元和分($23.40)整数。我们可以把实数表示为 ±S<sub>k-1</sub>...S<sub>1</sub>S<sub>0</sub>·S<sub>-1</sub>...S<sub>-l</sub>，其值计算为：

![2.实数](https://img-camp.banyuan.club/online/foundation/chapter2/2-1-b.png?x-oss-process=image/resize,w_650/sharpen,100)

其中，S<sub>1</sub>是1个数码，b=10是底，k是整数部分数码的数量，l是小数部分数码的数量。十进制小数点是我们用于分割整数部分和小数部分的。

**▷ 例3** 以下显示了实数+24.13的位置量。

![例3](https://img-camp.banyuan.club/online/foundation/chapter2/2-1-c.png?x-oss-process=image/resize,w_650/sharpen,100)

### 2. 二进制系统(以2为底)

我们在本章中讨论的第二种位置化数字系统是二进制系统。binary(二进制)来源于拉丁词根bini(二)。在该系统中，底b=2并且我们用两个符号来表示一个数，即 S = {0, 1}。该系统中的符号常被称为**二进制数码或位**(位数码)。如我们将要在后面章节看到的，数据和程序是以二进制模式(即位串)。存储于计算机中的。这是因为计算机由电子开关制成，它们仅有开和关两种状态。1位表示这两种状态之一，0位表示另一种状态。

**1. 整数**

我们可以把整数表示为±(S<sub>k-1</sub>...S<sub>1</sub>S<sub>0</sub>)<sub>2</sub>，其值计算为

>N=±S<sub>k-1</sub>×2<sup>k-1</sup>+S<sub>k-2</sub>×2<sup>k-2</sup>+...+S<sub>2</sub>×2<sup>2</sup>+S<sub>1</sub>×2<sup>1</sup>+S<sub>0</sub>×2<sup>0</sup>

其中,S<sub>i</sub>是1个数码。b=2是底，k是数码的数量。

另一种表示二进制数的方法是使用位置量(2<sup>0</sup>，2<sup>1</sup>，...，2<sup>k-1</sup>)。图2-2显示了在二进制系统中使用位置量表示一个数。

![图2-2](https://img-camp.banyuan.club/online/foundation/chapter2/2-2.png?x-oss-process=image/resize,w_560/sharpen,100)

**▷ 例 4** 以下显示了与十进制数25等值的二进制数(11001)<sub>2</sub>。加下标2表示底是2。

![例4](https://img-camp.banyuan.club/online/foundation/chapter2/2-2-a.png?x-oss-process=image/resize,w_650/sharpen,100)

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **注意，相等的十进制数为 N = 16 + 8 + 0 + 0 + 1 = 25。**

**2.实数**

在二进制系统中，一个实数(可带有小数部分的数字)可以由左边的k位和右边的l位组成，±(S<sub>k-1</sub>...S<sub>1</sub>S<sub>0</sub>·S<sub>-1</sub>...S<sub>-l</sub>)<sub>2</sub>，其值计算为

               整数部分                  小数部分   
>R=± ***S<sub>k-1</sub>×2<sup>k-1</sup>+···+S<sub>1</sub>×2<sup>1</sup>×S<sup>0</sup>×2<sup>0</sup>*** +   >S<sub>-1</sub>×2<sup>-1</sup>+···+S<sub>-l</sub>×2<sup>-l</sup>  

其中，S<sub>i</sub> 是1个位，b=2是底，k是小数点左边位的数量，l是小数点右边位的数量。注意 k 是从0开始，而 l 从-1开始。最高的幂是k-1且最低的幂是-l。

**▷ 例 5** 以下显示了与十进制数5.75等值的二进制数(101.11)<sub>2</sub> 。

![例5](https://img-camp.banyuan.club/online/foundation/chapter2/2-2-b.png?x-oss-process=image/resize,w_650/sharpen,100)

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **注意，相等的十进制数为 R = 4 + 0 + 1 + 0.5 + 0.25 = 5.75。**

### 3. 十六进制系统(以16为底) 

尽管二进制系统用于存储计算机数据，但是它并不便于在计算机外部表示数字，因为与十进制符号相比，二进制符号过长。然而，十进制不像二进制那样直接显示存储在计算机中的是什么。在二进制位数和十进制数字之间没有显然的关系。正如我们看到的那样，它们之间的转换也不快捷。

为了克服这个问题，发明了两种位置化系统十六进制和八进制。我们先讨论更常用的十六进制系统。**hexadecimal(十六进制)** 来源于希腊词根hex(六)和拉丁词根decem(十)。为了和十进制与二进制一致，它应该称作 sexadecimal，根据拉丁词根 sex 和 decem 。

在该系统中，底b=16并且用16个符号来表示一个数。字符集是 S = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, B, F}。注意符号A, B, C, D, E, F（大写或小写）分别等于10, 11, 12, 13, 14 和 15。该系统中的符号常被称为十六进制数码。

**1. 整数**

我们可以把整数表示为±(S<sub>k-1</sub>...S<sub>1</sub>S<sub>0</sub>)<sub>16</sub>，其值计算为

>N=±S<sub>k-1</sub>×16<sup>k-1</sup>+S<sub>k-2</sub>×16<sup>k-2</sup>+...+S<sub>2</sub>×16<sup>2</sup>+S<sub>k-1</sub>×16<sup>1</sup>+S<sub>0</sub>×16<sup>0</sup>

其中，S<sub>i</sub>是1个数码，b=16是底，k是数码的数量。

另一种表示十六进制数的方法是使用位置量(16<sup>0</sup>，16<sup>1</sup>，...，16<sup>k-1</sup>)。图2-3显示了在十六进制系统中使用位置量表示一个数。

![2.2.3整数](https://img-camp.banyuan.club/online/foundation/chapter2/2-3.png?x-oss-process=image/resize,w_600/sharpen,100)

**图 2-3 在十六进制系统中使用位置量表示整数**



**▷ 例6** 以下显示了与十进制数686的十六进制数(2AE)<sub>16</sub>。

![例6](https://img-camp.banyuan.club/online/foundation/chapter2/2-3-a.png?x-oss-process=image/resize,w_650/sharpen,100)  

**2. 实数**

尽管一个实数可以用十六进制系统表示，但并不常见。

### 4. 八进制系统(以8为底)

人们发明的与二进制系统等价并用于计算机外部的第二种系统是**八进制系统**。octal(八进制)来源于拉丁词根octo(八)。在该系统中，底b=8并且用8个符号来表示一个数。字符集是 S = {0, 1, 2, 3, 4, 5, 6, 7}。该系统中的符号常被称为**八进制数码**。

**1.整数**

我们可以把整数表示为±(S<sub>k-1</sub>...S<sub>1</sub>S<sub>0</sub>)<sub>8</sub>，其值计算为

>N=±S<sub>k-1</sub>×8<sup>k-1</sup>+S<sub>k-2</sub>×8<sup>k-2</sup>+...+S<sub>2</sub>×8<sup>2</sup>+S<sub>1</sub>×8<sup>1</sup>+S<sub>0</sub>×8<sup>0</sup>

其中，S<sub>i</sub>是1个数码，b=8是底，k是数码的数量。

另一种表示八进制数的方法是使用位置量(8<sup>0</sup>，8<sup>1</sup>，...，8<sup>k-1</sup>)。图2-4显示了在八进制系统中使用位置量表示一个数。

![2.2.4整数](https://img-camp.banyuan.club/online/foundation/chapter2/2-4.png?x-oss-process=image/resize,w_660/sharpen,100)  

**▷ 例7** 以下显示了与十进制数686等值的八进制数(1256)<sub>8</sub>。

![例7](https://img-camp.banyuan.club/online/foundation/chapter2/2-4-a.png?x-oss-process=image/resize,w_660/sharpen,100)

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **注意，相等的十进制数为N=512+128+40+6=686。**  

**2.实数**

尽管一个实数可以用八进制系统表示，但并不常见。

### 5. 四种位置化数字系统的小结

表 1 列出的4中数字系统的符合和表示方法的例子。

| 系统 | 底 | 符号 | 例子 |
|:----:|:---:|:---:|:----:|
|十进制|10| 0，1，2，3，4，5，6，7，8，9|2345.56|
|二进制|2| 0，1|(1011.11)<sub>2</sub>|
|八进制|8| 0，1，2，3，4，5，6，7|(156.23)<sub>8</sub>|
|十六进制|16| 0，1，2，3，4，5，6，7，8，9，A，B，C，D，E，F|(A2C.A1)<sub>16</sub>|

表2 列出了15以内的数字分别用4种数字系统的表示。

| 十进制 | 二进制 | 八进制 | 十六进制 | 十进制 | 二进制 | 八进制 | 十六进制 |
|:------:|:------:|:------:|:--------:|:------:|:------:|:------:|:--------:|
| 0|0|0|0|8|1000|10|8 |
| 1|1|1|1|9|1001|11|9 |
| 2|10|2|2|10|1010|12|A |
| 3|11|3|3|11|1011|13|B |
| 4|100|4|4|12|1100|14|C |
| 5|101|5|5|13|1101|15|D |
| 6|110|6|6|14|1110|16|E |
| 7|111|7|7|15|1111|17|F |

表3 列出了常用的大数字用2、10、16进制的表示

| 二进制位置量   | 10进制值      | 16进制值 | 单位   |
| -------------- | ------------- | -------- | ------ |
| 2<sup>0</sup>  | 1             | 1        |        |
| 2<sup>1</sup>  | 2             | 2        |        |
| 2<sup>2</sup>  | 4             | 4        |        |
| 2<sup>3</sup>  | 8             | 8        |        |
| 2<sup>4</sup>  | 16            | 10       |        |
| 2<sup>5</sup>  | 32            | 20       |        |
| 2<sup>6</sup>  | 64            | 40       |        |
| 2<sup>7</sup>  | 128           | 80       |        |
| 2<sup>8</sup>  | 256           | 100      |        |
| 2<sup>9</sup>  | 512           | 200      |        |
| 2<sup>10</sup> | 1024          | 400      | 1K     |
| …              |               |          |        |
| 2<sup>16</sup> | 65536         | 10000    |        |
| …              |               |          |        |
| 2<sup>20</sup> | 1,048,576     | 100000   | 1M(兆) |
| 2<sup>24</sup> | 16,777,216    | 1000000  |        |
| 2<sup>30</sup> | 1,073,741,824 | 40000000 | 1G     |

当表示更大的数字时，引入了几个新的的计量单位，便于称呼：

* K（千）： 1K = 2<sup>10</sup> = 1024
* M（兆）：1M = 2<sup>20</sup> = 1024K
* G（吉）：1G = 2<sup>30</sup> = 1024M

## 进制转换

我们需要知道如何将一个系统中的数字转换到另一个系统中的等价的数字。鉴于我们更熟悉十进制系统，先讲解如何从其他进制转换到十进制。接着讲解如何从十进制转换到其他进制。最后讲解如何简便地进行二进制与八进制或十六进制之间的互相转换。

### 1. 其他进制到十进制的转换

这种转换是简单而迅速的。我们将数码乘以其在源系统中的位置量并求和便得到在十进制中的数。思路显示在图2-5中。

![图2-5](https://img-camp.banyuan.club/online/foundation/chapter2/2-5.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图2-5 任意进制到十进制的转换**

**▷ 例8** 下面显示如何将二进制数(110.112)<sup>2</sup>转换为十进制数。

<pre>
1      1      0      1     1    二进制
2<sup>2</sup>     2<sup>1</sup>     2<sup>0</sup>     2<sup>-1</sup>    2<sup>-2</sup>   位置量
4   +  2   +  0  +  0.5  + 0.25 各部分结果
</pre>

> 十进制：6.75 

**▷ 例9** 下面显示如何将十六进制数(1A.23)<sup>16</sup>转换为十进制数。

<pre>
 1       A    .   2        3      十六进制
16<sup>1</sup>      16<sup>0</sup>      16<sup>-1</sup>      16<sup>-2</sup>    位置量
16  +    10   +  0.125  +  0.012  各部分结果
</pre>


> 十进制：26.137

注意这个十进制表示并不精确，因为3 × 16<sup>-2</sup> ≈ 0.01 171 875。四舍五入成3位小数(0.012),也就是说，3×16<sup>-2</sup>≈0.012。数字转换时我们需要指明允许保留几位小数。

**▷ 例10** 下面显示如何将八进制数 (23.17)<sub>8</sub> 转换为十进制数。

<pre>
2        3    ·    1          7   八进制
8<sup>1</sup>       8<sup>0</sup>        8<sup>-1</sup>         8<sup>-2</sup>   位置量
16   +   3    +   0.125   +   0.109  各部分结果
</pre>

> 十进制：19.234

在十进制中(23.17)<sub>8</sub> ≈ 19.234。再一次，我们把7×8<sup>-2</sup>≈0.109 375四舍五入。

### 2. 十进制到其他进制的转换

我们能够将十进制数转换到与其等值的其他进制。需要两个过程，一个用于整数部分，
另一个用于小数部分。

#### (1) 转换整数部分

整数部分的转换可使用连除。图2-6显示了该转换流程。

![图 2-6](https://img-camp.banyuan.club/online/foundation/chapter2/2-6.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图2-6转换整数部分的算法**

我们称十进制数的整数部分为源，转换后的整数部分为目标。我们先创建一个空目标。接着反复除源并得到商和余数。余数插入目标的左边，商变为新的源。图2-7显示了在每次重复中如何得到商。

下面我们使用一些例子手工演示如图2-7所示的过程。

![图 2-7](https://img-camp.banyuan.club/online/foundation/chapter2/2-7.png?x-oss-process=image/resize,w_650/sharpen,100)

**图2-7 转换十进制的整数部分到其他进制**

**▷ 例11**  下面演示如何将十进制数35转换为二进制数。我们从这个十进制数开始，一边连续寻找除以二得到商和余数，一边左移。结果是35=（100011）<sub>2</sub>。

<pre>
0  ←   1  ←   2  ←   4  ←   8  ←   17 ←   <b class="dem">35</b>  十进制 
       ↓      ↓      ↓      ↓       ↓      ↓     
       1      0      0      0       1      1  二进制 
</pre>


**▷ 例12** 下面演示如何将十进制数126转换为八进制数。我们一边连续寻找除以8得到的商和余数，一边左移。结果是126=(176)<sub>8</sub>。

<pre>
 0  ←   1  ←  15  ←  <b class="dem">126</b> 十进制 
        ↓      ↓      ↓     
        1      7      6  八进制 
</pre>
**▷ 例13** 下面演示如何将十进制数126转换为十六进制数。我们一边连续寻找除以16得到的商和余数，一边左移。结果是126=(7E)<sub>16</sub>。

<pre>
0  ←  7   ←  <b class="dem">126</b> 十进制 
      ↓      ↓     
      7      E  十六进制 

</pre>

#### (2) 转换小数部分

小数部分的转化可使用连乘法。我们称十进制数的小数部分为源，转换后的小数部分的数为目标。我们先创建一个空目标。接着反复魏源并得到结果。结果的整数部分插入目标的右边，而小数部分成为新的源。图 8显示了该过程的流程。图 9显示了在每次重复中如何得到目标。我们使用一些例子手工演示如图 9所示的过程。

![图 2-8](https://img-camp.banyuan.club/online/foundation/chapter2/2-8.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 8 转换小数部分的算法**

**▷ 例14** 将十进制数0.625转换为二进制数。

**解** 因为0.625没有整数部分，该例子显示小数部分如何计算。这里是以2为底。在左边一角写上这个十进制数。连续乘2，并记录结果的整数和小数部分。小数部分移到右边，整数部分写在每次运算的下面。当小数部分为0,或达到足够的位数时结束。结果是0.625 =(0.101)<sub>2</sub>。

![图 2-9](https://img-camp.banyuan.club/online/foundation/chapter2/2-9.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 9 转换十进制的小数部分到其他进制**

<pre>
 十进制    <b class="dem">0.625</b> → 0.25 → 0.50 → 0.00 
            ↓      ↓      ↓          
 二进制  ·   1      0      1         
</pre>
**▷ 例15** 下面演示如何将0.634转换为八进制数且精确到4位小数。结果是
0.6340=0.5044<sub>8</sub>  ·

<pre>
 十进制    <b class="dem">0.634</b> → 0.072 → 0.576 → 0.608  → 0.864
          ↓          ↓       ↓       ↓
 八进制 ·  5          0       4       4
</pre>
**▷ 例16** 下面演示如何将十进制数178.6转换为十六进制数且精确到1位小数。结果是178.6=(B2.9)<sub>16</sub>.注意，以16为底时除或乘以16.

<pre>
十进制      0 ← 11 ← <b class="dem">178</b>  ·  <b class="dem">0.6</b> → 0.6
                ↓      ↓      ↓
十六进制         B      2  ·   9
</pre>

**▷ 例17** 把小的十进制数(通常小于256)转换为二进制数有一个变通的方法，即把这个数分解为下列二进制位置量对应数的和。

|位置量|   |2<sup>7</sup>|2<sup>6</sup>|2<sup>5</sup>|2<sup>4</sup>|2<sup>3</sup>|2<sup>2</sup>|2<sup>1</sup>|2<sup>0</sup>|
|:-----|:---:|:----:|:----:|:----:|:-:|:-:|:-:|:-:|:-:|
|十进制对等量|   |128| 64| 32|16 | 8| 4| 2|1 |


使用该表可以转换165为二进制数(10100101)<sub>2</sub>,如下所示：

|十进制 |165|=|**128**|+|**0**|+|**32**|+|**0**|+|**0**|+|**4**|+|**0**|+|**1**|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|二进制 |   |   |   1|   |  0 |   |  1 |   | 0  |   |  0 |   | 1  |   | 0  |   | 1  |

**▷ 例18** 当分母是2的幂次时，用类似的方法可以把十进制小数转换为二进制。

<pre>
位置量        2<sup>-1</sup>   2<sup>-2</sup>   2<sup>-3</sup>   2<sup>-4</sup>   2<sup>-5</sup>   2<sup>-6</sup>   2<sup>-7</sup>  
</pre>
十进制对等量       <sup>1</sup>/<sub>2</sub>        <sup>1</sup>/<sub>4</sub>        <sup>1</sup>/<sub>8</sub>        <sup>1</sup>/<sub>16</sub>      <sup>1</sup>/<sub>32</sub>      <sup>1</sup>/<sub>64</sub>      <sup>1</sup>/<sub>128</sub>

使用该表可以转换27/64为二进制数（0.011011）<sub>2</sub>，如下所示：

<pre>
十进制   <sup>27</sup>/<sub>64</sub> =  <sup>16</sup>/<sub>64</sub> + <sup>8</sup>/<sub>64</sub> + <sup>2</sup>/<sub>64</sub> + <sup>1</sup>/<sub>64</sub>
                <sup>1</sup>/<sub>4</sub>  +  <sup>1</sup>/<sub>8</sub> + <sup>1</sup>/<sub>32</sub> + <sup>1</sup>/<sub>64</sub>
</pre>

根据十进制对等的值排列这些分数。注意，由于<sup>1</sup>/<sub>2</sub>和<sup>1</sup>/<sub>16</sub>缺失，我们用0替代。

<pre>
十进制   <sup>27</sup>/<sub>64</sub> =  0 + <sup>1</sup>/<sub>4</sub> + <sup>1</sup>/<sub>8</sub> + 0 + <sup>1</sup>/<sub>32</sub> + <sup>1</sup>/<sub>64</sub>
二进制           0    1    1    0    1    1 
</pre>
#### (3) 数码的数量

在把数字从十进制转换到其他进制之前，我们需要知道数码的数量。通过 k = [log<sub>b</sub>N]的关系，我们总可以找到一个整数的数码的数量，其中[x]意味着最小的整数大于或等于x(这也称为x的高限)，N是该整数的十进制值。例如，我们可以找到十进制数 234 在所有4个系统中的位数，如下所示:

a. 十进制: k<sub>d</sub> = [log<sub>10</sub>234] = [2.37] = 3，显而易见。  
b. 二进制：k<sub>b</sub> = [log<sub>2</sub>234] = [7.8] = 8，因为234 = (11101010)<sub>2</sub>，所以正确。  
c. 八进制：k<sub>o</sub> = [log<sub>8</sub>234] = [2.62] = 3，因为234 = (352)<sub>8</sub>，所以正确。  
d. 十六进制：k<sub>h</sub> = [log<sub>16</sub>234] = [1.96] = 2，因为234 = (EA)<sub>16</sub>，所以正确。  

### 3. 技巧：二进制一十六进制的转换

我们能轻松将数字从二进制转换到十六进制，反之亦然。这是因为在这两个底之间存在一种关系二进制中的4位恰好是十六进制中的1位。图2-10显示了该转换是如何进行的。

![图2-10](https://img-camp.banyuan.club/online/foundation/chapter2/2-10.png?x-oss-process=image/resize,w_650/sharpen,100)

**▷ 例19** 下面演示如何将二进制数(10011100010)<sub>2</sub>转换为十六进制数。  
**解** 我们先将二进制数排为4位一组的形式 100 1110 0010 。注意最左边一组可能是1到4位不等。我们根据表2 所示的值对照每组等量转换得到十六进制数(4E2)<sub>16</sub>。

**▷ 例20** 与十六进制数(24C)<sub>16</sub>相等的二进制数是多少?  
**解** 将每个十六进制数码转换成4位一组的二进制数: 2→0010， 4→0100，以及C→1100。该结果是（001001001100）<sub>2</sub>。

###  4. 技巧：二进制一八进制的转换

我们能轻松将数字从二进制转换到八进制，反之亦然。这是因为在这两个底之间存在一种关系：二进制中的3位恰好是八进制中的1位。图 11显示了该转换是如何进行的。

![图2-11](https://img-camp.banyuan.club/online/foundation/chapter2/2-11.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 11 二进制与八进制的互换**

**▷ 例21** 下面演示如何将二进制数(101110010)<sub>2</sub>转换为八进制数。

**解** 每3位一组转换为1位八进制数码。根据表2所示的值对照每3位一组等量转换得到八进制数结果是(562)。

**▷ 例22** 与(24)<sub>8</sub>相等的二进制数是多少?

**解** 将每个八进制数码写成对等的二进制位组，得到(010100)<sub>2</sub>。

### 5. 技巧：八进制 -- 十六进制的转换

将数字从八进制转换到十六进制并不难，反之亦然。我们可以使用二进制系统作为中介系统。下图显示了一个例子。

该步骤如下

* 从八进制转到十六进制，我们先将八进制转到二进制。我们将位数重排成4位一组，找到十六进制的对等值。  
* 从十六进制转到八进制，我们先将十六进制转到二进制。我们将位数重排成3位一组，找到八进制的对等值。

![图2-12](https://img-camp.banyuan.club/online/foundation/chapter2/2-12.png?x-oss-process=image/resize,w_650/sharpen,100)

**数码的数量**

从一个底向另一个转换中，如果我们知道源系统数码的最大数量，就能知道我们在目标系统中所需用到的数码的最小数量。例如，如果在源系统中我们知道最多使用6个十进制数码，那么在目标系统中我们就知道要使用二进制数码的最少数量。通常，假设在以b，为底的系统中使用k个数码，在源系统中显示的最大数是b<sup>k</sup><sub>1</sub>-1。我们可在目标系统中拥有的最大数是b<sub>2</sub><sup>x</sup>-1。因此时b<sub>2</sub><sup>x</sup>-1 >= b<sub>1</sub><sup>k</sup>-1。这意味着b<sub>2</sub><sup>x</sup> > = b<sub>1</sub><sup>k</sup>，也就是:

***x≧k×(logb<sub>1</sub>/logb<sub>2</sub>)或x=[k×(logb<sub>1</sub>/logb<sub>2</sub>)]***

**▷ 例23** 找出二进制数码的最小数，用于存储一个最大6个数码的十进制整数。

**解** k=6, b<sub>1</sub>=2, 且x=[k×(logb<sub>1</sub>/logb<sub>2</sub>)]=[6×(1/0.30 103)]=20。 最大的6数码十进制数是999 999，并且最大的20位二进制数是1 048 575。注意，可以用19位表示的最大的数是524 287，它比999 999小。因此我们肯定需要20位。

## 小结

* 数字系统(或数码系统)是用独特的符号来表示一个数字的系统。位置化数字系统中，在数字中符号所占据的位置决定了其表示的值。每个位置有一个位置量与其相关联。非位置化数字系统使用有限的数字符号，每个符号有一个值。但是符号所占用的位置通常与其值无关，每个符号的值是固定的。
* 在十进制系统中，底b=10并且我们用10个符号来表示一个数。该系统中的符号常被称为十进制数码或仅称为数码。在二进制系统中，底b=2并且我们用2个符号来表示一个数。该系统中的符号常被称为二进制数码或位。在十六进制系统中，底b=16并且我们用16个符号来表示一个数。该系统中的符号常被称为十六进制数码。在八进制系统中，底b=8并且我们用8个符号来表示一个数。该系统中的符号常被称为八进制数码。
* 我们可以从任意进制转换到十进制。我们将数码乘以其在源系统中的位置量并求和便得到在十进制中的数。我们能够将十进制数转换到与其等值的任意进制数。需要两个过程，一个用于整数部分，另一个用于小数部分。整数部分需要连除，而小数部分需要连乘。
* 将数字从二进制转换到十六进制很容易，反之亦然。这是因为二进制中的4位恰好是十六进制中的1位。
* 将数字从二进制转换到八进制很容易，反之亦然。这是因为二进制中的3位恰好是八进制中的1位。



## 作业

1. 将下列二进制数转换为十进制数，不用计算器并写出计算过程:  
>a.(01101)<sub>2</sub>&emsp; b.(1011000)<sub>2</sub>&emsp; c.(011110.01)<sub>2</sub>&emsp; d.(111111.111)<sub>2</sub>

2. 将下列十六进制数转换为十进制数，不用计算器并写出计算过程:  
>a.(AB2)<sub>16</sub>&emsp; b.(123)<sub>16</sub>&emsp; c.(ABB)<sub>16</sub>&emsp; d.d.(35E.E1)<sub>16</sub>

3. 将下列八进制数转换为十进制数，不用计算器并写出计算过程:  
>a.(237)<sub>8</sub>&emsp; b.(2731)<sub>8</sub>&emsp; c.(617.7)<sub>8</sub>&emsp; d.(35E.E1)<sub>16</sub>

4. 将下列十进制数转换为二进制数，不用计算器并写出计算过程:  
>a.1234&emsp; b.88&emsp; c.124.02&emsp; d.14.56

5. 将下列十进制数转换为八进制数，不用计算器并写出计算过程:  
>a.1156&emsp; b.99&emsp; c.11.4&emsp; d.72.8

6. 将下列十进制数转换为十六进制数，不用计算器并写出计算过程:  
>a.567&emsp; b.1411&emsp; c.12.13&emsp; d.16.5

7. 将下列八进制数转换为十六进制数，不用计算器并写出算过程:  
>a.(514)<sub>8</sub>&emsp; b.(411)<sub>8</sub>&emsp; c.(13.7)<sub>8</sub>&emsp; d.(1256)<sub>8</sub>

8. 将下列十六进制数转换为八进制数，不用计算器并写出计算过程:  
>a.(51A)<sub>16</sub>&emsp; b.(4E1)<sub>16</sub>&emsp; c.(BB.C)<sub>16</sub>&emsp; d.(ABC.D)<sub>16</sub>

9. 将下列二进制数转换为八进制数，不用计算器并写出计算过程:  
>a.(01101)<sub>2</sub>&emsp; b.(1011000)<sub>2</sub>&emsp; c.(011110.01)<sub>2</sub>&emsp; d.(111111.111)<sub>2</sub>

10. 将下列二进制数转换为十六进制数，不用计算器并写出计算过程:  
>a.(01101)<sub>2</sub>&emsp; b.(1011000)<sub>2</sub>&emsp; c.(011110.01)<sub>2</sub>&emsp; d.(111111.111)<sub>2</sub>

', 2, 1, NULL, '2020-05-21 18:21:33.477422', '2020-05-21 18:21:33.477422', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (78, '数据存储', NULL, 20, NULL, NULL, '## 数据类型

如今，数据以不同的形式出现，如数字、文本、音频、图像和视频(图 1)。人们需要能够处理许多不同的数据类型：

![图 1](https://img-camp.banyuan.club/online/foundation/chapter3/3-1.png?x-oss-process=image/resize,w_700/sharpen,100) 
**图 1 不同类型的数据**

  * 工程程序使用计算机的主要是目的是处理数字进行算术运算、求解代数或三角方程、找出微分方程的根等。
  * 与工程程序不同的是，文字处理程序使用计算机的主要目的是处理文本：调整对其、移动、删除等。使用计算机的主要目的是处理文本调整对齐、移动、删除等。
  * 计算机同样也处理音频数据。我们可以使用计算机播放音乐，并且可以把声音作为数据输入到计算机中。
  * 图像处理程序使用计算机的主要目的是处理图像创建、收缩、放大、旋转等。
  * 最后，计算机不仅能用来播放电影，还能创建我们在电影中所看到的特技效果。

**计算机行业中使用术语。多媒体来定义包含数字、文本、图像、音频和视频的信息。**

**计算机内部的数据**

所有计算机外部的数据类型的数据都采用统一的数据表示法转换后存入计算机中，当数据从计算机输出时再还原回来。这种通用的格式称为位模式。

**1.位**

**位(bit，binary digit的缩写)** 是存储在计算机中的最小单位它是0或1。位代表设备的某一状态，这些设备只能处于两种状态之一。例如，开关要么合上要么断开。用1表示合上状态，0表示断开状态。电子开关就表示一个位。换句话说，一个开关能存储一个位的信息。今天，计算机使用各种各样的双态设备来存储数据。

**2.位模式**

为了表示数据的不同类型，应该使用**位模式**，它是一个序列，有时也被称为位流。下图展示了由16个位组成的位模式。它是0和1的组合。这就意味着，如果我们需要存储一个由16个位组成的位模式，那么需要16个电子开关。如果我们需要存储1000个位模式，每个16位，那么需要16 000个开关。通常长度为8的位模式被称为1字节。有时用字这个术语指代更长的位模式。

```
// 16个位组成的位模式
1 0 0 0 1 0 1 0 1 1 1 1 1 1
```

正如图 3所示，属于不同数据类型的数据可以以同样的模式存储于内存中。

![图 3](https://img-camp.banyuan.club/online/foundation/chapter3/3-3.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 3 不同数据类型的存储**

如果使用文本编辑器(文字处理器)，键盘上的字符A可以以8位模式01000001存储。如果使用数学程序，同样的8位模式可以表示数字65。类似地，同样的位模式可表示部分图像、部分歌曲、影片中的部分场景。计算机内存存储所有这些而无需辨别它们表示的是何种数据类型。

**3.数据压缩**

为占用较少的内存空间，数据在存储到计算机之前通常被压缩。数据压缩是一个广阔的主题，是一个专门的研究领域。

 **4.错误检测和纠正**

另一个与数据有关的话题是在传输和存储数据时的错误检测和纠正。

## 存储数字

在存储到计算机内存中之前，数字被转换到二进制系统，但是，这里还有两个问题需要解决：

1. 如何存储数字的符号。
2. 如何显示十进制小数点。

有多种方法可处理符号问题，本章后面陆续讨论。对于小数点，计算机使用两种不同的表示方法**定点**和**浮点**。第一种用于把数字作为整数存储——没有小数部分，第二种把数字作为实数存储——带有小数部分。

###  1 存储整数 

整数是完整的数字(即没有小数部分)。例如，134和-125是整数而134.23和-0.235则不是。整数可以被当作小数点位置固定的数字小数点固定在最右边。因此，定点表示法用于存储整数，如图 4所示。在这种表示法中，小数点是假定的，但并不存储。

![图 4](https://img-camp.banyuan.club/online/foundation/chapter3/3-4.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 4 整数的定点表示法**

但是，用户(或程序)可能将整数作为小数部分为0的实数存储。这是可能发生的，例如，整数太大以至于无法定义为整数来存储。为了更有效地利用计算机内存，无符号和有符号的整数在计算机中存储方式是不同的。

>**整数正常使用定点表示法存储在内存中。**

#### A. 无符号表示法

**无符号整数**是只包括零和正数的非负整数。它的范围介于0到无穷大之间。然而，由于计算机不可能表示这个范围的所有整数，通常，计算机都定义了一个常量，称为**最大无符号整数**，它的值是(2<sup>n</sup>-1)。这里n就是计算机中分配用于表示无符号整数的二进制位数。

**(1) 存储无符号整数**

输入设备存储无符号整数使用以下步骤：

  1. 首先将整数变成二进制数。  
  2. 如果二进制位数不足n位，则在二进制数的左边补0,使它的总位数为n位。如果位数大于n，该整数无法存储。导致溢出的情况发生，我们后面要讨论。

**▷ 例 1** 将7存储在8位存储单元中，使用无符号表示法。

**解** 首先将数字转换为二进制数(111)<sub>2</sub>。加5个0使总的位数为8位，即(00000111)<sub>2</sub>。再将该整数保存在存储单元中。注意，右下角的2用于强调该整数是二进制的，并不存储在计算机中。

```
把 7 变为二进制  →               1 1 1
在左边加 5 位    →     0 0 0 0 0 1 1 1
```

**▷ 例 2** 将258存储在16位存储单元中。

**解** 首先把数字转换为二进制数(100000010)<sub>2</sub>。加7个0使总的位数满足16位的要求，即得到(0000000100000010)<sub>2</sub>。再将该整数存储在存储单元中。

```
把258变为二进制 →                   1 0 0 0 0 0 0 1 0
在左边加7位     →     0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0
```

**(2) 译解无符号整数**

输出设备译解内存中位模式的位串并转换为一个十进制的无符号整数。

**▷ 例 3** 当译解作为无符号整数保存在内存中的位中00101011时，从输出设备返回什么?  
**解** 二进制整数转换为十进制无符号整数43。

**(3) 溢出**

因为大小(即存储单元的位的数量)的限制，可以表达的整数范围是有限的。在n位存储单元中，我们可以存储的无符号整数可表示的整数仅为0到2<sup>n</sup>-1之间。图 5显示了如果存储大于2<sup>4</sup>-1=15的整数到仅为4位的内存中所发生的情况。例如，保存整数11在存储单元中，又试图再加上9，就发生了这种成为溢出的情况。表示十进制数20的最小位数是5位，即20=(10100)<sub>2</sub>，所以计算机丢掉最左边的位，并保留最右边的4位(0100)<sub>2</sub>，当人们看到新的整数显示为4而不是20的时候很惊讶。图 5 显示了为什么会发生这种情况。

![图 5](https://img-camp.banyuan.club/online/foundation/chapter3/3-5.png?x-oss-process=image/resize,w_650/sharpen,100)  
***图 5 无符号整数的溢出***

**(4) 无符号整数的应用**

无符号整数表示法可以提高存储的效率，因为不必存储整数的符号。这就意味着所有分配的位单元都可以用来存储数字。只要用不到负整数，都可以用无符号整数表示法。具体情况如下：

* **计数** 当我们计数时，不需要负数。可以从1(有时0)开始增长。
* **寻址** 有些计算机语言，在一个存储单元中存储了另一个存储单元的地址。地址都是从0(存储器的第一个字节)开始到整个存储器的总字节数的正数，在这里同样也不需要用到负数。因此无符号整数可以轻松地完成这个工作。
* **存储其他数据类型** 我们后面将谈到的其他数据类型(文本、图像、音频和视频)是以位模式存储的，可以翻译为无符号整数。

#### B. 符号加绝对值表示法

尽管符号加绝对值格式在存储整数中并不常用，但该格式用于在计算机中存储部分实数，正如下一节所述。因此，我们在这里简要讨论该格式。在这种方法中，用于无符号整数的有效范围(0到2<sup>n</sup>-1)被分成两个相等的子范围。前半个表示正整数，后半个表示负整数。例如，n为4，该范围是0000到1111。这个范围被分为两半0000到011l以及1000到1111(图 6)。这种位模式赋值为正的和负的整数。注意，负数出现在正数的右边，与常规的关于正负数的思维相反。还要注意该系统中有两个0正0(0000)和负0(1000)。

>|0000|0001|0010|0011|0100|0101|0110|0111|1000|1001|1010|1011|1100|1101|1110|1111|
|:--:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|0|1|2|3|4|5|6|7|-0|-1|-2|-3|-4|-5|-6|-7|

**图 6 符号加绝对值的表示法**

用符号加绝对值格式存储一个整数，需要用1个二进制位表示符号(0表示正，1表示负)。这就意味着在一个8位存储单元中，可以仅用7位表示数字的绝对值(不带符号)。因此，最大的正数僅仅是无符号最大數的一半。在n位单元可存储的数字范围是-(2<sup>n-1</sup>-1)至+(2<sup>n-1</sup>-1)，n位单元中最左位分配用于存储符号(0表示正，直表示负)。

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **在符号加绝对值表示法中，最左位用用于定义整数的符号。0表示正整數。1表示负整数**

**▷ 例 4** 用符号加绝对值表示法将十28存储在8位存储单元中。  
**解** 先把该整数转换成7位的二进制数。最左边位置0,即存储为8位数。

```
把28变为7位的二进制              0  0  1  1  1  0  0
加符号位并存储          [0]   0  0  1  1  1  0  0
```

**▷ 例 5** 用符号加绝对值表示法将-28存储在8位存储单元中。  
**解** 先把该整数转换成7位的二进制数。最左边位置ı，即存储为8位数。

```
把28变为7位的二进制            0  0  1  1  1  0  0 
加符号位并存储         [1]  0  0  1  1  1  0  0 
```

**▷ 例 6** 将用符号加绝对值表示法存储的01001101复原成整数。  
**解** 因为最左位是0,符号为正。其余位(1001101)转换成十进制数77。加上符号后该整数是+77。

**▷ 例 7** 将用符号加绝对值表示法存储的10100001复原成整数。  
**解** 因为最左位是1,符号为负。其余位(0100001)转换成十进制数33。加上符号后该整数是-33。

**(1) 符号加绝对值表示法的溢出**

同无符号整数一样，有符号的整数也会溢出。但是，这时我们可能有正负两种溢出情况。图 7显示了当使用4位内存单元存储一个用符号加绝对值表示法的整数时出现的正负两种溢出。当我们试图存储一个比7大的正整数时，出现正溢出。例如，我们保存整数5在存储单元中，又试图再加上6。我们期望结果是11，但计算机响应为-3。这是因为在一个循环的表示中，从5开始顺时针走6个单位。就停在-3。一个正数溢出将整数限制在该范围中。

![图 7](https://img-camp.banyuan.club/online/foundation/chapter3/3-7.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 7符号加绝对值表示法的溢出**

当我们试图存储一个比-7小的负整数时，出现负溢出。例如，我们保存整数-5在存储单元中，又试图再减去7。我们期望结果是-12，但计算机响应为十6。这是因为在一个循环的表示中，从-5开始逆时针走7个单位，就停在+6了。

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **在符号加绝对値表示法农，有两个0：+0和-0。**

**(2) 符号加绝对值表示法的应用**

符号加绝对值表示法不用于存储整数，而用于存储部分实数，我们后面会看到。另外，符号加绝对值表示法通常用于采样模拟信号，例如，音频。

#### C. 二进制补码表示法

几乎所有的计算机都使用二进制补码表示法来存储位于胃位存储单元中的有符号整数。这一方法中，无符号整数的有效范围(0到2<sup>n</sup>-1)被分为两个相等的子范围。第一个子范围用来表示非负整数，第二个子范围用于表示负整数。例如。如果周是4.该范围是0000到1111。这个范围分为两半0000到0110以及1000到1111。这两半按照左负右正的常规互相交换。赋值给负和非负(零和正)整数的位模式如图 8所示。

![图 8](https://img-camp.banyuan.club/online/foundation/chapter3/3-8.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 8 二进制补码表示法**

尽管整数的符号影响二进制整数存储时的每一位，但是首位(最左位)决定符号。如果最左位是0.该整数非负；如果最左位是1，该整数是负数。  
![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **在二进制补码表示法中，最左位表示符号。如果它是0，该整数为正；如果是1，该整数为负。**

**(1) 两种运算**

在深人讨论这种表示法之前，我们需要介绍两种运算。第一种称为反码或取一个整数的反码。该运算可以应用到任何整数，无论是正的还是负的。该运算简单反转各个位，即把0位变为1位，把1位变为0位。

**例 8** 下箇显示我们如何取整数00110110的反码。  

```
0  0  1  1  0  1  1  0  原来的模式
1  1  0  0  1  0  0  1  进行反码运算
```

**▷ 例 9** 下面显示我们如果进行2次反码运算，就可以得到原先的整数。  

```
0  0  1  1  0  1  1  0  原来的模式
1  1  0  0  1  0  0  1  进行1次反码运算
0  0  1  1  0  1  1  0  进行2次反码运算
```
第二种运算称为二进制中的补码或取一个整数的补码。该运算分为两步首先，从右边
复制位，直到有1被复制；接着，反转其余的位。

**▷ 例 10** 下面显示我们如何取整数00110100的补码。  

<pre>
0  0  1  1  0  1  0  0   原来的模式
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  
<b class="dem">1</b>  <b class="dem">1</b>  <b class="dem">0</b>  <b class="dem">0</b>  <b class="dem">1</b>  1  0  0  进行1次补码运算
</pre>

**▷ 例 11** 下面显示我们如果进行2次补码运算，就可以得到原先的整数。

<pre>
0  0  1  1  0  1  0  0   原来的模式
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  
<b class="dem">1</b>  <b class="dem">1</b>  <b class="dem">0</b>  <b class="dem">1</b>  <b class="dem">1</b>  1  0  0   进行1次补码运算
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  
<b class="dem">0</b>  <b class="dem">0</b>  <b class="dem">1</b>  <b class="dem">0</b>  <b class="dem">0</b>  1  0  0   进行2次补码运算
</pre>

另一种将一个整数进行补码运算的方法是先对它进行1次反码运算再加上1得到结果。

**(2) 以二进制补码格式存储整数**

以二进制补码格式存储整数，计算机遵循以下步骤：

  * 将整数变成n位的二进制数。  
  * 如果整数是正数或零，以其原样存储I如果是负数，计算机取其补码存储。

**(3)从二进制补码格式还原整数**

从二进制补码格式还原整数，计算机遵循以下步骤：

  * 如果最左位是1，计算机取其补码。如果最左位是0,计算机不进行操作。
  * 计算机将该整数转换为十进制。

**▷ 例 12** 用二进制补码表示法将整数28存储在8位存储单元中。  
**解** 该整数是正数(无符号意味是正的)，因此在把该整数从十进制转换成二进制后不再需要其他操作。注意，3个多余的零加到该整数的左边使其成为8位。  

```
把28变为8位的二进制     0 0 0 1 1 1 0 0
```

**▷ 例 13** 用二进制补码表示法将整数-28存储在8位存储单元中。
**解**读整数是负数，因此在转换成二进制后计算机对其进行二进制补码运算。  

```
0  0  0  1  1  1  0  0  把28变为8位的二进制
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓  
1  1  1  0  0  1  0  0  进行补码运算
```

**▷ 例 14** 将用二进制补码表示法存储在8位存储单元中的00001101还原成整数。  
**解**最左位是0,因此符号为正。该整数需要转换为十进制并加上符号即可。  

```
0  0  0  0  1  1  0  1   最左位是0,符号为正
                    13   整数转换为十进制
                   +13   加上符号(可选)
```
**例 15** 将用二进制补码表示法存储在8位存储单元中的11100110还原成整数。  
**解** 最左位是1，因此符号为负。在整数转换为十进制前进行补码运算。

```
1  1  1  0  0  1  1  0  最左位是1，符号为负
↓  ↓  ↓  ↓  ↓  ↓  ↓  ↓ 
0  0  0  1  1  0  1  0  进行补码运算
                    26  整数转换为十进制
                   -26  加上符号
```

二进制补码表示法很有趣的一点是该表示法仅有一个0。而符号加绝对值表示法则有两个0(+0和-0)。

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100)  **二进制补码表示法仅有一个0。**

**（4）二进制补码表示法的溢出**

同其他表示法一样，以二进制补码表示法存储的整数也会溢出。图 9显示了当使用4位存储单元存储一个带符号的整数时出现的正负两种溢出。当我们试图存储一个比7大的iF整数时，出现正溢出。例如，我们保存整数5在存储单元中，又试图再加上6。我们期望结果是11，但计算机响应为-5。这是因为在一个循环的表示中，从5开始顺时针走6个单位，就停在-5。一个正数溢出将整数限制在该范围中。

![图 9](https://img-camp.banyuan.club/online/foundation/chapter3/3-9.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 9二进制补码表示法的溢出**

当我们试图存储一个比-8小的负整数时，出现负溢出。例如，我们保存整数-3在存储单元中，又试图再减去7。我们期望结果是-10，但计算机响应为+6。这是因为在一个循环的表示中，从-3开始逆时针走7个单位，就停在+6了。

**(5) 二进制补码表示法的应用**

当今，二进制补码表示法是计算机中用于存储整数的标准表示法。在下一章中，当你发现使用二进制补码带来运算上的简便后就会明白为什么这么说。

### 2. 三种系统的比较 

表 1 显示了无符号、二进制补码和符号加绝对值表示法的对比。4位存储单元可以存储0～15之间的无符号整数；同样存储单元可以存储-8～+7之间的二进制补码整数。我们用同样的格式存储和还原整数，这一点很重要。例如，如果13存为有符号格式的，就需要将其还原成有符号格式的；同样以二进制补码格式的-3可以还原到原样。

表 1 整数表示法小结

>|存储单元|无符号|符号加绝对值|二进制补码|  |存储单元的内容|无符号|符号加绝对值|二进制补码|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0000|0|0|+0|  |0100|4|4|+4|
|0001|1|1|+1|  |0101|5|5|+5|
|0010|2|2|+2|  |0110|6|6|+6|
|0011|3|3|+3|  |0111|7|7|+7|
|1000|8|-0|-8| |1100|12|-4|-4|
|1001|9|-1|-7|  |1101|13|-5|-3|
|1010|10|-2|-6|  |1110|14|-6|-2|
|1011|11|-3|-5|    |1111|15|-7|-1|

### 3. 实数 

**实数**是带有整数部分和小数部分的数字。例如，23.7是一个实数——整数部分是23而小数部分是7/10。尽管固定小数点的表示法可用于表示实数，但结果不一定精确或达不到需要的精度。以下两个例子说明了原因。

**▷ 例 16** 在十进制系统中，假定我们用一种小数点右边2个数码，左边14个数码，总共16个数码的定点表示法。那么如果试图表示十进制数1.002 34，该系统的实数精度就会受损。该系统把这个数宇存储为1.00。

**▷ 例 17** 在十进制系统中，假定用一种小数点右边6个数码，左边10个数码，总共16个数码的定点表示法。那么如果试图表示十进制数236 154 302 345.00.该系统的实数精度就会受损。该系统把这个数字存储为6 154 302 345.00。整数部分比实际小了很多。

>**带有很大的整数部分或很小的小数部分的实数不应该用定点表示法存储。**

**1.浮点表示法**

用于维持正确度或精度的解决方法是使用**浮点表示法**。该表示法允许小数点浮动我们可以在小数点的左右有不同数量的数码。使用这种方法极大地增加了可存储的实数范围：带有很大的整数部分或很小的小数部分的实数可以存储在内存中了。在浮点表示法中，无论十进制还是二进制，一个数字都由3部分组成，如图 10所示。

第一部分是符号，可正可负。第二部分显示小数点应该左右移动构成实际数字的位移量。第三部分是小数点位置固定的定点表浮点表示法

![图 10](https://img-camp.banyuan.club/online/foundation/chapter3/3-10.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 10 在浮点表示法中的实数的3个部分**

>**一个数字的浮点表示法由3部分组成：符号、位移量和定点数。**

浮点表示法在科学中用于表示很小或很大的十进制数。在称作科学计数法的表示法中，定点部分在小数点左边只有1个数码而且位移量是10的幂次。

**例 18** 下面演示用科学计数法(浮点表示法)表示的十进制數7 425 000 000 000 000 000 00000。  
**解**

<pre>
实际数字    →  + 7 425 000 000 000 000 000 000.00
科学计数法  →  + 7.425 × 10<sup>21</sup>  
</pre>
这三部分为符号(+)、位移量(21)以及定点部分(7.425)。注意那个位移量就是指数。这种表示法的好处显而易见。即使在一张纸上写数字，科学计数法也是更短并更省空间。这种计数法使用了浮点表示法的概念，因为那个靠近例题右下方的小数点位置已经向左移了21位形成该数字的定点部分。一些程序设计语言和计算器按照+7.425E21来显示该数字，因为以10为底是不言而喻的。

**例 19** 用科学计数法表示数字-0.000 000 000 000 023 2。
**解** 使用前例同样的方法，将小数点移到数码2之后，如下所示：

<pre>
实际数字    →  -  0.000 000 000 000 023 2
科学计数法  →  -  2.32 × 10<sup>-14</sup>
</pre>

注意这里指数是负的，因为小数点需要左移(ı4位)来构成原数字。我们可再次说该计数法中的数字由3部分组成：符号(-)、实数(232)以及负整数(-14)。一些程序设计语言和计算器按照-2.32E-14来显示该数字。  

类似方法可用于表示很小或很大的存储于计算机中的二进制数宇(整数和实数皆可)。

**▷ 例 20** 用浮点格式表示数字（101001000000000000000000000000000.00)<sub>2</sub>  
**解** 使用前例同样的方法，小数点前只保留一位数宇，如下所示：

<pre>
实际数字    →  +  (101001000000000000000000000000000. 00)<sub>2</sub>
科学计数法  →  +  1.01001×2<sup>32</sup>
</pre>

注意我们不必担心从最右边的1开始的右侧的那些0,这是因为当我们使用实数(1.01001)<sub>2</sub>时它们并不重要。指数显示为32，但它实际上以一进制存储在计算机中，正如不久我们要看到的那样。我们也已经显示符号为正，但它可能作为1位存储。

**▷ 例 21** 用浮点格式表示数字-(0.00000000000000000000000101)<sub>2</sub>  
**解** 使用前例同样的方法，小数点左边只留一个非零数码。

<pre>
实际数字    → - (0. 00000000000000000000000101)<sub>2</sub>
科学计数法  → - 1.01×2<sup>-24</sup>
</pre>

注意指数作为负的二进制数存储在计算机中。

**2. 规范化**

为了使表示法的固定部分统一，科学计数法(用于十进制)和浮点表示法(用于二进制)都在小数点左边使用了唯一的非零数码，这称为**规范化**。十进制系统中的数码可能是1～9,而二进制系统中该数码是1。在下面，d是非零数码，x是一个数码，y是0或1。

十进制 → ± d.xxxxxxxxxxxxxx 注意： d是1～9，每个x是0～9  
二进制 → ± 1.yyyyyyyyyyyyyy 注意： 每个y是0或1

**3. 符号、指数和尾数**

在一个二进制数规范化之后，我们只存储了一个数的三部分信息符号、指数和尾数(小数点右边的位)。例如，+1000111.0101规范化后变成为

<pre>
符号    指数           尾数
+        2<sup>6</sup>    ×   1.0001110101
+        6           000111010


![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **注意：小数点和定点部分左边的位1、并没有存储，它们是隐含的。**

**(1) 符号**

一个数的符号可以用一个二进制位来存储(0或1)。

**(2) 指数**

指数(2的幂)定义为小数点移动的位数。注意幂可以为正也可以为负。余码表示法(后面讨论)是用来存储指数位的方法。

**(3) 尾数**

**尾数**是指小数点右边的二进制数。它定义了该数的精度。尾数是作为无符号整数存储的。如果我们把尾数和符号一起考虑，则可以说这个组合是作为符号加绝对值格式的整数存储的。但是，我们需要记住它不是整数，而是像整数那样存储的小数部分。我们强调这一点是因为在尾数中，如果在数字的右边插人多余的零，这个值将会改变，而在一个真正的整数中，如果在数字的左边插入多余的零，这个值是不会改变的。

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **尾数带符号的小数部分，像以符号加绝对值表示法存储的整数那样对待。**

**4. 余码系统**

尾数可以作为无符号数存储。指数(即显示多少位小数点应该左移或右移的每次)是有符号的数。尽管这可以用二进制补码表示法来存储，但被一种称为余码系统的新的表示法取而代之。在该余码系统中，正的和负的整数都可以作为无符号数存储。为了表示正的或负的整数，一个正整数(称为一个偏移量)加到每个数字中，将它们统一移到非负的一边。这个偏移量的值是2<sup>m-1</sup>-1，m是内存单元存储指数的大小。

**例 22** 我们可以用4位存储单元在数字系统中表示16个整数。使用一个单元作为0,分开其他15个(不等地)我们可以在-7～8的范围中表示整数，如图 11所示。在该范围中增加7个单位到每个整数中，可以统一把所有整数向右移。使其均为整数而无需改变这些整数的相对位量，避免了相互调整，如图 11所示。新系统称为余7，或者偏移量为7的偏移表示法。

![图 11](https://img-camp.banyuan.club/online/foundation/chapter3/3-11.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 11余码表示法中的移位**

这种新的表示法与移位前的表示法相比，其优点在于在余码系统中的所有整数都是正数，当我们对这些整数进行比较或运算时不需要考虑符号。对于4位存储单元，如我们希望的那样，偏移量是2<sup>4-1</sup>-1=7。

**5. IEEE标准**

电气和电子工程师协会(IEEE)已定义了几种存储浮点数的标准。这里我们讨论其中两种最常用的——单精度和双精度。该格式如图 12所示。方框上方的数就是每一项的位数。

![图 12](https://img-camp.banyuan.club/online/foundation/chapter3/3-12.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 12 浮点数表示法的IEEE标准**

单精度数格式采用总共32位来存储一个浮点表示法的实数。符号占用1位(0为正，1为负)，指数占用8位(使用偏移量127)，尾数使用23位(无符号数)。该标准有时称为余127码(Excess_127)，因为偏移量是127。

双精度数格式采用总共64位来存储一个浮点表示法的实数。符号占用1位(0为正，1为负)，指数占用11位(使用偏移量1023)，尾数使用52位。该标准有时称为余1023码(Excess_1023)，因为偏移量是1023。下表总结了这两种标准的规格。

|参数|单精度|双精度|
|:---|:---|:---|
|内存单元大小(位)|32|64|
|符号大小(位)|1|1|
|指数大小(位)|8|11|
|尾数大小(位)|23|52|
|偏移量(整数)|127|1023|

**6.IEEE标准浮点数的存储**

参照图 12，使用以下步骤，一个实数可以存储为IEEE标准浮点数格式：

1) 在S中存储符号(0或1)。  
2) 将数字转换为二进制。  
3) 规范化。  
4) 找到E和M的值。  
5) 连接S、E和M。  

**▷ 例 23** 写出十进制数5.75的余127码(单精度)表示法。

**解**

1) 符号为正，所以S=0。
2) 十进制转换为二进制5.75=(101.11)<sub>2</sub>。
3) 规范化(101.11)<sub>2</sub>=(1.0111)<sub>2</sub> × 2<sup>2</sup>
4) E=2+127=129=(10000001)<sub>2</sub>，M=(0111)<sub>2</sub>。我们需要在M的右边增加19个0使之成为23位。
5) 该表示法如下所示：

```
S        E                  M
0     10000001   01110000000000000000000
```

存储在计算机中的数字是01000000101110000000000000000000。

**▷ 例 24** 写出十进制数-161.875的余127码(单精度)表示法。

**解**

1) 符号为负，所以S=1。
2) 十进制转换为二进制161.875=(10100001.111)<sub>2</sub>。
3) 规范化 (10100001.111)<sub>2</sub> = (1.0100001111)<sub>2</sub>×2<sup>7</sup>。
4) E=7+127= 134 (10000110)<sub>2</sub>, 而 M= (01000011111)<sub>2</sub>。
5) 该表示法如下所示:

```
S       E                  M
1    0000110     01000011110000000000000
```

存储在计算机中的数字是11000011010000111100000000000000。

**▷ 例 25** 写出十进制数-Q023 437 5的余127码(单精度)表示法。

**解**

1) S=1(该数为负)。
2) 十进制转换为二进制0.023 437 5=(0.000001 1)a。
3) 规范化(0.0000011)<sub>2</sub>=(1.1)<sub>2</sub>×2<sup>-6</sup>
4) E=-6+127=121=(01111001)<sub>2</sub>,M=(1)<sub>2</sub>
5) 该表示法如下所示:

```
S        E                  M
1    01111001    10000000000000000000000
```

存储在计算机中的数字是10111100110000000000000000000000。

**7.将存储为IEEE标准浮点数的数字还原**

一个以IEEE浮点格式之一存储的数字可以用以下步骤方法还原

1) 找到S、E和M的值。  
2) 如果S=0，将符号设为正号，否则设为负号。  
3) 找到位移量(E-127)。  
4) 对尾数去规范化。  
5) 将去规范化的数字变为二进制以求出绝对值。  
6) 加上符号。  

**▷ 例 26** 位模式(11001010000000000111000100001111)<sub>2</sub>以余127码格式存储于内存中，求该数字十进制计数法的值。

**解**

1) 首位表示s,后8位是E,剩下23位是M。  

```
S         E                  M
1     10010100     00000000111000100001111
```

2) 符号为负号。  
3) 位移量=E-127=148-127=21。  
4) 将(1.00000000111000100001111)<sub>2</sub> × 2<sup>21</sup>去规范化。  
5) 二进制数是(1000000001ı10001000011.11)<sub>2</sub>。  
6) 绝对值是2 104 378.75。  
7) 该数字是-2 104 378.75。  

**8 上溢和下溢**

对于浮点数，有上溢和下道两种情况。图 13显示了使用32位内存单元(佘127码)的浮点表示法范围。该表示法不能存储很小或很大的绝对值。试图存储绝对值很小的数导致下溢的情况，而试图存储绝对值很大的数导致上溢的情况。我们把临界值(+最大值，-最大值，+最小值，-最小值)的计算留作练习。

![图 13](https://img-camp.banyuan.club/online/foundation/chapter3/3-13.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 13实数的浮点表示法中的上溢和下发**

**9. 存储零**

你可能注意到带有整数部分和小数部分的实数设置为零的时候是0.0.无法用以上讨论的步骤存储。为了处理这个特例，约定在这种情况下符号、指数和尾数都设为零。

**10. 截断错误**

当使用浮点表示法存储实数时，存储数字的值可能不是我们希望的。例如，假定我们需要在内存中用余ı27码表示法存储这个数字：

(1111111111111111.11111111111)<sub>2</sub>

规范化后得到

>(1.11111111111111111111111111)<sub>2</sub>

这意味着尾数有26个1。这个尾数需要截短为23个1，换言之，存储在计算机中的是(1.11111111111111111111111)<sub>2</sub>原来的数变为:

>(1111111111111111.11111111)<sub>2</sub>

小数部分右边的3个1被截掉了。这种原始数字与还原后数字的差异称为**截断错误**。在使用很小或很大数字的地方，如宇航业的计算中，这种类型的错误是很严重的。这种情况下，我们需要更大的内存单元和其他的表示法。为此，IEEE定义了用于更大尾数的其他表示法。

## 存储文本

在任何语言中，**文本**的片断是用来表示该语言中某个意思的～系列的符号。例如，在英语中使用26个符号(A,B,C,...，Z)来表示大写字母，26个符号(a,b,c,...，z)表示小写字母，10个符号(0,1,2，...，9)来表示数字字符(不是实际的数字后面将看到它们的不同之处)，以及符号(.，?，:，;,...,!)来表示标点。另外一些符号(如空格、换行和制表符)被用于文本的对齐和可读性。

我们可用位模式来表示任何一个符号。换句话说，如4个符号组成的文本拓"CATS"能用4个n位模式表示。任何一个模式定义一个单独的符号(图 14)。

![图 14](https://img-camp.banyuan.club/online/foundation/chapter3/3-14.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 14 利用位模式表示符号**

现在的问题是在一种语言中，位模式到底需要多少位来表示一个符号？这主要取决于该语言集图 14利用位模式表示符号中到底有多少不同的符号。例如，如果要创建的某个虚构的语言仅仅使用大写英文字母，则只需要26个符号。相应地，这种语言的位模式至少需要表示26个符号。

对另一种语言，如中文，可能需要更多的符号。在一种语言中，表示某一符号的位模式的长度取决于该语言中所使用的符号的数量。更多的符号意味着更长的位模式。

尽管位模式的长度取决于符号的数量，但是它们的关系并不是线性的，而是对数的。如果需要2个符号，位模式长度将是1位(log<sub>2</sub>2=1)，如果需要4个符号，长度将是2位(log<sub>2</sub>4=2)。从表3中可以很容易看出它们之间的关系。2位的位模式能表示4种不同的形式00,01,10和11。这些形式中的任何一种都可用来代表一个字符。同样，3位的位模式有8种不同的形式000,001,010,011,100，101，110和111。

**表 3 符号数量和位模式长度的关系**

|符号的数量|位模式的长度|
|:---:|:---:|
|2|1|
|4|2|
|8|3|
|16|4|
|128|7|
|256|8|
|65 536 |16|
|4 294 967 296|32|

**代码**

不同的位模式集合被设计用于表示文本符号。其中每一个集合我们称之为**代码**。表示符号的过程被称为编码。在这个部分将介绍常用代码。

**1. ASCII**

**美国国家标准协会**(ANSI)开发了一个被称为**美国信息交换标准码**(ASCII)的代码。该代码使用7位表示每个符号。即该代码可以定义2<sup>7</sup>=128种不同的符号。用于表示ASCII码的完整位模式可见附录A.如今ASCII是Unicode的一部分，下面将要讨论。

**2. Unicode**

硬件和软件制造商联合起来共同设计了一种名为Unicode的代码，这种代码使用32位并能表示最大达2<sup>32</sup>=4 294 967 296个符号。代码的不同部分被分配用于表示来自世界上不同语言的符号。其中还有些部分被用于表示图形和特殊符号。Unicode符号的简集见附录A.如今ASCII是Unicode的一部分。

**3. 其他编码**

最近几十年来，其他编码不断发展。鉴于Unicode的优势，这些编码变得不太流行。我们把了解这些编码作为练习。

## 存储音频

音频表示声音或音乐。音频本质上与我们讨论到现在的数字和文本是不同的。文本由可数的实体(文字)组成我们可以数出文本中文字的数量。文本是数字数据的一个例子。相反，音频是不可数的。音频是随时间变化的实体，我们只能在每一时刻度量声音的密度。当我们讨论用计算机内存存储声音时，我们的意思是存储一个音频信号的密度，例如，每隔一段时间(一秒钟，一小时)来自麦克风的信号。

音频是模拟数据的例子。即使我们能够在一段时间度量所有的值，也不能把它全部存在计算机内存中，因为可能需要无限数量的内存单元。图 15显示了一个模拟信号随时间变化的本质，如音频。

![图 15](https://img-camp.banyuan.club/online/foundation/chapter3/3-15.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 15 一个音频信号**

###  1. 采样 

如果我们不能记录一段I司隔的音频信号的所有值，至少我们可以记录其中的一些。采样意味着我们在模拟信号上选择数量有限的点来度量它们的值并记录下来。图 16显示了从这样的信号上选择10个样本我们可以记录这些值来表现模拟信号。

![图 16](https://img-camp.banyuan.club/online/foundation/chapter3/3-16.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 16 一个音频信号的采样**

**采样率**

下一个逻辑问题是，我们每秒钟需要多少样本才能还原出原始信号的副本?样本数量依赖于模拟信号中变化的最大数量。如果信号是平坦的，则需要很少的样本如果信号变化剧烈，则需要更多的样本。每秒40 000个样本的采样率对音频信号来说是足够好的。

### 2. 量化 

从每个样本测量来的值是真实的数字。这意味着我们可能要为每一秒的样本存储40 000个真实的值。但是，为每个样本使用一个无符号的数(位模式)会更简便。量化指的是将样本的值截取为最接近的整数值的一种过程。例如，如果实际的值为17.2，就可截取为17如果值为17.2，就可截取为18。

### 3. 编码 

下面的任务是编码。量化的样本值需要被编码成位模式。一些系统为样本赋正值或负值，另一些仅仅移动曲线矗的区间从而只赋正值。换言之，一些系统使用无符号整数来表示样本，而另一些使用有符号的整数来做。但是，有符号的整数不必用在二进制补码中，它们可以是符号加绝对值的值。最左边的位用于表示符号(0表示正值，1表示负值)，其余的位用于表示绝对值。

**1). 每样本位**

对于每个样本系统需要决定分配多少位。尽管在过去仅有8位分配给声音样本，现在每样本16、24甚至32位都是正常的。每样本位的数量有时称为位深度。

**2). 位率**

如果我们称位深度或每样本位的数量为B,每秒样本数为S,我们需要为每秒的音频存储S x B位。该乘积有时称为位率R.例如，如果我们使用每秒40 000个样本以及每样本16位, 位率是 R = 40 000 × 16= 640 000 b/s=640 KB/s。

### 4. 声音编码标准  

当今音频编码的主流标准是MP3(MPEG Layer 3的简写)。该标准是用于视频压缩方法的MPEG(动态图像专家组)标准的一个修改版。它采用每秒44 100个样本以及每样本16位。结果信号达到705 600 b/s的位率，再用去掉那些人耳无法识别的信息的压缩方法进行压缩。这是一种有损压缩法，与无损压缩法相反，

## 存储图像

存储在计算机中的图像使用两种不同的技术：***光栅图或矢量图***。

###  1. 光栅图 

当我们需要存储模拟图像(如照片)时，就用到了**光栅图**(或**位图**)。一张照片由模拟数据组成，类似于音频信息。不同的是数据密度(色彩)因空间变化，而不是因时间变化。这意味着数据需要采样。然而，这种情况下采样通常被称作扫描。样本称为**像素**(代表**图像元素**)。换言之，整个图像被分成小的像素，每个像素假定有单独的密度值。

**A. 解析度**

就像音频采样那样，在图像扫描中，我们要决定对于每英寸的方块或线条需要记录多少像素。在图像处理中的扫描率称为解析度。如果解析率足够高，人眼不会看出在重现图像中的不连续。

**B. 色彩深度**

用于表现像素的位的数量，即色彩深度，依赖于像素的颜色是如何由不同的编码技术来处理的。对颜色的感觉是我们的眼睛如何对光线的响应。我们的眼睛有不同类型的感光细胞一些响应红、黄、蓝三原色(也叫RGB)，而另一些仅仅响应光的密度。

**(1) 真彩色**

用于像素编码的技术之一称为真彩色，它使用24位来编码一个像素。在该技术中，每个三原色(RGB)都表示为8位。因为该技术中8位模式可以表示0～255之间的一个数，所以每种色彩都由0～255之间的三维数字表示。表4 显示了该技术中用于一些颜色的3个值。

**表4定义为真彩色的一些颜色**

|颜色|红|绿|蓝|颜色|红|绿|蓝|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|黑色|0|0|0|黄色|255|255|0|
|红色|255|0|0|青色|0|255|255|
|绿色|0|255|0|紫红色|255|0|255|
|蓝色|0|0|255|白色|255|255|255|

注意真彩色模式可以编码2<sup>24</sup>或16 777 216种颜色。换言之，各个像素的色彩深度是这些值的其中之一。

**(2) 索引色**

真彩色模式使用了超过1600万种的颜色。许多应用程序不需要如此大的颜色范围。**索引色**(或**调色板色**)模式仅使用其中的一部分。在该模式中，每个应用程序从大的色彩集中选择一些颜色(通常是256种)并对其建立索引。对选中的颜色赋一个0～255之间的值。这就类似艺术家可能在他们的画室用到很多种颜色，但一次仅用到他们调色板中的一些。

![图 17](https://img-camp.banyuan.club/online/foundation/chapter3/3-17.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 17 示意了索引色的思路。**

对索引的使用减少了需要存储一个像素所需要的位的数量。例如，真彩模式需要24位里储存一个像素，索引色模式通常使用256个索引，这需要8位来存储同样的像素。例如，一部高质量的数码相机要用几乎3百万像素拍摄一张3×5英寸的相片。以下显示使用各种模式存储所需要的位的数量。

真彩色 3 000 000 × 24 = 72 000 000  
索引色 3 000 000 × 8 = 24000000

**(3). 图像编码标准**

几种用于图像编码的实际标准正在使用中。JPEG(联合图像专家组)使用真彩色模式，但压缩图像来减少位的数量。另一方面，GIF(图形交换格式)使用索引色模式。

### 2. 矢量图 

光栅图有两个缺点，即文件体积太大和重新调整图像大小有麻烦。放大光栅图像意味着扩大像素，所以放大后的图像看上去很粗糙。但是，矢量图图像编码方法并不存储每个像素的位模式。一个图像被分解成几何图形的组合，例如，线段、矩形或圆形。每个几何形状由数学公式表达。例如，线段可以由它端点的坐标描述，圆可以由它的圆心坐标和半径长度来描述。矢量图是由定义如何绘制这些形状的一系列命令构成的。

当要显示或打印图像时，将图像的尺寸作为输入传给系统。系统重新设计图像的大小并用相同的公式両出图像。在这种情况下，每一次绘制图像，公式也将重新估算一次。因此，矢量图也称为几何模型或面向对象图形。

例如，考虑半径为r的圆形工程序需要绘制该圆的主要信息如下:

  * 一个圆的半径r。
  * 圆心的位置。
  * 绘制的线型和颜色。
  * 填充的类型和颜色。

当该圆的大小改变时工程序改变半径的值并重新计算这些信息以便再绘制一个圆。改变图像大小不会改变绘图的质量。

矢量图不适合存储照片图像的细微精妙。JPEG或GIF光栅图提供了更好和更生动的图片。矢量图适合应用程序采用主要的几何元素来创建图像。它用于诸如Flash这样的应用程序，以及创建 TrueType (微软、苹果公司)和PostScript(Adobe公司)字体。计算机辅助设计(CAD)也使用矢量图进行工程绘图。

##  存储视频

视频是图像(称为帧)在时间上的表示。一部电影就是一系列的帧一张接一张地播放而形成运动的图像。换言之，视频是随空间(单个图像)和时间(一系列图像)变化的信息表现。所以，如果知道如何将一幅图像存储在计算机中，我们也就知道如何储存视频每一幅图像或帧转化成一系列位模式并储存。这些图像组合起来就可表示视频。需要注意现在视频通常是被压缩存储的。


## 作业

1. 将下列十进制数转换成16位无符号整数。  
>a.41 b.411 c.1234 d.342  

2. 将下列十进制数转换成8位二进制补码表示法。  
>a.-12 b.-145 c.56 d.142

3. 将下列十进制数转换成16位二进制补码表示法  
>a.102 b.-179 c.534 d.62 056

4. 将下列8位无符号整数转换成十进制数。  
>a.01101011 b.10010100 c.00000110 d.01010000

5. 回答以下关于实数浮点表示法的问题：

>a. 为什么需要规范化?  
>b. 什么是尾数?  
>c. 数字在规范化以后，何种信息被计算机存储在内存中?', 3, 1, NULL, '2020-05-21 18:21:33.527819', '2020-05-21 18:21:33.527819', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (79, '数学运算', NULL, 20, NULL, NULL, '## 逻辑运算

在上一章中，我们讨论了计算机中的数据是以位模式存储的事实。逻辑运算是指那些应用于模式中的一个二进制位，或在两个模式中相应的两个二进制位的相同基本运算。这意味着我们可以在位层次上和模式层次上定义逻辑运算。模式层次上的逻辑运算是具有相同类型的位层次上的n个逻辑运算，这里的吕就是模式中的位的数目。

### 1. 位层次上的逻辑运算

一个位可能是0或1，可以假设“0”代表逻辑“假”，而“1”代表逻辑“真”。我们可以应用布尔代数中定义的运算去操纵二进制位。为纪念乔治·布尔（[George Boole](https://en.wikipedia.org/wiki/George_Boole)）而命名的布尔代数属于逻辑的特殊数学领域。附录E将介绍布尔代数和它在建立计算机中逻辑电路中的应用。本节我们将简单介绍4种被用来操纵二进制位的位层次上的运算非(NOT)、与(AND）、或(OR)和异或(XOR)。

**布尔代数和逻辑电路将在附录E中讨论**

图 1显示了这4种位层次上运算的符号及其真值表。真值表定义了对于每一种可能的输入的输出值。注意每个运算符的输出总是一位，但输入可以是一位或两位。

**1. 非 (NOT)**

NOT运算符是一元操作符它只有一个输入。输出位是输入位的相反，如果输入是0,则输出为1；如果输入为1.则输出为0。换言之，NOT运算符是输入的反转。NOT运算符的真值表只有两行，因为单个输入只有两种可能：0或1。

![图 1](https://img-camp.banyuan.club/online/foundation/chapter4/4-1.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 1位层次上的逻辑运算**

**2. 与 (AND)**

AND运算符是二元运算符它有两个输入。如果输入都是1，则输出为1，而在其他三种情况下，输出都是0。AND运算符的真值表有4行，因为两个输入有4种可能的输入组合。

特性：AND运算符有趣的一点是如果一个输入中有一位是0，则不需要检查其他输入中的相应的位，便可迅速得到结果为0。当我们讨论此运算符在位模式层次上的应用时，我们将用到这个特性。

**对于x=0或1 x AND  0→0 和 0 AND x →0**

**3. 或(OR)**

OR运算符也是二元运算符它有两个输入。如果输入都是0，则输出为0.而在其他三种情况下，输出都是1，0R运算符的真值表也有4行。OR运算符有时称为包舍或运算符，因为输出值为1时，不但有其中一个输入为1，而且还有两个输入都是1。这与我们下面要介绍的运算符相对照。

特性：OR运算符有趣的一点是如果一个输入中有一位是1，则不需要检査其他输入中的相应的位，便可迅速得到结果为1。当我们讨论此运算符在位模式层次上的应用时，我们将用到这个特性。

**对于 x=0 或 1 x OR 1→1 和 1 OR x →1**

**4. 异或(XOR)**

**XOR 运算符**(发音为“exclusive-or”)像或运算符一样也是二元运算符，只是有一点不同，如果输入都是1，则输出为0。我们能用另一种方式来看这个运算符当输入相同时，则输出为0 。当输入不同时，则输出为1 。

**▷ 例 1** 在英语中，我们使用连词“或”时，有时意思是包含或，有时意思却是异或。  

a. 句子"I wish to have a car or a house"使用的“or”就是包含或的意思，我希望有一辆车，一栋房子，或二者兼而有之。  
b. 句子"Today is either Monday or Tuesday"使用的"or"就是异或的意思，今天可以是星期一或星期二，但不能两个都是。  

**▷ 例 2**  XOR运算符其实不是新的运算符，我们能用其他三个运算符来模拟它。下面两个表达式是等价的。

> x XOR y ↔[x AND (NOT y)] OR [(NOT x)AND y]

如果我们给出两个表达式的真值表，等价就可以得到证明。

特性：XOR的特性是如果输入中的一位是1，那结果就是与其他输入中相应位相反。当我们讨论此运算符在位模式层次上的应用时，我们将用到这个特性。

**对于 x=0 或 1 x XOR 1→NOT x 和 x XOR 1 → NOT x**

### 2. 模式层次上的逻辑运算

相同的4个运算符(NOT、AND、OR和XOR)可以被应用到n位模式。效果就是对NOT运算来说，把每个运算符应用于每个位，对于其他3个运算符就是把每个运算符应用于相应的位对。图 2显示了带输入和输出模式的4个运算符。

![图 1](https://img-camp.banyuan.club/online/foundation/chapter4/4-2.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 2 应用于位模式的逻辑运算符**

**▷ 例 3** 用NOT（非）运算符来计算位模式10011000。


**解**  结果显示如下，注意NOT运算符把每个0变成1，把每个1变成0。

```
NOT   1  0  0  1  1  0  0  0  输入
      0  1  1  0  0  1  1  1  输出
```

**▷ 例 4** 用AND(与)运算符来计算位模式10011000和00101010。

**解** 结果显示如下，注意只有输入中相应的位都为1，输出中的位才为1。

```
     1  0  0  1  1  0  0  0  输入1
AND  0  0  1  0  1  0  1  0  输入2
     0  0  0  0  1  0  0  0  输出
```
**▷ 例 5** 对位模式数值10011001和00101110应用OR(或)运算。

**解** 结果显示如下，注意只有输入中相应的位都为O,输出中的位才为0。

```
    1  0  0  1  1  0  0  1  输入1
OR  0  0  1  0  1  1  1  0  输入2
    1  0  1  1  1  1  1  1  输出
```

**▷ 例 6** 使用XOR(异或)运算符对10011001和00101110位运算。

**解** 结果显示如下，比较本例的结果与上例的结果。唯上的不同是当输入中相应的位都为1时，输出中的位才为0.

```
     1  0  0  1  1  0  0  1  输入1
XOR  0  0  1  0  1  1  1  0  输入2
     1  0  1  1  1  1  1  1  输出
```
**应用**

4种逻辑运算能被用来修改位模式。

(1) 求反

NOT运算符的唯一应用就是对整个模式求反。对模式应用此运算符把每个0变成1，把每个1变成0。这种方式有时候也称为一个求反运算。例 3显示了求反的效果。

(2) 使指定的位复位

AND运算的一个应用就是把一个位模式的指定位复位(量0)。这种情况下的第二个输入称为掩码。掩码中的0位对第一个输入中相应的位进行复位。掩码中的1位使得第三个输入中相应的位保持不变。这是由我们提到过的AND运算符的特性决定的如果输入中有一个是O,不管其他输入是什么，输出都是0。模式中的复位有许多应用，例如，如果一个图像使用的是每像素只有一位(黑白图像)，那么我们能使用掩码和AND运算符使指定像素变黑。

**▷ 例 7** 使用掩码复位模式的最左5位。用模式10100110测试掩码。

**解** 掩码是00000111，应用掩码的结果是：

<pre>
     1  0  1  0  0  1  1  0  输入
AND  0  0  0  0  0  1  1  1  掩码
     <b calss="dem">0  0  0  0  0</b>  1  1  0  输出
</pre>

注意最右边的3位保持不变，而最左边5位，不管它们先前的值是什么，都被复位(变为0)。

(3) 对指定的位置位

OR运算的一个应用是把一个位模式的指定位置位（置1）。我们再次使用掩码，但是一个不同的掩码。掩码中的1位对第一个输入中的相应的位进行置位。而掩码中的0位使第一个输入中相应的位保持不变。这是由我们提到的OR运算符的特性决定的如果一个输入为1.不管其他输入是什么，输出都将是1。模式中的位置位有许多应用，例如，如果一个图像使用的是每像素只有一位(黒白图像)，那么我们能使用掩码和OR运算符使指定像素变白。

**▷ 例 8** 使用掩码把一个位模式的最左5位置位。使用10100110测试这个掩码。 
**解** 此掩码为11111000。 应用此掩码的结果为：

<pre>
    1  0  1  0  0  1  1  0  输入
OR  1  1  1  1  1  0  0  0  掩码
    <b class="dem">1  1  1  1</b>  1  1  1  0  输出
</pre>
(4) 使指定的位反转

XOR运算的一个应用是使指定的位反转，我们再次使用掩码，但是一个不同的掩码。掩码中的1位对第一个输入中的相应的位进行反转，而掩码中的0位使第一个输入中相应的位保持不变。这是由我们提到的XOR运算符的特性决定的：如果一个输入为1，输出与相应的位相反。注意NOT运算符和XOR运算符间的区别。NOT运算符是将输入中所有的位求反，而XOR运算符只是对第一个输入中指定的位求反，正如掩码中所定义的。

**▷ 例 9** 用掩码来反转一个模式的最左边5位。用模式10100110检验掩码。

**解** 掩码为11111000。运用掩码后的结果为：

<pre>
     1  0  1  0  0  1  1  0  输入
XOR  1  1  1  1  1  0  0  0  掩码
     <b class="dem">0  1  0  1  1</b>  1  1  0  输出
</pre>

## 移位运算

移位运算移动模式中的位，改变位的位置。它们能向左或向右移动位。我们可以把移位运算分成两大类逻辑移位运算和算术移位运算。

逻辑移位运算

逻辑移位运算应用于不带符号位的数的模式。原因是这些移位运算可能会改变数的符号，此符号是由模式中最左位定义的。我们区分两类逻辑移位运算，如下面描述。

1. 逻辑移位  
逻辑右移运算把每一位向右移动一个位置。在n位模式中，最右位丢失，最左位填0。逻辑左移运算把每一位向左移动一个位置。在n位模式中，最左位丢失，最右位填0。图 3显示了对一个8位模式的逻辑右移和逻辑左移。

![图 3](https://img-camp.banyuan.club/online/foundation/chapter4/4-3.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 3 逻辑移位运算**

**▷ 例 10** 对位模式10011000使用逻辑左移运算。  
**解** 解如下所示，最左位被丢弃，0作为最右位被插人。

<pre> 
←   1  0  0  1  1  0  0  0  原始位
    0  0  1  1  0  0  0  <b class="dem">0</b>  移位后
</pre>
**循环移位**

**循环移位运算**(旋转运算)对位进行移位，但没有位被丢弃或增加。循环右移(或右旋)把每一位向右移动一个位置，最右位被回环，成为最左位。循环左移(或左旋40把每一位向左移动一个位置，最左位被回环，成为最右位。图 4显示了循环左移和循环右移运算。

![图 4](https://img-camp.banyuan.club/online/foundation/chapter4/4-4.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 4 循环移位运算**

**▷ 例 11** 到对位模术1ooııooo使用循环左移运算。

**解** 解如下所示，最左位被回环，成为最右位。

<pre>
原始位   ← 1  0  0  1  1  0  0  0  回环
移位后     0  0  1  1  0  0  0  <b class="dem">1</b>
</pre>


2. 算术移位运算

**算术移位运算**假定位模式是用二进制补码格式表示的带符号位的整数。算术右移被用来对整数除以2；而算术左移被用来对整数乘以2(后面讨论)。这些运算不应该改变符号位(最左)。算术右移保留符号位，但同时也把它复制，放入相邻的右边的位中。因此符号被保存。算术左移丢弃符号位，接受它的左边的位作为符号位。如果新的符号位与原先的相同，那么运算成功，否则发生上溢或下溢，结果是非法的。图 5显示了这两种运算。

![图3-1](https://img-camp.banyuan.club/online/foundation/chapter4/4-5.png?x-oss-process=image/resize,w_600/sharpen,100)

**图 5算术移位运算**

**▷ 例 12** 对位模式10011001使用算术右移，模式是二进制补码格式的整数。  
**解** 解如下所示，最左位被保留，被复制到相邻的右边的位中。

<pre>
算术右移   1  0  0  1  1  0  0  1   原始的
          <b class="dem">1</b>  0  1  1  0  0  1  0  移位的
</pre>


原始数是-103，新的数是-52，它是-103被除以2并取整的结果。

**▷ 例 13** 对位模式11011001使用算术左移，模式是二进制补码格式的整数。  
**解** 解如下所示，最左位被丢弃，O作为最右位被插人。

<pre>
算术左移  1  0  0  1  1  0  0  1  原始的
         1  0  1  1  0  0  1  <b class="dem">0</b>  移位的
</pre>


原始数是-39，新的数是-78，原始数被乘以2。因为没有下溢的发生，所以运算合法。

**▷ 例 14** 对位模式onm11使用算术左移，模式是二进制补码格式的整数。  
**解** 解如下所示，最左位被丢弃，O作为最右位被插人。

<pre>
算术左移  0  1  1  1  1  1  1  1  原始的
         1  1  1  1  1  1  1  <b class="dem">0</b>  移位的
</pre>


原始数是127，新的数是-2。因为上溢发生，所以结果非法。期望的答案是127 × 2=254，这个数不能用8位模式表示。

**▷ 例 15** 逻辑运算和逻辑移位运算给我们提供了操纵位模式的工具。假设有一个模式，在判断过程中需要使用此模式的第三位(从右起)，需要知道这特殊的位是0或1。下面显示了如何找出这位。

<pre>
     h  g  f  e  d  <b class="dem">c</b>  b  a  原始的
     0  h  g  f  e  d  <b class="dem">c</b>  b  一次右移
     0  0  h  g  f  e  d  <b class="dem">c</b>  二次右移
AND  0  0  0  0  0  0  0  1  掩码
     0  0  0  0  0  0  0  <b class="dem">c</b>  结果
</pre>


我们先对模式进行两次右移，这样目标位被移到最右的位置。然后通过最右位为1其余为0的掩码和AND运算就能得出结果。结果是有7个0，目标位在最右位置的模式。然后可以测试结果如果它是无符号的整数l，那么目标位就是1；而如果结果是无符号的整数0，那么目标位就是0.

## 算术运算

**算术运算**包括加、减、乘、除，适用于整数和浮点数。

### 1. 整数的算术运算

所有算术运算(如加、减、乘、除)均适用于整数。虽然整数的乘法(除法)能使用重复的加法(减法)来实现，但程序是低效的。对于乘法和除法有更高效的程序(如Booth工程序)，但这些超过了本书的范围，基于这个原因，我们这里只讨论整数的加法和减法。

**1. 二进制补码中的加减法**

我们首先讨论二进制补码表示的整数的加法和减法，这是因为它较容易。正如我们在上一章讨论的，整数通常是以二进制补码形式存储的。二进制补码表示法的一个优点是加法和减法间没有区别。当遇到减法时，计算机只简单地把它转变为加法，但要为第二个数求二进
制的补。换言之:

A+B↔A+（B取反+1），这里的（B取反+1）表示B的补码

这就意味着我们只需要讨论加法。二进制补码中的加法就像十进制中的加法一样列与列相加，如果有进位，就加到下一列上。但是，最后一列的进位被舍弃。

记住，我们是一列接一列相加整数的。在每一列中，如果没有从前一列来的进位，那就有两位相加或者如果有从前一列来的进位，那就有三位相加。在每一一列中。1的数目可以是O、1、2或3。表 1显示了和以及进位(C)。

**表 1 两位相加的进位以及和结果**


| 列    | 进位    |  和   |
|:---:|:---:|:---:|
|  0个1   |  0   |   0  |
|  1个1   |  0  |   1  |
|  2个1| 1    |  0   |
|  3个 1  |  1   |  1   |

现在我们能显示两个用二进制补码格式表示的整数的加法或减法过程(图 6)。注意我们使用(X取反十1)表示X的补码，因为X取反表示X的反码，所以这种记号非常常见。如果给个整数的反码加1，就得到它的补码。

![图3-1](https://img-camp.banyuan.club/online/foundation/chapter4/4-6.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 6 二进制补码格式表示的整数的加法和减法**

过程如下：

**1) 如果运算是减法，我们取第二个整数的二进制补码，否则，转下一步。**  
**2) 两个整数相加。**

**▷ 例 16** 以二进制补码格式存储两个整数A和B,显示B是如何被加到A上的。

>A = (000100011)<sub>2</sub>    B = (00010110)<sub>2</sub>

**解** 运算是相加，A被加到B上，结果存储在R中。

<pre>
          1                 进位 
     0  0  0  1  0  0  0  1   A 
  <b class="dem">+</b>  0  0  0  1  0  1  1  0   B
<hr />
     0  0  1  0  0  1  1  1   R
</pre>



用十进制检查结果(+17)+(+22)=(+39)。

**▷ 例 17** 以二进制补码格式存储两个整数A和B,显示B是如何被加到A上的。

>A = (00011000)<sub>2</sub>2   B= (11101111)<sub>2</sub>

**解** 运算是相加，A被加到B上，结果存储在R中。注意，最后的进位被舍弃，因为存储器大小只有8位。

<pre>
  1  1  1  1  1              进位
     0  0  0  1  1  0  0  0   A
+    1  1  1  0  1  1  1  1   B
     0  0  0  0  0  1  1  1   R
</pre>

用十进制检查结果(+24)+(-17)=(+7)。

**▷ 例 18** 以二进制补码格式存储两个整数A和B,显示如何从A中减去B。  
**解** 运算是相减，A被加到(B反+1)上，结果存储在R中。

<pre>
             1                  进位
       0  0  0  1  1  0  0  0    A
 +     0  0  0  1  0  0  0  1  B反+1 
       0  0  1  0  1  0  0  1    R 
</pre>

十进制检查结果(+24)-(-17)=(+41)。

**▷ 例 19** 以二进制补码格式存储两个整数A和B,显示如何从A中减去B.

>A = (11011101)<sub>2</sub> B = (00010100)<sub>2</sub>

**解** 运算是相减，A被加到(B反+1)上，结果存储在R中。

<pre>
   1  1  1  1  1  1            进位
      1  1  0  1  1  1  0  1    A
  +   1  1  1  0  1  1  0  0  B反+1
      1  1  0  0  1  0  0  1    R
</pre>


用十进制检查结果(-35)-(+20=(-55)。注意最后的进位被舍弃。

**▷ 例 20** 以二进制补码格式存储两个整数A和B,显示B如何被加到A上。

>A = (01111111)<sub>2</sub>  B = (00000011)<sub>2</sub>

**解** 运算是相加，A被加到B上，结果存储在R中。

<pre>
   1   1 1  1  1  1  1  1  进位   
   0  1  1  1  1  1  0  1    A    
+  0  0  0  0  0  0  1  1    B   
   1  0  0  0  0  0  1  0    R
</pre>


我们期望的结果是127+3=130，但答案是-126。错误是由于上溢，因为期望的答案(+130)不在范围-128～+127之间。

![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **当我们进行计算机中数字上的算术运算时，要记住每个数字和结果应该在分配的二进制位的定义范围之内。**

**2. 符号加绝对值整数的加减法**

用符号加绝对值表示的整数的加法和减法看起来非常复杂。我们有4种不同的符号组合(两个符号，每个有两个值)，对于减法有4种不同的条件。这就意味着我们要考虑8种不同的情况。但是，如果先检查符号，则可以简化这些情况，如图 7所示。

![图 7](https://img-camp.banyuan.club/online/foundation/chapter4/4-7.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 7符号加绝对值格式的幕栄的加法和减法**

首先来解释流程图:

**1) 检查运算，如果运算是减法，那么改变第二个整数(B)的符号。这就意味着我们现在只要考虑两符号整数的加法。**  
**2) 对两符号应用XOR运算，如果结果(存储在临时单元S中)是O,则意味着符号是相同的(或者两符号都是正的，或者两符号都是负的)。**  
**3) 如果符号是相同的，R一土(AM+BM)，我们需要相加绝对值，结果的符号是相同的符号，所以得到:**  

>R<sub>M</sub> = (A<sub>M</sub>) + (B<sub>M</sub>) 和 Rs = As

这里下标M意味着绝对值，下标S意味着符号。但是，在这种情况下，我们应该仔细考虑上溢。我们相加两个绝对值时，可能会发生上溢，它必须被报告，处理过程终止。

**4) 如果符号不同，R=土(A<sub>M</sub> + B<sub>M</sub>)，则需要从A<sub>M</sub>中减去B<sub>M</sub>,然后对符号进行判断，不是一位接一位地相减，而是取第二个绝对值(B<sub>M</sub>)的二进制补码，相加它们。结果的符号是较大绝对值整数的符号。**

a. 可以证明，如果A<sub>M</sub>≧v<sub>M</sub>，那就有上溢，结果是一个正数。因此，如果有上溢，则舍弃上溢，使结果的符号取A的符号。  
b. 可以证明，如果A<sub>M</sub>〈B<sub>M</sub>,那就没有上溢，结果是一个负数。因此，如果没有上溢，则取结果的二进制补码，使结果的符号取B的符号。  

**▷ 例 21** 以符号加绝对值格式存储两整数A和B(为了清楚起见，我们把符号与绝对值分隔开)，显示B是如何被加到A上的。

>A=(0 0010001)<sub>2</sub>  B=(0 00101 10)<sub>2</sub>

**解** 运算是相加，B的符号没有改变，既然S = A<sub>s</sub> XOR B<sub>s</sub>=0,R<sub>M</sub> = A<sub>M</sub>+B<sub>M</sub>和R<sub>s</sub>=A<sub>s</sub>那么这里没有上溢。

<pre>
   符号 没有上溢     1                   进位
 A<sub>s</sub>  <b class="dem">0</b>          0  0  1  0  0  0  1     A<sub>M</sub>
 B<sub>s</sub>  <b class="dem">0</b>       +  0  0  1  0  1  1  0     B<sub>M</sub>
 R<sub>s</sub>  <b class="dem">0</b>          0  1  0  0  1  1  1     R<sub>M</sub>
</pre>


用十进制检验结果(+17)+(+22)=(+39)。

**▷ 例 22** 以符号加绝对值格式存储两整数月和B,显示B是如何被加到A上的。

>A = (0 0010001)<sub>2</sub> B=(1 0010110)<sub>2</sub>

**解** 运算是相加，B的符号没有改变，S = A<sub>s</sub> XOR B<sub>s</sub>=1，R<sub>M</sub>=A<sub>M</sub>+(B反+1)既然没有上溢，我们需要取R<sub>M</sub>的二进制补码，R的符号是B的符号。

<pre style="background:#f9f9f9;">
  符号 没有上溢                   进位
A<sub>s</sub> <b class="dem">0</b>      0  0  1  0  0  0  1    A<sub>M</sub>   
B<sub>s</sub> <b class="dem">1</b>   +  1  1  0  1  0  1  0   （B<sub>M</sub>反 + 1） 
 <hr/>
          1  1  1  1  0  1  1    R<sub>M</sub>  
 R<sub>s</sub> <b class="dem">1</b>     0  0  0  0  1  0  1    R<sub>M</sub>=（R<sub>M</sub>反 + 1）
</pre>

用十进制检验结果(+17)+(-22)=(-5)。

**▷ 例 23** 以符号加绝对值格式存储两整数A和B,显示如何从A中减去B。

>A=(1 1010001)<sub>2</sub>  B= (10010110)<sub>2</sub>

**解** 运算是相减，B<sub>s</sub>，S=A<sub>s</sub>XOR B<sub>s</sub>=1,R<sub>M</sub>=A<sub>M</sub>+(B反<sub>M</sub>+1，既然有上溢，R<sub>M</sub>的值就是最终的值，R的符号是A的符号。

<pre>
   符号 没有上溢                       进位   
 A<sub>s</sub> <b class="dem">1</b>      1  1  0  1  0  0  0  1     A<sub>M</sub>   
 B<sub>s</sub> <b class="dem">1</b>      +  1  1  0  1  0  1  0 （B<sub>M</sub>反 + 1） 
 R<sub>s</sub> <b class="dem">1</b>         0  1  1  1  0  1  1     R<sub>M</sub>  
 </pre>

用十进制检验结果(-81)-(-2)=(-59)。

### 2. 实数的算术运算

像加、减、乘和除这样的算术运算都能应用于用浮点数格式存储的实数上。两实数的乘法涉及两个用符号加绝对值表示的整数的乘法；两实数的除法涉及两个用符号加绝对值表示的整数的除法。有兴趣的同学可以参考其他资料，本课不做延伸。

## 作业

1. 求下列运算的结果:  

  > a.NOT(99)<sub>16</sub> b.NOT(FF)<sub>16</sub> c.NOT(00)<sub>16</sub> d.NOT(01)<sub>16</sub>

2. 求下列运算的结果:  

  > a.(99)<sub>16</sub> AND (99)<sub>16</sub> b.(99)<sub>16</sub> AND (00)<sub>16</sub> c.(99)<sub>16</sub> AND (FF)<sub>16</sub> d.(FF)<sub>16</sub> AND (FF)<sub>16</sub>

3. 求下列运算的结果:  

  > a.(99)<sub>16</sub> OR (99)<sub>16</sub> b.(99)<sub>16</sub> OR (00)<sub>16</sub> c.(FF)<sub>16</sub> AND (FF)<sub>16</sub> d.(FF)<sub>16</sub> OR (FF)<sub>16</sub>
', 4, 1, NULL, '2020-05-21 18:21:33.570142', '2020-05-21 18:21:33.570142', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (80, '计算机组成', NULL, 20, NULL, NULL, '
## 引言

计算机的组成部件可以分为三大类(或子系统)中央处理单元(CPU)、主存储器和输入/输出子系统。接下来的三个部分将讨论这些子系统以及如何将这些子系统组成一台计算机。图 1给出了组成计算机的这三个子系统。

![图 1](https://img-camp.banyuan.club/online/foundation/chapter5/5-1.png?x-oss-process=image/resize,w_600/sharpen,100)

**图 1 计算机硬件（子系统）**

## 中央处理单元

中央处理单元(CPU)用于数据的运算。在大多数体系结构中，它有三个组成部分算术逻辑单元(ALU)、控制单元、寄存器组、快速存储定位(图 2)。

![图 2](https://img-camp.banyuan.club/online/foundation/chapter5/5-2.png?x-oss-process=image/resize,w_600/sharpen,100)

**图 2 中央处理单元**

### 1. 算术逻辑单元 

**算术逻辑单元**(ALU)对数据进行逻辑、移位和算术运算。

**1). 逻辑运算**

在上一章中，我们讨论了几种逻辑运算，如非、与、或和异或。这些运算把输入数据作为二进制位模式，运算中央处理单元(CPU)的结果也是二进制位模式。

**2). 移位运算**

在上一章中，我们讨论了数据的两种移位运算逻辑移位运算和算术移位运算。逻辑移位运算用来对二进制位模式进行向左或右的移位，而算术运算被应用于整数。它们的主要用途是用2除或乘某一个整数。

**3). 算术运算**

在上一章我们讨论了整数和实数上的一些算术运算，我们提到有些运算能被更高效率的硬件实现。

### 2. 寄存器

**寄存器**是用来存放临时数据的高速独立的存储单元。CPU的运算离不开大量寄存器的使用。其中的一些寄存器可参见图 2。

**1). 数据寄存器**
在过去，计算机只有几个数据寄存器用来存储输入数据和运算结果。现在，由于越来越多的复杂运算改由硬件设备实现(而不是使用软件)，所以计算机在CPU中使用几十个寄存器来提高运算速度，并且需要一些寄存器来保存这些运算的中间结果。在图 2中，数据寄存器被命名为R<sub>1</sub>到R<sub>n</sub>。

**2). 指令寄存器**

现在，计算机存储的不仅是数据，还有存储在内存中相对应的程序。CPU的主要职责是从内存中逐条地取出指令，并将取出的指令存储在**指令寄存器**(图 2中寄存器IR)中，解释并执行指令。我们将在接下来的小节中讨论这个问题。

**3). 程序计数器**

CPU中另一个通用寄存器是**程序计数器**(图 2中的PC寄存器)工程序计数器中保存着当前正在执行的指令。当前的指令执行完后，计数器将自动加1，指向下一条指令的内存地址。

### 3.  控制单元

CPU的第三个部分是控制单元，**控制单元**控制各个子系统的操作。控制是通过从控制单元到其他子系统的信号来进行。

## 主存储器

**主存储器**是计算机内的第二个子系统(图 3)。它是存储单元的集合，每一个存储单元都有唯一的标识，称为地址。数据以称为字的位组的形式在内存中传入和传出。宇可以是8位、16位、32位，甚至有时是64位(还在增长)，如果字是8位，一般称为1字节。术语字节在计算机科学中使用相当普遍，因此有时称16位为2字节，32位为4字节。

![图 3](https://img-camp.banyuan.club/online/foundation/chapter5/5-3.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 3 主存储器**

### 1. 地址空间

在存储器中存取每个字都需要有相应的标识符。尽管程序员使用命名的方式来区分字(或一组字的集合)，但在硬件层次上，每个字都是通过地址来标识的。所有在存储器中标识的独立的地址单元的总数称为地址空间。例如，一个64 KB、字长为1字节的内存的地址空间的范围为0～65 535。

表5-1给出了经常用来表示存储大小的单位名称。注意这些专用术语可能有误导，好像以10的幕的形式来近似表示字节数，而实际上字节的数目是2的幂。采用2的幂形式为单位使得寻址更为方便。

**表5-1存储单位**

|   单位   |   字节数的准确值   |   近似值   |
|:-------:|:-------:|:-------:|
|千字节 |2<sup>10</sup>(1024)字节| 10<sup>3</sup>字节|
|兆字节 |2<sup>20</sup>(1048576)字节| 10<sup>6</sup>字节|
|千兆字节 |2<sup>30</sup>(1073741824)字节| 10<sup>9</sup>字节|
|兆兆字节 | 2<sup>40</sup>(1024)字节 | 10<sup>12</sup>字节 |

**作为位撲式的地址**

由于计算机都是以**位模式**存储数并进行运算，因此地址本身也是用位模式表示的。如果一个内存是64K(2<sup>16</sup>)，宇长为1字节，那么就需要16位的位模式来确定地址。回顾前面章节我们曾经提到地址用无符号整数表示(不用负的地址)。换言之，起始地址通常是0000000000000000(地址0)，最后一个地址通常是1111111111111111(地址65 535)。通常，如果一个计算机有N个字的存储空间，那就需要有log<sub>2</sub>N位的无符号整数来确定一个存储单元。

>![着重符号](https://img-camp.banyuan.club/wiki/comment.png?x-oss-process=image/resize,w_18/sharpen,100) **内存地址用无符号二进制整数定义**

**▷ 例 1** 一台计算机有32 MB(兆字节)内存。需要多少位来寻址内存中的任意一个字节?  
**解** 内存地址空间是32MB,即2<sup>25</sup>(2<sup>5</sup>×2<sup>20</sup>)。这就意味着需要log<sub>2</sub>2<sup>25</sup>(25位)来标识每一个字节。

**▷ 例 2** 一台计算机有128 MB内存。计算机字长为8字节，需要多少位来寻址内存中任意一个单字？  
**解** 内存地址空间是128MB,即2<sup>27</sup>。但是，每个字是8(2<sup>3</sup>)字节，这意味着需要2<sup>24</sup>个字，也就是说你要log<sub>2</sub>2<sup>24</sup>(24位)来标识每一个字。

### 2. 存储器的类型

主要有两种类型的存储器：RAM和ROM。

**◇ A. RAM**

**随机存取存储器**(RAM)是计算机中主存的主要组成部分。在随机存取设备中。可以使用存储单元地址来随机存取一个数据项，而不需要存取位于它前面的所有数据项。该术语有时因为ROM也能随机存取而与ROM混淆，RAM和ROM的区别在于，用户可读写RAM,即用户可以在RAM中写信息，之后可以方便地通过覆盖来擦除原有信息。从M的另一个特点是易失性。当系统断电后，信息（程序或数据)将丢失。换句话说，当计算机断电后，存储在R旒中的信息将被删除。RAM技术又可以分为两大类SRAM和DRAM.

(1) SRAM

**静态RAM**(SRAM)技术是用传统的触发器门电路(见附录E)来保存数据。这些门保持状态(0或1)，也就是说当通电的时候数据始终存在，不需要刷新。SRAM速度快，但是价格昂贵。

(2) DRAM

**动态RAM**(DRAM)技术使用电容器。如果电容器充电，则这时的状态是l如果放电则状态是0。因为电容器会随时间而漏掉一部分电，所以内存单元需要周期性地刷新。DRAM比较慢，但是比较便宜。

**◇ B. ROM**

**只读存储器**(ROM)的内容是由制造商写进去的。用户只能读但不能写，它的优点是非易失性当切断电源后，数据也不会丢失。通常用来存储那些关机后也不能丢失的程序或数据。例如，用ROM来存储那些在开机时运行的程序。

**◇ C. PROM**

称为**可编程只读存储器**(PROM)的一种ROM.这种存储器在计算机发货时是空白的。计算机用户借助一些特殊的设备可以将程序存储在上面。当程序被存储后，它就会像ROM一样不能够重写。也就是说，计算机使用者可以用它来存储一些特定的程序。

**◇ D. EPROM**

称为**可擦除可编程只读存储器**(EPROM)的一种PROM。用户可以对它进行编程，但是得用一种可以发出紫外光的特殊仪器对其撰写。EPROM存储器需要拆下来擦除再重新安装。

**◇ E. EEPROM**

称为**电可擦除可编程只读存储器**(EEPROM)的一种EPROM.对它的编程和擦除用电子脉冲即可，无须从计算机上拆下来。

### 3. 存储器的层次结构

计算机用户需要许多存储器，尤其是速度快且价格低廉的存储器。但这种要求并不总能得到满足。存取逮度快的存储器通常都不便宜。因此需要寻找一种折中的办法。解决的办法是采用存储器的层次结构(图 4)。该层次结构图如下。

![图 4](https://img-camp.banyuan.club/online/foundation/chapter5/5-4.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 4 存储器的层次**

* 当对速度要求很苛刻时可以使用少量高速存储器。CPU中的寄存器就是这种存储器。  
* 用适量的中速存储器来存储经常需要

### 4. 高速缓冲存储器

**高速缓冲存储器**的存取速度要比主存快，但是比CPU及其内部的寄存器要慢。高速缓冲存储器通常容量较小，且常被置于CPU和主存之间(图 5)。

**高速缓冲存储器**在任何时间都含有主存中一部分内容的副本。当cpu要存取主存中的一个字的时候，将按以下步骤进行：

1) CPU首先检查高速缓冲存储器。  
2) 如果要存储的字存在，CPU就将它复制；如果不存在，CPU将从主存中复制一份从需要读取的字开始的数据块。该数据块将覆盖高速缓冲存储器中的内容。

![图 5](https://img-camp.banyuan.club/online/foundation/chapter5/5-5.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 5 高速缓冲存储器**

3) CPU存取高速缓冲存储器并复制该字。

这种方式将提高运算的速度；如果宇在高速缓冲存储器中，就立即存取它。如果字不在高速缓冲存储器中，字和整个数据块就会被复制到高速缓冲存储器中。因为很有可能CPU在下次存取中需要存取上次存取的第一个字的后续字，所以高速缓冲存储器可以大大提高处理的速度。

读者可能会奇怪为什么高速缓冲存储器尽管存储容量小效率却很高，这是由于80-20规则。据观察，通常计算机花费80%的时间来读取20%的数据。换句话说，相同的数据往往被存取多次。高速缓冲存储器，凭借其高遮，可以存储这20%的数据而使存取至少快80%。

## 输入/输出子系统

计算机中的第三个子系统是称为**输入/输出(I/O)子系统**的一系列设备。这个子系统可以使计算机与外界通信，并在断电的情况下存储程序和数据。输入/输出设备可以分为两大类非存储设备和存储设备。

### 1. 非存储设备

**非存储设备**使得CPU/内存可以与外界通信，但它们不能存储信息。

**◇ A. 键盘和监视器**

两个最常见的非存储输入/输出设备是键盘和监视器。**键盘**提供输入功能；**监视器**显示输出并同时响应键盘的输入工程序、命令和数据的输入或输出都是通过字符中进行的。字符则是通过字符集(如ASCII码)进行编码(参见附录A)。此类中其他的设备有鼠标、操纵杆等。

**◇ B. 打印机**

打印机是一种用于产生永久性记录的**输出设备**。它是非存储设备，因为要打印的材料不能够直接由打印机输入计算机中，而且也不能再次利用，除非有人通过打字或扫描的方式再次输入计算机中。

### 2. 存储设备

尽管存储设备被分为输入/输出设备，但它可以存储大量的信息以各后用。它们要比主存便宜得多，而且存储的信息也不易丢失(即使断电信息也不会丢失)。有时称它们为辅助存储设备，通常分为磁介质和光介质两种。

**◇ A. 磁介质存储器设备**

磁介质存储器设备使用磁性来存储位数据。如果一点有磁性则表示1；如果没有磁性则表示0。

(1) 磁盘

**磁盘**是由一张一张的磁片叠加而成的。这些磁片由薄磁膜封装起来。信息是通过盘上每一个磁片的读/写磁头读写磁介质表面来进行读取和存储的。图 6给出了磁盘驱动的物理布局和磁盘的组织。

![图 6](https://img-camp.banyuan.club/online/foundation/chapter5/5-6.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 6 磁盘**

* 表面结构。  
为了将数据存储在磁盘的表面，每个盘面都被划分成磁道，每个磁道又分成若干个月区(图 6)。磁道间通过磁道内部间隔隔开，扇区之间通过启区内部间隔隔开。

* 數据存取。  
磁盘是一个随机存取设备。在随机存取设备中。数据项可以被随机存取，而不需要存取放置在其前的所有其他数据。但是，在某一时间可以读取的最小的存储区域只能是一个扇区。数据块可以存储在一个或多个扇区上，而且该信息的获取
不需要通过读取磁盘上的其他信息。

* 性能。  
磁盘的性能取决于几个因素最重要的因素是角邃度、寻道时间和传送时间。角速度定义了磁盘的旋转速虞。寻道时间定义了读/写磁头寻找数据所在磁道的时闻。传送时间定义了将数据从磁盘移到CPU/内存所需要的时间。

(2) 磁带

**磁带**大小不一。最普通的一种是用厚磁膜封装的半英寸塑料磁带。磁带用两个滚轮承接起来，当转动的磁带通过读/写磁头的时候，就可以通过磁头来读写磁带上的数据。图 7展示了磁带的机械构造。

![图 7](https://img-camp.banyuan.club/online/foundation/chapter5/5-7.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 7 磁带**

* 表面结构。  
磁带的宽度可以分为9个磁道磁道上的每个点可以存储1位的信息。垂直切面的9个点可以存储8位(即1字节)的信息，还有1位用作错误检测(图 7)。

* 數据存取。  
磁带是顺序存取设备。尽管磁带的表面可能会分成若干块，但是却没有寻址装置来读取每个块。要想读取指定的块就需要按照顺序通过其前面所有的块。

* 性能。  
尽管磁带的遮度比磁盘慢，但它非常便宜。现在，入们使用磁带来存储大容量的数据。

**◇ B. 光存储设备**

**光存储设备**是一种新技术，它使用光(激光)技术来存储和读取数据。在发明了CD(光盘)后入们利用光存储技术来保存音频信息。现在，相同的技术(稍作改进)被用于存储计算机上的信息。使用这种技术的设备有只读光盘(CD-ROM)、可刻录光盘(CD-R)、可重写光盘(CD-RW)、数字多功能光盘(DVD)。

## 子系统的互连

前面的几节中已经介绍了在单个计算机上的三个子系统(CPU、主存和输入/输出)的主要特点。本节将介绍它们三者之间在内部是如何连接的，内部连接扮演着很重要的角色，因为信息需要在这三个子系统中交换。

### 1. CPU和存储器的连接

CPU和存储器之间通常由称为**总线**的三组线路连接在一起，它们分别是数据总线、地址总线和控制总线(图 12)。

![图 12](https://img-camp.banyuan.club/online/foundation/chapter5/5-12.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 12 使用三种总线连接CPU和存储器**

**1. 数据总线**

**数据总线**是由多根线组成，每一根线上每次传送1位的数据。线的数量取决于计算机的字的大小。例如，计算机的字是32位(4字节)，那么需要有32根线的数据总线，以便同一时刻能够同时传送32位的字。

**2. 地址总线**

**地址总线**允许访问存储器中的某个字，地址总线的线数取决于存储空间的大小。如果存储器容量为2<sup>n</sup>个字，那么地址总线一次需要传送n位的地址数据。因此它需要n根线。

**3. 控制总线**

**控制总线**负责在中央处理器和内存之间传送信息。例如，必须有一个代码从CPU发往内存，用于指定进行的是读操作还是写操作。控制总线的线数取决于计算机所需要的控制命令的总数。如果计算机有2<sup>m</sup>条控制命令，那么控制总线就需要有m根，因为m位可以定义2<sup>m</sup>个不同的操作。

### 2. I/O 设备的连接

输入/输出设备不能够直接与连接CPU和内存的总线相连。因为输入/输出设备的本质与CPU和内存的本质不同，输入/输出设备都是些机电、磁性或光学设备，而CPU和内存是电子设备。与CPU和内存相比，输入/输出设备的操作速度要快得多。因此必须要有中介来处理这种差异，输入/输出设备是通过一种被称为**输入/输出控制器**或接口的器件连接到总线上的。每一个输入/输出设备都有一个特定的**控制器**(图 13)。

**控制器**

控制器，或者说接口，清除了输入/输出设备与CPU及内存在本质上的障碍。控制器可以是中行或并行的设备。串行控制器则只有一根数据线连接到设备上，而并行控制器则有数根数据线连接到设各上，使得一次能同时传送多个位。

有几种控制器至今还在使用，如今最常用的有SCSI、火线、USB和HDMI。

![图 13](https://img-camp.banyuan.club/online/foundation/chapter5/5-13.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 13 I/O设备与总线的链接**

**✎ (1) SCSI**

**小型计算机系统接口**(SCSI)最初是1984年为 Macintosh 计算机而设计的。今天还有许多系统使用它。它是一个8、16或32线的并行接口。SCSI接口如图 14所示，它提供了菊花链连接，连接链的两端都必须有终结器，并且每个设备都必须要有唯一的地址(目标ID)。

![图 14](https://img-camp.banyuan.club/online/foundation/chapter5/5-14.jpg?x-oss-process=image/resize,w_650/sharpen,100)

**图 14 SCSI控制器**

**✎ (2) 火线**

IEEE标准1394规定的串行接口，俗称为**火线**。它是一种高速的串行接口，数据采用数据包的形式传送，数据的传输速度高达50 MB/s,然而对于版本最新的数据线，这个速度可以翻一倍。它可以在一条菊花链或树形连接(只用一根线)上连接多达63个设备。图 15给出了输入/输出设备和火线控制器的连接。和SCSI相比，它不需要终结器。

![图 15](https://img-camp.banyuan.club/online/foundation/chapter5/5-15.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 15 火线控制器**

**✎(3) USB**

**通用串行总线**(USB)控制器是一种可以和火线控制器相媲美的控制器。虽然术语使用了词bus，但USB是一种串行控制器，用以连接与计算机相连的一些低速和高速设备。图 16显示了USB控制器与总线间的连接和设备与控制器间的连接。

![图 16](https://img-camp.banyuan.club/online/foundation/chapter5/5-16.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 16 USB控制器**

多个设备可以被连接到一个USB控制器上，这个控制器也称为根集线器。USB-2(USB版本2.0)允许多达127个设备组成树状拓扑结构连接到一个USB控制器上，其中控制器作为树的根，**集线器**作为中间节点，设备作为末端节点。控制器(根集线器)与其他集线器的不同之处在于控制器能感知到树中其他集线器的存在，而其他集线器是被动的设备，它们只是简单地传送数据。

设备可以不需要关闭计算机很容易地被移除或连接到树中。这称为热交换。当集线器被从系统中移除时，与此集线器相连的所有设备和其他集线器也被移除。

USB使用4根线的电缆。两根线(+5V和地)被用来为像键盘和鼠标这样的低压设备提供电压。高压设备需要被连接到电源上。集线器从总线取得电压，能为低压设备提供电压。其他两根线(缠绕在一起，以减小噪声)用来传送数据、地址和控制信号。USB使用两种不同的连接头A和B.连接头A(下游连接器)是矩形的，用来连接到USB控制器或集线器。连接头B(上游连接器)是接近正方形的，用来连接到设备。最近两种新型连接器(微型A和微型B)已经被引入，用来连接小设备和笔记本。

USB-2提供三种传送速率l.5 Mbps(每秒兆位)、12 Mbps和480 Mbps。低速率可以用于低速设备，如键盘和鼠标中速率用于打印机；高速率用于大容量的存储设备。

通过USB的数据是以包的形式传输的。每个包含有地址部分(设备标识)、控制部分、要被传送到其他设备的数据部分。所有设备将接收到相同的包，但只有具有数据包中所定义的地址的那些设备将接受它。

USB 3.0是计算机连接方对通用串行总线(USB)标准的再一次修订。USB 3.0增加了一个新的叫做。SuperSpeed即(超感)的传输模式，这个模式可以将数据传输的速率提升至4.8 Gbit/s。根据承诺，USB 3.0的速率将更新至10 Gbit/s。

**✎(4) HDMI**

高清晰度多媒体接口(HDMI)是现有视频模拟标准的数字化替代品。它可以用来从一个资源向另一个兼容的计算机显示器、视频投影仪、数字电视或数字音像设备传输视频数据和数字音像数据。现有的多种HDMI标准电缆可用于传输包括标准、加强、高清晰以及3D画质的视频数据，最多可达8频道的压缩或未压缩数字音频，消费性电子控制(CEC)连接，并且可用于以太网络数据连接。

### 3. 输入/输出设备的寻址

通常CPU使用相同的总线在主存和输入/输出设备之间读写数据。唯一的不同是指令。如果指令涉及主存中的字，那么数据会在主存和CPU之间传送。如果指令涉及输入/输出设备，那么数据会在输入/输出设备和CPU之间传送。有两种方法用来对输入/输出设备进行寻址，即I/O独立寻址和I/O存储器映射寻址。

**A. I/O独立寻址**

在I/O独立寻址中，用来读/写内存的指令与用来读/写输入/输出设备的指令是完全不同的。有专门的指令完成对输入/输出设备的测试、控制以及读写操作。每个输入/输出设各有自己的地址。因为指令的不同，所以输入/输出地址可以和内存地址重叠而不会产生混淆。例如，cpu可以使用读命令Read 101来从内存中读取宇101。它也可以使用输入命令Input 101来从地址端口为101的输入/输出设备中读取数据。这里不会发生混淆，因为Read指令是规定从内存中读取数据，而Input指令则是规定从输入/输出设备中读取数据（图 17）

![图 17](https://img-camp.banyuan.club/online/foundation/chapter5/5-17.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 17 独立寻址**

**B. I/O存储器映射寻址**

在I/O存储器映射寻址方式中。cpu将输入/输出控制器中的每一个寄存器都看作内存中的某个存储字。换言之，CPU没有不同的指令用来表示是从内存或是从输入/输出设备传送数据。例如，在指令集中只有一条Read指令，如果地址指定的是内存中的某个单元。则从内存中读取数据。如果地址指定的是输入/输出设备中的某个寄存器，那么就从寄存器中读取数据。存储器映射的输入/输出的配置优点在于有一个较小的指令集，所有对内存的操作指令都同样适合于输入/输出设备，其缺点是输入/输出控制器占用了一部分内存地址。例如，假使有5个输入/输出控制器，每个控制器有4个寄存器，则共占用20个地址。相应的内存的大小就减小了20个字。图 18给出了I/O存储器映射的概念。

![图 18](https://img-camp.banyuan.club/online/foundation/chapter5/5-18.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 18 I/O存储器映射寻址**

## 程序执行

当今，通用计算机使用称为程序的一系列指令来处理数据。计算机通过执行程序，将输入数据转换成输出数据。程序和数据都放在内存中。

### 1. 机器周期

CPU利用重复的机器周期来执行程序中的指令，一步一条，从开始到结束。一个简化的周期包括3步取指令、译码和执行(图 19)。

![图 19](https://img-camp.banyuan.club/online/foundation/chapter5/5-19.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 19机器周期的步骤**

**1). 取指令**

在取指令阶段，控制单元命令系统将下一条将要执行的指令复制到CPU的指令寄存器中。被复制的指令地址保存在程序计数器中。复制完成后工程序计数器自动加1指向内存中的下一条指令。

**2). 译码**

机器周期的第二阶段是译码阶段。当指令置于指令寄存器后，该指令将由控制单元负责译码。指令译码的结果是产生一系列系统可以执行的二进制代码。

**3). 执行**

指令译码完毕后，控制单元发送任务命令到CPU的某个部件，例如。控制单元告知系统，让它从内存中加载(读)数据项，或者是CPU让算术逻辑单元将两个输入寄存器中的内容相加并将结果保存在输出寄存器。这就是执行阶段。

### 2. 输入/输出操作

计算机需要通过命令把数据从I/O设备传输到CPU和内存。因为输入/输出设备的运行速度比CPU快得多。因此CPU的操作在某种程度上必须和输入/输出设备同步。有三种方法被设计用于同步，分别为：程序控制输入/输出、中断控制输入/输出、直接存储器存取(DMA)。

**1). 程序控制输入/输出**

在**程序控制输入/输出**中，采用最简单的一种同步：CPU等待I/O设备(图 20)。

CPU和I/O设备之间的数据传输是通过程序中的指令实现的。当CPU遇到一条I/O指令时，它就停止工作直到数据传输完
毕。CPU不时地査询I/O设备的状态如果设备做好了传输准备，那么数据将被传送到CPU;如果设备没有做好传输准备，那么CPU将继续查询I/O设备的状态直到I/O设备准备好为止。这种方法存在的最大问题就是，当每一个单元数据被传输时，CPU都要浪费时间去査询I/O的状态。要注意的是，数据在输入操作后被传送到内存，在输出操作前则是从内存中取出。

![图 20](https://img-camp.banyuan.club/online/foundation/chapter5/5-20.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 20程序控制输入/输出**

**2). 中断控制箱入/输出**

在中断控制输入/输出中，首先CPU告知I/O设备即将开始传输，但是CPU并不需要不停地查询I/O设备的状态。当I/O设备准备好时，它通知(中断)CPU。在这过程中，CPU还可以及其他工作。例如，运行其他程序，从其他的I/O设备读入或传出数据（图 21）。

![图 21](https://img-camp.banyuan.club/online/foundation/chapter5/5-21.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 21中断控制输入/输出**

在这种方法中，CPU时间没有被浪费。当慢速的I/O设备正在完成一项任务时，CPU可以做其他的工作。注意像程序控制输入/输出一样，这种方法也在I/O设备和CPU之间传输数据。数据在输入操作后被传送到内存，在输出操作前则是从内存中取出。

**3). 直接存储器存取(DMA)**

第三种传输数据的方法是**直接存储器存取**(DMA)。这种方法用于在高速I/O设备间传输大量的数据块，例如磁盘、内存(不需要通过CPU的数据传输)。这种方法需要一DMA控制器来承担CPU的一些功能。DMA控制器中有寄存器，可以在内存传输前后保存数据块。图 22给出了DMA与数据、地址和控制总线的连接情况。

![图 22](https://img-camp.banyuan.club/online/foundation/chapter5/5-22.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 22 DMA和一般总线连接**

在使用这种方法进行I/O操作时，CPU发送信息给DMA。这信息包括传输类型（输入或输出）、内存单元的起始地址以及传输的字节数。之后CPU就可做其他的工作（图５－２３）。

当准备好传输数据时，则由DMA控制器通知CPU它需要获得总线的使用权。这时CPU停止使用总线并转交给DMA控制器使用。在内存和DMA间的数据传输完成后，CPU继续进行正常操作。需要注意的是，在这种方法中，CPU只是在一小段时间内是空闲的。CPU仅当在DMA和内存间传输数据时才空闲，而不是在设备为传输数据做准备时。

![图 23](https://img-camp.banyuan.club/online/foundation/chapter5/5-23.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 23 DMA输入/输出**

## 不同的体系结构

在最近几十年中，计算机的体系结构和组织经历了许多变化。本书将讨论一些与我们前面讨论的简单计算机体系结构所不同的常见的体系结构和组织。

### 1. CISC

CISC(读作[sisk]是**复杂指令集计算机**(complex instruction set computer)的缩写。CISC体系结构的设计策略是使用大量的指令，包括复杂指令。和其他设计相比，在CISC中进行程序设计要比在其他设计中容易得多，因为每一项简单或复杂的任务都有一条对应的指令工程序员不需要写一大堆指令去完成一项复杂的任务。

指令集的复杂性使得CPU和控制单元的电路非常复杂。CISC体系结构的设计者巳经提出减少这种复杂性的解决方案工程序在两个层面上运行。CPU不直接执行机器语言指令。CPU只执行被称为徵操作的简单操作。复杂指令被转化为一系列简单操作然后由CPU执行。这种执行机制需要一个被称为筏内存的特殊内存，它负责保存指令集中的每个复杂指令的一系列操作。使用微操作的程序设计被称为批程序设计。

反对CISC体系结构的一个理由便是微程序设计和存取微内存所带来的开销。然而，这种体系结构的支持者则认为这使得程序在机器层上的程序更简洁。CISC体系结构的一个例子便是英特尔公司所开发的奔腾系列处理器。

### 2. RISC

RISC(读作【risk】)是**精简指令集计算机**(reduce instruction set computer)的缩写。RISC体系结构的设计策略是使用少量的指令完成最少的简单操作。复杂指令用简单指令子集模拟。在RISC中进行程序设计比在其他设计中更难、更费时，因为复杂指令都用简单指令来模拟。

### 3. 流水线

我们巳经学过计算机对于每条指令使用取指令、译码和执行三个阶段。在早期计算机中，每条指令的这三个阶段需要中行完成。换言之，指令 n 需要在指令 n+1 开始它的阶段之前完成它的所有阶段。现代计算机使用称为流水线的技术来改善吞吐量(在单位时间内完成的指令总数)。这个理念是如果控制单元能同时执行两个或三个阶段，那么下一条指令就可以在前一条指令完成前开始。图 24a显示了三条连续的指令不使用流水线时是如何处理的，图 24b显示了通过允许属于不同指令的不同阶段的同时执行，流水线是如何能提高计算机的吞吐量的。换言之，当计算机在执行第一条指令的译码阶段时，它还能执行第二条指令的取指令阶段。第一台计算机在指定时间内平均执行9个阶段，而流水线计算机在相同的时间内能执行24个阶段。如果假定每个阶段使用相同的时间，那第一台计算机完成9/3=3条指令，而第二台计算机完成了24/3 =8条指令。因此吞吐量提高了8/3或266%。

![图 24](https://img-camp.banyuan.club/online/foundation/chapter5/5-24.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 24 流水线**

当然，流水线并不像这样简单。像当遇到转移指令时，就会出现一些问题。在这种情况下，在管道中的指令应该被丢弃。但是，新的CPU的设计巳经克服了大部分缺点，有些新的CPU设计甚至能同时进行多个取指令周期。

### 4. 并行处理

计算机传统上有单个控制单元、单个算术逻辑单元、单个内存单元。随着技术的进步和计算机硬件成本的下降，如今可以拥有具有多个控制单元、多个算术逻辑单元和多个内存单元的计算机。这个思想称为并行处理。像流水线一样，并行处理能改善吞吐量。

**并行处理**涉及多种不同的技术。并行处理的总体视图是由M.J.Flynn提出的分类法给出的。这种分类法把计算机的组织(从数据处理来看)分成4类，正如图 25所示。按照Flynn的观点，并行处理可能发生在数据流、指令流或两者都有。

**1). SISD组织**

**单指令流，单数据流**(SISD)组织表示计算机有一个控制单元、一个算术逻辑单元和一个内存单元。指令被顺序执行，每条指令可以存取数据流中的一个或多个数据项。本章前面介绍的简单计算机就是SISD组织的例子。图 26显示了SISD组织的配置概念。

![图 25](https://img-camp.banyuan.club/online/foundation/chapter5/5-25.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 25计算机组织的分类**

![图 26](https://img-camp.banyuan.club/online/foundation/chapter5/5-26.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 26 SISD组织**

**2). SIMD组织**

**单指令流，多数据流**(SIMD)组织表示计算机有一个控制单元、多个处理单元和一个内存单元。所有处理器单元从控制单元接收相同的指令，但在不同的数据项上操作。同时操作于一阵列数据的处理器阵列就是属于这一类的。图 27显示了SIMD组织的概念和实现。

![图 27](https://img-camp.banyuan.club/online/foundation/chapter5/5-27.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 27 SIMD组织**

**3). MISD组织**

**多指令流，单数据流**(MISD)体系结构是属于多个指令流的多个指令作用于相同的数据项的体系结构。图 28显示了这个概念，但它从来就未被实现。

![图 28](https://img-camp.banyuan.club/online/foundation/chapter5/5-28.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 28 MISD组织**

**4). MIMD组织**

**多指令流，多数据流**（MIMD）体系结构是属于多个指令流（每个指令作用于一个数据项）。图 29显示了概念和实现。一些专家认为MIMD组织是真正的并行处理体系结构。在这种体系结构中，可以同时执行多个任务。这个体系结构可以使用单个的共享内存或多个内存区。

并行处理有多种用途，大多用于科学团体，它们的任务如果使用传统的计算机体系结构可能需要几个小时或几天。这些例子有，大矩阵的相乘、天气预报的大量数据的同时处理或空间的飞行模拟

![图 29](https://img-camp.banyuan.club/online/foundation/chapter5/5-29.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 29 MIMD组织**



## 作业

1. 一台计算机有64MB（兆字节）的内存，每个字长为4字节。那么在存储器中对每个字寻址需要多少位?
2. 如果屏幕有24行，每行80个字符（如果系统使用ASCII码，每个ASCII字符占1字节），则需要多少字节的内存用于存储全屏的数据？
3. 假如一台计算机有16个数据寄存器(R0〜R15)，1024个字的存储空间以及16种不同的指令(如add、subtract等)，那么下面这条指令最少需要占多少位空间?
```
add M R2
```', 5, 1, NULL, '2020-05-21 18:21:33.619749', '2020-05-21 18:21:33.619749', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (81, '计算机网络和因特网', NULL, 20, NULL, NULL, '个人计算机的发展带动了商业、工业、科学和教育的巨大改变。网络也发生了类似的变革。技术的进步使得通信线路能传送更多、更快的信号。而不断发展的服务使得我们能够使用这些扩展的能力。计算机网络领域的研究导致了新技术的产生——在全球各个地方交换文本、音频和视频等数据，在任何时候快速、准确地下载或上载信息。

## 引言

虽然本章的目标是讨论因特网，一个将世界上几十亿台计算机互相连接的系统，我们对因特网的认识不应该是一个单独的网络，而是一个网络结合体，一个**互联网络**。因此，我们的旅程将从定义一个网络开始。然后我们将要展示如何通过网络连接来建造小型的互联网络。最终我们会展示因特网的结构并且在本章的余下部分开启研究因特网的大门。

### 1. 网络

**网络**是一系列可用于通信的设备相互连接构成的。在这个定义里面，一个设备可以是一台**主机**(或用另一种称呼，**端系统**)，比如一台大型计算机、台式机、便携式计算机、工作站、手机或安全系统。在这种定义中，设备也可以是一个**连接设备**，比如用来将一个网络与另一个网络相连接的**路由器**，一个将不同设备连接在一起的**交换机**，或者一个用于改变数据形式的调制解调器，等等。在一个网络中，这些设备都通过有线或无线传输媒介(比如电缆或无线信号)互相连接。当我们在家通过即插即用路由器连接两台计算机时，虽然规模很小，但已经建造了一个网络。

**1). 局域网** 

**局域网**(LAN)通常是与单个办公室、建筑或校园内的几个主机相连的私有网络。基于机构的需求，一个局域网既可以简单到某人家庭办公室中的两台个人计算机和一台打印机，也可以扩大至一个公司范围，并包括音频和视频设备。在一个局域网的每一台主机都有作为这台主机在局域网中唯一定义的一个标识和一个地址。一台主机向另一台主机发送的数据包中包括源主机和目标诸暨的地址。图 1展示了局域网的一个例子。

<center>
<img src="https://img-camp.banyuan.club/online/foundation/chapter6/6-1.png?x-oss-process=image/resize,w_700/sharpen,100" /><br/>
<strong>图 1 局域网的一个例子</strong>
</center>

**2). 广城网**

**广域网**(WAN)也是通信设备互连构成的。但是广域网与局域网之间有一些差别。局域网的大小通常是受限制的，跨越一个办公室、一座大楼或一个校园而广域网的地理跨度更大，可以横跨一个城镇、一个州、一个国家，移至横跨世界。局域网将主机互连，广域网则将交换机、路由器或调制解调器之类的连接设备互连。通常，局域网为机构私有，广域网则由通信公司创建并运营，并且租给使用它的机构。我们可以看到广域网的两种截然不同的案例，点对点广域网和交换广域网，如图 2所示。

点对点广域网是通过传输媒介(电缆或无线)连接两个通信设备的网络。图 2展示了点对点广域网的一个例子。

<center>
<img src="https://img-camp.banyuan.club/online/foundation/chapter6/6-2.png?x-oss-process=image/resize,w_700/sharpen,100" /><br/>
</center>

<center class="image-caption">图 2 点对点广域网和交换广域网</center>

交换广域网是一个有至少两个端的网络。就像我们很快就会看到的那样，交换广域网用于当今全球通信的骨干网。我们也可以这么说，交换广域网是几个点对点广域网通过开关连接产生的结合体。

**3). 互联网络**

现在很难看见独立存在的局域网或广域网，它们现在都是互相连接的。当两个或多个网络互相连接时，它们构成一个**互联网络**，或者说**网际网**。举一个例子，假设一个机构有两个办公室，并且两个办公室都通过局域网来进行办公室内所有雇员之间的通信，那么为了使不同办公室的雇员之间的通信成为可能，管理部门从电话公司之类的服务供应商那里租用了一个无需拨号的点对点广域网并且将两个局域网相连。现在这个公司就拥有了一个互联网络，或者说一个私人网际网，不同办公室之间的通信也可以实现了。图 3展示了这个互联网络。

![图 3](https://img-camp.banyuan.club/online/foundation/chapter6/6-3.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 3 一个由4个局域网和3个广域网构成的互联网络**

### 2. 因特网

正如我们之前讨论过的，一个网际网是两个或多个可以互相通信的网络。最值得注意的网际网是因特网，它由成千上万个互连的网络组成。图 4展示了因特网的一个概念图像(而非地理图像)

这幅图将因特网展示为几个骨干网、供应商网络和客户网络。在顶层，骨干网为通信公司所拥有，这些骨干网通过一些复杂的交换系统相互连接。我们把这些交换系统称为网络对等交汇点(peering point)。在第二层，有一些规模较小的网络，这些网络称为供应商网络，它们付费使用骨干网上的一些服务。这些供应商网络与骨干网相连接，有时也连接其他供应商网络。在因特网的边缘有一些真正使用基于因特网的服务的网络，这些网络是客户网络，他们向供应商网络付费来得到服务。

骨干网和供应商网络也被称为**因特网服务供应商**(ISP)，骨干网通常被称为国际因特网服务供应商，供应商网络则被称为国内或地域性因特网服务供应商。

![图 4](https://img-camp.banyuan.club/online/foundation/chapter6/6-4.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 4 当今的因特网**

### 3. 硬件和软件

我们已经展示了因特网通过连接设备将大大小小的网络互相交织在一起构成的基本结构。然而，如果仅仅将这些部分连接在一起，很明显什么都不会发生。为了产生沟通，既需要**硬件**也需要**软件**设备。这就像当进行一个复杂的计算时，我们同时需要计算机和程序。下一节将展现这些硬件和软件的组合是如何通过协议分层来互相配合的。

### 4. 协议分层

当谈论因特网时，有一个词我们总是会听见，这个词就是协议。协议定义了发送器、接收器以及所有中间设备必须遵守以保证有效地通信的规则。简单的通信可能只需要一条简单的协议，当通信变得复杂时，可能需要将任务分配到不同的协议层中，在这种情况下，我们在每一个协议层都需要一个协议，或者协议分层。

**1). 情景**

为了更好地理解协议分层的必要，首先我们开发一个简单的场景。假定Ann和Maria是有很多共同想法的邻居，她们每次都会为了一个何时退休的计划互相见面和进行沟通。突然，Ann所在的公司为她提供了一个升职的机会，但是同时要求她搬到在离Maria很远的一个城市中的分部去住。由于她们想出了一个具有创新性的计划——在退休后开始做新的生意，这两个朋友仍然想继续她们的通信并且就这个新计划交换想法。她们决定通过到邮局使用普通邮件通信来继续她们的对话，但是如果邮件被拦截了，她们不希望别人知晓她们的想法。她们在邮件的加密/解密方式上达成了一致，寄信人对邮件进行加密，这样对于入侵者而言邮件就是无法阅读的同时收信人对邮件进行解密以得到原始信件

![图 5](https://img-camp.banyuan.club/online/foundation/chapter6/6-5.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 5 一个三层协议**

让我们假设Maria将第一封邮件寄给Ann。Maria假设第三协议层机器是正在听她说话的Ann并对其说话，第三协议层的机器听她说话并且创作出明文(一封用英语写的信)，并被传送到第二层的机器，第二协议层的机器对文本进行加密，将它创作成密文，并传送到第一协议层的机器。这个第一协议层的机器，也许是一个机器人，把密文装进信封，加上发信人和收信人地址，然后将信寄出。

在Ann这边，第一协议层的机器从Ann的邮箱中取出邮件并通过发信人地址找出来自Maria的这一封。它从信封中取出密文并传递给第二协议层的机器，第二协议层的机器对密文进行解密，创作出明文并传递给第三协议层的机器，第三协议层的机器接受明文并且将它读出来，就像Maria在说话一样。

协议分层使我们可以将大任务化简成几个更小、更简单的任务。例如，在图 5中我们可以只用一台机器来完成三台机器全部的工作，但是，如果Maria和Ann觉得机器完成的现有加密或解密无法保证她们的保密，她们需要替换整个机器。她现在的情况下，她们只需要替换第二协议层的机器就足够了，另外两层可以保持不变这称为模块化。在这里模块化指的是独立的协议层。一个协议层(**模块**)可以定义为一个具有输入和输出而不需要考虑输入是如何变成输出的黒匣子。当向两台机器提供相同输入得到相同输出时，它们就可以相互替换。例如，Ann和Maria可以从两个不同的制造商那里购买第二协议层的机器，只要两台机器可以利用相同的明文创作出相同的密文，反之亦然，她们就可以完成这个工作。

协议分层的一个优势就是可以将服务和其实施分开来。每层使用更低层的服务，并向较高一层提供服务并且我们不需要考虑该层是如何实施的。例如，Maria也许因为可以自己完成第一协议层的工作而决定不买第一协议层的计算机(机器人)。只要Maria可以完成第一协议层提供的工作，这个通信系统就可以正常地双向运行。

协议层的另一个优势，虽然在简单的例子中无法看出，但是在我们讨论因特网中的协议分层时会表现出来，因为通信系统往往不仅仅具有两个端系统，还有一些只需要几个协议层而不是所有协议层的中间系统。如果我们不使用协议分层，整个系统会变得更复杂，因为那样我们得把每一个中间系统都变得和端系统一样复杂。

协议分层有什么劣势吗?也许有人会认为单一协议层可以使整个工作变简单，而且没有每个协议层都使用低一级协议层的服务并向高一级协议层提供服务的必要。例如，Ann和Maria可以自己制作能完成三项任务的机器。但是，就像之前提到的那样，一旦密码被破解，她们每一个人就得将整个机器换成新的而不是仅仅更换第二协议层。

**2). 协议分层的原则**

我们讨论一下协议分层的原则。第一条原则规定，如果我们想达到双向通信，我们需要保证每一个协议层都可以进行两个对立且方向相反的工作。例如，第三协议层的工作是去听(在一个方向上)和说(在另一个方向上)，第二协议层同时需要能够进行加密和解密工作，第一协议层需要发送和接收邮件。

在协议分层中，我们需要遵守的第二条重要原则是在两个站点中每一层的两个对象必须完全相同。例如，在两个站点中第三层的对象都应该是明文信件，而在两个站点中第二层的对象都应该是密文信件，在第一层则都是一封信。

**3). 逻辑连接**

在遵循以上两条原则之后，我们可以如图 6所示理解每个协议层之间的逻辑连接。这说明了层与层之间通信的存在。Maria和Ann可以认为她们能够发送该协议层创作的对象是基于每层的逻辑(假想的)连接。逻辑连接的概念会帮助我们更好地理解在数据通信和建立数据关系网络中遇到的分层工作。

![图 6](https://img-camp.banyuan.club/online/foundation/chapter6/6-6.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 6 同位体协议层之间的逻辑连接**

### 5. TCP/IP协议族

通过第二个场景我们了解了协议分层和协议层之间的逻辑通信，这样就可以介绍**传输控制协议/网际协议**(TCP/IP)。如今因特网中使用的协议集(一组通过不同分层进行组织的议)被称为**TCP/IP协议族**。TCP/IP协议族是一个分层协议，它由提供特定功能的交互式模块组成。分层这个术语说明每一个高层协议都基于一个或多个底层协议提供的服务。TCP/IP协议族被定义成图 7所布局的软件层。

![图 7](https://img-camp.banyuan.club/online/foundation/chapter6/6-7.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 7 TCP/IP协议族中的分层**


**1). 分层架构**

为了展示TCP/IP协议族中的分层是如何在图 7 TCP/IP协议族中的分层两台主机通信中作用的，我们假设要使用的一套东西是在一个由3个LAN(链接)构成的小网络，且链路层开关与每个LAN(链接)相连。同时我们假定这些链接都与同一个路由器相连，如图 8所示。

![图 8](https://img-camp.banyuan.club/online/foundation/chapter6/6-8.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 8 通过因特网通信**

我们假设计算机A与计算机B通信。如图 8所示，在这个通信中有5个通信设备源主机(计算机A)、链接1中的链路层开关、路由器、链接2中的链路层开关、目标主机(计算机B)。每个设备涉及的层组都由其在网络上扮演的角色所涉及的层组决定。两台主机都涉及5个协议层，同时源主机需要在**应用层**中创建消息并将其通过协议层向下发送，这样这条消息才能物理地发送至目标主机。目标主机需要在**物理层**接收通信并通过其他协议层将其发送至应用层。

路由器只涉及三个层，由于路由器仅用来**路由**，所以在路由器中没有传输层或应用层。虽然路由器总是包括在网络分层中，但是它仅仅被包括在胃个链接和物理层的组合中，这里的n指与路由器相连的链接数。因为每个链接都可能使用它自己的数据链接协议或物理协议。例如，在上面这张图中，路由器被包含在3个链接中，但是从源A发送到目标B的消息只涉及两条链接。每个链接都可能使用不同的链路层和物理层协议，所以路由器需要基于一对协议接收来自链接1的数据包，然后基于另一对协议将其数据包发送至链接2。

然而，链接中的链路层开关只涉及两个协议层数据链路层和物理层。虽然图 7中的每个开关都有两个不同的连接，但是这些连接都在同一个链接中，这些链接仅使用一组协议。这一点说明与路由器不同的是，链路层开关只涉及一个数据链路层和一个物理层。

**2). 地址和数据包名称**

在因特网中，另外两个和协议分层有关的概念很值得一提，它们是地址和数据包名称。就像我们在之前讨论过的那样，在这个模型中，我们有层组之间的逻辑通信。任何涉及两步校验的通信需要两个地址源地址和目标地址。虽然看上去我们需要5组地址，每个协议层一组，但是正常情况下我们只有4组，因为物理层不需要地址。这是由于物理层数据交换的单位是位、这使它无法得到地址。图 9展示了每一层的数据包名称和地址。

![图 9](https://img-camp.banyuan.club/online/foundation/chapter6/6-9.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 9 TCP/IP协议族中的地址和数据包名称**

如图 8所示，协议层和在该协议层使用的地址以及数据包名称之间存在联系。在应用层，我们通常使用名称来定义提供服务的站点，比如 someorg.com，或者邮箱地址，比如 somebody@coldmai.com 。在传输层，地址被称为端口号，这些端口号的作用是在源和目的之间定义应用层程序。端口号的作用是通过各程序的本地地址来辨别多个同时运行的本地程序。在网络层，这些地址在整个因特网范围下是全球化的，网络层的地址独一无二地定义了该设各与因特网的连接。链路层地址，有时称为MAC地址，是在本地定义的地址，每一个链路层地址在计算机网络(局域网(LAN)或广域网(WAN))中定义一个特定的主机或者路由器。

## 应用层

在简单讨论网络、互联网络和因特网之后，我们准备好了来进行一些有关TCP/IP协议族中每一层的讨论。我们从第5层向第1层进行讨论。

TCP/IP协议族的第5层叫做应用层。应用层向用户提供服务。通信由逻辑连接提供，也就是说，假设两个应用层通过之间假想的直接连接发送和接收消息。如图 10显示了逻辑链接背后的想法。

![图 10](https://img-camp.banyuan.club/online/foundation/chapter6/6-10.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 10 应用层的逻辑连接**

上图显示了一个场景，在这个场景中，Sky Research科研公司工作的科学家需要到一个叫做Scientific Books的在线书商那里订购一本与她的研究方向有关的书。Sky Research科研公司的计算机的应用层和Scientific Books的一台服务暴的应用层之间就产生了逻辑连接。我们把第一台主机叫做Alice，第二台主机叫做Bob。这个应用层的通信是逻辑上的而不是物理上的，也就是说，假设Alice和Bob之间有一个双向的逻辑信道来发送和接收消息，但是实际上的通信则如图 10所示通过一些设备(Alice、R2、R4、R、R7和Bob)和一些物理信道产生。

### 1. 提供服务

应用层与其他层不同的地方在于，它是协议族中的最高层。在这层中的协议不向其他协议提供服务，它们只接收在传输层的协议提供的服务。这意味着该层的协议可以轻易去除。只要新的协议可以使用传输层中任意一个协议提供的服务，这个新的协议就可以添加到应用层上。

因为应用层是唯一向因特网用户提供服务的层，应用层的灵活性使得新的协议可以很容易地添加到网络上，如前所述，这个情况在因特网的生命周期内常常出现。当因特网最初创造出来时，用户只能使用很少的应用协议，如今由于新协议的添加巳经变成常态，我们很难给出现有协议的具体数目。

### 2. 应用层模式

很清楚的一点是，当使用网络时我们需要两个应用程序彼此交互其中一个应用程序在世界上某处的一台计算机上运行，另一个在世界上某处的另一台计算机上运行。这两个程序需要通过网络基础设施互相发送消息。然而，我们还没有讨论这些程序之间应该是何种关系。两个应用程序都应能够请求和提供服务，或者这些应用程序只需要其中的一个或另一个功能?在网络的生命周期中，应用程序发展出了两种模式来解答这个问题：客户机一服务器模式和端到端模式。这里简单介绍这两种模式。

**1). 传统模式：客户机一服务器模式**

较为传统的模式叫做客户机一服务器端式。这直到几年以前还一直是最为流行的一种模式。在这种模式中，服务提供者是一个应用程序，叫做服务器进程，这个进程一直持续运转，等待另一个叫做客户端进程的应用程序通过因特网连接要求服务。通常一些服务器进程可以提供某特定种类的服务，但是向这些服务器进程请求服务的用户会很多，因此很多服务器进程需要一直运行，而客户端进程只在需要时运行。

虽然在客户机一服务器模式中的通信是在两个应用程序之进行的，但每个应用程序的角色完全不同，也就是说，我们不能把客户端程序当成服务器程序运行，反之亦然。图 11展示了一个客户机一服务器通信的例子，在这里三个客户机与同一个服务器通信以获得该服务器提供的服务。

![图 11](https://img-camp.banyuan.club/online/foundation/chapter6/6-11.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 11 客户机一服务部模式的例子**

这种模式的一个问题是通信负荷集中由服务器承担，这说明服务器必须是一台极为强大的计算机。即使是一台极为强大的计算机也可能因为大量客户在同一时间尝试连接到服务器而过戴。另外一个问题则是需要服务供应商愿意接受这个成本并为某一特定服务建造一台足够强大的服务器。也就是说，该服务必须向服务器回报相应的某种收人来鼓励这样一种安排。

一些传统服务仍然在使用这种模式，包括万维网(WWW)和它的超文本传输协议(HTTP)、文件传输协议(FTP)、安全外壳协议(SSH)、邮件服务。等等。本章后面讨论这些协议和应用。

**2). 新模式：端到端模式**

端到端模式(通常缩写为P2P模式)是一个新的模式，这种模式为了响应一些新应用的需求而形成。在这种模式中，不需要一个一直运行并等待客户端进程连接的服务器进程。这个责任是在端与端之间共享的。一台与网络相连接的计算机可以在一个时间段提供服务又在另一个时间段接收服务。一台计算机甚至可以在同一时间提供和接收服务。图 12展示了这种模式在通信时的一个例子。

![图 12](https://img-camp.banyuan.club/online/foundation/chapter6/6-12.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 12 端到端模式的例子**

这个模式完全适用的领域之一是网络电话。通过电话通信确实是一个端到端活动任何一方都没有必要一直运行来等待另一方的呼叫。端到端模式可以使用的另一个领城是当一些计算机与网络连接来互相共享一些东西的时候。例如，当一个网络用户有一个需要与其他网络用户共享的文件时，不需要将这个文件夹变成服务器并且一直运行服务端进程来等待其他用户的连接和获得这个文件。

虽然端到端模式被证明更易于扩展并且在减少对长时间运行和维护的昂贵服务器的需求上更具有成本效益，但是这也有一些挑战。最主要的挑战是安全性。和由几个专属服务器控制的服务相比，在分散的服务之间创造安全的通信更为困难。另一个挑战则是适应性，看起来似乎并不是所有的应用都可以使用这种新模式。例如，假如有一天万维网也可以通过端到端服务实现，并不是很多网络用户都可以准备好参与的。

### 3. 标准化客户机一服务器应用

在网络的生命周期中，发展出了几种客户机一服务器应用程序。不需要重新定义它们。但是需要理解这些程序的作用。

本节选择6个标准应用程序。我们从HTTP和万维网讲起，因为几乎所有的网络用户都使用它们。接着介绍具有高网络传输负荷的文件传输和电子邮件应用。然后解释远程登录以及它是如何通过使用TELNET和SSH协议做到的。最后讨论DNS,所有应用程序都使用这个来向对应的主机IP地址映射应用层标识符。

**1). 万维网和超文本传输协议**

本节将介绍万维网(缩写为WWW或者是Web)。然后讨论超文本传输协议(HTTP)，以及和网络有关的最常用的客户机一服务器应用程序。

**万维网**

Web的是具有连接分布在世界各地的文档中信息的存储库。这个存储库中叫做网页的文档分布在全世界并且相关的文档都链接在一起。Web的普及和发展与以上提到的两个术语有关分布式和链接。分布促进了Web的发展，世界上的每一个Web服务器都可以往这个存储库上添加一个新网页并且告知所有网络用户而不用担心导致个别服务器过载。链接使一个网页可以参考存储在世界上另外一个地方的服务器中的另一个网页。网页之间的链接是通过一个叫做超文本的概念达到的，这个概念的引入发生在网络到来之前。这个想法是当文档中出现到另外一个文档的链接时，用一个可以自动检索的机器检索系统中存储的另外一个文档。Web 将这个想法电子化了。当用户点击链接时，就会检索到被链接的文档。现在我们将为了描述链接的文本文档而创造的术语超文本改成了超媒体。来说明一个网页可以是文本文档、图像、音频文件或视频文件。

今天的WWW是一个分布式客户机一服务器服务，在这个服务中，客户可以通过浏览器来访问使用服务器的服务。但是，提供的服务分布在许多地方，称为站点。每个站点存储的一个或多个文档称为网页。然而，每个网页都包含到相同站点或不同站点的其他网页相连的链接。换句话说，一个网页可以很简单也可以很复杂。一个简单的网页不包含到其他网页
的链接，一个复杂的网页则拥有一个或多个到其他网页的链接。每个网页都是一个具有名称和地址的文件。

**▷ 例 1**

假设我们需要检索一个科技文献，这个文献引用了另一个文本文件和一个较大的图片。图 13展示了这瘫

![图 13](https://img-camp.banyuan.club/online/foundation/chapter6/6-13.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 13 例6.1**

主要文档和图片存储在同一站点的两个分开的文件中(文件A和文件B)，引用的文本文件存储在另一个站点(文件C)。由于需要处理3个不同文件，如果想看见整个文档需要3个事务。第一个事务(请求/响应)检索主要文档(文件A)的副本，这个副本中有第二个和第三个文件的相应引用(指针)。当检索并浏览到主要文档的副本后，用户就可以点击图片的引用并调用第二个事务，然后检索到图片的副本(文件B)。如果用户需要査看引用的文本文件的内容，她可以点击该文件的引用(指针)以调用第三个事务并且检索到文件C的副本。注意，虽然文件A帮B都存储在站点I,但它们是有着不同名称和地址的独立文件。检索它们需要调用两个事务。我们需要记得的很重要的一点是例6.1中的文件A、B和C独立的网页，它们都有独立的地址和名称。虽然文件A中包含文件B或文件C的引用，但这并不意味着这些文件无法各自独立地检索到。第二个用户可以通过一个事务检索到文件B，第三个用户可以通过一个事务检索到文件C。

**2). 客户端(浏览器)**

各种各样的供应商提供了能解释和显示网页的商用浏览器。它们几乎使用了相同的体系结构。每个浏览器通常由三部分构成控制器、客户端协议和解释器。

控制器接收来自键盘或鼠标的输入，使用客户端程序存取文档。在文档被存取之后，控制器使用一个解释器在屏幕上显示文档。客户端协议可以是稍后要描述的协议中的一种，HTTP或FTP。根据文档类型，解释器可以是HTML、Java或Javascript。一些商业浏览器包括 Internet Explorer、Netacıpe Navigator 和 Firefox。

**3). 服务器**

服务器存储网页。每当请求到达时，相应的文档会发送至客户端。

**4). 统一资源定位器(URL)**

作为文件，网页需要唯一地标识符来将它和其他网页区分开来。定义一个网页需要3个标识符主机、端口和路径。然而，在对网页进行定义之前，需要告诉浏览器我们想要使用的客户机一服务器应用程序，这个就叫做协议。这意味着我们需要4个标识符来定义网页，第一个是用来得到网页的工具种类，剩下三个的组合定义目标对象(网页)。

* 协议 为了访问网页需要的第一个标识符，是客户机一服务器程序的缩写。
* 主机 主机标识符可以是服务器的IP地址或服务器的特定名称。
* 端口 端口号通常是为客户机一服务器应用程序预定义的16位整数。
* 路径 路径标识该文件在基本的操作系统中的名字和位置。这种格式的标识符通常由操作系统决定。

在UNIX操作系统中，路径是一组目录名跟着文件名，在路径中用斜杠把目录与子目录和文件分开。

统一资源定位器(URL)是为了把这4个部分结合起来而设计的，如下所示，它用3种不同的分隔符将4个部分分开

>protocol://host/path  大多数时间用  
>protocol://host:port/path 当需要端口号时使用

**5). 超文本传输协议**

超文本传输协议(HTTP)是一个用来定义如何编写客户机一服务器程序以便于从网络中检索网页的协议。HTTP客户端发送请求，服务器返回响应。服务器使用的端口号为80，而客户机使用临时端口号。

### 4. 文件传输协议

文件传输协议(FTP)是TCP/IP提供的标准协议，用于从一台计算机复制文件到另一台计算机。虽然从一个系统到另一个系统的文件传输看起来简单直接，但有些问题必须首先处理。例如，两个系统可能使用不同的文件命名约定。两个系统也可能有不同的方式表示数据。两个系统有不同的目录结构。所有这些问题都被FTP使用非常简单优美的方法解决了。

图 14显示了FTP的基本模式。客户端有三部分组成用户接口、客户端控制进程和客户端数据传输进程。服务器端有两部分组成服务器控制进程和服务器数据传输进程。控制连接建立在控制进程间数据连接建立在数据传输进程间。

![图 14](https://img-camp.banyuan.club/online/foundation/chapter6/6-14.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 14 文件传输协议**

命令和数据的分开传输使得FTP效率更高。控制连接使用非常简单的通信规则。一次只需要传输一行命令或一行响应。另一方面，数据连接却需要更为复杂的规则，这是由于要传输的数据是多种多样的。

**两个连接的生命周期**

FTP中的两个连接有着不同的生命周期。控制连接在整个交互式FTP会话中都是保持打开的，而数据连接为每个文件传输活动打开和关闭。每次涉及使用文件传输命令时，它就打开，文件传输结東后，它就关闭。当控制连接打开时，如果需要传输多个文件，数据连接可以打开和关闭多次。

### 5. 电子邮件

电子邮件(electronic mail或E-mail)允许客户交换信息。然而这个应用的本质却与其他讨论过的应用不一样。在HTTP或FTP之类的应用中，服务器程序是一直运行的，等待客户的请求。当请求来临时，服务器提供服务。有请求就有响应。但是这个情况在电子邮件中是不一样的。首先，电子邮件被认为是一个单向事务。当Alice给Bob发邮件时，她可能期待收到回复，但是这不是一个指令。Bob可能回也可能不回。如果他确实回复了，这是另一个单向事务。第二，让Bob运行一个服务器程序并且等待直到有人向他发邮件这既不可行也不符合逻辑。Bob可能在他不使用时将计算机关闭。这意味着客户机/服务器编程应该通过另一种途径实现使用一些中间计算机(服务器)。用户只在当他们想要的时候运行客户端程序，然后中间服务器回应客户机/服务器模式，就像下一节要谈论的那样。

**体系结构**

为了解释电子邮件的体系结构，我们给出了一个常见的场景，如图 15所示。在这个常见的场景中，Alice和Bob分别是发件人和收件人，他们通过LAN或WAN与两个电子邮件服务器相连。管理员已经为每个用户创建了一个邮箱，用来存储收到的信息。邮箱是服务器硬盘的一部分，一个有权限限制的特殊文件。只有邮箱的主人可以进入它。管理员巳经创建了一个接一个发送电子邮件到互联网的队列系统。

![图 15](https://img-camp.banyuan.club/online/foundation/chapter6/6-15.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 15 常见场景**

如图 15所示，Alice发给Bob的一封简单邮件的过程需要9个不同步骤。Alice和Bob使用了三个不同的代理程序**用户代理**(UA)、**信息传送代理**(MTA)和**信息访问代理**(MAA)。当Alice需要向Bob发送信息时，她运行用户代理程序，准备信息，然后发送信息到她的邮件服务器。在Alice处的邮件服务器使用队列来存储信息，等待发送。信息需要通过网络使用MTA由Alice处传到Bob处。这里用到了两个**信息传送代理**一个客户机和一个服务器。就像网络上的其他客户机一服务器程序一样，服务器需要一直运行，因为它不知道何时会有客户要求连接。另一方面，当队列中有一个邮件将要发送时，客户机可以被系统触发。在Bob处的用户代理允许Bob阅读收到的邮件。然后Bob使用一个MAA客户端从第二服务器上运行的MAA服务器检索邮件。

Bob需要另一组客户机一服务器程序信息访问程序。这是因为MTA客户机一服务器程序是推入程序客户机将消息推入(上载)服务器。Bob需要一个拉工程序，客户机需要从服务器拉出(下栽)信息。很快我们要讨论有关MAA的更多内容。

### 6. TELNET

服务器程序可以为相应的客户机程序提供特定的服务。例如，FTP服务器使FTP用户可以在服务器上存取文件。但是不可能为我们需要的每一种服务都编写一对客户机/服务器；服务器的数量很快就会变得难处理。这个想法是不现实的。另一个解决方法是为一系列常用场景设置一个特定的客户机/服务器程序，但是使用一些一般性的客户机/服务端程序，这样的程序可以允许用户在客户端站点登录服务器端计算机，并且可以使用该计算机上可用的服务。例如，如果一个学生想在大学机房使用Java编译器程序，Java编译器客户端和编译器服务器是不必要的。这个学生只需要利用一个客户端程序登录到大学服务器，然后使用大学的编译器程序。我们把这些一般性的客户机/服务器对称为远程登录应用。

**TELNET**是终端网络(TEminaL NETwork)的缩写，是最早的远程登录协议之一。虽然TELNET要求登录名和密码，但是面对黒客行为时它是很脆弱的，因为它以明文形式(不是密文)发送所有数据，包括密码。黒客可以窃听并且得到登录名和密码。由于这个安全问题，TELNET的使用已经由于另一个协议(安全外壳协议)，的使用而减少。下一节讨论安全外壳协议。

### 7. 安全外壳

虽然现今**安全外壳**(SSH)是一个可以用作多个目的(如远程登录和文件传输)的安全应用程序，但是它在最初是为了代替TELNET而设计的。SSH有两个完全不兼容的版本SSH-1和SSH-2。第一个版本(SSH-1)现在由于其中的安全漏洞而弃用，当前版本是SSH-2。

### 8. 域名系统

我们讨论的最后一个客户机一服务器应用程序是域名系统(DNS)，这个程序是为了帮助其他应用程序设计的。为了确认一个实体，TCP/IP协议族使用唯一定义了该主机和网络之间连接的IP地址。但是，人们更愿意使用名字而不是数字化的地址。因此，网络需要有一个可以将名称映射到地址的目录系统。这个和电话网络是相似的。电话网络为了使用电话
号码而非姓名而设计。人们可以保存一份私人文件来将名字映射到相应电话号码，也可以直接通过电话簿来打电话。

由于如今的网络如此巨大，一个中央目录系统无法承担所有的映射工作。除此之外，如果中央计算机出故障了，那么整个通信网络就会瘫痪。更好的解决方法是将信息分布到世界上的很多台计算机上。通过这个方法，需要进行映射的计算机可以与掌握必要信息的最近的一台计算机联系。图 16展示了TCP/IP协议族如何利用一个域名系统客户端和一个域名系统服务器来将一个名称映射到～个地址上。用户想通过使用文件传输客户端访问远程主机上运行的相应文件传输服务器。用户只知道文件传输服务器的名字，比如 afilesource.com 。但是TCP/IP协议族需要文件传输服务器的IP地址来进行连接。下面6个步骤将主机名映射到IP地址上：

![图 16](https://img-camp.banyuan.club/online/foundation/chapter6/6-16.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 16 DNS的目的**

1) 用户将主机名传递给文件传输客户端。  
2) 文件传输客户端将主机名传递给域名系统客户端。  
3) 每台计算机在启动之后得知一台域名系统服务器的地址。域名系统客户端发送消息和查询给域名系统服务器，查询利用已知的域名系统服务器的序地址命名文件传输服务器。  
4) 域名系统服务器给出需要的文件传输服务器的IP地址。  
5) 城名系统客户端将IP地址传输给文件传输服务器。  
6) 文件传输客户端现在使用得到的IP地址访问文件传输服务器。  

**1). 命名空间**

确切地说，给一个机器指定的名称必须从一个对于名称和毌地址之间绑定有完全控制权的命名空间中选择。换句话说，因为地址唯一，所以名称也应当是唯一的。**命名空间**可以把每一个地址映射到一个唯一的名称上，这些名称通常按照分层进行组织。在一个分层的命名空间内，每个名字由几部分组成。第一部分定义组织的本质，第二部分定义组织的名称，第三部分定义组织中的部门，等等。在这里，命名空间的分配和控制权可以是分散的。中心机构可以分配一部分名称，这些名称对组织的本质和名称进行定义。名称剩下部分的职责则由组织本身给出。组织可以通过向名称添加后缀(或前缀)来定义它的主机或资源。组织在进行管理时不需要因为它为主机选择的前缀为另一组织使用而担心，因为即使一部分主机地址相同，整个主机地址是不一样的。例如，假设两个组织都把他们各自的一台计算机称为caesar。中心机构给第一个组织的名称，比如是 first.com，给第二个组织的名称则是 second.com 当两个组织都把名称caesar添加到他们巳经被指定的名称上时，最终结果是两个不同的名称 caesar.first.com 和 caesar.second.com。名称是唯一的。

**2). 网络中的域名系统**

DNS是一个可用于不同平台的协议。在网络中，域名空间(树)最初分为三个不同部分一般城、国家域和反相城。然而，由于网络的快速发展，跟踪反相城变得极为困难，这里反相域的作用是在设置IP地址时找到该主机的名称。反相域现在巳经不再使用(见RFC 3425)，因此我们的注意力集中在前两个。

**(1) 一般域**

**一般域**根据注册主机的一般行为对它们进行定义。树上的每一个节点定义一个城，这些节点是域名空间数据库的索引(见图 17)。通过这个树，我们可以看到在一般域部分的第一层允许14个可能的标签。这些标签描述了表 1中陈列的组织类型。

![图 17](https://img-camp.banyuan.club/online/foundation/chapter6/6-17.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 17 一般域**

**表 1 一般域标签**

|标签  | 描述| 标签 |描述 |
|:---:|:---:|:---:|:---:|
|aero|航线与航空天工业|int|国际组织|
|biz  |公司或企业|mil  |军事团体|
| com |商业机构|museum|博物馆 |
| coop|合作组织|name|个人/个体姓名|
|edu  |教育机构|net|网络提供商|
|  gov|政府机构|org|非营利组织|
| info|信息服务提供商|pro|专业机构|

**(2) 国家域**

**国家域**部分使用两个字符组成的国根层家缩写(例如，usa作为United States缩写)。第二个标签可以是编制的，也可以是更特定的国别称号。例如，美国用州的缩写作为国别缩写us的细分(例如，ca.us)。图 18展示了国家域的部分。地址 uci.ca.us 可以翻译为美国加利福尼亚州的加州大学欧文分校。

![图 18](https://img-camp.banyuan.club/online/foundation/chapter6/6-18.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 18 国家域**

### 9. 端到端模式

本章前面讨论了客户机一服务器模式。端到端文件共享的第一个范例可以追溯到1987年12月，当韦恩·贝尔创造了WWIV网，WWIV(第四次世界大战)公告栏软件的网络组件。1999年7月，伊恩·克拉克设计了新飞网(Freenet)，一个分散且抗审查的分布式数据存储，旨在通过一个端到端网络为言论自由提供具有匿名性的强有力的保障。

端到端随着肖恩·范宁创造的一个Napster(1999-2001)的在线音乐文件分享服务逐渐受到欢迎。虽然用户自由复制和传播音乐文件的行为引起了对Napster的一个侵权诉讼并且导致了该服务的关闭，但它为后来的端到端文件分布模型奠定了基础。Gnutella首次于2000年3月发布。·紧随其后，(Kazza使用的)快道协议(FastTrack)、BT下载(BitTorrent)、WinMX和吉牛网(GNUnet)也各自在2001年3月、4月、5月和11月相继发布。

准备好共享他们资源的网络用户成为同位体并逐渐构成网络。当网络中的一个同位体有可共享的文件(例如，一个音频或视频文件)时，这个文件对于其他同位体而言是可获得的。感兴趣的同位体可以与存储该文件的计算机连接并下栽这个文件。在一个同位体下载这个文件之后，这个文件可用于其他同位体的下载。随着更多同位体加入和下载该文件，这个文件的更多副本就会提供到组中。由于同位体列表可能增长也可能收缩，因此问题是该模式应当如何跟踪忠实的同位体和文件位置。为了回答这个问题，我们需要把端到端(P2P)模式分成两类集中的和分散的。

**1). 集中网络**

在一个集中的端到端网络中，目录系统列出同位体和它们提供了什么以使用客户机一服务器模式，但是文件的存储和下载都使用端到端模式完成。由于这个原因，集中P2P网络有时也被称为混合P2P网络。Napster就是一个集中P2P的例子。在这种网络中，一个同位体先通过一个中央服务器注册，然后同位体提供它的IP地址和它准备共享的文件列表。为
了防止系统崩溃，Napster为了这个目的使用了多个服务器，虽然只在图 18中展示了一个。

为了寻找一个特定文件，同位体向主服务器发送一个査询要求。服务器在它的目录中搜索并给出存有该文件副本的节点的IP地址。同位体连接这些节点之一并下载文件。随着节点加入和离开同位体，这个目录一直在更新。

集中网络使目录的维护得到简化但是也造成一些障碍。访间目录可能产生巨大的流量并使系统变慢。这些中心服务器很容易受到攻击。如果它们全都出现故障，整个系统就会停机。因此Napster的中心组件最终要为其版权败诉以及最终在2001年7月关闭负责。New Napster由罗西欧(Roxio)于2003年带回，Napster 2现在是一个合法的付费音乐网址。

**2). 分散网络**

分散P2P网络不依赖于集中目录系统。在这个模型中，同位体组织形成一个在物理网络之上的逻辑网络，称为重叠网络。基于重叠网络中节点之间的连接方式，分散P2P网络分成结构化的和未结构化的两大类。

在一个未结构化的P2P网络中，节点随机地连在一起。在未结构化的P2P中进行搜索不是很有效，因为寻找一个文件的查询涌入网络并造成巨大的流量，即使这样这个查询请求也不一定得到解决。这种网络的两个例子是吉牛网(Gnutella)和新飞网(Freenet)。我们下面将把吉牛网作为一个案例。

结构化的网络使用一组预设的规则来链接节点，这样一个查询就可以有效且高效地解决。为了达到这个目的，最常用的技术是分布式散列表(DHT)。很多应用都使用了DHT，包括分布式数据结构(DDS)、内容分布式系统(CDS)、域名系统(DNS)和P2P文件共享。一个使用DHT的常用P2P文件共享协议是BT下戴。我们将在下一节中把DHT作为一个既可以在结构化P2P网络也可以在其他系统中使用的技术单独讨论。

## 传输层

TCP/IP协议族中的**传输层**位于应用层和网络层之间，它从网络层接收服务并且为应用层提供服务。传输层作为一个客户程序和服务器程序之间的联络，是一个过程间连接。传输层是TCP/IP协议族的核心部分，它是一个在网络中从一点向另一点进行数据传输的端与端之间逻辑媒介。图 19展示了逻辑连接的思想。

这幅图展示的场景和我们用在应用层的是相同的。Aıice在Sky Research科研公司的主机和Bob在Scientific Books公司的主机在传输层建立了一个逻辑连接。这两个公司在计算机传输层通信，就像在它们之间有一个真正的连接一样。图 19显示只有两个端系统（Alice的和Bob的计算机）在使用传输层服务，所有的中间路由器都只使用了前三层。

### 1. 传输层服务

本节讨论传输层可以提供的服务，下一节讨论几种传输层协议。

**1). 进程间通信**

传输层的第一个义务是提供**进程间通信**。一个进程是使用传输层服务的应用层实体(运行中的程序)。

网络层(在下一节介绍)负责在计算机层面的通信(主机间通信)。网络层协议只能将信息传输到目的计算机。然而，这是一个不完整的传递，这个消息仍然需要被传递给正确的

![图 19](https://img-camp.banyuan.club/online/foundation/chapter6/6-19.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 19 传输层的逻辑连接**

进程。这就是传输层协议的工作，它的责任是将消息送相应的进程。图 20显示了网络层和传输层的域。

![图 20](https://img-camp.banyuan.club/online/foundation/chapter6/6-20.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 20网络层与传输层**

**2). 地址端口号**

虽然有几种办法来完成进程间通信，图 20网络层与传输层但最常用的还是通过客户机一服务器模式(之前介绍过)。在主机上的进程叫做客户程序，客户程序需要来自通常运行在远程主机上的进程提供的服务，这个运行在远程主机上的进程叫做服务器忙序。这两个进程(客户和服务器程序)有着相同的名称。例如，为了从一个远程机器上得到日期和时间，我们需要一个daytime客户程序进程在本地主机上运行和一个daytime服务器程序在远程机器上运行。一个远程计算机可以同时运行多个服务器程序，就像一个或多个客户程序可以同时在多个本地计算机上运行一样。为了通信，我们必须定义本地主机、本地进程、远程主机和远程进程。本地主机和远程主机用IP地址进行定义(在下一节讨论)。为了定义这些进程，我们需要第二个标识符。称为端口号。在TCP/IP协议族中，端口号是0和65 535(16位)之间的整数。

用来定义客户程序的端口号叫做临时端口号。临时这个词的意思是短命的，用在这里是因为客户程序的使用寿命通常很短。临时端口号建议使用大于1023的数，这样一些客户/服务器程序才能正常运行。服务器程序也必须定义一个端口号。然而，这个端口号不可以随机选择。TCP/IP协议族已经决定给服务器使用通用端口号，这些端口号被称为知名端口号。每一个客户进程知道相应服务器进程的知名端口号。例如，当前面谈到的daytime客户进程用临时端口号52000来标识自己，daytime服务器进程必须使用知名端口号13。图 21展示了这个概念。

![图 21](https://img-camp.banyuan.club/online/foundation/chapter6/6-21.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 21 端口号**

### 2. 传输层协议

虽然因特网使用了一些传输层协议，但在本书我们只讨论两种UDP(用户数据报协议)和TCP(传输控制协议)。

**1). 用户数据报协议**

**用户数据报协议**(UDP)是不可靠的无连接传输协议。它除了提供进程间通信而不是主机间通信以外，没有向网络层服务添加任何东西。如果UDP这么无能为力、为什么一个进程会想要使用它呢?这个缺点的同时也是它的优点。UDP是一个极简单同时开销最少的协议。如果一个进程想要发送一条短的消息且不关心可靠性，那么就可以使用UDP。通过UDP发送一条短的消息比用TCP发送造成的发送者和接收者之间的互动要少得多。

**用户数据报**

UDP数据包，也叫做用户数据报，有一个固定大小为8字节的头。图 22展示了用户数据报的格式。然而，由于UDP用户数据报是存储在总长度为65 535字节的**IP数据报**中的，所以其整体长度会比较短。

![图 22](https://img-camp.banyuan.club/online/foundation/chapter6/6-22.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 22 用户数据报的数据包格式**

**2). 传输控制协议**

**传输控制协议(TCP)** 是一个面向连接的可靠协议。它明确地定义了连接设施、数据传输和连接拆卸段以提供面向连接的服务。这里面向连接的服务指的是在(来自应用层的)同一消息中的所有数据包(段)之间有连接(关联)。TCP使用序列号来定义段的顺序。序列号与每一段的字节数有关。比如在一个6000字节的消息中，第一段的序列号是0,第二段的序列号是2000，第三段的序列号是4000(实际过程更复杂，我们尝试对其进行了简化)。这祥，如果一段丢失了，接收者会持有另外两段直到发送者重置丢失的那段。

**段**

在传输层，TCP将一些字节组合成一个叫做段的数据包。TCP在每一段之前加上一个头(目的是方便控制)，并且将这些段发送至网络层进行传输。这些段都封装在IP数据报里如图 23所示进行传输。

![图 23](https://img-camp.banyuan.club/online/foundation/chapter6/6-23.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 23 TCP 段**

## 网络层

TCP/IP协议族中的**网络层**负责源到目的地(计算机到计算机或主机到主机)的消息发送。图 24展示了假设Alice和Bob的计算机只有一条路径相连时，他们在网络层的通信。上边两节使用同样的场景分别介绍了应用层和传输层的通信。

如图 24所示，源主机、目标主机和路径中的所有路由器(R2、R4、R5和R7)都涉及网络层。在源主机(Alice)处，网络层从传输层接收了一个数据包，它将数据包封装在一个数据报中，并且发送至数据链路层。在目标主机(Bob)处，这个**数据报**就被解除封装，取出数据包并发送至相应的传输层。虽然TCP/IP协议族的全部5层之中都涉及了源主机和目的主机，如果只为数据包规定路线，那么路由器只用到三层。然而，他们为了进行控制会需要传输层和应用层。路径中的路由器通常与两个数据链路层和两个物理层同时展示，因为它从一个网络接收数据包，然后将该数据包传递至另一网络。

![图 24](https://img-camp.banyuan.club/online/foundation/chapter6/6-24.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 24 网络层通信**

### 1. 网络层提供的服务

网络层在传输层的下面，这就意味着网络层要向传输层提供服务。我们将在下面讨论这个服务的几个方面。

**1). 打包**

网络层的第一个义务就是定义打包在源主机的网络层数据包中封装有效负荷(从上一层接收的数据)，并且从来自目的主机网络层的数据包中解封装有效负荷。换句话说，网络层的一个责任是将有效负荷不加改动或利用地从源送到目的地。网络层的服务就是一个邮局式的传递者，它负责将数据包从发送者送至接收者，同时保证数据包的内容不被改变或使用用。如图 25所示，这通过三个步骤完成。

![图 25](https://img-camp.banyuan.club/online/foundation/chapter6/6-25.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 25 在网络层打包**

(1) 源网络层协议从传输层协议接收数据包，添加包含源地址和目标地址以及其他网络层协议所需信息的头。   
(2) 网络层协议在逻辑上将该数据包传递至目标处的网络层协议。    
(3) 目标主机接收网络层数据包，解除有效负荷的封装并将其传输至上一层协议。  

如果在源主机或在路径中的路由器处时数据包为碎片状，网络层有责任等待直到所有碎片到达，对它们重新组合并发送至上层协议。

>**传输层的有效负荷可以封装在几个网络层数据包中。**

**2). 数据包传递**

网络层的数据包传递是无连接且不可靠的。接下来我们简单讨论这两个概念。

(1) 不可靠传递

在网络层传递的数据包是不可靠的，这意味着这些数据包可能毁损、丢失或者重复。换句话说，网络层提供的是尽力而为的传输，但是它不能保证这个数据包如我们所期待的那样到达目的地。这个服务和我们在邮局寄一封平信时所使用的是一样的。不管是邮局还是网络层，这个都可以通过成本来进行解释。如果我们需要邮局提供保证，成本会更大一些(比如挂号信)。如果我们希望网络层提供保证，这个数据包的传递就会被延迟。在每个路由器和目的地处的每个数据包都需要进行检查，如果出现毁损情况则需要重新发送。检查丢失的数据包甚至成本更大。是否这样就意味着我们通过网络传送的消息就是不可靠的呢?答案是。我们要通过使用传输层协议中的TCP协议才能保证消息没有毁损。如果在传输层的一个有效负荷(由于数据链路层的不可靠传递)毁损了，TCP会丢弃这个数据包并且要求重新发送。这个在前一节提到过了。

(2) 无连接传递

网络层的传递也是无连接的。但是这里的无连接不是说发送者和接收者之间没有物理连接，而是说网络层对每个数据包的处理是单独的(就像邮局对待信件的那种方式)。换句话说，属于相同传输层有效负荷的数据包之间是没有联系的。如果一个传输层数据包由4个网络层数据包构成，那么无法保证这4个数据包到达的顺序与它们发送的顺序相同；这是由于每个数据包都可能依照不同的路径到达目的地。图 26展示了这个问题的原因。

![图 26](https://img-camp.banyuan.club/online/foundation/chapter6/6-26.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 26 不同的数据包传递路径**

一个传输层数据包分成了4个网络层数据包，它们按顺序发出(1, 2, 3, 4)，但是收到时它们的顺序是乱的(2, 4, 3, 1)。目的地的传输层负责等待和接收所有数据包再将它们组合在一起并传送至应用层。

**3. 路由**

网络层有一个和其他层一样重要的职责就是路由。网络层为将数据包从它的源传送到目的地而负责。物理网络是网络WLAN和WAN)和连接这些网络的路由器的集合，这意味着从源到目的地有不止一条路线。网络层的责任是在这些可能的路线中找到最优路线，它需要有一些特定的策略来定义最优路线。在现在的网络中，，这个得通过在数据包到达时运行一些路由协议来帮助多个路由器协调它们对于周边的知识并且提出一致的路由表来实现。

### 2. 网络层协议

虽然在网络层有很多协议，但最主要的协议叫做**网际协议**(IP)。其他协议都是辅助协议，帮助IP完成它的职责。如今有两类网络协议正在投入使用IPv4和IPv6。我们将在下面分别讨论。

**1). 第4版网际协议（IPv4）**

现在大多数系统都使用第4版网际协议(IPv4)，但是这将在未来改变，因为该协议的地址空间和数据包格式较小(以及其他原因)。

(1) IPv4地址

在TCP/IP协议族的Ipv4层中用来标记每个设备和互联网之间的连接的标识符叫做网络地址或IP地址。IPv4地址是一种32位的地址，这种地址唯一但又通用地定义了主机或路由器与网络之间的连接。IP地址是连接的地址而非主机或路由器的地址，因为如果这个设备移动到了另外一个网络中，它的IP地址可能会改变。IPv4地址是独一无二的，因为每个地址定义一个且只有一个与网络之间的连接。如果一个设备(例如路由器)有多个网络连接，那么它就有多个IPv4地址。IPv4地址也是通用的，因为这个地址系统必须被所有想要连接到网络的主机接收。

有三种较普遍的表示法来表现一个IPv4地址二进制表示法(以2为底)、带点的十进制表示法(以256为底)和十六进制表示法(以16为底)。在二进制表示法中，IPv4地址展示为32位。为了使地址更便于阅读，每8位之间会添加一个到两个空格。每8位一般被看作一个字节为了使IPv4地址更紧凑易读，它通常写成十进制的形式，不同字节利用小数点分开。这个格式被称为带点的十进制表示法。注意，由于每个字节(8位)只有8位，因此在带点的十进制表示法中每个数字都在0～255之间。我们有时候把IPv4地址用十六进制表示。每个十六进制与二进制表示法中的4位等同，这意味着一个32位的地址由八个十六进制数字构成。这种十六进制表示法通常用于网络编程。图 27展示了用讨论的三种方式表示同一个IP地址。

![图 27](https://img-camp.banyuan.club/online/foundation/chapter6/6-27.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 27 地址表示**

在任何涉及传递的通信系统网络中，如电话网络或邮政网络，地址系统都是分级的。在邮政网络中，地址(通信地址)包括国家、州(或省)、城镇、街道、门牌号和邮件收件人姓名。同样，电话号码也分成国家代码、地区代码、本地交换和连接。

32位的IPv4地址也是分级的，但是只分成两个部分。地址的第一部分叫做前缀，定义网络地址的第二部分叫做后缀，定义节点(设备和网络的连接)。图 28展示了一个32位IPv4地址的前缀和后缀。前缀的长度是n位，后缀的长度就是(32-n)位。前缀和后缀的长度取决于网络(组织)的站点。

![图 28](https://img-camp.banyuan.club/online/foundation/chapter6/6-28.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 28 IPv4地址中的分层**

(2) IPv4数据报

IP使用的数据包叫做数据报。图 29展示了IPv4数据报的格式。数据报是一种长度不一的数据包，这种数据包包括两部分头和有效负荷(数据)。头的长度是20～60字节，并且他包含路由和传递时必要的信息。注意，一个字节是8位。

![图 29](https://img-camp.banyuan.club/online/foundation/chapter6/6-29.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 29 IPv4数据报**

**2). 第6版网际协议(IPv6)**

IPv4的一些地址耗尽之类的缺点促进了20世纪90年代早期IP协议的一种新版本的出现。新版本叫做第6版网际协议(IPv6)或新一代IP(IPng)的版本是一个在扩大IPv4的地址空间的同时重新设计IP数据包的格式并修改一些辅助性协议的计划。有趣的是，IPv5是一个从未实现过的计划。下面展示了IPv6协议中的主要改变。

(1) IPv6地址

为了防止地址耗尽，IPv6使用128位来定义任何连接到网络的设备。地址显示为二进制的或冒号十六进制的格式。第一个格式用来在计算机中存储地址，第二个格式是供人们使用的。图 30展示了这两种格式。

![图 30](https://img-camp.banyuan.club/online/foundation/chapter6/6-30.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 30 IPv6地址表示**

如图 31所示，IPv6中的地址事实上定义了三个等级：站点（组织）、子网和到主机的连接。

![图 31](https://img-camp.banyuan.club/online/foundation/chapter6/6-31.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 31 IPv6地址中的分层**


(2) IPv6数据报/IPv4数据报

图 32显示了IPv6数据报的格式。在这个版本下的数据报也是包括头和有效负荷(数据)两部分的长度可变的数据包。头的长度是40字节，然而，在这个版本中，一些扩展头有时也被认为是有效载荷的一部分。

![图 32](https://img-camp.banyuan.club/online/foundation/chapter6/6-32.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 32 IPv6数据报**

## 数据链路层

TCP/IP协议族没有定义**数据链路层**中的任何协议。这层是网络中连接起来后可以构成因特网的区域。这些网络，有线或者无线，都接收服务并将服务提供给网络层。这正可以为我们提供当今市场上有几种标准协议的线索。

在前几节中，我们学到了在网络层的通信是主机间的。然而，因特网是通过连接设备(路由器或者开关)胶合在一起的网络的组合体。如果一个数据报是从一台主机传输到另外一台主机，它需要通过这些网络传递。

图 33使用了和前三节相同的场景，显示了Alice和Bob之间的通信。然而，数据链路层的通信由多至5个分开的逻辑连接组成，这些逻辑连接在路径中的数据链路层之间。

![图 33](https://img-camp.banyuan.club/online/foundation/chapter6/6-33.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 33 数据链路层的通信**

在源和目标处只包括一个数据链路层，但在每个路由器处都有两个数据链路层。造成这个的原因是Alice的和Bob的计算机都各自与一个单独的网络相连，然而每个路由器都从一个网络中得到输入并将输出发送至另一个网络。

### 1. 节点和链接

虽然应用层、传输层和网络层的通信都是端到端的，但数据链路层的通信是节点对节点的。网络中一点的数据单元需要穿过很多网络(LAN和WAN)才能到达另外一点。这些LAN和WAN都是通过路由器连在一起的。传统上会将两个端主机和路由器看作节点，它们之间的网络看作链接。图 34是当数据单元的路径只有6个节点时链接和节点的展示。

![图 34](https://img-camp.banyuan.club/online/foundation/chapter6/6-34.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 34 节点和链接**

连接节点的链接不是LAN就是WAN。

### 2. 局域网

在本章的开头我们就已经知道了局域网(LAN)是为有限的地理区域(如一个建筑或校园)而设计的计算机网络。虽然局域网可以用作为了共享资源的单一目的而连接组织内各计算机的孤立网络，但现在大多数的LAN也链接到广域网(WAN)或因特网上。

局域网可以是有线或无线网络。在第一组，LAN中的工作站之间通过有线连接，第二组中的工作站之间在逻辑上通过无线连接。我们将分别讨论两组。

**1). 有线LAN：以太网**

虽然在过去就已经发明了几种有线LAN,但只有一种幸存了下来——以太网。可能这就是以太网根据因特网社区的需要升级了很多次的原因吧。

以太网LAN是由罗伯特·梅特卡夫和大卫·博格斯在20世纪70年代开发的。在这之后，它的发展经历了四代：标准以太网(10 Mbps)、快速以太网(100 Mbps)、千兆以太网(1 Gbps)和万兆以太网(10 Gbps)。数据速率，也就是每秒传输的位数，在每一代都增加了10倍。

(1) 标准以太网

我们把最初数据速率为10 Mbps(每秒一千万位)的以太网技术认为是标准以太网。在这种情况下，数据可以从工作站传输至LAN的速度被定义为数据速率。在以太网中，速度是每秒一千万位。然而。这些位不是一个接着一个发送的，每组数据都被打包起来并称为帧。帧中不仅包括从发送者到目标的数据，还带有一些诸如源地址(48位)、目的地地址(48位)、数据类型、实际数据的信息和一些其他作为守卫来帮助检查传输中数据完整性的控制位。如果我们把一帧看作是一个装着发信人寄给收信人的信的信封，数据在信封内，而其他这些诸如地址之类的信息都在信封上。在LAN中，数据包都封装在数据帧中。图 35展示了一个以太网LAN和帧格式。

![图 35](https://img-camp.banyuan.club/online/foundation/chapter6/6-35.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 35 以太网帧**

(2) 快速以太网(100 Mbps)

20世纪90年代，以太网通过把**传输速率**提升至100 Mbps跨越了一大步，这个新一代的以太网被称为快速以太网。快速以太网的设计者需要使快速以太网能够与标准以太网竟争，所以大部分的协议像地址、帧格式都没有变。由于传输速率的提高，标准以太网的一些基于传输速率的特征需要重新修订。

(3) 千兆以太网

对更高的数据速率的需求促使了千兆以太网协议(1000 MIbps)的设计。万兆以太网的目标是将数据速率升级至1 Gbps，但是保持地址长度、帧格式以及最大和最小数据帧长度不变。

(4) 万兆以太网

近年来，以太网又开始被考虑放在城市范围内使用。这个想法是扩展以太网的技术、数据速率和覆盖距离，这样以太网就可以用做LAN和MAN(城域网)。设计万兆以太网的目标可以总结为升级数据速率至10 Gbps，保持数据帧大小和格式不变，同时允许LAN、MAN和WAN可能的互连。这个数据速率只有此时的光纤技术可以达到。

**2). 无线LAN**

无线通信是增长最快的技术之一。世界各地对无线连接设备的需求都在不断增长。无线LAN可在大学校园、办公楼和其他很多公共区域找到。在有线LAN和无线LAN之间我们可以看见的第一个不同之处就是传输媒介。在有线LAN中，使用电缆来连接主机。在无线LAN中，传输媒介是空气，信号通常是在空气中传播的。当无线LAN中的主机互相通信时，它们在共享同样的媒介(多发访问)。在这个领域现在有两种技术无线以太网和蓝牙。

(1) 无线以太网

电气和电子工程师协会(IEEE)为无线LAN定义的规格，有时也被称为无线以太网或者WIFI(wireless fidelity的缩写)。然而，WIFI其实是一个由WIFI联盟(一个拥有超过300个成员公司的国际非盈利行业协会)认证的无线LAN.这个标准定义了两种服务，基本服务集(BSS)和扩展服务集(ESS)。第二个服务使用额外设备(接入点或AP）作为连接其他LAN或WAN的开关。图 36显示了这两个服务。

![图 36](https://img-camp.banyuan.club/online/foundation/chapter6/6-36.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 36 BSS和ESS**

(2) 蓝牙

蓝牙是一种无线LAN技术，它用于连接不同功能的设备，如电话、笔记本电脑、计算机(台式机以及笔记本电脑)、照相机、打印机，荏至是咖啡机之类的设备，只要这些设备之间的距离比较短。蓝牙LAN是一个临时网络，这也就意味这这个网络是自发的，这些有时候称为小配件的设备互相连接之后可以形成一个叫做蓝牙微网的网络。如果其中一个小设备有连入因特网的功能，则蓝牙LAN就可以连入因特网。蓝牙LAN由于本身特性决定规模较小。如果有很多小配件想要连入蓝牙LAN中，通常会引起混乱。

蓝牙技术有很多应用。无线鼠标和无线1建盘之类的外围设备可以通过这个技术与计算机通信。在一个小的保健中心里，监控设备可以通过这种方法和感应设备通信。家庭安全装置可以利用这个技术来将不同的传感器连接到主要的安全控制器上。与会者可以在参与会议时同步他们的笔记本电脑。

蓝牙技术最初是爱立信公司开启的一个项目，他的命名来自于统一了丹麦和挪威的丹麦国王Harald Blaatand(940一981)，这里的Blaatand英译为Bluetooth，也就是蓝牙。

### 3. 广域网

如前所述，因特网中连接两个节点的可能是LAN也可能是WAN。与LAN情况一样，WAN也可以分成有线和无线两类。下面将简要地分别讨论。

**1). 有线WAN**

当今的以太网中有很多种有线WAN，有些是点对点的，有些是交换式WAN。

(1) 点对点无线WAN

现在我们可以用几种点对点无线网来为连接到网络的居民和企业提供所谓的网络末端服务。

(2) 拨号上网服务

拨号网络或连接使用电话网络提供的服务来传输数据。电话网络起源于19世纪第一个十年晚期，整个网络最初是一个声音传输系统。随着计算机时代的到来，这个网络在20世纪80年代开始在传输声音的同时传输数据。在最后一个十年里，电话网络经历了很多技术上的改变。对于数字化数据通信的需求导致了投号调制解调器的发明。

调制解调器这个词是一个组合词，它指构成这个设备的两个功能性实体信号调制器和信号解调器。调制器通过数据制造信号，解调器从调制信号中恢复数据。图 37显示了调制解调器的思想。

![图 37](https://img-camp.banyuan.club/online/foundation/chapter6/6-37.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 37 提供因特网连接的拨号网络**


(3) 数字用户线路(DSL)

在传统调制解调器达到它们的最高数据速率之后，电话公司开发出了另一种技术——DSL,来提供高速网络连接。**数据用户线路**(DSL)技术是现有的电话上支持高速通信中最有前途的一种。DSL技术是一系列通过不同的首字母区分的技术(ADSL、VDSL、HDSL和SDSL)。这个系列通常用xDSL表示，这里的x可以用A、V、H或S来表示。我们只讨论ADSL。这个系列中的第一个技术是非对称数字用户线路(ASDL)。ASDL在下游方向(从网络到居民)比在上游方向(从居民到网络)提供更快的速度(比特率)。这也是为什么它被称为非对称的(见图 38)。

![图 38](https://img-camp.banyuan.club/online/foundation/chapter6/6-38.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 38 ASDL点对点网络**

ADSL允许用户同时使用语音频道和数据频道。上游速率可以达到1.44 Mbps。然而，由于该频道中的高级别的嗓音，数据速率通常低于500 kbps。下游的数据速率可以达到13.4 Mbps。然而，由于该频道中的嗓音，数据速率通常低于8 Mbps。很有意思的一点是，这种情况下电话公司充当ISP,所以电子邮件或网络连接之类的服务都由电话公司自身提供。

(4) 有线电视网络

有线电视网络最初是为了那些由于山脉等自然障碍造成无法接收数据的用户提供电视节目而创造的。后来有线电视网络在那些仅仅希望得到更好的信号的人中受到欢迎。除此之外，有线电视网络使通过微波连接来使用远程广播电台成为可能。有线电视也通过使用一些最初为视频而设计的信道在网络接入规定中寻找到很好的市场。

电缆公司现在正在和电话公司竞争想要得到高速数据传输的住宅客户。DSL技术越过本地回环为住宅用户提供高数据速率的连接。然而。DSL使用的现成的非屏蔽式双绞线电缆很容易受到干扰。这使数据速率受到了上限的限制。一种解决策略就是使用有线电视网络。本节简单讨论了这个技术。图 39展示了该服务的一个例子。

![图 39](https://img-camp.banyuan.club/online/foundation/chapter6/6-39.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 39 有线服务**

(5) 交换式有线WAN

很明显，当今的网络不能只通过提供网络末端连接的点对点有线WAN进行操作。我们需要交换式有线WAN来连接网络的骨干网。过去为了这个目的设计了几个诸如SONET或ATM的协议。然而，网络过于复杂，所以有关它们的讨论超出了本书的范围。

**2). 无线WAN**

如今网络的范围如此之大，以至于有时候仅通过有线WAN无法向世界的每一个角落提供服务。我们必定需要无线WAN。下面描述了出于这个目的而使用的几种技术。

(1) WiMax

**全球互联接入**(WiMax)是DSL或通过电缆连接因特网的无线版，它提供两种服务(固定WiMax)将主要工作站与固定工作站或移动电话之类的移动工作站相连接。图 40展示了这两种连接。

![图 40](https://img-camp.banyuan.club/online/foundation/chapter6/6-40.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 40 WiMax**

(2) 手机网络

现今的另一种无线WAN是最初为语音通信而设计的手机电话，现在它也可以用于网络通信。如我们所知的那样，蜂窝式网络将地球划分成单元。移动工作站与它们该时刻所在的单元内的固定天线通信。当用户移动到另一个单元时，通信存在于移动设备和新的天线之间。

(3) 卫星网络

卫星网络是由节点组合而成的，这些节点一部分是卫星，它们提供地球上一点到另一点的通信。网络中的一个节点可以是一个卫星、一个地球工作站或者一个最终用户终端或电话。

卫星网络很像蜂窝式网络，因为它将整个星球划分成了单元。卫星可以提供往返于地球上无论多远的任意地点处的传输功能。这个优势使得高品质的通信可以提供给世界上的落后地区，却不需要在地面基础设施上进行巨大投资。

## 物理层

如果不讨论物理层，关于TCP/IP协议族的讨论就是不完整的。物理层的角色是将从数据链路层接收的位转换成用于传输的电磁信号。当位被转换成信号后，信号将被传送至传输媒介，这也就是下一节讨论的主题。图 41使用了和前面4节相同的场景，但是现在的通信是在物理层。

![图 41](https://img-camp.banyuan.club/online/foundation/chapter6/6-41.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 41 物理层通信**

### 1. 数据和信号

在物理层的通信是节点财节点的。但是节点交换的是电视信号。物理层的一个主要功能就是为位确定在节点间传输的路线。但是就像它代表的是节点(主机、路由器或交换机)内存中储存的两个可能的值一样，位不能直接发送到传输媒介(有线或无线)；这些位在传输之前需要先转换成信号。所以物理层的主要责任是高效地将这些位转换成电磁信号。我们首先需要理解数据的本质和信号的种类才能明白我们如何才能有效地进行这种转换。

**模拟的和数字的**

数据可以有两种形式，模拟的和数字的。**模拟数据**这个词指连续的信息。模拟数据，比如人发出的声音，呈现的是连续的值。当一个人说话时，空气中就出现了一个模拟波。这个模拟波可以通过麦克风捕捉并转换成模拟信号或者采样并转换成数字信号。

**数字数据**呈现的是离散的值。例如，數据在计算机内存中是以0和1的形式存储的。它们可以转换成数字信号或者调制成用来通过媒介进行传输的模拟信号。

就像它们所代表的数据一样，信号也可以是模拟的或数字的。模拟信号在一个时间段中有无限种不同的等级强度，就像当波从A值移动到B值的时候，它的路径经过并包括无限个值。与之不同的是，数字信号可以只拥有有限个定义的值。虽然每个值可以是任意数宇，通常它们都像1和0这么简单。展示信号最简单的方法是将它们绘制在一组相互垂直的轴上。纵轴代表信号的值或强度，横轴代表时间。图 42绘制了一个模拟信号和一个数宇信号。

![图 42](https://img-camp.banyuan.club/online/foundation/chapter6/6-42.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 42模拟信号和数字信号的对比**

### 2. 数字化传输

计算机网络是为将信息从一点发送到另一点而设计的。这个信息需要转换成数字信号或模拟信号来进行传输。如果这个数据是数据化的，需要用**数数转换**技术。一种将数宇数据转换成数字信号的方法。如果数据是模拟的，需要使用**模数转换**技术，一个将模拟信号转换成数字信号的方法。

**1). 数数转换**

如果数据是数字化的并且需要传输数字信号，可以使用数字到数字的转换，将数字数据转换成数字信号。虽然有很多技术可以达到这个目的，当数据处于最简单的一位或一组位的形式时，这个数据如图 43所示用一个信号电平表示。

![图 43](https://img-camp.banyuan.club/online/foundation/chapter6/6-43.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 43 数数转换**

**2). 模数转换**

有时候我们通过麦克风或照相机得到一个模拟信号，现在的趋向是将模拟信号转换成数字数据，因为数字信号受到嗓音干扰的影响更小。虽然有很多种技术可以达到这个目的，最简单的方法是对模拟信号取样来生成一个数字化数据，再像前面讨论过的一样将数字数据转换成数字信号，如图 44所示。

![图 44](https://img-camp.banyuan.club/online/foundation/chapter6/6-44.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 44 模数转换**

### 3. 模拟传输

虽然数宇化传输是令人满意的，但它需要一个专用通道。模拟传输是当我们没有专用通道时的唯一选择。例如，当我们在空气中进行传播时，空气属于所有人，而我们只能使用频道中可用的那一部分。基于可用的数据类型，我们可以用数模转换或模模转换。

**1). 数模转换**

**数模转换**是基于数字数据的信息改变模拟信号的某个特征的过程。图 45展示了数字信息、数模转换过程和最终得到的模拟信号。

![图 45](https://img-camp.banyuan.club/online/foundation/chapter6/6-45.png?x-oss-process=image/resize,w_700/sharpen,100)   
**图 45 数模转换**

**2). 模模转换**

默默转换是基于模拟数据的信息改变模拟信号的某个特征的过程。图 46展示了模拟信息、模模转换过程和最终得到的模拟信号。

![图 46](https://img-camp.banyuan.club/online/foundation/chapter6/6-46.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 46 模模转换**

## 传输介质

在物理层产生的电子信号需要传输介质来从一端传输到另一端。传输介质通常在物理层之下，并且受到物理层的直接控制。我们可以说传输介质属于第0层。图 47展示了传输介质相对于物理层的位置。

![图 47](https://img-camp.banyuan.club/online/foundation/chapter6/6-47.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 47 传输介质和物理层**

**传输介质**可以大致定义为任何可以将信息从源传输到目标的介质。例如，两个一边用餐一边交谈的人的传输介质就是空气。空气可以把信息转换成烟雾信号或信号量。对于书信来说，传输介质就可能是邮车、卡车，甚至是飞机。

在电信中，传输介质可以分为两大类导向介质和无导向介质。导向介质包括双绞线、同轴电缆和光纤。无导向介质是自由空间。

### 1. 导向介质

**导向介质**就是那些用来提供从一个设备到另一个设备的通道的，包括**双绞线、同轴电缆**和**光纤电缆**。图 48展示了三种导向介质。

![图 48](https://img-camp.banyuan.club/online/foundation/chapter6/6-48.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 48 导向介质**

**1). 双绞线**

双绞线包括两根绞在一起的导线(通常是铜线)，这两根导线是分别包着塑料绝缘的。双绞线中一根的作用是将信号传送到接收方，另一根的作用仅仅是接地参考。接收方使用两者的不同。

除了来自发送方的信号以外，干涉(嗓音)也会影响两根线并制造出多余信号。如果两根线是平行的，那么这些多余信号在两根线上的影响是不一样的，因为它们相对于嗓音源处于不同的位置。通过将两根线绞在一起，平衡就得到了保持。电话公司用于提供高数据率链接的DSL线路也是双绞线。

**2). 同轴电缆**

同轴电缆有一个位于中心且密封在绝缘外壳中的实心(通常是铜导线)或绞合线作为核心导线，同时这个导线也依次密封在金属箔或金属网或二者构成的外金属包装和绝缘护套中，而不是使用两根线。这里的外层金属包装既用作抗嗓音的屏蔽也作为补全电路的第二导体使用。整个电缆由塑料护套保护。

有线电视网络使用的是同轴电缆。传统的有线电视网络中，整个网络由同轴电缆构成。然而，后来有线电视供应商把大多数的媒介换成了光纤电缆，混合网络也只在网络的边缘和靠近顾客房屋处使用同轴电缆。

**3). 光纤电缆**

光纤电缆由玻璃或塑料构成。它以光的形式传递信号。这种技术使用一束光在进入密度较低介质时既不反射也不折射的特性。在玻璃或塑料介质外覆盖另一种密度较小的介质(称为包层)来导引光通过媒介。

光纤电缆通常在骨干网中找到，因为它的高带宽具有成本效益。

### 2. 非导向介质无线

非导向介质不通过物理上的导体来传播电磁波。这种通信通常归为无线通信。信号通常在自由空间中传播，这样任何有能够接收信号的设备的人都可以使用它。

图 49展示了电磁波谱中用于无线通信的波段，从3 kHz到900 THz。

![图 49](https://img-camp.banyuan.club/online/foundation/chapter6/6-49.png?x-oss-process=image/resize,w_700/sharpen,100)  
**图 49 用于无线通信的电磁波频谱**

现在用三种不同范围的电磁波频谱来进行通信无线电波、微波和红外波。

**1). 无线电波**

频率在3kHz ～ 1GHz之间的电磁波通常叫做无线电波。它们通常用于无线电通信。

**2). 微波**

频率在1～300 GHz的电磁波叫做微波。微波是没有方向性的。当天线传输微波时，它们可以集中得很窄，也就是说发送和接收微波的天线需要对齐。微波没有方向性的一个最明显的优势就是一对天线可以在不和另一对天线相互干扰的情况下对齐。

**3). 红外波**

红外波，频率在300 GHz～400 THz之间(波长在770 nm～1 mm之间)，它可以用于短程通信。红外波的频率较高，无法穿透墙壁，这个有着明显优势的特点防止了不同系统之间的干扰，一个房间内的短程通信系统不会受到下一个房间内的另一个系统的影响。当使用红外遥控器时，不会受到邻居使用遥控器的干扰。但是同样的特征使红外信号对于长距离通信而言是无用的。另外，我们不能在室外使用红外波，因为太阳光中的红外波会对通信产生干扰。

## 小结

* 网络是通过通信链接连接的一组设备。现今，当提起网络时，我们通常指的两种基本类型的网络LAN和WAN。当今网络由连接设备和交换站连接的很多局域网和广城网构成。协议是一组控制通信的规则。TCP/IP是一个由5层构成的分级协议族、这5层分别为应用层、传输层、网络层、数据链路层和物理层。
* 网络中的应用使用客户机一服务器模式或端到端模式二者之一。万维网(WWW)是一个由世界各地的链接构成的存储库。用来得到万维网上的数据的主要协议是超文本传输协议(HTTP)。文件传输协议(FTP)是TCP/IP协议族客户机一服务器应用，它的作用是从一台计算机复制文件到另一台计算机。电子邮件是最流行的因特网应用之一。TELNET是允许用户访问远程计算机的客户机一服务器应用程序，使用户能访问远程系统。
* 域名系统(DNS)是在网络上使用唯一名称标识每一台主机的客户机一服务器应用程序。  
* 传输层协议的主要责任是提供进程到进程的通信。UDP是提供不可靠、无连接服务的传输协议。传输控制协议(TCP)是另一个提供面向连接的可靠服务的传输层协议。  
* 网络层负责监督底层物理网络对数据包的处理。IPv4是负责源至目标传递的一个不可靠的无连接协议。在TCP/IP协议族的IP层使用的标识符叫做IP地址。IPv4地址的长度是32位，网际协议的最新版本IPv6有128位的地址空间。  
* 数据链路层涉及局域网和广域网(LAN和WAN)。LAN和WAN可以是有线的也可以是无线的。以太网是使用范围最广的有线局域网协议。拨号上网服务、DSL和有线网络大都使用点对点有线WAN.无线WAN由无线以太网组成。蓝牙是一种用来连接小范围内设备(叫做小配件)的无线LAN技术。WIMAX是一个未来可用于代替DSL和电缆的无线接入网络。
* 数据必须先转换成电磁信号才能传输。模拟数据是连续的并使用连续的值，数字数据有离散的状态并取离散的值。数数转换将数字数据转换成数字信号，数模转换是将数字数据转换成模拟信号的过程。模数转换是对模拟数据进行取样并转换成数字信号的过程。模模转换指将模拟数据转换成模拟信号。  
* 传输介质在物理层之下。导向介质为设备之间提供物理通道。双绞线、同轴电缆、光纤电缆是现在最流行的导向介质。非导向介质(自由空间)在不使用物理导体的前提下传输电磁波。

## 作业

1. 下列哪个数据单元以帧来封装?    
>a. 用户数据报  b. 数据报 c .段

2.  大多数安装在个人计算机上的操作系统带有几个客户端进程，但通常没有服务器进程，请解释原因。  

4. 比较16位IP地址(0〜65535)和32位IP地址(0〜4294967295)的范围，为什么我们需要IP地址有如此大的范围，但端口号却相对范围小呢?

4. —个设备以1000 b/s 的速率发送数据，发送100000个字符（8位）的文件用多长时间?', 6, 1, NULL, '2020-05-21 18:21:33.663924', '2020-05-21 18:21:33.663924', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (82, '操作系统', NULL, 20, NULL, NULL, '## 引言

计算机系统是由两个主要部分组成的硬件和软件。硬件是计算机的物理设备。软件则是使得硬件能够正常作的程序的集合。计算机软件分成两大类操作系统和应用程序(图 1)。应用程序使用计算机硬件来解决用户的口操作系统问题。另一方面，操作系统则控制计算机系统用户对硬件口应用程序的访问。

![图 1](https://img-camp.banyuan.club/online/foundation/chapter7/7-1.png?x-oss-process=image/resize,w_800/sharpen,100)   
**图 1 计算机系统**

### 1. 操作系统 

操作系統是一个非常复杂的系统，因此很难给予它一个普遭认同的简单定义。在这里例举一些常见的定义：

* 操作系统是介于计算机硬件和用户程序或人)之间的接口。
* 操作系统是一种用来使得其他程序更加方便有效运行的程序(或程序集)。
* 操作系统作为通用管理程序管理着计算机系统中每个部件的活动，并确保计算机系统中的硬件和软件资源能够更加有效地使用。当出现资源使用冲突时，操作系统应能够及时处理，排除冲突。

**操作系统是计算机硬件和用户（程序和人）的一个接口，它使得其他程序更加方便有效地运行，并能翻遍的对计算机硬件和软件资源进行访问。**

操作系统的两个主要设计目标：
* 有效地使用硬件
* 容易地使用资源。

### 2. 自举过程 

基于上面的定义，操作系统为其他程序提供支持。例如，它负责把其他程序装入内存，以便运行。但是，操作系统本身也是程序，它需要被装入内存和运行，这个困境如何解决呢?如果使用ROM技术把操作系统存储(由制造商完成)在内存中，这个问题就能解决。CPU 的程序计数器可以被设置为这个ROM的开始处。当计算机被加电时，CPU从ROM中读取指令，执行它们。但这种解决方案是非常低效的，因为内存的很大一部分需要由ROM构成，而不能被其他程序使用。如今的技术是仅需要分配小部分的内存给部分操作系统。

如今使用的解决方案采用两阶段过程。很小一部分内存用ROM构成，其中存有称为自举程序的小程序。当计算机被加电时，CPU计数器被设置为自举程序的第一条指令，并执行程序中的指令。这个程序唯一的职责就是把操作系统本身(需要启动计算机的那部分)装入RAM内存。当装入完成后，CPU中的程序计数器就被设置为RAM中操作系统的第一条指令，操作系统就被执行。图 2说明了自举过程。

![图 2](https://img-camp.banyuan.club/online/foundation/chapter7/7-2.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 2 自举过程**

## 演化

操作系统已经经历了很长的一段发展历程，我们将在下面加以总结。

### 1. 批处理系统 

批处理操作系统设计于20世纪50年代，目的是控制大型计算机。当时计算机十分度大。用穿孔卡片进行输入数据，用行式打印机输出结果，用磁带设备作为辅助存储介质。

每个运行的程序叫做一个作业。想要运行程序的程序员通过穿孔卡片将程序和数据输入计算机，并向控制器发出作业请求。穿孔卡片由操作员处理。如果程序运行成功，打印结果将传给程序员。如果不成功，则报错。

这个时代的操作系统非常简单它们只保证计算机所有资源被从一个作业转换到另一个作业。

### 2. 分时系统 

为了有效使用计算机资源，多道程序的概念被引入。它可以将多个作业同时装入内存。并且仅当该资源可用时分配给需要它的作业。例如，当一个程序正使用输入/输出设备时，CPU则处于空闲状态，并可以供其他程序使用。我们将在本章后面详细介绍多道程序。

多道程序带来了**分时**的概念资源可以被不同的作业分享。每个作业可以分到一段时间来使用资源。因为计算机运行速度很快，所以分时系统对于用户是隐藏的。每个用户都感觉整个系统在为自己服务。

最终利用分时技术的多道程序极大地改进了计算机的使用效率。但是，它们需要有一个更加复杂的操作系统，它必须可以**调度**：给不同的程序分配资源并决定哪一个程序什么时候使用哪一种资源。在这个时代中用户和计算机的关系也改变了。用户可以直接与系统进行交互而不必通过操作员。一个新的术语也随之产生：**进程**。一个作业是一个要运行的程序，一个进程则是在内存中等待分配资源的程序。

### 3. 个人系统 

当个人计算机产生后；需要有一类适合这类计算机的操作系统。于是，**单用户操作系統**就应运动而生了，如DOS(磁盘操作系统)。

### 4. 并行系统 

人们对更快和更有效的需求导致了**并行系统**的设计在同一计算机中安装了多个CPU，每个CPU可以处理一个程序或者一个程序的一部分。意味着很多任务可以并行地处理而不再是串行处理。当然这种操作系统要比单CPU的操作系统复杂得多。

### 5. 分布式系统 

网络化和网络互联的发展，扩大了操作系统的内涵。一个以往必须在一台计算机上运行的作业现在可以由远隔千里的多台计算机共同完成程序可以在一台计算机上运行一部分而在另一台计算机上运行另一部分，只要它们通过网络(例如因特网)连接即可。资源可以是分布式的，一个程序需要的文件可能分布在世界的不同地方。**分布式系统**结合了以往系统的特点和新的功能，例如安全控制。

### 6. 实时系统 

**实时系统**是指在特定时间限制内完成任务。它们被用在实时应用程序中，这些应用程序监控、响应或控制外部过程或环境。在交通控制、病人监控或军事控制系统中可以找到实时系统的例子。应用程序有时可以是作为大系统一部分的嵌入式系统，如汽车中的控制系统。

实时操作系统的需求经常与通用系统的需求是不同的。由于这个原因，在本章中我们不讨论它们。

## 组成部分

现在的操作系统十分复杂，它必须可以管理系统中的不同资源。它像是一个有多个上层部门经理的管理机构，每个部门经理负责自己的部门管理，并且相互协调。现代操作系统至少具有以下4种功能：存储管理、**进程管理**、设备管理、文件管理。就像很多组织有一个部门不归任何经理管理一样，操作系统也有这样一个部分，称为用户界面或**命令解释程序**，它负责操作系统与外界通信。图 3显示了操作系统的组成部分。

![图 3](https://img-camp.banyuan.club/online/foundation/chapter7/7-3.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 3 操作系统的组成部分**

### 1. 用户界面 

每个操作系统都有**用户界面**，即指用来接收用户(进程)的输入并向操作系统解释这些请求的程序。一些操作系统(比如UNIX)的用户界面，被称作**命令解释程序**(Shell)。在其他操作系统中，则被称为**窗口**，以指明它是一个由菜单驱动的并有着**GUI**(图形用户接口)的部件。

### 2. 内存管理器 

现在计算机操作系统的一个重要职责是**内存管理**。计算机中存储器的容量近年来得到激増，同样所处理的程序和数据也越来越大。内存分配必须进行管理以避免°内存溢出"的错误。操作系统按照内存管理可以分为两大类：单道程序和多道程序。

#### 1). 单道程序

**单道程序**属于过去，但它还是值得学习，因为它有助于理解多道程序。在单道程序中，大多数内存用来装载单一的程序(我们考虑数据作为程序的一个部分被程序处理)，仅仅一小部分用来装载操作系统。在这种配置下，整个程序装入内存运行，运行结束后程序区域由其他程序取代(图 4)。

这里内存管理器的作是简单明了的，即将程序载入内存、运行它、再装入新程序。但是，在技术方面仍然有很多问题：

* 程序必须能够载入内存。如果内存容量比程序小程序将无法运行。

![图 4](https://img-camp.banyuan.club/online/foundation/chapter7/7-4.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 4 单道程序**

* 当一个程序正在运行时，其他程序不能运行。一个程序在执行过程中经常需要从输入设备得到数据，并且把数据发送至输出设备。但输入/输出设备的速度远远小于CPU,所以当输入/输出设备运行时，CPU处于空闲状态。而此时由于其他程序不在内存中，CPU不能其服务。这种情况下CPU和内存的使用效率很低。

#### 2). 多道程序

在**多道程序**下，同一时刻可以装入多个程序并且能够同时被执行。CPU轮流为其服务。图 5 给出了多道程序的内存分配。

我们将在下几节对每种模式作简要讨论。有两种技术属于非交换范内存畴，这意味着程序在运行期间始终驻留在内存中。另外两种技术属于交换范畴。也就是说，在运行过程中程序可以在内存和硬盘之间多次交换数据。

![图 5](https://img-camp.banyuan.club/online/foundation/chapter7/7-5.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 5 多道程序**

从20世纪60年代开始，多道程序已经经过了一系列改进，如图 6所示。

![图 6](https://img-camp.banyuan.club/online/foundation/chapter7/7-6.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 6 多道程序的分类**

**A. 分区调度**

多道程序多道程序的第一种技术称为**分区调度**。在这种模式中，内存被分为不定长的几个分区。每个部分或分区保存一个程序。CPU在各个程序之间交替服务。它由一个程序开始，执行一些指令，直到有输入/输出操作或者分配给程序的时限到达为止。CPU保存最近 使用的指令所分配的内存地址后转入下一个程序。对下一个程序采用同样的步骤反复执行下去。当所有程序服务完毕后，再转回第一个程序。当然，CPU可以进行优先级管理。用于控制分配给每个程序的CPU时间(图 7)。

![图 7](https://img-camp.banyuan.club/online/foundation/chapter7/7-7.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 7 分区调度**

在这种技术下，每个程序完全载入内存，并占用连续的地址。分区调度改进了CPU的使用效率，但仍有以下一些问题：

* 分区的大小必须由内存管理器预先决定。如果分区小了，有的程序就不能载入内存。如果分区大了，就会出现空闲区。
* 即使分区在刚开始时比较合适，但随着新程序的交换载入内存后有可能出现空闲区。
* 当空闲区过多时，内存管理器能够紧缩分区并删除空闲区和创建新区，但这将增加系统额外开销。

**B. 分页调度**

**分页调度**提高了分区调度的效率。在分页调度下，内存被分成大小相等的若干个部分，称为**帧**。程序则被分为大小相等的部分，称为**页**。页和帧的大小通常是一样的，并且与系统用于从存储设备中提取信息的块大小相等(图 8)。

页被载入内存中的帧。如果一个程序有3页，它就在内存中占用3个帧。在这种技术下程序在内存中不必是连续的：两个连续的页可以占用内存中不连续的两个帧。分页调度对分区调度的优势在于，一个需要6个帧的程序可以代替两个各占有不连续的3个帧的程序。而不必等到有6个连续的帧出现内存。

分页调度在一定程度上提高了效率，但整个程序仍需要在运行前全部载入内存。这意味着在只有4个不连续的帧时，一个需要6个空闲帧的程序是不能载入的。

![图 8](https://img-camp.banyuan.club/online/foundation/chapter7/7-8.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 8 分页调度**

**C. 请求分页调度**

分页调度不需要程序装载在连续的内存中，但仍需要程序整体载入内存中运行。请求分页调度改变了后一种限制。在**请求分页调度**中程序被分成页，但是页可以依次载入内存、运行，然后被另一个页代替。换句话说，内存可以同时载入多个程序的页。此外，来自同一个程序的连续页可以不必载入同一个帧，一个页可以载入任何一个空闲帧。图 9显示了请求分页调度的一个例子。两页来程序A,一页来程序B,一页来程序C,这4页在内存中。

**D. 请求分段调度**

类似于分页调度的技术是分段调度。在分页调度中，不像程序员以模块来考虑程序程序实际是分为大小相等的页。你将在后面的章节中看到程序通常由主程序和子程序组成，在**请求分段调度**中程序将按程序员的角度划分成段，它们载入内存中、执行，然后被来自同一程序或其他程序的模块所代替。图 10显示了请求分段调度的一个例子。因为在内存中的段是等长的，所以段的一部分可能是空的。

![图 9](https://img-camp.banyuan.club/online/foundation/chapter7/7-9.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 9 请求分页调度**

![图 10](https://img-camp.banyuan.club/online/foundation/chapter7/7-10.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 10 请求分段调度**

**(5)请求分页和分段调度**

**请求分页和分段调度**结合了两者的优点以提高系统效率。一个段也许太大而不能载入内存中的空闲区。内存可以分成很多帧，一个模块可以分成很多页，依次装入内存运行。

#### 3). 虚拟内存

请求分页调度和请求分段调度意味着当程序运行时，一部分程序驻留在内存中，一部分则放在硬盘上。这就意味着，例如，10 MB内存可以运行10个程序。每个程序3 MB,一共30 MB.任一时候10个程序中10 MB在内存中，还有20 MB在磁盘上。这里实际上只有10 MB内存但却有30 MB的**虚拟内存**。如图 11所示展示了这个概念。虚拟内存意味着请求分页调度、请求分段调度，或两种都有，如今几乎所有的操作系统都使用了该技术。

![图 11](https://img-camp.banyuan.club/online/foundation/chapter7/7-11.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 11 虚拟内存**

### 3. 进程管理器

操作系统的第二个功能是进程管理，在介绍该概念之前.我们先定定义一些术语。

####  1). 程序、作业和进程

现代操作系统关于指令集有三个术语程：程序、作业和进程。尽管这些术语比较模糊，并且不同的操作系统对于它们的定义并不一致，我们还是可以作出非正式的定义。

**(A) 程序**

**程序**是由程序员编写的一组稳定的指令，存在磁盘(或磁带)上，它可能会也可能不会成为作业。

**(B) 作业**

从一个程序被选中执行，到其运行结束并再次成为一个程序的这段过程中，该程序称为**作业**。在整个过程中，作业可能会或不会被执行，或者驻留在磁盘上等待调入内存，或者在内存中等待CPU执行，或者驻留在硬盘或内存中等待一个输入/输出事件，或者在内存中等待直到被CPU运行。在所有这些情况下程序才称为作业。当一个作业执行完毕(正常或不正常)，它又变成程序代码并再次驻留于硬盘中，操作系统不再支配该程序。需要注意的是，每个作业都是程序，但并不是所有的程序都是作业。

**(C) 进程**

**进程**是一个运行中的程序。该程序开始运行但还未结束。换句话说，进程是一个驻留在内存中运行的作业，它是从众多等待作业中选取出来并装入内存中的作业。一个进程可以处于运行状态或者等待CPU调用。只要作业装入内存就成为一个进程。需要注意的是，每个进程都是作业，而作业未必是进程。

#### 2). 状态图

当明白程序怎样变成作业和作业怎样变成进程时程序、作业、进程的关系也就很明显了。**状态图**显示了每个实体的不同状态，图 12中用框线将这三者分开。

一个程序当被操作系统选中时就成为作业并且成为**保持状态**。直至它载入内存之前都保持这个状态。当内存可以整体或者部分地载入这个程序时，作业转成就给状态，并变成进程。它在内存中保持这个状态直至CPU运行它；这时它转成运行状态。当处于运行状态后，可能出现下面三种情况之一：

* 进程运行直至它需要I/O资源
* 进程可能耗尽所分配的时间片。
* 进程终止。

![图 12](https://img-camp.banyuan.club/online/foundation/chapter7/7-12.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 12 程序、作业和进程分界状态图**

在第一种情况下，进程进入**等待状态**直至输入/输出结束。在第二种情况下，它直接进入就绪状态。在第三种情况下，它进入终止状态，并且不再是进程。进程进入终止状态前在运行、等待、就绪状态中转换。注意，如果系统使用虚拟内存，并且需要在内存中将程序交换出或换入，状态图可能更加复杂。

#### 3). 调度器

将一个作业或进程从一个状态改变为另一个状态，进程管理器使用了两个**调度器**：作业调度器和进程调度器。

**A. 作业调度器**

**作业调度器**将一个作业从保持状态转入就绪状态，或是从运行状态转入终止状态。换句话说，作业调度器负责从作业中创建一个进程和终止一个进程。图 13给出了作业调度器的状态关系框图。

![图 13](https://img-camp.banyuan.club/online/foundation/chapter7/7-13.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 13 作业调度器**

**B. 进程调度器**

**进程调度**会将一个进程从一个状态转入另一个状态。当一个进程等待某事件发生时，它使这一进程从运行状态进入等待状态。当事件发生时，进程将从等待状态进入就绪状态。当一个进程所分配的时间片用完时，这个进程将从运行状态进入就绪状态。当CPU准备执行这个进程时，进程调度器将让这个进程从就绪状态进入执行状态。图 14给出了进程调度器的状态关系框图。

![图 14](https://img-camp.banyuan.club/online/foundation/chapter7/7-14.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 14 进程调度器**

**C. 其他调度器**

一些操作系统使用其他类型的调度器使进程之间的转换更为有效。

#### 4). 队列

状态图显示了一个作业或进程从一个状态进入另一个状态。事实上，会有很多的作业和进程相互竞争计算机资源。例如，当一些作业进入内存时，其他的就必须等待直到有了可用空间。或者当一个进程正在使用CPU时，其他进程就必须等待直到CPU空闲为止。为处理多个进程和作业，进程管理器使用**队列**(等待列表)。与每一作业處进程相关的是存有这些作业和进程信息的作业控制块或进程控制块。进程管理在队列中存储的不是作业或进程，而是作业或进程控制块。作业和进程仍保存在内存或硬盘中:它们因为太大而无法被复制到队列中。这些作业控制块或进程控制块就是等待中的作业和进程的代表。

一个操作系统有很多个队列。例如，图 15给出的作业和进程在三个队列里循环作业队列、就绪队列和I/O队列。作业队列用来保存那些等待内存的作业。就绪队列用来保存那些巳经在内存中准备好运行但在等待CPU的进程。I/O队列用来保存那些正在等待I/O设各的进程(这里可以有多个I/O队列，每一个对应一个输入/输出设备，这里为了简单只画出一个)。

进程管理器可以用多种策略从队列中选择下一个作业或进程，可以是先入先出(FIFO)、最短长度优先、最高优先级等。

#### 5). 进程同步

所有的进程管理的思想都是使得拥有不同资源的不同进程同步。只要资源可以被多个用(进程)同时使用，那么它就可能有两种有间题的状态死锁和饿死。下面简略说明一下这两种状态。

![图 15](https://img-camp.banyuan.club/online/foundation/chapter7/7-15.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 15 进程管理队列**

**A. 死锁**

我们先不给出**死锁**的正式定义，先看一个例子。假定有两个进程A和B,进程A已经占有了一个名为Fi1e1的文件(File1已经分配给了A)，而它只有得到另一个名为File2的文件(A已经请求了Fi1e2)才能够释放File1。进程B已经占有了File2文件(File2已经分配给了B)，而它只有得到File1文件(B已经请求了File1)才能够释放Fi1e2。在大多数操作系统中，文件都是不可共享的；当文件被一个进程使用时，将不能再被别的进程使用。在这种情况下，如果没有强制一个进程释放文件的防备措施，就会发生死锁(图 16)。

![图 16](https://img-camp.banyuan.club/online/foundation/chapter7/7-16.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 16 死锁**

图 17用窄桥来模拟死锁。窄桥的情况与死锁类似，因为资源(桥的一端)被一辆车占用，该车只有到达桥的另一端才会释放资源，而此时另一端正被另一辆车占用着。反过来看情况也一样。

![图 17](https://img-camp.banyuan.club/online/foundation/chapter7/7-17.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 17 在桥上的死锁**

死锁发生在操作系统允许一个进程运行而不用首先检查它所必需的资源是否准备好，是否允许这个进程占有资源直到它不需要为止。操作系统中需要有一些措施来防止死锁。一种解决方法是当所需资源不空闲时，不允许进程运行。但后面会发现这样做将导致另一种问题。另一种解决方法是限制进程占有资源的时间。

**当操作系统没有对进程的资源进行限制时将会发生死锁。**

死锁不是经常发生，死锁发生需要4个必要条件

* **互斥**。一个资源只能被一个进程占有； 
* **资源占有**。一个进程占有一个资源，即使在获取其他资源之前无法使用它；
* **抢先**。操作系统不能临时对资源重新分配；
* **循环等待**。所有的进程和资源包含在一个循环里，如图 16所示。

所有4个条件都是死锁发生所必需的。但是它们只是必要条件(不是充分条件)，也就是说对于死锁来说它们必须同时出现，但它们并不一定能引起死锁。换句话说，如果它们其中之一没有出现，死锁不会发生。这样就给我们提供了一种方法来防止或避免死锁不让它们中的某一条件发生。

**B. 饿死**

**饿死**是一种与死锁相反的情况。它发生在当操作系统对进程分配资源有太多限制的时候。例如，假使一个操作系统中规定一个进程只有在所需的所有资源都为其占有时才能执行。

在图 18中，假设进程A需要两个文件File1和File2。File1正在被进程B使用，File2正在被进程E使用。进程B将首先终止并释放Fi1e1，但进程A一直不能执行是因为File2一直不被释放。与此同时，进程C由于只需要File1而被允许执行。这时进程E终止且释放File2，但进程A还是不能执行，因为File1正被使用。

![图 18](https://img-camp.banyuan.club/online/foundation/chapter7/7-18.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 18 饿死**

Edsger Dijkstra介绍过一个经典的饿死问题。五个哲学家围坐在一个圆桌前(图 19)，每个哲学家需要用两只筷子来吃碗里的米饭。然而，有一只或两只筷子可能被邻座的人使用了。如果没有两只筷子同时可用，有一位哲学家将被饿死。

![图 19](https://img-camp.banyuan.club/online/foundation/chapter7/7-19.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 19 哲学家吃饭问题**

#### 6). 设备管理器

**设备管理器**(或者是输入/输出管理器)负责访问输入/输出设备。在计算机系统中输入/输出设备存在着数量和速度上的限制。由于这些设备与CPU和内存比起来速度段时间内这些设备对其他进程而言是不可用的。设备管理器负责让输入/输出设备使用起来更有效。

对设备管理器细节的讨论需要掌握有关操作系统原理的高级知识，这些都不在本书讨论之列。但是我们可以在这里简要地列出设备管理器的功能。

* 设备管理器不停地监视所有的输入/输出设备，以保证它们能够正常运行。管理器同样也需要知道何时设备已经完成一个进程的服务。而且能够为队列中下一个进程服务。

* 设备管理器为每一个输入/输出设备维护一个队列，或是为类似的输入/输出设备维护一个或多个队列。例如，如果系统中有两台高速打印机，管理器能够分别用一个队列维护一个设备，或是用一个队列维护两个设备。

* 设备管理器控制用于访问输入/输出设备的不同策略。例如，可以用先入先出法来维护一个设各，而用最短长度优先来维护另一个设备。

### 4. 文件管理器

现今的操作系统使用**文件管理器**来控制对文件的访问。对文件管理器细节的讨论同样需要掌握有关操作系统原理和文件访问的高度概念，这些超出了本书的讨论范围。下面简述一下文件管理器的功能：

* 文件管理器控制文件的访问。只有那些获得允许的应用程序オ能够访问，访问方式也可以不同。例如，一个进程(或一个调用进程的用户)也许可以读取文件，但却不允许写(改变)操作。另一个进程也许被允许执行文件和进程，但却不允许读取文件的内容。
* 文件管理器管理文件的创建、删除和修改。
* 文件管理器可以给文件命名。
* 文件管理器管理文件的存储怎样存储，存在哪里等。
* 文件管理器负责归档和备份。

## 主流操作系统

在这一节，我们将介绍一些常用的操作系统，以促进将来的学习。我们选择三种计算机用户熟悉的操作系统UNIX、Linux和Windows。

### 1. UNIX

UNIX是由贝尔实验室的计算机科学研究小组的Thomson和Ritchie在1969年首先开发出来的。从那时起，UNIX经历了许多版本。它是一个在程序设计员和计算机科学家中较为流行的操作系统。它是一个非常强大的操作系统，有三个显著的特点。第一,UNIX是一个可移植的操作系统，它可以不经过较大的改动而方便地从一个平台移植到另一个平台。原因是它主要是由C语言编写的(而不是特定于某种计算机系统的机器语官)。第二，UNIX拥有一套功能强大的具(命令)，它们能够组合起来(在可执行文件中被称为脚本)去解决许多同题，而这一作在其他操作系统中则需要通过编程来完成。第三，它具有设备无关性，因为操作系统本身就包含了设备驱动程序，这意味着它可以方便地配置来运行任何设备。

UNIX是多用户、多道程序、可移植的操作系统，它被设计来方便编程、文本处理、通信和其他许多希望操作系统来完成的任务。它包含几百个简单、单一目的的函数，这些函数能组合起来完成任何可以想象的处理任务。它的灵活性通过它可以用在三种不同的计算环境中而得到证明，这三种环境为：单机个人环境、分时系统和客户/服务器系统。

>**UNIX是多用户、多道程序、可移植的操作系统，它被设计来方便编程、文本处理、通信。**

**UNIX结构**

UNIX由4个主要部分构成：内核、命令解释器、一组标准工具和应用程序。这些组成部分显示在图 20中

**(1) 内核**

**内核**是UNIX系统的心脏。它包括操作系统最基础的部分：内存管理、进程管理、设备管理和文件管理。系统所有其他部分均调用内核来执行这些服务。

![图 20](https://img-camp.banyuan.club/online/foundation/chapter7/7-20.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 20 UNIX操作系统的组成部分**

**(2) 命令解释器**

命令解释器是UNIX中用户最可见的部分。它接收和解释用户输入的命令。在许多方面，这使它成为UNIX结构的最重要的组成部分。它肯定也是用户最知道的部分。为了在系统做任何事情，我们必须向命令解释器输入命令。如果命令需要一个应用程序，命令解释器将请求内核执行该具。如果命令需要一个应用程序，命令解释器需要内核运行它。有些操作系统(UNIX)有几种不同的命令解释器。

**(3) 工具**

UNIX中有几百个工具。**工具**是UNIX标准程序，它为用户提供支持过程。常用的三个具是：文本编辑器、捜索程序和排序程序。

许多系统具实际上复杂的应用程序。例如，UNIX的电子邮件系统被看成一个工具，就像三种常见文本编辑器：vi、emacs和pico。所有这4个具本身都是大的系统。其他具是简短函数。例如，list(ls)工具显示磁盘目录中的文件。

**(4) 应用**

UNIX的应用是指一些程序，它们不是操作系统发布中的标准部分。它们是由系统管理员、专职程序员或用户编写的。提供了对系统的扩展能力。事实上，许多标准具自多年前都是作为应用出现的，后来被证明非常有用，现在就成了系统的一部分。

### 2. Linux

在1991年，芬兰Helsinki大学的学生Linus Torvalds开发了一个新的操作系统，这就是如今所知的Linux。初始内核(与UNIX小子集相似)如今成长为全面的操作系统。1997年发布的Linus 2.0内核成为商业操作系统，它具有传统UNIX的所有特性。

**1. 组成**

Linux有下列组成部分。

**(1) 内核**  
内核负责处理所有属于内核的职责，如内存管理、进程管理、设备管理和文件管理。

**(2) 系统库**  
系统库含有一组被应用程序使用的函数(包括命令解释器)，用于与内核交互。

**(3) 系统工具**  
系统具是使用系统库提供的服务，执行管理任务的各个程序。

**2. 网络功能**

Linux支持标准因特网协议。它支持三层：套接字接口、协议驱动和网络设备驱动。

**3. 安全**

Linux的安全机制提供了传统上为UNIX定义的安全特性。如**身份验证**和访问控制。

### 3. Windows

20世纪80年代后期，在Dave Cutler的领导下，微软开始开发替代MS-DOS(微软磁盘操作系统)的新的单用户操作系统。Windows就是结果。后来又有几个Windows的版本，我们统称这些版本为Windows。

**1. 设计目标**  

微软发布的设计目标是：可扩展性、可移植性、可靠性、兼客性和性能。

**(1) 可扩展性**  
Windows被设计成具有多层的模块化体系结构。意图是允许高层随时同而改变，而不影响底层。

**(2) 可移植性**  
像UNIX一样，Windows是用C或C++编写的，这个语言是独立于它所运行的计算机的机器语言的。

**(3) 可靠性**  
Windows被设计成能处理包括防止恶意软件的错误条件。

**(4) 兼容性**  
Windows被设计成能运行为其他操作系统编写的程序，或Windows早期版本。

**(5) 性能**

Windows被设计成对运行在操作系统顶部的应用程序，具有快速响应时间。

**2. 体系结构**

Windows使用层次体系结构，如图 21所示。

![图 21](https://img-camp.banyuan.club/online/foundation/chapter7/7-21.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 21 Windows的体系结构**

**(1) HAL**  
硬件抽象层(HAL)为上层隐藏了硬件的差异。

**(2) 内核**  
内核是操作系统的心脏。它是面向对象软件的一个片段。该面向对象的软件把任何实体都看成对象。

**(3) 执行者**  
Windows执行者为整个操作系统提供服务。它由6个子系统构成对象管理器、安全引用监控器、进程管理器、虚拟内存管理器、本地过程调用具和I/O管理。大多子系统是我们前面讨论操作子系统中所熟悉的。有些子系统(像对象管理器)被加到Windows中，是因为它的面向对象的本质。执行者运行在内核态(特权)。

**(4) 环境子系统**  
这些子系统被设计用来允许Windows运行那些为Windows、其他操作系统或Windows早期版本设计的应用程序。运行为Windows设计的应用的本地子系统称为Win32。环境子系统运行在用户态(无特权)。

## 作业

1. 应用程序和操作系统的不同点是什么?
2. 操作系统的组成是什么?
2. 单道程序和多道程序之间有何区别?
3. 一个计算机装有一个单道程序的操作系统。如果内存容量为64MB,操作系统需要4MB内存，那么该计算机执行一个程序可用的最大内存为多少?', 7, 1, NULL, '2020-05-21 18:21:33.716766', '2020-05-21 18:21:33.716766', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (83, '程序设计语言', NULL, 20, NULL, NULL, '## 演化

对计算机而言，要编写程序就必须使用计算机语言。**计算机语言**是指编写程序时，根据事先定义的规则(语法)而写出的预定语句集合。计算机语言经过多年的发展已经从机器语言演化到高级语言。

### 1. 机器语言

在计算机发展的早期，唯一的**程序设计语言**是**机器语言**。每台计算机有其自己的机器语育，这种机器语言由"0“和”1“序列组成。表 1 示例了一个加法程序可能使用的机器语言代码表示。

**表 1两个整数相加的机器语言代码**

|十六进制机|机器语言代码|十六进制|机器语言代码|
|----|----|----|----|
|(1FEF)<sub>16</sub>|0001 1111 1110 1111 |(3201)<sub>16</sub>  |0011 0010 0000 0001 |
|(240F)<sub>16</sub> |0010 0100 0000 1111 |(2422)<sub>16</sub> |0010 0100 0010 0010 |
|(1FEF)<sub>16</sub> |0001 1111 1110 1111 |(1F42)<sub>16</sub> |0001 1111 0100 0010 |
|(241F)<sub>16</sub> |0010 0100 0001 1111 |(2FFF)<sub>16</sub> |0010 1111 1111 1111 |
|(1040)<sub>16</sub> |0001 0000 0100 0000 |(0000)<sub>16</sub> |0000 0000 0000 0000 |
|(1141)<sub>16</sub> |0001 0001 0100 0001 |                    |                    |

机器语言是计算机硬件唯一能理解的语育，它由具有两种状态的电子开关构成关(表示0）和开（表示1）。

>**计算机唯一支持的语言是机器语言**

虽然用机器语言编写的程序真实地表示了数据是如何被计算机操纵的。但它至少有两个缺点首先，它依赖于计算机。如果使用不同的硬件，那么一台计算机的机器语言与另一台计算机的机器语言就不同。其次，用这种语言编写程序是非常单调乏味的，而且很难发现错误。现在我们将机器语言时代称为编程语言的第一代。

### 2. 汇编语言

编程语言中接下来的演化是伴随着用带符号或助记符的指令和地址代替二进制码而发生的。因为它们使用符号，所以这些语言首先被称为符号语言。这些助记符语言后来就被称为汇编语言。假想计算机用于替代机器语言的汇编语言(如表 2所示)显示在程序9-1中。

**表 2两整散相加的汇编语言代码**

|   汇编语言代码   |    说明    |
|:--------------|:---------:|
|LOAD RF Keyboard|从键盘控制器中取数，存到寄存器F中|
|STORE Number RF |把寄存器F中的内容存到Number1中 |
|LOAD RF Keyboard|从键盘控制器中取数，存到寄存器F中|
|STORE Number2 RF|把寄存器F中的内容存到Number2中 |
|LOAD R0 Number１|把Number１中的内容存入寄存器０中|
|LOAD R0 Number２|把Number２中的内容存入寄存器１中|
|ADDI R2 R0 R1|把寄存器0和寄存器1相加，结果放入寄存器2中|
|STORE Result R2   |把寄存器2的内容存入Result中    |
|LOAD RF Result    |把Result中的值放入寄存器F中  |
|STORE Monitor RF  |把寄存器F中的值放入显示控制器中|
|HALT            |  停止    |

称为**汇编程序**的特殊程序用于将汇编语言代码翻译成机器语言。


### 3. 高级语言

尽管汇编语言大大提高了编程效率，但仍然需要程序员在所使用的硬件上花费大部分精力。用符号语言编程也很枯燥，因为每条机器指令都必须单独编码。为了提高程序员效率以及从关注计算机转到关注要解决的问题，促进了高级语言的发展。

高级语言可移植到许多不同的计算机，使程序员能够将精力集中在应用程序上，而不是计算机结构的复杂性上。高级语言旨在使程序员摆脱汇编语言繁琐的细节。高级语言同汇编语言有一个共性它们必须被转化为机器语言，这个转化过程称为解释或编译(本章后面介绍)。

数年来，人们开发了各种各样的语育，最著名的有BASIC、COBOL、Pascal、Ada、C、C++ 和Java。程序9.1显示了两整数相加的C++ 语言代码。虽然程序看起来有点长，但有些代码行是文档(注释)。

**C++ 中的加法程序**

 ```c
/* The program reads two Integers from keyboard and prints their sum.
    Written by:
    Date:
*/
# include <iostream>
using namespace std;
int main()
{
    // Local Declarations 
    int number1;
    int number2;
    int result ;
    // Statements
    cin >> number1;
    cin >> number2;
    result = number1 + number2;
    cout << result;
    return 0;
} // main
 ```

## 翻译

当今程序通常是用一种高级语言来编写。为了在计算机上运行程序工程序需要被翻译成它要运行在其他的计算机的机器语言。高级语言程序被称为源程序。被翻译成的机器语言程序称为目标程序。有两种方法用于翻译：**编译和解释**。

### 1. 编译

编译程序通常把整个源程序翻译成目标程序。

### 2. 解释

有些计算机语言使用**解释器**把源程序翻译成目标程序。解释是指把源程序中的每一行编译成目标程序中相应的行，并执行它的过程。但是，我们需要意识到在解释中的两种趋势：在Java语言之前被有些程序使用的和Java使用的解释。

**1). 解释的第一种方法**

在Java语言之前的有些解释式语言(如BASIC和APL)使用一种称为解释的第一种方法的解释过程，因为缺少其他任何的名字，所以称为解释的第一种方法。在这种解释中，源程序的每一行被翻译成被其使用的计算机上的机器语育，该行机器语言被立即执行。如果在翻译和执行中有任何错误，过程就显示消息，其余的过程就被中止工程序需要被改正，再次从头解释和执行。第一种方法被看成是一种慢的过程，这就是大多数语言使用编译而不是解释的原因。

**2). 解释程序的第二种方法**

随着Java的到来，一种新的解释过程就被引入了。Java语言能向任何计算机移植。为了取得可移植性，源程序到目标程序的翻译分成两步进行：编译和解释。Java源程序首先被编译，创建Java的**字节代码**，字节代码看起来像机器语言中的代码，但不是任何特定计算机的目标代码，它是一种虚拟机的目标代码，该虚拟机称为Java虚拟机或JVM。字节代码然后能被任何运行JVM模拟器的计算机编译或解释，也就是运行宇节代码的计算机只需要JVM模拟器，而不是Java编译器。

### 3. 翻译过程

编译和解释的不同在于，编译在执行前翻译整个源代码，而解释一次只翻译和执行源代码中的一行。但是，两种方法都遵循图 1中显示的相同的翻译过程。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-1.png?x-oss-process=image/resize,w_700/sharpen,100)

**图 1 源代码翻译过程**

**1). 词法分析器**

词法分析器一个符号接一个符号地读源代码，创建源语言中的助记符表。例如，5个符号w、h、i、l、e被读入，组合起来就形成了C、C++ 或Java语言中的助记符while。

**2). 语法分析器**

词法分析器分析一组助记符，找出指令。例如，语法分析器使用助记符“x”、“=”、“0”创建C语言中的赋值语句“x=0”。

**3). 语义分析器**

语义分析督检查语法分析器创建的句子，确保它们不含有二义性。计算机语义通常是无二义性的，这意味着这一步骤或者是在**翻译器**中被省略，或者是其责任被最小化。

**4). 代码生成器**

在无二义性指令被语义分析器创建之后，每条指令将转化为一组程序将要在其上运行的计算机的机器语言。这个是由**代码生成器**完成的。

## 编程模式

当今计算机语言按照它们使用的解决问题的方法来分类。因此，模式是计算机语言看待要解决问题的一种方式。计算机语言可分成4种模式过程性(强制性)、面向对象、函数式和声明式。图 2总结了这些范式。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-2.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 2 编程语言分类**

### 1. 过程模式

在**过程式模式**(或**强制性模式**)中，我们把程序看成是操纵被动对象的主动主体。我们在日常生活中遇到许多被动对象石头、书、灯等。一个被动对象本身不能发出一个动作，但它能从主动主体接收动作。

过程式模式下的程序就是主动主体。该主体使用称为数据或数据项的被动对象。作为被动对象的数据项存储在计算机的内存中工程序操纵它们。为了操纵数据，主动主体工程序)发出动作，称之为过程。例如，考虑一个打印文件内容的程序，为了能被打印，文件需要存储在内存中(或一些像内存一样的寄存器中)。文件是一个被动对象或一个被动对象集合。为了打印文件工程序使用了一个称为print的过程。过程print通常包括了需要告诉计算机如何打印文件中每一个字符的所有动作工程序调用过程print。在过程式模式中，对象(文件)和过程(print)是完全分开的实体。对象(文件)是一个能接收print动作或其他一些动作(如删除、复制等)的独立实体。为了对文件应用这些动作中的任何一个，我们需要一个作用于文件的过程。过程print(或复制或删除)是编写的一个独立实体工程序只是触发它。

为了避免每次需要打印文件时都编写一个新过程，我们可以编写一个能打印任何文件的通用过程。当写这个过程时，对文件名的每个引用都被诸如F、FILE或其他之类的符号替代。当过程被调用(触发)时，我们传递实际要打印的文件名给过程，这样可以编写一个过程print，在程序中调用两次，打印不同的文件。图 3显示了程序如何能调用不同的预定义过程，打印或删除不同的目标文件。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-3.png?x-oss-process=image/resize,w_700/sharpen,100)   
**图 3过程式模式的概念**

我们需要把过程与程序触发区分开工程序不定义过程(后面解释)，它只触发或调用过程。过程必须巳经存在。

当使用过程式高级语言时工程序仅由许多过程调用构成，除此之外没有任何东西。这不是显而易见的，但即使使用像加试运算符(+)这样的简单数学运算符时，我们也是正在使用一个过程调用一个已经编写的过程。例如，当使用表达式A+B将两个对象A和B的值相加时，我们就是在调用过程add，传递两个对象的名字给过程。过程add需要两个作用于的对象。它把两个对象的值相加，返回结果。换言之，表达式A+B是add(A,B)的缩写。语言的设计者编写了这些过程，我们才能调用它。

如果我们考虑过程和被作用于的对象，那么过程式模式的概念就变得更为简单，且容易理解。这种模式的程序由三部分构成对象创建部分、一组过程调用和每个过程的一组代码。有些过程在语言本身中已经被定义。通过组合这些代码，开发者可以建立新的过程。

图 4显示了过程式程序的三个组成部分。在语言中也有额外的助记符用来界定或组织调用。但这个图中并没有显示出来。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-4.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 4 过程式程序的组成部分**

**一些过程式语言**

在过去的几十年中，一些高级强制性(过程式)语言发展(声明)起来，如FORTRAN、COBOL、Pascal、C和Ada。

(1) FORTRAN 命令

**FORTRAN** (FORmula TRANslation), 由 Jack Backus 领导下的一批IBM工程师所设计，于1957年变成商用的。FORTRAN是第一代高级语言。在过去的40年中，FORTRAN经历了多个版本 FORTRAN、FORTRAN II、 FORTRAN IV、 FORTRAN77、FORTRAN 99和HPF(高性能FORTRAN)。最新版本(HpF)用于高速多处理器计算机系统。FORTRAN所具备的一些特征使得40年后它仍然是科学或工程应用中的理想语言。这些特征概括如下：

* 高精度算法。
* 处理复杂数据的能力。
* 指数运算(a<sup>b</sup>)。

(2) COBOL

**COBOL**(COmmon Business-Oriented Language)由一批计算机专家在美国海军的(Grace Hopper)指导下设计出来。COBOL有一个特定的设计目标作为商业编程语言使用。商业环境中的问题完全不同于工程环境中的问题。商业中程序设计的要求概括如下:

* 快速访问文件和数据库。
* 快速更新文件和数据库。
* 生成大量的报表。
* 界面友好的格式化的输出。

(3) Pascal

**Pascal**由[Niklaus Wirth](https://en.wikipedia.org/wiki/Niklaus_Wirth)于1971年在瑞士的苏黎世发明，根据17世纪发明Pascaline计算器的法国数学家、哲学家Blaise Pascal来命名。Pascal设计时有一个特定目标通过强调结构化编程方法来教初学者编程。尽管Pascal成为学术中最流行的语言，但它从未在工业中达到同等流行的程度。现在的**过程化语言**归功于该语言。

(4) C
**C语言**是由贝尔实验室的Dennis Ritchie在20世纪70年代初期发明的。最初用于编写操作系统和系统软件(UNIX操作系统的大部分是用C编写)。后来，由于以下原因而在程序员中流行：

* C有一个结构化的高级编程语言应有的所有高级指令，使程序员无需知道硬件细节。  
* C也具有一些低级指令，使得程序员能够直接、快速地访问硬件。相对于其他高级语言，C更接近于汇编语言，这使得它对系统程序设计员来说是一种好语言。  
* C是非常有效的语言，指令短。这种简洁吸引了想编写短程序的程序员。

(5) Ada

**Ada**是根据Lord Byron的女儿Augusta Ada Byron和助手Charles Babbage(分析引擎的发明者)的名字来命名的。Ada是为美国防部(DoD)而开发的，并成为了所有DoD承包人使用的统一语言。Ada有3个特征使其成为DoD和工业的流行语言

* Ada有其他过程式语言那样的高级指令。
* Ada有允许实时处理的指令，从而便于过程控制。
* Ada具有并行处理能力，可以在具有多处理器的主机上运行。

### 2. 面向对象模式

**面向对象模式**处理活动对象，而不是被动对象。我们在日常生活中遇到许多活动对象汽车、自动门、洗盘机等。在这些对象上执行的动作都包含在这些对象中对象只需要接收合适的外部刺激来执行其中一个动作。

回到我们在过程式模式中的例子，在面向对象模式中的文件能把所有的被文件执行的过程(在面向对象模式中称为方法)打包在一起，这些过程有打印、复制、删除等。在这种模式中的程序仅仅向对象发送相应请求(打印、复制、删除等)，文件就会被打印、复制或删除。图 5说明了这样的概念。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-5.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 5 面向对象模式的概念**

这些方法被相同类型的所有对象共享。也被从这些对象继承的其他对象共享，如后面将讨论的。如果程序要打印文件File1，它只需要发送活动对象所需的刺激，文件File1就被打印。

比较过程式模式和面向对象模式(图 3和图 5)，我们看出过程式模式中的过程是独立的实体，但面向对象模式中的方法是属于对象领地的。

**类**

如图 5所示，相同类型的对象(如文件)需要一组方法，这些方法显示了这类对象对来自对象"领地"外的刺激的反应。为了创建这些方法，面向对象语言，如C十十、Java和C#(读作"C shap"。)使用称为**类**的单元，如图 6所示。程序单元的准确格式因不同的面向对象语言而不同(参见附录F)。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-6.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 6 类的组成**

**1). 方法**

总体上，方法的格式与有些过程式语言中用的函数非常相似。每个方法有它的头、局部变量和语句。这就意味着我们对过程式言所讨论的大多数特性都可以应用在为面向对象程序所写的方法上。换言之，我们可以认为面向对象语言实际上是带有新的理念和新的特性的过程式语言的扩展。例如，C++ 语言就是一个面向对象的C语言的扩展。C++ 语言甚至可以作为不需要或极少使用对象的过程式语言使用。Java语言是 C++ 的扩展，但它是一个完全的面向对象的语言。

**2). 继承性**

在面向对象模式中，作为本质，一个对象能从另一个对象继承。这个概念被称为继承性。当一般类被定义后，我们可以定义继承了一般类中一些特性的更具体的类，同时这些类具有一些新特性。例如，当一个几何形状类被定义后，我们就可以定义称为矩形的类。矩形是具有额外特性的几何形状。

**3). 多态性**

**多态性**意思是“许多形状”在面向对象模式中的多态性是指我们可以定义一些具有相同名字的操作，而这些操作在相关类中做不同的事情。例如，我们定义了两个类矩形和圆，都是从几何形状类继承下来的。我们定义名字都为area的两个操作，一个在矩形类中一个在圆类中。它计算矩形或圆的面积。两个操作有相同的名字，但做不同的事情，因为计算矩形的面积和计算圆的面积需要不同的操作数和操作。

**4). 一些面向对象语言**

人们已经发明了一些**面向对象语言**。我们简要讨论其中两种语言的特性：C++ 和Java。

(1) C++

**C++ 语言**语言是由贝尔实验室Bjarne stroustrup等人开发出来的，是比C语言更高级的一种计算机编程语言。它使用类来定义相似对象的通用属性以及可以应用于它们本身的各种操作。例如工程序员可以定义一个几何体类(Geometrical Shapes)和所有二维图形所共用的属性，如中心、边数等。这个类也可以定义出可以应用于几何体本身的操作(函数或方法)，例如，计算并打印出面积、周长、中心点的坐标等。一个程序可以创建不同几何体类的对象，每个对象有不同的中心点和边数工程序可以为每个对象计算并打印出面积、周长和中心坐标等。

C++ 语言的设计遵循三条基本原则特性封装、继承和多态。

(2) Java

**Java**是由Sun Microsystems公司开发的，它在C和C++ 的基础上发展而来，但是C++ 的一些特性(如多重继承等)从语言中被移除，从而使Java更健壮。另外，该语言是完全面向类操作的。在C++ 中，你甚至可以不用定义类就能解决问题。而在Java中，每个数据项都属于一个类。

Java中的程序可以是一个应用程序也可以是一个**小程序**。应用程序是指一个可以完全独立运行的程序。小程序则是嵌入在超文本标记语言中的程序，存储在服务器上并由浏览器运行。浏览器也可以把它从服务器端下载到本地运行。

在Java中，应用程序(或小程序)是类以及类实例的集合。Java自带的丰富类库是它的有趣特征之一。尽管 C++ 也提供类库，但在Java中用户可以在提供的类库基础上构建新类。

在Java中工程序的执行也是独具特色的。构建一个类并把它传给编译器。由编译器来调用类的方法。Java的另一大有趣的特点是**多线程**。线程是指按顺序执行的动作序列。C++ 只允许单线程执行(整个程序作为单线程)，但是Java允许多线程执行(几行代码同时执行)。

### 3. 函数式模式

在**函数式模**式中程序被看成是一个数学函数。关于这点，**函数**是把一组输入映射到一组输出的黒盒子(图 7)。

例如，求和可以被认为是具有n个输入和1个输出的函数。该函数实现n输入值相加得到总和并最终输出求和结果。**函数式语言**主要实现下面的功能：

1) 函数式语言预定义一系列可供任何程序员调用的原始(原子)函数。  
2) 函数式语言允许程序员通过若干原始函数的组合创建新的函数。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-7.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 7 函数式语言中的函数**

例如，定义一个称为first的原始函数，由它来完成从一个数据列表中抽取第一个元素的功能。再定义另一个函数rest，由它完成从一个数据列表中抽取出除第一个元素以外的所有元素。通过两个函数的组合使用，可以在一个程序中定义一个函数来完成对第三个元素的抽取，如图 8所示。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-8.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 8 提取列表中的第三个元素**

函数式语言相对过程式语言具有两方面优势它支持模块化编程并且允许程序员使用已经存在的函数来开发新的函数。这两个因素使得程序员能够编写出庞大而且不易出错的程序。

**一些函数式语言**

我们以LISP和Scheme为例来简要介绍函数式语言。

(1) LISP

表处理解释语言(LISt Programming, LISP)是20世纪60年代早期由麻省理工学院科研小组设计开发的。它是一种把表作为处理对象的语言。

(2) Scheme

表处理解释语言没有统一标准化。不久之后，就有许多不同的版本流传于世。实际使用的标准是由麻省理工学院在20世纪70年代早期开发的，称为**Scheme**。

Scheme语言定义了一系列原始函数来解决问题。函数名和函数的输入列表写在括号内，结果是一个可用于其他函数输入的列表。例如，有一个函数car，用来从列表中取出第一个元素。第二个函数cdr,用来从列表中取出除第一个元素以外的所有元素。两个函数如下

>(car 2 3 7 8 11 17 20)→ 2  
>(cdr 2 3 7 811 17 20 )→ 3 7 811 17 20

现在可以通过组合这两个函数来完成从列表中取出第三个元索的函数。

>(car ( cdr ( cdr list ) )

如果将上面的函数应用于列表2 3 7 8 11 17 20，结果是取出7。我们来分析一下，最里面的括号取出列表3 7 811 17 20。中间一层括号取出列表7 811 17 20。再通过函数car取出该列表的第一个元素7。

### 4. 说明式模式

说明式模式依据逻辑推理的原则响应查询。它是在由希腊数学家定义的规范的逻辑基础上发展而来的，并且后来发展成为一阶谓词演算(first-order predicate calculus)。

逻辑推理以推导为基础。逻辑学家根据已知正确的一些论断(事实)，运用逻辑推理的可靠的准则推导出新的论断(事实)。例如，逻辑学中著名的推导原则如下

>If ( A is B ) and ( B is C ), then A is C

将此原则应用于下面的事实

>事实1: Socrates is a human A is B
>事实2: A human is mortal B is C

我们可以推导出下面的事实

>事实3: socrates is mortal A is c

程序员需要学习有关主题领域的知识(知道该领域内的所有已知的事实)或是向该领域的专家获取事实工程序员还应该精通如何逻辑上严谨地定义准则。这样程序才能推导并产生新的事实。

说明性语言也有自身的**缺憾**，那就是有关特殊领域的程序由于要收集大量的事实信息而变得非常庞大。这也是说明性程序迄今为止只局限于人工智能等领域的原因。

**Prolog**

最著名的说明性语言是Prolog(PROgramming in LOGIc)，它是由法国人A.Colmerauer于1972年设计开发的。Prolog中的程序全部由事实和规则组成。例如，关于人类最初事实可陈述如下:

```
human (John)
mortal (human)
用户可以进行询问:
?-mortal (John)
```

程序会响应yes。

##  共同概念

在这一节，我们通过对一些过程式语言的快速浏览，发现共同的概念。这些概念中的一些对大多数面向对象语言也适用，这是因为当创建方法时面向对象模式使用过程式模式。

### 1. 标识符

所有计算机语言的共同特点之一就是都具有标识符，即对象的名称。标识符允许给程序中对象命名。例如，计算机中每一个数据都存储在一个唯一的地址中。如果没有标识符来符号化代表数据的位置，你就不得不去了解并直接使用数据的地址来操纵它们。取而代之，只要简单给出数据的名字就可以让编译器去跟踪数据实际存放的物理地址。

### 2. 数据类型

**数据类型**定义了一系列值及应用于这些值的一系列操作。每种数据类型值的集合称为数据类型的域。大多数语言都定义了两类数据类型：简单数据类型和复合数据类型。

**1). 简单数据类型**

**简单数据类型**(有时称为原子类型、基本类型、标量类型或内建类型)是不能分解成更小数据类型的数据类型。**强制性语言**已经定义一些简单数据类型:

* **整数类型**是不包括小数部分的完整的数。整数的取值范围依赖于语言。有些语言支持多种整数大小。
* **实数类型**是带小数部分的数字。
* **字符类型**是被语言使用的潜在字符集中的符号，例如，ASCII或Unicode。
* **布尔类型**是只取两个值(真或假)的数据类型。

**2). 复合数据类型**

复合数据类型是一组元素，其中每个元素都是简单数据类型或复合数据类型(这是递归定义)。大多数语言定义了如下的复合数据类型：

* **数组**是一组元素，其中每个元素具有相同类型。
* **记录**是一组元素，其中的元素可以具有不同的类型。

**3). 变量**

**变量**是存储单元的名字。每个内存单元在计算机中都有一个地址。虽然计算机内部使用地址，但对程序员而言却十分不方便，首先工程序员不知道内存中数据项的相对地址。其次，数据项在内存中可能占据多个地址。名字(作为地址的替代)使程序员解放出来，只需在程序如何执行的层次上考虑工程序员可以使用一个变量，(如score)来保存测试中得到的整型数值。既然变量含有一个数据项，那它就有类型。

(1) 变量声明

大多数过程式语言和面向对象语言要求变量在使用前被声明。声明警告计算机被赋予名字和类型的变量将在程序中使用。计算机预留出要求的存储区域，并命名它。我们在前一节讨论过，声明是对象创建的一部分。例如，在C、C++ 和Java中，我们可以定义三种变量数据类型——字符、整数和实数，它们显示如下

```
char C;
int num;
double result;
```

第一行声明了一个具有字符类型的变量Ci第二行声明整数类型变量num ;第三行声明实数类型变量result.

(2) 变量初始化

虽然存储在变量中的数据值在程序执行过程中可能改变，但大多数过程式语言允许变量在它声明时进行初始化。初始化就是在变量中存储一个值。下面显示了变量如何同时被声明和初始化。

```
char C=''Z'';
int num=123;
double result =256,782;
```

**4). 字面值**

字面值是程序中使用的预定义的值。例如，当半径存储在变量r中，需要计算圆的面积时，可以使用表达式3.14 × r<sup>2</sup>，其中π(pi)的近似值就是被用作字面值。在大多数程序设计语言中，可以有整数、实数、字符和布尔字面值，还可以有字符串字面值。为了把字符和字符申字面值从变量名和其他对象中区分开，大多数语言要求字符字面值被括在单引号中，如冒，而字符串字面值被括中双引号中，如”Anne“。

**5). 常量**

字面值被看作一种不好的编程实践，除非我们能确信字面值的值将不会随时间而改变(如几何中π的值)。但是，大多数字面值都会随时同而改变它的值。例如，销售税今年是8%，明年可能就不相同。当我们写程序计算事物的费用时，我们就不应该在程序中使用面值。

```
cost ← price × 1. 08
```

由于这个原因，大多数编程语言定义**常量**。常量(像变量一样)是一个可以存储值的命名的位置。但值在程序开始处被定义后就不能改变。但是，如果下一年我们需要再次使用这个程序，可以只改变程序开始处的一行常量的值。例如，在C或工程序中，税率能在开始处被定义，而在程序中被使用。

```
const float taxMultiplier = 1.08;
...
cost = price * taxMultiplier;
```

注意常量(像变量一样)有类型。当常量被声明时，要定义它的类型。

**6). 输入和输出**

几乎所有的程序都需要输入和(或)输出数据。这些操作将比较复杂，尤其是对大的文件进行操作时。大多数程序设计语言使用一些预先定义好的函数完成输入和输出。

(1) 输入

数据或者通过语句或者通过预先定义的函数来完成输入。C语言有几个输入函数。例如，scanf函数用来从键盘读取数据并格式化，把它存储在一个变量中。下面是一个例子

``` c
scanf("%d",&num);
```

当程序遏到该函数指令时工程序等待用户输入一个整数。然后将这个值存储在变量num中。%d告诉用户程序需要一个整型数值。

(2) 输出

数据或者通过语句或者通过预先定义的函数来完成输出。C语言有几个输出函数。例如，printf函数能够在显示器上输出一个字符串。程序员可以将一个或几个变量变为字符串的一部分。下面的语句表示在文本字符串的末尾显示一个变量的值。

>printf("The value of the number is :  %d", num);

**7). 表达式**

表达式是由一系列操作数和运算符简化后的一个单一数值。例如，下面是一个值为13的表达式:

>2  *  5 + 3

(1) 运算符

运算符是用来完成一个动作的特定语言的语法记号。最为熟悉的一些运算符都是从数学中得到的。例如，乘法(*)是一个运算符，表示两个数相乘。每一种语言都有运算符，并且它们在语法或规则等方面的使用是严格定义的。

* **算术运算符**被用在大多数语言中。表 3显示了一些用于C、C++和Java中的算术运算符。


**表 3 算术运算符**

|   运算符   |   定义   |   例子   |
|:---------:|:---------:|:---------:|
|   +       |  加   |3+5  |
| -  |减  |2-4|
|    *   |    乘    | Num * 5 |
|   /   |除（商）  |  Sum/Count  |
|   %   |  除（取余） |  Count%4  |
|   ++  |  递增（变量值加1)  | Count ++  |
|  --  |   递减（变量值减1）   |

* 关系运算符用于比较两个数据的大小关系。关系运算符的结果是逻辑值（true或false）。C、C++ 和Java语言使用6种关系运算符，如表 4 所示：

**表 4 关系运算符**

| 运算符 | 定义 | 例子 |
|:---:|:---:|:---:|
| <  |  小于 | Num1<5  |
| <=  | 小于等于  |Num1<=5   |
| >  | 大于  |Num2>3   |
| >=  | 大于等于  | Num2>=3  |
| ==  | 等于  | Num1==Num2  |
| !=  | 不等于  | Num1!=Num2 |

* **逻辑运算符**是逻辑值(true或false)组合后得到的一个新值。C语言使用如表 5所示的3种逻辑运算符。

**表 5 逻辑运算符**

| 运算符 | 定义 | 例子 |
|:---:|:---:|:---:|
| ! | 非 | !(Num1<Num2) |
| && | 与 | （Num1<5)&& (Num2>10) |
| \|\|  | 或  | (Num1<5)\|\|(Num2>10)  |

(2) 操作数

**操作数**接收一个运算符的动作。对于任何一个运算符可能有1、2或更多个操作数。举个算术的例子，除法运算的操作数是被除数和除数。

### 3. 语句

每条语句都使程序执行一个相应动作。它被直接翻译成一条或多条计算机可执行的指令。例如，C、C++ 和Java定义了许多类型的语句。在本节·我们将对其中一些加以讨论。

(1) 赋值语句

**赋值语句**给变量赋值。换言之，它存储一个值在变量中，该变量是在声明部分巳经被创建的。在我们的算法中使用符号“←”定义赋值。大多数语言(像C、C++ 和Java)使用“=”。来赋值。其他语言(像Ada或Pascal)使用“：=”来赋值。

(2) 复合语句

复合语句是一个包含0个或多个语句的代码单元。它也被称为块。复合语句使得一组语句成为一个整体。复合语句一般包括一个左大括号、一个可选语句段以及一个右大括号。下面是一个复合语句的例子。
```
{
    x = 1 ;
    y = 20 ;
}
```

(3) 控制语句

控制语句是语句的集合，它在过程式语言中作为一个程序执行。语句通常是一句接一句被执行的。但是，有时需要改变这种顺序的执行。例如，去重复一句或一组语句，两组语句的执行依赖于布尔值。在计算机机器语言中，为这种背离顺序执行所提供的指令称为jump指令。早期的强制性语言使用go协语句来模拟jump指令。虽然如今go to还能在一些强制性语言中看到，但结构化编程原则不倡导使用它。相反。结构化编程强烈推荐使用三种结构顺序、选择和重复。强制性语言中的控制语句与选择和重复有关。

* 大多数强制性语言都有两路和多路选择语句。两路选择通过i向lse语句取得多路选择通过switch(或case)语句取得。图 9显示了if-else语句的UML图和代码。在if-else语句中，如果条件为真，语句1被执行，而如果条件为假，语句2被执行。语句1和语句2都可以是任何类型的语句，包括空语句或复合语句。图 9还星示了switch(或ca1e)语句的代码。C的值决定了语句1、语句2或语句3中哪一个被执行。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-9.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 9 两路记而多路判断**

* 我们论过重复结构。大多数强制性语言都定义了1～3个能实现重复的循环语句。C、C++ 和Java定义了3个循环语句，但它们都可以使用while循环来模拟(图 10)。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-10.png?x-oss-process=image/resize,w_650/sharpen,100)   
**图 10 三种类型的重复**

C语言中主要的重复语句是while循环。while循环是一个预先检查的循环，它检查清试表达式的值。如果值为真，则进入循环迭代一次，然后再检测。while循环被认为是事件控制循环。循环将一直持续到一个事件发生，即将被测表达式的值从真变为假。

for循环同样也是一个先测试循环。但是与while循环不同的是，它是一个计数器控制循环，计数器被初始化为一个初值，然后在每一次迭代中增加(或减少)。当计数器的值达到预定值时循环终止。

do循环也是一个事件控制循环，但是与whi1e循环不同的是，它是一个后测试循环。循环进行一次迭代后，测试表达式的值。如果是假，则终止。如果是真，就再进行一次循环而后再测试。

**子程序**

完成单一任务的这些过程的子集能集合在一起，放在它们自己的程序单元中，就是子程序。因为子程序使程序变得更结构化，所以这是非常有用的。完成特定任务的子程序能一次编写，多次调用。就像在编程语言中的预定义过程一样。

子程序也能使程序更容易。在增量程序开发中工程序员可以通过在每一步增加一个子程序一步步测试程序。在编写下一个子程序前进行测试，这能帮助检查错误。图 11 说明了子程主程序序的概念。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-11.png?x-oss-process=image/resize,w_650/sharpen,100)  
**图 11 子程序概念**

(1) 局部变量

在过程式语言中，就像主程序一样，子程序能调用预定义的过程，在局部对象上操作。当子程序每次被调用时，这些局部对象或**局部变量**被创建，当控制从子程序返回时被销毁。局部对象属于子程序。

(2) 参数

子程序仅仅作用于局部变量是非常少见的。大多数时候主程序需要子程序作用于由主程序创建的一个对象或一组对象。在这种情况下工程序和子程序使用参数。在主程序中称为实际**参数**，在子程序中称为形式参数工程序可以通过下列两种方法之一来给子程序传递参数：

* 传值
* 传引用

下面解释它们。

(3) 传值

在传值参数中，主程序和子程序创建两个不同的对象(变量)。在程序中创建的对象属于程序在子程序中创建的对象属于子程序。因为作用域不同，所以相应的对象可以有相同的名字或不同的名字。主程序和子程序的通信是单方向的，从主程序到子程序。主程序传递实际参数的值，存储到子程序中相应的形式参数中。从子程序到主程序没有参数的通信。

**▷ 例 1** 假定子程序是为主程序完成打印的。当每次主程序需要打印值时，它把值传递给子程序并打印出来。主程序有它自己的变量X，子程序也有它自己的变量A。从主程序传递给子程序的是变量X的值。这个值被存储在子程序的变量A中，子程序随后要打印它

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-12.png?x-oss-process=image/resize,w_650/sharpen,100)

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-12.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 12 传值的例子**

**▷ 例 2** 在例 1中，既然主程序是发送一个值到子程序，那么为了这个目的就不需要一个变量主程序可以仅发送一个字面值给子程序。换言之，主程序可以用print(X)或print(5)调用子程序。

**▷ 例 3** 传值在现实生活中的一个类推是当一位朋友需要借或读一本你写的有价值的书。因为书是珍贵的，或可能已售完，你把书复印了一份，送给了你的朋友。任何对副本的损坏都不会影响你的书。

传值有个优点子程序接收的仅仅是个值。它不能改变(有意的或无意的)主程序中变量的值。但是，当程序实际上要求子程序这样做时，子程序不能改变主程序中变量的值就变成了缺点。

**▷例 4** 假定主程序有两个变量X和Y,需要交换它们的值。主程序调用子程序swap来完成。它传递X和Y的值给子程序，它们被存储在两个变量A和B中。swap子程序使用局部变量T(临时)，交换A和B中的两个值。但X和Y中的原始值保留原样：它们并没有交换。在图 13中说明这些。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-13.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 13 传值并不起作用的例子**

(4) 传引用

**传引用**被设计来允许子程序改变主程序中变量的值。在传引用中，变量(实际上它是内存的地址)被主程序和子程序共享。相同的变量可能在主程序和子程序中有不同的名字，但两个名字是指向同一个变量。我们可以形象地把传引用看成是有两个门的盒子，一个开在主程序i另一个开在子程序。主程序可以把值留在盒子里给子程序，子程序可以改变这个原始的值，并留个新值给主程序。

**▷ 例 5**  如果使用同样的swap子程序，但让变量使用传引用，X和Y中的两个值实际上被交换，如图 14所示。

![image](https://img-camp.banyuan.club/online/foundation/chapter9/9-14.png?x-oss-process=image/resize,w_650/sharpen,100)

**图 14 传引用的例子**

(5) 返回值

子程序可以被设计成返回一个值或几个值。这是预定义过程被设计的方法。当使用表达式C ← A+B时。实际上调用过程add(A,B)，该过程返回一个值，并存储在变量C中。

(6) 实现

子程序概念在不同的语言中被不同地实现。在C和 C++ 中，子程序被实现为**函数**。


## 小结

* 计算机语言是一组预定义的单词，按照预定义的规则(语言的语法)，这些单词被组合进一个程序中。经过多年的发展，计算机语言已经从机器语言演化到高级语言。计算机能理解的唯一语言是机器语言。
* 高级语言对许多不同的计算机是轻便的，它允许程序员专注于应用，而不是计算机组织的复杂性。
* 为了在计算机上允许一个程序，程序需要被翻译成计算机本地的机器语言。髙级语言程序称为源程序。翻译过来的机器语言程序称为目标程序。两种方法被用来翻译：编译和解释。编译器把整个源程序翻译成目标程序，解释是指一行接一行地把源程序的每一行翻译成相应目标程序行，并执行它们的过程。
* 翻译过程使用词法分析器、语法分析器、语义分析器和代码生成器来产生助记符表。
* 模式描述了计算机语言被用来处理要解决问题的方法。我们把计算机语言分成4种模式:过程式、面向对象、函数式和说明式。过程式模式把程序看作操作被动对象的活动对象。FORTRAN、COBOL、Pascal、C和Ada都是过程式语言的例子。面向对象模式处理活动对象，而不是被动对象。C++ 和Java是常见的面向对象语言。在函数式模式中，程序被看作数学函数。在上下文中，函数是把一组输入映射到一组输出的黑盒子。LISP和Scheme是常见的函数式语言。说明式模式使用逻辑推理原则来回答问题。一个最有名的说明式语言是PROLOG。
* 在过程式和面向对象语言中的一些常见概念有：***标识符、数据类型、变量、字面值、常量、输入和输出、表达式和语句***。大多数语言使用两类控制语句：判断和重复。子程序是过程式语言间的共同概念。

## 作业

1. 汇编语言与高级语言有哪些区别?
2. 哪种计算机语言与计算机直接相关，并被计算机理解?
3. 区分编译和解释。
4. 列出编程语言翻译中的4个步骤。
5. 列出4种常见的计算机语言模式。', 8, 1, NULL, '2020-05-21 18:21:33.756154', '2020-05-21 18:21:33.756154', 0);
INSERT INTO public.article (id, name, period, course_id, style, html, content, seq, level, creator_id, created_at, updated_at, parent_id) VALUES (1, '写在课程之前', NULL, 10, NULL, NULL, '## 课程目的

C语言是计算机中最基础的高级编程语言，是***训练程序思维***和***理解计算机原理***最佳的语言。

**训练程序思维** C语言概念少、词汇少，思想简单，可谓短小精悍。初学者更容易集中精力在程序逻辑、数据结构和算法本身。编程思维是相通的，通过C语言奠定扎实的基础，以后学习Java、Python等其他语言，会触类旁通，7 天了解一门新语言不是神话。

**理解计算机原理** C语言可以说是最接近硬件的高级语言，执行效率高，常用来做底层开发。特别是在直接操作内存时候，你能深刻感受到冯诺依曼模型在编程中的映射，这些底层逻辑的实践到底决定了你的发展高度，也决定了你的职业生涯。

## 课程介绍

本教程专为没有语言基础的初学者设计，全篇围绕一个 Vending Machine（自动售货机）虚拟项目展开，内容涵盖所有基础编程知识点，在课程学完后可以掌握开发 Vending Machine 的所有技术，并能独立开发完成。

另外，Vending Machine 项目中使用严谨的代码规范、代码组织、第三方库的引用和构建脚本，旨在使读者树立全面的软件工程意识、熟悉软件过程中编程以外的活动，非常贴近企业实战，这为有志于深耕C语言领域的读者打下了坚实的铺垫，这和大学里C语言教学是有本质区别的。

本课如不做特别说明，所有代码、工具都是基于 macOS 下运行，后面将不再赘述。

* 本课源代码在 https://git.banyuan.club/scm/c/c.git
* Vending Machine 的源代码在 https://git.banyuan.club/scm/c/simulator.git

## 预备知识

* 英文打字速度不低于 30 Words/分钟；
* 熟练 macOS 的基本操作、快捷键操作；
* 熟悉 macOS 下使用 brew 安装软件；
* 熟练 macOS 命令行操作：增删改查文件和目录、编写脚本执行批处理操作；
* 会用Markdown 记录学习笔记，养成习惯；
* 会使用文本编辑器：[Sublime Text](https://www.sublimetext.com/)；
* 会使用 GIT 下载网络资源；
* 理解计算机之冯诺依曼模型；

如果你是一个小白用户，通常在修完如下前置课程，就可以掌握上面提及的这些预备知识。

## 前置课程

* 《半圆入学预备课》

* 《计算机科学导论》（微缩版）

## C语言介绍

### 语言特点

* C语言是一门结构化高级编程语言，语言简洁、紧凑；
* C语言是一门编译型语言，运行效率高；
* 靠近硬件，易于处理计算机底层的操作。

### 应用领域

C语言主要用于较底层的开发，例如：

- Windows、Linux、Unix 等操作系统的内核90%以上都使用C语言开发；

- 开发硬件驱动，让硬件和操作系统连接起来，这样用户才能使用硬件、程序员才能控制硬件；

- 单片机和嵌入式属于软硬件的结合，有很多使用C语言的地方；

- 开发系统组件或服务，用于支撑上层应用；

- 开发其他语言：比如PHP、Python 等都是用C语言开发出来；

- 如果对软件某个模块（例如算法和搜索部分）的效率要求较高，也可以使用C语言来开发。

  ', 0, 1, NULL, '2020-05-21 18:21:30.652869', '2020-05-21 18:21:30.652869', 0);
