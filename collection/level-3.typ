#import "../utils.typ":question,comment,subst,ref,multi-eq,Int
#import "../math.typ":*
#question(
	tag:"1/(ax^2+bx+c)",
	category:red,
	question:$integral (dif x)/(a x^2+b x+c) space(a>0)$,
	answer:[当$b^2-4a c<0$时，$
		integral (dif x)/(a x^2+b x+c)=&integral (dif x)/((sqrt(a)x+b/(2sqrt(a)))^2+c-b^2/(4a))\
		=&1/sqrt(a)integral dif(sqrt(a)x+b/(2sqrt(a)))/((sqrt(a)x+b/(2sqrt(a)))^2+(4a c-b^2)/(4a))\
		=&1/sqrt(a)dot (2sqrt(a))/sqrt(4a c-b^2)arctan (2sqrt(a)(sqrt(a)x+b/(2sqrt(a))))/sqrt(4a c-b^2)+C_1\
		=&2/sqrt(4a c-b^2)arctan (2a x+b)/sqrt(4a c-b^2)+C_1
	$当$b^2-4a c=0$时，$
		integral (dif x)/(a x^2+b x+c)=&1/sqrt(a)integral dif(sqrt(a)x+b/(2sqrt(a)))/(sqrt(a)x+b/(2sqrt(a)))^2\
		=&-1/sqrt(a)dot 1/(sqrt(a)x+b/(2sqrt(a)))+C_2\
		=&-2/(2a x+b)+C_2\
	$当$b^2-4a c>0$时，$
		integral (dif x)/(a x^2+b x+c)=&1/a integral (dif x)/((x-(-b-sqrt(b^2-4a c))/(2a))(x-(-b+sqrt(b^2-4a c))/(2a)))\
		=&1/sqrt(b^2-4a c)(integral (dif x)/(x+(b-sqrt(b^2-4a c))/(2a))-integral (dif x)/(x+(b+sqrt(b^2-4a c))/(2a)))\
		=&1/sqrt(b^2-4a c)log abs((x+(b-sqrt(b^2-4a c))/(2a))/(x+(b+sqrt(b^2-4a c))/(2a)))+C_3\
		=&1/sqrt(b^2-4a c)log abs((2a x+b-sqrt(b^2-4a c))/(2a x+b+sqrt(b^2-4a c)))+C_3
	$综上所述，得到$
		integral (dif x)/(a x^2+b x+c)=cases(
			2/sqrt(4a c-b^2)arctan (2a x+b)/sqrt(4a c-b^2)+C_1\,&b^2-4a c<0,
			-2/(2a x+b)+C_2\,&b^2-4a c=0,
			1/sqrt(b^2-4a c)log abs((2a x+b-sqrt(b^2-4a c))/(2a x+b+sqrt(b^2-4a c)))+C_3\,&b^2-4a c>0,
		)
	$],
)
#comment[
	这是一个有理函数积分通式，更简洁的版本见@通题通解。如果读者可以记忆，将有助于加快解题速度。这种情形非常常见，并且容易推导通式，所以之后的题目中不再给出解决这个问题的具体过程。
]
#question(
	tag:"(2x+1)/((x-1)(x-2)(x+3))",
	category:red,
	question:$integral (2x+1)/((x-1)(x-2)(x+3))dif x$,
	answer:[设$(2x+1)/((x-1)(x-2)(x-3))=A/(x-1)+B/(x-2)+C/(x+3)$，用留数法求出#multi-eq[$
		A=lr((2x+1)/((x-2)(x+3))|)_(x-1=0)=-3/4$$
		B=lr((2x+1)/((x-1)(x+3))|)_(x-2=0)=1$$
		C=lr((2x+1)/((x-1)(x-2))|)_(x+3=0)=-1/4
	$]所以$
		integral (2x+1)/((x-1)(x-2)(x+3))dif x=&-3/4integral (dif x)/(x-1)+integral (dif x)/(x-2)-1/4(dif x)/(x+3)\
		=&-3/4log abs(x-1)+log abs(x-2)-1/4log abs(x+3)+C
	$],
)
#comment[
	这是留数法在有理函数裂项中的应用，本题是最简单的、分母只含一次单因式的情形。#parbreak()
	它的基本处理方法是：要确定所设的一个待定式，就将相应的分母$x-a$从原因式的分母中消去，再代入$x-a=0$（或$x=a$将这个式子解出，从而求得待定式。#parbreak()
	关于留数法裂项的推导和详细操作，可以参考/*ref*/。
]
#question(
	tag:"1/(x^2(x+1)^2)",
	category:red,
	question:$integral (dif x)/(x^2(x+1)^2)$,
	answer:[设$1/(x^2(x+1)^2)=A/x^2+B/x+D/(x+1)^2+E/(x+1)$，用留数法求出#multi-eq[$
		A=lr(1/(x+1)^2|)_(x=0)=1$$
		B=lr((dif 1/(x+1)^2)/(dif x)|)_(x=0)=lr(-2/(x+1)|)_(x=0)=-2$$
		D=lr(1/x^2|)_(x+1=0)=1$$
		E=lr((dif 1/x^2)/(dif(x+1))|)_(x+1=0)=lr(-2/x^3|)_(x+1=0)=2
	$]所以$
		integral (dif x)/(x^2(x+1)^2)=&integral (dif x)/x^2-2integral (dif x)/x+integral (dif x)/(x+1)^2+2integral (dif x)/(x+1)\
		=&-1/x-2log abs(x)-1/(x+1)+2log abs(x+1)+C
	$],
)
#comment[
	这是留数法在处理分母含一次重因式时的做法。裂项时设待定式的方式和待定系数法如出一辙，但后续操作有所不同。如果一个待定式对应的分母$(x-a)^n$和原式当中的重数相同，那么仿照#ref("(2x+1)/((x-1)(x-2)(x+3))")中的方法求未知量即可。而如果待定式的分母次数低于原式当中的重数，那么低$m$次就需要求$m$阶导再代入$x-a=0$，最后还要记得除$m!$。
]
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
	tag:"x^2/(x^4-x^2+1)",
	category:blue,
	question:$integral x^2/(x^4-x^2+1)dif x$,
	answer:[考虑到$
		x^4+x^2+1=(x^2+1)^2-x^2=(x^2-x+1)(x^2+x+1)
	$设$x^2/(x^4+x^2+1)=A/(x^2-x+1)+B/(x^2+x+1)$，用模法求出#multi-eq[$
		A=&x^2/(x^2+x+1)mod(x^2-x+1)\
		=&x^2/((x^2-x+1)+2x)mod(x^2-x+1)\
		=&x^2/(2x)mod(x^2-x+1)\
		=&x/2$$
		B=&x^2/(x^2-x+1)mod(x^2+x+1)\
		=&x^2/((x^2+x+1)-2x)mod(x^2+x+1)\
		=&x^2/(-2x)mod(x^2+x+1)\
		=&-x/2
	$]所以$
		&integral x^2/(x^4+x^2+1)dif x\
		=&1/2integral x/(x^2-x+1)dif x-1/2integral x/(x^2+x+1)dif x\
		=&1/4integral (2x-1)/(x^2-x+1)dif x+1/4integral (dif x)/(x^2-x+1)-1/4integral (2x+1)/(x^2+x+1)dif x+1/4integral (dif x)/(x^2+x+1)\
		=&1/4log (x^2-x+1)/(x^2+x+1)+1/(2sqrt(3))arctan (2x-1)/sqrt(3)+1/(2sqrt(3))arctan (2x+1)/sqrt(3)+C
	$],
)
#comment[
	关于$x^4+k x^2+1 space(k<=2)$的因式分解，可以仿照本题中的平方差思路进行。
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
		&integral (x-2)/(x^4+2x^3-3x^2-4x+4)dif x\
		=&1/27integral (5x-8)/(x-1)^2dif x-1/27integral (5x+22)/(x+2)^2dif x\
		=&5/27integral (dif x)/(x-1)-1/9integral (dif x)/(x-1)^2-5/27integral (dif x)/(x+2)-4/9integral (dif x)/(x+2)^2\
		=&5/27log abs((x-1)/(x+2))+1/(9(x-1))+4/(9(x+2))+C
	$],
)
#comment[
	本题的分母乍看比较复杂，不容易进行因式分解，此时可以尝试使用试根的方法。对于整系数多项式而言，可以将常数项的因数代入计算多项式的值（比如本题的$+-1,+-2,+-4$）。如果得到$0$，则这个数就是多项式的一个根，可以先行将它对应的因式分解出来，再对剩余部分继续如法炮制，从而逐步将原式分解完成。#parbreak()
	另外，本题也涉及到分母含重因式时的模法应用。与留数法不同，模法要求只将分母中不同的因子分离开，而重因式的部分不再需要进一步分离。此处的$A,B$都是比分母低一次的待定多项式。
]
#question(
	tag:"(3x^2+1)/(x^4+1)",
	category:red,
	question:$integral (3x^2+1)/(x^4+1)dif x$,
	answer:[$
		integral (3x^2+1)/(x^4+1)dif x=2Int(#1,integral (x^2+1)/(x^4+1)dif x)+Int(#2,integral (x^2-1)/(x^4+1)dif x)
	$分别解这两个积分，得#multi-eq[$
		Int(#1)=Int(#1,integral (x^2+1)/(x^4+1)dif x)=&integral (1+x^(-2))/(x^2+x^(-2))dif x\
		=&integral dif(x-x^(-1))/((x-x^(-1))^2+2)\
		=&1/sqrt(2)arctan (x-x^(-1))/sqrt(2)+C_1$$
		Int(#2)=Int(#2,integral (x^2-1)/(x^4+1)dif x)=&integral (1-x^(-2))/(x^2+x^(-2))dif x\
		=&integral dif(x+x^(-1))/((x+x^(-1))^2-2)\
		=&1/(2sqrt(2))log abs((x+x^(-1)-sqrt(2))/(x+x^(-1)+sqrt(2)))+C_2
	$]所以原积分可化为$
		2Int(#1)+Int(#2)=sqrt(2)arctan (x-x^(-1))/sqrt(2)+1/(2sqrt(2))log abs((x+x^(-1)-sqrt(2))/(x+x^(-1)+sqrt(2)))+C
	$],
)
#comment[
	本题涉及到$integral (x^2+-1)/(x^4+1)dif x$的积分问题。这两个积分是可以通过裂项来解决的，分母因式分解的等式为$x^4+1=(x^2-sqrt(2)x+1)(x^2+sqrt(2)x+1)$。不过，倘若分子分母同除$x^2$凑对勾换元，就像本题中的$Int(#1)$和$Int(#2)$那样，解题就会更加快捷。#parbreak()
	本题还有一个重要思路，就是积木法。一言以蔽之，积木法就是将难以解决的积分通过适当的分项转化成若干个容易解决的积分，从而解决原和分的过程。比如说，$integral (a x^2+b)/(x^4+1)dif x$是难以解决的积分，而$integral (x^2+1)/(x^4+1)dif x$和$integral (x^2-1)/(x^4+1)dif x$是相对容易解决的。那么，只要我们能将前者用后者表示出来，这个积分就可以解决了。积木法和前面介绍过的分项积分法原理相同。类似的更复杂问题还有#ref("(ax^5+bx^4+cx^3+dx^2+ex+f)/(x^6+1)")等。
]
#question(
	tag:"1/sqrt(x(x+1))",
	category:red,
	question:$integral (dif x)/sqrt(x(x+1))$,
	answer:[当$x>0$时，$
		integral (dif x)/sqrt(x(x+1))=integral (dif x)/(sqrt(x)sqrt(x+1))=2integral dif(sqrt(x))/sqrt(sqrt(x)^2+1)=2log(sqrt(x)+sqrt(x+1))+C_1
	$当$x<-1$时，$
		integral (dif x)/sqrt(x(x+1))=integral (dif x)/(sqrt(-x)sqrt(-x-1))=-2integral dif(sqrt(-x))/sqrt(sqrt(-x)^2-1)=-2log(sqrt(-x)+sqrt(-x-1))+C_2
	$综上所述，得到$
		integral (dif x)/sqrt(x(x+1))=cases(
			2log(sqrt(x)+sqrt(x+1))+C_1\,&x>0,
			-2log(sqrt(-x)+sqrt(-x-1))+C_2\,&x<-1,
		)
	$],
)
#comment[
	这种方法能避开配方$integral (dif x)/sqrt((x+1/2)^2-1/4)$再求解的过程，但需要注意拆根式时考虑$x$的取值范围，否则容易产生错解。
]
#question(
	tag:"x^5/sqrt(x^3+1)",
	category:red,
	question:$integral x^5sqrt(x^3+1)dif x$,
	answer:[$
		integral x^5sqrt(x^3+1)dif x=1/3integral x^3sqrt(x^3+1)dif x^3
	$令$subst(x^3=t^2-1,in [0,+infinity))$
	],
)
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
