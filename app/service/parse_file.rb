class ParseFile < ApplicationService
  def initialize(file)
    @file = read_file(file)
  end

  def call
    keys = transform_columns_to_symbol(extract_columns_from_file)

    Hash[keys.zip(transpose_rows_and_columns)]
  end

  private

  attr_reader :file

  def read_file(file)
    File.open(file, "r")
  end

  def rows
    @rows ||= file.readlines
  end

  def transform_columns_to_symbol(columns)
    columns.map { |key| key.downcase.tr(" ", "_").to_sym }
  end

  def extract_columns_from_file
    rows.shift.chomp.split("\t")
  end

  def transpose_rows_and_columns
    split_rows.transpose
  end

  def split_rows
    rows.map { |row| row.chomp.split("\t") }
  end
end
