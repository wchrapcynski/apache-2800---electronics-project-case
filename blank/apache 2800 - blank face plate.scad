// Apache 2800 Eurorack Plate
// Copyright (c) 2026 William Chrapcynski
// Licensed under CC BY-NC-SA 4.0
// https://creativecommons.org/licenses/by-nc-sa/4.0/

/* [Plate] */
// Plate length (X)
plate_length = 213.8;
// Plate width (Y)
plate_width = 149.8;
// Plate thickness
plate_thickness = 3;
// Corner radius
plate_corner_radius = 4;
// Plate Chamfer
plate_chamfer = 0.5;

/* [Ribs] */
// Rib Length (X)
rib_length = 194.4;
// Rib Width (Y)
rib_width = 133.8;
// Rib Depth
rib_depth = 6;
// Rib Wall Thickness
rib_wall_thickness = 3;

/* [Screws - This is position for first screw at the top right] */
// Screw Position (X)
screw_position_x = 101.7;
// Screw Position (Y)
screw_position_y = 45;
// Screw Hole Diameter
screw_hole_diameter = 3.4;
// Enable Countersink
enable_countersink = false;
// Countersink Diameter
countersink_diameter = 6.2;
// Countersink Depth
countersink_depth = (countersink_diameter - screw_hole_diameter) / 2;

/* [Misc] */
// Rounding segments - For calculating purposes only
$fn = 64;

// Create Plate
difference() {
    hull() {
        linear_extrude(height = plate_thickness - plate_chamfer) 
            offset(r = plate_corner_radius) 
                square([plate_length - (plate_corner_radius * 2), plate_width - (plate_corner_radius * 2)], center = true);
        linear_extrude(height = plate_thickness) 
            offset(r = plate_corner_radius - plate_chamfer) 
                square([plate_length - (plate_corner_radius * 2), plate_width - (plate_corner_radius * 2)], center = true);
    }
    for(sx = [-1, 1], sy = [-1, 1]) 
        translate([screw_position_x * sx, screw_position_y * sy, 0]) {
            translate([0, 0, -1]) 
                cylinder(d = screw_hole_diameter, h = plate_thickness + 2);
            if(enable_countersink) 
                translate([0, 0, plate_thickness - countersink_depth]) 
                    cylinder(h = countersink_depth + 1, d1 = screw_hole_diameter, d2 = countersink_diameter + 2);
        }
}

// Create Framing Ribs
difference() {
    translate([0, 0, -rib_depth / 2]) 
        cube([rib_length, rib_width, rib_depth], center = true);
    translate([0, 0, -rib_depth / 2]) 
        cube([rib_length - (2 * rib_wall_thickness), rib_width - (2 * rib_wall_thickness), rib_depth + 2], center = true);
}

