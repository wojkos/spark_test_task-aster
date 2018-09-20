class ProductsImporterService
  require 'csv'

  def initialize(params)
    @file = params
  end

  def import
    p "start import"
    CSV.foreach(@file.path, headers: true, col_sep: ';') do |row|
      unless row['name'].nil?
        @product = Spree::Product.create!(name: row['name'], description: row['description'], slug: row['slug'], available_on: row['availability_date'], price: row['price'], shipping_category_id: 1)
      end
      unless row['class'].nil?
        @taxon = Spree::Taxon.find_or_create_by!(name: row['class'])
      end
      Spree:Products_taxon.create!(product_id: @product.id, taxon_id: @taxon.id)
    end
  end
end
