include <config.scad>;


module patte_u(height = 40.6, width = 19, length = 30, thickness = 5) {
    $fa = 1;
    $fs = 0.4;
    
    // Calculate holes for back plate (similar to moteurHolder)
    available_W = width - 2*pad - hole;
    available_H = height - 2*pad - hole;
    
    num_width = floor(available_W / (hole + space)) + 1;
    num_height = floor(available_H / (hole + space)) + 1;
    
    
    difference(){
        union(){
            cube([length,width,height+thickness*2]);
            translate([length,width/2,0]){
                cylinder(height+thickness*2,r=width/2);
                
            }
                }
        translate([thickness,-1,thickness])
            cube([length+10,width+10,height]);
        #translate([length,width/2,0])
            cylinder(height+thickness*2+10,r=(4.3+0.1));
        translate([length,width/2-3,height])
                cube([10,6,thickness*2+5]);
        
        // Grid of holes through the back plate
        translate([0,2,0])
            for(i = [0:num_width-1])
                for(j = [0:num_height-1])
                    translate([
                        -1,
                        pad + hole/2 + i*(hole + space),
                        thickness + pad + hole/2 + j*(hole + space)
                    ])
                        rotate([0, 90, 0])
                            cylinder(h = thickness + 2, r = hole/2);
        }
 
}

patte_u();