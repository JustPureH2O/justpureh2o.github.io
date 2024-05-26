---
abbrlink: ''
categories:
- - oi算法
date: '2024-03-15T16:16:46.781060+08:00'
headimg: https://pic.imgdb.cn/item/65d445d79f345e8d039c5756.png
tags:
- 算法
- oi
- dp
- 学习笔记
title: 闫氏DP 学习笔记 二
updated: '2024-03-22T18:48:44.982+08:00'
---
书接上文：[学习笔记 一](https://justpureh2o.cn/articles/1057/)

---

### 背包DP 进阶

#### 多维费用背包

顾名思义，在背包中加入多个限制。例如每个物品都有一定的体积和质量，要求在最大体积和最大质量的限制下选出总价值最高的物品。通过加入合适的限制，这样的背包问题就会更加切合现实情况。多维费用背包的模型更贴近于生活中我们经常面临的多决策问题，因而它的求解更具有现实意义。

“多维费用”在我看来其实是一种状态设计的思想，其实并不是某种特定类型的物品取用方式，所以不宜和0/1背包等按物品取用方式区分的背包类型混为一谈。正因如此，多维费用背包问题中也会出现0/1背包、完全背包、多重背包的影子。下面的两道题目就是最好的例证：

---

##### 洛谷 P1507 NASA的食物计划

题目传送门：[这里](https://www.luogu.com.cn/problem/P1507)

题目难度：<span data-luogu data-orange>普及-</span>

> NASA（美国航空航天局）因为航天飞机的隔热瓦等其他安全技术问题一直大伤脑筋，因此在各方压力下终止了航天飞机的历史，但是此类事情会不会在以后发生，谁也无法保证。所以，在遇到这类航天问题时，也许只能让航天员出仓维修。但是过多的维修会消耗航天员大量的能量，因此 NASA 便想设计一种食品方案，使体积和承重有限的条件下多装载一些高卡路里的食物。
>
> 航天飞机的体积有限，当然如果载过重的物品，燃料会浪费很多钱，每件食品都有各自的体积、质量以及所含卡路里。在告诉你体积和质量的最大值的情况下，请输出能达到的食品方案所含卡路里的最大值，当然每个食品只能使用一次。
>
> ---
>
> 输入第一行 $2$ 个整数，分别代表体积最大值 $h$ 和质量最大值 $t$。
>
> 输入第二行 $1$ 个整数代表食品总数 $n$。
>
> 接下来输入的 $n$ 行每行 $3$ 个数 体积 $h_i$，质量 $t_i$，所含卡路里 $k_i$。
>
> 输出一个数，表示所能达到的最大卡路里（`int` 范围内）
>
> ---
>
> **数据范围：**
>
> 对于 $100\%$ 的数据，$h,t,h_i,t_i \le 400$，$n \le 50$，$k_i \le 500$。

读题我们会发现，这道题设置了两个限制条件：其一为体积、其二是质量。那么该如何设计求解方案来求解呢？

运用0/1背包的思想，每个物品其实都只有“选”和“不选”两种情况。假设目前是第 $i$ 个物品：如果不选，就相当于是选前 $i-1$ 个物品的最大价值；反之就需要将背包的剩余体积和质量给更新了。我们还可以观察到，这两个限制条件是互不影响的，均分别取决于选择的物品的性质，那事情就很好办了。在`dp`数组里设置两个分立的维度，分别代表当前背包的剩余容量和剩余承重量，然后借助[滚动数组](https://justpureh2o.cn/articles/1057/#%E8%A1%A5-%E6%BB%9A%E5%8A%A8%E6%95%B0%E7%BB%84%E4%BC%98%E5%8C%96%E7%A9%BA%E9%97%B4)的一点点知识就可以解决了。

代码：

```cpp
#include <bits/stdc++.h>

#define M 410
using namespace std;

int dp[M][M], vol[M], val[M], mas[M];

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int h, t, n;
	cin >> h >> t >> n;

	for (int i = 1; i <= n; i++) {
		cin >> vol[i] >> mas[i] >> val[i];
	}
	for (int i = 1; i <= n; i++) {
		for (int j = t; j >= mas[i]; j--) {
			for (int k = h; k >= vol[i]; k--) {
				dp[j][k] = max(dp[j][k], dp[j - mas[i]][k - vol[i]] + val[i]);
			}
		}
	}
	cout << dp[t][h] << endl;
	return 0;
}
```

总用时：$44ms$ [记录](https://www.luogu.com.cn/record/150933177)

##### 洛谷 P1541 乌龟棋

题目传送门：[这里](https://www.luogu.com.cn/problem/P1541)

题目难度：<span data-luogu data-green>普及+/提高</span>

题目来源：<span data-luogu data-source>NOIp 提高组</span>&nbsp;&nbsp;&nbsp;&nbsp;<span data-luogu data-date>2010</span>

> NOIP2010 提高组 T2
>
> ---
>
> 小明过生日的时候，爸爸送给他一副乌龟棋当作礼物。
>
> 乌龟棋的棋盘是一行 $N$ 个格子，每个格子上一个分数（非负整数）。棋盘第 $1$ 格是唯一的起点，第 $N$ 格是终点，游戏要求玩家控制一个乌龟棋子从起点出发走到终点。
>
> 乌龟棋中 $M$ 张爬行卡片，分成 $4$ 种不同的类型（$M$ 张卡片中不一定包含所有 $4$ 种类型的卡片，见样例），每种类型的卡片上分别标有 $1,2,3,4$ 四个数字之一，表示使用这种卡片后，乌龟棋子将向前爬行相应的格子数。游戏中，玩家每次需要从所有的爬行卡片中选择一张之前没有使用过的爬行卡片，控制乌龟棋子前进相应的格子数，每张卡片只能使用一次。
>
> 游戏中，乌龟棋子自动获得起点格子的分数，并且在后续的爬行中每到达一个格子，就得到该格子相应的分数。玩家最终游戏得分就是乌龟棋子从起点到终点过程中到过的所有格子的分数总和。
>
> 很明显，用不同的爬行卡片使用顺序会使得最终游戏的得分不同，小明想要找到一种卡片使用顺序使得最终游戏得分最多。
>
> 现在，告诉你棋盘上每个格子的分数和所有的爬行卡片，你能告诉小明，他最多能得到多少分吗？
>
> ---
>
> **输入：**
>
> 每行中两个数之间用一个空格隔开。
>
> 第 $1$ 行 $2$ 个正整数 $N,M$，分别表示棋盘格子数和爬行卡片数。
>
> 第 $2$ 行 $N$ 个非负整数，$a_1,a_2,…,a_N$，其中 $a_i$ 表示棋盘第 $i$ 个格子上的分数。
>
> 第 $3$ 行 $M$ 个整数，$b_1,b_2,…,b_M$，表示 $M$ 张爬行卡片上的数字。
>
> 输入数据保证到达终点时刚好用光 $M$ 张爬行卡片。
>
> **输出：**
>
> 一个整数，表示小明最多能得到的分数。
>
> ---
>
> 每个测试点 1s。
>
> 对于 $100\%$ 的数据有 $1≤N≤350,1≤M≤120$，且 $4$ 种爬行卡片，每种卡片的张数不会超过 $40$；$0≤a_i≤100,1≤i≤N,1≤b_i≤4,1≤i≤M$。

输入保证了用完所有爬行卡片后刚好到达终点，也就是说 $\sum\limits_{i=1}^{M}b_i=N-1$。我们真正需要去担心的还是这 $M$ 张卡片的顺序问题。

既然是多维费用背包，那我们就要找到其背后的限制条件，我们看看，每次前进某格时，什么量是变化的？

答案很明显了——卡牌的个数。我们进一步想——每种类型卡牌的个数。接下来就可以设计数组了！

考虑`dp`数组，状态`dp[a][b][c][d]`表示目前已经使用过 $a,b,c,d$ 张四种类型的卡牌后的最大价值。在读入时进行统计，接着挨个枚举“选”和“不选”的情况即可。

那么如何确定状态转移呢？

当前所在格子的编号很显然取决于使用过的爬行卡牌的类型和数目，假设四类卡牌分别使用了 $i,j,k,l$ 次，起始点编号为 $1$ ，那么当前格子编号就是 $i+2j+3k+4j+1$。

最后注意初始化，在一张卡牌都不选的情况下，也能得到第一个格子的分数！这是读题可以读出来的信息。以及下标判负（见代码）

代码：

```cpp
#include <bits/stdc++.h>

#define N 45
#define M 370
#define K 130
using namespace std;

int dp[N][N][N][N], mp[M], st[K];

int getIdx(int a, int b, int c, int d) {
	// 获取下标 
	return 1 + a + b * 2 + c * 3 + d * 4;
}

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int n, m;
	cin >> n >> m;

	for (int i = 1; i <= n; i++) {
		cin >> mp[i];
	}

	for (int i = 1; i <= m; i++) {
		// 统计每种类型卡牌的个数 
		int x;
		cin >> x;
		st[x]++;
	}

	dp[0][0][0][0] = mp[1]; // 记住初始化 

	for (int a = 0; a <= st[1]; a++) {
		for (int b = 0; b <= st[2]; b++) {
			for (int c = 0; c <= st[3]; c++) {
				for (int d = 0; d <= st[4]; d++) {
					int now = mp[getIdx(a, b, c, d)];
					 
					if (a) dp[a][b][c][d] = max(dp[a][b][c][d], dp[a - 1][b][c][d] + now);
					if (b) dp[a][b][c][d] = max(dp[a][b][c][d], dp[a][b - 1][c][d] + now);
					if (c) dp[a][b][c][d] = max(dp[a][b][c][d], dp[a][b][c - 1][d] + now);
					if (d) dp[a][b][c][d] = max(dp[a][b][c][d], dp[a][b][c][d - 1] + now);
				}
			}
		}
	}
	cout << dp[st[1]][st[2]][st[3]][st[4]] << endl;
	return 0;
}
```

总用时：$67ms$ [记录](https://www.luogu.com.cn/record/150950565)

#### 分组背包

一般形式是——在 $n$ 组中选择总重量不超过限制的、且总价值最高的一些物品，且最多在每组物品中选择其中一个计入总价值。由于这类背包描述了特定的物品选择方式，和多维费用不同，它是一种和0/1背包、完全背包、多重背包同类型的背包。

##### 洛谷 P1757 通天之分组背包

题目传送门：[这里](https://www.luogu.com.cn/problem/P1757)

题目难度：<span data-luogu data-orange>普及-</span>

> 自 $01$ 背包问世之后，小 A 对此深感兴趣。一天，小 A 去远游，却发现他的背包不同于 $01$ 背包，他的物品大致可分为 $k$ 组，每组中的物品相互冲突，现在，他想知道最大的利用价值是多少。
>
> ---
>
> 输入两个数 $m,n$，表示一共有 $n$ 件物品，总重量为 $m$。
>
> 接下来 $n$ 行，每行 $3$ 个数 $a_i,b_i,c_i$，表示物品的重量，利用价值，所属组数。
>
> 输出一个数，最大的利用价值。
>
> ---
>
> **数据范围：**
>
> $0 \leq m \leq 1000$，$1 \leq n \leq 1000$，$1\leq k\leq 100$，$a_i, b_i, c_i$ 在 `int` 范围内。

其实类似0/1背包的思路，因为每一组物品中至多选一个，我们就遍历某一组物品，在其中执行选或不选的判断就好。

因此我们大概需要设计三重循环——分别要枚举组数、当前组的每件物品和剩余容量。考虑到题目限制，每一组只能最多选出一件物品，因此将组数枚举放在最外层、接着是剩余价值、最后是每一组的物品。

加入“分组”的概念后，二维数组`w[i][j]`就代表第 $i$ 组的第 $j$ 个物品的价值，`v` 数组同理。

如果把剩余价值和每组物品枚举的顺序搞反了呢？那么输出将会是`15`，不难发现：程序选择了第一组的两个物品，与“每组至多选择一个物品”的要求有悖。细化到执行逻辑本身，如果每组物品的枚举放在了外边，假设当前是第 $p$ 个物品，那么对于可能循环到的剩余价值 $i$ 和 $j$ ，都有可能做出“选择”这一操作；接着是第 $p+1$ 个物品，同样可能循环到剩余价值 $i$ 与 $j$ ，也有可能做出“选择”这一操作，总体来说，就是这一组的第 $p$ 和第 $p+1$ 组物品都被选择了，也就造成了同一组选择超过一件物品的情况。

代码：

```cpp
#include <bits/stdc++.h>

#define M 110
#define N 1010
using namespace std;

int w[M][N], v[M][N];
int cnt[M], dp[N];
int gr = 0;

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int n, m;
	cin>>m>>n;
	for (int i = 1; i <= n; i++) {
		int a, b, c;
		cin >> a >> b >> c;
		gr = max(gr, c);
		v[c][++cnt[c]] = a;
		w[c][cnt[c]] = b;
	}
	for (int i = 1; i <= gr; i++) {
		for (int k = m; k >= 0; k--) {
			for (int j = 1; j <= cnt[i]; j++) {
				if (k >= v[i][j]) dp[k] = max(dp[k], dp[k - v[i][j]] + w[i][j]);
			}
		}
	}
	cout << dp[m] << endl;
	return 0;
}
```

总用时：$20ms$ [记录](https://www.luogu.com.cn/record/151766633)

#### 树形背包

顾名思义，树形背包是在树形结构上运行的背包算法。一般来说，树形背包所求的问题和树的边权、点权相关。

##### 洛谷 P2015 二叉苹果树

题目传送门：[这里](https://www.luogu.com.cn/problem/P2015)

题目难度：<span data-luogu data-green>普及+/提高</span>

> 有一棵苹果树，如果树枝有分叉，一定是分二叉（就是说没有只有一个儿子的结点）
>
> 这棵树共有 $N$ 个结点（叶子点或者树枝分叉点），编号为 $1 \sim N$，树根编号一定是 $1$。
>
> 我们用一根树枝两端连接的结点的编号来描述一根树枝的位置。下面是一颗有 $4$ 个树枝的树：
>
> ```
> 2   5
>  \ / 
>   3   4
>    \ /
>     1
> ```
>
> 现在这颗树枝条太多了，需要剪枝。但是一些树枝上长有苹果。
>
> 给定需要保留的树枝数量，求出最多能留住多少苹果。
>
> ---
>
> 输入第一行有 $2$ 个整数 $N$ 和 $Q$，分别表示表示树的结点数，和要保留的树枝数量。
>
> 接下来 $N-1$ 行，每行 $3$ 个整数，描述一根树枝的信息：前 $2$ 个数是它连接的结点的编号，第 $3$ 个数是这根树枝上苹果的数量。
>
> 输出一个数，最多能留住的苹果的数量。
>
> ---
>
> **数据范围：**
>
> $1 \leqslant Q < N \leqslant 100$，每根树枝上的苹果 $\leqslant 3 \times 10^4$。

树上背包怎么做呢？

联想一下[数字三角形](https://justpureh2o.cn/articles/1057/#p1216-%E6%95%B0%E5%AD%97%E4%B8%89%E8%A7%92%E5%BD%A2)这道题，当时我们选择从下往上的更新方式。这道题也可以用这样的思想来解决，但是最大的一个问题是这道题的树并没有数字三角形那么规整，因此采用深搜到子节点，再向上更新的方式来更新状态。

在这道题中，我们设置`dp`数组为`dp[u][i]`，含义是以 $u$ 为根，且选择了子树里 $i$ 条边的方案的最大边权和。

我们把样例画成一个树状图：

![](https://cdn.luogu.com.cn/upload/image_hosting/ukfkdy9o.png)

样例输出 ${21}$，就是将边 $(2,3)$ 和边 $(1,4)$ 删去、保留节点 ${1,2,3}$ 。

假设当前深搜到节点 ${2}$ ，发现无法继续向下搜索，于是开始更新边：对于边 $(2,3)$ ，可以选、也可以不选。如果不选，很简单，根据滚动数组思想，就是`dp[u][i]`本身；如果选择这条边，就很有意思了——

子节点不好解释，让我们向上移动一下。假设当前在 ${3}$ 号点上DP ，对于数组第二维，可以枚举的值在 $[0,2]$ 内：即一条边都不选、选子树的某一条边、子树两条边都选上。不难发现，变量的取值是 $[0,f(u)]$，其中 $f(u)$ 是以节点 $u$ 为根的所有子树的边数之和。

然后是前驱状态的问题，既然顺序是从下到上，那状态`dp[u][j]`就是从`dp[son(u)][j - 1]`转移来的，这里为什么是 $j-1$ ？因为根节点 $u$ 和这个子树的根节点 $\operatorname{son}(u)$ 中间还连了一条边，因此需要将它排除在外。循环变量 $k$ 为上述数组第二维的值，用来枚举可选择的子树的边数。那么子树需要选择 $k$ 条边，算上刚刚的特殊边 $(u,\operatorname{son}(u))$，根节点 $u$ 对应的树就只需要选择 $j-k-1$ 条边了。最后，因为选中了边 $(u,\operatorname{son}(u))$ ，因此需要累加边权，状态转移方程就是 `dp[u][j] = max(dp[u][j], dp[u][j - k - 1] + dp[son(u)][j] + w[to[i]])`

注意存无向边，因此前向星结构体数组要开 ${2}N$！[血的教训](https://www.luogu.com.cn/record/151851345)

代码：

```cpp
#include <bits/stdc++.h>

#define N 110
using namespace std;

int h[N];
int cnt[N], dp[N][N];
int idx = 0;
int n, q;

struct Edge {
    int to, ne, w;
} edges[N << 1];

void add(int u, int v, int x) {
    edges[idx].to = v;
    edges[idx].w = x;
    edges[idx].ne = h[u];
    h[u] = idx++;
}

void dfs(int now, int fa) {
    for (int i = h[now]; ~i; i = edges[i].ne) {
        int son = edges[i].to;
        if (son == fa) continue;
        dfs(son, now);
        cnt[now] += (cnt[son] + 1);
        for (int j = min(q, cnt[now]); j; j--) {
            for (int k = min(j - 1, cnt[son]); k >= 0; k--) {
                dp[now][j] = max(dp[now][j], dp[now][j - k - 1] + dp[son][k] + edges[i].w);
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);

    memset(h, -1, sizeof h);

    cin >> n >> q;
    for (int i = 1; i < n; i++) {
        int u, v, x;
        cin >> u >> v >> x;
        add(u, v, x);
        add(v, u, x);
    }

    dfs(1, -1);

    cout << dp[1][q] << endl;

    return 0;
}
```

总用时：${43}ms$ [记录](https://www.luogu.com.cn/record/151853150)

##### 洛谷 P1352 没有上司的舞会

*谨以此题，缅怀高2022届那五位被蓝桥杯官方送来的双倍经验雷倒的OIer们*

题目传送门：[这里](https://www.luogu.com.cn/problem/P1352)

题目难度：<span luogu green>普及+/提高</span>

来源：<span luogu source>福建省历届夏令营</span>

> 某大学有 $n$ 个职员，编号为 $1\ldots n$。
>
> 他们之间有从属关系，也就是说他们的关系就像一棵以校长为根的树，父结点就是子结点的直接上司。
>
> 现在有个周年庆宴会，宴会每邀请来一个职员都会增加一定的快乐指数 $r_i$，但是呢，如果某个职员的直接上司来参加舞会了，那么这个职员就无论如何也不肯来参加舞会了。
>
> 所以，请你编程计算，邀请哪些职员可以使快乐指数最大，求最大的快乐指数。
>
> ---
>
> **输入：**
>
> 第一行是一个整数 $n$。
>
> 第 $2$ 到第 $(n + 1)$ 行，每行一个整数，第 $(i+1)$ 行的整数表示 $i$ 号职员的快乐指数 $r_i$。
>
> 第 $(n + 2)$ 到第 $2n$ 行，每行输入一对整数 $l, k$，代表 $k$ 是 $l$ 的直接上司。
>
> **输出：**
>
> 输出一行一个整数代表最大的快乐指数。
>
> ---
>
> 对于 $100\%$ 的数据，保证 $1\leq n \leq 6 \times 10^3
>
> $，$-128 \leq r_i\leq 127$，$1 \leq l, k \leq n$，且给出的关系一定是一棵树。

同样是一道经典的树形背包问题。但是和上面那个二叉苹果树不同，这道题相当于求一定条件下的点权最大和、而上一道题则是求边权最大和，因而这道题的状态表示策略稍有不同——让`dp[i][0]`代表员工 $i$ 不来参加舞会的最大欢乐值，`dp[i][1]`代表员工 $i$ 前来参加舞会的最大欢乐值。那么很明显，状态之间的关系就出来了。

如果这个员工不来参加，那么他的直接下属，也就是节点 $i$ 直接相连的子节点，就可以自由选择来或不来，因为他的直接上司选择了不来舞会；如果这个员工参加了舞会，那么他的直接下属是无论如何也不会来的。这样就形成了一个递归的过程，看得出来父节点的状态最大值取决于子节点的“来”和“不来”状态的最大值，因此对于大boss来讲（树的根节点），只要对他“来”和“不来”两种状态取最大值即可解决问题。

整体采用深搜到子节点然后向上更新的方式，这一点和二叉苹果树相似（不用更新子树边数和），用上刚才分析的状态转移就好。值得注意的是，对每个节点的一号状态——也就是“来参加”，需要初始化成该点的欢乐值。寻根采用输入时累加节点入度的方法，如果入度为 ${0}$ 则证明该点是树的根节点，从这里开始深搜即可。

代码：

```cpp
#include <bits/stdc++.h>
#define N 6010
using namespace std;

typedef long long ll;

struct Edge {
	int to, ne;
} edges[N << 1];

int dp[N][2], h[N], w[N], size[N];
int indeg[N];
int idx = 0, n;

void add(int u, int v) {
	idx++;
	edges[idx].to = v;
	edges[idx].ne = h[u];
	h[u] = idx;
}

void dfs(int now, int fa) {
	for (int i = h[now]; ~i; i = edges[i].ne) {
		int son = edges[i].to;
		if (son == fa) continue;
		dfs(son, now);
		dp[now][0] += max(dp[son][0], dp[son][1]);
		dp[now][1] += dp[son][0];
	}
}

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	memset(h, -1, sizeof h);

	cin >> n;
	for (int i = 1; i <= n; i++) {
		cin >> w[i];
	}
	for (int i = 1; i < n; i++) {
		int u, v;
		cin >> u >> v;
		indeg[v]++;
		add(u, v);
		add(v, u);
	}
	int rt = -1;
	for (int i = 1; i <= n; i++) {
		if (!indeg[i]) {
			rt = i;
			break;
		}
	}
	for (int i = 1; i <= n; i++) dp[i][1] = w[i];
	dfs(rt, -1);
	cout << max(dp[rt][0], dp[rt][1]) << endl;
	return 0;
}
```

总用时：${35}ms$ [记录](https://www.luogu.com.cn/record/152101170)

~~有人说[数据水了](https://www.luogu.com.cn/discuss/730703)，我挺赞同的……~~


#### 有依赖的背包

顾名思义，有依赖的背包在选择物品时要注意主物品和副物品的从属关系。一般来说，在选择副物品前，要先把对应的主物品选择了。实质上它是一种变形的0/1背包，因此在状态转移方面和0/1背包的状态转移方程有诸多相似之处。

##### 洛谷 P1064 金明的预算方案

题目传送门：[这里](https://www.luogu.com.cn/problem/P1064)

题目难度：<span data-luogu data-green>普及+/提高</span>

来源：<span data-luogu data-source>NOIp 提高组</span>&nbsp;&nbsp;&nbsp;&nbsp;<span data-luogu data-date>2016</span>

> 金明今天很开心，家里购置的新房就要领钥匙了，新房里有一间金明自己专用的很宽敞的房间。更让他高兴的是，妈妈昨天对他说：“你的房间需要购买哪些物品，怎么布置，你说了算，只要不超过 $n$ 元钱就行”。今天一早，金明就开始做预算了，他把想买的物品分为两类：主件与附件，附件是从属于某个主件的，下表就是一些主件与附件的例子：
>
>
> |  主件  |      附件      |
> | :----: | :------------: |
> |  电脑  | 打印机，扫描仪 |
> |  书柜  |      图书      |
> |  书桌  |   台灯，文具   |
> | 工作椅 |       无       |
>
> 如果要买归类为附件的物品，必须先买该附件所属的主件。每个主件可以有 $0$ 个、$1$ 个或 $2$ 个附件。每个附件对应一个主件，附件不再有从属于自己的附件。金明想买的东西很多，肯定会超过妈妈限定的 $n$ 元。于是，他把每件物品规定了一个重要度，分为 $5$ 等：用整数 $1 \sim 5$ 表示，第 $5$ 等最重要。他还从因特网上查到了每件物品的价格（都是 $10$ 元的整数倍）。他希望在不超过 $n$ 元的前提下，使每件物品的价格与重要度的乘积的总和最大。
>
> 设第 $j$ 件物品的价格为 $v_j$，重要度为$w_j$，共选中了 $k$ 件物品，编号依次为 $j_1,j_2,\dots,j_k$，则所求的总和为：
>
> $v_{j_1} \times w_{j_1}+v_{j_2} \times w_{j_2}+ \dots +v_{j_k} \times w_{j_k}$。
>
> 请你帮助金明设计一个满足要求的购物单。
>
> ---
>
> 输入第一行有两个整数，分别表示总钱数 $n$ 和希望购买的物品个数 $m$。
>
> 输入第 $2$ 到第 $(m + 1)$ 行，每行三个整数，第 $(i + 1)$ 行的整数 $v_i$，$p_i$，$q_i$ 分别表示第 $i$ 件物品的价格、重要度以及它对应的的主件。如果 $q_i=0$，表示该物品本身是主件。
>
> 输出一行一个整数表示答案。
>
> ---
>
> 对于全部的测试点，保证 $1 \leq n \leq 3.2 \times 10^4$，$1 \leq m \leq 60$，$0 \leq v_i \leq 10^4$，$1 \leq p_i \leq 5$，$0 \leq q_i \leq m$，答案不超过 $2 \times 10^5$。
>
> NOIP 2006 提高组 第二题

这道题属于是这类背包的经典入门题。不难发现，它有很明显的从属选择关系——主物品和附件。

那么在设计转移方程时就要注意，此时我们的选择方案已经不再是普通0/1背包单纯的“选”和“不选”了。而是“选哪些”和“不选”两种思考方向。

分类讨论可以发现，选择方案分五种：第一种是**只**选主物品、第二种是**只不选**主物品、第三种是**选主物品且只选第一个附件**、第四种是**选主物品且只选第二个附件**、最后一个是**选主物品和所有两个附件**。那么在设计转移方程时只需要分类判断 $j$ 和 $w$ 的大小关系，注意倒序循环！

代码：

```cpp
#include <bits/stdc++.h>
#define N 32010
#define M 110
using namespace std;

int dp[N], w[M][3], v[M][3], cnt[M];

int main() {
	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	cout.tie(nullptr);

	int n, m;
	cin >> n >> m;

	for (int i = 1; i <= m; i++) {
		int a, b, c;
		cin >> a >> b >> c;
		cnt[c]++;
		if (!c) {
			v[i][0] = a;
			w[i][0] = a * b;
		} else {
			v[c][cnt[c]] = a;
			w[c][cnt[c]] = a * b;
		}
	}

	for (int i = 1; i <= m; i++) {
		for (int j = n; j >= v[i][0]; j--) {
			if (!v[i][0]) break;
			dp[j] = max(dp[j], dp[j - v[i][0]] + w[i][0]);
			if (j >= (v[i][0] + v[i][1] + v[i][2])) dp[j] = max(dp[j], dp[j - v[i][0] - v[i][1] - v[i][2]] + w[i][0] + w[i][1] + w[i][2]);
			if (j >= v[i][0] + v[i][1]) dp[j] = max(dp[j], dp[j - v[i][0] - v[i][1]] + w[i][0] + w[i][1]);
			if (j >= v[i][0] + v[i][2]) dp[j] = max(dp[j], dp[j - v[i][0] - v[i][2]] + w[i][0] + w[i][2]);
		}
	}
	cout << dp[n] << endl;
	return 0;
}
```

总用时：$44ms$ [记录](https://www.luogu.com.cn/record/151877391)