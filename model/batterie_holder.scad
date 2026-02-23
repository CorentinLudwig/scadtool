include <config.scad>
use <plaquehole.scad>
use <battery.scad>

translate([bat_l/2,-bat_w/2,-bat_h/2])
    mirror([1,0,0])
    %Battery();


module batterie_holder() {
    $fa = 1;
    $fs = 0.4;
    
    thickness = 4;
    marge_h = 5;
    w = 23; // extention to the plaque 23
    marge_w = 2;
    marge_l=7;
    
    length = bat_l+marge_l+thickness;
    width = bat_w+marge_w*2+thickness*2;
    heigth = bat_h+marge_h+thickness;
    
    difference(){
        union(){
            translate([0,0,(heigth - thickness)/2])
                PlateHoles(
                    bat_l+marge_l+thickness,
                    bat_w+w*2,
                    thickness,
                    true);
            cube([
                length,
                width,
                heigth
            ], true);
        }
        
        translate([thickness,0,thickness/2+1])
            cube([
                bat_l+marge_l+ 0.01,
                bat_w+marge_w*2,
                bat_h+marge_h+1
                ], true);
        #translate([length/2 - marge_l/2,-width,5])
            rotate([-90,0,0])
                cylinder(h=width*2, r=hole/2+0.1);
     
    }
}


batterie_holder();