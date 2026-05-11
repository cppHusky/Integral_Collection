#import "../utils.typ":question,comment,subst,Int,ref,multi-eq
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
