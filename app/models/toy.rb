class Toy < ActiveRecord::Base
  belongs_to :room
  has_many :toy_comments, as: :commentable

  validates :room, presence:true
  validates :price, format: { with: /\A\d{1,7}\.\d{2}?\z/ }
  validates :name, presence: true, uniqueness: true, length: { maximum: 200 }
  validates :available_num, numericality: { greater_than: 0, less_than: 1000000 }

  before_create ToyCallbacks

  before_save :increase_toys_number

  default_scope { where("active IS true") }

  def destroy
    update_attribute(:active, false)
  end

  protected
    def increase_toys_number
      Room.increment_counter(:number_of_toys, room.id)
    end
end
