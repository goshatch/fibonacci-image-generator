#!/usr/bin/env ruby

require 'rmagick'
include Magick

fib = [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181]

# Output image size: 2000x3000
output_width = 2000
output_height = 3000

image = Magick::Image.read("image.jpg")[0]

fib.each do |fibonacci_step|
  puts("Fibonacci step #{fibonacci_step}")
  list = Magick::ImageList.new
  scaled_image = image.scale(output_width / fibonacci_step, output_height / fibonacci_step)

  fibonacci_step.times do
    list << scaled_image
  end

  mosaic_list = Magick::ImageList.new
  page = Magick::Rectangle.new(0,0,0,0)
  list.scene = 0

  fibonacci_step.times do |i|
    fibonacci_step.times do |j|
      print(".")
      mosaic_list << list.resize(1)
      page.x = j * mosaic_list.columns
      page.y = i * mosaic_list.rows
      mosaic_list.page = page
      (list.scene += 1) rescue list.scene = 0
    end
  end

  puts("OK")
  mosaic = mosaic_list.mosaic
  puts("Mosaic generated")
  mosaic.write("mosaic_#{fibonacci_step}.jpg")
  puts("mosaic_#{fibonacci_step}.jpg saved")
end
exit
