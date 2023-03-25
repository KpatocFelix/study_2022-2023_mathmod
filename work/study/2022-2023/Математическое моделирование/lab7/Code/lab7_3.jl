using Plots
using DifferentialEquations

"коэффициент уравнения 1"
a1 = 0.51
a2 = 0.000099

"коэффициент уравнения 2"
b1 = 0.000019
b2 = 0.99

"коэффициент уравнения 3"
c1 = 0.99
c2 = 0.3
N = 945    
n0 = 13


function  odn_f(du, u, p, t)
    x, y, z = u
    du[1]= (a1+a2*u[1])*(N-u[1])                 
    du[2]= (b1+b2*u[1])*(N-u[1])                     
    du[3]= (c1*t+c2*cos(4*t)*u[1])*(N-u[1])           
end
u0 = [n0, n0, n0]
tspan =(0.0, 30.0)
prob1 = ODEProblem(odn_f, u0, tspan)
sol1 = solve(prob1, dtmax=0.1)

N1 = [u[1] for u in sol1.u]
N2 = [u[2] for u in sol1.u]
N3 = [u[3] for u in sol1.u]
T = [t for t in sol1.t]

plt = 
    plot(
        layout=(1),
        dpi=300,
        legend=true)
        
    plot!(
        plt[1],
        T,
        N3,
        title="график N",
        label="решение уравнения 3",
        color=:red)
    

        savefig("lab73.png")