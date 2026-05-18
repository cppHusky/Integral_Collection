#import "../utils.typ":question,comment,subst,Int,ref,multi-eq,ref-eq
#import "../math.typ":*
#question(
	tag:"1/sqrt(ax^2+bx+c)",
	category:blue,
	question:$integral (dif x)/sqrt(a x^2+b x+c)space(a!=0,b^2-4a c!=0)$,
	answer:[当$a>0$时，$
		integral (dif x)/sqrt(a x^2+b x+c)=&1/sqrt(a)integral dif(sqrt(a)x)/sqrt((sqrt(a)x+b/(2sqrt(a)))^2+(4a c-b^2)/(4a))\
		=&1/sqrt(a)log abs(sqrt(a)x+b/(2sqrt(a))+sqrt(a x^2+b x+c))+C\
		=&1/sqrt(a)log abs(2a x+b+2sqrt(a)sqrt(a x^2+b x+c))+C
	$当$a<0$时，$
		integral (dif x)/sqrt(a x^2+b x+c)=&1/sqrt(-a)integral dif(sqrt(-a)x)/sqrt((4a c-b^2)/(4a)-(sqrt(-a)x-b/(2sqrt(-a)))^2)\
		=&1/sqrt(-a)arcsin (sqrt(-a)x-b/(2sqrt(-a)))/(sqrt(b^2-4a c)/(2sqrt(-a)))+C\
		=&1/sqrt(-a)arcsin (-2a x-b)/sqrt(b^2-4a c)+C
	$],
)
#comment[
	这是一个分母为二次根式的积分通式，更简洁的版本见@通题通解。如果读者可以记忆，将有助于加快解题速度。这种情形非常常见，并且容易推导通式，所以之后的题目中不再给出解决这个问题的具体过程。
]
#question(
	tag:"1/(x^3+x^2+x+1)^2",
	category:blue,
	question:$integral (dif x)/(x^3+x^2+x+1)^2$,
	answer:[设$1/(x^3+x^2+x+1)^2=A/(x+1)^2+B/(x+1)+D/(x^2+1)^2+E/(x^2+1)$，用留数法求出#multi-eq($
		A=lr(1/(x^2+1)^2|)_(x+1=0)=1/4
	$,$
		B=lr((dif 1/(x^2+1)^2)/dif(x+1)|)_(x+1=0)=lr(-(4x)/(x^2+1)^3|)_(x+1=0)=1/2
	$,$
		D=lr(1/(x+1)^2|)_(x^2+1=0)=-x/2
	$,$
		E=lr(dif[1/(x+1)^2-D]/dif(x^2+1)|)_(x^2+1=0)=lr((1/2-2/(x+1)^3)/(2x)|)_(x^2+1=0)=(1-2x)/4
	$)所以$
		integral (dif x)/((x+1)^2(x^2+1)^2)=&1/4integral (dif x)/(x+1)^2+1/2integral (dif x)/(x+1)-1/2integral (x dif x)/(x^2+1)^2+1/4integral (1-2x)/(x^2+1)dif x\
		=&-1/(4(x+1))+1/2log abs(x+1)+1/(4(x^2+1))+1/4arctan x-1/4log(x^2+1)+C
	$],
)
#comment[
	这是留数法在解决分母含二次因式的有理函数裂项时的应用。这里解决$(dif f(x))/dif(x^2+1)$的方法是作微分变换化为$(dif f(x))/(dif x)dot (dif x)/dif(x^2+1)$，于是乎只需要分别求二者对$x$的导数即可，等于$(f'(x))/(2x)$。#parbreak()
	还需要注意，这里求解$E$时分子的求导对象是$1/(x+1)^2-D$。如果本题是二次因式需要设解$F$，应该表示成$lr(1/2!dot (dif^2[1/(x+1)^2-D-E(x^2+1)])/dif(x^2+1)^2|)_(x^2+1=0)$。
]
#question(
	tag:"(2x+1)/((x-1)^2(x^2+x+1)^2)",
	category:blue,
	question:$integral (2x+1)/((x-1)^2(x^2+x+1)^2)dif x$,
	answer:[设$(2x+1)/((x-1)^2(x^2+x+1)^2)=A/(x-1)^2+B/(x^2+x+1)^2$，用模法求出#multi-eq($
		A=&(2x+1)/(x^2+x+1)^2mod(x^2-2x+1)\
		=&(2x+1)/(9x^2)mod(x^2-2x+1)\
		=&(2x-x^2+2x)/(9x^2)mod (x^2-2x+1)\
		=&(-x+4)/(9x)mod(x^2-2x+1)\
		=&(-x-4x^2+8x)/(9x)mod(x^2-2x+1)\
		=&(-4x+7)/9
	$,$
		B=&(2x+1)/(x-1)^2mod(x^2+x+1)^2\
		=&((2x+1)(x^2+x+1+3x))/((x^2+x+1)^2-9x^2)mod(x^2+x+1)^2\
		=&(2x^3+9x^2+6x+1)/(-9x^2)mod(x^4+2x^3+3x^2+2x+1)\
		=&(2x^3+9x^2+6x-x^4-2x^3-3x^2-2x)/(-9x^2)mod(x^4+2x^3+3x^2+2x+1)\
		=&(-x^3+6x+4)/(-9x)mod(x^4+2x^3+3x^2+2x+1)\
		=&(-x^3+6x-4x^4-8x^3-12x^2-8x)/(-9x)mod(x^4+2x^3+3x^2+2x+1)\
		=&(4x^3+9x^2+12x+2)/9
	$)所以$
		integral (2x+1)/((x-1)^2(x^2+x+1)^2)dif x=&-1/9integral (4x-7)/(x-1)^2dif x+1/9integral (4x^3+9x^2+12x+2)/(x^2+x+1)^2dif x\
		=&-4/9integral (dif x)/(x-1)+1/3integral (dif x)/(x-1)^2+2/9integral (2x+1)/(x^2+x+1)dif x\
		&++1/3integral (dif x)/(x^2+x+1)+1/6integral (2x+1)/(x^2+x+1)^2dif x-1/2integral (dif x)/(x^2+x+1)^2\
		=&-4/9log abs(x-1)-1/(3(x-1))+2/9log(x^2+x+1)\
		&++2/(3sqrt(3))arctan (2x+1)/sqrt(3)-1/(6(x^2+x+1))-1/2Int(integral (dif x)/(x^2+x+1)^2)
	$接下来解$
		Int(integral (dif x)/(x^2+x+1)^2)=integral dif(x+1/2)/[(x+1/2)^2+3/4]^2=&8integral (dif u)/(u^2+3)^2 quad subst(u=2x+1)\
		=&8/3integral (dif u)/(u^2+3)+4/3integral u dif 1/(u^2+3)\
		=&(4u)/(3(u^2+3))+4/(3sqrt(3))arctan u/sqrt(3)+C_1
	$所以$
		integral (2x+1)/((x-1)^2(x^2+x+1)^2)dif x=&-4/9log abs(x-1)-1/(3(x-1))\
		&++2/9log(x^2+x+1)-(x+1)/(3(x^2+x+1))+C
	$],
)
#comment[
	这是模法在解决分母含二次重因式的有理函数裂项时的应用。这里解决$A,B$的思路可以分为两步：第一步是将分母变为单项式；第二步是在分子上换掉常数，来实现分子分母约分。#parbreak()
	第一步往往是通过合理拼凑并套用平方差公式来实现的。当模数为$u^2$时，设法将分母化为$a(u+-v)$的形式，再分子分母同乘$u-+v$得到新分母$a(u^2-v^2)$，这样就可以直接取模得$-a v^2$了。如果$v$是单项式，那么分母就是单项式了，本题便是如此。#parbreak()
	第二步往往会遭遇形如$P(x)/x^n mod Q(x)$的问题。可以这样考虑：如果$P(x)$没有常数项，那么就和分母约分到分子有常数项（或分母变为常数）为止；如果$P(x)$有常数项，那么就有$Q(x)$（它是必有常数项的，否则说明因式分解不完全）的某个倍数加在常数项上，使分子没有常数项，这样就可以在分子分母上约掉$x^m$，循环往复，直到分母约分成常数，这样整个计算就完成了。#ref("(x-2)/(x^4+2x^3-3x^2-4x+4)")也可以沿用同样的思路。
]
#question(
	tag:"1/(x^8+x^4+1)",
	category:blue,
	question:$integral (dif x)/(x^8+x^4+1)$,
	answer:[$
		integral (dif x)/(x^8+x^4+1)=1/2Int(#1,integral (x^2+1)/(x^4+x^2+1)dif x)-1/2Int(#2,integral (x^2-1)/(x^4-x^2+1)dif x)
	$分别解这两个积分，得：#multi-eq($
		Int(#1)=Int(#1,integral (x^2+1)/(x^4+x^2+1)dif x)=dif(x-x^(-1))/((x-x^(-1))^2+3)=1/sqrt(3)arctan (x-x^(-1))/sqrt(3)+C_1
	$,$
		Int(#2)=Int(#2,integral (x^2-1)/(x^4-x^2+1)dif x)=dif(x+x^(-1))/((x+x^(-1))^2-3)=1/(2sqrt(3))log abs((x+x^(-1)-sqrt(3))/(x+x^(-1)+sqrt(3)))+C_2
	$)所以原积分可表示为$
		1/2Int(#1)-1/2Int(#2)=1/(2sqrt(3))arctan (x^2-1)/(sqrt(3)x)-1/(4sqrt(3))log (x^2-sqrt(3)x+1)/(x^2+sqrt(3)x+1)+C
	$],
)
#comment[
	本题较为综合，虽然分母为八次，但通过裂项就可以将其转化为两个分母为四次的积分，裂项过和也相当易算。但是倘若对$Int(#1),Int(#2)$再进行裂项，操作就又比较繁琐了，不如用对勾换元的方式来做。
]
#question(
	tag:"1/(x(x+1)^2)~",
	question:$integral (dif x)/(x(x+1)^2)$,
	answer:$
		integral (dif x)/(x(x+1)^2)=&integral 1/x dif (-1)/(x+1)\
		=&integral (x-x+1)/x dif (x-x-1)/(x+1)\
		=&integral ((x+1)/x-1)dif x/(x+1)\
		=&integral 1/(x/(x+1))dif x/(x+1)-integral dif x/(x+1)\
		=&log abs(x/(x+1))-x/(x+1)+C
	$,
)
#comment[
	这种做法比较有技巧性，乍看上去像倒代换，但实际上更像是利用倒代换辅助完成分式线性替换的操作。后来的许多涉及莫比乌斯变换的题目中都会用到类似的方法（如#ref("1/(1-x^2)root(4,x+x^3)")），读者在这里可以先略做了解。
]
#question(
	tag:"(x+1+logx)/((x+1)^2+(xlogx)^2)",
	question:$integral (x+1+log x)/((x+1)^2+(x log x)^2)dif x$,
	answer:[$
		integral (x+1+log x)/((x+1)^2+(x log x)^2)dif x=integral ((x+1+log x)/(x+1)^2)/(((x log x)/(x+1))^2+1)dif x
	$试导$dif/(dif x)((x log x)/(x+1))=(x+1+log x)/(x+1)^2$，所以$
		integral ((x+1+log x)/(x+1)^2)/(((x log x)/(x+1))^2+1)dif x=integral 1/(((x log x)/(x+1))^2+1)dif (x log x)/(x+1)=arctan (x log x)/(x+1)+C
	$],
)
#comment[
	本题与#ref("6^x/(4^x+9^x)")相仿，但难度更大了。这个被积函数的分母是$u^2+v^2$的结构，可以联想原函数是反正切结构的。为此应当通过恒等变换将分母化为$(u/v)^2+1$的形式。进一步，大胆猜想分子的$(x+1+log x)/(x+1)^2$应当与$(x log x)/(x+1)$的导数有密切联系，所以就通过试导后者来观察之。
]
#question(
	tag:"(x-sinxcosx)/(x^2cos^2x+sin^2x)",
	question:$integral (x-sin x cos x)/(x^2cos^2x+sin^2x)dif x$,
	answer:$
		integral (x-sin x cos x)/(x^2cos^2x+sin^2x)dif x=integral ((x-sin x cos x)/sin^2x)/(((x cos x)/(sin x))^2+1)dif x=&-integral 1/(((x cos x)/(sin x))^2+1)dif (x cos x)/(sin x)\
		=&-arctan (x cos x)/(sin x)+C
	$,
)
#comment[
	本题没有写明试导的过程，读者可以自行尝试。
]
#question(
	tag:"(1-logx)/(x-logx)^2",
	question:$integral (1-log x)/(x-log x)^2dif x$,
	answer:[试导可知$dif/(dif x)(1/(x-log x))=(1/x-1)/(x-log x)^2$，所以$
		integral (1-log x)/(x-log x)^2dif x=&integral (1-log x)/(1/x-1)dot (1/x-1)/(x-log x)^2dif x\
		=&integral (1-log x)/(1/x-1)dif 1/(x-log x)\
		=&(x-x log x)/((1-x)(x-log x))-integral 1/(x-log x)dif (x-x log x)/(1-x)\
		=&(x-x log x)/((1-x)(x-log x))-integral 1/(x-1)^2dif x\
		=&(x-x log x)/((1-x)(x-log x))+1/(x-1)+C\
		=&(log x)/(x-log x)+C
	$],
)
#comment[
	本题的关键在于处理积分$integral (f(x))/(p^2(x))dif x$时分子分母同乘$p'(x)$并凑微分$dif 1/p$再分部积分，就能得到新积分$integral (g(x))/(p'^2(x))dif x$。这样做的前提是分母中的$p(x)$求导后可以简化。通过这种方式简化分母到一定程度，就可以变成很容易解决的积分了。#parbreak()
	这类题目的套路比较相似，掌握套路之后也很容易按图索骥，比如#ref("(cosx(2x+sinxcosx))/(xsinx+cosx)^3")#ref("(sqrt(x^2+1)logx-xarsinhx)/(sqrt(x^2+1)-xarsinhx)^2")
]
#question(
	tag:"x^-1secx/(x^-1+secx)^2",
	question:$integral (x^(-1)sec x)/(x^(-1)+sec x)^2dif x$,
	answer:[$
		integral (x^(-1)sec x)/(x^(-1)+sec x)^2=&integral (x cos x)/(x+cos x)^2dif x\
	$试导可知$dif/(dif x)(1/(x+cos x))=(sin x-1)/(x+cos x)^2$，所以$
		integral (x cos x)/(x+cos x)^2dif x=&integral (x cos x)/(sin x-1)dot (sin x-1)/(x+cos x)^2dif x\
		=&integral (x cos x)/(sin x-1)dif 1/(x+cos x)\
		=&(x cos x)/((sin x-1)(x+cos x))-integral (sin x cos x-cos x-x+x sin x)/((x+cos x)(sin x-1)^2)dif x\
		=&(x cos x)/((sin x-1)(x+cos x))+integral (dif x)/(1-sin x)\
		=&(x cos x)/((sin x-1)(x+cos x))+tan x+sec x+C
	$],
)
#comment[
	本题与#ref("(1-logx)/(x-logx)^2")的不同点在于，分母的$x^(-1)+sec x$在求导后会变复杂。因此需要先通过适当的恒等变换将分母化为求导后能变简单的类型，然后才能使用分部积分。
]
#question(
	tag:"e^(xsinx+cosx)(x^4cos^3x-xsinx+cosx)/(x^2cos^2x)",
	question:$integral ee^(x sin x+cos x)(x^4cos^3x-x sin x+cos x)/(x^2cos^2x)dif x$,
	answer:[
		#let u=$x sin x+cos x$
		试导可知$dif/(dif x)ee^#u=x cos x ee^#u$，所以$
		&integral ee^#u (x^4cos^3x-x sin x+cos x)/(x^2cos^2x)dif x\
		=&integral x^2cos x ee^#u dif x+integral ee^#u 1/(x^2cos^2x)dif(x cos x)\
		=&integral x dif ee^#u -integral ee^(x sin x+cos x)dif 1/(x cos x)\
		=&integral x dif ee^#u -ee^#u/(x cos x)+integral ee^#u dif x\
		=&ee^#u (x-1/(x cos x))+C
	$],
)
#comment[
	指数复合函数是求导不能消掉的，所以倘若被积函数中有$ee^u$，那么原函数也必定含有$ee^u$，因此试导$ee^u$观察导数有助于快速找到适当的结构来辅助凑微分，从而解开整个题目。
]
#question(
	tag:"(1-x)/(2x+x^2e^-x)",
	question:$integral (1-x)/(2x+x^2ee^(-x))dif x$,
	answer:$
		integral (1-x)/(2x+x^2ee^(-x))dif x=&integral ((1-x)ee^(-x))/(2x ee^(-x)+(x ee^(-x))^2)dif x\
		=&integral dif(x ee^(-x))/(x ee^(-x)(x ee^(-x)+2))\
		=&integral (dif u)/(u(u+2)) quad subst(u=x ee^(-x))\
		=&1/2log abs((x ee^(-x))/(x ee^(-x)+2))+C
	$,
)
#comment[
	本题属于指数锁问题，其典型特征是分母中混有一个指数函数$ee^g(x)$而分子没有指数函数。因为分子不含指数，凑微分时就无法通过拼凑得到与分母有关的结构，于是问题就锁在此处了。#parbreak()
	指数锁问题的一般解法是凑微分成$dif[f(x)ee^(k g(x))]$的形状。因为$dif[f(x)ee^(k g(x))]=[f'(x)+k g'(x)f(x)]ee^(k g(x))dif x$，所以$f'(x)+k g'(x)f(x)$作为因式一定能在被积函数的分子中获得体现。因此通过观察分子结构，可以猜出或解出$f(x)$和$k$，从而完成凑微分的操作。#parbreak()
	在本题中，目标是凑$dif[f(x)ee^(-k x)]$，所以可以列方程$f'(x)-k f(x)=(1-x)h(x)$，其中$h(x)$只是一个因式，无需关注。那么根据这个方程，可以得到$f'(x)$和$f(x)$的比例关系：要么是$(f'(x))/(-k f(x))=1/(-x)$，要么是$(f'(x))/(-k f(x))=(-x)/1$。很显然，$cases(f(x)=x,k=1)$是满足第一个式子的，因此接下来整道题的大方向就是凑$dif(x ee^(-x))$。
]
#question(
	tag:"(tanx-cosx)/(2+e^(sinx)cosx)^2",
	question:$integral (tan x-cos x)/(2+ee^(sin x)cos x)^2dif x$,
	answer:$
		integral (tan x-cos x)/(2+ee^(sin x)cos x)^2dif x=&integral (ee^(-2sin x)(tan x sec^2x-sec x))/(2ee^(-sin x)sec x+1)^2dif x\
		=&integral (ee^(-sin x)sec x)/(2ee^(-sin x)sec x+1)^2ee^(-sin x)(tan x sec x-1)dif x\
		=&integral (ee^(-sin x)sec x)/(2ee^(-sin x)sec x+1)^2dif(e^(-sin x)sec x)\
		=&1/2integral (dif u)/(2u+1)-1/2integral (dif u)/(2u+1)^2 quad subst(u=ee^(-sin x)sec x)\
		=&1/4log abs(2ee^(-sin x)sec x+1)+1/(4(2ee^(-sin x)sec x+1))+C
	$,
)
#comment[
	本题也是指数锁问题，但比#ref("(1-x)/(2x+x^2e^-x)")更复杂些。因为这次指数部分是$ee^(sin x)$，所以本题的目标是凑$dif[f(x)ee^(k sin x)]=[f'(x)+k f(x)cos x]ee^(-k sin x)$。#parbreak()
	本题的分子是$tan x-cos x$，所以可以列方程$f'(x)-k f(x)cos x=(tan x-cos x)h(x)$。那么根据这个方程，可以得到$f'(x)$和$f(x)$的比例关系：要么是$(f'(x))/(k f(x)cos x)=(tan x)/(-cos x)$，要么是$(f'(x))/(k f(x)cos x)=(-cos x)/(tan x)$。很显然，$cases(f(x)=cos x,k=1)$是满足第一个式子的，因此接下来整道题的大方向就是凑$dif[cos x ee^(sin x)]$。#parbreak()
	笔者这里所讲的只是一种通过少量计算推测凑微分方向的做法；而在实际解题过程中，读者如能敏锐地察觉到这个方向，那就不必拘泥于刚才这套麻烦的流程。
]
#question(
	tag:"[1-x(e^x+1)/(e^x+x)]1/sqrt(e^2x-x^2)",
	question:$integral [1-x (ee^x+1)/(ee^x+x)](dif x)/sqrt(ee^(2x)-x^2)$,
	answer:$
		integral [1-x (ee^x+1)/(ee^x+x)](dif x)/sqrt(ee^(2x)-x^2)=&integral ((1-x)ee^x)/((x+ee^x)sqrt(ee^(2x)-x^2))dif x\
		=&integral ((1-x)ee^(-x))/((x ee^(-x)+1)sqrt(1-(x ee^(-x))^2))dif x\
		=&integral (dif u)/((u+1)sqrt(1-u^2))quad subst(u=x ee^(-x))\
		=&integral sqrt(1+u)/((u+1)^2sqrt(1-u))dif u\
		=&-integral sqrt((1+u)/(1-u))dif 1/(u+1)\
		=&-1/2integral 1/sqrt((1-u)/(1+u))dif (1-u)/(1+u)\
		=&-sqrt((1-u)/(1+u))+C\
		=&-sqrt((ee^x-x)/(ee^x+x))+C
	$,
)
#comment[
	本题首先应当将被积函数化简，再观察其结构。化简后分子出现因式$1-x$很容易让人联想到$x ee^(-x)$的导数形式，于是就尝试向这个方向凑。如果观察不出来，也可以使用上而介绍的微分方程法。#parbreak()
	$(dif u)/((u+1)sqrt(1-u^2))$是一个二项式微分，可以使用#ref("sqrt(x/(x+1))")中介绍的分式线性替换方法来解。这里的操作则模仿了#ref("1/(x(x+1)^2)~")的做法，能免去换元的麻烦。
]
#question(
	tag:"(3sinx-xcosx)/(x^4+xsinx)",
	question:$integral (3sin x-x cos x)/(x^4+x sin x)dif x$,
	answer:$
		integral (3sin x-x cos x)/(x^4+x sin x)dif x=&integral (3x^(-4)sin x-x^(-3)cos x)/(1+x^(-3)sin x)dif x\
		=&-integral dif(x^(-3)sin x)/(1+x^(-3)sin x)\
		=&-log(1+x^(-3)sin x)+C
	$,
)
#comment[
	这也是一种锁的题型，但锁不是出现在对数函数上，而是在幂函数上。在这个问题中，分母$x^4$的导数无法在任何地方得到体现，直接拼凑也很难得到有效结果。这里可以仿照指数锁的处理思路，试图分子分母同乘$x^a$凑$dif[x^k f(x)]$。#parbreak()
	如果读者无法直接试出来，那么仍然可以使用类似的辅助计算。因为$dif[x^k f(x)]=[f'(x)+k/x f(x)]x^k dif x$，所以根据分子列方程$f'(x)+k/x f(x)=(3sin x-x cos x)h(x)$，得到比例关系$(f'(x))/(k/x f(x))=(3sin x)/(-x cos x)$或$(f'(x))/(k/x f(x))=(-x cos x)/(3sin x)$。显然$cases(f(x)=sin x,k=-3)$是满足第二个式子的，于是本题的目标就是凑$dif(x^(-3)sin x)$。
]
#question(
	tag:"logx/sqrt((x/e)^x-2)",
	question:$integral (log x)/sqrt((x/ee)^x-2)dif x$,
	answer:$
		integral (log x)/sqrt((x/ee)^x-2)dif x=&integral dif(x log x-x)/sqrt(ee^(x log x-x)-2)\
		=&integral (dif u)/sqrt(ee^u-2)quad subst(u=x log x-x)\
		=&integral ee^(-u/2)/sqrt(1-2ee^(-u))dif u\
		=&-sqrt(2)integral dif(sqrt(2)ee^(-u/2))/sqrt(1-(sqrt(2)ee^(-u/2))^2)\
		=&-sqrt(2)arcsin(sqrt(2)ee^(-u/2))+C\
		=&-sqrt(2)arcsin sqrt(2(ee/x)^x)+C
	$,
)
#comment[
	这也是一种指数锁问题，只不过$ee^(x log x-x)$通过变形化成了$(x/ee)^x$，看上去就不太寻常了。遇到此类问题时，建议优先通过恒等变换将其化成以$ee$为底的指数函数形式，能使思考方向更加清晰。
]
#question(
	tag:"sqrt(e^2x+e^x+1)",
	question:$integral sqrt(ee^(2x)+ee^x+1)dif x$,
	answer:$
		integral sqrt(ee^(2x)+ee^x+1)dif x=&integral sqrt(u^2+u+1)/u dif u quad subst(u=ee^x)\
		#let (u,v)=($sqrt(u^2+u+1)$,$sqrt(u^(-2)+u^(-1)+1)$)
		=&integral (u^2+u+1)/(u#u)dif u\
		=&1/2integral (2u^2+u)/(u#u)dif u+1/2integral (u dif u)/(u#u)+integral (dif u)/(u#u)\
		=&1/2integral dif(u^2+u)/#u+1/2integral (dif u)/#u+integral (dif u)/(u^2#v)\
		=&#u+1/2log(2u+1+2#u)-integral (dif u^(-1))/#v\
		=&sqrt(ee^(2x)+ee^x+1)+1/2log(2ee^x+1+2sqrt(ee^(2x)+ee^x+1))\
		&--log(2e^(-x)+1+2sqrt(ee^(-2x)+ee^(-x)+1))+C
	$,
)
#comment[
	本题与#ref("sqrt(1-x^2)/(1+x)")相似，是根号移分母原则的体现。这里倘若将根号放分子上，就不能拼凑以简化被和函数；但是只要将根号移到分母，就可以通过拼凑分子的方式进行合理凑微分，从而打开局面。#parbreak()
	另外，因为这里$u>0$，所以开平方不用带绝对值。
]
#question(
	tag:"1/(sqrt(x^2+x+1)-1)",
	question:$integral (dif x)/(sqrt(x^2+x+1)-1)$,
	answer:$
		#let (u,v,w)=($sqrt(x^2+x+1)$,$sqrt(x^(-2)+x^(-1)+1)$,$sqrt((x+1)^(-2)-(x+1)^(-1)+1)$)
		&integral (dif x)/(#u -1)\
		=&integral #u/(x^2+x)dif x+integral (dif x)/(x^2+x)\
		=&integral (x^2+x+1)/((x^2+x)#u)dif x+log abs(x/(x+1))\
		=&integral (x^2+x-x)/((x^2+x)#u)dif x+integral (dif x)/(x#u)+log abs(x/(x+1))\
		=&integral (dif x)/#u -integral (dif x)/((x+1)#u)-sgn x integral (dif x^(-1))/#v+log abs(x/(x+1))\
		=&log(2x+1+2#u)-sgn(x+1)integral (dif x)/((x+1)^2#w)\
		&--sgn x integral (dif x^(-1))/#v+log abs(x/(x+1))\
		=&log(2x+1+2#u)\
		&++log[2(x+1)^(-1)-1+2#w]sgn(x+1)\
		&--log(2x^(-1)+1+2#v)sgn x+log abs(x/(x+1))+C
	$
)
#comment[
	这个问题比#ref("sqrt(e^2x+e^x+1)")要更进一步，需要考虑的因素包括分母有理化（一般使用平方差公式）、根号移分母和适当拼凑简化计算。这些不是靠书本知识传授就能快速掌握的，需要读者在做题过程中反复体会方可。
]
#question(
	tag:"((x^4-1)sqrt(x^4+x^2+1))/(x^4+1)^2",
	question:$integral ((x^4-1)sqrt(x^4+x^2+1))/(x^4+1)^2dif x$,
	answer:$
		&integral ((x^4-1)sqrt(x^4+x^2+1))/(x^4+1)^2dif x\
		=&sgn x integral ((x-x^(-3))sqrt(x^2+x^(-2)+1))/(x^4+1)^2dif x\
		=&1/2sgn x integral sqrt(u+1)/u^2dif u quad subst(u=x^2+x^(-2))\
		=&-sqrt(u+1)/(2u)sgn x+1/2sgn x integral 1/(u+1-1)dif sqrt(u+1)\
		=&-sqrt(u+1)/(2u)sgn x+1/4log abs((sqrt(u+1)-1)/(sqrt(u+1)+1))sgn x+C\
		=&-(x sqrt(x^4+x^2+1))/(2(x^4+1))+1/4log abs((sqrt(x^4+x^2+1)-x)/(sqrt(x^4+x^2+1)+x))+C
	$,
)
#comment[
	这是伪橢圆积分问题的常见类型，典型特征是二次根号下有无重根的高次（三次及以上）多项式。这类问题的常见做法是整体换元（例如本题的对勾换元），但往往要做一定的恒等变换才可以凑到恰如其分。#parbreak()
	这类问题涉及的恒等变换相对灵活，也没有统一的套路可言，可能需要结合各种恒等变换技巧。本题用到的分子分母同除$x^4$后凑对勾换元的思路，是在整体次数为$-2$的问题中需要优先考虑的方法，比如#ref("(1-x)/((1+x)sqrt(x^4+kx^2+1)")。
]
#question(
	tag:"(sqrt(x^6+1)(2x^6+1))/(x^6-x^2+1)^2",
	question:$integral (sqrt(x^6+1)(2x^6-1))/(x^6-x^2+1)^2dif x$,
	answer:$
		integral (sqrt(x^6+1)(2x^6-1))/(x^6-x^2+1)^2dif x=&sgn x integral (sqrt(x^4+x^(-2))(2x^3-x^(-3)))/(x^4+x^(-2)-1)^2dif x\
		=&(sgn x)/2integral sqrt(u)/(u-1)^2dif u quad subst(u=x^4+x^(-2))\
		=&-(sgn x)/2integral sqrt(u)dif 1/(u-1)\
		=&-(sqrt(u)sgn x)/(2(u-1))+(sgn x)/2integral 1/(u-1)dif sqrt(u)\
		=&-(x sqrt(x^6+1))/(2(x^6-x^2+1))+1/4log (sqrt(x^6+1)-x)/(sqrt(x^6+1)+x)+C
	$,
)
#comment[
	本题与#ref("((x^4-1)sqrt(x^4+x^2+1))/(x^4+1)^2")不同，使用的换元并非对勾形式。这里的思路突破口应当是分子的$2x^6-1$因子，用它来凑微分。再看其它的因子，共同特点是有$x^6+1$的结构，于是猜想应当凑$dif(x^(n+6)+x^n)$的形式。#parbreak()
	这里也可以化用解决指数锁问题的推测方法：根据$dif(x^(n+6)+x^n)=[(n+6)x^(n+6)+n x^n]x^(-1)dif x$列方程$(n+6)x^(n+6)+n x^n=(2x^6-1)h(x)$可得比例关系$((x+6)x^(n+6))/(n x^n)=(2x^6)/(-1)$或$((x+6)x^(n+6))/(n x^n)=(2x^6)/(-1)$。显然$n=-2$能满足第一个式子，所以本题的目标就是凑$dif(x^4+x^(-2))$。
]
#question(
	tag:"log(1+sqrt((x+1)/x))",
	question:$integral log(1+sqrt((x+1)/x))dif x$,
	answer:$
		#let u=$sqrt((x+1)/x)$
		integral log(1+sqrt((x+1)/x))dif x=&x log(1+#u)-integral x/(1+#u)dif #u\
		=&x log(1+#u)-integral (dif #u)/(((x+1)/x-1)(1+#u))\
		=&x log(1+#u)-integral (dif u)/((u^2-1)(u+1))quad subst(u=sqrt((x+1)/x))\
		=&x log(1+#u)-1/(2#u+2)-1/4log abs((#u -1)/(#u+1))+C
	$,
)
#comment[
	本题起手的思路当然是直接分部积分，但是不要对$log(1+sqrt((x+1)/x))$彻底求导，否则会将问题变得更麻烦。只需求导至$sqrt((x+1)/x)$即可，后续就将被积函数中的$x$用$sqrt((x+1)/x)$来替代。这个过程比较考验恒等变换能力，可以换元$subst(t=sqrt((x+1)/x))$然后反解出$x$关于$t$的表达式来辅助计算。#parbreak()
	另外仍然注意不要无视定义域随意拆偶数次根式，比如这里结果式中的$1/(2sqrt((x+1)/x)+2)$就不能变形为$sqrt(x)/(2sqrt(x+1)+2sqrt(x))$。
]
#question(
	tag:"sqrt(sqrt(x^2+1)+x)",
	question:$integral sqrt(sqrt(x^2+1)+x)dif x$,
	answer:[
		#let u=$sqrt(x^2+1)$
		令$Int(#1)=Int(#1,integral sqrt(#u+x)dif #u),Int(#2)=Int(#2,integral sqrt(#u+x)dif x)$，并分别求出#multi-eq(with-number:true,$
		Int(#1)+Int(#2)=&integral sqrt(#u+x)dif(#u+x)\
		=&2/3sqrt(#u+x)^3+C_1
	$,$
	Int(#1)-Int(#2)=&integral sqrt(#u+x)dif(#u -x)\
	=&integral dif(#u -x)/sqrt(#u -x)\
	=&2sqrt(#u -x)+C_2
	$)联立#ref-eq(1)#ref-eq(2)，解得$
		Int(#2)=1/3sqrt(#u+x)^3-sqrt(#u -x)+C
	$],
)
#comment[
	这是组合积分法的应用，涉及平方差形式的恒等变换$(sqrt(x^2+1)+x)(sqrt(x^2+1)-x)=1$。
]
#question(
	tag:"sqrt(sinxcos^3x)",
	category:blue,
	question:$integral sqrt(sin x cos^3x)dif x$,
	answer:[$
		integral sqrt(sin x cos^3x)dif x=sgn(cos x)Int(#1,integral sqrt(sin x cos x)dif sin x)
	$令$Int(#1)=Int(#1,integral sqrt(sin x cos x)dif sin x),Int(#2)=Int(#2,integral sqrt(sin x cos x)dif cos x)$，并分别求出#multi-eq(with-number:true,$
		Int(#1)+Int(#2)=&integral sqrt(sin x cos x)dif(sin x+cos x)\
		=&integral sqrt(((sin x+cos x)^2-1)/2) dif(sin x+cos x)\
		=&1/sqrt(2)integral sqrt(u^2-1)dif u quad subst(u=sin x+cos x)\
		=&1/(2sqrt(2))u sqrt(u^2-1)-1/(2sqrt(2))log abs(u+sqrt(u^2-1))+C_1
	$,$
		Int(#2)-Int(#1)=&integral sqrt(sin x cos x)dif(cos x-sin x)\
		=&integral sqrt((1-(cos x-sin x)^2)/2)dif(cos x-sin x)\
		=&1/sqrt(2)integral (1-v^2)dif v quad subst(v=cos x-sin x)\
		=&1/(2sqrt(2))v sqrt(1-v^2)+1/(2sqrt(2))arcsin v+C
	$)联立#ref-eq(1)#ref-eq(2)，解得$
		Int(#1)=&1/4(sin x+cos x)sqrt(sin x cos x)sgn(cos x)-1/(4sqrt(2))log abs(sin x+cos x+sqrt(2sin x cos x))sgn(cos x)\
		&--1/4(cos x-sin x)sqrt(sin x cos x)sgn(cos x)-1/(4sqrt(2))arcsin(cos x-sin x)sgn(cos x)+C
	$
	],
)
#comment[
	善用恒等变换$2sin x cos x=(sin x+cos x)^2-1=1-(sin x-cos x)^2$在组合积分法的使用中会有很大帮助。
]
#question(
	tag:"1/((x^2+1)sqrt(x^2+x+1))",
	question:$integral (dif x)/((x^2+1)sqrt(x^2+x+1))$,
	answer:[令$subst(x=tan t,t in(-pi/2,pi/2))$，则$
		integral (dif x)/((x^2+1)sqrt(x^2+x+1))=integral (dif t)/sqrt(tan^2t+tan t+1)=Int(#2,integral (cos t dif t)/sqrt(1+sin t cos t))
	$令$Int(#1)=Int(#1,integral (sin t dif t)/sqrt(1+sin t cos t)),Int(#2)=Int(#2,integral (cos t dif t)/sqrt(1+sin t cos t))$，并分别求出#multi-eq(with-number:true,$
		Int(#1)+Int(#2)=&integral (sin t+cos t)/sqrt(1+sin t cos t)dif t\
		=&sqrt(2)integral 1/sqrt(3-(sin t-cos t)^2)dif(sin t-cos t)\
		=&sqrt(2)arcsin (sin t-cos t)/sqrt(3)+C_1\
		=&sqrt(2)arcsin (x-1)/sqrt(3x^2+3)+C_1
	$,$
		Int(#2)-Int(#1)=&integral (cos t-sin t)/sqrt(1+sin t cos t)dif t\
		=&sqrt(2)integral 1/sqrt((sin t+cos t)^2+1)dif(sin t+cos t)\
		=&sqrt(2)log(sin t+cos t+sqrt(2+2sin t cos t))+C_2\
		=&sqrt(2)log((x+1)/sqrt(x^2+1)+sqrt((2x^2+2x+2)/(x^2+1)))+C_2
	$)联立#ref-eq(1),#ref-eq(2)，解得$
		Int(#2)=1/sqrt(2)arcsin (x-1)/sqrt(3x^2+3)+1/sqrt(2)log (x+1+sqrt(2x^2+2x+2))/sqrt(x^2+1)+C
	$],
)
#comment[
	形如$integral (dif x)/((x^2+a^2)sqrt(x^2+b x+c))$和$integral (dif x)/((x^2+b x+c)sqrt(x^2+a))$的积分都可以如此换元，然后使用组合积分法求出。#parbreak()
	需要指出，恒等变换$1/sqrt(tan^2t+tan t+1)=(cos t)/sqrt(1+sin t cos t)$过程中$cos t$并不需要带绝对值，这是因为在换元时已经限制了$t in(-pi/2,pi/2)$，就恒有$cos t>0$。
]
#question(
	tag:"(sinx+cosx)/(2sin^2x-4sinxcosx+5cos^2x)",
	question:$integral (sin x+cos x)/(2sin^2x-4sin x cos x+5cos^2x)dif x$,
	answer:[令$Int(#1)=Int(#1,integral (sin x dif x)/(2sin^2x-4sin x cos x+5cos^2x)),Int(#2)=Int(#2,integral (cos x dif x)/(2sin^2x-4sin x cos x+5cos^2x))$，并分别求出#multi-eq(with-number:true,$
		2Int(#1)+Int(#2)=&integral (2sin x+cos x)/(1+(2cos x-sin x)^2)dif x\
		=&integral dif(2cos x-sin x)/((2cos x-sin x)^2+1)\
		=&arctan(2cos x-sin x)+C_1\
	$,$
		Int(#1)-2Int(#2)=&integral (sin x-2cos x)/(6-(2sin x+cos x)^2)dif x\
		=&-integral dif(2sin x+cos x)/((2sin x+cos x)^2-6)\
		=&-1/(2sqrt(6))log abs((2sin x+cos x-sqrt(6))/(2sin x+cos x+sqrt(6)))+C_2
	$)联立#ref-eq(1)#ref-eq(2)，解得$
		Int(#1)+Int(#2)=-3/5arctan(2cos x-sin x)-1/(10sqrt(6))log (sqrt(6)-2sin x-cos x)/(sqrt(6)+2sin x+cos x)+C
	$],
)
#comment[
	本题的做法可以推广到一般的情形，即$integral (alpha sin x+beta cos x)/(a sin^2x+b sin x cos x+c cos^2x)dif x$，读者可以自行尝试。
]
#question(
	tag:"sin^3x/(sin^3x+cos^3x)",
	question:$integral (sin^3x)/(sin^3x+cos^3x)dif x$,
	answer:[设$Int(#1)=Int(#1,integral (sin^3x)/(sin^3x+cos^3x)dif x),Int(#2)=Int(#2,integral (cos^3x)/(sin^3x+cos^3x)dif x)$，并分别求出#multi-eq(with-number:true,$
		Int(#1)+Int(#2)=integral dif x=x+C_1
	$,$
		Int(#1)-Int(#2)=&integral ((sin x-cos x)(1+sin x cos x))/((sin x+cos x)(1-sin x cos x))dif x\
		=&integral ((sin^2x-cos^2x)(2+sin 2x))/((sin x+cos x)^2(2-sin 2x))dif x\
		=&1/2integral ((2+sin 2x)cos 2x)/((1+sin 2x)(sin 2x-2)) dif 2x\
		=&1/2integral (u+2)/((u+1)(u-2))dif u quad subst(u=sin 2x)\
		=&2/3log(2-sin 2x)-1/6log(1+sin 2x)+C_2
	$)联立#ref-eq(1)#ref-eq(2)解得$
		Int(#1)=x/2+1/3log(2-sin 2x)-1/12log(1+sin 2x)+C
	$],
)
#comment[
	虽然这里的$integral ((sin x-cos x)(1+sin x cos x))/((sin x+cos x)(1-sin x cos x))dif x$可以直接凑微分$dif(sin x+cos x)$有理化来解决，但是降幂公式在这里也有了用武之地，这样做会更简单一些。在这里也提醒读者不应只会机械化地做题，应当有一定的灵活性。
]
#question(
	tag:"(x^m+x^2m+x^3m)root(m,2x^2m+3x^m+6)",
	question:$integral (x^m+x^(2m)+x^(3m))root(m,2x^(2m)+3x^m+6)dif x space(x>0)$,
	answer:$
		&integral (x^m+x^(2m)+x^(3m))root(m,2x^(2m)+3x^m+6)dif x\
		=&integral (x^(m-1)+x^(2m-1)+x^(3m-1))root(m,2x^(3m)+3x^(2m)+6x^m)dif x\
		=&1/(6m)integral root(m,2x^(3m)+3x^(2m)+6x^m)dif(6x^m+3x^(2m)+2x^(3m))\
		=&1/(6m+6)(2x^(3m)+3x^(2m)+6x^m)^((m+1)/m)+C
	$,
)
#comment[
	这是一个整体凑微分问题，被积函数结杓也很简单，难点就在于“凑什么”。直接将根式的三项式因子凑入是绝对不行的。观察根式的三项式，系数$2,3,6$提示了凑微分时可能会产生$k/3,k/2,k$的一组系数，于是可以考虑将三项式因子变为$x^(3m-1)+x^(2m-1)+x^(m-1)$，而多出的因子$x$再放入根号内，这样思路就打开了。
]
#question(
	tag:"1/(ax^n+b)^((n+1)/n)",
	question:$integral (dif x)/(a x^n+b)^((n+1)/n)space(a,b!=0,n in NN_+)$,
	answer:$
		integral (dif x)/(a x^n+b)^((n+1)/n)=&sgn x integral x^(-n-1)/(a+b x^(-n))^((n+1)/n)dif x\
		=&-1/(b n)sgn x integral dif(a+b x^(-n))/(a+b x^(-n))^((n+1)/n)\
		=&(sgn x)/(b root(n,a+b x^(-n)))+C\
		=&x/(b root(n,a x^n+b))+C
	$,
)
#comment[
	这是阿贝尔换元的基本公式，可以在一些题目中用于凑微分。最常见的是$n=2$的形式$(dif x)/sqrt(a x^2+b)^3=dif x/(b sqrt(a x^2+b))$。这在下文的#ref("e^x(1/sqrt(x^2+1)+(1-2x^2)/sqrt(x^2+1)^5")中也有体现。
]
#question(
	tag:"e^x(1/sqrt(x^2+1)+(1-2x^2)/sqrt(x^2+1)^5",
	question:$integral ee^x (1/sqrt(x^2+1)+(1-2x^2)/sqrt(x^2+1)^5)dif x$,
	answer:[先解$Int(#1,integral (1-2x^2)/sqrt(x^2+1)^5dif x)$：$
		Int(#1,integral (1-2x^2)/sqrt(x^2+1)^5dif x)=&integral (1-2x^2)/(x^2+1)dif x/sqrt(x^2+1)\
		=&integral (1-3x^2/(x^2+1))dif x/sqrt(x^2+1)\
		=&x/sqrt(x^2+1)-x^3/sqrt(x^2+1)^3+C\
		=&x/sqrt(x^2+1)^3+C
	$所以$
		integral ee^x (1/sqrt(x^2+1)+Int(#1,(1-2x^2)/sqrt(x^2+1)^5))dif x=&integral (dif ee^x)/sqrt(x^2+1)+integral ee^x dif Int(#1,x/sqrt(x^2+1)^3)\
		=&ee^x/sqrt(x^2+1)-integral ee^x dif 1/sqrt(x^2+1)+integral ee^x dif x/sqrt(x^2+1)^3\
		=&ee^x/sqrt(x^2+1)+integral x/sqrt(x^2+1)^3dif ee^x+integral ee^x dif x/sqrt(x^2+1)^3\
		=&ee^x/sqrt(x^2+1)+(x ee^x)/sqrt(x^2+1)^3+C_1
	$],
)
#question(
	tag:"xsinx/(3-sin^2x)^3",
	question:$integral (x sin x)/sqrt(3-sin^2x)^3dif x$,
	answer:$
		integral (x sin x)/sqrt(3-sin^2x)^3dif x=&-integral x/sqrt(cos^2x+2)^3dif cos x\
		=&-1/2integral x dif (cos x)/sqrt(cos^2x+2)\
		=&-(x cos x)/(2sqrt(cos^2x+2))+1/2integral (cos x dif x)/sqrt(cos^2x+2)\
		=&-(x cos x)/(2sqrt(cos^2x+2))+1/2integral (dif sin x)/sqrt(3-sin^2x)\
		=&-(x cos x)/(2sqrt(cos^2x+2))+1/2arcsin (sin x)/sqrt(3)+C
	$,
)
#comment[
	本题通过分部积分处理掉被积函数中的幂函数因子，使其容易解决。这个过程中也涉及到积分$integral (dif x)/sqrt(a x^2+b)^3=x/(b sqrt(a x^2+b))+C$的应用，还用到了三角恒等变换，属于比较综合的题目。
]
#question(
	tag:"1/((x^2+2)sqrt(x^2+1))",
	question:$integral (dif x)/((x^2+2)sqrt(x^2+1))$,
	answer:$
		integral (dif x)/((x^2+2)sqrt(x^2+1))=&integral (x^2+1)/((x^2+2)sqrt(x^2+1)^3)dif x\
		=&integral 1/((x^2+2)/(x^2+1))dif x/sqrt(x^2+1)\
		=&sgn x integral 1/(2-x^2/(x^2+1))dif sqrt(x^2/(x^2+1))\
		=&1/(2sqrt(2))log abs((sqrt(x^2/(x^2+1))-sqrt(2))/(sqrt(x^2/(x^2+1))+sqrt(2)))sgn x+C\
		=&-1/(2sqrt(2))log (sqrt(2x^2+2)-x)/(sqrt(2x^2+2)+x)+C
	$,
)
#comment[
	阿贝尔换元$(dif x)/sqrt(a x^2+b)^3=dif x/(b sqrt(a x^2+b))$除了像#ref("e^x(1/sqrt(x^2+1)+(1-2x^2)/sqrt(x^2+1)^5")那样直接使用以外，还可以像本题这样间接使用。间接使用的目的是避免分式换元的麻烦（因为凑微分之后将分子并入根号内就能实现分式换元的效果），和#ref("1/(x(x+1)^2)~")的操作是相仿的。#parbreak()
]
#question(
	tag:"1/((1+5x^4)root(4,1+x^4))",
	question:$integral (dif x)/((1+5x^4)root(4,1+x^4))$,
	answer:$
		integral (dif x)/((1+5x^4)root(4,1+x^4))=&integral (1+x^4)/((1+5x^4)root(4,1+x^4)^5)dif x\
		=&integral 1/((1+5x^4)/(1+x^4))dif x/root(4,x^4+1)\
		=&sgn x integral 1/(1+4x^4/(x^4+1))dif root(4,x^4/(x^4+1))\
		=&(sgn x)/sqrt(2)integral (dif u)/(u^4+1)quad subst(u=root(4,(4x^4)/(x^4+1)))\
		=&1/4sgn x arctan (u-u^(-1))/sqrt(2)-1/8log abs((u+u^(-1)-sqrt(2))/(u+u^(-1)+sqrt(2)))sgn x+C\
		=&1/4arctan (2x^2-sqrt(x^4+1))/(2x root(4,x^4+1))-1/8log (2x^2-2x root(4,x^4+1)+sqrt(x^4+1))/(2x^2+2x root(4,x^4+1)+sqrt(x^4+1))
	$,
)
#comment[
	本题则是#ref("1/(ax^n+b)^((n+1)/n)")形式在$n=4$时的应用。一般来说，对于被积函数只含$x^m$有理式和$root(m,a x^m+b)$的形式，都可以考虑如本题这样的阿贝尔换元。
]
#question(
	tag:"1/((x+2)sqrt(x^2+1))",
	question:$integral (dif x)/((x+2)sqrt(x^2+1))$,
	answer:[$
		integral (dif x)/((x+2)sqrt(x^2+1))=Int(#1,integral (x dif x)/((x^2-4)sqrt(x^2+1)))-2Int(#2,integral (dif x)/((x^2-4)sqrt(x^2+1)))
	$分别解这两个积分，得#multi-eq($
		Int(#1)=Int(#1,integral (x dif x)/((x^2-4)sqrt(x^2+1)))=integral (dif sqrt(x^2+1))/(x^2+1-5)=1/(2sqrt(5))log abs((sqrt(x^2+1)-sqrt(5))/(sqrt(x^2+1)+sqrt(5)))+C_1
	$,$
		Int(#2)=Int(#2,integral (dif x)/((x^2-4)sqrt(x^2+1)))=integral (x^2+1)/(x^2-4)dif x/sqrt(x^2+1)=1/(4sqrt(5))log abs((sqrt(5)x-2sqrt(x^2+1))/(sqrt(5)x+2sqrt(x^2+1)))+C_2
	$)所以原积分可以表示为$
		Int(#1)-2Int(#2)=1/(2sqrt(5))log abs((sqrt(x^2+1)-sqrt(5))/(sqrt(x^2+1)+sqrt(5)))-1/(2sqrt(5))log abs((sqrt(5)x-2sqrt(x^2+1))/(sqrt(5)x+2sqrt(x^2+1)))+C
	$],
)
#comment[
	除了传统的倒代换以外，平方差也是在解决$integral (dif x)/((x+c)sqrt(a x^2+b))$类积分问题中的一个行之有效的方法。本题中的$Int(#1)$可以直接凑微分转变成关于$x^2$的形式，而$Int(#2)$可以如同#ref("1/((x^2+2)sqrt(x^2+1))")那样通过阿贝尔换元来解。
]
#question(
	tag:"1/((x+2)sqrt(x^2+1))",
	question:$integral (dif x)/((x+2)sqrt(x^2+1))$,
	answer:$
		integral (dif x)/((x+2)sqrt(x^2+1))=&integral (dif x)/((x+2)sqrt(((x+2)^2+(2x-1)^2)/5))\
		=&sqrt(5)sgn(x+2)integral (dif x)/((x+2)^2sqrt(1+((2x-1)/(x+2))^2))\
		=&-sqrt(5)sgn(x+2)integral 1/sqrt(((2x-1)/(x+2))^2+1)dif 1/(x+2)\
		=&1/sqrt(5)sgn(x+2)integral 1/sqrt(((2x-1)/(x+2))^2+1)dif(2-5/(x+2))\
		=&1/sqrt(5)integral 1/sqrt(((2x-1)/abs(x+2))^2+1)dif (2x-1)/abs(x+2)\
		=&1/sqrt(5)log[(2x-1)/abs(x+2)+sqrt(((2x-1)/abs(x+2))^2+1)]+C\
		=&1/sqrt(5)log (2x-1+sqrt(5x^2+5))/abs(x+2)+C
	$,
)
#comment[
	这是莫比乌斯换元（可以认为是分式线性替换的一种别名）的做法，本题是其中最简单的一种形式，即配成$(a x+b)/(b x-a)$的形状。这里的$a x+b$正是被积函数中出现的一次多项式。#parbreak()
	这对多项式$a x+b$和$b x-a$的特点是平方和不含一次项：$(a x+b)^2+(b x-a)^2=(a^2+b^2)(x^2+1)$。这种形式可以用于隐藏部分项（如#ref("1/(1-x^2)root(4,x+x^3)")），使问题看起来扑朔迷离，因此是相当有难度的。#parbreak()
	另外，这里还涉及了一个操作$sgn(x+2)(2x-1)/(x+2)=(2x-1)/abs(x+2)$，这是为了提前去掉系数中的符号函数，方便后续对被积函数的形式进行化简。在#ref("1/(1-x^2)root(4,x+x^3)")中也涉及到了这一步。
]
#question(
	tag:"(2n!sinx+x^n)/(e^x+sinx+cosx+sum_(k=0)^nx^k/k!)",
	question:$integral (2n!sin x+x^n)/(ee^x+sin x+cos x+sum_(k=0)^n x^k/k!)dif x$,
	answer:[$
		#let s(n)=$sum_(k=0)^#n x^k/k!$
		integral (2n!sin x+x^n)/(ee^x+sin x+cos x+#s($n$))dif x=&n!integral (2sin x+x^n/n!)/(ee^x+sin x+cos x+sum_(k=0)^n x^k/k!)dif x\
		=&n!integral dif x-n!integral (ee^x+cos x-sin x+#s($n-1$))/(ee^x+sin x+cos x+#s($n$))dif x\
		=&n!x-n!integral dif(ee^x+sin x+cos x+#s($n$))/(ee^x+sin x+cos x+#s($n$))\
		=&n!x-n!log abs(ee^x+sin x+cos x+#s($n$))+C
	$],
)
#comment[
	本题可以视为#ref("x^n/sum_(k=0)^nx^k/k!")的加强版，倘若将这两题联系起来便不难思考解法。这里的思路依然是在分子上凑出一个形式为分母导数的结构。
]
