// memory to store bark floats
float[] bark24 = new float[24];
/*
0 // 50
 1	50 | 2	150 | 3	250	
 4	350	| 5	450 | 6	570	
 7	700	| 8	840 | 9	1000
 10	1170 | 11 1370 | 12	1600
 13	1850 | 14 2150 | 15	2500
 16	2900 | 17 3400 | 18	4000
 19	4800 | 20 5800 | 21	7000
 22	8500 | 23 10500 | 24 13500
 */

// bark easing
float[] barkEasing = new float[24];

void barkInit() {
  for (int i = 0; i <= 23; i++) {
    barkEasing[i] = 0.05;
  }
}
