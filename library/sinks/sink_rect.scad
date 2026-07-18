include <common/parameters.scad>;
include <common/materials.scad>;
include <common/utilities.scad>;

module SinkRect(width=500, depth=350, height=160, wall=6, radius=12) {
    Stainless()
    difference() {
        RoundedCube([width, depth, height], r=radius);
        translate([wall, wall, wall])
            RoundedCube([width-2*wall, depth-2*wall, height], r=max(1, radius-wall));
    }
}
