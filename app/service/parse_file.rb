class ParseFile < ApplicationService
  def initialize(file)
    @file = read_file(file)
  end

  def call
    columns_hash = transform_columns_in_hash
    transposed_rows = split_rows.transpose

    insert_values(columns_hash, transposed_rows)
    columns_hash.transform_values(&:flatten!)
  end

  private

  attr_reader :file, :rows

  def read_file(file)
    File.open(file, "r")
  end

  def rows
    @rows ||= file.readlines
  end

  def transform_columns_in_hash
    columns = extract_columns_from_file
    Hash[columns.collect { |column| [column.downcase.tr(" ", "_").to_sym, []] }]
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

  def insert_values(columns, rows)
    columns[:comprador] << rows[0]
    columns[:descrição] << rows[1]
    columns[:preço_unitário] << rows[2]
    columns[:quantidade] << rows[3]
    columns[:endereço] << rows[4]
    columns[:fornecedor] << rows[5]
  end
end
