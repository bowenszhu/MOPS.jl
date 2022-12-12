# MOPS.jl

```@example jack
using MOPS, Symbolics
@variables a w x y z
jack(1, [4], [x, y, z])
```
```@example jack
jack(a, [2, 2], [w, x, y, z])
```
```@example jack
jack(a, [3, 1], [w, x, y, z])
```
```@example jack
jack(2, [6], [x, y])
```
```@example jack
jack(a, [6, 1, 1], [x, y, z])
```
