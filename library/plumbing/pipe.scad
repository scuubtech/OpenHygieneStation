include <common/parameters.scad>;
include <common/materials.scad>;

module Pipe(length=100, d=pipe_dia) {
    Stainless()
        cylinder(h=length, d=d);
}

module PipeElbow90(d=pipe_dia, r=30) {
    Stainless()
        rotate_extrude(angle=90)
            translate([r, 0, 0])
                circle(d=d);
}
