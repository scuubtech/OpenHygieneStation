include <common/materials.scad>;
include <common/parameters.scad>;

module Tank100() {
    GreyWaterMat()
        cube([tank100_w, tank100_d, tank100_h]);
}
