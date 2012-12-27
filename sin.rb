require 'ruby-processing'

class Sin < Processing::App

  def intialize
  end
  
  def setup
    size 800, 600
    background 0
    
    stroke 255
    
    @Nrad = 20
    @i = 0
    @h = 200
    @x = 0
    @y = 0
    smooth
  end
  
  def draw
    @i += 1
    t = @i.to_f() / @Nrad / Math::PI
    
    x = @i
    y = sin(t) * @h + 300
    
    line @x, @y, x, y
    
    @x = x
    @y = y 
  end
end
