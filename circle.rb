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
    @r = 200
    @rx = 400
    @ry = 300
    @x = nil
    @y = nil
    smooth
  end
  
  def draw
    @i += 1
    t = @i.to_f() / @Nrad / PI
    
    x = cos(t) * @r + @rx
    y = sin(t) * @r + @ry
    
    if (@x != nil && @y != nil)
      line @x, @y, x, y
    end
    
    @x = x
    @y = y 
  end
end
