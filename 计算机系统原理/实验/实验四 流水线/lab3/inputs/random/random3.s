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
 xori   $t6 , $t3 , 4004353811 
 ori   $t6 , $t7 , 2754539437 
 xor   $t0 , $t5 , $t1 
 subu   $t0 , $t7 , $t2 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t2 
 and   $t2 , $t5 , $t1 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t4 , 0($a0) 
 sh   $t3 , 0($a0) 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t5 
 xor   $t3 , $t4 , $t7 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t4 
 multu  $t6 , $t0 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t2 , 0($a0) 
 xori   $t2 , $t5 , 1235241989 
 subu   $t7 , $t0 , $t6 
 addu   $t2 , $t1 , $t1 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t7 , $t5 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t3 
 lb   $t6 , 0($a0) 
 sltiu   $t0 , $t2 , 2828900933 
 or   $t1 , $t3 , $t5 
 xori   $t6 , $t5 , 3831537808 
 subu   $t0 , $t3 , $t0 
 lh   $t1 , 0($a0) 
 ori   $t3 , $t3 , 4023208130 
 lb   $t4 , 0($a0) 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t1 
 addu   $t3 , $t0 , $t6 
 sltiu   $t4 , $t0 , 2147230351 
 addu   $t6 , $t7 , $t1 
 sb   $t0 , 0($a0) 
 or   $t5 , $t3 , $t2 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t7 
 andi   $t1 , $t3 , 2926165408 
 multu  $t4 , $t0 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t3 , $t2 , 2683341679 
 or   $t1 , $t4 , $t2 
 sw   $t0 , 0($a0) 
 lw   $t0 , 0($a0) 
 andi   $t5 , $t7 , 2718541280 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t3 
 lh   $t4 , 0($a0) 
 sb   $t7 , 0($a0) 
 ori   $t5 , $t1 , 1097779544 
 sw   $t6 , 0($a0) 
 lhu   $t7 , 0($a0) 
 sb   $t5 , 0($a0) 
 mult  $t0 , $t5 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t4 , $t4 , 3783030228 
 andi   $t0 , $t6 , 588216964 
 lw   $t2 , 0($a0) 
 addiu   $t0 , $t7 , 828462076 
 multu  $t5 , $t6 
 add $0, $0, $0
 mflo  $t5 
 mult  $t3 , $t6 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lh   $t7 , 0($a0) 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t5 
 sh   $t2 , 0($a0) 
 sltiu   $t6 , $t7 , 1150442197 
 sltiu   $t7 , $t2 , 689341793 
 lw   $t1 , 0($a0) 
 ori   $t7 , $t1 , 2122042729 
 sh   $t3 , 0($a0) 
 lw   $t6 , 0($a0) 
 sw   $t5 , 0($a0) 
 lw   $t5 , 0($a0) 
 sw   $t6 , 0($a0) 
 sh   $t6 , 0($a0) 
 ori   $t6 , $t0 , 3433674564 
 mult  $t4 , $t5 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t3 
 sh   $t2 , 0($a0) 
 xori   $t2 , $t1 , 2996186538 
 nor   $t4 , $t6 , $t5 
 nor   $t5 , $t4 , $t0 
 xor   $t3 , $t6 , $t2 
 and   $t5 , $t5 , $t7 
 ori   $t4 , $t4 , 720618408 
 or   $t0 , $t4 , $t7 
 subu   $t3 , $t3 , $t6 
 sh   $t4 , 0($a0) 
 sh   $t4 , 0($a0) 
 multu  $t0 , $t3 
 add $0, $0, $0
 mflo  $t1 
 addu   $t0 , $t3 , $t2 
 ori   $t2 , $t1 , 2659761460 
 sltiu   $t6 , $t3 , 1136853088 
 addu   $t7 , $t2 , $t1 
 lh   $t2 , 0($a0) 
 sb   $t3 , 0($a0) 
 multu  $t1 , $t2 
 add $0, $0, $0
 mflo  $t1 
 andi   $t0 , $t7 , 1062930315 
 xori   $t7 , $t3 , 3188000211 
 mult  $t4 , $t2 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t7 , $t5 , 3797371568 
 sltiu   $t7 , $t0 , 1637238051 
 sltiu   $t5 , $t3 , 2111572353 
 andi   $t5 , $t7 , 3542439054 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t5 
 sh   $t0 , 0($a0) 
 sb   $t3 , 0($a0) 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t5 , 0($a0) 
 andi   $t5 , $t6 , 1690531330 
 ori   $t1 , $t2 , 1825761659 
 mult  $t3 , $t5 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t1 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t2 
 xori   $t2 , $t2 , 436474706 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t4 , $t7 , 1425350375 
 sltiu   $t6 , $t2 , 1689427854 
 subu   $t4 , $t0 , $t2 
 mult  $t7 , $t7 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t2 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t1 
 or   $t4 , $t5 , $t3 
 xor   $t2 , $t1 , $t0 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t3 , 0($a0) 
 lb   $t0 , 0($a0) 
 subu   $t7 , $t2 , $t1 
 addiu   $t6 , $t3 , 481033873 
 andi   $t5 , $t7 , 3500905612 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t5 
 mult  $t4 , $t7 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 lh   $t4 , 0($a0) 
 sw   $t7 , 0($a0) 
 addu   $t2 , $t1 , $t2 
 xori   $t7 , $t2 , 382275370 
 lhu   $t4 , 0($a0) 
 nor   $t0 , $t7 , $t5 
 sb   $t6 , 0($a0) 
 lbu   $t4 , 0($a0) 
 xori   $t6 , $t6 , 2089359150 
 xori   $t3 , $t4 , 18739559 
 sb   $t1 , 0($a0) 
 nor   $t6 , $t4 , $t1 
 and   $t4 , $t5 , $t2 
 addu   $t3 , $t3 , $t5 
 subu   $t5 , $t1 , $t7 
 or   $t0 , $t7 , $t0 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t4 
 or   $t1 , $t2 , $t7 
 lbu   $t2 , 0($a0) 
 sh   $t1 , 0($a0) 
 sltiu   $t0 , $t5 , 2017771615 
 lhu   $t3 , 0($a0) 
 mult  $t0 , $t6 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t4 
 lb   $t5 , 0($a0) 
 lh   $t4 , 0($a0) 
 nor   $t5 , $t5 , $t6 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t4 
 sh   $t6 , 0($a0) 
 multu  $t1 , $t0 
 add $0, $0, $0
 mflo  $t5 
 multu  $t2 , $t4 
 add $0, $0, $0
 mflo  $t6 
 ori   $t5 , $t6 , 2261480413 
 mult  $t1 , $t5 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t0 
 sb   $t5 , 0($a0) 
 subu   $t6 , $t5 , $t4 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t5 , 0($a0) 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t6 , $t6 , 3193390847 
 lh   $t2 , 0($a0) 
 sb   $t3 , 0($a0) 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t4 
 xori   $t4 , $t5 , 1158160843 
 lhu   $t4 , 0($a0) 
 addiu   $t4 , $t3 , 2970196215 
 sb   $t2 , 0($a0) 
 nor   $t5 , $t2 , $t0 
 sh   $t3 , 0($a0) 
 sltiu   $t5 , $t3 , 2101465366 
 xor   $t3 , $t6 , $t6 
 ori   $t7 , $t2 , 116031447 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t5 , $t7 , 1637349919 
 addu   $t2 , $t6 , $t1 
 subu   $t2 , $t4 , $t6 
 sb   $t1 , 0($a0) 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t4 
 mult  $t6 , $t4 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t1 
 lw   $t0 , 0($a0) 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t7 
 multu  $t2 , $t0 
 add $0, $0, $0
 mflo  $t4 
 lb   $t2 , 0($a0) 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t7 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t3 
 ori   $t7 , $t3 , 3604583240 
 addu   $t7 , $t0 , $t0 
 xor   $t5 , $t3 , $t2 
 ori   $t2 , $t6 , 3796135286 
 lhu   $t3 , 0($a0) 
 ori   $t7 , $t6 , 4257166704 
 mult  $t0 , $t1 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t4 , $t4 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t6 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t4 
 sb   $t1 , 0($a0) 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t0 , $t3 , 3578947030 
 nor   $t0 , $t1 , $t4 
 multu  $t1 , $t0 
 add $0, $0, $0
 mflo  $t0 
 sw   $t7 , 0($a0) 
 andi   $t0 , $t1 , 3187918641 
 multu  $t5 , $t6 
 add $0, $0, $0
 mflo  $t0 
 andi   $t5 , $t0 , 2163020500 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t6 
 sh   $t4 , 0($a0) 
 lh   $t5 , 0($a0) 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t4 
 or   $t0 , $t1 , $t0 
 or   $t2 , $t6 , $t1 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t4 
 or   $t7 , $t7 , $t1 
 mult  $t6 , $t1 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t3 
 xor   $t7 , $t1 , $t1 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t5 
 andi   $t1 , $t5 , 1192806237 
 mult  $t0 , $t7 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t5 
 nor   $t4 , $t0 , $t2 
 sltiu   $t0 , $t4 , 128584691 
 addiu   $t4 , $t1 , 2654030819 
 addu   $t6 , $t7 , $t6 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t2 
 sw   $t6 , 0($a0) 
 ori   $t0 , $t5 , 507091981 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t0 , $t4 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t2 
 lh   $t3 , 0($a0) 
 sw   $t6 , 0($a0) 
 addu   $t6 , $t2 , $t3 
 and   $t5 , $t6 , $t5 
 lh   $t3 , 0($a0) 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t7 
 addiu   $t1 , $t5 , 1412523227 
 and   $t3 , $t4 , $t1 
 sltiu   $t6 , $t5 , 1868424925 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t3 , $t1 , 2002992229 
 lh   $t0 , 0($a0) 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t7 
 multu  $t3 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sw   $t7 , 0($a0) 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t4 
 xor   $t0 , $t2 , $t0 
 mult  $t0 , $t2 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t6 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 xor   $t1 , $t5 , $t2 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t1 
 lw   $t5 , 0($a0) 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t1 
 and   $t0 , $t6 , $t0 
 lw   $t0 , 0($a0) 
 andi   $t0 , $t2 , 1862764543 
 subu   $t6 , $t6 , $t0 
 lw   $t4 , 0($a0) 
 andi   $t6 , $t0 , 1011567557 
 addu   $t3 , $t3 , $t3 
 and   $t6 , $t2 , $t2 
 nor   $t2 , $t5 , $t7 
 nor   $t6 , $t7 , $t6 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t2 
 subu   $t6 , $t0 , $t7 
 sh   $t6 , 0($a0) 
 or   $t6 , $t0 , $t3 
 mult  $t0 , $t4 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t4 
 addu   $t7 , $t4 , $t1 
 lb   $t0 , 0($a0) 
 sw   $t7 , 0($a0) 
 mult  $t3 , $t1 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t0 
 and   $t7 , $t4 , $t6 
 sh   $t2 , 0($a0) 
 multu  $t3 , $t7 
 add $0, $0, $0
 mflo  $t3 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t5 
 mult  $t3 , $t2 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t5 
 ori   $t1 , $t3 , 1310953882 
 ori   $t4 , $t7 , 3212078975 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t1 , 0($a0) 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t0 
 addu   $t2 , $t4 , $t1 
 xori   $t2 , $t6 , 1776350281 
 mult  $t2 , $t4 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t2 , $t4 , 1190868133 
 lbu   $t6 , 0($a0) 
 lw   $t5 , 0($a0) 
 xori   $t0 , $t4 , 2971487145 
 addiu   $t2 , $t5 , 2859450551 
 sb   $t5 , 0($a0) 
 andi   $t1 , $t7 , 3683659664 
 mult  $t5 , $t1 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t4 
 andi   $t5 , $t1 , 3479621514 
 sltiu   $t2 , $t6 , 3771039760 
 addu   $t1 , $t5 , $t4 
 addu   $t1 , $t3 , $t6 
 lb   $t3 , 0($a0) 
 lw   $t6 , 0($a0) 
 sh   $t1 , 0($a0) 
 mult  $t6 , $t2 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t0 , 0($a0) 
 lw   $t5 , 0($a0) 
 and   $t2 , $t3 , $t1 
 or   $t5 , $t4 , $t0 
 lbu   $t1 , 0($a0) 
 ori   $t2 , $t3 , 231519430 
 andi   $t7 , $t7 , 3042224849 
 sltiu   $t5 , $t5 , 3549915942 
 lhu   $t7 , 0($a0) 
 and   $t6 , $t7 , $t5 
 andi   $t0 , $t4 , 3372071415 
 andi   $t4 , $t0 , 555874532 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t5 
 mult  $t2 , $t6 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t0 
 and   $t2 , $t7 , $t2 
 mult  $t1 , $t4 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t0 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t5 
 subu   $t5 , $t3 , $t7 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t5 
 mult  $t1 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t5 , $t5 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 addu   $t6 , $t7 , $t5 
 sw   $t6 , 0($a0) 
 ori   $t2 , $t6 , 1077032305 
 addiu   $t3 , $t2 , 3735211281 
 andi   $t1 , $t4 , 1516013637 
 subu   $t3 , $t5 , $t0 
 and   $t1 , $t6 , $t3 
 lh   $t2 , 0($a0) 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t3 
 multu  $t1 , $t4 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t7 , $t0 , 3061884904 
 and   $t0 , $t2 , $t7 
 ori   $t4 , $t0 , 822373312 
 sb   $t7 , 0($a0) 
 subu   $t6 , $t5 , $t7 
 ori   $t2 , $t7 , 3820138953 
 addiu   $t2 , $t3 , 749313211 
 subu   $t5 , $t3 , $t5 
 sh   $t7 , 0($a0) 
 and   $t1 , $t7 , $t6 
 lb   $t1 , 0($a0) 
 sltiu   $t6 , $t2 , 2871697624 
 addiu   $t1 , $t1 , 1528847710 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t0 
 addu   $t7 , $t1 , $t1 
 and   $t5 , $t0 , $t5 
 andi   $t0 , $t5 , 1355411784 
 ori   $t0 , $t3 , 4030729464 
 or   $t3 , $t0 , $t4 
 xori   $t4 , $t5 , 2665782626 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t6 
 ori   $t0 , $t7 , 3657453136 
 sltiu   $t1 , $t3 , 2803370385 
 xori   $t0 , $t6 , 576616017 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t2 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t1 
 and   $t0 , $t0 , $t3 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t2 
 lhu   $t6 , 0($a0) 
 xori   $t4 , $t5 , 814811987 
 sltiu   $t7 , $t3 , 1515268143 
 subu   $t4 , $t7 , $t7 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t6 
 sh   $t7 , 0($a0) 
 sw   $t7 , 0($a0) 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 andi   $t7 , $t1 , 1401204697 
 lh   $t1 , 0($a0) 
 mult  $t4 , $t4 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lb   $t6 , 0($a0) 
 nor   $t6 , $t1 , $t6 
 addiu   $t3 , $t7 , 570510815 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t5 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t5 , $t7 , 548449114 
 addiu   $t7 , $t1 , 1045863075 
 mult  $t6 , $t2 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t0 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t6 , $t6 , 2531738150 
 and   $t3 , $t5 , $t0 
 lh   $t2 , 0($a0) 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t3 
 andi   $t5 , $t6 , 300473194 
 addiu   $t4 , $t1 , 396402286 
 xor   $t6 , $t3 , $t1 
 sw   $t1 , 0($a0) 
 mult  $t3 , $t4 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 ori   $t5 , $t6 , 2510488098 
 xori   $t5 , $t4 , 3853880269 
 addiu   $t1 , $t3 , 209720395 
 mult  $t5 , $t6 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t3 
 ori   $t7 , $t0 , 3743656262 
 mult  $t6 , $t0 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t2 
 xori   $t2 , $t0 , 3619976563 
 xori   $t0 , $t0 , 2794752965 
 and   $t2 , $t5 , $t3 
 xori   $t6 , $t2 , 3473256884 
 or   $t6 , $t6 , $t0 
 addiu   $t2 , $t0 , 2615643208 
 xor   $t7 , $t7 , $t5 
 ori   $t4 , $t3 , 3872552291 
 mult  $t4 , $t6 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t5 
 lh   $t2 , 0($a0) 
 and   $t6 , $t7 , $t4 
 sw   $t7 , 0($a0) 
 and   $t6 , $t2 , $t2 
 nor   $t6 , $t6 , $t4 
 andi   $t7 , $t4 , 2731311456 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t0 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t5 
 addu   $t1 , $t0 , $t5 
 multu  $t5 , $t0 
 add $0, $0, $0
 mflo  $t3 
 ori   $t6 , $t5 , 2899063717 
 lw   $t1 , 0($a0) 
 addu   $t0 , $t7 , $t1 
 xori   $t7 , $t7 , 2068463301 
 lb   $t5 , 0($a0) 
 mult  $t6 , $t1 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t7 , $t0 , 1282493058 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t5 
 and   $t3 , $t1 , $t2 
 sw   $t6 , 0($a0) 
 sb   $t0 , 0($a0) 
 xori   $t2 , $t0 , 1156536868 
 xori   $t4 , $t4 , 3586135885 
 lbu   $t0 , 0($a0) 
 andi   $t5 , $t4 , 2493642286 
 sb   $t1 , 0($a0) 
 sltiu   $t5 , $t5 , 1115581045 
 lh   $t6 , 0($a0) 
 nor   $t2 , $t2 , $t2 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t4 
 nor   $t1 , $t3 , $t1 
 xor   $t5 , $t0 , $t1 
 lhu   $t0 , 0($a0) 
 nor   $t3 , $t0 , $t5 
 and   $t1 , $t6 , $t7 
 sw   $t1 , 0($a0) 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t0 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t6 
 xori   $t2 , $t7 , 3700536192 
 addiu   $t1 , $t7 , 641512302 
 lh   $t5 , 0($a0) 
 nor   $t2 , $t6 , $t4 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t5 
 or   $t5 , $t5 , $t3 
 subu   $t3 , $t4 , $t7 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t4 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t2 
 sw   $t1 , 0($a0) 
 andi   $t5 , $t5 , 1066299244 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t2 
 ori   $t1 , $t7 , 3528272743 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t7 
 or   $t5 , $t3 , $t1 
 lhu   $t5 , 0($a0) 
 lbu   $t1 , 0($a0) 
 addu   $t4 , $t1 , $t0 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t2 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t5 
 nor   $t5 , $t0 , $t5 
 and   $t5 , $t1 , $t6 
 lbu   $t4 , 0($a0) 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t6 
 subu   $t5 , $t0 , $t3 
 lbu   $t7 , 0($a0) 
 sb   $t6 , 0($a0) 
 subu   $t3 , $t6 , $t3 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t1 
 lb   $t1 , 0($a0) 
 ori   $t0 , $t6 , 97173442 
 or   $t7 , $t5 , $t0 
 sltiu   $t2 , $t4 , 4071644459 
 xor   $t5 , $t3 , $t2 
 andi   $t3 , $t1 , 1934163459 
 andi   $t0 , $t2 , 1633803366 
 mult  $t1 , $t3 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t3 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t4 
 lb   $t2 , 0($a0) 
 sb   $t5 , 0($a0) 
 addiu   $t3 , $t7 , 1692390305 
 xori   $t1 , $t0 , 165912299 
 or   $t3 , $t1 , $t6 
 andi   $t6 , $t6 , 3040123419 
 sb   $t0 , 0($a0) 
 lh   $t7 , 0($a0) 
 or   $t4 , $t4 , $t7 
 or   $t3 , $t4 , $t6 
 or   $t0 , $t3 , $t2 
 nor   $t0 , $t2 , $t2 
 lh   $t2 , 0($a0) 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 and   $t6 , $t2 , $t4 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t5 
 and   $t4 , $t4 , $t4 
 sb   $t2 , 0($a0) 
 nor   $t2 , $t3 , $t1 
 lb   $t5 , 0($a0) 
 andi   $t1 , $t4 , 907038140 
 lhu   $t0 , 0($a0) 
 subu   $t5 , $t6 , $t1 
 andi   $t1 , $t5 , 2305680941 
 xor   $t6 , $t5 , $t5 
 ori   $t4 , $t5 , 3866115326 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t7 
 sh   $t0 , 0($a0) 
 addiu   $t4 , $t1 , 2765945995 
 lb   $t7 , 0($a0) 
 andi   $t5 , $t3 , 3394318580 
 mult  $t7 , $t1 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t0 
 subu   $t6 , $t6 , $t6 
 lb   $t3 , 0($a0) 
 mult  $t6 , $t1 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t1 
 lw   $t2 , 0($a0) 
 subu   $t2 , $t6 , $t2 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t0 
 lw   $t2 , 0($a0) 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t6 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t6 
 multu  $t0 , $t6 
 add $0, $0, $0
 mflo  $t6 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t0 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t0 , $t4 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t2 
 xor   $t6 , $t3 , $t7 
 addiu   $t0 , $t5 , 1985751324 
 and   $t6 , $t5 , $t7 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t3 
 ori   $t4 , $t7 , 2423541704 
 ori   $t6 , $t3 , 2906056617 
 sb   $t0 , 0($a0) 
 xori   $t4 , $t3 , 1783098547 
 mult  $t0 , $t1 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t3 
 subu   $t6 , $t6 , $t5 
 or   $t6 , $t4 , $t7 
 sh   $t2 , 0($a0) 
 sb   $t0 , 0($a0) 
 and   $t2 , $t4 , $t4 
 lhu   $t4 , 0($a0) 
 ori   $t1 , $t2 , 1107995685 
 xor   $t4 , $t4 , $t3 
 lh   $t4 , 0($a0) 
 andi   $t1 , $t5 , 4019014543 
 or   $t7 , $t6 , $t2 
 xor   $t7 , $t5 , $t0 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t5 , $t1 , 3512087460 
 lw   $t1 , 0($a0) 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t1 , $t7 , 3317501655 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t1 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t6 , $t4 , 2509175319 
 xori   $t4 , $t4 , 1105659961 
 sb   $t1 , 0($a0) 
 sltiu   $t1 , $t0 , 4037896546 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t5 
 or   $t0 , $t7 , $t5 
 sb   $t6 , 0($a0) 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t7 
 lb   $t7 , 0($a0) 
 lw   $t0 , 0($a0) 
 addu   $t1 , $t2 , $t2 
 multu  $t7 , $t3 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t6 , 0($a0) 
 xor   $t0 , $t5 , $t6 
 subu   $t3 , $t3 , $t3 
 and   $t3 , $t6 , $t0 
 ori   $t6 , $t6 , 3117896473 
 andi   $t2 , $t5 , 1996647249 
 mult  $t1 , $t3 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 and   $t1 , $t0 , $t3 
 mult  $t2 , $t6 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t1 
 lbu   $t1 , 0($a0) 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sb   $t0 , 0($a0) 
 sh   $t6 , 0($a0) 
 sltiu   $t7 , $t0 , 1077876217 
 andi   $t7 , $t5 , 3522660114 
 xor   $t2 , $t0 , $t7 
 sw   $t6 , 0($a0) 
 sb   $t5 , 0($a0) 
 lbu   $t3 , 0($a0) 
 ori   $t6 , $t0 , 3920401264 
 xor   $t3 , $t7 , $t1 
 subu   $t1 , $t1 , $t7 
 andi   $t5 , $t6 , 1106371326 
 xor   $t1 , $t1 , $t1 
 xori   $t7 , $t3 , 145042537 
 subu   $t6 , $t7 , $t3 
 xori   $t1 , $t1 , 3282796313 
 lh   $t1 , 0($a0) 
 subu   $t3 , $t4 , $t2 
 or   $t2 , $t4 , $t2 
 sh   $t7 , 0($a0) 
 sw   $t4 , 0($a0) 
 andi   $t3 , $t3 , 746481198 
 andi   $t4 , $t2 , 3221431650 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t3 
 nor   $t2 , $t7 , $t7 
 andi   $t5 , $t4 , 3833224182 
 sltiu   $t1 , $t0 , 2732140227 
 lbu   $t0 , 0($a0) 
 mult  $t4 , $t6 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t5 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t5 
 sw   $t0 , 0($a0) 
 andi   $t5 , $t0 , 1471605112 
 lw   $t3 , 0($a0) 
 xor   $t7 , $t6 , $t6 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lb   $t0 , 0($a0) 
 lbu   $t3 , 0($a0) 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t3 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t3 
 and   $t1 , $t7 , $t1 
 xori   $t5 , $t5 , 3263565884 
 sb   $t3 , 0($a0) 
 andi   $t6 , $t0 , 1255578729 
 xori   $t6 , $t7 , 3361033386 
 mult  $t0 , $t4 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t3 
 and   $t4 , $t1 , $t0 
 xor   $t2 , $t4 , $t2 
 lb   $t4 , 0($a0) 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t1 
 lb   $t6 , 0($a0) 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t0 
 subu   $t6 , $t0 , $t6 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t6 
 xori   $t2 , $t0 , 1977052889 
 xori   $t7 , $t7 , 412589336 
 mult  $t2 , $t6 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lw   $t3 , 0($a0) 
 ori   $t6 , $t4 , 2652989149 
 sb   $t0 , 0($a0) 
 sw   $t4 , 0($a0) 
 xori   $t0 , $t5 , 1823358744 
 addiu   $t3 , $t3 , 3170564144 
 addu   $t2 , $t3 , $t2 
 lhu   $t0 , 0($a0) 
 ori   $t2 , $t0 , 3244995737 
 lhu   $t2 , 0($a0) 
 xor   $t7 , $t5 , $t5 
 and   $t1 , $t7 , $t0 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t1 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t7 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t6 
 xor   $t5 , $t4 , $t5 
 xori   $t0 , $t5 , 1931238580 
 sltiu   $t3 , $t1 , 1639167563 
 xori   $t7 , $t3 , 3345660656 
 ori   $t1 , $t1 , 2117037688 
 sltiu   $t1 , $t2 , 2154545846 
 sltiu   $t7 , $t4 , 2729675467 
 sw   $t0 , 0($a0) 
 mult  $t3 , $t7 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t2 
 nor   $t7 , $t4 , $t2 
 lhu   $t7 , 0($a0) 
 sltiu   $t1 , $t2 , 2132280595 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t6 
 addu   $t1 , $t2 , $t5 
 lh   $t7 , 0($a0) 
 and   $t3 , $t7 , $t4 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t4 
 andi   $t4 , $t5 , 3944432499 
 andi   $t2 , $t5 , 3157674284 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t5 
 subu   $t5 , $t5 , $t2 
 lh   $t5 , 0($a0) 
 sw   $t1 , 0($a0) 
 xori   $t5 , $t3 , 1388009573 
 mult  $t1 , $t4 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t2 
 xori   $t4 , $t0 , 2925124414 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t6 
 nor   $t7 , $t5 , $t6 
 subu   $t1 , $t4 , $t7 
 sh   $t1 , 0($a0) 
 sb   $t7 , 0($a0) 
 addiu   $t4 , $t1 , 499876669 
 sw   $t0 , 0($a0) 
 ori   $t0 , $t5 , 591797118 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t7 
 addu   $t0 , $t7 , $t3 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t7 
 sb   $t3 , 0($a0) 
 lb   $t2 , 0($a0) 
 sb   $t4 , 0($a0) 
 and   $t4 , $t2 , $t6 
 sb   $t3 , 0($a0) 
 xori   $t1 , $t0 , 3903933750 
 xori   $t3 , $t4 , 870050556 
 lhu   $t0 , 0($a0) 
 lb   $t2 , 0($a0) 
 mult  $t1 , $t6 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t4 
 multu  $t7 , $t5 
 add $0, $0, $0
 mflo  $t1 
 mult  $t0 , $t7 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t6 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t3 
 and   $t1 , $t6 , $t5 
 mult  $t0 , $t3 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t3 
 xor   $t1 , $t3 , $t3 
 lbu   $t6 , 0($a0) 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t7 
 addiu   $t2 , $t2 , 297521910 
 lw   $t5 , 0($a0) 
 and   $t2 , $t6 , $t7 
 lbu   $t7 , 0($a0) 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t5 
 subu   $t3 , $t1 , $t2 
 ori   $t4 , $t6 , 1030428437 
 xori   $t3 , $t2 , 584603256 
 sh   $t0 , 0($a0) 
 subu   $t3 , $t7 , $t1 
 mult  $t7 , $t4 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t7 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t4 
 mult  $t5 , $t5 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t4 
 lh   $t1 , 0($a0) 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t4 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t2 
 xori   $t0 , $t4 , 3986598625 
 sltiu   $t7 , $t7 , 2421714104 
 lb   $t3 , 0($a0) 
 xor   $t6 , $t5 , $t2 
 xor   $t2 , $t4 , $t2 
 mult  $t7 , $t0 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t3 , $t4 , 3062832370 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t7 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t2 
 andi   $t6 , $t6 , 3908128808 
 ori   $t5 , $t0 , 530229182 
 multu  $t4 , $t0 
 add $0, $0, $0
 mflo  $t4 
 mult  $t5 , $t7 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t0 , 0($a0) 
 mult  $t0 , $t3 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t5 
 sh   $t4 , 0($a0) 
 andi   $t7 , $t4 , 2222074217 
 lbu   $t3 , 0($a0) 
 mult  $t5 , $t5 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t5 
 xori   $t2 , $t1 , 1051524450 
 ori   $t4 , $t1 , 498433037 
 sltiu   $t3 , $t2 , 3746024974 
 sh   $t7 , 0($a0) 
 and   $t1 , $t1 , $t6 
 addiu   $t7 , $t2 , 2745367209 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t3 
 lw   $t7 , 0($a0) 
 lhu   $t1 , 0($a0) 
 andi   $t6 , $t7 , 3220278103 
 addiu   $t7 , $t5 , 1590964377 
 lbu   $t3 , 0($a0) 
 andi   $t6 , $t0 , 1131292026 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t4 , 0($a0) 
 and   $t0 , $t3 , $t4 
 nor   $t5 , $t0 , $t0 
 addu   $t0 , $t6 , $t2 
 multu  $t2 , $t2 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t2 , $t1 , 610216702 
 nor   $t2 , $t5 , $t1 
 sh   $t1 , 0($a0) 
 lbu   $t3 , 0($a0) 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t4 
 ori   $t5 , $t3 , 1098649211 
 andi   $t3 , $t3 , 4249937551 
 sh   $t0 , 0($a0) 
 sb   $t4 , 0($a0) 
 or   $t7 , $t3 , $t5 
 or   $t6 , $t5 , $t6 
 mult  $t3 , $t3 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t0 
 andi   $t5 , $t3 , 2671082249 
 sb   $t4 , 0($a0) 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t5 
 mult  $t5 , $t2 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t5 
 or   $t5 , $t6 , $t6 
 lhu   $t0 , 0($a0) 
 sh   $t4 , 0($a0) 
 subu   $t3 , $t3 , $t5 
 xor   $t2 , $t1 , $t1 
 sltiu   $t5 , $t2 , 3114844432 
 andi   $t5 , $t4 , 619461097 
 or   $t1 , $t2 , $t7 
 nor   $t7 , $t3 , $t3 
 lb   $t4 , 0($a0) 
 or   $t3 , $t4 , $t4 
 xori   $t2 , $t4 , 3461696949 
 xor   $t4 , $t5 , $t0 
 addu   $t1 , $t7 , $t0 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t3 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t2 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t7 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 sw   $t3 , 0($a0) 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t2 
 ori   $t1 , $t5 , 4070713952 
 sh   $t4 , 0($a0) 
 subu   $t2 , $t1 , $t2 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t5 
 nor   $t1 , $t7 , $t1 
 mult  $t0 , $t5 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t0 
 addu   $t4 , $t5 , $t7 
 xori   $t2 , $t7 , 4134398731 
 or   $t0 , $t2 , $t1 
 andi   $t3 , $t0 , 3054406061 
 lw   $t2 , 0($a0) 
 mult  $t4 , $t7 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t6 
 nor   $t2 , $t2 , $t7 
 mult  $t2 , $t5 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t6 
 lb   $t5 , 0($a0) 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t3 
 or   $t7 , $t6 , $t3 
 and   $t2 , $t4 , $t4 
 andi   $t3 , $t7 , 3115271789 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t1 
 nor   $t7 , $t1 , $t6 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lh   $t3 , 0($a0) 
 mult  $t4 , $t0 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t0 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t0 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t4 
 sw   $t0 , 0($a0) 
 xori   $t6 , $t0 , 3169701204 
 sltiu   $t4 , $t5 , 2389163634 
 mult  $t0 , $t0 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t1 
 nor   $t2 , $t6 , $t4 
 sb   $t3 , 0($a0) 
 lb   $t2 , 0($a0) 
 nor   $t5 , $t5 , $t3 
 andi   $t4 , $t0 , 260290296 
 xori   $t7 , $t7 , 1776687160 
 sb   $t0 , 0($a0) 
 ori   $t4 , $t7 , 3672951183 
 xori   $t7 , $t4 , 271403390 
 addu   $t2 , $t4 , $t6 
 addiu   $t6 , $t5 , 3903351348 
 xor   $t4 , $t7 , $t1 
 addiu   $t3 , $t5 , 1469272514 
 sh   $t5 , 0($a0) 
 andi   $t5 , $t7 , 2823849128 
 xori   $t7 , $t4 , 2888636471 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t2 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t1 
 nor   $t6 , $t7 , $t6 
 sw   $t0 , 0($a0) 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t7 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t1 
 and   $t7 , $t6 , $t7 
 sltiu   $t2 , $t0 , 1285281222 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t5 
 sb   $t5 , 0($a0) 
 subu   $t5 , $t6 , $t3 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t3 
 lh   $t6 , 0($a0) 
 subu   $t1 , $t2 , $t1 
 xor   $t6 , $t6 , $t7 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t3 
 or   $t0 , $t0 , $t3 
 sb   $t7 , 0($a0) 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t1 
 lw   $t5 , 0($a0) 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t3 
 subu   $t5 , $t4 , $t7 
 xor   $t4 , $t5 , $t5 
 lw   $t6 , 0($a0) 
 xori   $t1 , $t5 , 737684445 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t2 
 addu   $t5 , $t5 , $t0 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t5 , 0($a0) 
 lb   $t1 , 0($a0) 
 and   $t6 , $t3 , $t3 
 mult  $t5 , $t2 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t0 
 xor   $t4 , $t6 , $t5 
 sh   $t2 , 0($a0) 
 lhu   $t3 , 0($a0) 
 sh   $t7 , 0($a0) 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t1 
 lb   $t5 , 0($a0) 
 lbu   $t6 , 0($a0) 
 ori   $t3 , $t1 , 3298146134 
 lbu   $t0 , 0($a0) 
 lbu   $t4 , 0($a0) 
 xor   $t1 , $t5 , $t3 
 subu   $t0 , $t1 , $t2 
 lw   $t2 , 0($a0) 
 and   $t6 , $t2 , $t2 
 addiu   $t7 , $t7 , 2113533553 
 sh   $t4 , 0($a0) 
 subu   $t7 , $t7 , $t3 
 andi   $t7 , $t1 , 79617978 
 subu   $t5 , $t7 , $t0 
 lb   $t7 , 0($a0) 
 andi   $t2 , $t6 , 2712900163 
 lbu   $t4 , 0($a0) 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t3 
 lw   $t2 , 0($a0) 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t0 
 lb   $t4 , 0($a0) 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t4 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t2 
 ori   $t3 , $t0 , 748040531 
 lbu   $t5 , 0($a0) 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t2 , $t4 , 970720778 
 lb   $t0 , 0($a0) 
 ori   $t4 , $t7 , 2737697074 
 addu   $t5 , $t0 , $t3 
 nor   $t5 , $t2 , $t0 
 subu   $t1 , $t6 , $t1 
 subu   $t1 , $t0 , $t6 
 sw   $t6 , 0($a0) 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t6 
 sh   $t1 , 0($a0) 
 subu   $t7 , $t2 , $t0 
 sltiu   $t6 , $t5 , 1446278984 
 nor   $t0 , $t2 , $t7 
 sltiu   $t7 , $t2 , 3082330115 
 mult  $t7 , $t7 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t2 
 lw   $t1 , 0($a0) 
 sb   $t1 , 0($a0) 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t2 
 subu   $t1 , $t7 , $t0 
 subu   $t4 , $t3 , $t4 
 and   $t3 , $t5 , $t5 
 lh   $t6 , 0($a0) 
 sb   $t2 , 0($a0) 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t5 
 mult  $t0 , $t1 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t2 
 andi   $t3 , $t0 , 2433886890 
 xor   $t3 , $t4 , $t2 
 subu   $t0 , $t0 , $t7 
 multu  $t3 , $t3 
 add $0, $0, $0
 mflo  $t0 
 lw   $t5 , 0($a0) 
 sb   $t4 , 0($a0) 
 addiu   $t6 , $t5 , 3121525837 
 sh   $t2 , 0($a0) 
 lbu   $t2 , 0($a0) 
 sltiu   $t5 , $t1 , 2075862344 
 ori   $t6 , $t1 , 887777572 
 ori   $t1 , $t7 , 3524957071 
 mult  $t7 , $t4 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t2 
 ori   $t1 , $t4 , 3938881237 
 or   $t7 , $t6 , $t5 
 or   $t5 , $t1 , $t2 
 multu  $t7 , $t2 
 add $0, $0, $0
 mflo  $t2 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t7 
 multu  $t0 , $t6 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t5 , $t7 , 3098127878 
 nor   $t7 , $t0 , $t0 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t0 
 lw   $t4 , 0($a0) 
 subu   $t4 , $t7 , $t2 
 andi   $t6 , $t5 , 2097196982 
 lb   $t0 , 0($a0) 
 andi   $t2 , $t6 , 3012388309 
 addu   $t2 , $t1 , $t0 
 sh   $t7 , 0($a0) 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t6 
 addu   $t7 , $t7 , $t6 
 xori   $t5 , $t6 , 2797193825 
 lh   $t7 , 0($a0) 
 and   $t1 , $t4 , $t1 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 xor   $t7 , $t3 , $t2 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t5 
 mult  $t5 , $t6 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t7 , $t0 , 4011728531 
 sltiu   $t0 , $t6 , 2575808979 
 sw   $t2 , 0($a0) 
 sb   $t5 , 0($a0) 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t0 
 addu   $t4 , $t5 , $t1 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t2 
 lw   $t4 , 0($a0) 
 addiu   $t1 , $t0 , 4286337499 
 lbu   $t0 , 0($a0) 
 xor   $t6 , $t0 , $t5 
 mult  $t7 , $t5 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t6 
 subu   $t4 , $t0 , $t1 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t1 
 subu   $t1 , $t4 , $t6 
 multu  $t1 , $t2 
 add $0, $0, $0
 mflo  $t5 
 or   $t0 , $t0 , $t0 
 multu  $t3 , $t5 
 add $0, $0, $0
 mflo  $t5 
 ori   $t3 , $t7 , 2971849886 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t0 
 xor   $t4 , $t1 , $t6 
 and   $t6 , $t1 , $t2 
 xori   $t4 , $t2 , 2776941227 
 addiu   $t4 , $t6 , 136893671 
 sh   $t0 , 0($a0) 
 sh   $t7 , 0($a0) 
 addu   $t6 , $t1 , $t6 
 lb   $t1 , 0($a0) 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sb   $t5 , 0($a0) 
 addiu $v0, $0, 10
 syscall

