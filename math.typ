#import "@preview/quick-maths:0.2.1":shorthands
#let ee=$bb(e)$
#let ii=$bb(i)$
#let sgn=$op("sgn")$
#let arccot=$op("arccot")$
#let arsinh=$op("arsinh")$
#let arcosh=$op("arcosh")$
#let artanh=$op("artanh")$
#let mod=math.class("binary",math.mod)
#let cases(..args)=math.cases(
	gap:.6em,
	..args.named(),
	..args.pos().map(it=>{
		if it.has("children"){
			let arr=()
			for elem in it.children{
				if repr(elem)=="align-point()"{
					arr.push(math.display(sym.space))
				}
				arr.push(math.display(elem))
			}
			arr.join()
		}
		else{
			math.display(it)
		}
	}),
)
#let math-shorthands(body)={
	show:shorthands.with(
		($+-$,$plus.minus$),
		($++$,$class("binary",+)$),
		($--$,$class("binary",-)$),
		($<-$,$< -$),
	)
	body
}
