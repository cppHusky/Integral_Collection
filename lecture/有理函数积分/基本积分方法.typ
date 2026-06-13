#import "/utils.typ":lesson,chara,noindent,ruby
#import "/math.typ":*
#import "@preview/cetz:0.5.2"
#lesson(
	(chara.严佩,[
		咳咳，我们上课了，保持安静。#parbreak()
		首先，我要对上节课突然离开教室的同学提出批评——他今天还没有来，如果有同学认识他，麻烦转达给他。此同学无视课堂纪律，当众大摇大摆走出教室也就算了；还目中无人，我叫他都全然不理会，甚至出了教室就开始跑，我那天从下午追到晚上，追了42公里都没追上。
	]),
	(chara.牛弘,[
		（用口罩遮住大半张脸，在口罩的掩护下偷偷地笑）
		//这事是牛弘安排的
	]),
	(chara.严佩,[
		希望那位同学好自为之。不说废话了，我们进入正题。
	]),
)
==== 分项积分法
#lesson(
	(chara.严佩,[
		上节课，杨教授给大家讲解了什么是有理函数，以及如何进行有理函数的裂项。今天我们就会用到这些知识。我在这里先把本节课会用到的积分公式写一下。（捡起一节粉笔）$
			&integral x^n dif x=1/(n+1)x^(n+1)+C space(n!=-1)\
			&integral 1/x dif x=log x+C\
			&integral 1/(x^2+1)dif x=arctan x+C.
		$#noindent 我可以很明确地告诉大家，在一切有理函数积分的问题中，我们需要用到的公式都只有这三个。我以这道题为例——$
			integral (x+1)dif x.
		$#noindent 这列第三排的男生，你来回答一下。#parbreak()
	]),
	(chara.窦法,[
		嗯，我可以把它拆成两个积分，也就是$
			integral (x+1)dif x=integral x dif x+integral dif x=x^2/2+x+C.
		$
	]),
	(chara.严佩,[
		正确。你叫什么名字？
	]),
	(chara.窦法,[
		我叫窦法，今天也给严老师带来一道题目。
	]),
	(chara.严佩,[
		你还给我出上题目了？也行，你说吧。
	]),
	(chara.窦法,[$
			integral (x+1)^18dif x.
	$]),
	(chara.严佩,[
		你这个题……（点头）还不错。我先给你记下，待会可以用，你先坐吧。（抄到黑板上）#parbreak()
		在此之前呢，我们先出点比较简单的题目——$
			integral (x+1)/x dif x
		$#noindent 这列倒数第二排的女生，你来回答一下。
	]),
	(chara.隋欣,[
		（完全没听到，仍在自顾自摸鱼）
	]),
	(chara.严佩,[
		我说（拿起一枝笔，在讲桌上用力戳了几下），倒数第二排那个穿lululemon红色夹克戴Airpods Max正在边看iPhone Pro Max边笑的女生，你听见没？
		//lululemon指License to Train女士运动纹理夹克-蔓越莓魅力红/浅象牙白，这是为数不多在衣服上印有logo的款式
		//iPhone Pro Max的11到14代背面都一样，无法进一步判断型号
	]),
	(chara.隋欣,[
		（被旁边的同学轻拍两下，慌忙摘下耳机起身）啊，什……什么？
	]),
	(chara.严佩,[
		你来回答一下这道题（指黑板上的题目）。
	]),
	(chara.隋欣,[
		我想想……可以把$(x+1)/x$变成$1+1/x$，然后分成两个积分来做……
	]),
	(chara.严佩,[
		……上课不要玩手机，（摆手）坐吧。$
			integral (x+1)/x dif x=integral (1+1/x)dif x=integral dif x+integral 1/x dif x=x+log x+C.
		$#noindent 我们来回看这两道题，它们有一个共同的思路，就是：原本的积分不在我们的三个基本积分公式之中；但是如果把它拆成多个积分，我们就可以分别解决它们。这种分而治之的思路普遍存在于各类积分问题中，我们把它叫做分项积分法。#parbreak()
		现在我再给大家出道题：$
			integral (3x-1)^2 dif x.
		$#noindent 这列第四排的男生，你来回答一下。
	]),
	(chara.吕顺,[
		可以把完全平方公式展开，变成$
			integral (9x^2-6x+1)dif x,
		$#noindent 然后再分项，化为$
			&9integral x^2dif x-6integral x dif x+integral dif x\
			=&3x^3-3x^2+x+C.
		$
	]),
	(chara.严佩,[
		正确。你叫什么名字。
	]),
	(chara.吕顺,[
		我叫吕顺。
	]),
	(chara.严佩,[
		好，坐吧。此类问题的套路比较简单，大家肯定都会做了。未来我们还会讲到分项积分法更复杂、更有技巧性的运用，到时候再说。
	]),
)
