include <common/parameters.scad>;
include <common/materials.scad>;

module Carboy19() {
    WaterMat()
        cylinder(h=carboy_height, d=carboy_dia);
    translate([0, 0, carboy_height])
        Stainless()
            cylinder(h=35, d=70);
}
