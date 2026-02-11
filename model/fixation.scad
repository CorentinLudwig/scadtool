include <config.scad>;


module fixation() {
    $fa = 1;
    $fs = 0.1;

    h_max = hole+space;
    h_min = 2.5;
    difference() {
        cube([hole+space, (hole+space) * 2, h_max]);
        translate([space/2+hole/2, space/2+hole/2, 0]) {
            cylinder(h=h_max, r = hole/2);
        }
        translate([0, hole+space, 0]) {
            cube([hole+space, (hole+space), h_min]);
        }
    }


}


fixation();