#import "utils.typ":page-break
#import "preset.typ":preset-collection
#align(center+horizon)[
	= 题集篇<题集篇>
	#show:text.with(font:"Zhuque Fangsong (technical preview)")
	循序渐进 触类旁通
]
#page-break
#show:preset-collection
== <难度一>
#counter(figure.where(kind:"question")).update(100)
#include "collection/level-1.typ"
#page-break
== <难度二>
#counter(figure.where(kind:"question")).update(200)
#include "collection/level-2.typ"
#page-break
== <难度三>
#counter(figure.where(kind:"question")).update(300)
#include "collection/level-3.typ"
#page-break
== <难度四>
#counter(figure.where(kind:"question")).update(400)
#include "collection/level-4.typ"
#page-break
== <难度五>
#counter(figure.where(kind:"question")).update(500)
#include "collection/level-5.typ"
#page-break
== <难度六>
#counter(figure.where(kind:"question")).update(600)
#include "collection/level-6.typ"
#page-break
