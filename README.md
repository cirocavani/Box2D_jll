# Box2D Library Binary

https://github.com/erincatto/box2d

https://box2d.org/

https://box2d.org/documentation/

Box2D is a 2D rigid body simulation library for games. Programmers can use it in their games to make objects move in realistic ways and make the game world more interactive. From the game engine's point of view, a physics engine is just a system for procedural animation.

Box2D is written in portable C++.


Packaging:

https://github.com/JuliaPackaging/BinaryBuilder.jl

https://binarybuilder.org/

https://docs.binarybuilder.org/stable/

> **IMPORTANT** Tested only with Julia 1.6 (other version may present issues)

```sh
rm -rf ~/.julia/dev/Box2D_jll
rm -rf build products
# julia --project build_tarballs.jl --verbose x86_64-apple-darwin
# julia --project build_tarballs.jl --deploy=local --verbose x86_64-apple-darwin
julia --project build_tarballs.jl --deploy=cirocavani/Box2D_jll.jl
```
