module Animation
using GLMakie


# Get Plotting Coordinnates 
function scene!(fig, x :: Observable, y :: Observable, z :: Observable, colors , markersizes, markers)
  ax = Axis3(
    fig[1, 1], aspect = (1, 1, 1), title = "JuliVerse", 
    limits = (0,100, 0, 100, 0, 100), perspectiveness = 0.8, viewmode = :stretch, 
    xgridvisible = false, xlabelvisible = false, xticklabelsvisible = false,
    ygridvisible = false, ylabelvisible = false, yticklabelsvisible = false,
    zgridvisible = false, zlabelvisible = false, zticklabelsvisible = false,)
  scatter!(ax, x,y,z, color = colors, markersize = markersizes, marker = markers) # Add Colormap for objects, Add markersize for objects
end

end