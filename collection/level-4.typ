#import "../utils.typ":question,comment,subst,Int,ref,multi-eq,ref-eq
#import "../math.typ":*
#question(
	tag:"1/sqrt(ax^2+bx+c)",
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
	tag:"sqrt(sinxcos^3x)",
	category:blue,
	question:$integral sqrt(sin x cos^3x)dif x$,
	answer:[$
		integral sqrt(sin x cos^3x)dif x=sgn(cos x)integral sqrt(sin x cos x)dif sin x
	$令$Int(#1)=Int(#1,integral sqrt(sin x cos x)dif sin x),Int(#2)=Int(#2,integral sqrt(sin x cos x)dif cos x)$，并分别求出#multi-eq(tag:"sqrt(sinxcos^3x)",$
		Int(#1)+Int(#2)=&integral sqrt(sin x cos x)dif(sin x+cos x)\
		=&integral sqrt(((sin x+cos x)^2-1)/2) dif(sin x+cos x)\
		=&1/sqrt(2)integral sqrt(u^2-1)dif u quad subst(u=sin x+cos x)\
		=&1/(2sqrt(2))u sqrt(u^2-1)-1/(2sqrt(2))log abs(u+sqrt(u^2-1))+C_1
	$,$
		Int(#2)-Int(#1)=&integral sqrt(sin x cos x)dif(cos x-sin x)\
		=&integral sqrt((1-(cos x-sin x)^2)/2)dif(cos x-sin x)\
		=&1/sqrt(2)integral (1-v^2)dif v quad subst(v=cos x-sin x)\
		=&1/(2sqrt(2))v sqrt(1-v^2)+1/(2sqrt(2))arcsin v+C
	$)联立#ref-eq("sqrt(sinxcos^3x)",1)#ref-eq("sqrt(sinxcos^3x)",2)，解得$
		Int(#1)=&1/4(sin x+cos x)sqrt(sin x cos x)sgn(cos x)-1/(4sqrt(2))log abs(sin x+cos x+sqrt(2sin x cos x))sgn(cos x)\
		&--1/4(cos x-sin x)sqrt(sin x cos x)sgn(cos x)-1/(4sqrt(2))arcsin(cos x-sin x)sgn(cos x)+C
	$
	],
)
#comment[
	善用恒等变换$2sin x cos x=(sin x+cos x)^2-1=1-(sin x-cos x)^2$在组合积分法的使用中会有很大帮助。
]
#question(
	tag:"sin^3x/(sin^3x+cos^3x)",
	question:$integral (sin^3x)/(sin^3x+cos^3x)dif x$,
	answer:[设$Int(#1)=Int(integral (sin^3x)/(sin^3x+cos^3x)dif x),Int(#2)=Int(integral (cos^3x)/(sin^3x+cos^3x)dif x)$，并分别求出#multi-eq(tag:"sin^3x/(sin^3x+cos^3x)",$
		Int(#1)+Int(#2)=integral dif x=x+C_1
	$,$
		Int(#1)-Int(#2)=&integral ((sin x-cos x)(1+sin x cos x))/((sin x+cos x)(1-sin x cos x))dif x\
		=&integral ((sin^2x-cos^2x)(2+sin 2x))/((sin x+cos x)^2(2-sin 2x))dif x\
		=&1/2integral ((2+sin 2x)cos 2x)/((1+sin 2x)(sin 2x-2)) dif 2x\
		=&1/2integral (u+2)/((u+1)(u-2))dif u quad subst(u=sin 2x)\
		=&2/3log(2-sin 2x)-1/6log(1+sin 2x)+C_2
	$)联立#ref-eq("sin^3x/(sin^3x+cos^3x)",1)#ref-eq("sin^3x/(sin^3x+cos^3x)",2)解得$
		Int(#1)=x/2+1/3log(2-sin 2x)-1/12log(1+sin 2x)+C
	$],
)
#comment[
	虽然这里的$integral ((sin x-cos x)(1+sin x cos x))/((sin x+cos x)(1-sin x cos x))dif x$可以直接凑微分$dif(sin x+cos x)$有理化来解决，但是降幂公式在这里也有了用武之地，这样做会更简单一些。在这里也提醒读者不应只会机械化地做题，应当保持一定的灵活性。
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
