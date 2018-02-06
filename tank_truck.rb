=begin
To introduce the problem think to my neighbor who drives a tanker truck. The level indicator is down and he is worried because he does not know if he will be able to make deliveries. We put the truck on a horizontal ground and measured the height of the liquid in the tank.

Fortunately the tank is a perfect cylinder and the vertical walls on each end are flat. The height of the remaining liquid is h, the diameter of the cylinder is d, the total volume is vt (h, d, vt are positive or null integers). You can assume that h <= d.

Could you calculate the remaining volume of the liquid? Your function tankvol(h, d, vt) returns an integer which is the truncated result (e.g floor) of your float calculation.

Fortunately the tank is a perfect cylinder and the vertical walls on each end are flat. The height of the remaining liquid is h, the diameter of the cylinder is d, the total volume is vt (h, d, vt are positive or null integers). You can assume that h <= d.
=end

# PSEUDOCODE
# V=πr2L
# V=L(R2cos−1(R−hR)−(R−h)2Rh−h2‾‾‾‾‾‾‾‾‾√)  gives the volume from a radius R, a height h and a length L.

# Deconstruct vt to find L in above equation
# L = (vt / Math.acos(-1)) / (Math.sqrt(radius))
# pi in ruby is Math.acos(-1) => 3.14...
# cos−1(1−x)+x(2−x)‾‾‾‾‾‾‾‾√(x−1) where x = h/r
# Circle area = pi r sqrd
# Circumference = 2*pi*r
      # without the l, should give the area of the portion of the circle filled.  Take the portion against the total circle area and use that percent times the total volume?


# CODE
# REFACTOR
def tankvol(h, d, vt)
  radius = d.to_f/2
  l = vt / (Math.acos(-1)*radius**2)
  cylindersectorarea = l*(radius**2*Math.acos((radius-h)/radius.to_f)-(radius-h)*Math.sqrt(2*radius*h-h**2))
  cylindersectorarea.floor
end

# FIRST ATTEMPT
# def tankvol(h, d, vt)
#   heightremaining = h # portion of the radius
#   p 'radius is ...'
#   p radius = d.to_f/2 # 3
#   p lilr = (radius-h).abs # 20
#   p h
#   p 'pi is ...'
#   p pi = Math.acos(-1) # 3.141592653589793
#   p "chord a ..."
#   p chorda = 2*Math.sqrt((radius**2)-(lilr**2)) # 113.13708498984761
#   p 'should equal chord a 2 ...'
#   p chorda2 = 2*Math.sqrt(h*(2*radius-h)) # 113.13708498984761
#   p 'arc length s is ...'
#   p arclengths = 2*radius*Math.acos((radius-h)/radius.to_f) # 147.71513008089298
#   # Fluid Side Arc Length = 2 × r × arccos((r − h) ⁄ r),  when depth (h) ≤ radius (r)
#   # Fluid Side Arc Length = 2 × r × (π − arccos((h − r) ⁄ r)),  when depth (h) > radius (r)
#   if h == radius
#     return vt/2
#   else
#     # p Math.sqrt(radius)
#     # p vt / Math.acos(-1) # 1114.0846016432674
#     # length 
#     p 'L is ...'
#     p l = vt / (Math.acos(-1)*(radius**2)) # confusing as fuck example since length of the cylinder is 0.301
#     p 'Circle full area is ... '
#     p circlefullarea = Math.acos(-1)*(radius**2) # 11309.7
#     p 'VT is ...'
#     p circlefullarea*l # 3500 ... so this is correct up to this point

#     # trying to find circle full area * percent = circle side sector area

#     # arc length = 

#     # total arc area = 

#     # triangle area = 

#     # Fluid Surface Area,  Side
#     # A = r² ×  (π ⁄ 2  − arcsin(1−h ⁄ r))  − (r−h)  ×√h×(2×r−h)
#     p 'part 1 is ...'
#     p part1 = (radius**2)
#     p 'part 2 is ...'
#     p part2 = Math.acos(-1)/2
#     # p part2 = ((Math.acos(-1)/2)-Math.asin((1-h)/radius))
#     p hofr = h/radius.to_f
#     p 'Part3 is ...'
#     p part3 = Math.asin((1-hofr))
#     p 'part 4 is ...'
#     p part4 = ((radius-h)*Math.sqrt((h*((2*radius)-h)))) # 20*Math.sqrt(40*80)
#     p 'fluid surface side area is ...'
#     p fluidsurfaceareaside = (part1)*((Math.acos(-1)/2)-Math.asin((1-hofr)))-((radius-h)*Math.sqrt((h*((2*radius)-h)))) # 3300.083052528312
#     # Fluid Surface Area,  Top
#     # a = 2 ×  √r²−(|r−h|)²  ×L
#     # Fluid Surface Area,  Bottom
#     # b =   Arc × L
#     # Fluid Surface Area,  Total = 2 × A + a + b


#     # A = A sector - A isoceles triangle
#     p 'circle sector area is ...'
#     p circlesidesectorarea = ((radius**2)*(Math.acos((radius-h)/radius.to_f))-((radius-h)*Math.sqrt((2*radius*h)-(h**2)))) # 3300.0830525283127

#     # total arc area * length - triangle area * length
#     p 'cylinder sector area is ...'
#     p cylindersectorarea = l*((radius**2)*(Math.acos((radius-h)/radius.to_f))-((radius-h)*Math.sqrt((2*radius*h)-(h**2)))) # 1021.2699202682509

#       # My l calculation is right, but the volume keeps turning up 1114.08 when it should return 1750
#     p 'Percent of total circle area is ...'
#     p percent = circlesidesectorarea / circlefullarea
#     p final = percent * vt
#   # else
#   #   p "here now"
#   #   # vt/2 + 
#     cylindersectorarea.floor
#   end
  
# end


# DRIVER CODE
# p tankvol(60,120,3500) # should return 1750
# p tankvol(40,120,3500) # should return 1021 (calculation gives about: 1021.26992027)
# p tankvol(80,120,3500) # should return 2478 (calculation gives about: 2478.73007973)
p tankvol(5, 7, 3848) # should return 2940
