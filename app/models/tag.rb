class Tag < ApplicationRecord
    has_many :post_tags
    has_many: posts, :through => :post_tag

    validates :name, presence: {message: "Colócale nombre al Tag"}, uniqueness: message: {"Ya hay un Tag con este nombre"}
end