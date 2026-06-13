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
	if c==chara.杨秉 {
		circle("杨")
	} else if c==chara.严佩 {
		circle("严")
	} else if c==chara.温舒 {
		circle("温")
	} else if c==chara.牛弘 {
		circle("牛")
	} else if c==chara.施仁 {
		circle("施")
	} else if c==chara.肖虑 {
		circle("肖")
	} else if c==chara.李清 {
		circle("李")
	} else if c==chara.吉峰 {
		circle("吉")
	} else if c==chara.吕顺 {
		circle("吕")
	} else if c==chara.许诺 {
		circle("许")
	} else if c==chara.刘津 {
		circle("刘")
	} else if c==chara.史姝 {
		circle("史")
	} else if c==chara.赵超 {
		circle("赵")
	} else if c==chara.窦法 {
		circle("窦")
	} else if c==chara.隋欣 {
		circle("隋")
	} else if c==chara.寇茂 {
		circle("寇")
	}
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
