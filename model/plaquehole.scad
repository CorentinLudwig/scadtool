// M4 hole settings
include <config.scad>;

// Plate size with holes in a grid pattern
module PlateHoles(L = 120, W = 80, H = 5) {
    
    $fa = 1;
    $fs = 0.4;
    
    available_L = L - 2*pad - hole;
    available_W = W - 2*pad - hole;
    
    // Number of holes that fit
    length = floor(available_L / (hole + space)) + 1;
    width = floor(available_W / (hole + space)) + 1;
    
    difference() {
        // Base plate
        cube([L, W, H]);
        
        // Grid of holes
        for(i = [0:length-1])
            for(j = [0:width-1])
                translate([
                    pad + hole/2 + i*(hole + space),
                    pad + hole/2 + j*(hole + space),
                    -1
                ])
                    cylinder(h = H + 2, r = hole/2);
    }
}
plate_L = 171+5;
plate_W = 115+5;

PlateHoles(plate_L, plate_W, 5);