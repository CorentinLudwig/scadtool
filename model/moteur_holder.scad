// M4 hole settings
include <config.scad>;

module moteurHolder(){
    $fa = 1;
    $fs = 0.4;
    thickness = 5;
    L = 46.5;
    H = 29.4;
    B = 5;
    
    // Back plate dimensions
    back_L = L + 5*2;
    back_W = 2;
    back_H = H + B + 5;
    
    // Calculate holes for back plate
    available_L = back_L - 2*pad - hole;
    available_H = back_H - 2*pad - hole;
    
    length = floor(available_L / (hole + space)) + 1;
    height = floor(available_H / (hole + space)) + 2;
    
    difference() {
        // Back plate with holes
        cube([back_L, back_W, back_H]);
        
        // Grid of holes through the back plate
        for(i = [0:length-1])
            for(j = [1:height-1])
                translate([
                    pad + hole/2 + i*(hole + space),
                    -1,
                    pad + hole/2 + j*(hole + space)
                ])
                    rotate([-90, 0, 0])
                        cylinder(h = back_W + 2, r = hole/2);
    }
    
    // Base plate
    translate([5, 0, 0])
        cube([L, 23, thickness]);
    
    // Left support
    translate([0, 0, 28.1+B])
        cube([8, 23, 5]);
    
    // Right support
    translate([L+2, 0, 28.1+B])
        cube([8, 23, 5]);
    
    // Mounting cylinder
    translate([33.5+5, 11.5, thickness])
        cylinder(h=B, r=4.3, center=false);
}

moteurHolder();