module Physics
using GLMakie

## Celestial Body 
Base.@kwdef mutable struct CelestialBody
  x::Float64 = 0.0
  y::Float64 = 0.0
  z::Float64 = 0.0
  color :: Any = :blue
  markersize :: Any = 1
  marker :: Any = :circle
end


function get_coords(body :: CelestialBody)
  return [body.x, body.y, body.z]
end

function get_color(body :: CelestialBody)
  return body.color
end

function get_marker(body :: CelestialBody)
  return body.marker
end

function get_markersize(body :: CelestialBody)
  return body.markersize
end

function update_body_coords!(body :: CelestialBody, new_coords :: Vector{Float64})
  body.x += new_coords[1]
  body.y += new_coords[2]
  body.z += new_coords[3]
  return body
end

function get_scatter_coords(bodies :: Array{CelestialBody})
  return foldl(hcat, map(get_coords,bodies))
end 

function get_observables(bodies :: Array{CelestialBody})
  coords = get_scatter_coords(bodies)
  return Observable(coords[1,:]), Observable(coords[2,:]), Observable(coords[3,:])
end


function step(bodies :: Array{CelestialBody})
  update_body_coords!(bodies[2], [0.1,0.1,0.1])
  return get_scatter_coords(bodies)
end

end