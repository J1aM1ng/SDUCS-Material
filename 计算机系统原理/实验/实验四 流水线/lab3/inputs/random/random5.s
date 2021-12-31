.text
lui $a0, 0x1000
 li $t0, 0x12345678
 sw $t0, 0($a0)
 li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0
li $t5, 0
li $t6, 0
li $t7, 0
 xor   $t3 , $t5 , $t6 
 andi   $t4 , $t5 , 3984756162 
 mult  $t2 , $t4 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t0 
 sb   $t5 , 0($a0) 
 multu  $t7 , $t5 
 add $0, $0, $0
 mflo  $t1 
 lw   $t3 , 0($a0) 
 sb   $t5 , 0($a0) 
 ori   $t5 , $t7 , 330030376 
 addu   $t0 , $t7 , $t6 
 xor   $t1 , $t3 , $t4 
 addiu   $t7 , $t3 , 2998299078 
 sh   $t4 , 0($a0) 
 xor   $t3 , $t1 , $t0 
 sh   $t1 , 0($a0) 
 lhu   $t2 , 0($a0) 
 nor   $t5 , $t0 , $t5 
 addu   $t0 , $t1 , $t7 
 sb   $t4 , 0($a0) 
 sw   $t5 , 0($a0) 
 andi   $t5 , $t1 , 926074617 
 andi   $t1 , $t6 , 3640498292 
 addiu   $t2 , $t7 , 4199597874 
 or   $t6 , $t2 , $t1 
 mult  $t7 , $t0 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t0 
 sb   $t2 , 0($a0) 
 sltiu   $t7 , $t0 , 1185599330 
 xor   $t0 , $t6 , $t6 
 xor   $t5 , $t6 , $t2 
 addiu   $t5 , $t6 , 2194829217 
 or   $t1 , $t1 , $t0 
 sh   $t1 , 0($a0) 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 sw   $t1 , 0($a0) 
 sb   $t7 , 0($a0) 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t0 
 andi   $t6 , $t0 , 2802480777 
 addu   $t6 , $t4 , $t7 
 ori   $t2 , $t1 , 2352022396 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t4 
 sh   $t0 , 0($a0) 
 sb   $t7 , 0($a0) 
 lhu   $t0 , 0($a0) 
 mult  $t4 , $t0 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t4 
 or   $t6 , $t1 , $t3 
 and   $t4 , $t5 , $t3 
 sh   $t0 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t1 
 xor   $t4 , $t6 , $t6 
 nor   $t5 , $t2 , $t1 
 mult  $t1 , $t5 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t5 
 mult  $t2 , $t6 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t6 
 and   $t7 , $t2 , $t4 
 sltiu   $t5 , $t1 , 2778536259 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t0 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t4 
 addu   $t6 , $t3 , $t6 
 xor   $t4 , $t1 , $t5 
 mult  $t7 , $t4 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t5 
 subu   $t3 , $t4 , $t0 
 addiu   $t4 , $t4 , 1678956169 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t3 
 subu   $t6 , $t7 , $t4 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t6 
 xori   $t5 , $t2 , 1038639130 
 xor   $t5 , $t1 , $t3 
 sh   $t4 , 0($a0) 
 addu   $t5 , $t6 , $t5 
 subu   $t5 , $t3 , $t6 
 lh   $t6 , 0($a0) 
 xori   $t4 , $t1 , 1586962438 
 and   $t5 , $t7 , $t4 
 addiu   $t6 , $t2 , 1245200055 
 lh   $t1 , 0($a0) 
 sb   $t6 , 0($a0) 
 nor   $t3 , $t1 , $t3 
 sh   $t6 , 0($a0) 
 multu  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 ori   $t0 , $t1 , 442910798 
 addu   $t0 , $t0 , $t5 
 mult  $t0 , $t6 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t6 
 subu   $t4 , $t4 , $t2 
 sb   $t5 , 0($a0) 
 nor   $t3 , $t0 , $t6 
 sh   $t7 , 0($a0) 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t3 
 nor   $t4 , $t1 , $t0 
 andi   $t0 , $t3 , 3758352090 
 xor   $t4 , $t5 , $t6 
 mult  $t6 , $t3 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t4 
 nor   $t6 , $t1 , $t2 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t3 
 lb   $t7 , 0($a0) 
 xori   $t6 , $t3 , 2659983346 
 and   $t1 , $t0 , $t3 
 and   $t5 , $t4 , $t7 
 sltiu   $t0 , $t5 , 2651877226 
 xori   $t5 , $t7 , 3879083167 
 mult  $t0 , $t1 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t6 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t3 
 addu   $t1 , $t7 , $t5 
 addiu   $t2 , $t5 , 1097702048 
 lbu   $t7 , 0($a0) 
 or   $t1 , $t6 , $t2 
 multu  $t7 , $t6 
 add $0, $0, $0
 mflo  $t6 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t1 
 andi   $t5 , $t3 , 1313094731 
 subu   $t2 , $t1 , $t6 
 sw   $t1 , 0($a0) 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t1 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t1 
 lb   $t3 , 0($a0) 
 xori   $t1 , $t7 , 4157905423 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t3 
 multu  $t2 , $t0 
 add $0, $0, $0
 mflo  $t6 
 xori   $t5 , $t2 , 1798212907 
 sltiu   $t1 , $t0 , 475147493 
 lw   $t1 , 0($a0) 
 subu   $t5 , $t7 , $t7 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t4 
 subu   $t7 , $t6 , $t6 
 sw   $t3 , 0($a0) 
 xori   $t5 , $t3 , 3263604452 
 lb   $t4 , 0($a0) 
 addiu   $t2 , $t1 , 307148330 
 sh   $t2 , 0($a0) 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t6 , $t4 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lh   $t3 , 0($a0) 
 sltiu   $t2 , $t6 , 2612749955 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t0 
 andi   $t5 , $t7 , 3673455403 
 nor   $t5 , $t4 , $t6 
 ori   $t1 , $t2 , 1779554629 
 or   $t5 , $t0 , $t5 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t6 
 addu   $t5 , $t1 , $t4 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 or   $t7 , $t5 , $t6 
 or   $t2 , $t7 , $t4 
 lb   $t1 , 0($a0) 
 xor   $t1 , $t0 , $t7 
 xori   $t1 , $t7 , 1085752291 
 andi   $t4 , $t4 , 315867563 
 lbu   $t1 , 0($a0) 
 mult  $t7 , $t6 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t3 
 lh   $t4 , 0($a0) 
 ori   $t6 , $t7 , 3161907312 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t0 
 or   $t3 , $t4 , $t0 
 andi   $t6 , $t5 , 384623783 
 sb   $t0 , 0($a0) 
 ori   $t2 , $t3 , 3231478612 
 sh   $t1 , 0($a0) 
 sw   $t1 , 0($a0) 
 xori   $t2 , $t4 , 3587408241 
 ori   $t7 , $t0 , 3121911066 
 mult  $t3 , $t7 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 xori   $t4 , $t0 , 1835118491 
 xor   $t0 , $t0 , $t6 
 mult  $t4 , $t0 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t3 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t7 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t5 
 and   $t6 , $t7 , $t1 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t1 
 multu  $t2 , $t4 
 add $0, $0, $0
 mflo  $t4 
 mult  $t1 , $t5 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t4 , 0($a0) 
 multu  $t4 , $t7 
 add $0, $0, $0
 mflo  $t3 
 ori   $t3 , $t0 , 1320673580 
 sh   $t7 , 0($a0) 
 sb   $t5 , 0($a0) 
 xori   $t7 , $t0 , 941378946 
 sh   $t3 , 0($a0) 
 sh   $t3 , 0($a0) 
 sb   $t3 , 0($a0) 
 lw   $t1 , 0($a0) 
 mult  $t6 , $t1 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t4 
 and   $t1 , $t2 , $t7 
 sltiu   $t6 , $t0 , 3148090138 
 lh   $t4 , 0($a0) 
 subu   $t4 , $t2 , $t4 
 andi   $t1 , $t4 , 2674421269 
 subu   $t1 , $t4 , $t1 
 multu  $t2 , $t0 
 add $0, $0, $0
 mflo  $t2 
 addu   $t3 , $t4 , $t6 
 addiu   $t6 , $t0 , 2414193280 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t1 
 lh   $t2 , 0($a0) 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t7 
 andi   $t5 , $t7 , 194457970 
 sb   $t6 , 0($a0) 
 addu   $t6 , $t1 , $t1 
 or   $t7 , $t4 , $t4 
 and   $t2 , $t1 , $t5 
 lb   $t5 , 0($a0) 
 or   $t0 , $t4 , $t7 
 sh   $t7 , 0($a0) 
 sltiu   $t4 , $t7 , 1229440519 
 lw   $t5 , 0($a0) 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t5 , $t5 , 2274847606 
 sw   $t1 , 0($a0) 
 xori   $t5 , $t4 , 839864552 
 sb   $t5 , 0($a0) 
 mult  $t0 , $t3 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t2 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t0 
 lhu   $t7 , 0($a0) 
 multu  $t1 , $t7 
 add $0, $0, $0
 mflo  $t2 
 ori   $t3 , $t5 , 581382962 
 sw   $t2 , 0($a0) 
 xori   $t5 , $t1 , 2912330478 
 andi   $t5 , $t0 , 3401804405 
 mult  $t1 , $t3 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t6 
 xori   $t2 , $t5 , 3297429853 
 xor   $t4 , $t0 , $t1 
 lbu   $t6 , 0($a0) 
 subu   $t1 , $t3 , $t7 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 sh   $t2 , 0($a0) 
 lhu   $t1 , 0($a0) 
 addiu   $t6 , $t0 , 1902876036 
 mult  $t0 , $t1 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t6 
 addu   $t5 , $t0 , $t3 
 subu   $t2 , $t6 , $t3 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t1 
 andi   $t1 , $t5 , 3699630901 
 or   $t5 , $t2 , $t3 
 sltiu   $t3 , $t5 , 1501712982 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t7 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t5 
 nor   $t2 , $t5 , $t7 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t2 
 xor   $t1 , $t4 , $t6 
 andi   $t2 , $t1 , 3009331377 
 mult  $t6 , $t2 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t4 
 addu   $t4 , $t1 , $t6 
 addiu   $t6 , $t4 , 2313086546 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t4 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sh   $t3 , 0($a0) 
 subu   $t5 , $t0 , $t6 
 xori   $t5 , $t5 , 2924605208 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t1 
 subu   $t5 , $t6 , $t0 
 sb   $t4 , 0($a0) 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t7 
 and   $t2 , $t5 , $t7 
 sw   $t7 , 0($a0) 
 xori   $t5 , $t1 , 2982257153 
 nor   $t1 , $t1 , $t3 
 nor   $t6 , $t7 , $t4 
 ori   $t2 , $t0 , 3847071007 
 ori   $t6 , $t5 , 1116593994 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t0 
 sb   $t2 , 0($a0) 
 xor   $t1 , $t2 , $t7 
 or   $t0 , $t6 , $t0 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t4 , $t2 , 2214440759 
 ori   $t3 , $t6 , 4037791856 
 lhu   $t2 , 0($a0) 
 ori   $t6 , $t5 , 856839499 
 xor   $t6 , $t1 , $t0 
 sw   $t7 , 0($a0) 
 mult  $t1 , $t7 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t1 
 subu   $t1 , $t2 , $t6 
 or   $t0 , $t2 , $t7 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t0 
 xori   $t7 , $t7 , 3553005717 
 sltiu   $t0 , $t6 , 1113398604 
 xor   $t4 , $t0 , $t7 
 xori   $t7 , $t6 , 564158799 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t1 , $t6 , 3007556517 
 sh   $t7 , 0($a0) 
 and   $t5 , $t1 , $t4 
 and   $t1 , $t2 , $t5 
 andi   $t1 , $t1 , 2394824948 
 and   $t3 , $t6 , $t2 
 and   $t5 , $t6 , $t7 
 sb   $t6 , 0($a0) 
 sb   $t7 , 0($a0) 
 sb   $t6 , 0($a0) 
 xori   $t7 , $t5 , 2916159130 
 andi   $t4 , $t6 , 2245879585 
 lw   $t2 , 0($a0) 
 sb   $t0 , 0($a0) 
 sw   $t3 , 0($a0) 
 sltiu   $t3 , $t1 , 3951343894 
 subu   $t3 , $t7 , $t3 
 xori   $t1 , $t1 , 3102156811 
 sw   $t7 , 0($a0) 
 mult  $t0 , $t2 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t2 
 xori   $t5 , $t4 , 901505873 
 ori   $t5 , $t0 , 1191262765 
 lb   $t7 , 0($a0) 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t3 , 0($a0) 
 ori   $t7 , $t2 , 796257699 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t4 
 xor   $t5 , $t5 , $t3 
 sltiu   $t7 , $t1 , 291073021 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t6 , $t4 , 1314097605 
 andi   $t2 , $t3 , 447673506 
 lb   $t5 , 0($a0) 
 multu  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 addu   $t7 , $t5 , $t4 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t6 , 0($a0) 
 subu   $t6 , $t4 , $t7 
 lbu   $t6 , 0($a0) 
 sb   $t0 , 0($a0) 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t6 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t7 
 xori   $t4 , $t2 , 4187670227 
 sltiu   $t7 , $t2 , 537334756 
 sh   $t1 , 0($a0) 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t1 
 sb   $t3 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t6 
 addu   $t4 , $t7 , $t4 
 lb   $t6 , 0($a0) 
 lh   $t7 , 0($a0) 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 ori   $t4 , $t4 , 1839052008 
 addiu   $t4 , $t7 , 3196992074 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t7 
 ori   $t1 , $t3 , 2967743213 
 lb   $t5 , 0($a0) 
 sh   $t1 , 0($a0) 
 andi   $t5 , $t0 , 268204781 
 addiu   $t6 , $t4 , 564117658 
 addu   $t2 , $t5 , $t3 
 and   $t1 , $t7 , $t5 
 or   $t7 , $t7 , $t4 
 ori   $t3 , $t5 , 4294152731 
 xori   $t1 , $t3 , 506621466 
 sh   $t3 , 0($a0) 
 nor   $t2 , $t6 , $t2 
 lb   $t5 , 0($a0) 
 sh   $t1 , 0($a0) 
 mult  $t0 , $t7 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t1 
 nor   $t4 , $t1 , $t0 
 lb   $t2 , 0($a0) 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t3 
 subu   $t7 , $t7 , $t5 
 sb   $t4 , 0($a0) 
 addiu   $t5 , $t7 , 1087284988 
 xori   $t1 , $t7 , 3221004666 
 addiu   $t7 , $t5 , 3749174217 
 addu   $t7 , $t7 , $t6 
 xori   $t0 , $t0 , 39390023 
 nor   $t5 , $t7 , $t3 
 addu   $t1 , $t3 , $t6 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t6 
 xori   $t4 , $t5 , 2912935586 
 lhu   $t1 , 0($a0) 
 andi   $t7 , $t6 , 3682621337 
 lbu   $t6 , 0($a0) 
 addu   $t7 , $t1 , $t6 
 addu   $t1 , $t2 , $t1 
 mult  $t7 , $t1 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 multu  $t0 , $t4 
 add $0, $0, $0
 mflo  $t2 
 xor   $t7 , $t2 , $t2 
 and   $t7 , $t5 , $t0 
 mult  $t6 , $t4 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t2 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t3 
 sb   $t6 , 0($a0) 
 mult  $t3 , $t3 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t3 
 sw   $t2 , 0($a0) 
 mult  $t3 , $t1 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t4 
 andi   $t4 , $t4 , 3171891464 
 lbu   $t3 , 0($a0) 
 lhu   $t0 , 0($a0) 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t0 
 sh   $t5 , 0($a0) 
 sltiu   $t0 , $t1 , 2248376691 
 multu  $t3 , $t3 
 add $0, $0, $0
 mflo  $t4 
 addu   $t2 , $t3 , $t2 
 xor   $t6 , $t5 , $t3 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t3 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t0 
 ori   $t1 , $t6 , 3049781261 
 mult  $t0 , $t5 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t0 , 0($a0) 
 subu   $t3 , $t3 , $t6 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t2 , $t5 , 1077698117 
 or   $t3 , $t7 , $t3 
 sb   $t5 , 0($a0) 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t6 
 addu   $t2 , $t5 , $t1 
 lh   $t2 , 0($a0) 
 xor   $t0 , $t4 , $t6 
 addu   $t1 , $t5 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t3 
 and   $t6 , $t6 , $t3 
 lhu   $t4 , 0($a0) 
 sh   $t3 , 0($a0) 
 mult  $t0 , $t4 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t3 
 and   $t3 , $t2 , $t0 
 mult  $t6 , $t5 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t0 , $t1 , 220721501 
 addu   $t5 , $t7 , $t5 
 and   $t2 , $t0 , $t7 
 subu   $t3 , $t2 , $t2 
 sw   $t4 , 0($a0) 
 addiu   $t6 , $t3 , 1685815743 
 sw   $t7 , 0($a0) 
 sltiu   $t6 , $t2 , 1136058478 
 xori   $t7 , $t7 , 2732324510 
 lbu   $t1 , 0($a0) 
 lh   $t5 , 0($a0) 
 xor   $t0 , $t1 , $t6 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t0 , $t1 , 3009843787 
 and   $t7 , $t3 , $t4 
 xor   $t5 , $t4 , $t4 
 mult  $t6 , $t3 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 xori   $t5 , $t5 , 1105854644 
 lbu   $t2 , 0($a0) 
 lw   $t7 , 0($a0) 
 xor   $t0 , $t0 , $t2 
 xori   $t5 , $t2 , 3399995282 
 ori   $t5 , $t6 , 3921124647 
 xor   $t1 , $t1 , $t5 
 sh   $t0 , 0($a0) 
 addiu   $t4 , $t2 , 1618680836 
 nor   $t3 , $t3 , $t1 
 addu   $t4 , $t0 , $t1 
 sltiu   $t2 , $t5 , 1719156619 
 mult  $t3 , $t5 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t5 
 addu   $t6 , $t0 , $t3 
 lhu   $t5 , 0($a0) 
 nor   $t4 , $t1 , $t7 
 ori   $t5 , $t1 , 2760646774 
 xori   $t3 , $t7 , 326932610 
 nor   $t6 , $t3 , $t1 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t5 
 nor   $t6 , $t6 , $t1 
 andi   $t0 , $t7 , 2979306106 
 lw   $t6 , 0($a0) 
 addu   $t7 , $t3 , $t5 
 nor   $t0 , $t4 , $t7 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t6 
 or   $t6 , $t5 , $t3 
 xori   $t7 , $t1 , 1019555975 
 sltiu   $t2 , $t0 , 3499812710 
 lw   $t5 , 0($a0) 
 sw   $t5 , 0($a0) 
 sltiu   $t2 , $t6 , 4149387111 
 or   $t4 , $t5 , $t4 
 subu   $t5 , $t7 , $t7 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t2 
 and   $t6 , $t4 , $t5 
 addu   $t0 , $t0 , $t6 
 lh   $t4 , 0($a0) 
 xori   $t3 , $t4 , 3383104664 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t3 
 sh   $t5 , 0($a0) 
 sh   $t6 , 0($a0) 
 lw   $t0 , 0($a0) 
 sltiu   $t3 , $t5 , 2060430485 
 mult  $t4 , $t0 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sh   $t1 , 0($a0) 
 lh   $t2 , 0($a0) 
 ori   $t4 , $t4 , 3329138637 
 or   $t3 , $t5 , $t1 
 xori   $t0 , $t4 , 3442475511 
 subu   $t2 , $t0 , $t0 
 ori   $t4 , $t1 , 668091524 
 sw   $t3 , 0($a0) 
 lb   $t0 , 0($a0) 
 sb   $t4 , 0($a0) 
 mult  $t1 , $t6 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t2 
 nor   $t3 , $t4 , $t6 
 subu   $t6 , $t0 , $t6 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t1 
 ori   $t3 , $t5 , 2270214095 
 sltiu   $t7 , $t2 , 898518881 
 sh   $t1 , 0($a0) 
 mult  $t2 , $t0 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t3 
 xor   $t5 , $t1 , $t2 
 mult  $t6 , $t1 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t1 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t3 
 xori   $t1 , $t6 , 2615149935 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t1 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t4 
 andi   $t2 , $t3 , 2326836613 
 sw   $t1 , 0($a0) 
 lw   $t1 , 0($a0) 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 ori   $t1 , $t7 , 3737156011 
 sh   $t1 , 0($a0) 
 nor   $t3 , $t6 , $t1 
 addu   $t1 , $t2 , $t1 
 lhu   $t7 , 0($a0) 
 sh   $t7 , 0($a0) 
 nor   $t6 , $t1 , $t6 
 sb   $t3 , 0($a0) 
 or   $t1 , $t0 , $t7 
 sh   $t3 , 0($a0) 
 mult  $t6 , $t0 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t2 , $t2 , 227371860 
 addu   $t0 , $t0 , $t6 
 and   $t5 , $t5 , $t5 
 and   $t5 , $t6 , $t1 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t6 
 and   $t3 , $t2 , $t7 
 xori   $t4 , $t5 , 2349867515 
 addiu   $t5 , $t1 , 2150182986 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t7 
 sltiu   $t5 , $t4 , 4173889590 
 lw   $t7 , 0($a0) 
 subu   $t2 , $t3 , $t5 
 addu   $t3 , $t2 , $t4 
 sb   $t3 , 0($a0) 
 xor   $t5 , $t3 , $t7 
 sb   $t2 , 0($a0) 
 lhu   $t5 , 0($a0) 
 ori   $t7 , $t4 , 2544617974 
 sh   $t2 , 0($a0) 
 xor   $t4 , $t2 , $t1 
 lhu   $t5 , 0($a0) 
 addiu   $t1 , $t0 , 657709631 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t3 
 addu   $t1 , $t4 , $t0 
 sb   $t1 , 0($a0) 
 sw   $t6 , 0($a0) 
 lbu   $t3 , 0($a0) 
 addu   $t3 , $t4 , $t0 
 or   $t3 , $t0 , $t7 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t6 
 or   $t3 , $t5 , $t4 
 ori   $t2 , $t3 , 2491632207 
 mult  $t7 , $t6 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t4 
 nor   $t1 , $t5 , $t6 
 ori   $t4 , $t5 , 489528433 
 andi   $t0 , $t7 , 318676738 
 nor   $t7 , $t4 , $t5 
 sw   $t4 , 0($a0) 
 or   $t7 , $t3 , $t0 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t6 , 0($a0) 
 xori   $t3 , $t2 , 3262556251 
 mult  $t0 , $t3 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t1 
 lhu   $t2 , 0($a0) 
 sltiu   $t1 , $t1 , 3522547729 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t3 
 nor   $t1 , $t7 , $t3 
 mult  $t5 , $t2 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t0 
 subu   $t3 , $t4 , $t2 
 sh   $t5 , 0($a0) 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t3 
 sb   $t1 , 0($a0) 
 sb   $t4 , 0($a0) 
 mult  $t2 , $t1 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t2 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t2 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t5 
 andi   $t6 , $t7 , 2320510906 
 sb   $t4 , 0($a0) 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t0 
 lw   $t5 , 0($a0) 
 nor   $t2 , $t5 , $t2 
 addiu   $t4 , $t7 , 3644121786 
 lb   $t5 , 0($a0) 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t4 , $t7 , 2397161310 
 addiu   $t6 , $t3 , 3382112803 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t0 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t0 
 xori   $t1 , $t6 , 614274204 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t3 
 addu   $t2 , $t7 , $t2 
 xor   $t3 , $t6 , $t5 
 lbu   $t5 , 0($a0) 
 or   $t4 , $t5 , $t6 
 lh   $t5 , 0($a0) 
 or   $t6 , $t3 , $t0 
 addiu   $t1 , $t4 , 613619294 
 ori   $t7 , $t5 , 1120004436 
 andi   $t6 , $t7 , 1606796179 
 sw   $t5 , 0($a0) 
 mult  $t6 , $t2 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 addu   $t0 , $t5 , $t1 
 lh   $t1 , 0($a0) 
 sb   $t6 , 0($a0) 
 mult  $t4 , $t1 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t7 , $t6 , 493360944 
 subu   $t3 , $t5 , $t7 
 andi   $t5 , $t1 , 1516946370 
 xori   $t1 , $t2 , 1812683281 
 nor   $t7 , $t2 , $t7 
 ori   $t5 , $t2 , 1925905315 
 and   $t0 , $t7 , $t5 
 and   $t3 , $t4 , $t5 
 or   $t1 , $t3 , $t0 
 sw   $t2 , 0($a0) 
 lw   $t4 , 0($a0) 
 mult  $t3 , $t1 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t7 
 lh   $t0 , 0($a0) 
 xori   $t6 , $t4 , 50824252 
 sb   $t5 , 0($a0) 
 subu   $t6 , $t6 , $t0 
 xor   $t6 , $t3 , $t6 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t3 , $t5 , 1615312397 
 andi   $t5 , $t7 , 1251097699 
 lh   $t4 , 0($a0) 
 xori   $t6 , $t7 , 613857025 
 addu   $t3 , $t3 , $t5 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t5 
 sh   $t7 , 0($a0) 
 mult  $t0 , $t3 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sw   $t7 , 0($a0) 
 nor   $t5 , $t7 , $t4 
 subu   $t6 , $t2 , $t5 
 lhu   $t7 , 0($a0) 
 mult  $t6 , $t2 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t0 
 sw   $t1 , 0($a0) 
 sb   $t5 , 0($a0) 
 or   $t6 , $t0 , $t6 
 addiu   $t0 , $t2 , 1240190647 
 mult  $t0 , $t0 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t0 
 and   $t4 , $t0 , $t7 
 ori   $t1 , $t2 , 3151840565 
 xori   $t5 , $t6 , 3857730248 
 lb   $t1 , 0($a0) 
 lh   $t2 , 0($a0) 
 sw   $t1 , 0($a0) 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t0 , 0($a0) 
 subu   $t6 , $t4 , $t6 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t6 
 mult  $t7 , $t2 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t7 
 or   $t3 , $t3 , $t6 
 ori   $t0 , $t2 , 611124110 
 addiu   $t1 , $t4 , 2525550822 
 xori   $t0 , $t6 , 2463404604 
 lw   $t7 , 0($a0) 
 or   $t0 , $t4 , $t5 
 and   $t0 , $t3 , $t5 
 sh   $t4 , 0($a0) 
 mult  $t5 , $t6 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t2 
 and   $t6 , $t2 , $t6 
 xor   $t5 , $t5 , $t0 
 ori   $t3 , $t7 , 589724814 
 sltiu   $t6 , $t2 , 2601046652 
 xor   $t6 , $t7 , $t5 
 lbu   $t3 , 0($a0) 
 andi   $t0 , $t0 , 2880050934 
 andi   $t3 , $t3 , 3171442706 
 lh   $t4 , 0($a0) 
 lb   $t3 , 0($a0) 
 addu   $t6 , $t5 , $t5 
 xori   $t0 , $t0 , 1604272809 
 or   $t3 , $t6 , $t4 
 lhu   $t4 , 0($a0) 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t4 
 xor   $t1 , $t5 , $t7 
 sltiu   $t0 , $t3 , 2377242622 
 sh   $t1 , 0($a0) 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t2 
 or   $t6 , $t6 , $t3 
 xori   $t1 , $t7 , 3142564116 
 or   $t6 , $t5 , $t1 
 mult  $t2 , $t6 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t4 , 0($a0) 
 addiu   $t4 , $t2 , 2129242046 
 xori   $t5 , $t6 , 3222505396 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t1 
 sw   $t6 , 0($a0) 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t4 
 lhu   $t0 , 0($a0) 
 sw   $t0 , 0($a0) 
 and   $t3 , $t1 , $t4 
 sltiu   $t3 , $t1 , 4211932890 
 subu   $t2 , $t0 , $t5 
 sb   $t5 , 0($a0) 
 subu   $t7 , $t5 , $t7 
 subu   $t5 , $t6 , $t2 
 subu   $t1 , $t1 , $t0 
 andi   $t3 , $t6 , 900085666 
 lhu   $t3 , 0($a0) 
 mult  $t4 , $t0 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t6 
 sw   $t0 , 0($a0) 
 or   $t0 , $t3 , $t3 
 addu   $t2 , $t0 , $t5 
 addiu   $t3 , $t1 , 1267015321 
 mult  $t3 , $t4 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 and   $t7 , $t1 , $t5 
 sw   $t4 , 0($a0) 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t5 
 ori   $t2 , $t5 , 1189645553 
 subu   $t7 , $t0 , $t2 
 sltiu   $t3 , $t0 , 1498687182 
 sltiu   $t4 , $t6 , 325783575 
 addu   $t7 , $t0 , $t4 
 nor   $t1 , $t6 , $t4 
 sltiu   $t4 , $t2 , 551584488 
 andi   $t6 , $t7 , 2545577945 
 xori   $t3 , $t0 , 1777405349 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t6 
 xori   $t3 , $t7 , 1669580411 
 ori   $t0 , $t4 , 1768617822 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t1 
 sw   $t2 , 0($a0) 
 sltiu   $t3 , $t3 , 3914395679 
 subu   $t1 , $t0 , $t3 
 sltiu   $t2 , $t6 , 2715323632 
 xor   $t3 , $t4 , $t6 
 sb   $t7 , 0($a0) 
 sltiu   $t1 , $t0 , 605089029 
 ori   $t5 , $t0 , 1195499212 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t6 
 lb   $t6 , 0($a0) 
 sw   $t1 , 0($a0) 
 mult  $t2 , $t2 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t5 
 mult  $t7 , $t4 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t4 
 lh   $t0 , 0($a0) 
 xori   $t3 , $t1 , 2517908601 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t3 
 subu   $t0 , $t5 , $t5 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t7 
 sltiu   $t3 , $t7 , 176307087 
 xori   $t0 , $t0 , 2476663674 
 nor   $t2 , $t5 , $t6 
 sb   $t4 , 0($a0) 
 lb   $t5 , 0($a0) 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t7 
 sltiu   $t7 , $t3 , 2160974291 
 mult  $t0 , $t7 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t5 
 sw   $t6 , 0($a0) 
 addiu   $t0 , $t5 , 3490622799 
 xor   $t0 , $t5 , $t6 
 sb   $t2 , 0($a0) 
 andi   $t7 , $t1 , 326424135 
 sh   $t0 , 0($a0) 
 nor   $t6 , $t1 , $t6 
 lb   $t2 , 0($a0) 
 xori   $t6 , $t0 , 2207126089 
 andi   $t0 , $t4 , 1976901743 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 sh   $t4 , 0($a0) 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t0 
 sb   $t3 , 0($a0) 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t0 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t2 
 ori   $t3 , $t3 , 1875949865 
 lbu   $t6 , 0($a0) 
 addu   $t3 , $t6 , $t0 
 mult  $t0 , $t7 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t4 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t5 
 and   $t5 , $t1 , $t2 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t3 , $t0 , 3377719241 
 addu   $t6 , $t4 , $t7 
 xor   $t1 , $t7 , $t0 
 mult  $t5 , $t0 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t1 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t7 
 mult  $t4 , $t4 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t1 
 ori   $t0 , $t5 , 969503938 
 sw   $t4 , 0($a0) 
 xor   $t5 , $t2 , $t3 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t0 , $t7 , 692299459 
 nor   $t1 , $t1 , $t1 
 lw   $t0 , 0($a0) 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t6 
 or   $t1 , $t2 , $t5 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t0 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t3 , $t2 , 2860517826 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t5 
 ori   $t7 , $t7 , 1455449198 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t0 
 ori   $t6 , $t0 , 3235905612 
 sltiu   $t7 , $t7 , 859156945 
 xori   $t1 , $t5 , 3375894464 
 subu   $t0 , $t3 , $t3 
 mult  $t6 , $t4 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t3 
 sw   $t6 , 0($a0) 
 mult  $t5 , $t2 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t0 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t1 
 subu   $t4 , $t0 , $t0 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t3 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t5 
 xor   $t1 , $t1 , $t6 
 andi   $t3 , $t7 , 937094542 
 addu   $t7 , $t6 , $t3 
 andi   $t7 , $t1 , 3164932817 
 sb   $t2 , 0($a0) 
 subu   $t1 , $t2 , $t3 
 xor   $t4 , $t2 , $t6 
 or   $t7 , $t1 , $t5 
 addiu   $t6 , $t0 , 3459416865 
 subu   $t7 , $t1 , $t1 
 addu   $t7 , $t2 , $t5 
 sw   $t2 , 0($a0) 
 xori   $t1 , $t6 , 893471391 
 lhu   $t3 , 0($a0) 
 lh   $t7 , 0($a0) 
 lbu   $t5 , 0($a0) 
 xor   $t0 , $t5 , $t3 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t1 , $t7 , 1063691880 
 addiu   $t5 , $t4 , 560302366 
 addu   $t2 , $t2 , $t4 
 sw   $t6 , 0($a0) 
 andi   $t0 , $t2 , 2634755583 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t0 , $t4 , 3565978168 
 nor   $t5 , $t6 , $t0 
 ori   $t0 , $t6 , 3574250554 
 sw   $t0 , 0($a0) 
 sh   $t1 , 0($a0) 
 subu   $t5 , $t2 , $t7 
 lhu   $t6 , 0($a0) 
 ori   $t5 , $t6 , 2026347967 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t1 
 nor   $t0 , $t5 , $t4 
 addiu   $t1 , $t7 , 1531554493 
 mult  $t0 , $t1 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t7 
 sw   $t2 , 0($a0) 
 addu   $t1 , $t2 , $t3 
 sltiu   $t6 , $t5 , 802916910 
 sltiu   $t4 , $t5 , 1102935575 
 addu   $t6 , $t4 , $t4 
 subu   $t4 , $t2 , $t6 
 subu   $t3 , $t7 , $t5 
 sb   $t5 , 0($a0) 
 xori   $t2 , $t1 , 290783766 
 addiu   $t7 , $t5 , 3571841029 
 lb   $t4 , 0($a0) 
 and   $t3 , $t3 , $t5 
 subu   $t3 , $t3 , $t7 
 xori   $t0 , $t6 , 3610486700 
 andi   $t2 , $t1 , 3317003069 
 mult  $t4 , $t0 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t5 
 xor   $t4 , $t3 , $t3 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t5 , $t6 , 915246931 
 subu   $t2 , $t7 , $t1 
 ori   $t0 , $t4 , 1423884613 
 sltiu   $t7 , $t3 , 426696985 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t5 
 or   $t0 , $t7 , $t5 
 andi   $t3 , $t4 , 2849389144 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sw   $t3 , 0($a0) 
 and   $t5 , $t4 , $t3 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t3 
 or   $t1 , $t5 , $t5 
 lbu   $t3 , 0($a0) 
 addiu   $t0 , $t4 , 3288484514 
 xori   $t4 , $t6 , 475976025 
 andi   $t0 , $t4 , 1476104722 
 nor   $t0 , $t4 , $t5 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t2 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t1 
 lw   $t2 , 0($a0) 
 andi   $t1 , $t5 , 1332940 
 addiu   $t3 , $t6 , 3422776700 
 mult  $t0 , $t6 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t0 
 xori   $t6 , $t7 , 144017462 
 addiu   $t2 , $t3 , 1810339296 
 nor   $t5 , $t3 , $t7 
 xor   $t3 , $t0 , $t3 
 sb   $t0 , 0($a0) 
 multu  $t7 , $t0 
 add $0, $0, $0
 mflo  $t6 
 and   $t5 , $t2 , $t4 
 lbu   $t2 , 0($a0) 
 sb   $t7 , 0($a0) 
 lb   $t0 , 0($a0) 
 lhu   $t5 , 0($a0) 
 sh   $t0 , 0($a0) 
 lh   $t3 , 0($a0) 
 lbu   $t0 , 0($a0) 
 lhu   $t2 , 0($a0) 
 addiu   $t6 , $t7 , 28868103 
 lbu   $t6 , 0($a0) 
 mult  $t7 , $t7 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t5 
 subu   $t3 , $t1 , $t1 
 mult  $t6 , $t2 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t0 , 0($a0) 
 multu  $t3 , $t5 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t1 , $t5 , 4101544662 
 lb   $t1 , 0($a0) 
 nor   $t5 , $t0 , $t4 
 sb   $t2 , 0($a0) 
 sw   $t1 , 0($a0) 
 nor   $t7 , $t0 , $t1 
 xor   $t2 , $t6 , $t1 
 andi   $t3 , $t6 , 600830727 
 or   $t4 , $t3 , $t0 
 ori   $t7 , $t4 , 452308256 
 sltiu   $t1 , $t3 , 3250542457 
 mult  $t4 , $t3 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t2 
 nor   $t7 , $t2 , $t2 
 sh   $t2 , 0($a0) 
 sh   $t0 , 0($a0) 
 lw   $t4 , 0($a0) 
 sw   $t7 , 0($a0) 
 lhu   $t7 , 0($a0) 
 lw   $t5 , 0($a0) 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t6 
 and   $t5 , $t6 , $t5 
 nor   $t4 , $t2 , $t2 
 lw   $t2 , 0($a0) 
 ori   $t5 , $t4 , 1614018740 
 nor   $t0 , $t6 , $t1 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t6 
 or   $t0 , $t5 , $t1 
 sb   $t1 , 0($a0) 
 addiu   $t1 , $t1 , 4241506541 
 sh   $t6 , 0($a0) 
 andi   $t4 , $t7 , 1023906135 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t0 
 multu  $t6 , $t0 
 add $0, $0, $0
 mflo  $t6 
 sw   $t4 , 0($a0) 
 sh   $t5 , 0($a0) 
 subu   $t2 , $t6 , $t7 
 andi   $t7 , $t4 , 1489937541 
 andi   $t1 , $t0 , 3058486731 
 mult  $t2 , $t4 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t5 
 xori   $t0 , $t3 , 391996776 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t1 
 sb   $t6 , 0($a0) 
 addiu   $t5 , $t7 , 883227217 
 sltiu   $t1 , $t5 , 105704058 
 nor   $t2 , $t6 , $t2 
 lhu   $t7 , 0($a0) 
 lh   $t5 , 0($a0) 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t5 
 lhu   $t6 , 0($a0) 
 sltiu   $t7 , $t4 , 736352080 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t6 
 or   $t3 , $t3 , $t6 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t5 , $t3 , 4056655987 
 mult  $t0 , $t0 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t7 
 lb   $t4 , 0($a0) 
 mult  $t5 , $t3 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t1 
 lbu   $t2 , 0($a0) 
 addiu   $t1 , $t1 , 4096595269 
 mult  $t2 , $t6 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t7 
 ori   $t6 , $t6 , 2533764505 
 mult  $t4 , $t7 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t6 
 or   $t1 , $t7 , $t2 
 lbu   $t4 , 0($a0) 
 sb   $t0 , 0($a0) 
 sb   $t3 , 0($a0) 
 xor   $t3 , $t3 , $t5 
 sb   $t6 , 0($a0) 
 mult  $t4 , $t5 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t4 
 sh   $t6 , 0($a0) 
 nor   $t0 , $t2 , $t1 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t0 
 mult  $t4 , $t7 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t5 
 addu   $t4 , $t7 , $t6 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t5 
 sb   $t6 , 0($a0) 
 addiu   $t2 , $t6 , 1438501934 
 addiu   $t4 , $t6 , 696745845 
 subu   $t0 , $t4 , $t7 
 nor   $t1 , $t2 , $t1 
 lh   $t7 , 0($a0) 
 mult  $t5 , $t7 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t2 , 0($a0) 
 andi   $t6 , $t5 , 1619467342 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t2 
 lhu   $t7 , 0($a0) 
 andi   $t0 , $t5 , 1855026476 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t5 
 and   $t5 , $t1 , $t6 
 addiu   $t6 , $t5 , 405588002 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t2 
 and   $t6 , $t3 , $t5 
 addiu   $t4 , $t6 , 1210113306 
 sb   $t3 , 0($a0) 
 sw   $t5 , 0($a0) 
 ori   $t4 , $t3 , 3677268422 
 lb   $t3 , 0($a0) 
 lhu   $t3 , 0($a0) 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t7 
 mult  $t1 , $t4 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t3 
 multu  $t1 , $t4 
 add $0, $0, $0
 mflo  $t5 
 lb   $t6 , 0($a0) 
 sw   $t4 , 0($a0) 
 and   $t2 , $t3 , $t3 
 addiu   $t2 , $t0 , 3972084036 
 sltiu   $t5 , $t4 , 1573973106 
 addiu $v0, $0, 10
 syscall

