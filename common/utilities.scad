// Common geometry utilities for OpenHygieneStation

module RoundedCube(size=[10,10,10], r=2, center=false) {
    x = size[0]; y = size[1]; z = size[2];
    rr = min(r, min(x, min(y, z))/2);
    translate(center ? [-x/2, -y/2, -z/2] : [0,0,0])
    minkowski() {
        cube([x-2*rr, y-2*rr, z-2*rr]);
        sphere(r=rr);
    }
}

module Tube(length=100, d=20, center=false) {
    translate(center ? [0,0,-length/2] : [0,0,0])
        cylinder(h=length, d=d);
}

module PipeElbow90(d=20, r=30) {
    rotate_extrude(angle=90)
        translate([r,0,0])
            circle(d=d);
}

module ChamferedPlate(size=[100,100,10], chamfer=2) {
    difference() {
        cube(size);
        // Simple chamfer approximation for top edges
        for (sx=[0, size[0]])
        for (sy=[0, size[1]])
            translate([sx, sy, size[2]-chamfer])
                cylinder(h=chamfer+0.1, d=chamfer*2, $fn=4);
    }
}
