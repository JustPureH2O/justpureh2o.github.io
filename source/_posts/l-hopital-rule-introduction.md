---
abbrlink: ''
categories:
- - 奇技淫巧
date: '2024-05-01T15:57:52.301735+08:00'
tags:
- 数学
title: '[奇技淫巧] 面向高中生の洛必达法则简述'
updated: '2024-05-01T21:27:56.826+08:00'
---
作为一名在导数领域摸爬滚打多年的高中牲，又怎能不知道高贵的**洛必达法则**呢？今天从高考角度出发，简要介绍洛必达法则作为**解选填题**的奇技淫巧的策略。

### 引入

先用一个典例来引入洛必达法则：

> 定义函数 $f(x)=e^x$，且 $f(x)\geq ax+1$ 在 $x\in[0,+\infty)$ 上恒成立，求 $a$ 的取值范围。

**解法一（正解）：端点效应**

问题转化为：“$e^x-ax-1\geq0$ 在 $x\geq0$ 时恒成立，求 $a$ 的范围”。

不难发现，新函数 $h(x)=e^x-ax-1$ 满足 $h(0)=0$。我们的目标就是让这个新函数恒在 $x$ 轴上方，考虑 $h(x)$ 在 $x=0$ 时的导数大于等于零——即函数在 $[0,+\infty)$ 上单调递增，即可满足题目要求。这个方法叫做端点效应法，可以用来导出满足题目要求的一个**必要条件**（充分性需另外证明）、或者是收缩答案的可能范围，减少复杂的分类讨论。

因此列出式子：$h^\prime(0)\geq0$ 解得 $a\leq1$。

证明充分性，当 $a\leq1$ 时，$h(x)=e^x-ax-1\geq e^x-x-1=e^x-(x+1)$。由于 $e^x\geq x+1$ 恒成立，原不等式恒大于等于零，即 $h^\prime(x)\geq0$ 在 $[0,+\infty)$ 上恒成立，$h(x)$ 在 $[0,+\infty)$ 上单调递增。又因为 $h(0)=0$，所以 $h(x)\geq0$ 恒成立，原不等式得证。

当 $a>1$ 时 $h(x)<e^x-(x+1)$，不能保证结果恒大于等于零，原不等式不成立。综上，$a\in(-\infty,1]$。

**解法二：洛必达法则**

考虑分离参数，得 $a\leq\frac{e^x-1}{x}$，令 $h(x)=\frac{e^x-1}{x}$。由题意知，需满足 $a\leq h(x)_{min}$。

对 $h(x)$ 求导，得 $h^\prime(x)=\frac{(x-1)e^x+1}{x^2}$，此时不容易看出正负，因为分母恒大于等于零，设函数 $\varphi(x)=(x-1)e^x+1$，对其求导得 $\varphi^\prime(x)=xe^x\geq0$。因此 $h(x)$ 在 $[0,+\infty)$ 上单调递增。

于是 $a\leq h(x)_{min}=h(0)=\frac{0}{0}$。由洛必达法则得 $a\leq1$，则取值范围是 $(-\infty,1]$。

### 洛必达法则

~~讲个笑话：洛必达法则不是洛必达提出的，而是伯努利最先发现的~~

首先我们要搞清楚洛必达法则的适用条件（非常非常重要，必须要知道葛军究竟是怎么出题卡掉洛必达做法的）：

#### 不定式

~~to do sth.~~

分为两种类型，分别对应数字的两个极端。

**0/0 不定式**：即 $\frac{0}{0}$，零除以零。

$\bold{\infty}$**/**$\bold{\infty}$**不定式**：即 $\frac{\infty}{\infty}$，无穷大除以无穷大。

要想使用洛必达，式子必须是以上两种不定式的其中一种（正负均可）。如果你发现原始函数并不满足如上的不定式形式，则可以选择求一次导，化成如上的不定式形式。

对于两个函数 $f(x)$ 和 $g(x)$，若 $\frac{f(x)}{g(x)}$ 是一个不定式，那么不定式的值等于 $\frac{f^\prime(x)}{g^\prime(x)}$，即分子分母求导相除。

### 后话

~~无不良引导~~

其实，洛必达法则就这么些内容。很少，**用来秒选择填空题还是可以的**。大题如果实在证不出来可以考虑用这个伪证（前提是一个字都证不出来、且所在省份会给部分分数），当然这里还是建议使用正解端点效应法。我的忠告是：平时周考月考在班内秀一下就好了，市里全省大考千万不要用！