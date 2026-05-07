#let question-id=counter("question")
#show ref: it=>{
	let target=query(it.target).first()
	if type(target)!=content or target.func()!=metadata or target.value!="question" {
		it
	} else {
		let sup=it.supplement
		if sup==auto {
			sup=[Q]
		}
		let num=numbering("1",..question-id.at(locate(it.target)))
		link(it.target)[#sup#num]
	}
}
#let question(
	tag:"",
	category:black,//red,blue,black
	question:[],
	answer:[],
)={
	parbreak()
	question-id.step()
	context text(fill:category,weight:"semibold")[
		【Q#question-id.display()】
		#label(tag)
	]
	question
	parbreak()
	text(fill:category,weight:"bold")[【解】]
	answer
	parbreak()
}
#let ref(id)=context link(
	label(id),
	text(font:"Noto Serif")[【Q#question-id.at(query(label(id)).first().location()).first()】]
)
#let comment(body)={
	parbreak()
	set text(
		font:"Zhuque Fangsong (technical preview)",
	)
	set par(
		first-line-indent:(
			amount:2em,
			all:true
		),
	)
	body
	parbreak()
}
#let subst(body)={
	set text(fill:purple)
	body
}
