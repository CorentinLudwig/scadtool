module u_shape(height, thickness, arm_distance, width) {
    union() {
        // Left arm
        cube([thickness, width, height]);
        
        // Right arm
        translate([arm_distance + thickness, 0, 0])
            cube([thickness, width, height]);
        
        // Base connecting the arms
        cube([arm_distance + 2*thickness, width, thickness]);
    }
}