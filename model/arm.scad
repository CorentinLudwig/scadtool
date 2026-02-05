include <servomotor.scad>




module arm(l = 50, w = 5, h1 = 5, h2 = 3) {
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

translate([0, 28.7, 0]) {
    rotate([90, 0, 0]) {
        %servomotor();
    } 
}

body_w = 9;
body_x = sm_body_x + body_w*2;
body_y = 5;
body_z = sm_body_y + body_w;

translate([-body_x/2, 0, -sm_body_y/2]) {
    difference() {
        cube([body_x, body_y, body_z - 2]);
        translate([(body_x - sm_body_x)/2, -1, 0]) {
            cube([sm_body_x, body_y + 2, body_z - body_w]);
        }
    }

} 

arm1_l = 60;
arm1_w = 5;
arm1_h1 = body_z/2;
arm1_h2 = body_z / 3;
translate([body_x/2 - body_w/2, 0,0]) {
    arm(arm1_l, arm1_w, arm1_h1, arm1_h2);
} 

arm2_l = 80;
arm2_w = 5;
arm2_h1 = body_z/2;
arm2_h2 = body_z / 4;
translate([body_x/2 - body_w/2 + arm1_l - arm2_h1, 0,5]) {
    rotate([0, 90, 0]) {
        arm(arm2_l, arm2_w, arm2_h1, arm2_h2);
    }
} 

corner_size = 15;
translate([56,arm1_w,-corner_size + 1]) {
    rotate([90, 0, 0]) {
        corner(h=arm1_w, l=corner_size);
    }
} 