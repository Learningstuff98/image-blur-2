class Image
  def initialize(array)
    @array = array
  end

  def output_image
    @array.each do |arrays|
      puts arrays.join
    end
  end

  def find_coordinates
    new_array = []
    @array.each_with_index do |inner_array, col|
      inner_array.each_with_index do |number, row|
        new_array.push([row, col]) if number == 1
      end
    end
    new_array
  end

  def set_north(row, col)
    if row - 1 >= 0 && (@array[row - 1][col]).zero?
      @array[row - 1][col] = 1
    end
  end

  def set_south(row, col)
    if row + 1 <= @array.length - 1 && (@array[row + 1][col]).zero?
      @array[row + 1][col] = 1
    end
  end

  def set_east(row, col)
    if col + 1 <= @array[row].length - 1 && (@array[row][col + 1]).zero?
      @array[row][col + 1] = 1
    end
  end

  def set_west(row, col)
    if !col.zero? && (@array[row][col - 1]).zero?
      @array[row][col - 1] = 1
    end
  end

  def blur
    find_coordinates.each do |col, row|
      set_north(row, col)
      set_south(row, col)
      set_east(row, col)
      set_west(row, col)
    end
  end
end

image = Image.new([
                    [0, 1, 0, 0],
                    [0, 0, 0, 0],
                    [0, 0, 0, 0],
                    [0, 1, 0, 0]
                  ])

image.blur

image.output_image
