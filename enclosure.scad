thickness=0.25;
outerlength=9;
outerheight=7;
windowlength=6;
windowheight=3+3/8;
screenlength=7+5/8;
screenheight=4+3/8;
bitscopeheight=11/16;
bitscopewidth=2+5/8;
$fn=100;
Front();
translate([outerlength,0]) {ScreenBack();}
translate([0,outerheight+1]) {Back();}
translate([-outerlength-1,0]) {Side();}
translate([0,-outerheight-1]) {Bottom();}
module Front() {
    union() {
        union() {
            difference(){
                square([outerlength,outerheight],center=true);
                square([outerlength-2*thickness,outerheight-2*thickness],center=true);
                }   
            translate([0,0.25]) {square([windowlength,windowheight],center=true);}
        }
    }
    translate([0,-(outerheight/2-thickness)+bitscopeheight/2+.05]){square([bitscopewidth,bitscopeheight],center=true);}
}
module ScreenBack() {
    union() {
        difference(){
            square([(outerlength-2*thickness),(outerheight-2*thickness-2*bitscopeheight)],center=true);
            //translate([0,.25]) {  
                square([screenlength+.1,screenheight+.1],center=true);
                //}
            }
        //translate([0,(outerheight-4*thickness-windowheight)/4]) {      
        square([screenlength-.5,screenheight-.25],center=true);
        //} 
    }
}
module Back() {
    storelength=3;
    storeheight=2.5;
    union() {
        difference(){
            square([outerlength,outerheight-.5*thickness],center=true);
            translate([0,-thickness/2+.01]) {square([outerlength-2*thickness,outerheight-1.5*thickness],center=true);}      
        }
        translate([0,.5  ]) union() {
            translate([-(storelength/2+.5),0 ]){square([storelength,storeheight],center=true);}
            translate([(storelength/2+.5),0 ]){circle(storeheight/2);}
        }
   } 
}
module Side() {
    polygon([[-(outerheight-thickness)/2,0],[0,(outerheight-thickness)*0.87],[(outerheight-thickness)/2,0]],[[2,1,0]]);
}
module Bottom() {
    square([(outerlength-2*thickness),(outerheight-thickness)],center=true);
}