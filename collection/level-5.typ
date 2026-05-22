#import "../utils.typ":question,comment,subst,ref,multi-eq,Int
#import "../math.typ":*
#question(
	tag:"(ax^5+bx^4+cx^3+dx^2+ex+f)/(x^6+1)",
	question:$integral (a x^5+b x^4+c x^3+d x^2+e x+f)/(x^6+1)dif x$,
	answer:[$
		&integral (a x^5+b x^4+c x^3+d x^2+e x+f)/(x^6+1)dif x\
		=&Int(#1,integral (a x^5)/(x^6+1)dif x)+Int(#2,integral (c x^3+e x)/(x^6+1)dif x)+Int(#3,integral (b x^4+d x^2+f)/(x^6+1)dif x)
	$分别解这三个积分，得#multi-eq($
		Int(#1)=&Int(#1,integral (a x^5)/(x^6+1)dif x)=a/6log(x^6+1)+C_1
	$,$
		Int(#2)=&Int(#2,integral (c x^3+e x)/(x^6+1)dif x)\
		=&1/2integral (c x^2+e)/(x^6+1)dif x^2\
		=&(e-c)/6integral (dif x^2)/(x^2+1)+1/6integral ((c-e)x^2+c+2e)/(x^4-x^2+1)dif x^2\
		=&(e-c)/6log(x^2+1)+(c-e)/12integral (2x^2-1)/(x^4-x^2+1)dif x^2+(c+e)/4integral (dif x^2)/(x^4-x^2+1)\
		=&(e-c)/6log(x^2+1)+(c-e)/12log(x^4-x^2+1)+(c+e)/(2sqrt(3))arctan (2x^2-1)/sqrt(3)+C_2
	$,$
		Int(#3)=&Int(#3,integral (b x^4+d x^2+f)/(x^6+1)dif x)\
		=&(b+2d+f)/2integral (x^2dif x)/(x^6+1)+(b+f)/2integral (x^4-x^2+1)/(x^6+1)dif x+(b-f)/2integral (x^4-1)/(x^6+1)dif x\
		=&(b+2d+f)/2arctan x^3+(b+f)/2arctan x+(b-f)/2integral dif(x+x^(-1))/(x^2+x^(-2)-1)\
		=&(b+2d+f)/2arctan x^3+(b+f)/2arctan x+(b-f)/(4sqrt(3))log (x^2-sqrt(3)x+1)/(x^2+sqrt(3)x+1)+C_3
	$)所以原积分可以表示为$
		&Int(#1)+Int(#2)+Int(#3)\
		=&a/6log(x^6+1)+(e-c)/6log(x^2+1)+(c-e)/12log(x^4-x^2+1)+(c+e)/(2sqrt(3))arctan (2x^2-1)/sqrt(3)\
		&++(b+2d+f)/6arctan x^3+(b+f)/2arctan x+(b-f)/(4sqrt(3))log (x^2-sqrt(3)x+1)/(x^2+sqrt(3)x+1)+C
	$
	],
)
#comment[
	本题使用积木法，比单纯裂项要快捷一些。对于分子为奇数次的情形，都可以通过凑微分$dif x^2$对被积函数进行简化，这样实际上就是解分母为三次的积分了。对于分子为二次的情形，就可以凑微分$dif x^3$对被积函数进行简化。但倘若分子为$x^4$或$1$，就需要费一番周折。#parbreak()
	这里要考虑$integral (x^2)/(x^6+1)dif x,integral (x^4-x^2+1)/(x^6+1)dif x,integral (x^4-x^2+1)/(x^6+1)dif x$。这三个积分都可以通过分子分母约分来简化，前两个都很易做，第三个也可以采用对勾换元来做，而且它们的线性组合总能拼凑出积分$integral (b x^4+d x^2+f)/(x^6+1)$来。
]
#question(
	tag:"1/(x^8+1)",
	question:$integral 1/(x^8+1)dif x$,
	answer:$
		&integral 1/(x^8+1)dif x\
		=&integral dif x-integral x^8/(x^8+1)dif x\
		=&x-1/8integral x dif log(x^8+1)\
		=&x-1/8integral x dif log(x^2+sqrt(2+sqrt(2))x+1)-1/8integral x dif log(x^2-sqrt(2+sqrt(2))x+1)\
		&--1/8integral x dif log(x^2+sqrt(2-sqrt(2))x+1)-1/8integral x dif log(x^2-sqrt(2-sqrt(2))x+1)\
		=&x-1/8integral (2x^2+sqrt(2+sqrt(2))x)/(x^2+sqrt(2+sqrt(2))x+1)dif x-1/8integral (2x^2-sqrt(2+sqrt(2))x)/(x^2-sqrt(2+sqrt(2))x+1)dif x\
		&--1/8integral (2x^2+sqrt(2-sqrt(2))x)/(x^2+sqrt(2-sqrt(2))x+1)dif x-1/8integral (2x^2-sqrt(2-sqrt(2))x)/(x^2-sqrt(2-sqrt(2))x+1)dif x\
		=&1/(8sqrt(4-2sqrt(2)))log (x^2+sqrt(2+sqrt(2))x+1)/(x^2-sqrt(2+sqrt(2))x+1)+1/(8sqrt(4-2sqrt(2)))log (x^2+sqrt(2-sqrt(2))x+1)/(x^2-sqrt(2-sqrt(2))x+1)\
		&++(2sqrt(4-2sqrt(2))-sqrt(2+sqrt(2)))/(8(sqrt(2)-1))arctan (2x+sqrt(2+sqrt(2)))/sqrt(2-sqrt(2))\
		&++(2sqrt(4-2sqrt(2))-sqrt(2+sqrt(2)))/(8(sqrt(2)-1))arctan (2x-sqrt(2+sqrt(2)))/sqrt(2-sqrt(2))\
		&++(2sqrt(4+2sqrt(2))-sqrt(2-sqrt(2)))/(8(1+sqrt(2)))arctan (2x+sqrt(2-sqrt(2)))/sqrt(2+sqrt(2))\
		&++(2sqrt(4+2sqrt(2))-sqrt(2-sqrt(2)))/(8(1+sqrt(2)))arctan (2x-sqrt(2-sqrt(2)))/sqrt(2+sqrt(2))+C\
	$,
)
#comment[
	本题使用对数法，将分母凑微分化为对数之后，只需因式分解就可以直接进行裂项，无需设八个待定系数，较为便利。
]
#question(
	tag:"1/(1+sin^3x)",
	question:$integral (dif x)/(1+sin^3x)$,
	answer:[令$x=t+pi/2$，所以$
		integral (dif x)/(1+sin^3x)=&integral (dif t)/(1+cos^3t)\
		=&integral (dif t)/((cos^2t/2+sin^2t/2)^3+(cos^2t/2-sin^2t/2)^3)\
		=&integral (sec^6t/2)/(1+3tan^4x/2)dif t/2\
		=&integral (u^4+2u^2+1)/(3u^4+1)dif u quad subst(u=tan t/2)\
		=&u/3+2/(3root(4,3))integral (sqrt(3)v^2+1)/(v^4+1)dif v quad subst(u=v/root(4,3))\
		=&u/3+(sqrt(3)+1)/(3sqrt(2sqrt(3)))arctan (v^2-1)/(sqrt(2)v)+(sqrt(3)-1)/(6sqrt(2sqrt(3)))log (v^2-sqrt(2)v+1)/(v^2+sqrt(2)v+1)+C\
		=&1/3tan(x/2-pi/4)+(sqrt(3)+1)/(3sqrt(2sqrt(3)))arctan (sqrt(3)tan^2(x/2-pi/4)-1)/(sqrt(2sqrt(3))tan(x/2-pi/4))\
		&++(sqrt(3)-1)/(6sqrt(2sqrt(3)))log (sqrt(3)tan^2(x/2-pi/4)-sqrt(2sqrt(3))tan(x/2-pi/4)+1)/(sqrt(3)tan^2(x/2-pi/4)+sqrt(2sqrt(3))tan(x/2-pi/4)+1)+C
	$],
)
#comment[
	第一步中把$sin x$变换成$cos t$的好处是$(cos^2t/2+sin^2t/2)^3+(cos^2t/2-sin^2t/2)^3$是可以消掉部分项的，于是分母就只剩下了四次二项式。
]
#question(
	tag:"cos^3x/(sin^5x(sinx+cosx))",
	question:$integral (cos^3x)/(sin^5x(sin x+cos x))dif x$,
	answer:$
		&integral (cos^3x)/(sin^5x(sin x+cos x))dif x\
		=&integral (sin^3x+cos^3x)/(sin^5x(sin x+cos x))dif x-integral (dif x)/(sin^2x(sin x+cos x))\
		=&integral (sin^2x-sin x cos x+cos^2x)/(sin^5x)dif x-integral (2sin^2x+cos^2x-sin^2x)/(sin^2x(sin x+cos x))dif x\
		=&integral 1/(sin^5x)dif x-integral (cos x)/(sin^4x)dif x-2integral 1/(sin x+cos x)dif x+integral (sin x-cos x)/(sin^2x)dif x\
		=&2integral (tan^2x/2+1)^4/(tan^5x/2)dif tan x/2+1/3csc^3x-sqrt(2)log abs(tan(x/2+pi/8))-log abs(tan x/2)+csc x\
		=&1/64tan^4x/2+1/8tan^2x/2+11/8log abs(tan x/2)-1/8cot^2x/2-1/64cot^4x/2+1/3csc^3x\
		&--sqrt(2)log abs(tan(x/2+pi/8))-log abs(tan x/2)+csc x+C
	$,
)
#comment[
	本题涉及到多步使用组合积分法的操作，但在使用的过程中并未将所设参元明确写出来。读者在熟练掌握组合积分法之后，可以像这样跳过列方程直接出结论。
]
#question(
	tag:"1/(1+sinx)^n",
	question:$integral (dif x)/(1+sin x)^n space(n in NN_+)$,
	answer:$
		integral (dif x)/(1+sin x)^n=&2integral (dif x/2)/(sin x/2+cos x/2)^(2n)\
		=&1/2^(n-1)integral dif(x/2-pi/4)/(cos^(2n)(x/2-pi/4))\
		=&2^(1-n)integral sec^2n t dif t quad subst(t=x/2-pi/4)\
		=&2^(1-n)integral sum_(k=0)^(n-1)binom(n-1,k)tan^(2k)t dif tan t\
		=&2^(1-n)sum_(k=0)^(n-1)binom(n-1,k)(tan^(2k+1)(x/2-pi/4))/(2k+1)+C
	$,
)
#comment[
	除了将被积函数化为$sec^(2n)t$的这种方法外，本题还可以换元化为$integral csc^(2n)u$的形式仿照#ref("csc^3x")的方法做。
]
#question(
	tag:"(cosx(2x+sinxcosx))/(xsinx+cosx)^3",
	question:$integral (cos x(2x+sin x cos x))/(x sin x+cos x)^3dif x$,
	answer:$
		&integral (cos x(2x+sin x cos x))/(x sin x+cos x)^3dif x\
		=&integral (2x+sin x cos x)/x dot (x cos x)/(x sin x+cos x)^3dif x\
		=&-1/2integral (2x+sin x cos x)/x dif 1/(x sin x+cos x)^2\
		=&-(2x+sin x cos x)/(2x(x sin x+cos x)^2)+1/2integral (x cos^2x-x sin^2x-sin x cos x)/(x^2(x sin x+cos x)^2)dif x\
		=&-(2x+sin x cos x)/(2x(x sin x+cos x)^2)+1/2integral (x cos^2x-x sin^2x-sin x cos x)/(x^3cos x) dot (x cos x)/(x sin x+cos x)^2dif x\
		=&-(2x+sin x cos x)/(2x(x sin x+cos x)^2)-1/2integral (x cos^2x-x sin^2x-sin x cos x)/(x^3cos x) dif 1/(x sin x+cos x)\
		=&-(2x+sin x cos x)/(2x(x sin x+cos x)^2)-(x cos^2x-x sin^2x-sin x cos x)/(2x^3 cos x(x sin x+cos x))-1/2integral (2x-3tan x+x sec^2x)/x^4dif x\
		=&-(2x+sin x cos x)/(2x(x sin x+cos x)^2)-(x cos^2x-x sin^2x-sin x cos x)/(2x^3 cos x(x sin x+cos x))+1/(2x^2)-(tan x)/(2x^3)+C
	$,
)
#comment[
	这里先用了一次凑微分降次，使之适用于#ref("(1-logx)/(x-logx)^2")中所介绍的分母简化法（从$p^2(x)$简化到$p'^2(x)$。#parbreak()
	值得一提的是，在处理$integral (x cos^2x-x sin^2x-sin x cos x)/(x^2(x sin x+cos x)^2)dif x$时应当将$x sin x+cos x$作为凑微分的分母，这是因为其导数为单项式，在分项和约分等方面都有良好的性质。倘若将$x^2 sin x+x cos x$作为凑微分的分母，其导数将更加复杂，不利于解题。适当变形和选择分母是这套操作的重点。
]
#question(
	tag:"sqrt(x^2+2x-2)/(x+sqrt(x^2+2x+2))",
	question:$integral sqrt(x^2+2x-2)/(x+sqrt(x^2+2x+2))dif x$,
	answer:[$
		&integral sqrt(x^2+2x-2)/(x+sqrt(x^2+2x+2))dif x\
		=&integral (sqrt(x^2+2x-2)(sqrt(x^2+2x+2)-x))/(2x+2)dif x\
		=&1/2integral (sqrt(u^2-3)(sqrt(u^2+1)-u+1))/u dif u quad subst(u=x+1)\
		=&1/2Int(#1,integral sqrt(u^4-2u^2-3)/u dif u)-1/2Int(#2,integral sqrt(u^2-3)dif u)+1/2Int(#3,integral sqrt(u^2-3)/u dif u)
	$分别解这三个积分，得：#multi-eq($
		#let s=$sqrt(u^4-2u^2-3)$
		Int(#1)=&Int(#1,integral #s/u dif u)\
		=&1/2integral #s/u^2 dif u^2\
		=&1/2integral (u^2-1)/#s dif u^2-1/2integral (dif u^2)/#s -3/2integral (dif u^2)/(u^2#s)\
		=&1/2#s -1/2log abs(u^2-1+#s)+sqrt(3)/2arcsin (u^2+3)/(2u^2)+C_1
	$,$
		Int(#2)=Int(#2,integral sqrt(u^2-3)dif u)=u/2sqrt(u^2-3)-3/2log abs(u+sqrt(u^2-3))+C_2
	$,$
		Int(#3)=&Int(#3,integral sqrt(u^2-3)/u dif u)\
		=&integral (u dif u)/sqrt(u^2-3)-3 sgn u integral (dif u)/(u^2sqrt(1-3u^(-2)))\
		=&sqrt(u^2-3)+sqrt(3)arcsin sqrt(3)/u sgn u+C_3\
		=&sqrt(u^2-3)+sqrt(3)arcsin sqrt(3)/abs(u)+C_3
	$)所以原积分可表示为$
		1/2Int(#1)-1/2Int(#2)+1/2Int(#3)=&1/4sqrt(x^4+4x^3+4x^2-4)-1/4log abs(x^2+2x+sqrt(x^4+4x^3+4x^2-4))\
		&++sqrt(3)/4arcsin (x^2+2x+4)/(2(x+1)^2)-1/4(x+1)sqrt(x^2+2x-2)\
		&++3/4log abs(x+1+sqrt(x^2+2x-2))+1/2sqrt(x^2+2x-2)+sqrt(3)/2arcsin sqrt(3)/abs(x+1)+C
	$],
)
#comment[
	本题在经历第一步平方差公式化简分母后便不难看出，无论分母还是分子中的根式，都与$x+1$有密切联系。因而换元$u=x+1$是最明智的决定：又能消掉根号内的一次项，又能将分母变为单项式。#parbreak()
	接下来，分子是一个三项式，可以用分项的方法逐个击破。其中#Int(1)的根式最为复杂（这种问题一般是不可解的，称作橢圆积分），但根式内不存在三次项和一次项，所以考虑分子分母同乘$u$凑成$dif u^2$，这样根式内就是二次多项式了。
]
#question(
	tag:"((2x-1)log(x+sqrt(1-x)))/sqrt(x(1-x))",
	question:$integral ((2x-1)log(x+sqrt(1-x)))/sqrt(x(1-x))dif x$,
	answer:[$
		&integral ((2x-1)log(x+sqrt(1-x)))/sqrt(x(1-x))dif x\
		=&integral log(x+sqrt(1-x))/sqrt(x-x^2)dif(x^2-x)\
		=&-2integral log(x+sqrt(1-x))dif sqrt(x-x^2)\
		=&-2sqrt(x-x^2)log(x+sqrt(1-x))+2integral sqrt(x-x^2)dif log(x+sqrt(1-x))\
		=&-2sqrt(x-x^2)log(x+sqrt(1-x))+integral (sqrt(x)(2sqrt(1-x)-1))/(x+sqrt(1-x))dif x\
		=&-Int(#3,2sqrt(x-x^2)log(x+sqrt(1-x)))+2Int(#1,integral (sqrt(x)sqrt(1-x))/(x+sqrt(1-x))dif x)-Int(#2,integral sqrt(x)/(x+sqrt(1-x))dif x)
	$令$subst(x=sin^2t,t in(0,pi/2))$。分别解这两个积分，得：#multi-eq($
		Int(#1)=&Int(#1,integral (sqrt(x)sqrt(1-x))/(x+sqrt(1-x))dif x)\
		=&2integral (sin^2t cos^2t)/(sin^2t+cos t)dif t\
		=&2integral cos^2t dif t-2integral (cos^3t)/(sin^2t+cos t)dif t\
		=&t+1/2sin 2t-2integral (cos^2t/2-sin^2t/2)^3/(4sin^2t/2cos^2t/2+(cos^2t/2-sin^2t/2)(cos^2t/2+sin^2t/2))dif t\
		=&t+1/2sin 2t+4integral (1-tan^2t/2)^3/((1+tan^2t/2)^2(tan^4t/2-4tan^2t/2-1))dif tan t/2\
		=&t+1/2sin 2t+8integral (dif tan t/2)/(1+tan^2t/2)^2-4integral (tan^2t/2-3)/(tan^4t/2-4tan^2t/2-1)dif tan t/2\
		=&3t+1/2sin 2t+2 sin t+2/5sqrt(50sqrt(5)-110)artanh (tan t/2)/sqrt(sqrt(5)+2)\
		&--2/5sqrt(50sqrt(5)+110)arctan (tan t/2)/sqrt(sqrt(5)-2)+C_1
	$,$
		Int(#2)=&Int(#2,integral sqrt(x)/(x+sqrt(1-x))dif x)\
		=&2integral (sin^2t cos t)/(sin^2t+cos t)dif t\
		=&2integral cos t dif t-2integral (cos^2t)/(sin^2t+cos t)dif t\
		=&2sin t+4integral (1-tan^2t/2)/((4sin^2t/2cos^2t/2)(tan^4t/2-4tan^2t/2-1))dif tan t/2\
		=&2sin t+4integral (dif tan t/2)/(tan^2t/2+1)+8integral (dif tan t/2)/(tan^4t/2-4tan^2t/2-1)\
		=&2sin t+2t-4/sqrt(5sqrt(5)-10)arctan (tan t/2)/sqrt(5sqrt(5)-10)-4/sqrt(5sqrt(5)+10)artanh (tan t/2)/sqrt(sqrt(5)+2)+C_2
	$)所以原积分可表示为$
		&-Int(#3,2sqrt(x-x^2)log(x+sqrt(1-x)))+2Int(#1)-Int(#2)\
		=&-2sqrt(x-x^2)log(x+sqrt(1-x))+4arcsin sqrt(x)+(4[1+sqrt(2(3-sqrt(5)))])/sqrt(5(sqrt(5)+2))artanh (1-sqrt(1-x))/sqrt((sqrt(5)+2)x)\
		&++2sqrt(x-x^2)+2sqrt(x)+(4[1-sqrt(2(3+sqrt(5)))])/sqrt(5(sqrt(5)-2))arctan (1-sqrt(1-x))/sqrt((sqrt(5)-2)x)+C
	$],
)
#comment[
	分项积分虽然是很重要的简化思路，但并非任何时候都是最佳选择。本题分项后是很难直接解决的，而整体凑微分$(2x-1)dif x=dif(x^2-x)$则能快速完成简化。#parbreak()
	另外，本题用$x=sin^2t$的换元来同时消掉$sqrt(x)$和$sqrt(1-x)$，但这种方法未必能够随意推广，因为这两个根式已经决定了函数的定义域$x in[0,1]$。比如，就不能通过$x=sin^3t$的换元来同时消掉$root(3,x)$和$root(3,1-x)$的根号。
]
#question(
	tag:"(1-loglogx+logxloglogx)/(log^2x+xlogxloglogx)",
	question:$integral (1-log log x+log x log log x)/(log^2x+x log x log log x)dif x$,
	answer:[$
		integral (1-log log x+log x log log x)/(log^2x+x log x log log x)dif x=integral (1-log log x+log x log log x)/(log^2x)/((x log log x)/(log x)+1)dif x
	$试导可知$dif/(dif x)((x log log x)/(log x))=(1-log log x+log x log log x)/(log^2x)$，所以$
		integral (1-log log x+log x log log x)/(log^2x+x log x log log x)dif x=integral (dif (x log log x)/(log x))/((x log log x)/(log x)+1)=log abs((x log log x)/(log x)+1)+C
	$],
)
#comment[
	对于一些分母形式为$u+a v$的问题，可以通过恒等变换变形为$u/v+a$来思考，这是因为凑微分成$dif u/v$之后再调整为$dif(u/v+a)$是很容易的，但要凑出$dif(u+a v)$就需要比较高的技巧了。
]
#question(
	tag:"(2+cosx)/((1+sinx)e^(x/2)+cosx)",
	question:$integral (2+cos x)/((1+sin x)ee^(x/2)+cos x)dif x$,
	answer:[$
		integral (2+cos x)/((1+sin x)ee^(x/2)+cos x)dif x=&integral (3 cos^2x/2+sin^2x/2)/((sin x/2+cos x/2)[(sin x/2+cos x/2)ee^(x/2)+(cos x/2-sin x/2)])dif x\
		=&integral ((3cos^2x/2+sin^2x/2)/(cos x/2-sin x/2)^2ee^(x/2))/(((sin x/2+cos x/2)/(cos x/2-sin x/2)ee^(x/2))((sin x/2+cos x/2)/(cos x/2-sin x/2)ee^(x/2)+1))dif x\
	$试导可知$dif/(dif x)((sin x/2+cos x/2)/(cos x/2-sin x/2)ee^(x/2))=(3cos^2x/2+sin^2x/2)/(2(cos x/2-sin x/2)^2)ee^(x/2)$，所以$
		integral (2+cos x)/((1+sin x)ee^(x/2)+cos x)dif x=&2integral (dif u)/(u(u+1)) quad subst(u=(sin x/2+cos x/2)/(cos x/2-sin x/2)ee^(x/2))\
		=&x+2 log abs((sin x/2+cos x/2)/(cos x/2-sin x/2))-2log abs((sin x/2+cos x/2)/(cos x/2-sin x/2)ee^(x/2)+1)+C
	$],
)
#question(
	tag:"sin4xlogsinxlogcosx",
	question:$integral sin 4x log sin x log cos x dif x$,
	answer:$
		&integral sin 4x log sin x log cos x dif x\
		=&integral sin 2x cos 2x log sin x log cos x dif 2x\
		=&1/2integral log sin x log cos x dif sin^2 2x\
		=&1/2sin^2 2x log sin x log cos x-1/2integral sin^2 2x dif(log sin x log cos x)\
		=&1/2sin^2 2x log sin x log cos x-2integral sin x cos^3x log cos x dif x+2integral sin^3x cos x log sin x dif x\
		=&1/2sin^2 2x log sin x log cos x+1/2integral log cos x dif cos^4x+1/2integral log sin x dif sin^4x\
		=&1/2sin^2 2x log sin x log cos x+1/2cos^4x log cos x+1/2sin^4x log sin x\
		&--1/2integral cos^3x dif cos x-1/2integral sin^3x dif sin x\
		=&1/2sin^2 2x log sin x log cos x+1/2cos^4x log cos x+1/2sin^4x log sin x\
		&--1/8cos^4x-1/8sin^4x+C
	$,
)
#question(
	tag:"(1-4x^2-3x^4)/(1+x^2)sqrt((1-x^2)/(1+x^2))",
	question:$integral (1-4x^2-3x^4)/(1+x^2)sqrt((1-x^2)/(1+x^2))dif x$,
	answer:$
		&integral (1-4x^2-3x^4)/(1+x^2)sqrt((1-x^2)/(1+x^2))dif x\
		=&integral (1-x^4-3(x^4+x^2)+(x^4-x^2))/sqrt(1+x^2)^3sqrt(1-x^2)dif x\
		=&integral sqrt(1-x^2)^3/sqrt(1+x^2)dif x-3integral x^2sqrt(1-x^2)/sqrt(1+x^2)dif x-integral x^2sqrt(1-x^2)^3/sqrt(1+x^2)^3dif x\
		=&integral sqrt(1-x^2)^3/sqrt(1+x^2)dif x-3integral x^2sqrt(1-x^2)/sqrt(1+x^2)dif x+integral x sqrt(1-x^2)^3dif 1/sqrt(1+x^2)\
		=&integral sqrt(1-x^2)^3/sqrt(1+x^2)dif x-3integral x^2sqrt(1-x^2)/sqrt(1+x^2)dif x+(x sqrt(1-x^2)^3)/sqrt(1+x^2)-integral sqrt(1-x^2)^3/sqrt(1+x^2)dif x+3integral x^2sqrt(1-x^2)/sqrt(1+x^2)dif x\
		=&(x sqrt(1-x^2)^3)/sqrt(1+x^2)+C
	$,
)
#question(
	tag:"(xarctanx[log(x^2+1)arsinhx+sqrt(x^2+1)arctanx])/sqrt(x^2+1)^3",
	question:$integral (x arctan x[log(x^2+1)arsinh x+sqrt(x^2+1)arctan x])/sqrt(x^2+1)^3dif x$,
	answer:$
		&integral (x arctan x[log(x^2+1)arsinh x+sqrt(x^2+1)arctan x])/sqrt(x^2+1)^3dif x\
		=&integral (x arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)^3dif x+integral (x arctan^2x)/(x^2+1)dif x\
		=&-integral arctan x log(x^2+1)arsinh x dif 1/sqrt(x^2+1)+1/2integral arctan^2x dif log(x^2+1)\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+integral (log(x^2+1)arsinh x)/sqrt(x^2+1)^3dif x+integral (2x arctan x arsinh x)/sqrt(x^2+1)^3dif x\
		&++integral (arctan x log(x^2+1))/(x^2+1)dif x+1/2integral arctan^2x dif log(x^2+1)\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+integral log(x^2+1)arsinh x dif x/sqrt(x^2+1)\
		&--2integral arctan x arsinh x dif 1/sqrt(x^2+1)+1/2integral log(x^2+1)dif arctan^2x\
		&++1/2integral arctan^2x dif log(x^2+1)\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+(x log(x^2+1)arsinh x)/sqrt(x^2+1)-2integral (x^2arsinh x)/sqrt(x^2+1)^3dif x\
		&--integral (x log(x^2+1))/(x^2+1)dif x-(2arctan x arsinh x)/sqrt(x^2+1)+2integral (arsinh x)/sqrt(x^2+1)^3dif x\
		&++2integral (arctan x)/(x^2+1)dif x+1/2log(x^2+1)arctan^2x\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+(x log(x^2+1)arsinh x)/sqrt(x^2+1)-(2arctan x arsinh x)/sqrt(x^2+1)\
		&++1/2log(x^2+1)arctan^2x-2integral (arsinh x)/sqrt(x^2+1)dif x+2integral (arsinh x)/sqrt(x^2+1)^3dif x-1/4log^2(x^2+1)\
		&++2integral arsinh x dif x/sqrt(x^2+1)+arctan^2x\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+(x log(x^2+1)arsinh x)/sqrt(x^2+1)-(2arctan x arsinh x)/sqrt(x^2+1)\
		&++1/2log(x^2+1)arctan^2x-arsinh^2x+2integral arsinh x dif x/sqrt(x^2+1)-1/4log^2(x^2+1)\
		&++(2x arsinh x)/sqrt(x^2+1)-2integral x/(x^2+1)dif x+arctan^2x\
		=&-(arctan x log(x^2+1)arsinh x)/sqrt(x^2+1)+(x log(x^2+1)arsinh x)/sqrt(x^2+1)-(2arctan x arsinh x)/sqrt(x^2+1)\
		&++1/2log(x^2+1)arctan^2x-arsinh^2x+(4x arsinh x)/sqrt(x^2+1)-1/4log^2(x^2+1)\
		&-2log(x^2+1)+arctan^2x+C\
	$,
)
#comment[
	本题的最大难点是函数极端复杂，要解决这道题目就需要抓住一个基本的原则：简化积分。被积函数有再复杂的对数和反函数乘积也不要紧，只要是断求导将其逐步消掉，就能实现积分简化乃至解出整个问题。
]
#question(
	tag:"(1-x)/((1+x)sqrt(x^4+kx^2+1)",
	question:$integral (1-x)/((1+x)sqrt(x^4+k x^2+1))dif x$,
	answer:[当$k=2$时，$
		integral (1-x)/((1+x)sqrt(x^4+2x^2+1))dif x=&integral (1-x)/((x+1)(x^2+1))dif x\
		=&-1/2log(x^2+1)+log(x+1)+C
	$当$k=-2$时，$
		integral (1-x)/((1+x)sqrt(x^4-2x^2+1))dif x=sgn(1-x^2)integral (dif x)/(x+1)^2=sgn(x-1)/abs(x+1)+C
	$当$x!=+-2$时，$
		&integral (1-x)/((1+x)sqrt(x^4+k x^2+1))dif x\
		=&integral (1-x^2)/((1+x)^2sqrt(x^4+k x^2+1))dif x\
		=&sgn x integral (x^(-2)-1)/((x+x^(-1)+2)sqrt(x^2+k+x^(-2)))dif x\
		=&-sgn x integral (dif u)/((u+2)sqrt(u^2+k-2)) quad subst(u=x+x^(-1))\
		=&-sgn x integral (u dif u)/((u^2-4)sqrt(u^2+k-2))+2 sgn x integral (dif u)/((u^2-4)sqrt(u^2+k-2))\
		=&-sgn x integral (dif sqrt(u^2+k-2))/(u^2+k-2-(k+2))+2/(k-2)sgn x integral (u^2+k-2)/(u^2-4)dif u/sqrt(u^2+k-2)\
		=&-sgn x Int(#1,integral (dif sqrt(u^2+k-2))/(u^2+k-2-(k+2)))+2/(k+2)sgn x Int(#2,integral 1/(u^2/(u^2+k-2)-4/(k+2))dif u/sqrt(u^2+k-2))
	$当$k<-2$时，#multi-eq($
		Int(#1,integral (dif sqrt(u^2+k-2))/(u^2+k-2-(k+2)))=1/(2sqrt(k+2))log abs((sqrt(u^2+k-2)-sqrt(k+2))/(sqrt(u^2+k-2)+sqrt(k+2)))+C_1
	$,$
		Int(#2,integral 1/(u^2/(u^2+k-2)-4/(k+2))dif u/sqrt(u^2+k-2))=sqrt(k+2)/4log abs((sqrt(k+2)u-2sqrt(u^2+k-2))/(sqrt(k+2)u+2sqrt(u^2+k-2)))+C_2
	$)综上所述，$
		&integral (1-x)/((1+x)sqrt(x^4+k x^2+1))dif x\
		=&cases(
			sgn(x-1)/abs(x-1)+C\,&k=-2,
			-1/2log(x^2+1)+log(x+1)+C\,&k=2,
			-1/sqrt(-k-2)arctan sqrt(x^4+k x^2+1)/(sqrt(-k-2)x)-1/sqrt(-k-2)arctan (sqrt(-k-2)(x^2+1))/(2sqrt(x^4+k x^2+1))+C\,&k<-2,
			-1/(2sqrt(k+2))log abs((sqrt(x^4+k x^2+1)-sqrt(k+2)x)/(sqrt(x^4+k x^2+1)+sqrt(k+2)x))+1/(2sqrt(k+2))log abs(((sqrt(k+2)(x^2+1))/sqrt(x^4+k x^2+1)-2)/((sqrt(k+2)(x^2+1))/sqrt(x^4+k x^2+1)+2))+C\,&-2<k!=2,
		)
	$],
)
#question(
	tag:"x^4/sqrt(x^2+1)",
	question:$integral x^4/sqrt(x^2+1)dif x$,
	answer:[当$x>=0$时，$
		integral x^4/sqrt(x^2+1)dif x=&1/8integral (8x^7)/sqrt(x^8+x^6)dif x\
		=&1/8integral (8x^7+6x^5)/sqrt(x^8+x^6)dif x-3/4integral x^5/sqrt(x^8+x^6)dif x\
		=&1/8integral dif(x^8+x^6)/sqrt(x^8+x^6)-3/16integral (4x^3)/sqrt(x^4+x^2)dif x\
		=&1/4sqrt(x^8+x^6)-3/16integral (4x^3+2x)/sqrt(x^4+x^2)dif x+3/8integral x/sqrt(x^4+x^2)dif x\
		=&x^3/4sqrt(x^2+1)-3/16integral dif(x^4+x^2)/sqrt(x^4+x^2)+3/8 integral (dif x)/sqrt(x^2+1)\
		=&x^3/4sqrt(x^2+1)-x/8sqrt(x^2+1)+3/8log(x+sqrt(x^2+1))+C
	$当$x<0$时，$
		integral x^4/sqrt(x^2+1)dif x=&-integral (-x)^4/sqrt((-x)^2+1)dif(-x)\
		=&x^3/4sqrt(x^2+1)-x/8sqrt(x^2+1)+3/8log(x+sqrt(x^2+1))+C
	$综上所述，得到$
		integral x^4/sqrt(x^2+1)dif x=x^3/4sqrt(x^2+1)-x/8sqrt(x^2+1)+3/8log(x+sqrt(x^2+1))+C
	$],
)
#comment[
	不同于一般的分部积分循环方法，本题的积木法显得非常巧妙。可以说，凑系数是它唯一麻烦的问题，然而相比分部积分来说还是有过之无不及。
]
#question(
	tag:"1/((x-1)root(3,x^2+x+1))",
	question:$integral (dif x)/((x-1)root(3,x^2+x+1))$,
	answer:[$
		integral (dif x)/((x-1)root(3,x^2+x+1))=&integral t/root(3,1/t^2+3/t+3)dif 1/t quad subst(x-1=1/t)\
		=&-integral (dif t)/root(3,3t^3+3t^2+t)\
		=&-1/root(3,3)integral dif(3t+1)/root(3,(3t+1)^3-1)\
		=&-1/(3root(3,3))integral (dif u^3)/(u^2root(3,u^3-1))quad subst(u=3t+1)\
	$令$subst(v=u/root(3,u^3-1))$，则$subst(u^3=v^3/(v^3-1))$，所以$
		&-1/(3root(3,3))integral (dif u^3)/(u^2root(3,u^3-1))\
		=&-1/(3root(3,3))integral (dif 1/(v^3-1))/(v^2/(v^3-1))\
		=&1/root(3,3)integral (dif v)/(v^3-1)\
		=&1/(3root(3,3))log abs(v-1)-1/(6root(3,3))log(v^2+v+1)-1/root(6,3^5)arctan (2v+1)/sqrt(3)+C\
		=&1/(3root(3,3))log abs((x+2)/(root(3,9)root(3,x^2+x+1))-1)-1/(6root(3,3))log[(x^2+4x+4)/(root(3,81)root(3,(x^2+x+1)^2))+(x+2)/(root(3,9)root(3,x^2+x+1))+1]\
		&--1/root(6,3^5)arctan (2x+4+root(3,9)root(3,x^2+x+1))/(root(6,3^5)root(3,x^2+x+1))+C
	$],
)
#comment[
	本题除了倒代换以外，还可以选择莫比乌斯换元来做，对应的恒等式是$(x+2)^3-(x-1)^3=9(x^2+x+1)$。
]
#question(
	tag:"1/(1-x^2)root(4,x+x^3)",
	question:$integral (dif x)/((1-x^2)root(4,x+x^3))$,
	answer:[$
		&integral (dif x)/((1-x^2)root(4,x+x^3))\
		=&integral (dif x)/((1-x)(1+x)root(4,1/8[(x+1)^4-(x-1)^4]))\
		=&1/root(4,2)integral (dif x)/((x+1)root(4,(x+1)^4-(x-1)^4))-1/root(4,2)integral (dif x)/((x-1)root(4,(x+1)^4-(x-1)^4))\
	$分别解这两个积分，得#multi-eq($
		Int(#1)=&Int(#1,integral (dif x)/((x+1)root(4,(x+1)^4-(x-1)^4)))\
		=&integral abs(x-1)/(abs(x-1)^2(x+1)root(4,((x+1)/(x-1))^4-1))dif x\
		=&-integral (dif 1/abs(x-1))/((x+1)/abs(x-1)root(4,((x+1)/abs(x-1))^4-1))\
		=&-1/2integral (dif u)/(u root(4,u^4-1))quad subst(u=(x+1)/abs(x-1))\
		=&1/(4sqrt(2))arctan (2sqrt(2x^3+2x)-x^2+2x-1)/(2(x-1)root(4,2x^3+2x))\
		&--1/(8sqrt(2))log abs((2sqrt(2x^3+2x)-2(x-1)root(4,2x^3+2x)+(x-1)^2)/(2sqrt(2x^3+2x)+2(x-1)root(4,2x^3+2x)+(x-1)^2))+C_1
	$,$
		Int(#2)=&Int(#2,integral (dif x)/((x-1)root(4,(x+1)^4-(x-1)^4)))\
		=&integral (x+1)/((x-1)(x+1)^2root(4,1-((x-1)/(x+1))^4))dif x\
		=&-integral (dif 1/(x+1))/((x-1)/(x+1)root(4,1-((x-1)/(x+1))^4))\
		=&1/2integral (dif v)/(v root(4,1-v^4))quad subst(v=(x-1)/(x+1))\
		=&1/8log abs((root(4,8x^3+8x)-x-1)/(root(4,8x^3+8x)+x+1))+1/4arctan root(4,8x^3+8x)/(x+1)+C_2
	$)所以原积分可表示为$
		1/root(4,2)Int(#1)-1/root(4,2)Int(#2)=&-1/(4root(4,8))arctan (2sqrt(2x^3+2x)-x^2+2x-1)/(2(x-1)root(4,2x^3+2x))\
		&--1/(8root(4,8))log (2sqrt(2x^3+2x)-2(x-1)root(4,2x^3+2x)+(x-1)^2)/(2sqrt(2x^3+2x)+2(x-1)root(4,2x^3+2x)+(x-1)^2)\
		&--1/(8root(4,2))log (x+1-root(4,8x^3+8x))/(x+1+root(4,8x^3+8x))-1/(4root(4,2))arctan root(4,8x^3+8x)/(x+1)+C
	$],
)
#comment[
	本题最特别的地方在于通过一对多项式四次方差$(x+1)^4-(x-1)^4=8(x^3+x)$的恒等变换隐藏了高次结构，让整个问题看上去扑朔迷离。倘若不使用这个恒等变换，原问题是很难解决的。
]
#question(
	tag:"(x^2+2x-4)/(x^3sqrt(1-x))e^(1/2arccosx)",
	question:$integral (x^2+2x-4)/(x^3sqrt(1-x))ee^(1/2arccos x)dif x$,
	answer:$
		#let e=$ee^(1/2arccos x)$
		&integral (x^2+2x-4)/(x^3sqrt(1-x))#e dif x\
		=&integral sqrt(1+x)/(x sqrt(1-x^2))#e dif x+2integral (x^(-2)-2x^(-3))/sqrt(1-x)#e dif x\
		=&-2integral sqrt(1+x)/x dif #e -2integral #e/sqrt(1-x)dif (x-1)/x^2\
		=&-2/x sqrt(1+x)#e -integral (x+2)/(x^2sqrt(1+x))#e dif x+2/x^2sqrt(1-x)#e+2integral (x-1)/x^2dif #e/sqrt(1-x)\
		=&(2sqrt(1-x)-2x sqrt(1+x))/x^2#e -integral sqrt(1+x)/x^2#e dif x-integral #e/(x^2sqrt(1-x))dif x\
		=&(2sqrt(1-x)-x sqrt(1+x))/x^2#e+#e/(x sqrt(1-x))-1/2integral #e/(x sqrt(1+x))dif x+1/2integral #e/(x sqrt(1-x))dif x\
		&--1/2integral #e/(x root(3,1-x))dif x+1/2integral #e/(x(1-x)sqrt(1+x))dif x\
		=&(2sqrt(1-x)-x sqrt(1+x))/x^2#e+#e/(x sqrt(1-x))-1/2integral #e/(sqrt(1-x)sqrt(1-x^2))dif x-1/2integral #e/sqrt(1-x)^3dif x\
		=&(2sqrt(1-x)-x sqrt(1+x))/x^2#e+#e/(x sqrt(1-x))-integral (dif #e)/sqrt(1-x)-integral #e dif 1/sqrt(1-x)\
		=&(2sqrt(1-x)-x sqrt(1+x)+x sqrt(1-x))/x^2 #e+C
	$,
)
#question(
	tag:"x/(sum_(k=0)^n(sqrt(x^2+1)-x)^((n-2k)/(n+1))",
	question:$integral x/(sum_(k=0)^n (sqrt(x^2+1)-x)^((n-2k)/(n+1)))$,
	answer:[
		#let s=$sqrt(x^2+1)$
		考虑到$(#s+x)(#s -x)=1$，所以$
			&integral x/(sum_(k=0)^n (#s -x)^((n-2k)/(n+1)))\
			=&integral (x[1-(#s -x)^(-2/(n+1))])/((#s -x)^(n/(n+1))-(#s -x)^((-n-2)/(n+1)))dif x\
			=&integral (x[root(n+1,#s -x)-root(n+1,#s+x)])/((#s -x)-(#s+x))dif x\
			=&1/2integral root(n+1,#s+x)dif x-1/2integral root(n+1,#s -x)dif x\
			=&1/4integral root(n+1,#s+x)dif(#s+x)-1/4integral dif(#s -x)/root(n+1,#s -x)\
			&--1/4integral dif(#s+x)/root(n+1,#s+x)+1/4integral root(n+1,#s -x)dif(#s -x)\
			=&(n+1)/(4n+8)(#s+x)^((n+2)/(n+1))-(n+1)/(4n)(#s -x)^(n/(n+1))\
			&--(n+1)/(4n)(#s+x)^(n/(n+1))+(n+1)/(4n+8)(#s -x)^((n+2)/(n+1))+C
		$
	],
)
#comment[
	本题是#ref("sqrt(sqrt(x^2+1)+x)")的加强，分母的求和式实际上是个等比数列求和，可以套公式解决，后续再用组合积分法操作即可。
]
