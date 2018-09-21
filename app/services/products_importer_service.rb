class ProductsImporterService
  require 'csv'

  def initialize(params)
    @file = params
  end

  def import
    CSV.foreach(@file.path, headers: true, col_sep: ';') do |row|
      unless row['name'].nil?
        if Spree::Product.find_by_slug(row['slug']).nil?
          slug = row['slug']
        else
          unless Spree::Product.find_by_slug(slug).nil?
            slug = "#{row['slug']}#{row['slug'][-1]}"
          end
        end
        @product = Spree::Product.create!(
          name: row['name'],
          description: row['description'],
          slug: slug, available_on: row['availability_date'],
          price: row['price'],
          shipping_category_id: 1
        )
      end

      unless row['category'].nil?
        @taxon = Spree::Taxon.find_or_create_by!(name: row['category'])
      end
      unless @taxon.nil? && @product.nil?
        # TODO: How connect taxon and product
        # Spree:Products_taxon.create!(
        #   product_id: @product.id,
        #   taxon_id: @taxon.id
        #   )
      end
      # TODO: How add product quantity
    end
  end
end
