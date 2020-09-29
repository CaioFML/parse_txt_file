class ImportFile < ApplicationService
  def initialize(file_content)
    @file_content = file_content
  end

  def call
    parse_file_content.each do |content|
      sale = Sale.new
      sale.build_buyer(name: content[0], kind: :buyer)
      sale.build_product(description: content[1],
                         unit_price: content[2],
                         quantity: content[3])
      sale.build_provider(address: content[4], name: content[5], kind: :provider)
      sale.save!
    end
  end

  private

  attr_reader :file_content

  def parse_file_content
    lines = split_content_in_lines
    lines.shift
    split_lines_in_columns(lines)
  end

  def split_content_in_lines
    file_content.split("\n")
  end

  def split_lines_in_columns(lines)
    lines.map { |line| line.split("\t") }
  end
end
