class ProductSerializer < ActiveModel::Serializer
    attributes  :id, 
                :title, 
                :description, 
                :price, 
                :sku,
                :slug,
                :main_image

    #has_many	:images
end