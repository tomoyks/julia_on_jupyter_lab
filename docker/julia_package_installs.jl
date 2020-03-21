using Pkg

packages = [
    "IJulia",
    "DataFrames",
    "CSV",
    "StatsBase",
    "ProgressMeter"
]

for package in packages
    Pkg.add(package)
end