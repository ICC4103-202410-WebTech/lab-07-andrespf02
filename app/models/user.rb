class User < ApplicationRecord
    has_many :posts

    validates :name, presence: {message: "Te faltó colocar el nombre"}
    validates :email, presence: {message: "No se puede crear un usuario sin email"}, uniqueness: {message: "Ya eligieron este usuario"}, format: {message: "Escribe un email correcto", with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: {message: "Cómo vas a crear un usuario sin contraseña?"}, length: {message: "Ponle mínimo 6 carácteres para que no te hackeen", minimum: 6 }

    before_validation :downcase_email

    private
    def downcase_email
        self.email = email.downcase
    end
end