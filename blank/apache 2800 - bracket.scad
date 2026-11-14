// Apache 2800 Eurorack Plate
// Copyright (c) 2026 William Chrapcynski
// Licensed under CC BY-NC-SA 4.0
// https://creativecommons.org/licenses/by-nc-sa/4.0/

/* [Bracket] */
// Bracket Height
bracket_height = 70;
// Post Depth
post_depth = 8;
// Post Width
post_width = 9;
// Post Spacing - Must match screw_position_y in the plate
post_spacing = 45; 
// Wall Draft - Sets angle / bracket lean
wall_draft = 3;
// Wall Draft Offset
draft_offset = bracket_height * tan(wall_draft);

/* [Pads] */
// Pad 
// Pad Length (X)
pad_length = 22;
// Pad Width (Y)
pad_width = 22;
// Pad Thickness
pad_thickness = 2.4;
// Tie Strip Width
tie_strip_width = 5;

/* [Gussets] */
// Guesset Size
gusset_size = 12;
// Gusset Thickness
gusset_thickness = 2.4;

/* [Braces] */
// Brace Thickness
brace_thickness = 3;
// Brace Width
brace_width = 6;
// Brace Top Gap
brace_top_gap = 6.5;

/* [Inserts] */
// Insert Hole Diameter
insert_hole_diameter = 4;
// Insert Hole Depth
insert_hole_depth = 6.5;

/* [Misc] */
// Rounding segments
$fn = 64;

difference() {
    union() {
        // Create Posts, Feet, and Gussets
        for(y = [-post_spacing, 0, post_spacing])
            translate([0, y, 0]) {
                hull() {
                    translate([0, -post_width / 2, 0])
                        cube([post_depth - draft_offset, post_width, 0.01]);
                    translate([0, -post_width / 2, bracket_height - 0.01])
                        cube([post_depth, post_width, 0.01]);
                }
                translate([post_depth - draft_offset - pad_length, -pad_width /2, 0])
                    cube([pad_length, pad_width, pad_thickness]);
//                translate([0, gusset_thickness / 2, pad_thickness])
                    rotate([90, 0, 0]) 
                        linear_extrude(height = gusset_thickness) 
                            polygon([[0, 0], [-gusset_size, 0], [0, gusset_size]]);
            }
            // Create Tie Strip
            translate([post_depth - draft_offset - (pad_length / 2) - (tie_strip_width / 2), -post_spacing, 0])
                cube([tie_strip_width, 2 * post_spacing, pad_thickness]);

        // Create Cross Bracing
        for(m = [0,1])
            mirror([0, m, 0]) {
                hull() {
                    translate([0.5, (post_width / 2) - 1, pad_thickness])
                        cube([brace_thickness, 1, brace_width]);
                    translate([0.5, post_spacing - (post_width / 2), bracket_height - brace_top_gap - brace_width])
                        cube([brace_thickness, 1, brace_width]);
                }

                hull() {
                    translate([0.5, post_spacing - (post_width / 2), pad_thickness])
                        cube([brace_thickness, 1, brace_width]);
                    translate([0.5, (post_width / 2) - 1, bracket_height - brace_top_gap - brace_width])
                        cube([brace_thickness, 1, brace_width]);
                }
        }
    }
    // Create Insert Holes
    for(sy = [-1, 1])
        translate([post_depth / 2, sy * post_spacing, bracket_height - insert_hole_depth])
            cylinder(d = insert_hole_diameter, h = insert_hole_depth + 1);
}