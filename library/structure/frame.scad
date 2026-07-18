include <common/parameters.scad>;
include <common/materials.scad>;
include <common/utilities.scad>;

module Extrusion4040(length=100) {
    Aluminium()
        cube([profile40, profile40, length]);
}

module CornerBracket(size=40, thickness=6) {
    difference() {
        Aluminium()
            cube([size, size, size]);
        translate([thickness, thickness, -1])
            cube([size - thickness*2, size - thickness*2, size + 2]);
    }
}

module FrameVerticals() {
    for (x = [0, station_width - profile40])
    for (y = [0, station_depth - profile40])
        translate([x, y, 0])
            Extrusion4040(station_height);
}

module FrameTopRails() {
    translate([0, 0, station_height - profile40]) {
        Extrusion4040(station_width);
        translate([0, station_depth - profile40, 0])
            Extrusion4040(station_width);
    }
    translate([0, 0, station_height - profile40]) {
        rotate([0, 0, 90])
            Extrusion4040(station_depth);
        translate([station_width - profile40, 0, 0])
            rotate([0, 0, 90])
                Extrusion4040(station_depth);
    }
}

module FrameBottomRails() {
    Extrusion4040(station_width);
    translate([0, station_depth - profile40, 0])
        Extrusion4040(station_width);
    rotate([0, 0, 90])
        Extrusion4040(station_depth);
    translate([station_width - profile40, 0, 0])
        rotate([0, 0, 90])
            Extrusion4040(station_depth);
}

module Frame() {
    FrameVerticals();
    FrameTopRails();
    FrameBottomRails();
    for (x = [0, station_width - profile40])
    for (y = [0, station_depth - profile40])
    for (z = [0, station_height - profile40])
        translate([x, y, z])
            CornerBracket();
}
