rotate(45){
scale ([ 3, 1, 1 ]){
mirror([ 1, 0, 0 ]){
translate([ -30, -40, 0 ]){
union(){
difference(){
union(){
color("red"){
}
translate([ 0, 0, 25 ]){
sphere(d=50);
}
}
color("greed"){
translate([ 0, 0, 12 ]){
cube([ 30, 40, 25 ]);
}
}
}
color("blue"){
translate([ -30, -40, 0 ]){
color("greed"){
translate([ 0, 0, 12 ]){
cube([ 30, 40, 25 ]);
}
}
}
}
}
}
}
}
}