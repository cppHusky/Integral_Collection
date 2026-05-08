#import "../utils.typ":question,comment,subst,ref,Int,multi-eq
#import "../math.typ":ee
#question(
	tag:"(x+1)^3",
	category:red,
	question:$integral (x+1)^3 dif x$,
	answer:$
		integral (x+1)^3 dif x=&integral (x^3+3x^2+3x+1) dif x\
		=&integral x^3 dif x+3 integral x^2 dif x+3 integral x dif x+integral dif x\
		=&x^4/4+x^3+3/2 x^2+x+C
	$,
)
#comment[
	将$(x^3+3x^2+3x+1)$这样的多项式分成若干个单项式加和的形式，是很自然的思路。
]
#question(
	tag:"(x+1)^3~",
	category:red,
	question:$integral (x+1)^3 dif x$,
	answer:[令$subst(u=x+1)$，则$subst(x=u-1)$，所以$
		integral (x+1)^3 dif x=integral u^3 dif (u-1)=integral u^3 dif u=u^4/4+C=(x+1)^4/4+C
	$],
)
#comment[
	读者倘若对#ref("(x+1)^3~")的结果进行二项式展开，就会发现$x^4/4+x^3+3/2x^2+x+1/4+C$和#ref("(x+1)^3")的结果是不同的，它们之间差了一个$1/4$项。#parbreak()
	然而，这两个结果是等价的。因为不定积分的结果都自带任意常数$+C$，所以计算不定积分得到的其实是一组原函数。因而，彼此相差固定常数的结果可以都是正确答案。#parbreak()
	再举个例子，$log x+C$和$log x/2+C$也是等价的，因为$log x/2=log x-log 2$。
]
#question(
	tag:"csc^2(x+1)/2",
	category:red,
	question:$integral csc^2(x+1)/2 dif x$,
	answer:$
		integral csc^2(x+1)/2 dif x=&integral csc^2(x+1)/2 dif (x+1)\
		=&2 integral csc^2(x+1)/2 dif (x+1)/2\
		=&2 integral csc^2 u dif u,quad subst(u=(x+1)/2)\
		=&-2 cot u+C\
		=&-2 cot (x+1)/2+C
	$,
)
#question(
	tag:"xe^(-x^2)",
	category:red,
	question:$integral x ee^(-x^2) dif x$,
	answer:$
		integral x ee^(-x^2) dif x=1/2 integral ee^(-x^2) dif x^2=-1/2 integral ee^(-x^2) dif(-x^2)=-1/2 ee^(-x^2)+C
	$,
)
#comment[
	这两道题目是典型的凑微分问题。凑微分的方法一般会用在包含复合函数的积分问题中，比如#ref("xe^(-x^2)")当中的$ee^(-x^2)$就是一个典型的复合函数。换元的好处是把无关紧要的被复合部分抽象为一个简单的记号（$u, v$或者别的），从而减少不必要的干扰，让我们更好地理解整个被积函数的结构。#parbreak()
	凑微分的思路也通常由复合函数的部分得来。在#ref("csc^2(x+1)/2")中被复合的部分是$(x+1)/2$，那么应当在其它地方都凑出$(x+1)/2$的结构，这样才能把$(x+1)/2$当作整体去参与积分运算。#parbreak()
	同理，#ref("xe^(-x^2)")当中被复合的部分是$-x^2$，那么应当在其它地方都凑出$-x^2$的结构，这样才能把$-x^2$当作整体去参与积分运算。于是凑微分的思路就是$x dif x=1/2 dif x^2=-1/2 dif(-x^2)$。
]
#question(
	tag:"(1+cosx)/(x+sinx)",
	category:red,
	question:$integral (1+cos x)/(x+sin x)dif x$,
	answer:$
		integral (1+cos x)/(x+sin x)dif x
		=integral (dif(x+sin x))/(x+sin x)=log abs(x+sin x)+C
	$,
)
#comment[
	本题要比前面的情况更复杂一些。在这里，我们需要将分子当作一个整体去凑微分，而不是如同#ref("(x+1)^3")那样把分子分成两项。#parbreak()
	在更复杂的问题中，整体凑微分方法也通常与各色恒等变换相互结合（【比如#ref("cot^2xtan((1+xtanx)/tanx)")），形成很难直接识别的结构，往往需要我们多做些尝试才能找到正确的解法。#parbreak()
	对于初学者来说，一眼看出正确的解法很有挑战，但排除些不切实际的方向仍然不难。假如我们把它分项成$integral 1/(x+sin x)dif x+integral (cos x)/(x+sin x)dif x$，那么在第一项中我们构造不出含三角函数$sin x$的微分，在第二项中我们构造不出含多项式$x$的微分。因此，这个方向是不可靠的。
]
#question(
	tag:"sin(x/2)sinx",
	category:red,
	question:$integral sin x/2 sin x dif x$,
	answer:$
		integral sin x/2 sin x dif x=&2integral sin^2x/2 cos x/2 dif x\
		=&4integral sin^2x/2 cos x/2 dif x/2\
		=&4integral sin^2x/2 dif sin x/2\
		=&4/3 sin^3x/2+C
	$,
)
#comment[
	在只涉及三角函数的积分问题中，我们的首要目标是确保各个角度的统一，从而能够使用许多已知的解题方法。本题涉及两种角度：$x/2$和$x$。为了将其统一，使用二倍角函数$sin x=2sin x/2 cos x/2$就可以了。#parbreak()
	统一角度可能用到各种三角恒等变换，比如二倍角公式、半角公式、和角公式、积化和差公式等，它们在@常用恒等变换 中都有列出，可供参考。#parbreak()
	本题使用二倍角公式而不是半角公式，这是因为应用半角公式$sin x/2=plus.minus sqrt((1-cos x)/2)$后，会引入正负号和复合幂函数这些更复杂的结构，把原问题复杂化。相比之下，使用二倍角公式可以很好地避免这些问题。
]
#question(
	tag:"sin^2x",
	category:red,
	question:$integral sin^2x dif x$,
	answer:$
		integral sin^2x dif x=&integral (1-cos 2x)/2 dif x\
		=&1/2integral dif x-integral (cos 2x)/2 dif x\
		=&1/2x-1/4integral cos 2x dif(2x)\
		=&1/2x-1/4sin 2x+C
	$,
)
#question(
	tag:"sin^3x",
	category:red,
	question:$integral sin^3x dif x$,
	answer:$
		integral sin^3x dif x=&-integral sin^2x dif cos x\
		=&integral (cos^2x-1)dif cos x\
		=&integral u^2dif u-integral dif u,quad subst(u=cos x)\
		=&1/3u^3-u+C\
		=&1/3cos^3x-cos x+C
	$,
)
#comment[
	此类$integral sin^n x dif x, integral cos^n x dif x$的问题有一个通用规律。#parbreak()
	如果$n$是偶数，则套用降幂公式$sin^2x=(1-cos 2x)/2, cos^2x=(1+cos 2x)/2$来降低被积函数的幂次；如果降到奇数次幂就可以用下面说的$n$的奇数的方法；如果依然是偶数次幂，还可以继续套用降幂公式。#parbreak()
	如果$n$是奇数，则凑微分成$dif cos x, dif sin x$，这样一来$dif$左边只剩下偶数次的三角函数，可以效仿#ref("sin^3x")，套用$sin^2x+cos^2x=1$在$sin$和$cos$函数间进行转化。
]
#question(
	tag:"1/(x^2+4)",
	category:red,
	question:$integral (dif x)/(x^2+4)$,
	answer:[令$subst(x=2u)$，则$subst(u=x/2)$，所以$
		integral (dif x)/(x^2+4)=integral (dif(2u))/((2u)^2+4)=1/2integral (dif u)/(u^2+1)=1/2arctan u+C=1/2arctan x/2+C
	$],
)
#comment[
	本题当然也可以使用三角换元，也就是$subst(x=2tan t)$，但不如这种做法简洁。
]
#question(
	tag:"x^2/(x^6+1)",
	category:red,
	question:$integral (x^2 dif x)/(x^6+1)$,
	answer:$
		integral (x^2 dif x)/(x^6+1)=1/3integral (dif x^3)/((x^3)^2+1)=1/3arctan x^3+C
	$,
)
#comment[
	很多时候，通过观察被积函数的结构，我们可以找到将其进一步简化的方法。本题就是如此：看似棘手的6次分母在经过我们凑微分（换元成关于$x^3$的积分）后，就转化成了2次分母。
]
#question(
	tag:"1/(x^2+2x+1)",
	category:red,
	question:$integral (dif x)/(x^2+2x+1)$,
	answer:$
		integral (dif x)/(x^2+2x+1)=integral (dif(x+1))/(x+1)^2=-1/(x+1)+C
	$,
)
#question(
	tag:"1/(x^2+2x+2)",
	category:red,
	question:$integral (dif x)/(x^2+2x+2)$,
	answer:$
		integral (dif x)/(x^2+2x+2)=integral (dif(x+1))/((x+1)^2+1)=arctan(x+1)+C
	$,
)
#question(
	tag:"1/(x^2+2x)",
	category:red,
	question:$integral (dif x)/(x^2+2x)$,
	answer:$
		integral (dif x)/(x^2+2x)=&integral (dif x)/(x(x+2))\
		=&integral 1/2(1/x-1/(x+2))dif x\
		=&1/2integral (dif x)/x-1/2integral (dif(x+2))/(x+2)\
		=&1/2log abs(x)-1/2log abs(x+2)+C\
		=&1/2log abs(x/(x+2))+C
	$,
)
#comment[
	这三道是有理函数积分的典型题目，分别对应着三套基本方法。对于积分$integral (dif x)/(a x^2+b x+c)$，来说，方法选取的关键在于观察分母多项式的根判别式$Delta=b^2-4a c$。#parbreak()
- 当$Delta=0$时，如#ref("1/(x^2+2x+1)")，可以直接配方解决；
- 当$Delta<0$时，如#ref("1/(x^2+2x+2)")，配方过后分母还多出正常数，要凑反正切形式；
- 当$Delta>0$时，如#ref("1/(x^2+2x)")，可因式分解并裂项。裂项相关的内容在讲义篇有所介绍。
]
#question(
	tag:"x/(x-1)",
	category:red,
	question:$integral x/(x-1)dif x$,
	answer:$
		integral x/(x-1)dif x=&integral (x-1+1)/(x-1)dif x\
		=&integral (1+1/(x-1))dif x\
		=&integral dif x+integral (dif(x-1))/(x-1)\
		=&x+log abs(x-1)+C
	$,
)
#question(
	tag:"x^3/(x^2+1)",
	category:red,
	question:$integral x^3/(x^2+1)dif x$,
	answer:$
		integral x^3/(x^2+1)dif x=&integral (x^3+x-x)/(x^2+1)dif x\
		=&integral (x-x/(x^2+1))dif x\
		=&integral x dif x-integral (x dif x)/(x^2+1)\
		=&x^2/2-1/2integral (dif x^2)/(x^2+1)\
		=&x^2/2-1/2log(x^2+1)+C
	$,
)
#comment[
	这两道是有理函数假分式化为真分式的情形。一般遇到被积函数是假分式的情形时，我们都要先将假分式分离成整多项式和真分式，再分别处理整多项式的积分和真分式的积分。#parbreak()
	关于凑配方法，笔者建议使用讲义篇中所介绍的方法（也正是这两题所用的），而不推荐使用待定系数法。凑配的关键在于根据分子上的最高次项凑出能与分母进行约分的形式，然后就能将最高次项从分子上分离出去，分子中余下的多项式次数就会降低一次。以此类推，就能将分子多项式的次数降低至分母次数以下。
]
#question(
	tag:"(e^(3x)+1)/(e^x+1)",
	category:red,
	question:$integral (ee^(3x)+1)/(ee^x+1)dif x$,
	answer:$
		integral (ee^(3x)+1)/(ee^x+1)dif x=&integral ((ee^x+1)(ee^(2x)-ee^x+1))/(ee^x+1)dif x\
		=&integral ee^(2x) dif x-integral ee^x dif x+integral dif x\
		=&1/2integral ee^(2x) dif(2x)-ee^x+x\
		=&1/2ee^(2x)-ee^x+x+C
	$,
)
#comment[
	本题是通过利用恒等变换对被积函数进行化简的例子。在解不定积分过程中恰当地使用恒等变换，往往能达到事半功倍的效果。
]
#question(
	tag:"(sqrt(1-x)-sqrt(1+x))/(sqrt(1-x^2))",
	category:red,
	question:$integral (sqrt(1-x)-sqrt(1+x))/(sqrt(1-x^2))dif x$,
	answer:[$
		integral (sqrt(1-x)-sqrt(1+x))/(sqrt(1-x^2))dif x=Int(#1,integral sqrt(1-x)/sqrt(1-x^2)dif x)-Int(#2,integral sqrt(1+x)/sqrt(1-x^2)dif x)
	$分别解这两个积分，得到#multi-eq[$
		Int(#1,I_1=integral sqrt(1-x)/sqrt(1-x^2)dif x)=integral (dif x)/sqrt(1+x)=integral (x+1)^(-1/2)dif(x+1)=2sqrt(1+x)+C_1$$
		Int(#2,I_2=integral sqrt(1+x)/sqrt(1-x^2)dif x)=integral (dif x)/sqrt(1-x)=-integral (1-x)^(-1/2)dif(1-x)=-2sqrt(1-x)+C_2
	$]所以原积分可表示为$
		Int(#1,I_1)-Int(#2,I_2)=2sqrt(1+x)+2sqrt(1-x)+C
	$]
)
#comment[
	本题用到了分项的方法，把分子分成两项，从而将原本困难的积分问题转化成两个较容易的子问题$Int(#1,I_1), Int(#2,I_2)$分别求解。分项方法广泛用于各种积分问题中，其本质简单但应用多样，有时甚至相当有技巧性。我们会在后续解题过程中逐步领略。
]
#question(
	tag:"1/(sqrt(x)+sqrt(x-1))",
	category:red,
	question:$integral (dif x)/(sqrt(x)+sqrt(x-1))$,
	answer:$
		integral (dif x)/(sqrt(x)+sqrt(x-1))=&integral (sqrt(x)-sqrt(x-1))/((sqrt(x)+sqrt(x-1))(sqrt(x)-sqrt(x-1)))dif x\
		=&integral (sqrt(x)-sqrt(x-1))/1dif x\
		=&integral x^(1/2)dif x-integral (x-1)^(1/2)dif(x-1)\
		=&2/3x^(3/2)-2/3(x-1)^(3/2)+C
	$,
)
#comment[
	本题相比#ref("(sqrt(1-x)-sqrt(1+x))/(sqrt(1-x^2))")多了一步，就是通过平方差公式将分母多项式变成分子多项式。#parbreak()
	当分母为多项式时，我们是没有办法对分母进行分项的；但当分子为多项式时，我们则有可能对分子进行分项。其实，在积分问题中，分母普遍要比分子难处理，所以若有可能，把分母上的复杂结构转移到分子上再分项，常常是行之有效的解题方法。
]
#question(
	tag:"1/(sin^2xcos^2x)",
	category:red,
	question:$integral (dif x)/(sin^2x cos^2x)$,
	answer:$
		integral (dif x)/(sin^2x cos^2x)=&integral (sin^2x+cos^2x)/(sin^2x cos^2x)dif x\
		=&integral (dif x)/(cos^2x)+integral (dif x)/(sin^2x)\
		=&integral sec^2x dif x+integral csc^2x dif x\
		=&tan x-cot x+C
	$,
)
#question(
	tag:"1/(sin^2xcos^2x)~",
	category:red,
	question:$integral (dif x)/(sin^2x cos^2x)$,
	answer:$
		integral (dif x)/(sin^2x cos^2x)=&integral (4dif x)/(2sin x cos x)^2\
		=&integral (4dif x)/(sin^2 2x)\
		=&2integral csc^2 2x dif(2x)\
		=&-2cot(2x)+C
	$,
)
#comment[
	本题的分母次数比较高，我们可以试着化简分母再观察如何求解。#parbreak()
	#ref("1/(sin^2xcos^2x)")的方法是使用恒等式$1=sin^2x+cos^2x$代换再分项，这样每项都可以和分母约分掉一部分，从而简化分母。#parbreak()
	#ref("1/(sin^2xcos^2x)~")的方法则是直接使用降幂公式简化分母，其思路与#ref("sin^2x")相近。#parbreak()
	另外，虽然本题给出了两个看似不同的解，但它们是等价的。读者可自行证明$tan x-cot x=-2 cot 2x$。
]
#question(
	tag:"sinxcospix",
	category:blue,
	question:$integral sin x cos pi x dif x$,
	answer:[$
		integral sin x cos pi x dif x=1/2Int(#1,integral sin[(1+pi)x]dif x)+1/2Int(#2,integral sin[(1-pi)x]dif x)
	$分别解这两个积分，得到#multi-eq[$
		Int(#1,I_1=integral sin[(1+pi)x]dif x)=1/(1+pi)integral sin[(1+pi)x]dif[(1+pi)x]=-cos[(1+pi)x]/(1+pi)+C_1$$
		Int(#2,I_2=integral sin[(1-pi)x]dif x)=1/(1-pi)integral sin[(1-pi)x]dif[(1-pi)x]=-cos[(1-pi)x]/(1-pi)+C_2
	$]所以原积分可表示为$
		1/2Int(#1,I_1)+1/2Int(#2,I_2)=-cos[(1+pi)x]/(2+2pi)-cos[(1-pi)x]/(2-2pi)+C
	$],
)
#comment[
	这是积化和差的典型问题。有些时候我们遇到的被积函数很难像#ref("sin(x/2)sinx")一样直接统一角度。而积化和差给了我们一个新的选择：将它拆成两个积分，让不同角度的三角函数分别在两个积分中得以解决。
]
#question(
	tag:"cosxcos(x+a)",
	category:blue,
	question:$integral cos x cos(x+a)dif x$,
	answer:[$
		integral cos x cos(x+a)dif x=&integral cos x (cos x cos a-sin x sin a)dif x\
		=&cos a Int(#1,integral cos^2x dif x)-Int(#2,integral sin a cos x sin x dif x)
	$分别解这两个积分，得到#multi-eq[$
		Int(#1,I_1=integral cos^2x dif x)=integral (1+cos 2x)/2 dif x=integral (dif x)/2+integral (cos 2x)/4dif(2x)=x/2+1/4sin 2x+C_1$$
		Int(#2,I_2=integral cos x sin x dif x)=integral sin x dif sin x=1/2sin^2 x+C_2
	$]所以原积分可表示为$
		Int(#1,I_1)cos a-Int(#2,I_2)sin a=x/2cos a+1/4sin 2x cos a-1/2sin^2x sin a+C
	$],
)
#comment[
	本题也可以使用积化和差公式来做，得到的结果与本做法形式不同，但其实等价。
]
