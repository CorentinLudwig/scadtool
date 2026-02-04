include <config.scad>;
use <cartefolder.scad>


module PlateStm(L = 171+5, W = 115+5, H = 5) {
    
    $fa = 1;
    $fs = 0.4;

    difference() {
        // Base plate
        union(){
        cube([L, W, H]);
        translate([
        L/2,
        W/2-2.5,
        0])
            color("#FFFF")
            carteFolder();
        }

            
        // Holes in each corner
        for (x = [pad + hole/2, L - pad - hole/2])
            for (y = [pad + hole/2, W - pad - hole/2])
                translate([x, y, -1])
                    cylinder(h = H + 2, r = hole/2);
            
        translate([30,10,-1])
            cube([73.6,12,H*2]);
        translate([30,W-10*2,-1])
            cube([73.6,12,H*2]);
    }
}

PlateStm();