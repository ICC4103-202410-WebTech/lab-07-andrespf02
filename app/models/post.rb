class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, :through => :post_tags
    belongs_to :parent_post, class_name: "Post", optional: true
    has_many :children, class_name: "Post", foreign_key: "parent_post_id"

    validates :title, presence: {message: "El Post tiene que tener título"}
    validates :content, presence: {message: "Escríbele algo algún contenido al Post"}
    validates :user_id, presence: {message: "A quién le pertenece el Post?"}
    validates :answers_count, numericality: {message: "El número de respuetas mayor o igual a cero", greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: {message: "El número de likes mayor o igual a cero", greater_than_or_equal_to: 0 }

    before_validation :set_default_published_at

    private
    def set_default_published_at
        self.published_at ||= Time.current
    end
end