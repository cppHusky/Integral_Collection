#import "utils.typ":question-id
#import "preset.typ":preset-collection
#align(center+horizon)[
	#set page(footer:none)
	= 题集篇
	#text(font:"Zhuque Fangsong (technical preview)")[
		循序渐进 触类旁通
	]
]
#pagebreak(weak:true,to:"odd")
#show:preset-collection
== 难度一
#question-id.update(100)
#include "collection/level-1.typ"
#pagebreak(weak:true,to:"odd")
== 难度二
#question-id.update(200)
#include "collection/level-2.typ"
#pagebreak(weak:true,to:"odd")
== 难度三
#question-id.update(300)
#include "collection/level-3.typ"
#pagebreak(weak:true,to:"odd")
== 难度四
#question-id.update(400)
#include "collection/level-4.typ"
#pagebreak(weak:true,to:"odd")
== 难度五
#question-id.update(500)
#include "collection/level-5.typ"
#pagebreak(weak:true,to:"odd")
== 难度六
#question-id.update(600)
#include "collection/level-6.typ"
#pagebreak(weak:true,to:"odd")
