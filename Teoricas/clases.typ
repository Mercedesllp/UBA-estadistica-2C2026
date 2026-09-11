#set page(
  paper: "a4",
  numbering: "1",
  number-align: center, 
)

#for i in range(1, 9) {
  eval("#include \"clase_" + str(i) + ".typ\"", mode: "markup")
  if i < 8 {
    line(length: 100%)
  }
}