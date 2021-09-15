color("green"){
difference(){
difference(){
difference(){
union(){
rotate([ 45, -45, 45 ]){
hull(){
rotate(a = 45, v = [5, 5, 5]){
translate([ 5, 5, 5 ]){
translate([ 5, 5, 5 ]){
color("red"){
cube([ 5.100000e+00, 5.100000e+00, 5.100000e+00 ]);
}
}
}
}
cube([ 10, 10, 10 ]);
}
}
translate([ 5, 0, 20 ]){
sphere(d=10,  $fn = 35);
}
}
translate([ 2.030504e-01, 8.127286e+00, 1.257848e+01 ]){
sphere(d=7,  $fn = 35);
}
}
translate([ -7.969322e+00, -2.182905e+00, 1.092332e+00 ]){
sphere(d=7,  $fn = 35);
}
}
rotate([ 0, 10, 30 ]){
color("red"){
cylinder(d1=5, d2=2, h=70, center=true);
}
}
}
} 
