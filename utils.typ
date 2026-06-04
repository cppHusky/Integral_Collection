#let page-break={
	set page(header:none,footer:none)
	pagebreak(weak:true,to:"odd")
}
#let question(
	tag:"",
	category:black,//red,blue,black
	question:[],
	answer:[],
)=figure(
	kind:"question",
	supplement:none,
	block(width:100%,context{
		counter(figure.where(kind:"sub-eq")).update(0)
		let question-id=counter(figure.where(kind:"question"))
		context metadata((
			kind:"question",
			number:question-id.get().first(),
			tag:tag,
		))
		set align(left)
		parbreak()
		counter(math.equation).update(0)
		block(width:100%,{
			text(
				fill:category,
				weight:"semibold",
				question-id.display("【Q1】"),
			)
			question
		})
		parbreak()
		block(width:100%,{
			text(
				fill:category,
				weight:"semibold",
				"【解】",
			)
			answer
		})
		parbreak()
	})
)
#let ref(tag)=context{
	let target=query(selector(metadata)).filter(d=>{
		d.value.kind=="question" and d.value.tag==tag
	}).first()
	show:underline
	set text(
		fill:luma(128),
		font:"Noto Serif"
	)
	link(
		target.location(),
		numbering("【Q1】",target.value.number),
	)
}
#let comment(body)={
	set text(
		font:"Zhuque Fangsong (technical preview)",
	)
	set par(
		first-line-indent:(
			amount:2em,
			all:true
		),
	)
	show quote.where(block:true):set pad(
		x:0mm,
		y:-1em,
	)
	quote(
		block:true,
		quotes:false,
		{
			parbreak()
			body
			parbreak()
		},
	)
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
	let tag=query(selector(metadata).before(here())).filter(d=>{
		d.value.kind=="question"
	}).last().value.tag
	set math.equation(numbering:none)
	let widths=args.pos().map(measure).map(w=>w.width)
	let max-width=calc.max(..widths)
	show:align.with(center)
	if with-number{
		args.pos().zip(widths).map(((it,width))=>figure(
			kind:"sub-eq",
			supplement:none,
			block(width:100%,context{
				let number=counter(figure.where(kind:"sub-eq")).get().first()
				metadata((
					kind:"sub-eq",
					tag:tag,
					number:counter(figure.where(kind:"sub-eq")).get().first(),
				))
				move(
					dx:(width - max-width)/2,
					it,
				)
				place(
					right,
					dy:-1.5em,
					numbering("(1)",number),
				)
			}),
		)).join()
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
#let ref-eq(number)=context{
	let tag=query(selector(metadata).before(here())).filter(d=>{
		d.value.kind=="question"
	}).last().value.tag
	let target=query(selector(metadata)).filter(d=>{
		d.value.kind=="sub-eq" and d.value.tag==tag and d.value.number==number
	}).first()
	link(
		target.location(),
		numbering("(1)",number),
	)
}
#let noindent=h(-2em)
#let chara=(
	杨秉:(
		name:"杨秉",
		avatar:circle(fill:lime,"杨"),
	),
	严佩:(
		name:"严佩",
		avatar:circle(fill:yellow,"严"),
	),
	温舒:(
		name:"温舒",
		avatar:circle(fill:rgb("ff70de"),"温"),
	),
	牛弘:(
		name:"牛弘",
		avatar:circle(fill:aqua,"牛"),
	),
	default:(),
)
