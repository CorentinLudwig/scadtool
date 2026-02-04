use <frame.scad>
use <platestm.scad>
use <cartefolder.scad>
length = 22;
with = 15;
height = 3;

// hight moteur 28
Frame(length,with, height); // hight 8



plate_L = 171+5;
plate_W = 115+5;

translate([0,0,-4.5])
    
    PlateStm(plate_L,plate_W,5);



carte_L = 112; 
carte_W = 67; 

carte_real_L = carte_L + 5;
carte_real_W = carte_W + 5; 


translate([
    plate_L/2,  // Centre du plate
    plate_W/2-2.5,  // Centre du plate
    -4.5
]){
    carteFolder();
}