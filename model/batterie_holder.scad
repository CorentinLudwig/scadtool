include <config.scad>
use <plaquehole.scad>
use <battery.scad>

translate([7.9+3,7.9,5])
%Battery();


module batterie_holder() {
    size_colon = 7.9;
    thickness = 5;
    marge = 5;
    difference(){
        union(){
            translate([
            (bat_l+3+size_colon*2)/2,
            (bat_w+size_colon*2)/2,
            bat_h+thickness/2+marge
            ])
                PlateHoles(
                bat_l+3+size_colon*2,
                90, // a verifier
                thickness,
                true
            );
            cube([
                bat_l+3+size_colon*2,
                bat_w+size_colon*2,
                bat_h+thickness+marge
            ]);
            }
        translate([-1,size_colon,thickness])
            cube([bat_l+3+2,bat_w,bat_h+marge+1]);
        translate([hole+pad,hole-5,14+thickness])
            rotate([-90,0,0])
                cylinder(h=bat_w+size_colon*2+5, r=hole+0.1);

     }
}


batterie_holder();