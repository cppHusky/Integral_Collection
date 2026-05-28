#let math-state-counter=counter("math-state")
#let is-clean=()=>{
	let chapters=query(selector(<题集篇>).or(<讲义篇>))
	chapters.any(c=>{
		c.location().page()==here().page()
	})
}
#let is-chap-page=()=>{
	let chapters=query(
		heading.where(level:1).or(
			heading.where(level:2).after(<题集篇>).before(<积分常见结论>)
		)
	)
	chapters.any(c=>{
		c.location().page()==here().page()
	})
}
#let preset(body)={
	import "@preview/itemize:0.2.0"
	set page(
		paper:"a4",
		margin:(
			top:25mm,
			bottom:30mm,
			outside:22mm,
			inside:32mm,
		),
		numbering:"1",
		header:context if is-clean() {
			none
		} else if is-chap-page() {
			none
		} else {
			block(
				stroke:(
					bottom:.5pt,
				),
				inset:(
					bottom:3pt,
				),
				{
					if calc.odd(counter(page).get().first()) {
						h(1fr)
						counter(page).display()
					} else {
						counter(page).display()
						h(1fr)
					}
				}
			)
		},
		footer:context if is-clean() {
			none
		} else if is-chap-page() {
			set align(center)
			counter(page).display()
		} else {
			none
		},
		number-align:center+bottom,
	)
	set text(
		lang:"zh",
		region:"CN",
		font:(
			"Noto Serif CJK SC",
			"Noto Serif",
		),
		size:10.5pt,
		top-edge:"bounds",
		bottom-edge:"bounds",
	)
	set par(
		justify:true,
		leading:1.2em,
		spacing:1.2em,
	)
	//句号应使用句点，且需维持标点挤压
	show regex("[，。．、：；？！》）』」】〗〕〉］｝“‘《（『「【〖〔〈［｛，。．、：；]+"):it=>it.text.replace("。","．")
	show math.equation:set text(
		font:"New Computer Modern Math",
	)
	show math.equation:it=>math.display(it)
	//令行内数学公式保持CJK间距
	show math.equation.where(block:false):it=>{
		let ghost=text(font:"Adobe Blank","\u{375}")
		ghost;it;ghost
	}
	show math.equation:set block(breakable:true)
	show math.equation.where(block:true):it=>block({
		math-state-counter.step()
		let pagenum=state(str(math-state-counter.get().first()))
		context if here().page()!=pagenum.final(){
			set text(fill:silver,size:16pt)
			place(
				center+bottom,
				dy:10mm,
				sym.arrow.b.filled,
			)
		}
		it
		context pagenum.update(here().page())
	})
	show heading:set align(center)
	show heading:set text(weight:"extrabold")
	show heading.where(level:1):set text(size:30pt)
	show heading.where(level:2):set text(size:21pt)
	show figure.where(kind:"question"):set block(breakable:true)
	body
}
#let preset-frontmatter(body)={
	set page(
		numbering:"i",
	)
	body
}
#let preset-collection(body)={
	show:preset
	set page(
		numbering:"1",
		foreground:context{
			set text(size:9pt)
			let alignment=if calc.odd(counter(page).get().first()) {
				right+top
			}
			else {
				left+top
			}
			let section=counter(heading).get().at(1)
			let label=label("难度"+numbering("一",section))
			let label=if counter(page).get()==counter(page).at(label) {
				<outline>
			}
			else {
				label
			}
			place(
				alignment,
				dy:25mm+(3.4em+8pt)*(section -1)*3.2,
				link(
					label,
					box(
						height:3.4em+8pt,
						width:1.4em,
						fill:color.rgb("#e8d0d0"),
						{
							set text(
								top-edge:"cap-height",
								bottom-edge:"baseline",
							)
							set align(center+horizon)
							set par(leading:4pt)
							numbering("难度一",section)
						},
					)
				)
			)
		},
	)
	show heading.where(level:2):set heading(
		numbering:(..nums)=>[难度#numbering("一",nums.at(1))]
	)
	body
}
#let preset-lecture(body)={
	show:preset
	set page(
		foreground:context{
			set text(size:9pt)
			let alignment=if calc.odd(counter(page).get().first()) {
				right+top
			}
			else {
				left+top
			}
			let section=counter(heading).get().at(1)
			place(
				alignment,
				dy:25mm+(6.4em+20pt)*(section -1)*2.4,
				link(
					label("阶段"+numbering("一",section)),
					box(
						height:6.4em+20pt,
						width:1.4em,
						fill:color.rgb("#d0d0e8"),
						{
							set text(
								top-edge:"cap-height",
								bottom-edge:"baseline",
							)
							set align(center+horizon)
							set par(leading:3pt)
							query(selector(heading).before(here())).last().body
						},
					)
				)
			)
		},
	)
	show heading.where(level:2):set heading(
		numbering:(..nums)=>[阶段#numbering("一",nums.at(1))]
	)
	body
}
#let preset-appendix(body)={
	show:preset
	set par(
		first-line-indent:(
			amount:2em,
			all:true,
		)
	)
	show heading.where(level:1):set text(size:21pt)
	show heading.where(level:1):set heading(numbering:"附录A")
	show heading.where(level:2):set text(size:18pt)
	show heading.where(level:2):set heading(numbering:"A.1")
	set heading(supplement:"附录")
	body
}
