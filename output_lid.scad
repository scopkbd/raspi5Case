
include <const.scad>

union() {

	intersection() {  // 蓋凹凸
		translate([0, 0, 10]) {
			color([0, 0, 1]) union() {
				temp = 4;
				translate([ptA[0] - r1 -d4_min - temp, -5, h4_dent]) {
					cube( [temp, 100, d4_dent -0.2]);
				}
				translate([ptA[0] - r1 -d4_mid - temp, -5, h4_dent + h4_protrusion - 1]) {
					cube([temp, 100, h4_protrusion + 1]);
				}
				translate([ptB[0] + r1 + d4_min, -5, h4_dent]) {
					cube([temp, 100, d4_dent -0.2]);
				}
				translate([ptB[0] + r1 + d4_mid, -5, h4_dent + h4_protrusion - 1]) {
					cube([temp, 100, h4_protrusion + 1]);
				}
			}
		};
		translate([0, 0, 31]) {
			linear_extrude(height = 4) {  // 枠外側
				hull() {
					translate(v = [ptA[0] - d1, ptA[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptB[0] + d1, ptB[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptC[0] + d1, ptC[1] + d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptD[0] - d1, ptD[1] + d1]) {
						circle($fn = 16, r = r1);
					}
				}
			};
		};
	};

	difference() {  // 蓋のスリット
		translate([0, 0, 33]) {  // 蓋上側
			linear_extrude(height = 2) {  // 枠外側
				hull() {
					translate(v = [ptA[0] - d1, ptA[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptB[0] + d1, ptB[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptC[0] + d1, ptC[1] + d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptD[0] - d1, ptD[1] + d1]) {
						circle($fn = 16, r = r1);
					}
				}
			};
		};
		for (i = [0 : 6 : 27]) {  // 蓋のスリット
			translate([10 + i, 30, 30]) {
				cube([3, 35, 10]);
			};
		};
	};


	intersection() {  // ケースと蓋のつっかかり部分. 蓋側
		translate([0, 0, 9]) {
			union() {
				translate([ptC[0]+1, ptC[1], h4_dent]) {
					cube([5, 5, 4]);  // 底面
				};
				translate([ptD[0]-6, ptD[1], h4_dent]) {
					cube([5, 5, 4]);  // 蓋
				};
			}
		}
		translate([0, 0, 31]) {  // 蓋上側
			linear_extrude(height = 2) {  // 枠外側
				hull() {
					translate(v = [ptA[0] - d1, ptA[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptB[0] + d1, ptB[1] - d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptC[0] + d1, ptC[1] + d1]) {
						circle($fn = 16, r = r1);
					}
					translate(v = [ptD[0] - d1, ptD[1] + d1]) {
						circle($fn = 16, r = r1);
					}
				}
			};
		};
	}
}
