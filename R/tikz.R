#' @title Tikz plot in PNG
#' @description Tikz plot in PNG.
#' @param fun.plot The function containing the code of the code you want.
#' @param name The base name of the PNG image to be created.
#' @inheritParams tikzDevice::tikz
#' @inheritParams pdftools::pdf_render_page
#' @details Make sure you use escapes for special characters in Latex.
#' @export
TikzPng <- function(fun.plot, name, width = 4,
                    height = width/1.2, dpi = 72) {
  tex <- paste0(name, ".tex")
  dir <- dirname(tex)
  wd.save <- setwd(dir)
  tex2 <- basename(tex)
  tikzDevice::tikz(tex2, width = width, height = height,
                   standAlone = TRUE)
  fun.plot()
  grDevices::dev.off()

  ConvertPng(tex, dpi = dpi)
  setwd(wd.save)
  file.path(dir, sub("\\.tex$", ".png", tex2))
}
