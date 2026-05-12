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
