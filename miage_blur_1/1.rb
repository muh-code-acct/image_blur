class Image
    def initialize(img)
      @img = img
    end
  
    def output_image
      @img.each do |row|
         puts row.join
      end
    end
   end
  
   image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])
  image.output_image