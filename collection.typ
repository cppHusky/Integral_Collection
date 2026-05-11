#import "utils.typ":question-id
#import "preset.typ":preset-collection
#show:preset-collection
#align(center+horizon)[
	#set page(footer:none)
	= 题集篇
	#text(font:"Zhuque Fangsong (technical preview)")[
		循序渐进 触类旁通
	]
]
#pagebreak(weak:true,to:"odd")
== 难度一
#question-id.update(1000)
#include "collection/level-1.typ"
#pagebreak(weak:true,to:"odd")
== 难度二
#question-id.update(2000)
#include "collection/level-2.typ"
#pagebreak(weak:true,to:"odd")
== 难度三
#question-id.update(3000)
#include "collection/level-3.typ"
#pagebreak(weak:true,to:"odd")
== 难度四
#question-id.update(4000)
#include "collection/level-4.typ"
#pagebreak(weak:true,to:"odd")
== 难度五
#question-id.update(5000)
#include "collection/level-5.typ"
#pagebreak(weak:true,to:"odd")
