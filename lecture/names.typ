#let chara=(
	杨秉:"杨秉",
	严佩:"严佩",
	温舒:"温舒",
	牛弘:"牛弘",
	施仁:"施仁",
	肖虑:"肖虑",
	李清:"李清",
	吉峰:"吉峰",
	吕顺:"吕顺",
	许诺:"许诺",
	刘津:"刘津",
	史姝:"史姝",
	赵超:"赵超",
	窦法:"窦法",
	隋欣:"隋欣",
	寇茂:"寇茂",
)
#let avatar(c)={
	set circle(
		radius:12pt,
		inset:3pt,
		stroke:none,
	)
	set text(
		font:"Noto Sans CJK SC",
		fill:navy,
	)
	circle(c.first(default:"？"))
}
#let chara-background(c)={
	if c==chara.杨秉 {
		rgb("f7fff7")
	} else if c==chara.严佩 {
		rgb("fffff1")
	} else if c==chara.温舒 {
		rgb("fff7f7")
	} else if c==chara.牛弘 {
		rgb("f7f7ff")
	} else {
		rgb("fbfbfb")
	}
}
