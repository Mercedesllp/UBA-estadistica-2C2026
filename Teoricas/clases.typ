#set page(
  paper: "a4",
  numbering: "1",
  number-align: center,
)

#for i in range(1, 13) {
  eval("#include \"clase_" + str(i) + ".typ\"", mode: "markup")
  if i < 13 {
    line(length: 100%)
  }
}

#pagebreak()

#include "tabla_normal.typ"
#include "tabla_t_student.typ"
#include "tabla_tests.typ"
