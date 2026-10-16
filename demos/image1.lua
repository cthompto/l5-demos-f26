-- Image Demo
-- Chelsea Thompto

novaSpin = 0

require("L5")

function setup()
  size(600, 800)
  windowTitle("Image Demo")
  describe('4 Dogs Images')
  angleMode(DEGREES)
  textAlign(CENTER)
  textSize(24)

  -- variables connected to loaded image
  -- images can be found in "assets" folder
  novaImg1 = loadImage('assets/nova1.png')
  novaImg2 = loadImage('assets/nova2.png')
end

function draw()
 
  -- draw background
  background(0)

  -- draw label text
  text("Standard Image:", width*0.25, height*0.03)
  text("Transparent Image:", width*0.75, height*0.03)
  text("Image with Red Tint:", width*0.25, height*0.53)
  text("Spinning Image:", width*0.75, height*0.53)
  
  -- add tint to bottom left image, tint must come before
  -- noTint will work
  tint(255, 0, 0)

  -- red tint of standard image
  image(novaImg1,width*0.05,height*0.55, width*0.4)

  -- remove tint for remaining three images
  noTint()

  -- standard image
  image(novaImg1,width*0.05,height*0.05, width*0.4)

  -- transparent image made in photo editing software
  image(novaImg2,width*0.55,height*0.05,width*0.4)
  
  -- push and pop to isolate code for spin
  push()
  -- center mode so image spins around the center at 0,0
  imageMode(CENTER)
  -- move 0,0 to desire point
  translate(width*0.75,height*0.75)
  -- rotate based on spin variable
  rotate(novaSpin)
  -- draw transparent nova image
  image(novaImg2,0,0,width*0.4)
  pop()

  -- increase rotation to create animation
  novaSpin = novaSpin + 1
end