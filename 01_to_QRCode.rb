require 'cairo'

format = Cairo::FORMAT_ARGB32
#set the size of QRCode
width = 400
height = 400
#set the width and height of a dot
dot = 10

surface = Cairo::ImageSurface.new(format,width,height)
context = Cairo::Context.new(surface)

#background
context.set_source_rgb(1,1,1) #background color(default:white)
context.rectangle(0,0,width,height)
context.fill

x = y = 0
for i in 0 .. 30
	#input the 01 data
	qr_row = gets.chomp
	for j in 0 .. qr_row.length - 1
		if qr_row[j] == "1"
			context.set_source_rgb(0,0,0)  #dot color(default:black)
			context.rectangle(x,y,dot,dot)
			context.fill
		end
		x += dot
	end
	x = 0
	y += dot
end

#output QRCode
surface.write_to_png("qr.png")