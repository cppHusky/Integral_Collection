#let ee=$bb(e)$
#let ii=$bb(i)$
#let sgn=$op("sgn")$
#let arccot=$op("arccot")$
#let arsinh=$op("arsinh")$
#let arcosh=$op("arcosh")$
#let artanh=$op("artanh")$
#let mod=math.class("binary",math.mod)
#let cases(..args)=math.cases(
	..args.named(),
	..args.pos().map(it=>{
		let arr=()
		for elem in it.children{
			if repr(elem)=="align-point()"{
				arr.push(math.display(sym.space))
			}
			arr.push(math.display(elem))
		}
		arr.join()
	}),
)
