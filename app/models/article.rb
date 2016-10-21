class Article
  attr_accessor :name, :author

  def info
  	"The author of #{@name} is #{@author}"
  end
end
