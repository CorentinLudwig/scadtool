include <config.scad>

module Battery() {
    $fa = 1;
    $fs = 0.4;

    // block
    cube([bat_l, bat_w, bat_h]);
    // button
    translate([-1, 8, 9.3])
        cube([1,8,5]);
    
    translate([-10, 30.4+2.5/2, 2.6+2.5/2])
        rotate([0,90,0])
            cylinder(h=10, r=2.5);
}

Battery();