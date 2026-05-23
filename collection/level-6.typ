#import "../utils.typ":question,comment,subst,ref,multi-eq,Int
#import "../math.typ":*
#question(
	tag:"(cosx)/sqrt(cos^2x+2cosx-2)",
	question:$integral (cos x)/sqrt(cos^2x+2cos x-2)dif x$,
	answer:$
		integral (cos x)/sqrt(cos^2x+2cos x-2)dif x=&integral (1-2sin^2x/2)/sqrt(4sin^4x/2-8sin^2x/2+1)dif x\
		=&sgn(cos x/2)integral ((1-2sin^2x/2)cos x/2)/sqrt((1-sin^2x/2)(4sin^4x/2-8sin^2x/2+1))dif x\
		=&2sgn(cos x/2)integral (1-2sin^2x/2)/sqrt(1-9sin^2x/2+12sin^4x/2-4sin^6x/2)dif sin x/2\
		=&2/3sgn(cos x/2)integral dif(3sin x/2-2sin^3x/2)/sqrt(1-(3sin x/2-2sin^3x/2)^2)\
		=&2/3arcsin(3sin x/2-2sin^3x/2)sgn(cos x/2)+C
	$,
)
#question(
	tag:"(x(2-x)e^xcos2x+e^2x-x^4)/((e^xcosx+x^2sinx)sqrt(x64-e^2x)sqrt(cos2x))",
	question:$integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/((ee^x cos x+x^2sin x)sqrt(x^4-ee^(2x))sqrt(cos 2x))dif x$,
	answer:[
		#let u=$(ee^x sin x+x^2cos x)/(ee^x cos x+x^2sin x)$
	$
		&integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/((ee^x cos x+x^2sin x)sqrt(x^4-ee^(2x))sqrt(cos 2x))dif x\
		=&integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/((ee^x cos x+x^2sin x)sqrt(x^4cos^2x-ee^(2x)cos^2x-x^4sin^2x+ee^(2x)sin^2x))dif x\
		=&integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/((ee^x cos x+x^2sin x)sqrt((ee^x sin x+x^2cos x)^2-(ee^x cos x+x^2sin x)^2))dif x\
		=&sgn(ee^x cos x+x^2sin x)integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/(ee^x cos x+x^2sin x)^2/sqrt((#u)^2-1)dif x
	$试导可知$dif/(dif x)(#u)=(x(2-x)ee^x cos 2x+ee^(2x)-x^4)/(ee^x cos x+x^2sin x)^2$，所以$
		&sgn(ee^x cos x+x^2sin x)integral (x(2-x)ee^x cos 2x+ee^(2x)-x^4)/(ee^x cos x+x^2 sin x)^2/sqrt((#u)^2-1)dif x\
		=&sgn(ee^x cos x+x^2sin x)integral (dif #u)/sqrt((#u)^2-1)\
		=&arcosh abs(#u)sgn(ee^x sin x+x^2cos x)+C
	$],
)
#comment[
	注意，积分$integral (dif x)/sqrt(x^2-1)$用反双曲函数表达的最准确的结果是$arcosh abs(x)sgn x+C$。
]
#question(
	tag:"(sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)-x arsinh x)",
	question:$integral (sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)-x arsinh x)^2dif x$,
	answer:$
		&integral (sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)-x arsinh x)^2dif x\
		=&integral (sqrt(x^2+1)log x-x arsinh x)/(arsinh x)dif 1/(sqrt(x^2+1)-x arsinh x)\
		=&(sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)arsinh x-x arsinh^2x)-integral (sqrt(x^2+1)arsinh x-x log x)/(x sqrt(x^2+1)arsinh^2x)dif x\
		=&(sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)arsinh x-x arsinh^2x)+integral (sqrt(x^2+1)arsinh x-x log x)/x dif 1/(arsinh x)\
		=&(sqrt(x^2+1)log x-x arsinh x)/(sqrt(x^2+1)arsinh x-x arsinh^2 x)+(sqrt(x^2+1)arsinh x-x log x)/(x arsinh x)+integral (dif x)/(x^2sqrt(x^2+1))\
		=&(x(log x-1))/(sqrt(x^2+1)-x arsinh x)+C\
	$,
)
#question(
	tag:"(x^5+4x^2)/((x^6+x^4-4x^3+4)sqrt(x^3-2))",
	question:$integral (x^5+4x^2)/((x^6+x^4-4x^3+4)sqrt(x^3-2))dif x$,
	answer:[注意到$x^6+x^4-4x^3+4=sqrt(x^3-2)^4+x^4$，所以$
		&integral (x^5+4x^2)/((x^6+x^4-4x^3+4)sqrt(x^3-2))dif x\
		=&integral (x^2(x^3+4))/((sqrt(x^3-2)^4+x^4)sqrt(x^3-2))dif x\
		=&integral x^4/(sqrt(x^3-2)^4+x^4)dot (x^3+4)/(x^2sqrt(x^3-2))dif x\
		=&sgn x integral x^4/(sqrt(x^3-2)^4+x^4)dot (1+4x^(-3))/sqrt(x-2x^(-2))dif x\
		=&2integral 1/((sqrt(x^3-2)/x)^4+1)dif sqrt(x^3-2)/x\
		=&1/sqrt(2)arctan (x^3-x^2-2)/(x sqrt(2x^3-4))-1/(2sqrt(2))log (x^3+x^2-2-x sqrt(2x^3-4))/(x^3+x^2-2+x sqrt(2x^3-4))+C
	$],
)
#question(
	tag:"root(3,sin^2x)/(3sin^2x-cos^2x)",
	question:$integral root(3,sin^2x)/(3sin^2x-cos^2x)dif x$,
	answer:[$
		integral root(3,sin^2x)/(3sin^2x-cos^2x)dif x=&integral root(3,(tan^2x)/(tan^2x+1))/(3tan^2x-1)dif tan x\
		=&integral (u dif u)/((3u^2-1)root(3,u^3+u))quad subst(u=tan x)\
		=&1/root(3,4)integral (sqrt(3)u+1+sqrt(3)u-1)/((sqrt(3)u-1)(sqrt(3)u+1)root(3,(sqrt(3)u+1)^3+(sqrt(3)u-1)^3))dif u\
		=&1/root(3,4)integral (dif u)/((sqrt(3)u-1)^2root(3,((sqrt(3)u+1)/(sqrt(3)u-1))^3+1))+1/root(3,4)integral (dif u)/((sqrt(3)u+1)^2root(3,((sqrt(3)u-1)/(sqrt(3)u+1))^3+1))\
		=&1/(2sqrt(3)root(3,4))integral (dif (sqrt(3)u-1)/(sqrt(3)u+1))/root(3,((sqrt(3)u-1)/(sqrt(3)u+1))^3+1)-1/(2sqrt(3)root(3,4))integral (dif (sqrt(3)u+1)/(sqrt(3)u-1))/root(3,((sqrt(3)u+1)/(sqrt(3)u-1))^3+1)
	$接下来解$integral (dif t)/root(3,t^3+1)$：$
		integral (dif t)/root(3,t^3+1)=&1/sqrt(3)arctan(1/sqrt(3)+(2t)/(sqrt(3)root(3,t^3+1)))-1/3log abs(1-t/root(3,t^3+1))\
		&++1/6log(1+t/root(3,t^3+1)+t^2/root(3,t^3+1)^2)+C_1
	$所以$
		integral root(3,sin^2x)/(3sin^2x-cos^2x)dif x=&1/(6root(3,4))arctan(1/sqrt(3)+root(3,4)(sqrt(3)sin x-cos x)/(3sin x))\
		&--1/(6sqrt(3)root(3,4))log abs(1-(sqrt(3)sin x-cos x)/(sqrt(3)root(3,2sin x)))\
		&++1/(12sqrt(3)root(3,4))log[1+(sqrt(3)sin x-cos x)/(sqrt(3)root(3,2sin x))+(4sin^2(x-pi/6))/(3root(3,4sin^2x))]\
		&--1/(6root(3,4))arctan(1/sqrt(3)+root(3,4)(sqrt(3)sin x+cos x)/(3root(3,sin x)))\
		&++1/(6sqrt(3)root(3,4))log abs(1-(sqrt(3)sin x+cos x)/(sqrt(3)root(3,2sin x)))\
		&-1/(12sqrt(3)root(3,4))log[1+(sqrt(3)sin x+cos x)/(sqrt(3)root(3,2sin x))+(4sin^2(x+pi/6))/(3root(3,4sin^2x))]+C
	$],
)
#comment[
	起初化成的两个积分有相同的结构，这时候只要解出相同结构的积分$integral (dif t)/root(3,t^3+1)$，然后再分别套$(sqrt(3)u-1)/(sqrt(3)u+1)$和$(sqrt(3)u+1)/(sqrt(3)u-1)$，用一个通式就能解出两个积分了。
]
#question(
	tag:"(sqrt(x^2+1)logx-xarsinhx)/(sqrt(x^2+1)-xarsinhx)^2",
	question:$integral sqrt(sqrt(sin^2x+3)+2csc^2x)dif x$,
	answer:$
		&integral sqrt(sqrt(sin^2x+3)+2csc^2x)dif x\
		=&sgn(sin x)integral sqrt(sqrt(sin^2x+3)sin^2x+2)/(sin x)dif x\
		=&sgn(sin x)integral sqrt((sin^2x+3)^(3/2)-3(sin^2x+3)^(1/2)+2)/(sin x)dif x\
		=&sgn(sin x)integral (sqrt(sin^2x+3)-1)/(sin x)dot abs(cos x)/sqrt(2-sqrt(sin^2x+3)) dif x\
		=&sgn(sin 2x)integral (sqrt(sin^2x+3)-1)/(sin x)dot (dif sin x)/sqrt(2-sqrt(sin^2x+3))\
		=&1/2sgn(sin 2x)integral (sqrt(t+3)-1)/(t sqrt(2-sqrt(t+3)))dif t quad subst(t=sin^2x)\
		=&-2sgn(sin 2x)integral (u^4-3u^2+2)/(u^4-4u^2+1)dif u quad subst(u=sqrt(2-sqrt(t+3)))\
		=&-2sqrt(s-sqrt(sin^2x+3))sgn(sin 2x)\
		&--1/sqrt(2)log (1-sqrt(sin^2x+3)-sqrt(4-2sqrt(sin^2x+3)))/(1-sqrt(sin^2x+3)+sqrt(4-2sqrt(sin^2x+3)))sgn(sin 2x)+C
	$,
)
#question(
	tag:"(cos^2x+cos(sinx))/(1+sinxsin(sinx))",
	question:$integral (cos^2x+cos(sin x))/(1+sin x sin(sin x))dif x$,
	answer:[$
		&integral (cos^2x+cos(sin x))/(1+sin x sin(sin x))dif x\
		=&integral (cos^2((x+sin x)/2+(x-sin x)/2)+cos((x+sin x)/2-(x-sin x)/2))/(1+1/2cos(x-sin x)+1/2cos(x+sin x))dif x\
		=&integral (cos^2u cos^2v+sin^2u sin^2v-2sin u sin v cos u cos v+cos u cos v+sin u sin v)/(sin^2u+cos^2v)dif x\
		&quad subst(u=(x+sin x)/2,v=(x-sin x)/2)\
		&integral (cos^2u cos^2v+sin^2u sin^2v-2sin u sin v cos u cos v+cos u cos v+sin u sin v)/(cos^2v)/((sin^2p)/(cos^2q)+1)dif x\
	$试导可知$
		dif/(dif x)((sin u)/(cos v))=(cos^2u cos^2v+sin^2u sin^2v-2sin u sin v cos u cos v+cos u cos v+sin u sin v)/(2cos^2v)
	$所以$
		integral (cos^2x+cos(sin x))/(1+sin x sin(sin x))dif x=2integral (dif (sin u)/(cos v))/((sin^2u)/(cos^2v)+1)=2arctan (sin (x+sin x)/2)/(cos (x-sin x)/2)+C
	$],
)
