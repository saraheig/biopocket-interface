class User < ApplicationRecord
  has_secure_password validations: false # Custom validations: see below
  
  # Compulsory fields: email, pseudo and password
  validates_length_of :firstname, :maximum => 15, :message => 'Le prénom doit avoir moins de 15 caractères.'
  validates_length_of :lastname, :maximum => 15, :message => 'Le nom de famille doit avoir moins de 15 caractères.'
  validates_presence_of :email, :message => 'Un e-mail doit être spécifié.'
  validates_uniqueness_of :email, :case_sensitive => false, :message => 'Cet e-mail est déjà utilisé.'
  # Pseudo is used in order to identify user (sign in)
  validates_uniqueness_of :pseudo, :case_sensitive => false, :message => 'Ce pseudo est déjà utilisé.'
  validates_length_of :pseudo, :in => 5..15, :message => 'Un pseudo doit être spécifié et avoir entre 5 et 15 caractères.'
  # Password must be minimum 5 characters.
  validates_length_of :password, :minimum => 5, :message => 'Un mot de passe doit être spécifié et avoir plus de 5 caractères.'
end