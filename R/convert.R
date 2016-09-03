#' @title Convert Latex to PNG
#' @description Convert standalone Latex to PNG.
#' @param tex The name (path) of the TeX document.
#' @inheritParams pdftools::pdf_render_page
#' @details Some TeX installations on Windows do not
#' have ‘texi2dvi.exe’. If ‘texify.exe’ is present
#' (e.g., part of MikTeX), then it can be used instead:
#' set \code{options(texi2dvi="texify.exe")}
#' or to the full path of the program. With TeX Live,
#' I use \code{options(texi2dvi="pdflatex.exe")}.
#' @export
ConvertPng <- function(tex, dpi = 72) {
  invisible(ConvertPngInv(tex, dpi))
}

ConvertPngInv <- function(tex, dpi = 72) {
  name <- sub("\\.tex$", "", tex)
  tools::texi2pdf(tex)

  pdf <- paste0(name, ".pdf")
  bitmap <- pdftools::pdf_render_page(pdf, dpi = dpi)

  .png <- paste0(name, ".png")
  png::writePNG(bitmap, .png)

  cleaner <- c(".tex",".aux",".log",".pdf")
  file.remove(paste0(name, cleaner))
}







