---
title: 约瑟夫环——春晚魔术表演原理解析
date: 2024-02-10 16:23:45
tags: [数学, 学术, 整活]
headimg: https://pica.zhimg.com/80/v2-bb68dd52b427d97ca4387c2ea0f9e6db_1440w.webp?source=2c26e567
---

![](https://pica.zhimg.com/80/v2-bb68dd52b427d97ca4387c2ea0f9e6db_1440w.webp?source=2c26e567)

（操作没成功の尴尬，图片来自[知乎](https://www.zhihu.com/question/643785170/answer/3392131270?utm_psn=1739686324138045440 "知乎")）

### 前言

这篇文章从数学方面推导刘谦2024年央视春晚上表演的第二个魔术的秘密、分析尼格买提错误之处，并在已知信息的加持下尝试推测尼格买提手上所剩的两张半面扑克牌的牌型。~~有一说一撒贝宁是真的会测假~~

对应魔术节目：《守岁共此时》的回看请[戳这里](https://chunwan.cctv.com/2024/dianbo/index.shtml?spm=C88599.PWGXKLPFsttR.E2wDlyDLim95.1 "戳这里")，在一小时十分整处。

### 魔术步骤

1. 四张牌面向下，并打乱。
2. 对折四张牌，并沿折痕撕开，得到两批半牌，每批四个共八个半牌 （反过来折是为了方便撕开）。将左右手的两批牌按同一个方向叠在一起。
3. 根据自己名字的字数，从上端挨个拿出一个牌放到最底端，执行字数次。
4. 拿起最上面三张，插进其他牌的中间（意思是这三张看作一个整体，不能放在最上面或者最下面，必须夹在其他牌中间）。
5. 拿起最上边的牌，藏起来不要看~~魔术常规操作之不要看~~。
6. 继续从最上边拿牌：南方人拿一张、北方人拿两张、不确定就拿三张。然后像第四步那样插进中间位置。
7. 还是从最上边拿牌：男生拿一张、女生拿两张。然后将拿出的牌扔出去。
8. 「见证奇迹的时刻」——每一次操作，将最上边的牌移到最下边，每次仅移动一张牌，进行七次。
9. 「好运留下来，烦恼丢出去」——对于每次操作：第奇数次，将牌移到最下边；第偶数次，丢出去。最后直到只剩一张牌
10. 最后拿出藏起来的牌，如果你的名字在四个字及以内、且操作无误，你会发现这两张半牌是严丝合缝的，他们可以拼成一张牌！

### 列数模拟

先不管你拿了哪几张牌，也不管打乱前它们的先后顺序如何——因为它们都跟魔术本身、也和我们的推导无关。我们只着眼于打乱后的牌，将它们按照上下依次编号为1~4。如下图：

`1234`

沿折痕撕开，假设第1号牌撕成的两张半牌编号为1和A（数字在上字母在下），八张半牌叠在一起，得到的牌堆是这样的：

`1234ABCD`

接下来的推导就围绕上面这个牌堆开展。

对应第三步——从上边拿出和自己名字字数相同的牌，放到最下边。假如我拿出三张，也就是编号为1、2、3的三张牌，放到最下边。牌堆变成这样：

`4ABCD123`

第四步——再拿出最上边三张牌，卡到中间去：

`CD4AB123`

第五步——藏起最上边的牌，也就是编号为C的牌。

第六步——根据南北方人拿牌。~~因为我祖籍北方出生在南方~~，我这里就拿三张牌插入到中间位置（B和1之间）：

`ABCD4123`

我是男生，丢最上边的一张牌，也就是说丢出编号为A的那张（此时内心默默丢掉了两张牌）：

男：`BCD4123` 女：`CD4123`

然后是见证奇迹的时刻。此时男生手里剩下7张牌、女生则是6张。这里其实无需说出那句咒语：如果你是男生，就不做操作；如果是女生，就将最上边的牌放到最下边。

男：`BCD4123` 女：`D4123C`

最后是好运留下来、烦恼丢出去。按照规则，我们要轮流进行两个操作：移动最上边的牌到最下边、丢掉最上边的牌。如此操作直到只剩下一张牌。这其中涉及到一个知识点——**约瑟夫环问题**

### 约瑟夫环问题

[百度百科 约瑟夫问题](http://https://baike.baidu.com/item/%E7%BA%A6%E7%91%9F%E5%A4%AB%E9%97%AE%E9%A2%98 "百度百科 约瑟夫问题")

简而言之，就是从特定编号出发，每经过$n$个数便将此时的数字挑出，剩下的数重新编号（保证起始编号相同），问最后剩下的编号是什么。这个环节的操作在这个例子下可以被抽象成：从D开始，每两次操作，丢出第二张牌。

也就是说，七个人围成一圈，“1、2、1、2……”的报数，最后剩下的是几号。这里有一个巧算的方法，适用于“1、2、1、2……”报数模型。首先找出不大于人数7的最大的2的整数幂，因为$2^2=4$，所以令$t=7-4=3$。**当最终剩下$2^k$个人的时候，第一个报数的就是最后一个被留下的**，因此有公式：$2t+1=7$。

对于男生，最后剩下的牌就是最下边的那一个，编号`3`。

对于女生，剩下的是第$2\times(6-4)+1=5$个，同样是`3`。

拿出藏起来的牌C，我们开头就知道了：第三张牌被分成了3和C。也就是说它们可以拼合成同一张牌！魔术成功了！

### 回顾总结

不妨从一开始就观察`3`和`C`的变换规律，可以发现`3`号牌自从第三步结束后被移动到最下边以来就几乎没改变过位置；而前四步则是合力将`C`拉到了最前边好让它被顺利地挑出去。然而最为精妙的还是对“1、2、1、2……”报数约瑟夫环模型的应用。那么为什么尼格买提的操作会失败呢？看下图：

如果你是罕见的“第三性别”，想要在第七步里面丢三张牌，也是可以的，因为这样并不会改变最后一张牌`3`。事实上，这个魔术最多可以在第七步丢掉七张牌，这样下来就只会剩下一张牌`3`，全部完成之后还是可以和`C`配对成功的。

![](https://pic.imgdb.cn/item/65c753f19f345e8d0372d304.png)

右上角是他的操作：他在“南方人和北方人”的操作里拿了三张牌，但是插入的时候错误将其中两张牌插到了最下边并且这两张牌和另外的那一张牌分开了（原规则是一起插到中间）。

因此这堆牌的底端变成了**黑桃Q**，不久之前，他藏起了一张**黑桃A**。所以，他最后拿出的牌是对不上的，一张是黑桃A，一张是黑桃Q。

下面是从班级群里偷的几张图，以实际证明这个理论是成功的：

![](https://pic.imgdb.cn/item/65c7596f9f345e8d0384ccf5.jpg)

当然，如果就某位“客串见证人”的失误而大做文章的话，显然是极其招人嫌恶的。刘谦本人的魔术并没有什么问题，尼格买提可能也只是太过关注自己接下来在春晚上的表现而有些分神罢了。如果这个失误真的导致2025年春晚刘谦不被总导演邀请上台的话，这种毫无底线夸大其词的舆论只会是雪上加霜，让所有人更不好过而已……事后小尼本人也道了歉，因此已经没有必要再抓住谁人的过错不放，只是从科学的角度出发，论证这个魔术的成功之处。毕竟少有节目能如此调动起屏幕内外所有人的互动热情，如此看来，刘谦的魔术也是非常成功的了。