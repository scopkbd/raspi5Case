
include <const.scad>

difference() {
	union() {
		difference() {
			difference() {
				difference() {  // 枠
					linear_extrude(height = h1) {  // 枠外側
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
					}
					translate([0, 0, -0.5]) {
						linear_extrude(height = h1 + 1) {  // 枠内側
							hull() {
								translate(v = ptA) {
									circle($fn = 16, r = r1);
								}
								translate(v = ptB) {
									circle($fn = 16, r = r1);
								}
								translate(v = ptC) {
									circle($fn = 16, r = r1);
								}
								translate(v = ptD) {
									circle($fn = 16, r = r1);
								}
							}
						}
					}
				}
				union() {  // 穴
					translate([0, 50, 2]) {
						cube([60, 50, 30]);  // 穴USB部分
					}
					translate([2.5, -10, 2]) {
						cube([55, 15, 10]);  // 穴SD部分
					}
					translate([50, 2, 2]) {
						cube([20, 35, 10]);  // 穴HDMI部分
					}
				}
			}
			color([0, 0, 1]) union() {
				temp = 4;
				translate([ptA[0] - r1 -d4_min - temp, -5, h4_dent]) {
					cube( [temp, 100, d4_dent + 0.001]);
				}
				translate([ptA[0] - r1 -d4_mid - temp + 0.2, -5, h4_dent + h4_protrusion]) {
					cube([temp, 100, h4_protrusion + 0.001]);
				}

				translate([ptB[0] + r1 + d4_min, -5, h4_dent]) {
					cube([temp, 100, d4_dent + 0.001]);
				}
				translate([ptB[0] + r1 + d4_mid - 0.2, -5, h4_dent + h4_protrusion]) {
					cube([temp, 100, h4_protrusion + 0.001]);
				}
			}
		}
		linear_extrude(height = d2) {  // 底面
			hull() {
				translate(v = ptA) {
					circle($fn = 16, r = r1);
				}
				translate(v = ptB) {
					circle($fn = 16, r = r1);
				}
				translate(v = ptC) {
					circle($fn = 16, r = r1);
				}
				translate(v = ptD) {
					circle($fn = 16, r = r1);
				}
			}
		}
		union () {  // 足
			translate(v = [5.50, 5.50, 2.00]) {
				cylinder($fn = 16, center = false, h = 6.00, r1 = r1, r2 = 1);
				translate([0, 0, 2]) {
					cube([5, 5, 4], center = true);
				}
			}
			translate(v = [5.50, 63.50, 2.00]) {
				cylinder($fn = 16, center = false, h = 6.00, r1 = r1, r2 = 1);
				translate([0, 0, 2]) {
					cube([5, 5, 4], center = true);
				}
			}
			translate(v = [54.50, 5.50, 2.00]) {
				cylinder($fn = 16, center = false, h = 6.00, r1 = r1, r2 = 1);
				translate([0, 0, 2]) {
					cube([5, 5, 4], center = true);
				}
			}
			translate(v = [54.50, 63.50, 2.00]) {
				cylinder($fn = 16, center = false, h = 6.00, r1 = r1, r2 = 1);
				translate([0, 0, 2]) {
					cube([5, 5, 4], center = true);
				}
			}
		}
	}
	union() {  // ケースと蓋のつっかかり部分. ケース側
		translate([ptC[0], ptC[1], h4_dent]) {
			cube([5, 5, 4]);  // 底面
		}
		translate([ptD[0]-5, ptD[1], h4_dent]) {
			cube([5, 5, 4]);  // 蓋
		}
	}
}

