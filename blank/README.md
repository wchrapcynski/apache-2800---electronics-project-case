# Apache 2800 Blank Top Plate

A blank plate to use with the Apache 2800 case that can be used with various projects.
You'll want to remix this to fit your needs.

## SCAD file

1. Install OpenSCAD from <https://openscad.org> (free).
2. Open a .scad file and go to Customizer. Every adjustable setting is listed there with a description.
3. Change the values you need.
4. Press F6 to render, then File, Export, Export as STL.

## STL Parts

Blank Plate - Edit this as necessary.
Brackets - You'll need two for this project.

- **Plate:** 213.8 x 149.8 x 3mm, R4 corners, and a 0.5 mm chamfer at the top edge.
- **Stiffening:** A 3mm thick rib frame that's 6mm deep.
- **Bracket:** Three posts on pads that you will need to glue down to the bottom of the case. X-bracing between the posts. The posts take heat-set inserts. Use the short bracket if you want the plate to sink further into the case. Normal bracket is 70mm tall while the short one is 60mm.

## Hardware

- 4 x M3 heat-set inserts - Bracket holes are 4mm in diameter and 6.5mm deep.
- 4 x M3 x 8mm button-head screws.
- An adhesive that bonds to polypropylene such as Loctite Plastics Bonding System (681925). A lot of adhesives might not work well on the plastic this case is made from. You'll want to scuff the area where the pads are glued down to make for better adhesion.

## Printing

I used Bambu Labs PLA Tough+ filament with 20% infill and no supports. Make sure to print the top plate face down and the brackets upright.

## How it was made

I designed this case insert and wrote the OpenSCAD code while learning OpenSCAD, with an AI assistant (Claude) acting as a tutor. I relied on it for much of the math: positioning parts, working out offsets and clearances, and the angles for printing without supports. It explained concepts as we went, and in places supplied code that I then typed, checked and adapted. The design decisions, test prints and fit adjustments are mine. With this being my first major project in OpenSCAD, I learned quite a bit, and I feel more confident in being able to create future projects on my own.

## Disclaimer

This is an independent design. I am not affiliated with, endorsed by, or sponsored by Harbor Freight Tools. "Apache" and "Harbor Freight" are trademarks of their respective owners and are used here only to identify the case this design fits.

## License

Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). You may use, modify and share this design with credit. You may not sell it or use it commercially. Modified versions must be shared under the same license.
