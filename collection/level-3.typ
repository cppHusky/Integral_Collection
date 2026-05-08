#import "../utils.typ":question,comment,subst,ref,multi-eq
#import "../math.typ":ee,ii,mod
#question(
	tag:"1/(x(x^5+1)^3)",
	category:red,
	question:$integral (dif x)/(x(x^5+1)^3)$,
	answer:[$
		integral (dif x)/(x(x^5+1)^3)=integral (x^4 dif x)/(x^5(x^5+1)^3)=1/5integral (dif x^5)/(x^5(x^5+1)^3)=1/5integral (dif u)/(u(u+1)^3) quad subst(u=x^5)
	$设$1/(u(u+1)^3)=A/u+B/(u+1)^3+E/(u+1)^2+E/(u+1)$，用留数法求出#multi-eq[$
		A=lr(1/(u+1)^3|)_(u=0)=1$$
		B=lr(1/u|)_(u+1=0)=-1$$
		C=lr(dif(1/u)/dif(u+1)|)_(u+1=0)=lr(-1/u^2|)_(u+1=0)=-1$$
		D=lr(1/2dot (dif^2 1/u)/dif(u+1)^2|)_(u+1=0)=lr(1/u^3|)_(u+1=0)=-1
	$]所以$
		1/5integral (dif u)/(u(u+1)^3)=&1/5integral[1/u-1/(u+1)^3-1/(u+1)^2-1/(u+1)]dif u\
		=&1/5integral (dif u)/u-1/5integral (dif u)/(u+1)-1/5integral (dif u)/(u+1)^2-1/5integral (dif u)/(u+1)^3\
		=&1/5log abs(u/(u+1))+1/(5(u+1))+1/(10(u+1)^2)+C\
		=&1/5log abs(x^5/(x^5+1))+1/(5(x^5+1))+1/(10(x^5+1)^2)+C
	$],
)
#comment[
	本题中倘若直接对被积函数进行暴力裂项，将会得到十分复杂的结果。这时不妨转变思维，寻找适当的方法简化问题。这里通过换元$subst(u=x^5)$将分母变成关于$u$的四次形式，就要比原来关于$x$的十六次形式简单很多。
]
#question(
	tag:"1/(x^3+1)",
	category:blue,
	question:$integral (dif x)/(x^3+1)$,
	answer:[设$1/(x^3+1)=A/(x+1)+B/(x^2-x+1)$，用留数法求出#multi-eq[$
		A=lr(1/(x^2-x+1)|)_(x+1=0)=1/3$$
		B=lr(1/(x+1)|)_(x^2-x+1=0)=lr((x-2)/(x^2-x-2)|)_(x^2-x=-1)=(x-2)/(-3)
	$]所以$
		integral (dif x)/(x^3+1)=&1/3integral (dif x)/(x+1)-1/3integral (x-2)/(x^2-x+1)dif x\
		=&1/3log abs(x+1)-1/6integral (2x-1)/(x^2-x+1)dif x+1/2integral (dif x)/(x^2-x+1)\
		=&1/3log abs(x+1)-1/6log(x^2-x+1)+1/sqrt(3)arctan (2x-1)/sqrt(3)+C
	$],
)
#comment[
	本题是留数法在处理分母含二次单因式时的做法。这里所设的$B$是一个待定多项式，而非待定常数。对于本题来说，留数法求$B$的目的就是将$1/(x+1)$化成一次多项式（或常数）的形式，所用条件则是$x^2-x+1=0$。#parbreak()
	为了消除$B$分母上的变量，必须将所有出现$x$的地方都凑成$x^2-x$的形式，为此分子分母同乘$x-2$可以很好地实现这个目的。
]
#question(
	tag:"1/(x^3-1)",
	category:blue,
	question:$integral (dif x)/(x^3-1)$,
	answer:[设$1/(x^3-1)=A/(x-1)+B/(x^2+x-1)$，用模法求出#multi-eq[$
		A=1/(x^2+x+1)mod(x-1)=1/3$$
		B=&1/(x-1)mod(x^2+x+1)\
		=&(x+2)/(x^2+x-2)mod(x^2+x+1)\
		=&(x+2)/(x^2+x+1-3)mod(x^2+x+1)\
		=&(x+2)/(-3)
	$]所以$
		integral (dif x)/(x^3-1)=&1/3integral (dif x)/(x-1)-1/3integral (x+2)/(x^2+x+1)dif x\
		=&1/3log abs(x-1)-1/6integral (2x+1)/(x^2+x+1)dif x-1/2integral (dif x)/(x^2+x+1)\
	$],
)
#comment[
	本题是模法在有理函数裂项中的应用。对于分母只含单因式的情形，模法与留数法的操作除了写法以外别无二致。然而在处理分母含重因式的情形时，两种方法就有很多不同之处了。#parbreak()
	这些方法本质上都是裂项方法的延伸，不要求读者一定掌握。读者可以选择自己习惯的方法来使用。
]
#question(
	tag:"(x-2)/(x^4+2x^3-3x^2-4x+4)",
	category:blue,
	question:$integral (x-2)/(x^4+2x^3-3x^2-4x+4)dif x$,
	answer:[考虑到$
		x^4+2x^3-3x^2-4x+4=(x-1)^2(x+2)^2
	$设$(x-2)/(x^4+2x^3-3x^2-4x+4)=A/(x-1)^2+B/(x+2)^2$，用模法求出#multi-eq[$
		A=&(x-2)/(x+2)^2mod(x-1)^2\
		=&(x-2)/(x^2-2x+1+6x+3)mod(x^2-2x+1)\
		=&1/3dot ((x-2)(2x-5))/((2x+1)(2x-5))mod(x^2-2x+1)\
		=&1/3dot (2x^2-4x+2-5x+8)/(4x^2-8x+4-9)mod(x^2-2x+1)\
		=&(5x-8)/27$$
		B=&(x-2)/(x-1)^2mod(x+2)^2\
		=&-1/3dot ((x-2)(2x+7))/((2x+1)(2x+7))mod(x^2+4x+4)\
		=&-1/3dot (2x^2+8x+8-5x-22)/(4x^2+16x+16-9)mod(x^2+4x+4)\
		=&-(5x+22)/27
	$]所以$
		integral (x-2)/(x^4+2x^3-3x^2-4x+4)dif x=&1/27integral (5x-8)/(x-1)^2dif x-1/27integral (5x+22)/(x+2)^2dif x\
		=&5/27integral (dif x)/(x-1)-1/9integral (dif x)/(x-1)^2-5/27integral (dif x)/(x+2)-4/9integral (dif x)/(x+2)^2\
		=&5/27log abs((x-1)/(x+2))+1/(9(x-1))+4/(9(x+2))+C
	$],
)
#comment[
	本题的分母乍看比较复杂，不容易进行因式分解，此时可以尝试使用试根的方法。对于整系数多项式而言，可以将常数项的因数代入计算多项式的值（比如本题的$plus.minus 1,plus.minus 2,plus.minus 4$）。如果得到$0$，则这个数就是多项式的一个根，可以先行将它对应的因式分解出来，再对剩余部分继续如法炮制，从而逐步将原式分解完成。#parbreak()
	另外，本题也涉及到分母含重因式时的模法应用。与留数法不同，模法要求只将分母中不同的因子分离开，而重因式的部分不再需要进一步分离。此处的$A,B$都是比分母低一次的待定多项式。
]
#question(
	tag:"sin^5x",
	category:blue,
	question:$integral sin^5x dif x$,
	answer:$
		integral sin^5x dif x=&integral (1/(2ii)ee^(ii x)-1/(2ii)ee^(-ii x))^5 dif x\
		=&1/(32ii)integral[(ee^(5ii x)-ee^(-5ii x))-5(ee^(3ii x)-ee^(-3ii x))+10(ee^(ii x)-ee^(-ii x))]dif x\
		=&1/16integral sin 5x dif x-5/16integral sin 3x dif x+5/8integral sin x dif x\
		=&-1/80 cos 5x+5/48 cos 3x-5/8 cos x+C
	$,
)
#question(
	tag:"1/(sinx+2cosx)~~~",
	category:blue,
	question:$integral (dif x)/(sin x+2cos x)$,
	answer:$
		integral (dif x)/(sin x+2cos x)=&integral (sin x+2cos x)/(sin x+2cos x)^2dif x\
		=&integral dif(2sin x-cos x)/(5-(2sin x-cos x)^2)\
		=&1/(2sqrt(5))log abs((2sin x-cos x+sqrt(5))/(2sin x-cos x-sqrt(5)))+C
	$,
)
#comment[
	这种方法比较特别，是通过构造凑微分$dif(2sin x-cos x)$的形式来解决问题的。这里也体现了整体凑微分的思想，不是分项而是直接把$sin x+2cos x$作为整体凑入微分项中。
]
