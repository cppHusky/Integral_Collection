#import "../utils.typ":question,comment,subst,Int,ref,multi-eq
#import "../math.typ":*
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
