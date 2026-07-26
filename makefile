typ=main.typ
default:main.pdf
TYPST_ARGS=--ignore-system-fonts --font-path ./fonts --pdf-standard 2.0
main.pdf:$(typ)
	typst c $^ ${TYPST_ARGS}
watch:
	typst w $(typ) ${TYPST_ARGS}
font_init:
	pushd fonts
	./pull-font.sh
	git sudmobule update --init
	popd
