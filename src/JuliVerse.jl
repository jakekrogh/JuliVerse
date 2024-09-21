module JuliVerse
include("./Physics.jl")
include("./Animation.jl")
using .Physics: CelestialBody, get_observables, step, get_color, get_markersize, get_marker
using .Animation: scene!
using GLMakie

FPS = 30
FRAMES = 180

# Setup Experimennt
sun = CelestialBody(x = 50,y = 50, z = 50, color = :yellow, markersize = 30, marker = :star8)
earth = CelestialBody(x = 70,y = 70, z = 70, color = :blue, markersize = 15)
bodies = [sun,earth]

# Setup Scene
x, y, z = get_observables(bodies)
fig = Figure(backgroundcolor = :black)
scene!(fig, x,y,z, map(get_color, bodies), map(get_markersize, bodies), map(get_marker, bodies))  

display(fig)            
  
# Update Scene 
for i = 1:FRAMES    
    coords = step(bodies)
    x[] = coords[1,:]
    y[] = coords[2,:]
    z[] = coords[3,:]
    sleep(1/FPS) # refreshes the display!
end

## End of Module ## 
end 