class ToyCallbacks

  def self.before_create(toy)
    toy.color = "not defined" if toy.color.nil?
  end

end  
