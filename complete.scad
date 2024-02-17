/*
Reinforcement by Sven Minio is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
Based on a work at https://github.com/k37z3r/Reinforcement.
*/
tolerance=0.1;
a=385;
b=176;
gamma=90;
maxangle=180;
screwhole=4;
c=sqrt(pow(a,2)-(2*a*b*cos(gamma))+pow(b,2));
angle=(maxangle-gamma-acos((-0.5*pow(a,2)+0.5*pow(b,2)+0.5*pow(c,2))/(b*sqrt(pow(a,2)-(2*a*b*cos(gamma))+pow(b,2)))));
module left_front_bottom(){
    difference(){
        union(){
            cube([40,40,4]);
            hull(){
                translate([4,0,4])rotate([0,270,0])linear_extrude(4)polygon([
                    [0,0],
                    [20,20],
                    [0,20]
                ]);
                translate([0,30,20])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                translate([0,20,4])cube([4,20,15]);
            }
            translate([18,0,0])hull(){
                translate([4,0,4])rotate([0,270,0])linear_extrude(4)polygon([
                    [0,0],
                    [20,20],
                    [0,20]
                ]);
                translate([0,30,20])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                translate([0,20,4])cube([4,20,15]);
            }
        }
        translate([-.5,30,20])rotate([0,90,0])cylinder(h=23, d=screwhole+2*tolerance, $fn=32);
        translate([10,10,-.5])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
        translate([30,10,-.5])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
        translate([10,30,-.5])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
        translate([30,30,-.5])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
    }
}
module left_front_top(){
    difference(){
        union(){
            cube([40,4,20]);
            translate([0,-20,0])cube([4,20,20]);
            hull(){
                translate([0,-30,0])rotate([0,90,0])cylinder(h=4,d=20,$fn=32);
                translate([0,-20,10])rotate([0,90,0])cylinder(h=4,d=20,$fn=32);
            }
            translate([18,0,0])union(){
                translate([0,-20,0])cube([4,20,20]);
                hull(){
                    translate([0,-30,0])rotate([0,90,0])cylinder(h=4,d=20,$fn=32);
                    translate([0,-20,10])rotate([0,90,0])cylinder(h=4,d=20,$fn=32);
                }
            }
        }
        translate([-.5,-30,0])rotate([0,90,0])cylinder(h=23, d=screwhole+2*tolerance, $fn=32);
        translate([10,4.5,10])rotate([90,0,0])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
        translate([30,4.5,10])rotate([90,0,0])cylinder(h=5, d=screwhole+2*tolerance, $fn=32);
    }
}
module left_middle_bottom(){
    union(){
        difference(){
            union(){
                translate([4+tolerance,0,0])rotate([0,90,0])difference(){
                    cylinder(h=14-2*tolerance,d=20,$fn=64);
                    translate([0,0,-0.1])cylinder(h=14,d=screwhole+2*tolerance,$fn=32);
                }
                difference(){
                    translate([0,-10,0])cube([22,20,c/2-10]);
                    translate([-.5,0,0])rotate([0,90,0])cylinder(h=23,d=screwhole+2*tolerance,$fn=32);
                }
            }
            rotate([angle,0,0])translate([0,-(30*1.02),-20])scale(1.02)hull(){
                translate([4,0,4])rotate([0,270,0])linear_extrude(4)polygon([
                    [0,0],
                    [20,20],
                    [0,20]
                ]);
                translate([0,30,20])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                translate([0,20,4])cube([4,20,15]);
            }
            rotate([angle,0,0])translate([17.92,-(30*1.02),-20])scale(1.02)hull(){
                translate([4,0,4])rotate([0,270,0])linear_extrude(4)polygon([
                    [0,0],
                    [20,20],
                    [0,20]
                ]);
                translate([0,30,20])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                translate([0,20,4])cube([4,20,15]);
            }
        }
        difference(){
            translate([5.5+tolerance/2,-5.5+tolerance/2,c/2-10])cube([11-tolerance,11-tolerance,20-tolerance]);
            translate([-1,0,c/2])rotate([0,90,0])cylinder(h=24,d=screwhole+2*tolerance,$fn=32);
        }
    }
}
module left_middle_top(){
    union(){
        difference(){
            translate([0,0,2])union(){
                translate([4+tolerance,0,c/2+10])rotate([0,90,0])difference(){
                    cylinder(h=14-2*tolerance,d=20,$fn=32);
                    translate([0,0,-0.1])cylinder(h=14,d=screwhole+2*tolerance,$fn=32);
                }
                difference(){
                    translate([0,-10,0])cube([22,20,c/2+10]);
                    translate([-0.1,-0,c/2+10])rotate([0,90,0])cylinder(h=54,d=screwhole+2*tolerance,$fn=32);
                    translate([-0.1,-0,10])rotate([0,90,0])cylinder(h=54,d=screwhole+2*tolerance,$fn=32);
                    translate([5.5+(tolerance/2),-5.5+tolerance/2,-tolerance])cube([11+tolerance,11+tolerance,20+tolerance]);
                }
            }
            rotate([angle,0,0])translate([-.1,123.5,c/2-8.5])scale(1.02)union(){
                hull(){
                    translate([0,-30,0])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                    translate([0,-20,10])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                }
                translate([18,0,0])union(){
                    translate([0,-20,0])cube([4,20,20]);
                    hull(){
                        translate([0,-30,0])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                        translate([0,-20,10])rotate([0,90,0])cylinder(h=4,d=20,$fn=64);
                    }
                }
            }
        }
    }
}
module right_front_bottom(){
    mirror([1,0,0])left_front_bottom();
}
module right_front_top(){
    mirror([1,0,0])left_front_top();
}
module right_middle_bottom(){
    left_middle_bottom();
}
module right_middle_top(){
    left_middle_top();
}
left_front_bottom();
translate([320,0,0])right_front_bottom();
translate([0,236,405])left_front_top();
translate([320,236,405])right_front_top();
translate([0,30,20])rotate([-angle,0,0])left_middle_bottom();
translate([298,30,20])rotate([-angle,0,0])right_middle_bottom();
rotate([-angle,0,0])translate([0,19,c/2+18.7])left_middle_top();
rotate([-angle,0,0])translate([298,19,c/2+18.7])right_middle_top();
