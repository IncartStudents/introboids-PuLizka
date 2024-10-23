module Boids
using Plots

mutable struct WorldState
    boids::Vector{Vector{Float64}}  
    velocities::Vector{Vector{Float64}}  
    height::Float64
    width::Float64
    function WorldState(n_boids, h, w)
        boids = [([rand(0:w), rand(0:h)]) for _ in 1:n_boids]
        velocities = [([rand([-1.0, 1.0]) * rand(), rand([-1.0, 1.0]) * rand()]) for _ in 1:n_boids]
        new(boids, velocities, h, w)
    end
end

function update!(state::WorldState)
    b = length(state.boids)
    for i in 1:b
        pos = state.boids[i]
        vel = state.velocities[i]

        
    end
    return nothing
end

function (@main)(ARGS)
    h = 30  
    w = 30  
    n_boids = 10 
    state = WorldState(n_boids, h, w)  
    color = "orange"  

    anim = @animate for time = 1:100  
        update!(state)  
        boids = state.boids  
        scatter(boids, xlim = (0, state.width), ylim = (0, state.height), 
                color = color)  
    end
    gif(anim, "boids.gif", fps = 10)  
end
end

using .Boids
Boids.main("")  