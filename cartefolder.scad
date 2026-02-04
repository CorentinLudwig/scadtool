
module carteFolder(L = 112, W = 67, H = 20) {
    l = L+5;
    w = W+5;
    
    // Déplacer tout pour centrer sur l'origine
    translate([-l/2, -w/2, 0]) {
        cube([l,w,5]);
        
        cube([l,5,H]);
        cube([5,w/2-10,H]);
        translate([0,w/2+10,0])
            cube([5,w/2-10,H]);
        
        translate([l-5,0,0]){
            cube([5,w/2-10,H]);
            translate([0,w/2+10,0])
                cube([5,w/2-10,H]);
        }
        
        translate([0,w,0])
            cube([l,5,H]);
        
        // Cubes dans les 4 coins (3mm×3mm×13mm)
        translate([5, 5, 5])
            cube([3, 3, 13]);
        
        translate([l-8, 5, 5])
            cube([3, 3, 13]);
        
        translate([5, w-3, 5])
            cube([3, 3, 13]);
        
        translate([l-8, w-3, 5])
            cube([3, 3, 13]);
    }
}

carteFolder();