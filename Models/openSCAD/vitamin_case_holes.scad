
 triangle_width = 8;
 
 inside=[116,86,21];
 wall_width = 7;
 
module ttrs() {
    translate([14,70,2]){
        cube([10,40,9]);
    }
    translate([77,70,2]){
        cube([13,40,9]);
    }
    translate([19,20,-5]){
        cylinder(8,1,1);
    }
    translate([19,58,-5]){
        cylinder(8,1,1);
    }
    translate([94.25,21,-5]){
        cylinder(8,1,1);
    }
    
    translate([19,20,-5]){
        cylinder(1,4,4.25);
    }
    translate([19,58,-5]){
        cylinder(1,4,4.25);
    }
    translate([94,21,-5]){
        cylinder(1,4,4.25);
    }
    
}

module board() {
    difference() {
        cube(inside,false);
        cutout = [116,2,12];
        color("DarkTurquoise", 1.0) cube(cutout, false);
        
        corner = [8,8,12];
        translate([0,78,0]) color("DarkTurquoise", 1.0) cube(corner, false);
        translate([108,78,0]) color("DarkTurquoise", 1.0) cube(corner, false);
    }
}

module vit() {
   
     translate([wall_width,wall_width,5]){
         board();
         ttrs();
     }
}
module case() {
 sidewall=[wall_width*2,wall_width*2,4];
 outside=inside+sidewall;
 difference(){
     cube(outside, false);
     vit();
 }
 }
 module corner(rotation) {
     points_corner = [
        [0,0,0],
        [triangle_width,0,0],
        [0,triangle_width,0],
        [0,0,30],
        [triangle_width,0,30],
        [0,triangle_width,30]
     ];
     
         faces_corner = [
     [0,1,2],
     [0,4,1], [0,3,4],
     [1,4,5], [1,5,2],
     [2,5,3],[2,3,0],
     [3,5,4]
     ];
        rotate(rotation){
         translate([-1,-1,-1]){
    polyhedron(points_corner, faces_corner);
         }
     }
 }
 
 module top_edge(rotation) {
     points_corner = [
        [0,0,0],
        [triangle_width,0,0],
        [0,triangle_width,0],
        [0,0,200],
        [triangle_width,0,200],
        [0,triangle_width,200]
     ];
     
     faces_corner = [
     [0,1,2],
     [0,4,1], [0,3,4],
     [1,4,5], [1,5,2],
     [2,5,3],[2,3,0],
     [3,5,4]
     ];
        rotate([rotation, 90,0]){
         translate([-26,-1,-1]){
    polyhedron(points_corner, faces_corner);
         }
     }
 }
 
 module corners() {
     corner(0);
     translate([0,100,0]){
         corner(-90);
     }
     translate([130,100,0]){
         corner(180);
     }
     
     translate([130,0,0]){
         corner(90);
     }
 }
 
 module top() {
     top_edge(0);
     translate([0,100,0]){
             top_edge(90);
         }
     translate([130,0,0]){
             top_edge(-90);
         }
     translate([130,100,0]){
             top_edge(180);
         }
     }
mirror(){
 difference(){
     case();
     corners();
     top();
     translate([0,100,25]) {
     rotate([180,0,0]) {
         top();
     } 
 }
 }
    }
 //board();