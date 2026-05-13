#import "../utils.typ":question,comment,subst,ref,multi-eq,ref-eq,Int,noindent
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
	answer:[设$(2x+1)/((x-1)(x-2)(x-3))=A/(x-1)+B/(x-2)+C/(x+3)$，用留数法求出#multi-eq($
		A=lr((2x+1)/((x-2)(x+3))|)_(x-1=0)=-3/4
	$,$
		B=lr((2x+1)/((x-1)(x+3))|)_(x-2=0)=1
	$,$
		C=lr((2x+1)/((x-1)(x-2))|)_(x+3=0)=-1/4
	$)所以$
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
	answer:[设$1/(x^2(x+1)^2)=A/x^2+B/x+D/(x+1)^2+E/(x+1)$，用留数法求出#multi-eq($
		A=lr(1/(x+1)^2|)_(x=0)=1
	$,$
		B=lr((dif 1/(x+1)^2)/(dif x)|)_(x=0)=lr(-2/(x+1)|)_(x=0)=-2
	$,$
		D=lr(1/x^2|)_(x+1=0)=1
	$,$
		E=lr((dif 1/x^2)/(dif(x+1))|)_(x+1=0)=lr(-2/x^3|)_(x+1=0)=2
	$)所以$
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
	$设$1/(u(u+1)^3)=A/u+B/(u+1)^3+E/(u+1)^2+E/(u+1)$，用留数法求出#multi-eq($
		A=lr(1/(u+1)^3|)_(u=0)=1
	$,$
		B=lr(1/u|)_(u+1=0)=-1
	$,$
		C=lr(dif(1/u)/dif(u+1)|)_(u+1=0)=lr(-1/u^2|)_(u+1=0)=-1
	$,$
		D=lr(1/2dot (dif^2 1/u)/dif(u+1)^2|)_(u+1=0)=lr(1/u^3|)_(u+1=0)=-1
	$)所以$
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
	answer:[设$1/(x^3+1)=A/(x+1)+B/(x^2-x+1)$，用留数法求出#multi-eq($
		A=lr(1/(x^2-x+1)|)_(x+1=0)=1/3
	$,$
		B=lr(1/(x+1)|)_(x^2-x+1=0)=lr((x-2)/(x^2-x-2)|)_(x^2-x=-1)=(x-2)/(-3)
	$)所以$
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
	answer:[设$1/(x^3-1)=A/(x-1)+B/(x^2+x-1)$，用模法求出#multi-eq($
		A=1/(x^2+x+1)mod(x-1)=1/3
	$,$
		B=&1/(x-1)mod(x^2+x+1)\
		=&(x+2)/(x^2+x-2)mod(x^2+x+1)\
		=&(x+2)/(x^2+x+1-3)mod(x^2+x+1)\
		=&(x+2)/(-3)
	$)所以$
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
	$设$x^2/(x^4+x^2+1)=A/(x^2-x+1)+B/(x^2+x+1)$，用模法求出#multi-eq($
		A=&x^2/(x^2+x+1)mod(x^2-x+1)\
		=&x^2/((x^2-x+1)+2x)mod(x^2-x+1)\
		=&x^2/(2x)mod(x^2-x+1)\
		=&x/2
	$,$
		B=&x^2/(x^2-x+1)mod(x^2+x+1)\
		=&x^2/((x^2+x+1)-2x)mod(x^2+x+1)\
		=&x^2/(-2x)mod(x^2+x+1)\
		=&-x/2
	$)所以$
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
	$设$(x-2)/(x^4+2x^3-3x^2-4x+4)=A/(x-1)^2+B/(x+2)^2$，用模法求出#multi-eq($
		A=&(x-2)/(x+2)^2mod(x-1)^2\
		=&(x-2)/(x^2-2x+1+6x+3)mod(x^2-2x+1)\
		=&1/3dot ((x-2)(2x-5))/((2x+1)(2x-5))mod(x^2-2x+1)\
		=&1/3dot (2x^2-4x+2-5x+8)/(4x^2-8x+4-9)mod(x^2-2x+1)\
		=&(5x-8)/27
	$,$
		B=&(x-2)/(x-1)^2mod(x+2)^2\
		=&-1/3dot ((x-2)(2x+7))/((2x+1)(2x+7))mod(x^2+4x+4)\
		=&-1/3dot (2x^2+8x+8-5x-22)/(4x^2+16x+16-9)mod(x^2+4x+4)\
		=&-(5x+22)/27
	$)所以$
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
	$分别解这两个积分，得#multi-eq($
		Int(#1)=Int(#1,integral (x^2+1)/(x^4+1)dif x)=&integral (1+x^(-2))/(x^2+x^(-2))dif x\
		=&integral dif(x-x^(-1))/((x-x^(-1))^2+2)\
		=&1/sqrt(2)arctan (x-x^(-1))/sqrt(2)+C_1
	$,$
		Int(#2)=Int(#2,integral (x^2-1)/(x^4+1)dif x)=&integral (1-x^(-2))/(x^2+x^(-2))dif x\
		=&integral dif(x+x^(-1))/((x+x^(-1))^2-2)\
		=&1/(2sqrt(2))log abs((x+x^(-1)-sqrt(2))/(x+x^(-1)+sqrt(2)))+C_2
	$)所以原积分可化为$
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
		integral x^5sqrt(x^3+1)dif x=1/3Int(integral x^3sqrt(x^3+1)dif x^3)
	$令$subst(x^3=t^2-1,t in[0,+infinity))$，则$subst(t=sqrt(x^3+1))$，所以$
		Int(1/3integral x^3sqrt(x^3+1)dif x^3)=&1/3integral (t^2-1)t dif t^2\
		=&2/3integral (t^4-t^2)dif t\
		=&2/15t^5-2/9t^3+C\
		=&2/15sqrt(x^3+1)^5-2/9sqrt(x^3+1)^3+C
	$],
)
#comment[
	这是切比雪夫定理在处理无理函数积分时的应用。这里要解决的主要问题是$sqrt(x^3+1)$。为了简化计算，可以考虑整体换元$subst(u=x^3)$再进一步操作，因而需要适当凑微分。这里将$subst(u=x^3)$与接下来消根式的换元$subst(u=t^2-1)$合并成了一步，读者在熟练掌握切比雪夫定理后也会熟悉这样的操作。#parbreak()
	有关切比雪夫定理的内容，可见/*ref*/。
]
#question(
	tag:"sqrt(x/(x+1))",
	category:red,
	question:$integral sqrt(x/(x+1))dif x$,
	answer:[令$subst(t=sqrt(x/(x+1)),t in[0,1)union(1,+infinity))$，则$x=t^2/(1-t^2)$，所以$
		integral sqrt(x/(x+1))dif x=&integral t dif t^2/(1-t^2)\
		=&integral t dif(1/(1-t^2)-1)\
		=&integral t dif 1/(1-t^2)\
		=&t/(1-t^2)-integral (dif t)/(1-t^2)\
		=&t/(1-t^2)-1/2log abs((t-1)/(t+1))+C\
		=&(x+1)sqrt(x/(x+1))+1/2log abs((sqrt(x/(x+1))-1)/(sqrt(x/(x+1))+1))+C
	$],
)
#comment[
	这也是切比雪夫定理的一种常见用法，一般叫做分式线性替换。#parbreak()
	在解题过程中，当换元得到$integral t dif t^2/(1-t^2)$后，不要一股脑地直接求导化成$-2integral (t^2dif t)/(t^2-1)^2$。显然先分部积分之后再做会更轻松。#parbreak()
	另外，不要对结果中的$abs((sqrt(x/(x+1))-1)/(sqrt(x/(x+1))+1))$画蛇添足化简成$abs((sqrt(x)-sqrt(x-1))/(sqrt(x)+sqrt(x-1)))$。这是因为，上述化简操作必须经过一步拆根式$sqrt(x/(x+1))=sqrt(x)/sqrt(x+1)$的操作，而这么做的前提是$x in[0,+infinity)$。然而，实际上被积函数的定义域是$(-infinity,-1)union[0,+infinity)$，并不满足拆根式的要求，会产生错解。#parbreak()
	同理，$(x+1)sqrt(x/(x+1))$也不能直接化简为$sqrt(x(x+1))$。正确的操作应该是$(x+1)sqrt(x/(x+1))=(x+1)sqrt(x(x+1))/abs(x+1)=sgn(x+1)sqrt(x(x+1))$。显然，这样的化简适得其反，结果看起来更不自然了，不如保留原样。
]
#question(
	tag:"sqrt(x(x+1))",
	category:red,
	question:$integral sqrt(x(x+1))dif x$,
	answer:[令$subst(t=sqrt(x/(x+1)),t in[0,1)union(1,+infinity))$，则$x=t^2/(1-t^2)$，所以$
		integral sqrt(x(x+1))dif x=&integral sqrt(t^2/(1-t^2)dot 1/(1-t^2))dif t^2/(1-t^2)\
		=&integral sqrt(t^2/(1-t^2)^2)dif(t^2/(1-t^2)-1)\
		=&integral t/abs(1-t^2)dif 1/(1-t^2)\
		=&sgn(1-t^2)integral t/(1-t^2)dif 1/(1-t^2)\
		=&1/2sgn(1-t^2)integral t dif 1/(1-t^2)^2\
		=&t/(2(1-t^2)^2)sgn(1-t^2)-1/2sgn(1-t^2)Int(integral (dif t)/(t^2-1)^2)
	$接下来解$Int(integral (dif t)/(t^2-1)^2)$：$
		Int(integral (dif t)/(t^2-1)^2)=1/4integral (1/(t-1)-1/(t+1))^2dif t\
		=&1/4integral (dif t)/(t-1)^2-1/2integral (dif t)/(t^2-1)+1/4integral (dif t)/(t+1)^2\
		=&-1/(4t-4)-1/4log abs((t-1)/(t+1))-1/(4t+4)+C_1
	$所以$
		&integral sqrt(x(x+1))dif x\
		=&t/(2(1-t^2)abs(1-t^2))-1/2[Int(-1/(4t-4)-1/(4t+4)-1/4log abs((t-1)/(t+1)))]sgn(1-t^2)+C\
		=&t/(2(1-t^2)abs(1-t^2))-t/(4abs(1-t^2))+1/8log abs((t-1)/(t+1))sgn(1-t^2)+C\
		=&(2x+1)/4sqrt(x(x+1))+1/8log abs((sqrt(x/(x+1))-1)/(sqrt(x/(x+1))+1))sgn(x+1)+C
	$],
)
#comment[
	这是切比雪夫定理的一个应用。此处依然要注意开偶次根式的诸多问题。另外，对于积分$integral (dif t)/(t^2-1)^2$，这里的做法是先在括号内进行裂项，把被积函数变成$1/4(1/(t-1)-1/(t+1))^2$，再进行二项式展开和后续操作，也不失为一种好方法。#parbreak()
	本题也是二次根式积分问题，还可以用三角换元做，或者仿照#ref("sqrt(x^2+1)")的解法作分部积分，请读者自行尝试。
]
#question(
	tag:"1/root(3,x^3+1)",
	category:red,
	question:$integral (dif x)/root(3,x^3+1)$,
	answer:[$
		integral (dif x)/root(3,x^3+1)=1/3integral (x^2dif x)/(x^2root(3,x^3+1))=1/3integral (dif x^3)/(x^2root(3,x^3+1))
	$令$subst(t=root(3,(x^3+1)/x^3))$，则$x^3=1/(t^3-1)$，所以$
		1/3integral (dif x^3)/(x^2root(3,x^3+1))=1/3integral (dif 1/(t^3-1))/(root(3,(1/(t^3-1))^2dot t^3/(t^3-1)))=1/3integral (dif 1/(t^3-1))/(t/(t^3-1))=Int(integral (-t dif t)/(t^3-1))
	$设$(-t)/(t^3-1)=A/(t-1)+B/(t^2+t+1)$，用留数法求出#multi-eq($
		A=&lr((-t)/(t^2+t+1)|)_(t-1=0)=-1/3
	$,$
		B=&lr((-t)/(t-1)|)_(t^2+t+1=0)=lr(-t(t+2)/(t^2+t-2)|)_(t^2+t+1=0)=(t-1)/3
	$)所以$
		&Int(integral (-t dif t)/(t^3-1))\
		=&-1/3integral (dif t)/(t-1)+1/3integral (t-1)/(t^2+t+1)dif t\
		=&-1/3log abs(t-1)+1/6integral (2t+1)/(t^2+t+1)dif t-1/2integral (dif t)/(t^2+t+1)\
		#let u=$root(3,(x^3+1)/x^3)$
		=&-1/3log abs(#u -1)+1/6log(#u^2+#u+1)-1/sqrt(3)arctan (2root(3,x^3+1)+x)/(sqrt(3)x)+C\
		#let u=$root(3,x^3+1)$
		=&-1/3log abs((#u -x)/x)+1/6log (#u^2+x#u+x^2)/x^2-1/sqrt(3)arctan (2root(3,x^3+1)+x)/(sqrt(3)x)+C
	$],
)
#comment[
	这里用到了类似于$root(3,(x^3+1)/x^3)=root(3,x^3+1)/x$的操作，因为根式是奇数次的，开根式不需要有顾虑。
]
#question(
	tag:"x/sqrt(1+root(3,x^2))",
	question:$integral (x dif x)/sqrt(1+root(3,x^2))$,
	answer:$
		integral (x dif x)/sqrt(1+root(3,x^2))=&1/2integral (dif x^2)/sqrt(1+root(3,x^2))\
		=&1/2integral (dif t^3)/sqrt(t+1)quad subst(t=root(3,x^2)in[0,+infinity))\
		=&3/2integral (t^2dif t)/sqrt(t+1)\
		#let u=$sqrt(t+1)$
		=&3integral [#u^2-1]^2dif #u\
		=&3/5#u^5-2#u^3+3#u+C\
		#let u=$sqrt(root(3,x^2)+1)$
		=&3/5#u^5-2#u^3+3#u+C
	$,
)
#comment[
	本题初看比较棘手，但只要敢于试探就会发现并不难做。对$integral (t^2 dif t)/sqrt(t+1)$最标准的做法是使用切比雪夫定理，再令$subst(t=u^2-1,u in[0,+infinity))$，不过这里图方便直接凑微分$dif sqrt(x+1)$了。
]
#question(
	tag:"1/sqrt(tanx)",
	category:red,
	question:$integral (dif x)/sqrt(tan x)$,
	answer:$
		integral (dif x)/sqrt(tan x)=&integral (dif tan x)/((tan^2 x+1)sqrt(tan x))\
		=&integral (dif u^2)/u(u^4+1)quad subst(u=sqrt(tan x))\
		=&2integral (dif u)/(u^4+1)\
		=&integral (u^2+1)/(u^4+1)dif u-integral (u^2-1)/(u^4+1)dif u\
		=&integral dif(u-u^(-1))/((u-u^(-1))^2+2)-integral dif(u+u^(-1))/((u+u^(-1))^2-2)\
		=&1/sqrt(2)arctan (u-u^(-1))/sqrt(2)-1/(2sqrt(2))log abs((u+u^(-1)-sqrt(2))/(u+u^(-1)+sqrt(2)))+C\
		#let (u,v)=($sqrt(tan x)$,$sqrt(cot x)$)
		=&1/sqrt(2)arctan (#u -#v)/sqrt(2)-1/(2sqrt(2))log abs((#u+#v -sqrt(2))/(#u -#v+sqrt(2)))+C
	$,
)
#comment[
	此类问题有一个潜在规律：如果被积函数是关于$tan x$的有理函数（或某些特定的无理函数），那么直接凑微分$dif tan x$即可解决问题。至于$integral (dif u)/(u^4+1)$的解法，就与#ref("(3x^2+1)/(x^4+1)")相同了。
]
#question(
	tag:"1/(xsqrt(x^2+1))",
	category:red,
	question:$integral (dif x)/(x sqrt(x^2+1))$,
	answer:$
		integral (dif x)/(x sqrt(x^2+1))=&integral (dif x)/(x abs(x)sqrt(1-x^(-2)))\
		=&sgn x integral (dif x)/(x^2sqrt(x^(-2)+1))\
		=&-sgn x integral (dif x^(-1))/sqrt(x^(-2)+1)\
		=&-log(x^(-1)+sqrt(x^(-2)+1))sgn x+C\
		=&-log(1/x+sqrt(1+1/x^2))sgn x+C
	$,
)
#comment[
	本题是倒代换思路的一种体现，通过倒代换的方式将原问题转化成#ref("1/sqrt(x^2+1)")一类的已知问题。这里需要十分注意，从二次根式中提取因式时应带绝对值符号，否则将产生错解。#parbreak()
	顺带一提，本题的结果式还可以继续化简。当$x>0$时有$-log(1/x+sqrt(1+1/x^2))=log x/(1+sqrt(x^2+1))=log (sqrt(x^2+1)-1)/x$；当$x<0$时有$log(1/x+sqrt(1+1/x^2))=log (1-sqrt(x^2+1))/x=log (sqrt(x^2+1)-1)/(-x)$。整理一下可以得到更简洁的结果：$integral (dif x)/(x sqrt(x^2+1))=log (sqrt(x^2+1)-1)/abs(x)+C$。
]
#question(
	tag:"1/(x^2sqrt(x^2-1))",
	category:red,
	question:$integral (dif x)/(x^2sqrt(x^2-1))$,
	answer:$
		integral (dif x)/(x^2sqrt(x^2-1))=&integral (dif x)/(x^2abs(x)(1-x^(-2)))\
		=&sgn x integral (dif x)/(x^3sqrt(1-x^(-2)))\
		=&-1/2sgn x integral (dif x^(-2))/(1-x^(-2))\
		=&sqrt(1-x^(-2))sgn x+C\
		=&sqrt(x^2-1)/x+C
	$,
)
#comment[
	本题和#ref("1/(xsqrt(x^2+1))")是相似的，都是旨在通过凑微分的方法向熟知的积分靠拢，以期避开三角/双曲换元来解决问题。#parbreak()
	事实上，解决这类二次根式积分时笔者不再建议使用三角/双曲换元了。读者可以只依靠已有的二次根式积分公式（见#ref("1/sqrt(ax^2+bx+c)")）和熟练的恒等变换、凑微分技巧来解决问题。#parbreak()
	不建议使用换元的原因在于，解题过程中常常出现因参数取值范围问题导致的错解。例如，要消掉$sqrt(1-x)$的根号，就不能用换元$x=sin t$再套二倍角公式，因为无论如何规定$t$的取值范围，$x$的值域都只能在$[-1,1]$之内，而无法涵盖$x in(-infinity,-1)$的部分。
]
#question(
	tag:"1/sqrt(e^2x+e^x+1)",
	category:red,
	question:$integral (dif x)/sqrt(ee^(2x)+ee^x+1)$,
	answer:$
		integral (dif x)/sqrt(ee^(2x)+ee^x+1)=&integral (ee^(-x)dif x)/sqrt(1+ee^(-x)+ee^(-2x))\
		=&-integral (dif ee^(-x))/sqrt(ee^(-2x)+ee^(-x)+1)\
		=&-integral (dif u)/sqrt(u^2+u+1)quad subst(u=ee^(-x))\
		=&-integral dif(u+1/2)/sqrt((u+1/2)^2+(sqrt(3)/2)^2)\
		#let u=$(2u+1)/sqrt(3)$
		=&-integral dif(#u)/sqrt((#u)^2+1)\
		=&-log(#u+sqrt((4u^2+4u+4)/3))+C\
		=&-log(2ee^(-x)+1+2sqrt(ee^(-2x)+ee^(-x)+1))+C
	$,
)
#comment[
	正常的有理化思路都是凑$dif ee^x$换元消掉指数函数，将原积分变为常见的无理函数积分来处理。但是有些时候通过被积函数的结构可以发现凑$dif ee^(-x)$将是更简单的选择。#parbreak()
	倘若用$subst(t=ee^x)$将原式化为$integral (dif t)/(t sqrt(t^2+t+1))$，那也是倒代换$subst(u=1/t)$解决起来更方便。因此一开始就令$subst(u=ee^(-x))$相当于把倒代换操作一并完成了。
]
#question(
	tag:"1/((x+2)sqrt(x^2+1))",
	category:red,
	question:$integral (dif x)/((x+2)sqrt(x^2+1))$,
	answer:[令$subst(t=1/(x+2))$，则$subst(x=1/t-2)$，所以$
		&integral (dif x)/((x+2)sqrt(x^2+1))\
		=&integral t/sqrt(1/t^2-4/t+5)dif 1/t\
		=&-sgn t integral (dif t)/sqrt(5t^2-4t+1)\
		#let u=$sqrt(5)t-2/sqrt(5)$
		=&-1/sqrt(5)sgn t integral dif(#u)/sqrt((#u)^2+(1/sqrt(5))^2)\
		=&-1/sqrt(5)sgn t integral dif(5t-2)/sqrt((5t-2)^2+1)\
		=&-1/sqrt(5)log(5t-2+sqrt(25t^2-20t+5))sgn t+C\
		=&-1/sqrt(5)log(5/(x+2)-2+sqrt(25/(x+2)^2-20/(x+2)+5))sgn(x+2)+C
	$],
)
#comment[
	这种方法本质上也是倒代换，只不过在此处倒代换需要将$x^2+1)$也表示为关于$x+2$的多项式，不太直观，所以就用中间变量$subst(t=1/(x+2))$来辅助一下。
]
#question(
	tag:"sqrt(1-x^2)/(1+x)",
	category:blue,
	question:$integral sqrt(1-x^2)/(1+x)dif x$,
	answer:$
		integral sqrt(1-x^2)/(1+x)dif x=&integral (1-x^2)/((1+x)sqrt(1-x^2))dif x\
		=&integral (1-x)/sqrt(1-x^2)dif x\
		=&integral (dif x)/sqrt(1-x^2)-integral (x dif x)/sqrt(1-x^2)\
		=&arcsin x+sqrt(1-x^2)+C
	$,
)
#comment[
	本题体现了含$sqrt(a x^2+b x+c)quad(a!=0)$类型积分中的一个重要原则：若被积函数的根号位于分子，则将其放到分母。因为根式与多项式不同，放在分子上也无法分项，没有拼凑的可能；但如果把根号放在分母，就可以根据分母的情况来适当拼凑分子。#parbreak()
	此外，很多常用函数的导数都是根号在分母的形式，比如#multi-eq($
		(dif arcsin x)/(dif x)=1/sqrt(1-x^2),
	$,$
		(dif log abs(x+sqrt(x^2+-1)))/(dif x)=1/sqrt(x^2+-1),
	$,$
		(dif sqrt(x^2+1))/(dif x)=x/(x^2+-1).
	$)
	#noindent 所以如果根号是在分母上，那么凑相应的求导公式就会更简单，比如#ref("sqrt(e^2x+e^x+1)")。
]
#question(
	tag:"sqrt(x^2+1)",
	category:red,
	question:$integral sqrt(x^2+1)dif x$,
	answer:[$
		Int(integral sqrt(x^2+1)dif x)=&integral (x^2dif x)/sqrt(x^2+1)+integral (dif x)/sqrt(x^2+1)\
		=&integral x dif sqrt(x^2+1)+log(x+sqrt(x^2+1))\
		=&x sqrt(x^2+1)-Int(integral sqrt(x^2+1)dif x)+log(x+sqrt(x^2+1))
	$对该式移项得$
		2Int(integral sqrt(x^2+1)dif x)=&x sqrt(x^2+1)+log(x+sqrt(x^2+1))+C\
		Int(integral sqrt(x^2+1)dif x)=&1/2x sqrt(x^2+1)+1/2log(x+sqrt(x^2+1))+C_1
	$],
)
#question(
	tag:"x^2/sqrt(x^2+1)",
	category:red,
	question:$integral (x^2dif x)/sqrt(x^2+1)$,
	answer:[$
		Int(integral (x^2dif x)/sqrt(x^2+1))=&1/2integral (x dif x^2)/(sqrt(x^2+1))\
		=&integral x dif sqrt(x^2+1)\
		=&x sqrt(x^2+1)-integral sqrt(x^2+1)dif x\
		=&x sqrt(x^2+1)-integral (x^2dif x)/sqrt(x^2+1)-integral (dif x)/sqrt(x^2+1)\
		=&x sqrt(x^2+1)-log(x+sqrt(x^2+1))-Int(integral (x^2dif x)/sqrt(x^2+1))
	$对该式移项得$
		2Int(integral (x^2dif x)/sqrt(x^2+1))=&x sqrt(x^2+1)-log(x+sqrt(x^2+1))+C\
		Int(integral (x^2dif x)/sqrt(x^2+1))=&x/2sqrt(x^2+1)-1/2log(x+sqrt(x^2+1))+C_1
	$],
)
#comment[
	这两题都用到了分部积分法，且思路一致，都把原积分化成了两个待解问题：一个是原积分本身，另一个是$integral (dif x)/sqrt(x^2+1)$（它的解法见#ref("1/sqrt(x^2+1)")）。这样一来只要通过移项，就可以把原积分用其它已知结论表达出来。
]
#question(
	tag:"1/(x(1+sqrt(1-x^2)))",
	category:red,
	question:$integral (dif x)/(x(1+sqrt(1-x^2)))$,
	answer:[$
		integral (dif x)/(x(1+sqrt(1-x^2)))=&integral (1-sqrt(1-x^2))/x^3dif x\
		=&1/2integral (sqrt(1-x^2)-1)dif 1/x^2\
		=&(sqrt(1-x^2)-1)/(2x^2)-1/2integral (dif sqrt(1-x^2))/x^2\
		=&(sqrt(1-x^2)-1)/(2x^2)+1/2Int(integral (dif x)/(x sqrt(1-x^2)))
	$接下来解$Int(integral (dif x)/(x sqrt(1-x^2)))$：$
		Int(integral (dif x)/(x sqrt(1-x^2)))=&integral (dif x)/(x^2sqrt(x^(-2)+1)sgn x)\
		=&-sgn x integral (dif x^(-1))/sqrt(x^(-2)-1)\
		=&-sgn x log abs(x^(-1)+sqrt(x^(-2)-1))+C_1\
		=&log (1-sqrt(1-x^2))/abs(x)+C_1
	$所以$
		integral (dif x)/(x(1+sqrt(x^2+1)))=(sqrt(1-x^2)-1)/(2x^2)+1/2log (1-sqrt(1-x^2))/abs(x)+C
	$],
)
#comment[
	善用平方差公式能简化很多问题，比如说#ref("1/(sqrt2+sqrt(1-x)+sqrt(1+x))")#ref("1/(sqrt(x^2+x+1)-1)")。#parbreak()
	另外，本题还有一种算法，就是分子分母同乘$x$，凑微分换元$u=x^2$将这个积分化为$1/2integral (dif x^2)/(x^2(1+sqrt(x^2+1)))$。做法不尽相同，还应就题论题决定最佳方案。
]
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
#question(
	tag:"sinx/(asinx+bcosx)",
	category:blue,
	question:$integral (sin x)/(a sin x+b cos x)dif x space(a,b!=0)$,
	answer:[令$Int(#1)=Int(#1,integral (sin x dif x)/(a sin x+b cos x)),Int(#2)=Int(#2,integral (cos x dif x)/(a sin x+b cos x))$，并分别求出#multi-eq(tag:"sinx/(asinx+bcosx)",$
			a Int(#1)+b Int(#2)=&integral (a sin x+b cos x)/(a sin x+b cos x)dif x=integral dif x=x+C_1
		$,$
			a Int(#2)-b Int(#1)=&integral (a cos x-b sin x)/(a sin x+b cos x)dif x=integral dif(a sin x+b cos x)/(a sin x+b cos x)=log abs(a sin x+b cos x)+C_2
	$)联立#ref-eq("sinx/(asinx+bcosx)",1)#ref-eq("sinx/(asinx+bcosx)",2)，解得$
		Int(#1)=(a x-b log abs(a sin x+b cos x))/(a^2+b^2+)+C
	$],
)
#comment[
	这是组合积分法最经典的例题。组合积分法的关键在于寻找合适的参元（比如本例的$Int(#1),Int(#2)$），通过建立参元之间的线性方程组来解出各个参元，利用这些参元拼出所要求的原函数。#parbreak()
	在本题中，$Int(#1)$就是所要求出的结果，那么就不必再求$Int(#2)$了，直接使用消元法解方程组即可。但倘若要求$integral (c sin x+d cos x)/(a sin x+b cos x)dif x$，就需要在求出$Int(#1),Int(#2)$之后，再用$c Int(#1)+d Int(#2)$将其表示出来。
]
#question(
	tag:"cos^2x/(asinx+bcosx)",
	category:blue,
	question:$integral (cos^2x)/(a sin x+b cos x)dif x space(a,b!=0)$,
	answer:[令$Int(#1)=Int(#1,integral (cos^2x)/(a sin x+b cos x)dif x),Int(#2)=Int(#2,integral (sin^2x)/(a sin x+b cos x)dif x)$，并分别求出#multi-eq(tag:"cos^2x/(asinx+bcosx)",$
		b^2Int(#1)-a^2Int(#2)=&integral (b^2cos^2x-a^2sin^2x)/(a sin x+b cos x)dif x\
		=&integral (b cos x-a sin x)dif x\
		=&b sin x+a cos x+C_1
	$,$
		Int(#1)+Int(#2)=&integral 1/(a sin x+b cos x)dif x\
		=&integral (a sin x+b cos x)/(a sin x+b cos x)^2dif x\
		=&integral dif(b sin x-a cos x)/(a^2+b^2-(b sin x-a cos x)^2)\
		=&1/(2sqrt(a^2+b^2))log abs((b sin x-a cos x+sqrt(a^2+b^2))/(b sin x-a cos x-sqrt(a^2+b^2)))+C_2
	$)联立#ref-eq("cos^2x/(asinx+bcosx)",1)#ref-eq("cos^2x/(asinx+bcosx)",2)，解得$
		Int(#1)=(b sin x+a cos x)/(a^2+b^2)+a^2/(2sqrt(a^2+b^2)^3)log abs((b sin x-a cos x+sqrt(a^2+b^2))/(b sin x-a cos x-sqrt(a^2+b^2)))+C
	$],
)
#comment[
	本题当然可以使用万能公式求解，但复杂程度过高，直接有理化会产生六次分母，而且还带有两个参数，裂项会很麻烦。使用组合积分法能大大简化被积函数。#parbreak()
	简化被积函数的关键在于，要么通过恒等式$sin^2x+cos^2x=1$来降低分子次数，要么通过约分的方法来降低分母次数。这两种操作在本题中都有所涉及。
]
#question(
	tag:"sinxcosx/(sinx+cosx)",
	category:blue,
	question:$integral (sin x cos x)/(sin x+cos x)dif x$,
	answer:$
		integral (sin x cos x)/(sin x+cos x)dif x=&1/2integral ((sin x+cos x)^2-1)/(sin x+cos x)dif x\
		=&1/2integral (sin x+cos x)dif x-1/2integral (sin x+cos x)/(2-(sin x-cos x)^2)dif x\
		=&1/2 sin x-1/2 cos x+1/(4sqrt(2))log abs((sin x-cos x-sqrt(2))/(sin x-cos x+sqrt(2)))+C
	$,
)
#comment[
	恒等变换$2sin x cos x=(sin x+cos x)^2-1=1-(sin x-cos x)^2$在齐次三角有理式中是特别常用的，尤其会在使用组合积分法时发挥巨大作用。相关题目有#ref("sqrt(sinxcos^3x)")等。
]
#question(
	tag:"sin^5x",
	category:blue,
	question:$integral sin^5x dif x$,
	answer:$
		integral sin^5x dif x=&integral (1/(2ii)ee^(ii x)-1/(2ii)ee^(-ii x))^5 dif x\
		#let u(a)=$(ee^(#a ii x)-ee^(#a ii x))$
		=&1/(32ii)integral[#u(5)-5#u(3)+10#u(none)]dif x\
		=&1/16integral sin 5x dif x-5/16integral sin 3x dif x+5/8integral sin x dif x\
		=&-1/80 cos 5x+5/48 cos 3x-5/8 cos x+C
	$,
)
#comment[
	这是解决高次正余弦函数积分较为简便的倍角法。有些资料将倍角法归结为“棣莫弗公式”，但其本质还是欧拉公式。倍角法的流程是，用欧拉公式替换后进行二项式展开，得到若干个$ee^(a ii x)+ee^(-a ii x)$或$ii(ee^(a ii x)-ee^(-a ii x))$，的形式，再用欧拉公式将其转换成多倍角的形式，从而快速实现降次扩角。#parbreak()
	当然，本题直接凑$dif cos x$会更快，这里只是对欧拉公式作简单介绍。欧拉公式更适合用于偶数次正余弦函数的问题，如#ref("sin^4xcos^4x")。
]
#question(
	tag:"sin^4xcos^4x",
	category:blue,
	question:$integral sin^4x cos^4x dif x$,
	answer:$
		integral sin^4x cos^4x dif x=&1/16integral sin^4 2x dif x\
		=&1/16integral (1/(2ii)ee^(2ii x)-1/(2ii)ee^(-2ii x))^4dif x\
		#let u(a)=$(#ee^(#a ii x)+ee^(-#a ii x))$
		=&1/256integral [#u(8)-4#u(4)+6]dif x\
		=&1/128integral cos 8x dif x-1/32integral cos 4x dif x+3/128 integral dif x+C\
		=&1/1024sin 8x-1/128sin 4x+(3x)/128+C
	$,
)
#comment[
	欧拉公式虽然好用，但也需要灵活运用。本题如果一上来就对被积函数套用欧拉公式是比较麻烦的，完全可以先化简成$sin^4 2x$再使用欧拉公式。
]
#question(
	tag:"6^x/(4^x+9^x)",
	category:red,
	question:$integral 6^x/(4^x+9^x)dif x$,
	answer:$
		integral 6^x/(4^x+9^x)dif x=integral (3/2)^x/((3/2)^(2x)+1)dif x=1/(log 3/2)integral dif(3/2)^x/((3/2)^(2x)+1)=1/(log 3/2)arctan (3/2)^x+C
	$,
)
#comment[
	在绝大多数时候，恒等变换只是适当加快解题的手段；但如果读者愿意，也完全可以使用暴力却万能的做法。本题却不然，它在出题过程中就利用恒等变换隐藏了其关键结构，必须指出这个关键结构才能顺利解题。#parbreak()
	首先读者应在题目中尽可能寻找共同点，因为共同之处往往隐藏了最容易利用的信息。本题的分子分母各项其实只有两个因式：$6^x=2^x 3^x,4^x=(2^x)^2,9^x=(3^x)^2$，所以$6^x/(4^x+9^x)=(2^x 3^x)/((2^x)^2+(3^x)^2)$是一个$(a b)/(a^2+b^2)$结构的齐次式，可以凑成$(a/b)/((a/b)^2+1)$的形式。原题解法中第一步的思路就是这样来的。
]
#question(
	tag:"sinlogx/x^2",
	category:blue,
	question:$integral (sin log x)/x^2dif x$,
	answer:[$
		Int(integral (sin log x)/x^2dif x)=&-integral sin log x dif 1/x\
		=&-(sin log x)/x+integral (dif sin log x)/x\
		=&-(sin log x)/x+integral (cos log x dif x)/x^2\
		=&-(sin log x)/x-integral cos log x dif 1/x\
		=&-(sin log x)/x-(cos log x)/x+integral (dif cos log x)/x\
		=&-(sin log x)/x-(cos log x)/x-Int(integral (sin log x dif x)/x^2)\
	$对该式移项得$
		2Int(integral (sin log x)/x^2dif x)=&-(sin log x)/x-(cos log x)/x+C\
		Int(integral (sin log x)/x^2dif x)=&(sin log x)/(2x)-(cos log x)/(2x)+C_1
	$],
)
#comment[
	本题也可以使用换元$x=ee^t$，能将这个积分转化为$integral ee^(-t)sin t dif t$，这样就变成了与#ref("e^xsinax")同类型的问题了。#parbreak()
	换元只是让被积函数转化为那些读者非常熟悉的形式，以此来帮助读者将不同的问题用相同的解法关联起来，但换元从来都不是必须的步骤。某种意义上讲，倘若读者当真有此实力，能直接猜出原函数，那当然不必换元了。
]
#question(
	tag:"e^(-arctanx)/(x^2+1)^(3/2)",
	category:red,
	question:$integral ee^(-arctan x)/(x^2+1)^(3/2)dif x$,
	answer:[令$subst(x=tan t,t in(-pi/2,pi/2))$，则$
		integral ee^(-arctan x)/(x^2+1)^(3/2)dif x=integral (ee^(-t)sec^2t)/(sec^3t)dif t=Int(integral ee^(-t)cos t dif t)
	$接下来解$Int(integral ee^(-t)cos t dif t)$：$
		Int(integral ee^(-t)cos t dif t)=&integral ee^(-t)dif sin t\
		=&ee^(-t)sin t-integral sin t dif ee^(-t)\
		=&ee^(-t)sin t-integral ee^(-t) dif cos t\
		=&ee^(-t)sin t-ee^(-t)cos t+integral cos t dif ee^(-t)\
		=&ee^(-t)sin t-ee^(-t)cos t-Int(integral ee^(-t)cos t dif t)\
	$对该式移项得：$
		2Int(integral ee^(-t)cos t dif t)=&ee^(-t)sin t-ee^(-t)cos t+C\
		Int(integral ee^(-t)cos t dif t)=&1/2ee^(-t)sin t-1/2ee^(-t)cos t+C_1
	$所以$
		integral ee^(-arctan x)/(x^2+1)^(3/2)dif x=&1/2ee^(-arctan x)sin arctan x-1/2ee^(-arctan x)cos arctan x+C_1\
		=&((x-1)ee^(-arctan x))/(2sqrt(x^2+1))+C_1
	$],
)
#comment[
	本题与#ref("sinlogx/x^2")虽然形式上有天嚷之别，但都能通过适当的换元化为同类问题。
]
#question(
	tag:"arcsinx/x^2dot(1+x^2)/sqrt(1-x^2)",
	question:$integral (arcsin x)/x^2dot (1+x^2)/sqrt(1-x^2)dif x$,
	answer:$
		&integral (arcsin x)/x^2dot (1+x^2)/sqrt(1-x^2)dif x\
		=&integral (arcsin x)/(x^2sqrt(1-x^2))dif x+integral (arcsin x)/sqrt(1-x^2)dif x\
		=&sgn x integral (arcsin x)/(x^3sqrt(x^(-2)-1))dif x+integral arcsin x dif arcsin x\
		=&-1/2sgn x integral (arcsin x)/sqrt(x^(-2)-1)dif x^(-2)+1/2arcsin^2x\
		=&-sgn x integral arcsin x dif sqrt(x^(-2)-1)+1/2arcsin^2x\
		=&-(sqrt(1-x^2)arcsin x)/x+integral sqrt(1-x^2)/x dif arcsin x+1/2arcsin^2x\
		=&-(sqrt(1-x^2)arcsin x)/x+integral (dif x)/x+1/2arcsin^2x\
		=&-(sqrt(1-x^2)arcsin x)/x+log abs(x)+1/2arcsin^2x+C
	$,
)
#comment[
	本题换元会容易一些，不换元的话就要重点处理被积函数中的$arcsin x$。想要消掉$arcsin x$只能通过求导来实现，这就提示读者应该尽量思考分部积分的可能性。
]
#question(
	tag:"1/(x+sqrt(x^2+x+1))",
	category:blue,
	question:$integral (dif x)/(x+sqrt(x^2+x+1))$,
	answer:[令$subst(sqrt(x^2+x+1)=t x+1)$，则$subst(t=(sqrt(x^2+x+1)-1)/x)$，解出$
		cases(
			subst(x=(2t-1)/(1-t^2)),
			subst(sqrt(x^2+x+1)=(t^2-t+1)/(1-t^2)),
		)
	$所以$
		integral (dif x)/(x+sqrt(x^2+x+1))=integral (1-t)/t dif (2t-1)/(1-t^2)=-2integral (t^2-t+1)/(t(t-1)(t+1)^2)dif t
	$设$(t^2-t+1)/(t(t-1)(t+1)^2)=A/t+B/(t-1)+D/(t+1)^2+E/(t+1)$，用留数法求出#multi-eq($
		A=lr((t^2-t+1)/((t-1)(t+1)^2)|)_(t=0)=-1
	$,$
		B=lr((t^2-t+1)/(t(t+1)^2)|)_(t-1=0)=1/4
	$,$
		C=lr((t^2-t+1)/(t(t-1))|)_(t+1=0)=3/2
	$,$
		D=lr((dif (t^2-t+1)/(t(t-1)))/dif(t+1)|)_(t+1=0)=lr((1-2t)/(t^2(t-1)^2)|)_(t+1=0)=3/4
	$)所以$
		-2integral (t^2-t+1)/(t(t-1)(t+1)^2)dif t=&2integral (dif t)/t-1/2integral (dif t)/(t-1)-3integral (dif t)/(t+1)^2-3/2integral (dif t)/(t+1)\
		=&2log abs(t)-1/2log abs(t-1)+3/(t+1)-3/2log abs(t+1)+C\
		=&2 log abs((sqrt(x^2+x+1)-1)/x)-1/2log abs((sqrt(x^2+x+1)-x-1)/x)\
		&++(3x)/(sqrt(x^2+x+1)+x-1)-3/2log abs((sqrt(x^2+x+1)+x-1)/x)+C
	$],
)
#comment[
	这是欧拉换元的典型应用。从几何意义上讲，本题是双曲线一支上取一定点（图像与$y$轴交点）作直线，以直线斜率$t$作为参数找到另一个交点并用$t$将点的坐标表示出来的过程。它的适用范围是$sqrt(a x^2+b x+c)$中$c>0$的情况。在三种欧拉换元中，它是计算量最大的，也是可以被其它两种情形涵盖的，所以最不推荐使用。#parbreak()
	欧拉换元的相关知识可以参考/*ref*/。
]
#question(
	tag:"x/sqrt(-(x-1)(x-2))",
	category:blue,
	question:$integral (x dif x)/sqrt(-(x-1)(x-2))$,
	answer:[令$subst(sqrt(-(x-1)(x-2))=t(x-1))$，则$subst(t=sqrt(-(x-2)/(x-1)))$，解出$
		cases(
			subst(x=(t^2+2)/(t^2+1)),
			subst(sqrt(-(x-1)(x-2))=t/(t^2+1)),
		)
	$所以$
		integral (x dif x)/sqrt(-(x-1)(x-2))=&integral (t^2+2)/t dif 1/(t^2+1)\
		=&(t^2+2)/(t(t^2+1))-integral 1/(t^2+1)dif(t+2/t)\
		=&(t^2+2)/(t(t^2+1))-Int(integral (t^2-2)/(t^2(t^2+1))dif t)\
	$接下来解$Int(integral (t^2-2)/(t^2(t^2+1))dif t)$：设$(t^2-2)/(t^2(t^2+1))=A/t^2+B/(t^2+1)$，用留数法求出：#multi-eq($
		A=lr((t^2-2)/(t^2+1)|)_(t^2=0)=-2
	$,$
		B=lr((t^2-2)/t^2|)_(t^2+1=0)=3
	$)所以$
		integral (x dif x)/sqrt(-(x-1)(x-2))=&(t^2+2)/(t(t^2+1))-Int((-2integral (dif t)/t^2+3integral (dif t)/(t^2+1)))\
		=&3/t+1/(t(t^2+1))-3arctan t\
		=&(x-2)sqrt(-(x-1)/(x-2))-3arctan sqrt(-(x-2)/(x-1))+C
	$],
)
#comment[
	这也是欧拉换元的典型应用。从几何意义上讲，这是在半圆上取一定点（图像与$x$轴交点）作直线，以直线的斜率$t$为参数找到另一个交点并用$t$将点的坐标表示出来的过程。它的适用范围是$sqrt(a x^2+b x+c)$中$b^2-4a c>0$的情况。#parbreak()
	在换元得到$integral (t^2+2)/t dif 1/(t^2+1)$后，倘若不用分部积分而是直接求导，将会变为$-2integral (t^2+2)/(t^2+1)^2dif t$，处理起来会比较麻烦，所以分部积分法的技巧性运用很重要。#parbreak()
	另外，在对$(t^2-2)/(t^2(t^2+1))$裂项时，因为这个有理函数只含$t^2$而不含$t$，所以考虑将$t^2$作为一个整体来参与裂项，这样就无需设$A/t^2+B/t+D/(t^2+1)$，计算量也会有所降低。
]
#question(
	tag:"1/(sqrt(x^2+x+1)+1)",
	category:blue,
	question:$integral (dif x)/(sqrt(x^2+x+1)+1)$,
	answer:[令$subst(sqrt(x^2+x+1)=x+t)$，则$subst(t=sqrt(x^2+x+1)-x)$，从而$
		cases(
			subst(x=(1-t^2)/(2t-1)),
			subst(sqrt(x^2+x+1)=(t^2-t+1)/(2t-1)),
		)
	$所以$
		integral (dif x)/(sqrt(x^2+x+1)-1)=integral (2t-1)/(t(t+1))dif (1-t^2)/(2t-1)=-2integral (t^2-t+1)/(t(t+1)(2t-1))dif t
	$设$(t^2-t+1)/(t(t+1)(2t-1))=A/t+B/(t+1)+D/(2t-1)$，用模法求出#multi-eq($
		A=(t^2-t+1)/((t+1)(2t-1))mod t=-1
	$,$
		B=(t^2-t+1)/(t(2t-1))mod(t+1)=1
	$,$
		D=(t^2-t+1)/(t(t+1))mod(2t-1)=1
	$)所以$
		-2integral (t^2-t+1)/(t(t+1)(2t-1))dif t=&2integral (dif t)/t-2integral (dif t)/(t+1)-2 integral (dif t)/(2t-1)\
		=&2log t/(t+1)-2log(2t-1)+C\
		#let u=$sqrt(x^2+x+1)$
		=&2log (#u -x)/(#u -x+1)-log(2sqrt(x^2+x+1)-2x-1)+C
	$],
)
#comment[
	这还是欧拉换元的典型应用。从几何意义上讲，这是作一条与双曲线渐近线平行的直线，斜率取任意一条渐近线的斜率，以纵截距$t$作为参数。这样的直线与双曲线至多有一个交点，那么这个交点就可以用参数$t$表示出来。它的适用范围是$sqrt(a x^2+b x+c)$中$a>0$的情况。#parbreak()
	欧拉换元虽然能够有效解决二次根式积分的有理化问题，但使用这种方法会带来巨大的计算量，一般而言是不推荐使用的。对于这类问题，笔者不建议使用换元，而是像#ref("1/(xsqrt(x^2+1))")#ref("1/(x^2sqrt(x^2-1))")那样只依靠二次根式积分公式和恒等变换、凑微分技巧来解决。如果一定要换元，那么笔者推荐的换元方法是三角换元，而不是双曲换元或欧拉换元。
]
#question(
	tag:"1/(x^2+1)^3",
	category:red,
	question:$integral (dif x)/(x^2+1)^3$,
	answer:[$
		integral (dif x)/(x^2+1)^3=&integral (1+x^2)/(x^2+1)^3dif x-integral x^2/(x^2+1)^3dif x\
		=&integral (dif x)/(x^2+1)^2-1/2integral x/(x^2+1)^3dif x^2\
		=&integral (dif x)/(x^2+1)^2-1/4integral x dif 1/(x^2+1)^2\
		=&3/4Int(integral (dif x)/(x^2+1)^2)+x/(4(x^2+1)^2)
	$接下来解$Int(integral (dif x)/(x^2+1)^2)$：$
		Int(integral (dif x)/(x^2+1)^2)=&integral (1+x^2)/(x^2+1)^2dif x-integral x^2/(x^2+1)^2dif x\
		=&integral (dif x)/(x^2+1)-1/2integral x/(x^2+1)^2dif x^2\
		=&integral (dif x)/(x^2+1)+1/2integral x dif 1/(x^2+1)\
		=&1/2integral (dif x)/(x^2+1)+x/(2x^2+2)\
		=&1/2arctan x+x/(2x^2+2)+C_1
	$所以$
		integral (dif x)/(x^2+1)^3=&3/4Int((1/2arctan x+x/(2x^2+2)))+x/(4(x^2+1)^2)+C\
		=&3/8arctan x+(3x)/(8x^2+8)+x/(4(x^2+1)^2)+C
	$],
)
#comment[
	利用分部积分法，可以实现消分母和递推的功能。在这里，通过在分子中进行适当的拼凑，并适当分项，就能将分母的次数逐步降低。这个积分可以推广到$integral (dif x)/(x^2+1)^n$的情况，读者也可以仿照本题的方法列递推式。
]
#question(
	tag:"sec^(2n+1)x",
	category:blue,
	question:[$integral sec^(2n+1)x dif x space(n in NN)$（列递推式）],
	answer:[当$n>=1$时，$
		Int(integral sec^(2n+1)x dif x)=&integral sec^(2n-1)x dif tan x\
		=&sec^(2n-1)x tan x-integral tan x dif sec^(2n-1)x\
		=&sec^(2n-1)x tan x-(2n-1)integral sec^(2n-1)x tan^2 x dif x\
		=&sec^(2n-1)x tan x-(2n-1)integral sec^(2n-1)x(sec^2x-1)dif x\
		=&sec^(2n-1)x tan x-(2n-1)Int(integral sec^(2n+1)x dif x)+(2n-1)integral sec^(2n-1)x dif x\
	$对该式移项得$
		2n Int(integral sec^(2n+1)x dif x)=&sec^(2n-1)x tan x+(2n-1)integral sec^(2n-1)x dif x\
		Int(integral sec^(2n+1)x dif x)=&1/(2n)sec^(2n-1)x tan x+(2n-1)/(2n)integral sec^(2n-1)x dif x
	$当$n=0$时，$
		integral sec x dif x=log abs(sec x+tan x)+C
	$综上所述，得到$
		integral sec^(2n+1)x dif x=cases(
			1/(2n)sec^(2n-1)x tan x+(2n-1)/(2n)integral sec^(2n-1)x dif x\,&n>=1,
			log abs(sec x+tan x)+C\,&n=0
		)
	$],
)
#comment[
	利用分部积分法，可以实现循环和递推的功能。利用这样的递推操作就可以将被积函数中正割函数的幂次逐渐降低，直到降为一次，再套用基本积分表求解即可。
]
#question(
	tag:"sec^3x",
	question:$integral sec^3x dif x$,
	answer:$
		integral sec^3x dif x=&integral (sin^2x+cos^2x)/(cos^3x)dif x\
		=&-integral (sin x)/(cos^3x)dif cos x+integral (dif x)/(cos x)\
		=&1/2integral sin x dif 1/(cos^2x)+integral sec x dif x\
		=&(sin x)/(2cos^2x)-1/2integral (dif sin x)/(cos^2x)+integral sec x dif x\
		=&(sin x)/(2cos^2x)+1/2integral sec x dif x\
		=&(sin x)/(2cos^2x)+1/2log abs(sec x+tan x)+C
	$
)
#comment[
	本题利用分部积分法，对$(sin^2x)/(cos^3x)$的分母进行降次，实现了消分母的作用。这样处理的关键是对分子的常数进行$1=sin^2x+cos^2x$恒等变换和合理分项，一方面通过约分来降次，另一方面通过分部积分来降次。
]
#question(
	tag:"csc^3x",
	category:blue,
	question:$integral csc^3x dif x$,
	answer:$
		integral csc^3 x dif x=&1/4integral (dif x/2)/(sin^3x/2cos^3x/2)\
		=&1/4integral (sec^4x/2)/(tan^3x/2)dif tan x/2\
		=&1/4integral (t^4+2t^2+1)/t^3dif t quad subst(t=tan x/2)\
		=&1/8t^2+1/2log abs(t)-1/8t^(-2)+C\
		=&1/8tan^2x/2+1/2log abs(tan x/2)-1/8cot^2x/2+C
	$,
)
#comment[
	对于$integral csc^n x dif x$的问题来说，使用万能公式也是一种不错的选择，因为套用二倍角公式后分母是单项式，于是分项和约分都很容易，最后就能化为若干个$integral tan^m x/2 dif tan x/2$的问题，求解起来也比较容易。#parbreak()
	如果是$integral sec^n x dif x$的话，可以先换元$x=t-pi/2$将其转化为$integral csc^n t dif t$，再用万能公式解决。
]
#question(
	tag:"1/(sin2x+2sinx)",
	category:blue,
	question:$integral (dif x)/(sin 2x+2sin x)$,
	answer:$
		integral (dif x)/(sin 2x+2sin x)=&1/2integral (dif x)/(sin x(1+cos x))\
		=&1/2integral (1-cos x)/(sin^3x)dif x\
		=&1/2integral (sin^2x+cos^2x)/(sin^3x)dif x-1/2integral (dif sin x)/(sin^3x)\
		=&1/2integral csc x dif x+1/2integral (cos x)/(sin^3x)dif sin x+1/4 csc^2x\
		=&1/2integral csc x dif x-1/4integral cos x dif 1/(sin^2x)+1/4csc^2x\
		=&1/4integral csc dif x-(cos x)/(4sin^2x)+1/4csc^2x\
		=&1/4log abs(csc x-cot x)-(cos x)/(4sin^2x)+1/4csc^2x+C
	$,
)
#comment[
	本题的角度不统一，所以当务之急是同角化，将所有角度统一起来。这里使用二倍角公式最便捷。这里被积函数是关于$sin x$的奇函数，所以也可以凑$dif cos x$来做。平方差公式也不失为一种可行的做法。
]
#question(
	tag:"sin^2x/(a+cosx)^2",
	question:$integral (sin^2x)/(a+cos x)^2dif x space(a>1)$,
	answer:$
		&integral (sin^2x)/(a+cos x)^2dif x\
		=&-integral (sin x)/(a+cos x)^2dif cos x\
		=&integral sin x dif 1/(a+cos x)\
		=&(sin x)/(a+cos x)-integral (cos x)/(a+cos x)dif x\
		=&(sin x)/(a+cos x)-x+a integral (dif x)/(a+cos x)\
		=&(sin x)/(a+cos x)-x+a integral (cos x-a)/(cos^2x-a^2)dif x\
		=&(sin x)/(a+cos x)-x+a integral (dif sin x)/(sin^2x+a^2-1)+a^2integral (dif tan x)/(a^2tan^2x+a^2-1)\
		=&(sin x)/(a+cos x)-x-a/sqrt(a^2-1)arctan (sin x)/sqrt(a^2-1)+a integral dif(a tan x)/(a^2tan^2x+a^2-1)\
		=&(sin x)/(a+cos x)-x-a/sqrt(a^2-1)arctan (sin x)/sqrt(a^2-1)+a/sqrt(a^2-1)arctan (a tan x)/sqrt(a^2-1)+C
	$,
)
#comment[
	本题被积函数不是齐次三角有理式，直接做就只能使用万能公式。然而如果去套万能公式就会发现这个问题变得非常复杂，难以求解。#parbreak()
	这里使用分部积分先对分母进行降次，转化成$integral (cos x)/(a+cos x)dif x$之后还可以做一次假分式化简，得到的$integral (dif x)/(a+cos x)$解起来就容易很多了，然后使用平方差分项或者万能公式都可以。
]
#question(
	tag:"arctanx/(x+x^(-1))^2",
	category:blue,
	question:$integral (arctan x)/(x+x^(-1))^2dif x$,
	answer:$
		integral (arctan x)/(x+x^(-1))^2dif x=&integral (x^2arctan x)/(x^2+1)^2dif x\
		=&1/2integral (x arctan x)/(x^2+1)^2dif x^2\
		=&-1/2integral x arctan x dif 1/(x^2+1)\
		=&-(x arctan x)/(2x^2+2)+1/2integral dif(x arctan x)/(x^2+1)\
		=&-(x arctan x)/(2x^2+2)+1/2integral (arctan x)/(x^2+1)dif x+1/2integral x/(x^2+1)^2dif x\
		=&-(x arctan x)/(2x^2+2)+1/2integral arctan x dif arctan x+1/4integral (dif x^2)/(x^2+1)^2\
		=&-(x arctan x)/(2x^2+2)+1/4arctan^2x-1/(4x^2+4)+C
	$,
)
#comment[
	本题分母的$(x+x^(-1))^2$略带迷惑性，将被积函数化简之后结构则清晰得多。
]
#question(
	tag:"(x+sinx)/(1+cosx)",
	category:blue,
	question:$integral (x+sin x)/(1+cos x)dif x$,
	answer:$
		integral (x+sin x)/(1+cos x)dif x=&integral (x+2sin x/2cos x/2)/(cos^2x/2+sin^2x/2+cos^2x/2-sin^2x/2)dif x\
		=&integral x sec^2x/2dif x/2+integral tan x/2dif x\
		=&integral x dif tan x/2+integral tan x/2dif x\
		=&x tan x/2+C
	$,
)
#question(
	tag:"(x+sinx)/(1+cosx)~",
	category:blue,
	question:$integral (x+sin x)/(1+cos x)dif x$,
	answer:$
		integral (x+sin x)/(1+cos x)dif x=&integral ((x+sin x)(1-cos x))/(sin^2x)dif x\
		=&integral x csc^2x dif x+integral csc x dif x-integral x csc x cot x dif x-integral cot x dif x\
		=&-integral x dif cot x+integral csc x dif x+integral x dif csc x-integral cot x dif x\
		=&x csc x-x cot x+C
	$,
)
#comment[
	#ref("(x+sinx)/(1+cosx)")#ref("(x+sinx)/(1+cosx)~")给出了同一道题用二倍角公式和平方差分项的两种做法，且都利用了分部积分法，实现了抵消功能。解题的关键是通过$integral u dif v+integral v dif u=u v+C$来抵消两个积分项。（这两个积分如果单独做，可能都是非初等的）#parbreak()
	本题初拿到手可能没什么思路，但是可以顺着简化被积函数的大方向思考，比如说通过二倍角公式或平方差公式将分母变为单项式。分母为单项式的好处比较明显，在三角函数问题中尤其如此，因为分母上的三角函数单项式可以直接变倒数放到分子上（如$1/(sin x)=csc x$），于是就不需要纠缠分母了。
]
#question(
	tag:"e^x/2cosx/sqrt(cosx+sinx)",
	category:blue,
	question:$integral ee^(x/2)(cos x)/sqrt(cos x+sin x)dif x$,
	answer:$
		&integral ee^(x/2)(cos x)/sqrt(cos x+sin x)dif x\
		=&1/2integral ee^(x/2)(cos x+sin x)/sqrt(cos x+sin x)dif x+1/2integral ee^(x/2)(cos x-sin x)/sqrt(cos x+sin x)dif x\
		=&integral ee^(x/2)sqrt(cos x+sin x)dif x/2+1/2integral ee^(x/2)dif(cos x+sin x)/sqrt(cos x+sin x)\
		=&integral sqrt(cos x+sin x)dif ee^(x/2)+integral ee^(x/2)dif sqrt(cos x+sin x)\
		=&ee^(x/2)sqrt(cos x+sin x)+C
	$,
)
#comment[
	本题是积木法与分部积分法的结合，利用了分部积分法的抵消功能。本题乍看上去是没有什么可行思路的，但将它分解为两个积分再分别凑微分之后，就能发现分部积分法使用的可能。
]
#question(
	tag:"(x^2-3x+1)ee^(-x)logx",
	question:$integral (x^2-3x+1)ee^(-x)log x dif x$,
	answer:[先解$Int(integral (x^2-3x+1)ee^(-x)dif x)$：$
		Int(integral (x^2-3x+1)ee^(-x) dif x)=&integral x^2ee^(-x)dif x-3integral x ee^(-x)dif x+integral ee^(-x)dif x\
		=&-integral x^2dif ee^(-x)-3integral x ee^(-x)dif x+integral ee^(-x)dif x\
		=&-x^2ee^(-x)+integral ee^(-x)dif x^2-3integral x ee^(-x)dif x+integral ee^(-x)dif x\
		=&-x^2ee^(-x)-integral x ee^(-x)dif x+integral ee^(-x)dif x\
		=&-x^2ee^(-x)+integral x dif ee^(-x)+integral ee^(-x)dif x\
		=&-x^2ee^(-x)+x ee^(-x)+C_1
	$所以$
		integral Int((x^2-3x+1)ee^(-x))log x dif x=&integral log x dif(Int(-x^2ee^(-x)+x ee^(-x)))\
		=&-x(x-1)ee^(-x)log x+integral x(x-1)ee^(-x)dif log x\
		=&x(1-x)ee^(-x)log x+integral x ee^(-x)dif x-integral ee^(-x)dif x\
		=&x(1-x)ee^(-x)log x-integral x dif ee^(-x)-integral ee^(-x)dif x\
		=&x(1-x)ee^(-x)log x-x ee^(-x)+C
	$],
)
#comment[
	本题较为复杂，混合了指数函数、多项式和对数函数，直接处理相当困难。但倘若能先构造出一个更简单的子问题，并在此基础上简化原问题，就有可能打开局面。#parbreak()
	因为对数函数是被和函数中最难处理的一个因式，所以可以优先考虑将对数函数之外的部分用来凑微分，再通过分部积分法去除最难处理的对数。因此，不妨先解一个积分$integral (x^2-3x+1)ee^(-x)dif x$来辅助凑微分。
]
#question(
	tag:"(xcos^4x/2)/sin^3x",
	question:$integral (x cos^4x/2)/(sin^3x)dif x$,
	answer:$
		integral (x cos^4x/2)/(sin^3x)dif x=&1/4integral (x cos^4x/2)/(sin^3x/2cos^3x/2)dif x/2\
		=&1/4integral (x cos x/2)/(sin^3x/2)dif x/2\
		=&-1/8integral x dif csc^2 x/2\
		=&-x/8csc^2x/2+1/8integral csc^2x/2dif x\
		=&-x/8csc^2x/2-1/4cot x/2+C
	$,
)
#comment[
	本题的核心思路与#ref("(x^2-3x+1)ee^(-x)logx")是一致的，被积函数中的$x$因子最难处理，所以就将其它部分凑微分，再通过分部积分法去掉$x$。如果读者足够熟练，就不必单独列出解积分$integral (cos^4x/2)/(sin^3x)dif x$的过程，直接在原积分中完成凑微分操作即可。#parbreak()
	这里还有一另一个问题，统一角度时如果使用降幂公式处理分子三角函数，后续操作会很麻烦；但使用二倍角公式处理分母三角函数，不仅保持了分母单项式的特征，还能够实现分子分母约分，处理起来更轻松。读者在遇到这种需要统一角度的情况时也应充分考虑这两方面的可能性，不要机械地使用单一套路。
]
#question(
	tag:"1/(sqrt2+sqrt(1-x)+sqrt(1+x))",
	category:red,
	question:$integral (dif x)/(sqrt(2)+sqrt(1-x)+sqrt(1+x))$,
	answer:$
		#let (u,v,uv)=($sqrt(1-x)$,$sqrt(1+x)$,$sqrt(1-x^2)$)
		integral (dif x)/(sqrt(2)+#u+#v)=&integral (#u+#v -sqrt(2))/((#u+#v)^2-2)dif x\
		=&integral (#u+#v -sqrt(2))/(2#uv)dif x\
		=&1/2integral (dif x)/#v+1/2integral (dif x)/#u -1/sqrt(2)integral (dif x)/#uv\
		=&#v -#u -1/sqrt(2)arcsin x+C
	$,
)
#comment[
	本题用平方差公式的一个巧妙之处在于，分母在套用平方差公式后变成了单项式，故分项和约分都很容易。当然，这需要分母系数比较凑巧，倘若$sqrt(2)$换成其它的常数，就未必能如此简便。
]
#question(
	tag:"1/(sqrt2+sqrt(1-x)+sqrt(1+x))~",
	category:red,
	question:$integral (dif x)/(sqrt(2)+sqrt(1-x)+sqrt(1+x))$,
	answer:[令$subst(x=sin 2t,t in[-pi/4,pi/4))$，则$
		integral (dif x)/(sqrt(2)+sqrt(1-x)+sqrt(1+x))=&integral (dif sin 2t)/(sqrt(2)+sqrt(1-sin 2t)+sqrt(1+sin 2t))\
		=&integral (2cos 2t dif t)/(sqrt(2)+cos t-sin t+cos t+sin t)\
		=&integral (2cos 2t dif t)/(sqrt(2)+2cos t)\
		=&integral (2cos 2t(sqrt(2)-2cos t))/(2(1-2cos^2t))dif t\
		=&integral (2cos t-sqrt(2))dif t\
		=&2sin t-sqrt(2)t+C\
		=&2sin (arcsin x)/2-1/sqrt(2)arcsin x+C
	$],
)
#comment[
	本题也可以用三角换元来消根号。注意，开根式$sqrt(1-sin 2t)=cos t-sin t,sqrt(1+sin 2t)=cos t+sin t$是建立在前提$t in[-pi/4,pi/4]$之上的，否则结论就是有问题的。
]
#question(
	tag:"1/(tanx+cotx+secx+cscx)",
	category:blue,
	question:$integral (dif x)/(tan x+cot x+sec x+csc x)$,
	answer:$
		integral (dif x)/(tan x+cot x+sec x+csc x)=&integral (sin x cos x)/(sin^2x+cos^2x+sin x+cos x)dif x\
		=&integral (sin x cos x)/(sin x+cos x+1)dif x\
		=&integral (sin x cos x(sin x+cos x-1))/(1+2sin x cos x-1)dif x\
		=&integral (sin x+cos x-1)/2dif x\
		=&(sin x-cos x-x)/2+C
	$,
)
#comment[
	本题被积函数不齐次，也缺少良好的性质，直接做的话就只能使用万能公式，但万能公式的计算量又过大。适当化简和善用平方差公式则能够有效解围。
]
#question(
	tag:"sin^3x/(sinx+cosx)",
	category:blue,
	question:$integral (sin^3x)/(sin x+cos x)dif x$,
	answer:$
		&integral (sin^3x)/(sin x+cos x)dif x\
		=&integral (sin^3x cos x)/(cos^2x-sin^2x)dif x-integral (sin^4x)/(cos^2x-sin^2x)dif x\
		=&1/4integral (sin 2x(1-cos 2x))/(cos 2x)dif x-1/4integral (1-2cos 2x+cos^2 2x)/(cos 2x)dif x\
		=&1/4integral tan 2x dif x-1/4integral sin 2x dif x-1/4integral sec 2x dif x+1/2integral dif x-1/4 integral cos 2x dif x\
		=&-1/8log abs(cos 2x)+1/8cos 2x-1/8log abs(sec 2x+tan 2x)+x/2-1/8sin 2x+C
	$,
)
#comment[
	有些特定的偶数次齐次三角有理式可以考虑凑出能够套用降幂公式的结构，本题和#ref("sin^3x/(sin^3x+cos^3x)")都是如此。
]
#question(
	tag:"tanxtan(x+a)",
	question:$integral tan x tan(x+a)dif x$,
	answer:[考虑到$tan a=tan(x+a-x)=(tan(x+a)-tan x)/(1+tan x tan(x+a))$，所以$
		integral tan x tan(x+a)dif x=&integral tan(x+a)/(tan a)dif x-integral (tan x)/(tan a)dif x-integral dif x\
		=&cot a log abs(cos x)-cot a log abs(cos(x+a))-x+C
	$],
)
#question(
	tag:"tanxtan2xtan3x",
	question:$integral tan x tan 2x tan 3x dif x$,
	answer:[考虑到$tan 2x=tan(3x-x)=(tan 3x-tan x)/(1+tan x tan 3x)$，所以$
		integral tan x tan 2x tan 3x dif x=&integral (tan 3x-tan 2x-tan x)dif x\
		=&-1/3log abs(cos 3x)+1/2log abs(cos 2x)+log abs(cos x)+C
	$],
)
#comment[
	这两题很相似，都有许多种做法，比如直接用和角公式再有理化，或者化成正余弦函数形式再积化和差等等，但计算量比较大。但最快的做法还是通过恒等变换化成若干个正切函数和的形式。
]
#question(
	tag:"1/(cosxcos(x+a))",
	question:$integral (dif x)/(cos x cos(x+a))$,
	answer:[当$a=k pi space(k in ZZ)$时，$
		integral (dif x)/((-1)^k cos^2x)=(-1)^k integral sec^2x dif x=(-1)^k tan x+C
	$当$a!=k pi space(k in ZZ)$时，$
		integral (dif x)/(cos x cos(x+a))=&csc a integral (sin a dif x)/(cos x cos(x+a))\
		=&csc a integral sin(x+a-x)/(cos x cos(x+a))dif x\
		=&csc a integral (sin(x+a)cos x-sin x cos(x+a))/(cos x cos(x+a))dif x\
		=&csc a integral tan(x+a)dif x-csc a integral tan x dif x\
		=&csc a log abs(cos x)-csc a log abs(cos(x+a))+C
	$综上所述，得到$
		integral (dif x)/(cos x cos(x+a))=cases(
			(-1)^k tan x+C\,&a=k pi\,k in ZZ,
			csc a log abs(cos x)-csc a log abs(cos(x+a))+C\,&a!=k pi\,k in ZZ,
		)
	$],
)
#comment[
	本题需注意对参数$a$的取值作分类讨论。#parbreak()
	本题可以一上来就用和角公式拆分母，做起来也不难；而这样做法的思路是凑一个分子并用和角公式构造成能够与分母约分的形式，从而简化分母。
]
#question(
	tag:"dx/y;y^2(x-y)=x^2",
	question:[$integral (dif x)/y$，其中$y^2(x-y)=x^2$],
	answer:[令$subst(y=t x)$，则$
		cases(
			subst(x=1/(t^2(1-t))),
			subst(y=1/(t(1-t))),
		)
	$所以$
		integral (dif x)/y=integral t(1-t)dif 1/(t^2(1-t))=&1/t-integral dif(t-t^2)/(t^2(1-t))\
		=&1/t-integral (2t-1)/(t^2(t-1))dif t\
		=&1/t-integral (dif t)/(t(t-1))-integral (dif t)/t^2\
		=&2/t-log abs((t-1)/t)+C\
		=&(2x)/y-log abs((y-x)/y)+C
	$],
)
#comment[
	本题是参数方程法的应用。曲线方程$y^2(x-y)=x^2$可以用题中给出的参数方程来表示，于是混合着$x$和$y$的积分就能够表示为关于$t$的积分，从而实现变量统一。#parbreak()
	比值换元是最常见的参数方程求法。如果一个曲线方程能化为一边是$m$次齐次式，另一边是$m+1$次齐次式的形式（比如这里是一个二次，一个三次），那么比值换元就能派上用场。
]
#question(
	tag:"dx/(x-3y);y(y-x)^2=x",
	question:[$integral (dif x)/(x-3y)$，其中$y(y-x)^2=x$],
	answer:[令$subst(y=x+t)$，则$
		cases(
			subst(x=-t^3/(t^2-1)),
			subst(y=-t/(t^2-1)),
		)
	$所以$
		integral (dif x)/(x-3y)=integral (t^2-1)/(t^3-3t) dif t^3/(t^2-1)=&integral t/(t^2-1)dif t\
		=&1/2log abs(t^2-1)+C\
		=&1/2 log abs((y-x)^2-1)+C
	$],
)
#comment[
	因为曲线方程的等号两侧次数差为二，所以这里用比值换元求参数方程就不合适了；$y-x$的次数比较高，所以$subst(y-x=t)$的线性换元更好。
]
#question(
	tag:"x^n/sum_(k=0)^nx^k/k!",
	question:$integral x^n/(sum_(k=0)^n x^k/k!)$,
	answer:[#let s(n)=$sum_(k=0)^#n x^k/k!$
		考虑到$dif/(dif x)(#s($n$))=#s($n-1$)$，所以$
		integral x^n/#s($n$)dif x=&n!integral (x^n/n!)/#s($n$)dif x\
		=&n!integral (#s($n$)-#s($n-1$))/#s($n$)dif x\
		=&n!integral dif x-n!integral #s($n-1$)/#s($n$)dif x\
		=&n!x-n!integral dif(#s($n$))/#s($n$)\
		=&n!x-n!log abs(#s($n$))+C
	$],
)
#comment[
	这种分母含求和结构的问题往往要基于这样的思路：这种形式的分母只有可能通过对数函数求导得来，因此主要的方向变成了在分子上凑出一个形式为分母导数的结构。基于这个目的可以考虑先对分母求导，观察分母导数，再寻求恒等变换去凑出这种形式。类似的问题可以参考#ref("(2n!sinx+x^n)/(e^x+sinx+cosx+sum_(k=0)^nx^k/k!)")。
]
