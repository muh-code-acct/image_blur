class Image
    def initialize(img)
      @img = img
    end
  
    def output_image
      @img.each do |row|
        puts row.join
      end
    end
  
    def rand_img
      h = @img[0]
      w = @img[1]
      @height = []
      h.times do 
        row = []
        w.times do |color|
          color = rand(9)
          row << color
        end
          @height << row
      end
      @img = @height
      self.output_image
    end
  
    def blur
      @blur_index = []
      @img.each do |line|
        if line.index(1)
          x = line.each_index.select { |index| line[index] == 1}
          y = @img.index(line)
          @blur_index << [x, y]
        end
      end
      i = 0
      @blur_index.each do
        multi_x = @blur_index[i][0]
        xx = 0
        multi_x.each do
          x = @blur_index[i][0][xx]
          y = @blur_index[i][1]
            row = y - 1
            px = x
              @img[row][px] = 1
            row = y + 1
            px = x
            if row < @img.length
              @img[row][px] = 1
            end
            row = y
            px = x - 1
              @img[row][px] = 1
            row = y
            px = x + 1
            if px < @img[row].length
              @img[row][px] = 1
            end
          xx += 1
        end
        i += 1
      end
      self.output_image 
    end 
  end
  
  puts "would you like a random image?"
    rando = gets.chomp
  
  if rando == "y"
    puts "What height?"
      h = gets.chomp.to_i
    puts "What width?"
      w = gets.chomp.to_i
    
    image = Image.new([h,w])
    randomization = image.rand_img
    puts "Would you like to blur it?"
      blur_it = gets.chomp
    if blur_it == "y"
      image.blur
      puts "Would you like it extra blury?"
        blur_extra = gets.chomp
      if blur_extra == "y" 
        image.blur
        # extra.blur
        puts "Ok, we're done here."
      else
        puts "Yea, I've had just about enough too."
      end
    else
      puts "Fine then, be like that."
    end
    
else 
    puts "Well, aren't you adventurous."
    puts "Pick a number!"
    puts "1 -- Image Blur #1"
    puts "2 -- One Pixel Transformation"
    puts "3 -- Two Pixel Transformation"
    puts "4 -- Pixel Edge Transformation"
    puts "----I noticed error cases, could add to the lesson requirments----"
    puts "5 -- End of Image Limit Test"
    puts "6 -- Miltiple pixels per row"
      test_num = gets.chomp
  
      if test_num == "1"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 1],
          [0, 0, 0, 0]
        ])
        puts "Image Blur #1"
        image.output_image
      elsif test_num == "2"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]
        ])
        puts "One Pixel"
        image.output_image
        puts "-----------------------------"
        puts "One Pixel Transformation"
        image.blur
      elsif test_num == "3"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 0, 1, 0],
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]
        ])
        puts "Two Pixel"
        image.output_image
        puts "-----------------------------"
        puts "Two Pixel Transformation"
        image.blur
      elsif test_num == "4"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [1, 0, 0, 0],
          [0, 0, 0, 0]
        ])
        puts "Pixel Edge"
        image.output_image
        puts "-----------------------------"
        puts "Pixel Edge Transformation"
        image.blur
    elsif test_num == "5"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 1]
          ])
        puts "End of Image Limit"
        image.output_image
        puts "-----------------------------------------"
        puts "End of Image Limit Transformation"
        image.blur
    elsif test_num == "6"
        image = Image.new([
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0],
          [1, 1, 1, 0],
          [0, 0, 0, 0],
          [0, 0, 0, 0]
          ])
        puts "Miltiple pixels per row"
        image.output_image
        puts "-----------------------------------------"
        puts "Miltiple pixels per row Transformation"
        image.blur
      end
end  
