import Pkg
Pkg.add(Pkg.Types.PackageSpec[Pkg.PackageSpec(; name = "Lux", ), Pkg.PackageSpec(; name = "Optimisers", ), Pkg.PackageSpec(; name = "Zygote", ), Pkg.PackageSpec(; name = "Plots", ), Pkg.PackageSpec(; name = "MedEye3d", ), Pkg.PackageSpec(; name = "HDF5", ), Pkg.PackageSpec(; name = "BSON", ), Pkg.PackageSpec(; name = "Distributions", ), Pkg.PackageSpec(; name = "Clustering", ), Pkg.PackageSpec(; name = "ParallelStencil", ), Pkg.PackageSpec(; name = "CUDA", ), Pkg.PackageSpec(; name = "Hyperopt", ), Pkg.PackageSpec(; name = "PythonCall", )])
for name in ["Lux", "Optimisers", "Zygote", "Plots", "MedEye3d", "HDF5", "BSON", "Distributions", "Clustering", "ParallelStencil", "CUDA", "Hyperopt", "PythonCall"] # pkg_names_to_test
Pkg.add(name)
Pkg.test(name)
end
Pkg.add(collect(values(Pkg.Types.stdlibs())))
for (uuid, info) in Pkg.dependencies()
Pkg.add(info.name)
end
for (uuid, info) in Pkg.dependencies()
if info.name in ["Lux", "Optimisers", "Zygote", "Plots", "MedEye3d", "HDF5", "BSON", "Distributions", "Clustering", "ParallelStencil", "CUDA", "Hyperopt", "PythonCall"]
project_file = joinpath(info.source, "Project.toml")
test_project_file = joinpath(info.source, "test", "Project.toml")
if ispath(project_file)
project = Pkg.TOML.parsefile(project_file)
if haskey(project, "deps")
project_deps = project["deps"]
for entry in keys(project_deps)
Pkg.add(entry)
end
end
if haskey(project, "extras")
project_extras = project["extras"]
for entry in keys(project_extras)
Pkg.add(entry)
end
end
end
if ispath(test_project_file)
test_project = Pkg.TOML.parsefile(test_project_file)
if haskey(test_project, "deps")
test_project_deps = project["deps"]
for entry in keys(test_project_deps)
Pkg.add(entry)
end
end
end
end
end
for (uuid, info) in Pkg.dependencies()
Pkg.add(info.name)
end

