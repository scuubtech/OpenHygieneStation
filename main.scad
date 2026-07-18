// OpenHygieneStation
// OpenSCAD 2021.01 starter assembly

include <common/parameters.scad>;
include <common/colours.scad>;
include <common/materials.scad>;
include <common/utilities.scad>;

include <library/structure/frame.scad>;
include <library/water/carboy19.scad>;
include <library/water/tank100.scad>;
include <library/sinks/sink_rect.scad>;
include <library/filtration/gravity_filter.scad>;

// render_mode: 0=concept, 1=engineering, 2=presentation
render_mode = 1;

module reference_floor() {
    color([0.95, 0.95, 0.95])
        translate([-50, -50, -2])
            cube([station_width + 100, station_depth + 100, 2]);
}

module poC1_preview() {
    frame();

    translate([220, 150, counter_height + 50])
        carboy19();

    translate([520, 150, counter_height + 50])
        carboy19();

    translate([820, 150, counter_height + 50])
        carboy19();

    translate([110, 90, 0])
        gravity_filter();

    translate([300, 200, 760])
        sink_rect();

    translate([600, 200, 760])
        sink_rect();

    translate([480, 180, 40])
        tank100();
}

reference_floor();
poC1_preview();
