include <config.scad>

// Parameters
u_thickness = 5; 
u_height = 25+u_thickness;
arm_distance = 45+u_thickness*2;
u_width = 8;
border_length = 15;
length = 96;

module u_shape_hole(height, thickness, arm_distance, width, border_len, border_thick) {
    $fa = 1;
    $fs = 0.4;
    difference() {
        union() {
            // arms
            cube([thickness, width, height]);
            translate([arm_distance + thickness, 0, 0])
                cube([thickness, width, height]);
            
            // Base connecting the arms
            cube([arm_distance + 2*thickness, width, thickness]);
            
            // borders
            translate([-border_len, 0, height - border_thick])
                cube([border_len + thickness, width, border_thick]);
            translate([arm_distance + thickness, 0, height - border_thick])
                cube([border_len + thickness, width, border_thick]);
        }
        
        // Screw holes
        translate([
            -border_len/2,
            width/2,
            height
        ])
            translate([0, 0, -height/2 - pad])
                cylinder(h=height + 2*pad, r=hole/2);
        translate([
            arm_distance + 2*thickness + border_len/2,
            width/2,
            height
        ])
            translate([0, 0, -height/2 - pad])
                cylinder(h=height + 2*pad, r=hole/2);
    }
}

module batterieHolder(height=25+5, thickness=5, arm_distance=42+5*2, width=8, length=15){
    
    border_len = 7;
    border_thick = 3;
    
    // Front U shape
    u_shape_hole(height, thickness, arm_distance, width, border_len, border_thick);
    
    // Bottom plate connecting front and back
    cube([arm_distance + 2*thickness, length, thickness]);
    
    // Back U shape
    translate([0, length - width, 0])
        u_shape_hole(height, thickness, arm_distance, width, border_len, border_thick);
    
}

batterieHolder(u_height, u_thickness, arm_distance, u_width, 90);
