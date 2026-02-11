

module Battery() {
    $fa = 1;
    $fs = 0.4;

    // block
    cube([89.3, 42, 22.4]);
    // button
    translate([-1, 8, 9.3])
        cube([1,8,5]);
    
    translate([-10, 30.4+2.5/2, 2.6+2.5/2])
        rotate([0,90,0])
            cylinder(h=10, r=2.5);
}

Battery();