include <config.scad>;
include <servomotor.scad>


module leg_bone(l = 50, w = 5, h1 = 5, h2 = 3) {
    points = [
    [ 0,  0,  0 ],
    [ l,  0,  0 ],
    [ l,  w,  0 ],
    [ 0,  w,  0 ],
    [ 0,  0,  h1 ],
    [ l,  0,  h2 ],
    [ l,  w,  h2 ],
    [ 0,  w,  h1 ]];
    
    faces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left
    polyhedron( points = points, faces = faces);
 
}


module corner(h = 2, l= 4) {
    $fa = 1;
    $fs = 0.1;
    difference() {
        cube([l, l, h]);
        translate([0, 0, -1]) {
            cylinder(h + 2, l, l);
        } 
    }
}


module arm(l = 50, h = 100, width = 9, thickness = 5) {
    $fa = 1;
    $fs = 0.1;

    // Support moteur
    body_x_out = sm_body_x + width*2;
    body_y_out = thickness;
    body_z_out = sm_body_y + width;

    body_x_in = sm_body_x;
    body_y_in = thickness;
    body_z_in = sm_body_y;
    
    // support axe
    support_w = 20;
    hole_r = 4.3;   // rayon de l'axe de rotation

    join = 0.5; // recouvrement de 2 pieces
    corner_body_l = 6; 

    // bras
    arm1_l = l+join;
    arm1_w = thickness;
    arm1_h1 = body_z_out * 2 / 3;
    arm1_h2 = body_z_out / 2;

    // avant bras
    arm2_l = h + join;
    arm2_w = thickness;
    arm2_h1 = body_z_out / 2;
    arm2_h2 = body_z_out / 4;

    corner_arm_l = 10;

    // corps
    difference() {
        difference() {
            cube([body_x_out, body_y_out, body_z_out]);
            translate([width, 0, 0]) {
                cube([body_x_in, body_y_in, body_z_in]);
            }
        }
        translate([body_x_out - corner_body_l, corner_body_l, body_z_out - corner_body_l]) {
            rotate([90, 0, 0]) {
                corner(h = thickness+1, l = corner_body_l);
            }
        }
        translate([body_x_out - corner_body_l, corner_body_l, corner_body_l]) {
            rotate([90, 90, 0]) {
                corner(h = thickness+1, l = corner_body_l);
            }
        }
        translate([corner_body_l, corner_body_l, corner_body_l]) {
            rotate([90, 180, 0]) {
                corner(h = thickness+1, l = corner_body_l);
            }
        }
        translate([corner_body_l, corner_body_l, body_z_out - corner_body_l]) {
            rotate([90, -90, 0]) {
                corner(h = thickness+1, l = corner_body_l);
            }
        }

    }

    // Support axe
    translate([sm_axe_x - support_w/2 + width, sm_body_low_z + thickness*2,body_z_in + thickness]) { // << Vérifier le x
        rotate([0,180,180]) {
            cube([support_w, sm_body_low_z + thickness*2, thickness]);
            cube([support_w, thickness, sm_body_y/2 + thickness]);
            translate([support_w/2, 0, sm_body_y/2 + thickness]) {
                rotate([-90,0,0]) {
                    cylinder(thickness, support_w/2, support_w/2);
                    cylinder(thickness*2-0.5, hole_r, hole_r);
                }
            } 
        }
    }

    // jambe
    translate([40,0,body_z_out-join]) {
        rotate([0, -90, 0]) {
            // bras
            difference() {
                leg_bone(arm1_l, arm1_w, arm1_h1, arm1_h2);
                // angle suppérieur
                translate([arm1_l - corner_arm_l,thickness,arm1_h2 - corner_arm_l + (corner_arm_l / arm1_l * (arm1_h1 - arm1_h2))]) {
                    rotate([90, 0, 0]) {
                        corner(h=thickness, l=corner_arm_l);
                    }
                }
            }
            
            // avant-bras
            translate([arm1_l - arm2_h1 ,0,join]) {
                rotate([0, 90, 0]) {
                    leg_bone(arm2_l, arm2_w, arm2_h1, arm2_h2);
                }
            }

            // angle inférieur
            translate([arm1_l - arm2_h1 - corner_arm_l + join,thickness,-corner_arm_l + join]) {
                rotate([90, 0, 0]) {
                    corner(h=thickness, l=corner_arm_l);
                }
            }
        }
    }


}

arm();

translate([sm_body_x/2 + 9,sm_body_low_z,sm_body_y/2]) {
    rotate([90,180,0]) {
        %servomotor();
    }
}