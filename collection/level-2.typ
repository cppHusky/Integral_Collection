#import "@preview/cetz:0.5.2"
#import "../utils.typ":question,comment,subst,Int,ref,multi-eq
#import "../math.typ":*
#question(
	tag:"root(4,x^2)",
	category:red,
	question:$integral root(4,x^2)dif x$,
	answer:$
		integral root(4,x^2)dif x=&integral sqrt(abs(x)) dif x\
		=&sgn(x) integral abs(x)^(1/2)dif abs(x)\
		=&2/3abs(x)^(3/2) sgn x+C\
		=&2/3x sqrt(abs(x))+C
	$,
)
#comment[
	开偶次根式要考虑是否带绝对值的问题，这一点在应试中不容忽视。不过，倘若把结果放在复数域中看，这样的担忧就多余了。本书对此不多做介绍，仍以给出实数域下的结果为标准。#parbreak()
	含绝对值的积分可以通过符号函数变换来添加或消去绝对值符号，以统一变量；而且符号函数$sgn$又可以视为常数提到积分号外，从而免去分类讨论的麻烦。
]
#question(
	tag:"sqrt(1-sin2x)",
	category:red,
	question:$integral sqrt(1-sin 2x)dif x$,
	answer:$
		integral sqrt(1-sin 2x)dif x=&integral sqrt(sin^2x+cos^2x-2sin x cos x)dif x\
		=&integral sqrt((sin x+cos x)^2)dif x\
		=&integral abs(cos x-sin x)dif x\
		=&sgn(cos x-sin x)integral(cos x-sin x)dif x\
		=&(sin x+cos x)sgn(cos x-sin x)+C
	$,
)
#comment[
	$1=sin^2x+cos^2x$和$sin 2x=2sin x cos x$都是十分常见的三角恒等变换，善用这些恒等变换可以助你简化问题。@常用恒等变换 为读者提供了诸多不定积分问题中常见的恒等变换，以供参考。
]
#question(
	tag:"x^n/(x+1)",
	question:$integral x^n/(x+1)dif x space (n in NN_+)$,
	answer:$
		integral x^n/(x+1)dif x=&integral [(x+1)-1]^n/(x+1)dif(x+1)\
		=&integral [sum_(k=0)^n binom(n,k)(x+1)^(n-k)(-1)^k]/(x+1)dif(x+1)\
		=&integral [sum_(k=0)^n binom(n,k)(x+1)^(n-k-1)(-1)^k]dif(x+1)\
		=&sum_(k=0)^n [binom(n,k)(-1)^k integral (x+1)^(n-k-1)dif(x+1)]\
		=&sum_(k=0)^(n-1) binom(n,k)((-1)^k (x+1)^(n-k))/(n-k)+(-1)^n log abs(x+1)+C
	$,
)
#comment[
	这里的思路是将分母的$x+1$视为一个“整体”。读者愿意的话，也可以使用换元$subst(u=x+1)$代替它，这样一来分母就变成单项式$u$。#parbreak()
	将分母转换为单项式，是解决许多积分问题的有效方向。如果分母是单项式，分子就可以进行各种分项，且分项后的各项分子往往可以与分母约分，这样就能简化问题。
]
#question(
	tag:"1/(e^x+1)",
	category:blue,
	question:$integral (dif x)/(ee^x+1)$,
	answer:[$
		integral (dif x)/(ee^x+1)=integral (ee^x dif x)/(ee^x (ee^x+1))=integral (dif ee^x)/(ee^x (ee^x+1))
	$令$subst(u=ee^x)$，所以$
		integral (dif ee^x)/(ee^x (ee^x+1))=&integral (dif u)/(u(u+1))\
		=&integral (dif u)/u-integral (dif(u+1))/(u+1)\
		=&log u-log(u+1)+C\
		=&x-log(ee^x+1)+C
	$],
)
#comment[
	如果被积函数是仅由$ee^x$构成的有理函数，那么只要凑微分$dif x=(dif ee^x)/(ee^x)$再换元$subst(u=ee^x)$即可将这个积分转化为关于$u$的有理函数积分。这种操作就是有理化。#parbreak()
	本题还有另外一种更方便的换元方法，是凑$subst(v=ee^(-x))$，读者可以自行尝试，并证明它与本题的答案等价。
]
#question(
	tag:"(3x+2)/(x^2+2x+10)",
	category:red,
	question:$integral (3x+2)/(x^2+2x+10)dif x$,
	answer:[$
		integral (3x+2)/(x^2+2x+10)dif x=3Int(#1,integral (x+1)/(x^2+2x+10)dif x)-Int(#2,integral (dif x)/(x^2+2x+10))
	$分别解这两个积分，得到#multi-eq[$
		Int(#1)=Int(#1,integral (x+1)/(x^2+2x+10) dif x)=&1/2integral (2x+2)/(x^2+2x+10) dif x\
		=&1/2integral (dif(x^2+2x+10))/(x^2+2x+10)\
		=&1/2log(x^2+2x+10)+C_1$$
		Int(#2),Int(#2,integral (dif x)/(x^2+2x+10))=&integral (dif(x+1))/((x+1)^2+9)\
		=&1/3arctan (x+1)/3+C_2
	$]所以原积分可表示为$
		3Int(#1)-Int(#2)=3/2log(x^2+2x+10)-1/3arctan (x+1)/3+C
	$],
)
#comment[
	在遇到分母二次多项式$Delta<0$且分子为一次多项式的问题时，最佳做法是将这个积分分项成两个积分，其中一个（$I_1$）的分子是分母的导数，可以直接凑微分求解；另一个（$I_2$）的分子只含常数，可以仿照#ref("1/(x^2+2x+2)")的思路求解。#parbreak()
	但当分母二次多项式$Delta>0$时则没有必要如此舍近求远，可以像#ref("(2x+3)/(x^2+3x-10)")一样直接裂项解决。
]
#question(
	tag:"(2x+3)/(x^2+3x-10)",
	category:red,
	question:$integral (2x+3)/(x^2+3x-10) dif x$,
	answer:[设$(2x+3)/(x^2+3x-10)=A/(x+5)+B/(x-2)$，从而$
		2x+3=(A+B)x+(-2A+5B)
	$解得 $A=1,B=1$，所以 $
		integral (2x+3)/(x^2+3x-10) dif x=integral (dif x)/(x+5)+integral (dif x)/(x-2)=log abs(x+5)+log abs(x-2)+C
	$],
)
#comment[
	本题分母二次多项式$Delta>0$，说明分母可以进行因式分解。而在裂项时，我们无需纠结分子是常数还是一次多项式，因为$(A+B)x+(-2A+5B)$已经能够涵盖这两种不同情况了。
]
#question(
	tag:"1/(x(x^2+1))",
	category:red,
	question:$integral (dif x)/(x(x^2+1))$,
	answer:[设$1/(x(x^2+1))=A/x+(B x+D)/(x^2+1)$，从而$
		1=(A+B)x^2+D x+A
	$解得$A=1,B=-1,D=0$，所以$
		integral (dif x)/(x(x^2+1))=&integral (dif x)/x-integral (x dif x)/(x^2+1)\
		=&log abs(x)-1/2integral (dif x^2)/(x^2+1)\
		=&log abs(x)-1/2log(x^2+1)+C
	$],
)
#comment[
	像这样，裂项后分母为二次因式（$x^2+1$）的，应当在分子上设含有两个系数的一次多项式（$B x+D$）；如果只设常数项的话，待定系数就无解了，读者可以自行尝试。#parbreak()
	本题还有一个稍有技巧性的做法，就是分子分母同乘$x$凑微分$dif x^2$，再裂项，可以参考#ref("1/(x(x^5+1)^3)")的解法。
]
#question(
	tag:"1/(x(x+1)^2)",
	category:red,
	question:$integral (dif x)/(x(x+1)^2)$,
	answer:[设$1/(x(x+1)^2)=A/x+B/(x+1)+D/(x+1)^2$，从而$
		1=(A+B)x^2+(2A+B+D)x+A
	$解得$A=1,B=-1,D=-1$，所以$
		integral (dif x)/(x(x+1)^2)=&integral (dif x)/x-integral (dif x)/(x+1)-integral (dif x)/(x+1)^2\
		=&log abs(x)-log abs(x+1)+1/(x+1)+C
	$],
)
#comment[
	像这样，被积函数的分母有一次重因式的，有几重因式就可以分成几个次数互异的项，这些项的分母分别为这个因式的一次、二次、三次，诸如此类。
]
#question(
	tag:"1/(x^3(x+1))",
	category:red,
	question:$integral (dif x)/(x^3(x+1))$,
	answer:[令$x=1/t$，则$
		integral (dif x)/(x^3(x+1))=&integral t^3/(1+1/t)dif 1/t\
		=&integral (-t^2)/(t+1)dif t\
		=&integral (-t^2-t+t+1-1)/(t+1)dif t\
		=&integral (-t+1-1/(t+1))dif t\
		=&-1/2t^2+t-log abs(t+1)+C\
		=&-1/2x^2+1/x-log abs((x+1)/x)+C
	$],
)
#comment[
	这是典型的倒代换方法，当分母中出现一个一次多重因式，且次数明显高于其它因式时，可以用倒代换将分母上的多重因式变换到分子上，从而降低运算量。#parbreak()
	在有理函数积分中，出现在分子上的东西往往要比出现在分母上的东西更容易处理，因为分子可以进行加减拼凑，运用分项方法解决问题，但分母无法随意变动。
]
#question(
	tag:"1/(x^3(x+1))~",
	category:red,
	question:$integral (dif x)/(x^3(x+1))$,
	answer:$
		integral (dif x)/(x^3(x+1))=&integral (1+x-x)/(x^3(x+1))dif x\
		=&integral (dif x)/x^3-integral (dif x)/(x^2(x+1))\
		=&-1/(2x^2)-integral (1+x-x)/(x^2(x+1))dif x\
		=&-1/(2x^2)-integral (dif x)/x^2+integral (dif x)/(x(x+1))\
		=&-1/(2x^2)+1/x+integral (dif x)/x-integral (dif x)/(x+1)\
		=&-1/(2x^2)+1/x+log abs(x/(x+1))+C
	$,
)
#comment[
	本题的思路与#ref("1/(sin^2xcos^2x)")相似，通过恒等变换将分子拆成多项，再分项积分，这样就能达到分子分母相互约分，从而简化积分的目的。
]
#question(
	tag:"1/(x^4-1)",
	category:red,
	question:$integral (dif x)/(x^4-1)$,
	answer:[设$1/(x^4-1)=A/(x-1)+B/(x+1)+(D x+E)/(x^2+1)$，从而$
		1=(A+B+D)x^3+(A-B+E)x^2+(A+B-D)x+(A-B-E)
	$解得$A=1/4,B=-1/4,D=0,E=-1/2$，所以$
		integral (dif x)/(x^4-1)=1/4integral (dif x)/(x-1)-1/4integral (dif x)/(x+1)-1/2integral (dif x)/(x^2+1)=1/4log abs((x-1)/(x+1))-1/2arctan x+C
	$],
)
#comment[
	这个被积函数的分母是四次多项式，但也很容易进行因式分解，只需两次利用平方差公式，先将$x^4-1$分解成$(x^2-1)(x^2+1)$，再将$x^2-1$分解成$(x-1)(x+1)$即可。#parbreak()
	因式分解的思路通常有两种：一是像本题这样利用现有公式，诸如平方差公式和#ref("1/(x^3+1)")#ref("1/(x^3-1)")用到的立方和/立方差公式；二是试根，逐步“猜”出所有的根，然后完成因式分解，可以参考。
]
#question(
	tag:"x^2/((x+1)^2(x^2+1))",
	category:red,
	question:$integral x^2/((x+1)^2(x^2+1))dif x$,
	answer:[设$x^2/((x+1)^2(x^2+1))=A/(x+1)+B/(x+1)^2+(D x+E)/(x^2+1)$，从而$
		x^2=(A+D)x^3+(A+B+2D+E)x^2+(A+D+2E)x+(A+B+E)
	$解得$A=-1/2,B=D=1/2,E=0$,所以$
		integral x^2/((x+1)^2(x^2+1))dif x=&-1/2integral (dif x)/(x+1)+1/2integral (dif x)/(x+1)^2+1/2integral (x dif x)/(x^2+1)\
		=&-1/2log abs(x+1)-1/(2(x+1))+1/4integral dif(x^2+1)/(x^2+1)\
		=&-1/2log abs(x+1)-1/(2x+2)+1/4log(x^2+1)+C
	$],
)
#question(
	tag:"cos^2x/sinx",
	category:red,
	question:$integral (cos^2x)/(sin x)dif x$,
	answer:$
		integral (cos^2x)/(sin x)dif x=&integral (cos^2x sin x)/(sin^2x)dif x\
		=&integral (cos^2x-1+1)/(cos^2x-1)dif cos x\
		=&integral dif cos x+1/2integral dif(cos x)/(cos x-1)-1/2integral dif(cos x)/(cos x+1)\
		=&cos x+1/2log abs((cos x-1)/(cos x+1))+C
	$,
)
#question(
	tag:"1/(sin^2x+sinxcosx+cos^2x)",
	category:red,
	question:$integral (dif x)/(sin^2x+sin x cos x+cos^2x)$,
	answer:$
		integral (dif x)/(sin^2x+sin x cos x+cos^2x)=&integral (sec^2x dif x)/(tan^2x+tan x+1)\
		=&integral dif(tan x)/((tan x+1/2)^2+3/4)\
		=&integral (dif u)/(u^2+3/4) quad subst(u=tan x+1/2)\
		=&2/sqrt(3)arctan (2u)/sqrt(3)+C\
		=&2/sqrt(3)arctan (2tan x+1)/sqrt(3)+C
	$,
)
#comment[
	这两题分别对应三角函数积分有理化问题中的两类特殊情形：#parbreak()
	情形一：倘若被积函数是关于$sin x$的奇函数（$sin x$变成$-sin x$时整个函数变为相反数），那么就凑微分$dif cos x$并将$dif$以外的部分化成关于$cos x$的有理函数，换元$subst(u=cos x)$进行有理化；同理，倘若被积函数是关于$cos x$的奇函数，那么就凑微分$dif sin x$并将$dif$以外的部分化成关于$sin x$的有理函数，换元$subst(u=sin x)$进行有理化。#parbreak()
	情形二：倘若被积函数中的$sin x,cos x$分别换作$-sin x,-cos x$后仍然保持不变，那么就凑微分$dif tan x$并将$dif$以外的部分化成关于$tan x$的有理函数，换元$subst(u=tan x)$进行有理化。#parbreak()
	#ref("1/(2-sinx)~")的做法对这两种特殊情形都有所体现，读者可以参考。
]
#question(
	tag:"1/(a^2sin^2x+b^2cos^2x)",
	category:red,
	question:$integral (dif x)/(a^2sin^2x+b^2cos^2x)space(a,b!=0)$,
	answer:[当$a^2=b^2$时，$
		integral (dif x)/(a^2sin^2x+b^2cos^2x)=integral (dif x)/a^2=x/a^2+C
	$当$a^2!=b^2$时，$
		integral (dif x)/(a^2sin^2x+b^2cos^2x)=1/a^2integral (dif tan x)/(tan^2x+b^2/a^2)=1/abs(a b)arctan(abs(a/b)tan x)+C
	$综上所述，得到$
		integral (dif x)/(a^2sin^2x+b^2cos^2x)=cases(
			x/a^2+C\,&a^2=b^2,
			1/abs(a b)arctan(abs(a/b)tan x)+C\,&a^2!=b^2
		)
	$],
)
#comment[
	这是前述的特殊情形二。另外，在含参数的积分问题中，解题时还需要考虑参数的取值状况，以免遗漏一些特殊情况。
]
#question(
	tag:"x^2cosx",
	category:red,
	question:$integral x^2cos x dif x$,
	answer:$
		integral x^2cos x dif x=&integral x^2 dif sin x\
		=&x^2sin x-integral sin x dif x^2\
		=&x^2sin x-2integral x sin x dif x\
		=&x^2sin x+2integral x dif cos x\
		=&x^2sin x+2x cos x-2integral cos x dif x\
		=&x^2sin x+2x cos x-2sin x+C
	$,
)
#comment[
	合理利用分部积分法，可以实现去幂的作用。#parbreak()
	三角函数凑入微分项不会使积分的形式变复杂，而分部操作之后对幂函数求导又能降低幂函数的次数，这样就将积分$integral x^2 cos x dif x$转化成了积分$integral x sin x dif x$。再分部一次就能转化成积分$integral cos x dif x$，然后套用基本积分表就可以解决了。
]
#question(
	tag:"(log^2x)/x^2",
	category:red,
	question:$integral (log^2x)/x^2dif x$,
	answer:$
		integral (log^2x)/x^2dif x=&-integral log^2x dif 1/x\
		=&-(log^2x)/x+integral (dif log^2x)/x\
		=&-(log^2x)/x+2integral (log x)/x^2dif x\
		=&-(log^2x)/x-2integral log x dif 1/x\
		=&-(log^2x)/x-2 (log x)/x+2integral (dif log x)/x\
		=&-(log^2x)/x-2 (log x)/x+2integral (dif x)/x^2\
		=&-(log^2x)/x-2(log x)/x-2/x+C
	$,
)
#comment[
	合理利用分部积分法，可以实现去幂和消分母的作用。#parbreak()
	像$1/x^2$这样的因式，它们可以直接凑入$dif$中，从而使$dif$外部的分母消掉，留下$log^2x$这样的式子；同时，经过分部积分后，对数因式的次数也将通过求导而降低。于是积分$integral (log^2x)/x^2 dif x$转化成了$integral (log x)/x^2 dif x$，又转化成了$integral 1/x^2 dif x$，接下来只要套用基本积分表就可以了。
]
#question(
	tag:"cos sqrt(x)",
	category:red,
	question:$integral cos sqrt(x)dif x$,
	answer:[令$subst(u=sqrt(x))$，则$subst(x=u^2)$，所以$
		integral cos sqrt(x)dif x=&integral cos u dif u^2\
		=&2integral u cos u dif u\
		=&2integral u dif sin u\
		=&2u sin u-2integral sin u dif u\
		=&2u sin u+2cos u+C\
		=&2sqrt(x)sin sqrt(x)+2cos sqrt(x)+C
	$],
)
#comment[
	本题的主要难点在于复合函数$cos sqrt(x)$，而换元$u=sqrt(x)$将原积分化为$integral u cos u dif u$就可以仿照#ref("x^2cosx")解开本题了。
]
#question(
	tag:"(xe^x)/(x+1)^2",
	category:red,
	question:$integral (x ee^x)/(x+1)^2dif x$,
	answer:$
		integral (x ee^x)/(x+1)^2dif x=&-integral x ee^x dif 1/(x+1)\
		=&-(x ee^x)/(x+1)+integral dif(x ee^x)/(x+1)\
		=&-(x ee^x)/(x+1)+integral (ee^x (x+1))/(x+1)dif x\
		=&-(x ee^x)/(x+1)+integral ee^x dif x\
		=&-(x ee^x)/(x+1)+ee^x+C\
		=&ee^x/(x+1)+C
	$,
)
#comment[
	本题与#ref("x^2cosx")的思路不同，直接用$ee^x$凑微分再分部对$x/(x+1)^2$求导是行不通的，会使问题复杂化；相反，借鉴#ref("(log^2x)/x^2")的思路消分母，可以实现对原问题的简化。#parbreak()
	分部积分的可能性很多，复杂问题尤其如此。那么何时使用何种套路才能成功达到目的呢？很遗憾，这种“方向”虽然存在一定的规律，但很多时候必须多加摸索才能柳暗花明。笔者也鼓励读者在解题时大胆尝试，相信读者在积累了一定经验后，应对这些积分问题可以更加游刃有余。
]
#question(
	tag:"e^xsinax",
	category:red,
	question:$integral ee^x sin a x dif x space (a!=0)$,
	answer:[$
		Int(integral ee^x sin a x dif x)=&integral sin a x dif ee^x\
		=&ee^x sin a x-a integral ee^x cos a x dif x\
		=&ee^x sin a x-a integral cos a x dif ee^x\
		=&ee^x sin a x-a ee^x cos a x+a integral ee^x dif cos a x\
		=&ee^x sin a x-a ee^x cos a x-a^2Int(integral ee^x sin a x dif x)
	$对该式移项得$
		(a^2+1)Int(integral ee^x sin a x dif x)=&ee^x sin a x-a ee^x cos a x+C\
		Int(integral ee^x sin a x dif x)=&ee^x (sin a x-a cos a x)/(a^2+1)+C_1
	$],
)
#comment[
	合理利用分部积分法，可以实现循环的作用。原积分在历经两次分部积分后，产生了与原积分一致的积分项，而这二者之间只有系数是不同的。那么，通过移项的方泝可以将原积分置于等号一侧，而其它项置于等号另一侧，因此原积分就可以由其它项表达出来。#parbreak()
	顺便一提，解出的结果需要补任意常数项$+C$，否则就不严谨了。
]
#question(
	tag:"sinxsinpix",
	category:red,
	question:$integral sin x sin pi x dif x$,
	answer:[$
		Int(integral sin x sin pi x dif x)=&-integral sin pi x dif cos x\
		=&-cos x sin pi x+pi integral cos x cos pi x dif x\
		=&-cos x sin pi x+pi integral cos pi x dif sin x\
		=&-cos x sin pi y+pi sin x cos pi x+pi^2Int(integral sin x sin pi x dif x)\
	$对该式移项得$
		(pi^2-1)Int(integral sin x sin pi x dif x)=&cos x sin pi x-pi sin x cos pi x+C\
		Int(integral sin x sin pi x dif x)=&(cos x sin pi x-pi sin x cos pi x)/(pi^2-1)+C_1\
	$],
)
#comment[
	本题与#ref("cosxcos(x+a)")是同类题目，只是解法不同。因为正余弦函数和指数函数都有“求导和凑微分不改变函数复杂程度”之特点，所以利用分部积分法的循环作用可以求解此类问题。
]
#question(
	tag:"1/sqrt(x^2+1)",
	category:red,
	question:$integral (dif x)/sqrt(x^2+1)$,
	answer:[令$subst(x=tan t\,space t in (-pi/2,pi/2))$，则$
		integral (dif x)/sqrt(x^2+1)=integral (dif tan t)/(sec t)=integral sec t dif t=log(sec t+tan t)+C=log(sqrt(x^2+1)+x)+C
	$],
)
#comment[
	三角换元是解决含二次根式积分的重要方法。一般来说，根式$sqrt(a^2-x^2)$需要使用$subst(x=a sin t)$换元，根式$sqrt(x^2+a^2)$需要使用$subst(x=a tan t)$换元，而根式$sqrt(x^2-a^2)$需要使用$subst(x=a sec t)$换元。#parbreak()
	三角换元时尤其需要注意确定参数$t$的定义域，以避免开二次根号时遭遇各种不必要的麻烦（如开方后带着绝对值符号）。笔者的建议是：对于$sin t$类换元限制$t in[-pi/2,pi/2]$；对于$tan t$类换元，限制$t in (-pi/2,pi/2)$，对于$sec t$类换元，限制$t in [0,pi/2)union(pi/2,pi)$。当然实际问题可能存在更多限制，需要具体问题具体分析。#parbreak()
	这样换元之后，对于前两种情形，开根式已经不需要带绝对值了；而第三种情形下依然要带绝对值作分类讨论，请读者以#ref("1/sqrt(x^2-4)")为例自行尝试。
]
#question(
	tag:"1/sqrt(x^2-4)",
	category:blue,
	question:$integral 1/sqrt(x^2-4)$,
	answer:[当$x>2$时，令$subst(x=2cosh t\,t in(0,+infinity))$，则$subst(sqrt(x^2-4)=2sinh t)$，所以$
		integral (dif x)/sqrt(x^2-4)=integral dif(2cosh t)/(2sinh t)=integral dif t=arcosh x/2+C=log abs(x+sqrt(x^2-4))+C_1
	$当$x<-2$时，令$subst(x=-2cosh t\,t in(0,+infinity))$，则$subst(sqrt(x^2-4)=2sinh t)$，所以$
	integral (dif x)/sqrt(x^2-4)=-integral dif(2cosh t)/(2sinh t)=-t+C=-arcosh(-x/2)+C=log abs(x+sqrt(x^2-4))+C_2
	$综上所述，得到$
		integral (dif x)/sqrt(x^2-4)=log abs(x+sqrt(x^2-4))+C
	$],
)
#comment[
	相较于三角换元，双曲换元是一种不常用的方法，主要用于处理形如$sqrt(x^2plus.minus a^2)$的积分问题。一般来说，根式$sqrt(x^2+a^2)$需要使用$subst(x=a sinh t)$换元，并限制$t in RR$，开根号无需带绝对值。#parbreak()
	而根式$sqrt(x^2-a^2)$有所不同，在使用$subst(x=plus.minus a cosh t)$换元时，需要对$x$分区间以决定正负号。
]
#question(
	tag:"(logx)/(x^2-1)^(3/2)",
	category:red,
	question:$integral (log x)/(x^2-1)^(3/2)dif x$,
	answer:[令$subst(x=sec t\,t in(0,pi/2))$，则$subst(sqrt(x^2-1)=tan x)$，所以$
		integral (log x)/sqrt(x^2-1)^3dif x=&integral (log sec t dif sec t)/(tan^3t)\
		=&integral (cos t log sec t)/(sin^2t)dif t\
		=&integral (log sec t)/(sin^2t)dif sin t\
		=&-integral log sec t dif 1/(sin t)\
		=&-(log sec t)/(sin t)+integral (dif log sec t)/(sin t)\
		=&-(log sec t)/(sin t)+integral sec t dif t\
		=&-(log sec t)/(sin t)+log(sec t+tan t)+C
	$画辅助三角形#align(center,cetz.canvas(x:1cm,y:1cm,{
		import cetz.draw:*
		line((0,0),(2,0),(2,1.5),close:true,name:"triangle")
		content(
			("triangle.0",50%,"triangle.2"),
			anchor:"north",
			padding:.1,
			$1$,
		)
		content(
			("triangle.2",50%,"triangle.3.5"),
			anchor:"west",
			padding:.1,
			$sqrt(x^2-1)$,
		)
		content(
			("triangle.3.5",50%,"triangle.8.5"),
			anchor:"south-east",
			padding:.1,
			$x$,
		)
		arc((.6,0),radius:.6,start:0deg,stop:calc.atan(.75),name:"arc")
		content(
			("arc.start",80%,"arc.end"),
			anchor:"west",
			padding:.2,
			$t$,
		)
	}))所以得到$
		-(log sec t)/(sin t)+log(sec t+tan t)+C=-(x log x)/sqrt(x^2-1)+log(x+sqrt(x^2-1))+C
	$],
)
#comment[
	这里换元时不再需要对$x$的取值作分类讨论了，因为$log x$和$sqrt(x^2-1)$共同限制了这个函数的定义域$x in(1,+infinity)$。#parbreak()
	另外，本题更简洁的做法是不用换元，直接套用$(dif x)/sqrt(x^2-1)^3=-dif x/sqrt(x^2-1)$（这是阿贝尔换元的基本操作，可参考#ref("1/(ax^n+b)^((n+1)/n)")），但对于不熟悉这个公式的读者而言，使用三角换元消根式更截了当。
]
#question(
	tag:"x^2sqrt(x+1)",
	category:red,
	question:$integral x^2sqrt(x+1)dif x$,
	answer:[令$subst(x=t^2-1\,t in [0,+infinity))$，则$subst(sqrt(x+1)=t)$，所以$
		integral x^2sqrt(x+1)dif x=&integral (t^2-1)^2t dif(t^2-1)\
		=&2integral (t^6-2t^4+t^2)dif t\
		=&2/7t^7-4/5t^5+2/3t^3+C\
		=&2/7sqrt(x+1)^7-4/5sqrt(x+1)^5+2/3sqrt(x+1)^3+C
	$],
)
#comment[
	在处理这类含$root(n,a x+b)$的积分时，可以令$subst(t=root(n,a x+b))$，然后解出$x$关于$t$的函数表达式，就可以换元实现有理化。#parbreak()
	另一方面，这题也可以视为切比雪夫定理的一种情形，关于切比雪夫定理的内容可以参考。
]
#question(
	tag:"1/(sqrt(x)+root(3,x))",
	category:red,
	question:$integral (dif x)/(sqrt(x)+root(3,x))$,
	answer:[令$subst(x=t^6\,t in(0,+infinity))$，则$ 
		integral (dif x)/(sqrt x+root(3,x))=&integral (dif t^6)/(t^3+t^2)\
		=&6integral t^3/(t+1)dif t\
		=&6integral (t^3+t^2-t^2-t+t+1-1)/(t+1)dif t\
		=&6integral (t^2-t+1-1/(t+1))dif t\
		=&2t^3-3t^2+6t-6log abs(t+1)+C\
		=&2sqrt(x)-3root(3,x)+6root(6,x)-6log abs(root(6,x)+1)+C
	$],
)
#comment[
	第二类换元法的通常目的是通过换元，将被积函数变为有理函数或三角（双曲）有理函数等形式，因为三角（双曲）有理函数的积分都是可解的。#parbreak()
	以上题目中，#ref("1/sqrt(x^2+1)")和#ref("(logx)/(x^2-1)^(3/2)")使用了三角换元，#ref("1/sqrt(x^2-4)")使用了双曲换元，#ref("x^2sqrt(x+1)")和#ref("1/(sqrt(x)+root(3,x))")使用了幂函数换元。其中#ref("1/(sqrt(x)+root(3,x))")令$subst(x=t^6)$可以一次性消去两个根号实现有理化。
]
#question(
	tag:"1/(2-sinx)",
	question:$integral (dif x)/(2-sin x)$,
	answer:$
		integral (dif x)/(2-sin x)=&1/2integral (dif x)/(cos^2x/2+sin^2x/2-sin x/2cos x/2)\
		=&integral (sec^2x/2)/(sec^2x/2(sin^2x/2-sin x/2cos x/2+cos^2x/2))dif x/2\
		=&integral (dif tan x/2)/(tan^2x/2-tan x/2+1)\
		=&integral (dif t)/(t^2-t+1) quad subst(t=tan x/2)\
		=&integral dif(t-1/2)/((t-1/2)^2+(sqrt(3)/2)^2)\
		=&2/sqrt(3)arctan (2t-1)/sqrt(3)+C\
		=&2/sqrt(3)arctan (2tan x/2-1)/sqrt(3)+C
	$,
)
#question(
	tag:"1/(2-sinx)~",
	question:$integral (dif x)/(2-sin x)$,
	answer:[$
		integral (dif x)/(2-sin x)=integral (2+sin x)/(4-sin^2x)dif x=2integral (dif x)/(4-sin^2x)+integral (sin x dif x)/(4-sin^2x)
	$分别解这两个积分，得#multi-eq[$
		I_1=integral (dif x)/(4-sin^2x)=&integral (sec^2x dif x)/(4sec^2x-tan^2x)\
		=&integral (dif tan x)/(4+3tan^2x)\
		=&1/3integral (dif tan x)/(tan^2x+(2/sqrt(3))^2)\
		=&1/(2sqrt(3))arctan (sqrt(3)tan x)/2+C_1$$
		I_2=integral (sin x dif x)/(4-sin^2x)=&-integral (dif cos x)/(3+cos^2x)\
		=&-1/sqrt(3)arctan (cos x)/sqrt(3)+C_2
	$]所以原积分可表示为$
		2I_1+I_2=1/sqrt(3)arctan (sqrt(3)tan x)/2-1/sqrt(3)arctan (cos x)/sqrt(3)+C
	$],
)
#comment[
	这道题目提供了两种可行的做法：#ref("1/(2-sinx)")使用万能公式（本质是三倍角公式），#ref("1/(2-sinx)~")使用平方差分项。就本题而言，这两种做法的计算量相差无几。#parbreak()
	万能公式是通用方法，能将任何三角有理式积分转化为有理函数积分，但计算效率较低，稍复杂的被积函数就可能带来非常大的计算量。#parbreak()
	平方差分项的适用范围不如万能公式广泛，它的思路在于，平方差公式处理后的分母都为二次正/余弦函数和常数项，容易通过恒等式$sin^2x+cos^2x=1$在三者之间进行转化。如果分子是常数，就可以凑$dif tan x$做；如果分子是一次三角函数，就凑$dif sin x$或$dif cos x$。这两种情况在#ref("1/(2-sinx)~")的做法中都有所体现。
]
#question(
	tag:"1/(sinx+2cosx)",
	category:red,
	question:$integral (dif x)/(sin x+2cos x)$,
	answer:$
		integral (dif x)/(sin x+2cos x)=&integral (dif x)/(sqrt(5)sin(x+arctan 2))\
		=&1/sqrt(5)integral csc(x+arctan 2)dif(x+arctan 2)\
		=&1/sqrt(5)log abs(tan (x+arctan 2)/2)+C
	$,
)
#question(
	tag:"1/(sinx+2cosx)~",
	category:red,
	question:$integral (dif x)/(sin x+2cos x)$,
	answer:$
		integral (dif x)/(sin x+2cos x)=&integral (dif x)/(2sin^2x/2cos x/2+2cos^2x/2-2sin^2x/2)\
		=&integral (sec^2x/2)/(-tan^2x/2+tan x/2+1)dif x/2\
		=&integral (dif tan x/2)/(-tan^2x/2+tan x/2+1)\
		=&integral (dif t)/(-t^2+t+1) quad subst(t=tan x/2)\
		=&integral (dif t)/((sqrt(5)/2)^2-(t-1/2)^2)\
		=&1/sqrt(5)integral (dif t)/(t-1/2+sqrt(5)/2)-1/sqrt(5)integral (dif t)/(t-1/2-sqrt(5)/2)\
		=&1/sqrt(5)log abs((t-1/2+sqrt(5)/2)/(t-1/2-sqrt(5)/2))+C\
		=&1/sqrt(5)log abs((2tan x/2-1+sqrt(5))/(2tan x/2-1-sqrt(5)))+C
	$,
)
#question(
	tag:"1/(sinx+2cosx)~~",
	category:red,
	question:$integral (dif x)/(sin x+2cos x)$,
	answer:[$
		integral (dif x)/(sin x+2cos x)=integral (2cos x-sin x)/(4cos^2x-sin^2x)dif x=2Int(#1,integral (cos x dif x)/(4 cos^2x-sin^2x))-Int(#2,integral (sin x dif x)/(4cos^2x-sin^2x))
	$分别解这两个积分，得#multi-eq[$
		Int(#1)=Int(#1,integral (cos x dif x)/(4cos^2x-sin^2x))=&integral (dif sin x)/(4-5sin^2x)\
		=&integral (dif sin x)/((2-sqrt(5)sin x)(2+sqrt(5)sin x))\
		=&1/4integral (dif sin x)/(2-sqrt(5)sin x)+1/4integral (dif sin x)/(2+sqrt(5)sin x)\
		=&1/(4sqrt(5))log abs((2+sqrt(5)sin x)/(2-sqrt(5)sin x))+C_1$$
		Int(#2)=Int(#2,integral (sin x dif x)/(4cos^2x-sin^2x))=&-integral (dif cos x)/(5 cos^2x-1)\
		=&integral (dif cos x)/((1-sqrt(5)cos x)(1+sqrt(5)cos x))\
		=&1/2integral (dif cos x)/(1-sqrt(5)cos x)+1/2integral (dif cos x)/(1+sqrt(5)cos x)\
		=&1/(2sqrt(5))log abs((1+sqrt(5)cos x)/(1-sqrt(5)cos x))+C_2
	$]所以原积分可表示为$
		2Int(#1)-Int(#2)=1/(2sqrt(5))log abs((2+sqrt(5)sin x)/(2-sqrt(5)sin x))-2/(2sqrt(5))log abs((1+sqrt(5)cos x)/(1-sqrt(5)cos x))+C
	$],
)
#comment[
	本题做法很多。#ref("1/(sinx+2cosx)")运用辅助角公式可以将分母化为单项式求解；#ref("1/(sinx+2cosx)~")仍然使用万能公式，#ref("1/(sinx+2cosx)~~")则使用平方差分项。相比之下，显然辅助角公式是最快的。#parbreak()
	本题另外还有一种做法，见#ref("1/(sinx+2cosx)~~~")。
]
#question(
	tag:"cot^2xtan((1+xtanx)/tanx)",
	category:blue,
	question:$integral cot^2 x tan (1+x tan x)/(tan x) dif x$,
	answer:$
		integral cot^2 x tan (1+x tan x)/(tan x) dif x=&integral(csc^2 x-1)tan(cot x+x) dif x\
		=&-integral tan(cot x+x) dif(cot x+x)\
		=&log abs(cos(x+cot x))+C
	$,
)
#comment[
	这题的难点在于$tan (1+x tan x)/(tan x)$。要处理这个复合函数，一方面要尽量想办法将其化简，另一方面应当尽可能从其它部分挖掘出能凑微分成$u=(1+x tan x)/(tan x)$的部分。
]
#question(
	tag:"sqrt(x+2+sqrt((x+1)(x+3)))",
	question:$integral sqrt(x+2+sqrt((x+1)(x+3)))dif x$,
	answer:$
		integral sqrt(x+2+sqrt((x+1)(x+3)))dif x=&1/sqrt(2)integral sqrt(2x+4+2sqrt((x+1)(x+3)))dif x\
		=&1/sqrt(2)integral sqrt((x+1)+(x+3)+2sqrt(x+1)sqrt(x+3))dif x\
		=&1/sqrt(2)integral sqrt(sqrt(x+1)^2+sqrt(x+3)^2+2sqrt(x+1)sqrt(x+3))dif x\
		=&1/sqrt(2)integral sqrt((sqrt(x+1)+sqrt(x+3))^2)dif x\
		=&1/sqrt(2)integral (sqrt(x+1)+sqrt(x+3))dif x\
		=&sqrt(2)/3(x+1)^(3/2)+sqrt(2)/3(x+3)^(3/2)+C
	$,
)
#comment[
	本题体现了观察被积函数结构的重要性。倘若不能注意到凑完全平方式的操作，解题就会变得难以下手。这就需要读者多积累经验。#parbreak()
	还需注意一点，在这里可以求出被积函数的定义域为$[-1,+infinity)$，所以$x+1=sqrt(x+1)^2,sqrt((x+1)(x+3))=sqrt(x+1)sqrt(x+3)$等恒等变换式都是成立的。否则就需要分类讨论等，以防出错。
]
#question(
	tag:"(arcsinxarccosx)/sqrt(1-x^2)",
	question:$integral (arcsin x arccos x)/sqrt(1-x^2)dif x$,
	answer:$
		integral (arcsin x arccos x)/sqrt(1-x^2)dif x=&integral arcsin x arccos x dif arcsin x\
		=&integral arcsin x(pi/2-arcsin x)dif arcsin x\
		=&pi/2integral arcsin x dif arcsin x-integral arcsin^2x dif arcsin x\
		=&pi/4arcsin^2x-1/3arcsin^3x+C
	$,
)
#comment[
	本题涉及到反三角函数的恒等变换，读者可以稍作了解。
]
