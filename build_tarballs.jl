# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder, Pkg

name = "Box2D"
version = v"2.4.1"

# Collection of sources required to complete build
sources = [
    ArchiveSource(
        "https://github.com/erincatto/box2d/archive/refs/tags/v$(version).tar.gz",
        "d6b4650ff897ee1ead27cf77a5933ea197cbeef6705638dd181adc2e816b23c2",
    ),
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir
mkdir -p build
cd build

cmake \
    -DCMAKE_INSTALL_PREFIX=${prefix} \
    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBOX2D_BUILD_UNIT_TESTS=OFF \
    -DBOX2D_BUILD_TESTBED=OFF \
    -DBOX2D_BUILD_DOCS=OFF \
    -DBOX2D_USER_SETTINGS=OFF \
    -DBUILD_SHARED_LIBS=ON \
    ../box2d-2.4.1
cmake \
    --build . \
    --config Release \
    --target install

install_license /usr/share/licenses/MIT
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()

# The products that we will ensure are always built
products = [
    LibraryProduct("libbox2d", :libbox2d),
]

# Dependencies that must be installed before this package can be built
dependencies = [
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(
    ARGS,
    name,
    version,
    sources,
    script,
    platforms,
    products,
    dependencies;
    julia_compat="1.6",
    preferred_gcc_version = v"9",
)
