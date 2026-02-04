use <frame.scad>
use <couvercleLLLC.scad>
use <plaquehole.scad>
use <cartefolder.scad>

length = 22;
with = 15;
height = 4;

// hight moteur 28
Frame(length,with, height);

plate_L = 171+5;
plate_W = 115+5;

translate([0,0,-4.5])
    PlateHoles(plate_L,plate_W,5);
