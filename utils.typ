#let page-break={
	set page(header:none,footer:none)
	pagebreak(weak:true,to:"odd")
}
#let question-id=counter("question")
#let multi-eq-counter=counter("multi-eq")
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
)=block(width:100%,context{
	parbreak()
	counter(math.equation).update(0)
	question-id.step()
	block(width:100%,{
		context text(fill:category,weight:"semibold")[
			【Q#question-id.display()】
			#label(tag)
		]
		question
	})
	parbreak()
	block(width:100%,{
		text(fill:category,weight:"bold")[【解】]
		answer
	})
	parbreak()
})
#let ref(id)=context underline(link(
	label(id),
	text(
		fill:luma(128),
		font:"Noto Serif"
	)[【Q#question-id.at(query(label(id)).first().location()).first()】]
))
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
#let subst(..args)={
	set text(fill:purple)
	args.pos().join($,$)
}
#let Int(..args)={
	let args=args.pos()
	assert(args.len()==1 or args.len()==2)
	let colors=(
		none,
		color.hsv(180deg,95%,35%),
		color.hsv(60deg,100%,40%),
		color.hsv(0deg,85%,40%),
		color.hsv(240deg,95%,50%),
		color.hsv(300deg,85%,40%),
		color.hsv(120deg,95%,35%),
	)
	if type(args.at(0))==int{
		let no=args.at(0)
		set text(fill:colors.at(no))
		if args.len()==2{
			let body=args.at(1)
			assert(type(body)==content)
			body
		}
		else{
			$I_#no$
		}
	}
	else{
		set text(fill:colors.at(1))
		let body=args.at(0)
		body
	}
}
#let multi-eq(with-number:false,..args)=block(width:100%,context{
	multi-eq-counter.step()
	set math.equation(numbering:none)
	let widths=args.pos().map(measure).map(w=>w.width)
	let max-width=calc.max(..widths)
	let initial-number=counter(math.equation).get().first()
	show:align.with(center)
	if with-number{
		args.pos().zip(widths).enumerate(start:1).map(((i,(it,width)))=>{
			let number=numbering("(1)",initial-number+i)
			counter(math.equation).step()
			block(width:100%,{
				move(
					dx:(width - max-width)/2,
					context[
						#it
						#label("multi-eq-"+str(multi-eq-counter.get().first())+"-"+str(i))
					],
				)
				place(
					right,
					dy:-1.5em,
					number,
				)
			})
		}).join()
	}
	else{
		args.pos().zip(widths).map(((it,width))=>{
			move(
				dx:(width - max-width)/2,
				it,
			)
		}).join()
	}
})
#let ref-eq(i)=context link(
	label("multi-eq-"+str(multi-eq-counter.get().first())+"-"+str(i)),
	[(#i)],
)
#let noindent=h(-2em)
