# Apache 2800 Eurorack Top Plate

A plate to use with the Apache 2800 case that can be used to make a small Eurorack case.

## Files

- `openscad/` - OpenSCAD source (.scad) and STLs.
- `freecad/` - FreeCAD source (.FCStd) and STLs. Same dimensions as the OpenSCAD version.

## OpenSCAD

1. Install OpenSCAD from <https://openscad.org> (free).
2. Open a .scad file and go to Customizer. Every adjustable setting is listed there with a description.
3. Change the values you need.
4. Press F6 to render, then File, Export, Export as STL.

## FreeCAD

1. Install FreeCAD 1.1 or newer from <https://www.freecad.org> (free).
2. Open a .FCStd file and double-click **Params** in the tree. Every adjustable value is listed there by name.
3. Change the values you need, then press Ctrl+R to recompute.
4. Select **Body** in the tree, then File, Export, and choose STL.

## STL Parts

Eurorack Plate
Brackets - You'll need two for this project.

- **Plate:** 213.8 x 149.8 x 3mm, R4 corners, and a 0.5 mm chamfer at the top edge. There is 38HP of module space available.
- **Strip Channels:** Opening for Eurorack threaded insert strips.
- **Bracket:** Three posts on pads that you will need to glue down to the bottom of the case. X-bracing between the posts. The posts take heat-set inserts. Use the short bracket if you want the plate to sink further into the case. Normal bracket is 70mm tall while the short one is 60mm.

## Hardware

- 4 x M3 heat-set inserts - Bracket holes are 4mm in diameter and 6.5mm deep.
- 4 x M3 x 8mm button-head screws.
- 2 x Eurorack threaded strip inserts. The ones I used were 5mm x 2mm x 84HP and were cut to fit. You'll want to make sure the first hole is 7.5mm from the end that slides into the channel so that the holes line up properly.
- An adhesive that bonds to polypropylene, such as Loctite Plastics Bonding System (681925). Many adhesives don't bond well to the plastic this case is made from. You'll want to scuff the area where the bottom feet pads are glued down to make for better adhesion.

## Printing

I used Bambu Labs PLA Tough+ filament with 20% infill and no supports. Make sure to print the top plate face down and the brackets upright.

## How it was made

I designed this case insert and wrote the OpenSCAD code while learning OpenSCAD, with an AI assistant (Claude) acting as a tutor. I relied on it for much of the math: positioning parts, working out offsets and clearances, and the angles for printing without supports. It explained concepts as we went, and in places supplied code that I then typed, checked and adapted. The design decisions, test prints and fit adjustments are mine. With this being my first major project in OpenSCAD, I learned quite a bit, and I feel more confident in being able to create future projects on my own.

## Disclaimer

This is an independent design. I am not affiliated with, endorsed by, or sponsored by Harbor Freight Tools. "Apache" and "Harbor Freight" are trademarks of their respective owners and are used here only to identify the case this design fits.

## License

Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). You may use, modify and share this design with credit. You may not sell it or use it commercially. Modified versions must be shared under the same license.
