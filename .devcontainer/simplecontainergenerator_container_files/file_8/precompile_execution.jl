import Lux # pkg_names_to_import
import Optimisers # pkg_names_to_import
import Zygote # pkg_names_to_import
import Plots # pkg_names_to_import
import MedEye3d # pkg_names_to_import
import HDF5 # pkg_names_to_import
import BSON # pkg_names_to_import
import Distributions # pkg_names_to_import
import Clustering # pkg_names_to_import
import ParallelStencil # pkg_names_to_import
import CUDA # pkg_names_to_import
import Hyperopt # pkg_names_to_import
import PythonCall # pkg_names_to_import

import Pkg
for (uuid, info) in Pkg.dependencies()
if info.name in ["Lux", "Optimisers", "Zygote", "Plots", "MedEye3d", "HDF5", "BSON", "Distributions", "Clustering", "ParallelStencil", "CUDA", "Hyperopt", "PythonCall"] # pkg_names_to_test
ENV["PREDICTMD_TEST_PLOTS"] = "true"
ENV["PREDICTMD_TEST_GROUP"] = "all"

include(joinpath(info.source, "test", "runtests.jl"))
end
end

