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

/* [Hidden] */
// Standard width of 1 HP
hp = 5.08;
/* [Eurorack] */
// Row Width In HP
row_hp = 38;
// Opening Height (Y) 
opening_height = 109.5;

/* [Ribs] */
// Rib Depth - Below the plate
rib_depth = 6;
// Rail Spacing - Standard 3U distance
rail_spacing = 122.5;
// Long Rib Width (Y)
long_rib_width = 15.6;
// End Rib Thickness (X)
end_rib_thickness = 3;
// Gap between ribs and opening
end_rib_gap = 0.5;
// Bracket Post Width - Must match the bracket file
post_width = 9;
// Clearance around each bracket
post_clearance = 0.5;

/* [Strip Channels] */
// Strip Width
strip_width = 5;
// Strip Thickness
strip_thickness = 2;
// Strip Play Width
strip_play_width = 0.6;
// Strip Play Thickness
strip_play_thickness = 0.4;
// Cover Thickness
cover_thickness = 1.5;
// Screw Slot (M3 Clearance)
slot_width = 3.4;
// Flat Lip - Each side that holds the strip
ledge_width = 0.6;
// Depth of the sloped roof under the strip
taper_depth = 0.55;

/* [Misc] */
// Rounding segments - For calculating purposes only
$fn = 64;

// Create Plate
difference() {
    union() {
        hull() {
            linear_extrude(height = plate_thickness - plate_chamfer) 
                offset(r = plate_corner_radius) 
                    square([plate_length - (plate_corner_radius * 2), plate_width - (plate_corner_radius * 2)], center = true);
            linear_extrude(height = plate_thickness) 
                offset(r = plate_corner_radius - plate_chamfer) 
                    square([plate_length - (plate_corner_radius * 2), plate_width - (plate_corner_radius * 2)], center = true);
        }
        // Long Rib
        for(sy = [-1, 1])
            translate([-(plate_length / 2 - plate_corner_radius), sy * rail_spacing / 2 - long_rib_width / 2, -rib_depth])
                cube([plate_length - 2 * plate_corner_radius, long_rib_width, rib_depth + 1]);
        // End Rib
        for(sx = [-1, 1])
            translate([sx * (row_hp * hp  / 2 + end_rib_gap + end_rib_thickness / 2), 0, -rib_depth / 2 + 0.5])
                difference(){
                    cube([end_rib_thickness, rail_spacing - long_rib_width + 1, rib_depth + 1], center = true);
                    for(y = [-screw_position_y, 0, screw_position_y])
                        translate([0, y, 0])
                            cube([end_rib_thickness + 2, post_width + 2 * post_clearance, rib_depth + 3], center = true);
                }
                
    }
    // Screw Holes
    for(sx = [-1, 1], sy = [-1, 1]) 
        translate([screw_position_x * sx, screw_position_y * sy, 0]) {
            translate([0, 0, -1]) 
                cylinder(d = screw_hole_diameter, h = plate_thickness + 2);
            if(enable_countersink) 
                translate([0, 0, plate_thickness - countersink_depth]) 
                    cylinder(h = countersink_depth + 1, d1 = screw_hole_diameter, d2 = countersink_diameter + 2);
        }
    // Main Cutout
    translate([(-row_hp * hp) / 2, -opening_height / 2, -rib_depth - 1])
        cube([row_hp * hp, opening_height, plate_thickness + rib_depth + 2]);
    
    // Strip Cutout
    for (sy = [1, -1]) {
        translate([(-row_hp * hp)  / 2, (sy * rail_spacing) / 2 - (strip_width + strip_play_width) / 2, plate_thickness - cover_thickness - (strip_thickness + strip_play_thickness)])
            cube([(row_hp * hp) / 2 + (plate_length / 2) + 1, strip_width + strip_play_width, strip_thickness + strip_play_thickness]);
        // Screw Cutout - opening for screws
        translate([(-row_hp * hp) / 2 + 1, (sy * rail_spacing) / 2 - slot_width / 2, plate_thickness - cover_thickness - 1])
            cube([(row_hp * hp) - 2, slot_width, cover_thickness + 2]);
        // Sloped Roof
        hull() {
            translate([(-row_hp * hp) / 2, (sy * rail_spacing) / 2 - (strip_width + strip_play_width - 2 * ledge_width) / 2, plate_thickness - cover_thickness - (strip_thickness + strip_play_thickness) - 0.01])
                cube([(row_hp * hp) / 2 + plate_length / 2 + 1, strip_width + strip_play_width - 2 * ledge_width, 0.51]);
            translate([(-row_hp * hp) /2, (sy * rail_spacing) / 2 - slot_width / 2, plate_thickness - cover_thickness - (strip_thickness + strip_play_thickness) - taper_depth])
                cube([(row_hp * hp) / 2 + plate_length / 2 + 1, slot_width, 0.01]);
        }
        // Bottom Slot - Room for Screw Tips
        translate([(-row_hp * hp) / 2 + 1, (sy * rail_spacing) / 2 - slot_width / 2, -rib_depth - 1])
            cube([(row_hp * hp) - 2, slot_width, rib_depth + 1 + plate_thickness - cover_thickness - (strip_thickness + strip_play_thickness) -taper_depth + 0.5]);
    }
}

