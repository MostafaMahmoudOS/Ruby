class ItemSerializer < ActiveModel::Serializer
  attributes :item_name,:item_description
  def item_name
    
       object.name.upcase 
  end
  def item_description
      object.description.upcase
  end
end
