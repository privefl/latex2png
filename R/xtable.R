FtablePng <- function(ftable.obj, name = "tmp") {
  myftab <- xtable::xtableFtable(ftable.obj)
  tex <- paste0(name, ".tex")
  tex.content <- utils::capture.output(print(myftab))
  writeLines(c("\\documentclass[preview]{standalone}",
               "\\begin{document}",
               tex.content,
               "\\end{document}"), tex)
  ConvertPng(tex)
}
