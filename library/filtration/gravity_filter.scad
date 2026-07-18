include <common/materials.scad>;
include <common/parameters.scad>;

module GravityFilter() {
    GlassMat() cylinder(h=220, d=200);
    translate([0, 0, 220]) GlassMat() cylinder(h=220, d=180);
    translate([0, 0, 440]) GlassMat() cylinder(h=220, d=160);
}
