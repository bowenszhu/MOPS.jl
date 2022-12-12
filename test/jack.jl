using Test, MOPS, Symbolics

@variables a w x y z
@test_nowarn jack(1, [4], [x, y, z])
@test_nowarn jack(a, [2, 2], [w, x, y, z])
@test_nowarn jack(a, [3, 1], [w, x, y, z])
@test_nowarn jack(2, [6], [x, y])
@test_nowarn jack(a, [6, 1, 1], [x, y, z])
