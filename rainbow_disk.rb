require 'ruby-processing'

class RainbowDisk < Processing::App
  def intialize
  end

  def setup
    size 800, 600
    background 0

    @Nrad = 1000
    @i = 0
    @r = 200
    @rx = 400
    @ry = 300
    @color_brightness = 0.0
    @phase_r = PI/3 * 0
    @phase_g = PI/3 * 2.5
    @phase_b = PI/3 * 3.5
    @omega_r = 3.333
    @omega_g = 10.0
    @omega_b = Math::sqrt(2) * 10
    @time_lapse = 15
    @x = nil
    @y = nil
  end

  def draw
    @i += 1
    t = @i.to_f() / Math::PI / @time_lapse

    b = @color_brightness
    phase_r = @phase_r + Math::sin(t * @omega_r)
    phase_b = @phase_b + Math::sin(t * @omega_b)
    phase_g = @phase_g + Math::sin(t * @omega_g)

    for i in 1..@Nrad
      t = i.to_f * (2 * Math::PI / @Nrad)
      x = Math::cos(t) * @r + @rx
      y = Math::sin(t) * @r + @ry
      color_r = (Math::sin(t + phase_r)+b) * 127
      color_g = (Math::sin(t + phase_g)+b) * 127
      color_b = (Math::sin(t + phase_b)+b) * 127

      stroke color_r, color_g, color_b
      line @rx, @ry, x, y
    end

    @x = x
    @y = y
  end
end

RainbowDisk.new :title => "RGB Duha", :speed =>100
