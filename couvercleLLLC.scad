include <config.scad>;


module PlateWithCornerHoles(L = 120, W = 80, H = 5) {
    
    $fa = 1;
    $fs = 0.4;

    difference() {
        // Base plate
        cube([L, W, H]);

        // Holes in each corner
        for (x = [pad + hole/2, L - pad - hole/2])
            for (y = [pad + hole/2, W - pad - hole/2])
                translate([x, y, -1])      // slight overlap below
                    cylinder(h = H + 2, r = hole/2);
    }
}

PlateWithCornerHoles(120,80,5);