---
title: CSP-J 2023 游记
date: 2023-10-24 16:21:36
tags: [CSP-J, 赛后总结]
headimg: 'https://pic.imgdb.cn/item/6546e03dc458853aef58100d.jpg'
---

~~又名：《第一次考就被小学生薄纱的一集》~~

本次考场：绵阳东辰国际学校

## 第一节&nbsp;&nbsp;&nbsp;&nbsp;赛前准备

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;插一句：CSP-J 2023没有设置赛前试机环节（包括CSP-S，成都绵阳都这样），个人推测可能是由于开放自选Windows和Linux系统带来的结果。如果你听见诸如：*不要操作电脑，违者将作作弊处理* 的话时，请将你按捺不住的双手安稳的放在双腿上，避免出现意料之外的事来。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**然而赛前试机仍然是必要的一环（但是如果考场纪律有要求那就算了）**，因为这样可以让选手对机器有一个初步的了解。因为我本人习惯使用`Win+E`打开文件系统管理器，用`Win+V`记录剪切板数据，可是这些功能在考场电脑上都无法使用，进行赛前试机不仅可以避免因赛时临时发现无法使用某些功能而带来的苦恼~~心态爆炸点+1~~，而且还可以将IDE环境调整到个人喜欢的状态（例如缺省源代码，相当于每次新建代码不用重新打头文件）。选手可以不占用正式比赛时间完成一些个性化操作，方便赛时操作，其重要性不言而喻。

~~当然，开赛前乱猜试题PDF密码是极其无意义且几乎不可能成功的一件事，更不要使用暴力破解密码工具破解文件（相信守规矩的你也不会将这种工具带进考场里来），这么做不仅会被当做作弊者处理，而且造成的数据丢失也只能由你自己负责。~~

## 第二节&nbsp;&nbsp;&nbsp;&nbsp;开赛之初

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**考场下发的PDF文件带有密码保护，输入时请务必瞪大眼睛区分大小写字母O、o与数字0；小写字母l、大写字母I与数字1，并且将其中的特殊字符认真核对一遍**。本次考试，我有幸将密码中的数字0写成了小写字母o，于是浪费了宝贵的2分钟时间改正密码（真实情况是监考老师在黑板上书写密码时字迹不规范导致的混淆）。因此需要认真看好你的密码。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;就我认为：**在一开始就仔细写好文件重定向输入输出是极其重要的**，因为随着考试时间的推进，你的思考重点将从细节性问题变为如何拿到更多的分数上~~骗分~~。你就会忽略重新写上两行重定向IO的代码，因而可能Au->Cu，光荣AFO。为了引起你的注意，使用极长的注释双斜线是可行的，我本人习惯打上断点。例如：

```
//////////////////////////////////////////////// freopen("uqe.in", "r", stdin);
//////////////////////////////////////////////// freopen("uqe.out", "w", stdout);
```

将比

```
//freopen("uqe.in", "r", stdin);
//freopen("uqe.out", "w", stdout);
```

显眼得多——尤其是当你喜欢为每行代码写上包含心血的易懂注释时。事后你可以通过长按`Ctrl+逗号`（Dev-C++）的方式快速且安全的删除这些斜线。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不仅如此，**看好输入输出文件名也是一个非常重要的细节**，建议直接复制粘贴。对于标准样例，直接选中PDF文字再复制一般都不是一个明智的做法，手动输入也是可行的，但是对拍有时会比较繁琐（例如普及组T3的样例）。这边传授一个方便的做法：选中代码左侧序号，在WPS中直接右键菜单点击消除文字即可（本次考试我就是使用的这个方便技巧快捷复制样例数据）。最好找张纸记下来，后面会讲到原因。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;顺利解锁了PDF文件，**你要做的第一件事就是将四道题全部读熟**。对整场比赛的题目有大致的规划，有可能你先前做题时做过与T4极其相似的题目，那么放弃显然是一个很不划算的决策。将题目读熟，大概判断一下算法实现，评估自己哪些题能做好，哪些题要放一放/完全放弃。知己知彼方能百战百胜。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赛初的状态基本上决定了你整场比赛的表现，因此在赛初就做好一切细节方面的完全准备，对你的信心增长是非常重要的！

## 第三节&nbsp;&nbsp;&nbsp;&nbsp;赛中时期

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;那么你现在拿到了第一题（信心题）。一般来说，CSP的复赛，算法很少裸露地出现在题目之中，前两题近似看作数学题。保证你的数学思维在线，因为第一题的思路可能千奇百怪，**如果你一段时间没有思路（对于第一题大概是5~15分钟），可以考虑先做其他题目**。刷新一下思维定势，有可能T1的灵感就乍现于其他题目之中。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**在符合时间规划的前提下尽可能多去造hack数据**，写出一段代码（尤其是T3放大模拟时）后，千万保证没有任何逻辑问题。当然，不是所有人都能只看代码就能检查的出其中的逻辑漏洞。因此你需要多造hack数据。hack数据多数情况下包括这几个要素：*方程的特殊解、极端值/边界值、大数据（int越界）*。在规划好的时间内想尽办法为你的代码多挑几根刺出来，你的代码才能更加趋近于满分解。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**千万不要看你旁边的人！！！** 除非S组巨佬闯进了J组蒟蒻区，否则千万不要在比赛中途去看任何人的任何行为。一方面，你的行为可能被视作交谈作弊~~喜提CCF全国通报、禁赛3年大礼包~~；另一方面，如果你抱着嘲笑别人的心态去观察别人，那么你的脸很可能就会被你自己打烂。我在考试时因为瞧不起隔壁的一位小学生，当他开始疯狂敲代码时，我自己的心态就爆炸了——把所有人，不分男女、年龄高低，都当作你的敌人，轻视则死。同时这也给你带来一部分紧张感，会使你的发挥更佳。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**给自己适当的放松与勉励**，要相信，上天不是无故给你这个周末不用冒着风雨大太阳上补习班的珍贵机会（对于高中生，则是周六不用坐在教室里上正课的机会）。当你完全确认你的代码已经完美无瑕时，告诉自己：*同学们都还在悲催的上着课，我却在外边快乐的敲着代码。*如此一来可以起到调整心态的作用。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**别激动到顺手关了PDF文件**。如果你还记得或者是在草稿纸上写了密码，那无所谓；但是如果你没写，你的处境就非常尴尬，这时你可以举手找老师再要，但这绝对对你的心态是一个不小的打击。

## 第四节&nbsp;&nbsp;&nbsp;&nbsp;赛末时期

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经历三个半小时的不懈奋斗，比赛终于迎来最后的半小时。**无论你的完成情况如何，一定要用这最后的时间好好检查一下你的代码**。瞄一眼你是否有与下面类似的代码：

```
freopen("uqe2.in", "r", stdin);  // 危
freopen("uqe2.out", "w", stdout);  // 爆零警告
```

这段代码的主人是个懒人无疑了，如果你把CCF提供的附加样例复制了出来。切记最后把文件名里的序号删除，否则你就可以AFO了。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者以下的代码：

```
#include <Windows.h>
//其他的代码
if (system("fc uqe.out uqe.ans")) cout<<"WA"<<endl;
else cout<<"AC"<<endl;
```

这位同学也是个Windows爱好者~~受害者~~无疑了，**CCF明文规定了测试用系统为NOI Linux。因此不存在`Windows.h`这个头文件**，如果你忘记删除了，那一定是个大大滴CE。正式比赛时，用`bits/stdc++.h`万能头即可(Windows和Linux通用）。我有一个考S组的朋友，因为忘记删除这个对拍头文件而喜提一个0分，直接亏大发。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**不要忘记将你的重定向取消注释**。你连读入输出都没有了，属实是可以AFO了。最后三分钟，请将你的蹄子挪开键盘鼠标。否则可能会越改越慌，不妨好好回想一下这周老师留了什么作业，你缺了哪些课需要去补，总之不要再动你的鼠标键盘了！如果实在是不放心编译问题，按一下`F11`，通过即可。**保证你的工作目录下只留`.cpp`文件**，所以将你复制的样例文件和编译的exe文件全部删除。

## 第五节&nbsp;&nbsp;&nbsp;&nbsp;考试结束

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**请你千万保持冷静，不要习惯性地把机器关机了**。CCF明文规定：*由关机造成的数据损失，责任由考生自负*。只需要把你的IDE关闭就好。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**回家后，把周一要交的作业补好。别再谈考试的事情了，让你自己有个好心情。毕竟不管你的表现怎么样，它都过去了不是吗？**