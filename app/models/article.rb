class Article < ActiveRecord::Base
acts_as_votable
has_many :comments,dependent: :destroy
belongs_to:user
  validates :title, 
             :presence => {:message=> ":Enter title!" },
             :length => {minimum: 5, :message=> ":Title must be 5 characters" }
   validates :text, :presence => {:message=> "Enter some text!"},
                  :length => { minimum: 1, :message=> ":Message is too short"}

end
