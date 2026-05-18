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
#question(
	tag:"(cosx(2x+sinxcosx))/(xsinx+cosx)^3",
)
#question(
	tag:"1/(1-x^2)root(4,x+x^3)",
)
#question(
	tag:"(1-x)/((1+x)sqrt(x^4+kx^2+1)",
)
#question(
	tag:"x^4/sqrt(x^2+1)",
)
