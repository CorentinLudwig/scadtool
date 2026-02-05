sm_body_x = 40.7;
sm_body_y = 20;
sm_body_z = 40.6;

module servomotor () {
    $fa = 1;
    $fs = 0.1;
    union() {
        translate([0, 0, 20.25]) {
            cube([sm_body_x, sm_body_y, sm_body_z], center=true);
        }
        difference() {
            translate([0, 0, 30.1]) {
                cube([53.9, 18.3, 2.4], center=true);
            }
            union() {
                translate([24.6, 5.5/2 + 2.4/2, 30.1]) {
                    cylinder(2.6, 2.4, 2.4, center=true);
                }
                translate([24.6, -(5.5/2 + 2.4/2), 30.1]) {
                    cylinder(2.6, 2.4, 2.4, center=true);
                }
                translate([-(24.6), 5.5/2 + 2.4/2, 30.1]) {
                    cylinder(2.6, 2.4, 2.4, center=true);
                }
                translate([-(24.6), -(5.5/2 + 2.4/2), 30.1]) {
                    cylinder(2.6, 2.4, 2.4, center=true);
                }

            }
        }
        translate([-(26.7 - 40.7/2 + 2.9/2), 0, 42.4]) {
            cylinder(4, 2.9, 2.9, center=true);
        }
    }

}
