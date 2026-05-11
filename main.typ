#import "./preset.typ":preset
#import "./math.typ":math-shorthands
#include "./coverpage.typ"
#show:preset
#show:math-shorthands
#counter(page).update(1)
#include "./frontmatter.typ"
#counter(page).update(1)
#include "./collection.typ"
#include "./lecture.typ"
#include "./appendix.typ"
#include "./backcoverpage.typ"
