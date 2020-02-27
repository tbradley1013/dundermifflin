library(magick)
library(hexSticker)

dunder_frame <- image_read("sticker/dunder-frame.png")

hexSticker::sticker(
  dunder_frame,
  package = "dundermifflin",
  p_color = "#875B35",
  h_fill = "#fffeea",
  h_color = "#875B35",
  h_size = 0.1,
  p_size = 3,
  p_x = 1,
  p_y = 1.6,
  s_height = 1,
  s_width = 1*1.45,
  s_y = 1,
  s_x = 1,
  url = "https://www.github.com/tbradley1013/dundermifflin",
  u_color = "#875B35",
  u_size = 0.9,
  u_y = 0.065,
  u_x = 1.06
)


dunder_sticker <- image_read("dundermifflin.png")
dunder_sticker
