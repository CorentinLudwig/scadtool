include <config.scad>

module FrameExtention(length = 12, width = 8, height = 1) {
    $fa = 1;
    $fs = 0.4;
    // script
    l = pad*2 + hole*length + space*(length - 1);
    w = pad*2 + hole*width + space*(width - 1);
    h = pad*2 + hole*height + space*(height - 1);
        
    difference() {
        cube([l, w, h]);
        translate([
            2*pad + hole,
            2*pad + hole,
            -pad
        ])
            cube([
                l - 4*pad - 2*hole,
                w - 4*pad - 2*hole,
                h + 2*pad
            ]);
        // Holes along width (Y-axis)
        for(i=[0:length-1])
            for(k=[0:height-1])
                translate([
                    pad + hole/2 + i*(space + hole),
                    w/2,
                    pad + hole/2 + k*(space + hole)
                ])
                    rotate([90, 0, 0])
                        translate([0, 0, -w/2-pad])
                            cylinder(h=w + 2*pad, r=hole/2);
        // Holes along length (X-axis)
        for(j=[0:width-1])
            for(k=[0:height-1])
                translate([
                    l/2,
                    pad + hole/2 + j*(space + hole),
                    pad + hole/2 + k*(space + hole)
                ])
                    rotate([0, 90, 0])
                        translate([0, 0, -l/2-pad])
                            cylinder(h=l + 2*pad, r=hole/2);
        // Holes on top and bottom faces
        for(i=[0:length-1])
            for(j=[0:width-1])
                    translate([
                        pad + hole/2 + i*(hole + space),
                        pad + hole/2 + j*(hole + space),
                        -pad
                    ])
                        cylinder(h=h + 2*pad, r=hole/2);
            
        for(i=[1:2:length-1])
            for(k=[0:height-1])
                translate([
                    pad + hole/2 + i*(space + hole),
                    w/2,
                    pad
                ])
            translate([0, -w/2-pad, 0])
                    #cube([space*2,hole,hole]);
    }
 }
%FrameExtention();