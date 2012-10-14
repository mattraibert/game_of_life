class Matrix
  def neighbors_matrix(row, col, nrings = 1)
    Matrix.build(nrings * 2 + 1) do |nrow, ncol|
      row_index = (row + nrow - nrings) % row_size
      col_index = (col + ncol - nrings) % column_size
      self[row_index, col_index]
    end
  end

  def add_matrix(template, offset_row=0, offset_col=0)
    #todo allow offset
    Matrix.build(40, 150) { |row, col| template[row, col] || self[row, col] }
  end
end