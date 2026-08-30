#set page(
  paper: "a4",
  numbering: "1",
  number-align: center, 
)

#for i in range(1, 7) {
  eval("#include \"clase_" + str(i) + ".typ\"", mode: "markup")
  if i < 6 {
    line(length: 100%)
  }
}