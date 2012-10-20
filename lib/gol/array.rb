class Array
  def add_array(template, offset_row=0, offset_col=0)
    #todo allow offset
    self.each_with_index.map do |stripe, row|
      stripe.each_with_index.map do |it, col|
        (template[row] && template[row][col]) || it
      end
    end
  end
end