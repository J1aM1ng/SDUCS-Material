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
 lhu   $t0 , 0($a0) 
 lhu   $t4 , 0($a0) 
 ori   $t7 , $t4 , 2729933903 
 or   $t5 , $t1 , $t3 
 sltiu   $t2 , $t1 , 3011976240 
 sh   $t6 , 0($a0) 
 sltiu   $t2 , $t6 , 3015374350 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t6 
 xori   $t1 , $t4 , 1362695921 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t2 
 mult  $t1 , $t2 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sh   $t7 , 0($a0) 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t3 
 lw   $t1 , 0($a0) 
 andi   $t2 , $t2 , 115433387 
 multu  $t0 , $t3 
 add $0, $0, $0
 mflo  $t2 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t0 
 addu   $t7 , $t6 , $t6 
 lbu   $t0 , 0($a0) 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t3 
 or   $t5 , $t1 , $t5 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t6 
 ori   $t3 , $t4 , 1266412729 
 lw   $t4 , 0($a0) 
 addiu   $t0 , $t0 , 4093516433 
 mult  $t5 , $t6 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t2 
 mult  $t2 , $t0 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t6 
 mult  $t0 , $t4 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t4 
 ori   $t0 , $t0 , 882082085 
 sltiu   $t5 , $t7 , 2585405804 
 ori   $t4 , $t5 , 3871323927 
 nor   $t5 , $t7 , $t0 
 addu   $t3 , $t7 , $t2 
 sb   $t1 , 0($a0) 
 or   $t2 , $t4 , $t3 
 subu   $t6 , $t0 , $t5 
 xori   $t0 , $t5 , 3790020899 
 sb   $t6 , 0($a0) 
 sw   $t0 , 0($a0) 
 and   $t0 , $t6 , $t1 
 xor   $t7 , $t7 , $t7 
 ori   $t0 , $t5 , 2323502251 
 xor   $t7 , $t5 , $t7 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t1 
 xor   $t2 , $t3 , $t4 
 andi   $t3 , $t7 , 1118277755 
 sw   $t2 , 0($a0) 
 and   $t0 , $t4 , $t3 
 addu   $t2 , $t5 , $t7 
 lbu   $t1 , 0($a0) 
 and   $t5 , $t7 , $t5 
 nor   $t7 , $t5 , $t3 
 multu  $t7 , $t0 
 add $0, $0, $0
 mflo  $t3 
 addu   $t3 , $t4 , $t4 
 xori   $t7 , $t1 , 4136879635 
 sh   $t5 , 0($a0) 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t6 
 ori   $t3 , $t6 , 2742447397 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t3 
 lhu   $t5 , 0($a0) 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t3 
 andi   $t1 , $t2 , 4116431960 
 xori   $t7 , $t3 , 1244996961 
 mult  $t3 , $t5 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lw   $t7 , 0($a0) 
 andi   $t7 , $t2 , 4173254139 
 or   $t4 , $t4 , $t0 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t4 
 subu   $t0 , $t4 , $t4 
 multu  $t5 , $t0 
 add $0, $0, $0
 mflo  $t7 
 nor   $t1 , $t7 , $t2 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 sh   $t5 , 0($a0) 
 subu   $t4 , $t5 , $t7 
 sltiu   $t4 , $t2 , 1594696531 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t7 , $t3 , 2045101671 
 or   $t6 , $t2 , $t3 
 subu   $t7 , $t6 , $t5 
 ori   $t5 , $t3 , 3110309671 
 or   $t1 , $t2 , $t3 
 mult  $t6 , $t7 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t3 , $t5 , 111764386 
 or   $t4 , $t5 , $t7 
 nor   $t0 , $t7 , $t2 
 xori   $t5 , $t6 , 753006068 
 sb   $t6 , 0($a0) 
 sw   $t0 , 0($a0) 
 lb   $t3 , 0($a0) 
 or   $t5 , $t0 , $t3 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t2 , 0($a0) 
 mult  $t5 , $t7 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t2 
 andi   $t3 , $t5 , 916242657 
 addiu   $t2 , $t5 , 1894922815 
 xor   $t2 , $t2 , $t6 
 andi   $t3 , $t6 , 1993913730 
 addiu   $t0 , $t3 , 1080651265 
 lhu   $t4 , 0($a0) 
 lh   $t6 , 0($a0) 
 ori   $t6 , $t7 , 2381021912 
 ori   $t2 , $t7 , 125931597 
 lw   $t2 , 0($a0) 
 andi   $t4 , $t7 , 426836402 
 lw   $t2 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t6 
 xor   $t7 , $t2 , $t4 
 andi   $t0 , $t6 , 289873567 
 mult  $t0 , $t2 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 xor   $t3 , $t7 , $t3 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t3 
 xor   $t6 , $t7 , $t2 
 mult  $t6 , $t6 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t3 
 xori   $t7 , $t0 , 2378492437 
 mult  $t4 , $t1 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t3 , $t0 , 1070698072 
 ori   $t3 , $t5 , 690431951 
 mult  $t3 , $t2 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t3 , $t1 , 1256538574 
 andi   $t5 , $t1 , 883884279 
 addiu   $t7 , $t3 , 207674793 
 and   $t1 , $t0 , $t7 
 sltiu   $t1 , $t3 , 1986925306 
 lh   $t0 , 0($a0) 
 ori   $t6 , $t5 , 3460357873 
 ori   $t1 , $t5 , 1553752758 
 and   $t6 , $t7 , $t2 
 xor   $t5 , $t1 , $t6 
 and   $t1 , $t6 , $t2 
 sb   $t3 , 0($a0) 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t0 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t6 , $t6 , 5289455 
 addiu   $t1 , $t0 , 2891266905 
 mult  $t7 , $t0 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t7 
 subu   $t3 , $t1 , $t7 
 or   $t5 , $t2 , $t7 
 or   $t7 , $t5 , $t4 
 or   $t1 , $t6 , $t4 
 sw   $t3 , 0($a0) 
 or   $t1 , $t7 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t7 
 or   $t2 , $t6 , $t7 
 lhu   $t1 , 0($a0) 
 subu   $t0 , $t6 , $t4 
 xori   $t3 , $t2 , 2550457674 
 xor   $t2 , $t4 , $t7 
 sw   $t7 , 0($a0) 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t6 , 0($a0) 
 addu   $t1 , $t2 , $t3 
 xori   $t0 , $t3 , 1907516554 
 sltiu   $t4 , $t7 , 3943913460 
 sw   $t2 , 0($a0) 
 lh   $t3 , 0($a0) 
 sh   $t3 , 0($a0) 
 andi   $t7 , $t5 , 3587921029 
 addu   $t2 , $t4 , $t6 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t2 , $t0 , 3857708916 
 ori   $t1 , $t6 , 486594330 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t7 
 addiu   $t2 , $t5 , 3237586240 
 andi   $t1 , $t1 , 3399571689 
 lhu   $t4 , 0($a0) 
 sltiu   $t2 , $t0 , 1312333854 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t5 
 addu   $t4 , $t4 , $t3 
 addiu   $t5 , $t6 , 3833125346 
 nor   $t0 , $t5 , $t3 
 addu   $t1 , $t4 , $t4 
 sltiu   $t5 , $t2 , 635786979 
 sw   $t3 , 0($a0) 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t6 
 and   $t1 , $t4 , $t2 
 xor   $t6 , $t4 , $t3 
 subu   $t6 , $t1 , $t3 
 sltiu   $t4 , $t2 , 2852948051 
 addu   $t3 , $t3 , $t3 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t2 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 ori   $t1 , $t0 , 94093295 
 sh   $t2 , 0($a0) 
 sltiu   $t5 , $t6 , 3099082414 
 ori   $t3 , $t5 , 9137981 
 sh   $t0 , 0($a0) 
 sh   $t1 , 0($a0) 
 or   $t1 , $t3 , $t1 
 subu   $t4 , $t5 , $t1 
 subu   $t2 , $t2 , $t4 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t2 
 xori   $t3 , $t2 , 1295190960 
 lh   $t7 , 0($a0) 
 sh   $t0 , 0($a0) 
 addu   $t0 , $t0 , $t5 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t0 , $t7 , 3751103113 
 sltiu   $t2 , $t7 , 4146058171 
 xori   $t7 , $t4 , 2976491292 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t0 
 mult  $t3 , $t4 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sb   $t7 , 0($a0) 
 addiu   $t1 , $t3 , 3569998315 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t2 
 xori   $t0 , $t7 , 2631019 
 sw   $t4 , 0($a0) 
 mult  $t0 , $t6 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t0 , $t5 , 3488103918 
 ori   $t6 , $t1 , 1683154406 
 lb   $t5 , 0($a0) 
 multu  $t3 , $t5 
 add $0, $0, $0
 mflo  $t2 
 nor   $t7 , $t1 , $t0 
 xor   $t7 , $t0 , $t0 
 subu   $t0 , $t1 , $t4 
 sb   $t6 , 0($a0) 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t6 
 sw   $t1 , 0($a0) 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t4 
 lb   $t0 , 0($a0) 
 lbu   $t5 , 0($a0) 
 lhu   $t7 , 0($a0) 
 addiu   $t1 , $t7 , 2871982453 
 subu   $t5 , $t7 , $t0 
 addiu   $t5 , $t2 , 3625992391 
 lbu   $t1 , 0($a0) 
 addu   $t0 , $t5 , $t5 
 addiu   $t2 , $t5 , 991871736 
 lbu   $t6 , 0($a0) 
 ori   $t4 , $t6 , 1080219185 
 lw   $t4 , 0($a0) 
 sltiu   $t6 , $t6 , 2092767961 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t5 
 sw   $t6 , 0($a0) 
 xori   $t0 , $t7 , 1669376876 
 lhu   $t2 , 0($a0) 
 subu   $t6 , $t4 , $t7 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 mult  $t1 , $t2 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t5 
 sw   $t2 , 0($a0) 
 or   $t2 , $t7 , $t2 
 xori   $t6 , $t3 , 740184428 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t2 
 lh   $t2 , 0($a0) 
 xori   $t3 , $t0 , 2460638028 
 sltiu   $t3 , $t1 , 3568686733 
 nor   $t6 , $t4 , $t1 
 ori   $t2 , $t3 , 3218972181 
 addu   $t6 , $t7 , $t3 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t6 , $t2 , 274391706 
 sltiu   $t2 , $t5 , 138295645 
 sw   $t5 , 0($a0) 
 sltiu   $t0 , $t4 , 2538799073 
 addiu   $t3 , $t6 , 750578144 
 ori   $t7 , $t6 , 1847326574 
 sb   $t2 , 0($a0) 
 or   $t5 , $t5 , $t3 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t4 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 xori   $t5 , $t1 , 3602061670 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t0 , 0($a0) 
 lw   $t6 , 0($a0) 
 addu   $t1 , $t2 , $t0 
 addu   $t6 , $t0 , $t7 
 subu   $t3 , $t7 , $t7 
 and   $t0 , $t7 , $t5 
 lbu   $t1 , 0($a0) 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t4 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 sb   $t1 , 0($a0) 
 subu   $t2 , $t0 , $t6 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 lhu   $t1 , 0($a0) 
 or   $t7 , $t0 , $t7 
 xor   $t3 , $t7 , $t7 
 and   $t7 , $t4 , $t1 
 or   $t1 , $t2 , $t3 
 ori   $t5 , $t6 , 3667191801 
 subu   $t7 , $t7 , $t5 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t3 
 nor   $t2 , $t5 , $t6 
 nor   $t0 , $t2 , $t1 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t0 
 andi   $t1 , $t5 , 1825047739 
 subu   $t4 , $t6 , $t7 
 multu  $t5 , $t6 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t6 , $t1 , 1772380804 
 sltiu   $t4 , $t5 , 3552744064 
 lw   $t1 , 0($a0) 
 mult  $t0 , $t0 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t2 
 sh   $t1 , 0($a0) 
 xori   $t4 , $t3 , 2069495775 
 sltiu   $t6 , $t3 , 1865070121 
 and   $t3 , $t5 , $t7 
 lh   $t0 , 0($a0) 
 xor   $t0 , $t0 , $t1 
 sb   $t7 , 0($a0) 
 sb   $t3 , 0($a0) 
 xor   $t7 , $t3 , $t4 
 ori   $t0 , $t2 , 1392733748 
 lh   $t3 , 0($a0) 
 addiu   $t3 , $t2 , 2791995468 
 addiu   $t1 , $t6 , 2746709779 
 lh   $t3 , 0($a0) 
 lh   $t0 , 0($a0) 
 lh   $t2 , 0($a0) 
 sltiu   $t2 , $t4 , 2577296981 
 xor   $t6 , $t1 , $t7 
 andi   $t4 , $t1 , 772398950 
 addiu   $t5 , $t0 , 3875053982 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t4 
 nor   $t6 , $t0 , $t6 
 addu   $t6 , $t1 , $t0 
 addiu   $t5 , $t4 , 1892366413 
 lw   $t5 , 0($a0) 
 or   $t2 , $t7 , $t2 
 lb   $t6 , 0($a0) 
 multu  $t5 , $t0 
 add $0, $0, $0
 mflo  $t3 
 lh   $t2 , 0($a0) 
 ori   $t2 , $t6 , 2278075470 
 lw   $t6 , 0($a0) 
 xori   $t4 , $t6 , 2036350478 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t2 
 nor   $t3 , $t5 , $t2 
 sh   $t6 , 0($a0) 
 sh   $t4 , 0($a0) 
 sw   $t1 , 0($a0) 
 lw   $t3 , 0($a0) 
 nor   $t3 , $t1 , $t6 
 nor   $t6 , $t4 , $t3 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t6 
 subu   $t5 , $t2 , $t4 
 subu   $t7 , $t0 , $t2 
 andi   $t4 , $t2 , 555370129 
 mult  $t6 , $t1 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t0 
 xori   $t2 , $t4 , 1910594419 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t7 
 addiu   $t4 , $t5 , 2151099146 
 sw   $t0 , 0($a0) 
 xori   $t2 , $t2 , 2346721484 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t7 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t4 
 or   $t6 , $t5 , $t7 
 sltiu   $t2 , $t4 , 3692251207 
 subu   $t5 , $t2 , $t0 
 lb   $t4 , 0($a0) 
 xori   $t3 , $t0 , 2085724323 
 xori   $t5 , $t3 , 4215115921 
 and   $t7 , $t6 , $t5 
 nor   $t3 , $t4 , $t5 
 or   $t6 , $t6 , $t7 
 sw   $t3 , 0($a0) 
 xori   $t5 , $t2 , 2270550822 
 addu   $t2 , $t6 , $t6 
 lh   $t5 , 0($a0) 
 addiu   $t7 , $t7 , 761185644 
 addu   $t7 , $t0 , $t5 
 addu   $t6 , $t7 , $t5 
 sw   $t4 , 0($a0) 
 nor   $t6 , $t1 , $t7 
 lbu   $t5 , 0($a0) 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t4 
 ori   $t7 , $t1 , 601788740 
 lhu   $t1 , 0($a0) 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t1 
 xor   $t6 , $t0 , $t7 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 xori   $t6 , $t5 , 1051695410 
 lw   $t5 , 0($a0) 
 or   $t1 , $t1 , $t2 
 lh   $t7 , 0($a0) 
 sb   $t3 , 0($a0) 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t3 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t2 
 nor   $t0 , $t2 , $t2 
 mult  $t6 , $t0 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t3 
 subu   $t1 , $t4 , $t6 
 xori   $t6 , $t3 , 1840068049 
 addiu   $t5 , $t2 , 245739422 
 mult  $t0 , $t2 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t3 
 lb   $t5 , 0($a0) 
 subu   $t4 , $t4 , $t3 
 sb   $t7 , 0($a0) 
 sltiu   $t5 , $t1 , 2002088008 
 lw   $t2 , 0($a0) 
 sh   $t5 , 0($a0) 
 sltiu   $t2 , $t3 , 1021137235 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t1 , $t7 , 3969893262 
 nor   $t3 , $t4 , $t2 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t7 , $t3 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t4 
 subu   $t3 , $t1 , $t5 
 multu  $t2 , $t2 
 add $0, $0, $0
 mflo  $t2 
 xor   $t3 , $t4 , $t4 
 sb   $t5 , 0($a0) 
 lbu   $t6 , 0($a0) 
 multu  $t0 , $t6 
 add $0, $0, $0
 mflo  $t1 
 addu   $t4 , $t4 , $t2 
 ori   $t1 , $t0 , 3495926910 
 nor   $t4 , $t7 , $t3 
 addiu   $t3 , $t6 , 3685504025 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t1 
 subu   $t4 , $t6 , $t3 
 lb   $t2 , 0($a0) 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sw   $t6 , 0($a0) 
 addiu   $t3 , $t3 , 1458836953 
 sltiu   $t5 , $t0 , 3169786032 
 xori   $t4 , $t6 , 1012999513 
 multu  $t0 , $t6 
 add $0, $0, $0
 mflo  $t7 
 ori   $t0 , $t7 , 2840368482 
 xor   $t4 , $t3 , $t4 
 sw   $t0 , 0($a0) 
 andi   $t2 , $t0 , 3529956749 
 lh   $t5 , 0($a0) 
 ori   $t4 , $t4 , 3342572792 
 andi   $t4 , $t0 , 1950352147 
 lb   $t2 , 0($a0) 
 lw   $t4 , 0($a0) 
 multu  $t0 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t1 
 addu   $t5 , $t0 , $t7 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t5 
 sw   $t7 , 0($a0) 
 xor   $t7 , $t6 , $t4 
 or   $t6 , $t1 , $t5 
 sltiu   $t1 , $t6 , 2679323473 
 lbu   $t3 , 0($a0) 
 addiu   $t7 , $t2 , 1018039592 
 andi   $t5 , $t6 , 2779869449 
 lw   $t4 , 0($a0) 
 sb   $t0 , 0($a0) 
 lhu   $t3 , 0($a0) 
 nor   $t4 , $t6 , $t7 
 nor   $t4 , $t4 , $t6 
 ori   $t5 , $t6 , 1367463057 
 addu   $t2 , $t5 , $t5 
 xor   $t6 , $t1 , $t4 
 xor   $t4 , $t6 , $t4 
 mult  $t7 , $t4 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t7 , 0($a0) 
 lbu   $t3 , 0($a0) 
 sb   $t5 , 0($a0) 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t3 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t5 
 sw   $t6 , 0($a0) 
 andi   $t0 , $t4 , 3328682651 
 sw   $t2 , 0($a0) 
 andi   $t6 , $t5 , 2437105998 
 ori   $t0 , $t5 , 2265430022 
 and   $t6 , $t2 , $t2 
 mult  $t6 , $t1 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t7 
 addu   $t5 , $t1 , $t7 
 lw   $t0 , 0($a0) 
 addiu   $t1 , $t3 , 1744869003 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t7 
 ori   $t7 , $t2 , 1674223464 
 xor   $t4 , $t2 , $t5 
 sltiu   $t4 , $t0 , 3307035857 
 lhu   $t3 , 0($a0) 
 nor   $t2 , $t6 , $t2 
 sltiu   $t1 , $t7 , 3619843633 
 andi   $t5 , $t4 , 2655549939 
 sh   $t6 , 0($a0) 
 mult  $t3 , $t0 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lhu   $t1 , 0($a0) 
 mult  $t0 , $t2 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t7 , 0($a0) 
 lbu   $t5 , 0($a0) 
 mult  $t0 , $t7 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sw   $t6 , 0($a0) 
 sltiu   $t1 , $t5 , 3221395185 
 xor   $t0 , $t4 , $t2 
 or   $t6 , $t4 , $t4 
 nor   $t4 , $t5 , $t1 
 addiu   $t2 , $t4 , 50312816 
 sw   $t4 , 0($a0) 
 mult  $t4 , $t4 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t4 
 sw   $t4 , 0($a0) 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t7 , $t2 , 569581836 
 multu  $t3 , $t5 
 add $0, $0, $0
 mflo  $t0 
 addu   $t2 , $t1 , $t2 
 andi   $t1 , $t7 , 1795463704 
 nor   $t6 , $t5 , $t5 
 or   $t4 , $t2 , $t4 
 mult  $t0 , $t6 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t6 
 ori   $t2 , $t7 , 2959773784 
 and   $t5 , $t1 , $t0 
 and   $t1 , $t0 , $t3 
 addu   $t6 , $t7 , $t2 
 addu   $t2 , $t4 , $t2 
 ori   $t4 , $t2 , 3080486325 
 nor   $t0 , $t5 , $t3 
 mult  $t3 , $t7 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t1 
 mult  $t2 , $t5 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t7 
 sh   $t0 , 0($a0) 
 sw   $t4 , 0($a0) 
 ori   $t0 , $t0 , 1298167748 
 sw   $t6 , 0($a0) 
 xori   $t4 , $t3 , 2861153746 
 multu  $t5 , $t6 
 add $0, $0, $0
 mflo  $t6 
 multu  $t3 , $t7 
 add $0, $0, $0
 mflo  $t2 
 xor   $t1 , $t0 , $t0 
 lh   $t4 , 0($a0) 
 lh   $t1 , 0($a0) 
 multu  $t0 , $t3 
 add $0, $0, $0
 mflo  $t1 
 xori   $t0 , $t7 , 930715493 
 sw   $t3 , 0($a0) 
 xori   $t4 , $t0 , 2360219166 
 subu   $t7 , $t4 , $t5 
 sw   $t5 , 0($a0) 
 lb   $t5 , 0($a0) 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t1 
 andi   $t0 , $t0 , 874187507 
 sh   $t5 , 0($a0) 
 andi   $t3 , $t5 , 282737002 
 xori   $t5 , $t7 , 1961012530 
 lh   $t5 , 0($a0) 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sw   $t0 , 0($a0) 
 sltiu   $t6 , $t2 , 1063739341 
 nor   $t5 , $t3 , $t7 
 sw   $t3 , 0($a0) 
 lhu   $t0 , 0($a0) 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t2 
 sw   $t4 , 0($a0) 
 mult  $t1 , $t5 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t7 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sw   $t5 , 0($a0) 
 sltiu   $t5 , $t5 , 823791016 
 lh   $t5 , 0($a0) 
 subu   $t1 , $t7 , $t3 
 andi   $t5 , $t4 , 3313692122 
 mult  $t3 , $t2 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t4 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t3 
 lhu   $t3 , 0($a0) 
 ori   $t2 , $t0 , 4265736712 
 and   $t5 , $t7 , $t6 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t2 
 andi   $t1 , $t0 , 1323632633 
 lh   $t7 , 0($a0) 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t7 
 sb   $t7 , 0($a0) 
 sltiu   $t0 , $t3 , 3849446786 
 lhu   $t3 , 0($a0) 
 lw   $t1 , 0($a0) 
 ori   $t1 , $t3 , 3537517316 
 addu   $t1 , $t6 , $t4 
 lhu   $t7 , 0($a0) 
 addu   $t5 , $t3 , $t0 
 sb   $t3 , 0($a0) 
 sw   $t5 , 0($a0) 
 sw   $t2 , 0($a0) 
 or   $t1 , $t5 , $t1 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t5 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 xor   $t0 , $t1 , $t2 
 sb   $t4 , 0($a0) 
 addu   $t6 , $t4 , $t1 
 xori   $t0 , $t6 , 2767437836 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t4 
 lb   $t0 , 0($a0) 
 ori   $t5 , $t6 , 4012595894 
 xor   $t5 , $t4 , $t3 
 addu   $t0 , $t3 , $t2 
 sh   $t2 , 0($a0) 
 addiu   $t6 , $t2 , 124958090 
 or   $t0 , $t5 , $t7 
 mult  $t6 , $t4 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t1 
 or   $t3 , $t5 , $t7 
 xori   $t5 , $t0 , 1629352458 
 mult  $t7 , $t4 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t2 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t5 
 sh   $t2 , 0($a0) 
 and   $t5 , $t5 , $t3 
 sw   $t6 , 0($a0) 
 or   $t7 , $t4 , $t4 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t1 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t6 
 sb   $t3 , 0($a0) 
 addiu   $t1 , $t6 , 4263686659 
 sb   $t4 , 0($a0) 
 addu   $t1 , $t6 , $t1 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sw   $t0 , 0($a0) 
 sb   $t1 , 0($a0) 
 sh   $t5 , 0($a0) 
 xori   $t7 , $t1 , 941106484 
 addiu   $t5 , $t3 , 1359157848 
 sltiu   $t4 , $t1 , 3084481014 
 nor   $t0 , $t5 , $t7 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t2 , $t3 , 1428457337 
 lw   $t4 , 0($a0) 
 sltiu   $t5 , $t0 , 2647522365 
 sb   $t3 , 0($a0) 
 xori   $t0 , $t4 , 3094901356 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t3 
 addu   $t5 , $t7 , $t4 
 and   $t4 , $t7 , $t4 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t3 , $t5 , 2152351561 
 addiu   $t5 , $t3 , 2063355920 
 sw   $t5 , 0($a0) 
 addiu   $t6 , $t3 , 845372751 
 ori   $t6 , $t7 , 4275476827 
 mult  $t7 , $t7 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t7 
 and   $t0 , $t4 , $t6 
 xor   $t5 , $t5 , $t3 
 nor   $t4 , $t5 , $t0 
 sb   $t3 , 0($a0) 
 lw   $t7 , 0($a0) 
 sltiu   $t3 , $t0 , 2369748639 
 andi   $t6 , $t4 , 989466030 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t4 
 mult  $t3 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t4 
 or   $t3 , $t4 , $t0 
 and   $t0 , $t0 , $t6 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t5 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t7 
 lh   $t4 , 0($a0) 
 sb   $t2 , 0($a0) 
 mult  $t1 , $t7 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t5 
 or   $t3 , $t4 , $t3 
 addiu   $t5 , $t0 , 2714620977 
 lb   $t4 , 0($a0) 
 lh   $t2 , 0($a0) 
 lbu   $t4 , 0($a0) 
 nor   $t0 , $t1 , $t3 
 sw   $t7 , 0($a0) 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t4 
 andi   $t3 , $t5 , 3774016893 
 subu   $t6 , $t0 , $t4 
 and   $t1 , $t2 , $t7 
 sb   $t3 , 0($a0) 
 lhu   $t4 , 0($a0) 
 mult  $t6 , $t7 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t2 
 subu   $t7 , $t5 , $t4 
 and   $t4 , $t1 , $t5 
 xor   $t4 , $t4 , $t3 
 sw   $t6 , 0($a0) 
 mult  $t3 , $t4 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t1 , $t6 , 3467161836 
 and   $t1 , $t4 , $t0 
 multu  $t7 , $t4 
 add $0, $0, $0
 mflo  $t4 
 ori   $t0 , $t4 , 2344836286 
 sh   $t2 , 0($a0) 
 andi   $t3 , $t4 , 1206735214 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t7 
 lh   $t0 , 0($a0) 
 xor   $t7 , $t3 , $t3 
 andi   $t0 , $t3 , 2556212842 
 sh   $t7 , 0($a0) 
 and   $t0 , $t4 , $t2 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t2 
 multu  $t2 , $t2 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t4 , $t3 , 1086549350 
 sb   $t4 , 0($a0) 
 xor   $t7 , $t5 , $t4 
 subu   $t1 , $t4 , $t4 
 xor   $t0 , $t5 , $t3 
 sb   $t4 , 0($a0) 
 sw   $t4 , 0($a0) 
 multu  $t0 , $t0 
 add $0, $0, $0
 mflo  $t5 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t5 
 nor   $t2 , $t3 , $t5 
 and   $t5 , $t7 , $t0 
 addiu   $t3 , $t6 , 3126657541 
 xor   $t5 , $t3 , $t3 
 xori   $t4 , $t5 , 4170504365 
 multu  $t1 , $t0 
 add $0, $0, $0
 mflo  $t4 
 nor   $t1 , $t2 , $t2 
 lhu   $t6 , 0($a0) 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t1 
 xor   $t3 , $t5 , $t3 
 sh   $t2 , 0($a0) 
 nor   $t7 , $t6 , $t1 
 lb   $t4 , 0($a0) 
 xor   $t5 , $t2 , $t2 
 lbu   $t3 , 0($a0) 
 xor   $t5 , $t7 , $t7 
 lw   $t2 , 0($a0) 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t4 
 mult  $t0 , $t3 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t1 
 and   $t1 , $t6 , $t0 
 sb   $t6 , 0($a0) 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t2 
 xori   $t4 , $t6 , 3630609361 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t5 
 ori   $t3 , $t6 , 1164858826 
 lb   $t5 , 0($a0) 
 andi   $t7 , $t2 , 1065065962 
 nor   $t0 , $t2 , $t7 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t3 
 xor   $t4 , $t1 , $t3 
 sw   $t6 , 0($a0) 
 xor   $t1 , $t4 , $t6 
 andi   $t6 , $t3 , 3952956657 
 sltiu   $t6 , $t2 , 1382876530 
 sltiu   $t7 , $t7 , 3992646743 
 lh   $t6 , 0($a0) 
 addiu   $t7 , $t3 , 3935574245 
 sb   $t7 , 0($a0) 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t7 
 sw   $t3 , 0($a0) 
 xor   $t2 , $t1 , $t3 
 nor   $t2 , $t3 , $t1 
 and   $t4 , $t2 , $t3 
 nor   $t0 , $t4 , $t3 
 sltiu   $t4 , $t2 , 1911233459 
 addiu   $t5 , $t6 , 1541316059 
 sltiu   $t3 , $t6 , 3353568389 
 lb   $t1 , 0($a0) 
 sltiu   $t1 , $t7 , 1118602240 
 ori   $t6 , $t1 , 3704209717 
 andi   $t0 , $t0 , 3505395598 
 mult  $t5 , $t2 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t0 
 andi   $t1 , $t5 , 2569027813 
 sw   $t4 , 0($a0) 
 and   $t5 , $t3 , $t7 
 addu   $t1 , $t3 , $t0 
 sb   $t2 , 0($a0) 
 lb   $t2 , 0($a0) 
 lbu   $t3 , 0($a0) 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t3 
 andi   $t7 , $t4 , 229366502 
 mult  $t4 , $t6 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t6 
 sw   $t2 , 0($a0) 
 sltiu   $t3 , $t6 , 398218438 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t0 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t7 
 xori   $t2 , $t4 , 1908327548 
 mult  $t7 , $t2 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t1 
 addu   $t4 , $t3 , $t1 
 nor   $t5 , $t6 , $t7 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t5 
 mult  $t0 , $t0 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t1 
 or   $t3 , $t0 , $t2 
 subu   $t5 , $t3 , $t7 
 sb   $t1 , 0($a0) 
 lh   $t6 , 0($a0) 
 ori   $t2 , $t6 , 3933886497 
 addiu   $t1 , $t0 , 1220883874 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sb   $t1 , 0($a0) 
 sh   $t5 , 0($a0) 
 subu   $t5 , $t0 , $t7 
 and   $t4 , $t0 , $t1 
 mult  $t5 , $t2 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t1 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sb   $t1 , 0($a0) 
 mult  $t2 , $t6 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t5 
 lbu   $t2 , 0($a0) 
 ori   $t6 , $t5 , 2631963836 
 nor   $t0 , $t0 , $t3 
 and   $t2 , $t5 , $t5 
 xori   $t0 , $t1 , 4218318881 
 lhu   $t3 , 0($a0) 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t1 
 xori   $t7 , $t3 , 3235767303 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t0 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t1 
 xor   $t6 , $t2 , $t3 
 sltiu   $t6 , $t5 , 127098103 
 mult  $t4 , $t0 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t4 , 0($a0) 
 xor   $t1 , $t0 , $t2 
 nor   $t1 , $t4 , $t4 
 mult  $t2 , $t2 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t6 
 lh   $t7 , 0($a0) 
 ori   $t4 , $t2 , 3027414447 
 sb   $t3 , 0($a0) 
 andi   $t6 , $t4 , 1895338815 
 lw   $t2 , 0($a0) 
 addiu   $t0 , $t2 , 3062234022 
 sh   $t0 , 0($a0) 
 andi   $t7 , $t6 , 3818382698 
 mult  $t3 , $t7 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t7 
 ori   $t5 , $t0 , 642567947 
 sltiu   $t6 , $t3 , 2046916771 
 multu  $t5 , $t0 
 add $0, $0, $0
 mflo  $t4 
 mult  $t5 , $t6 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t1 , $t1 , 3002019301 
 xori   $t3 , $t0 , 4303930 
 lbu   $t3 , 0($a0) 
 sw   $t6 , 0($a0) 
 addiu   $t3 , $t7 , 1960129422 
 lw   $t0 , 0($a0) 
 lbu   $t7 , 0($a0) 
 xor   $t6 , $t3 , $t4 
 lw   $t2 , 0($a0) 
 mult  $t6 , $t0 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t3 
 nor   $t2 , $t7 , $t1 
 sw   $t2 , 0($a0) 
 sw   $t7 , 0($a0) 
 lh   $t3 , 0($a0) 
 ori   $t0 , $t4 , 4124054709 
 lhu   $t7 , 0($a0) 
 lh   $t2 , 0($a0) 
 addiu   $t4 , $t1 , 917961310 
 nor   $t6 , $t5 , $t0 
 lhu   $t7 , 0($a0) 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t1 
 lb   $t5 , 0($a0) 
 sh   $t6 , 0($a0) 
 and   $t2 , $t4 , $t7 
 mult  $t3 , $t1 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t3 
 lbu   $t7 , 0($a0) 
 andi   $t5 , $t0 , 2374229143 
 mult  $t6 , $t3 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sb   $t0 , 0($a0) 
 mult  $t7 , $t6 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t1 
 addu   $t5 , $t5 , $t7 
 sh   $t3 , 0($a0) 
 lw   $t6 , 0($a0) 
 addiu   $t5 , $t3 , 3552537410 
 sb   $t5 , 0($a0) 
 xor   $t6 , $t4 , $t6 
 sltiu   $t5 , $t7 , 2868760754 
 lh   $t0 , 0($a0) 
 mult  $t2 , $t3 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t6 , 0($a0) 
 nor   $t3 , $t7 , $t6 
 sw   $t4 , 0($a0) 
 xor   $t5 , $t7 , $t1 
 sh   $t2 , 0($a0) 
 mult  $t6 , $t7 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t4 , $t2 , 3799504652 
 sb   $t6 , 0($a0) 
 xor   $t7 , $t1 , $t1 
 mult  $t5 , $t0 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t4 
 lb   $t7 , 0($a0) 
 mult  $t0 , $t6 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t5 
 lb   $t5 , 0($a0) 
 xori   $t5 , $t5 , 147095753 
 lw   $t7 , 0($a0) 
 multu  $t0 , $t0 
 add $0, $0, $0
 mflo  $t6 
 mult  $t5 , $t5 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t5 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t7 
 lhu   $t5 , 0($a0) 
 sh   $t3 , 0($a0) 
 lb   $t4 , 0($a0) 
 mult  $t0 , $t1 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t0 
 or   $t7 , $t6 , $t6 
 xori   $t6 , $t2 , 4043010941 
 addiu   $t7 , $t2 , 3734572600 
 andi   $t7 , $t4 , 356013910 
 sb   $t4 , 0($a0) 
 mult  $t3 , $t3 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t3 , 0($a0) 
 lw   $t4 , 0($a0) 
 ori   $t6 , $t2 , 2169710545 
 addiu   $t5 , $t0 , 821076730 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 sw   $t0 , 0($a0) 
 sltiu   $t2 , $t0 , 381754371 
 lhu   $t0 , 0($a0) 
 subu   $t6 , $t6 , $t2 
 mult  $t7 , $t1 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t1 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t2 , $t6 , 420493063 
 sw   $t6 , 0($a0) 
 andi   $t1 , $t3 , 1005230927 
 ori   $t4 , $t3 , 2717700937 
 multu  $t6 , $t0 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t5 , 0($a0) 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t4 
 mult  $t6 , $t2 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t4 
 addu   $t7 , $t3 , $t7 
 sh   $t5 , 0($a0) 
 mult  $t4 , $t5 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t1 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t2 , $t4 , 264931178 
 sltiu   $t7 , $t1 , 2388981279 
 sltiu   $t4 , $t5 , 2848943095 
 sltiu   $t7 , $t7 , 4053495027 
 sw   $t2 , 0($a0) 
 addu   $t6 , $t2 , $t1 
 sh   $t3 , 0($a0) 
 xor   $t2 , $t7 , $t4 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t4 
 xori   $t6 , $t4 , 1943892433 
 xor   $t0 , $t5 , $t2 
 addiu   $t6 , $t3 , 3611275882 
 sh   $t2 , 0($a0) 
 addiu   $t3 , $t1 , 364355468 
 or   $t7 , $t1 , $t5 
 multu  $t7 , $t3 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t3 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t7 
 lh   $t5 , 0($a0) 
 andi   $t5 , $t0 , 3886121355 
 and   $t2 , $t5 , $t0 
 sh   $t7 , 0($a0) 
 nor   $t0 , $t2 , $t4 
 lbu   $t2 , 0($a0) 
 lbu   $t2 , 0($a0) 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t4 , $t7 , 765077823 
 nor   $t0 , $t2 , $t1 
 ori   $t0 , $t7 , 1857169029 
 sltiu   $t0 , $t3 , 2566969886 
 addu   $t2 , $t6 , $t3 
 sh   $t1 , 0($a0) 
 sh   $t1 , 0($a0) 
 subu   $t1 , $t7 , $t2 
 sb   $t2 , 0($a0) 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t5 
 sw   $t7 , 0($a0) 
 sh   $t2 , 0($a0) 
 nor   $t0 , $t4 , $t7 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t5 , $t0 , 716840305 
 sh   $t6 , 0($a0) 
 andi   $t6 , $t5 , 3855563100 
 sh   $t5 , 0($a0) 
 xori   $t1 , $t6 , 3884121732 
 sh   $t4 , 0($a0) 
 xori   $t0 , $t0 , 3017056938 
 lhu   $t7 , 0($a0) 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t6 
 lh   $t1 , 0($a0) 
 sb   $t0 , 0($a0) 
 sb   $t7 , 0($a0) 
 or   $t1 , $t5 , $t3 
 andi   $t3 , $t3 , 137357156 
 nor   $t7 , $t3 , $t7 
 addu   $t5 , $t0 , $t7 
 lhu   $t3 , 0($a0) 
 sh   $t6 , 0($a0) 
 ori   $t1 , $t5 , 762369971 
 xori   $t3 , $t0 , 96946377 
 lw   $t7 , 0($a0) 
 and   $t6 , $t3 , $t2 
 multu  $t1 , $t4 
 add $0, $0, $0
 mflo  $t5 
 sb   $t1 , 0($a0) 
 or   $t0 , $t2 , $t4 
 ori   $t2 , $t3 , 3038463685 
 sb   $t7 , 0($a0) 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t0 
 ori   $t1 , $t4 , 4233912704 
 or   $t0 , $t6 , $t7 
 and   $t0 , $t3 , $t5 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t5 
 lhu   $t7 , 0($a0) 
 xori   $t6 , $t4 , 1187500064 
 mult  $t2 , $t3 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t4 
 multu  $t4 , $t6 
 add $0, $0, $0
 mflo  $t4 
 lh   $t4 , 0($a0) 
 andi   $t2 , $t0 , 379246999 
 andi   $t7 , $t4 , 2698713529 
 ori   $t0 , $t4 , 638631351 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t6 
 xor   $t6 , $t4 , $t7 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t5 
 lb   $t1 , 0($a0) 
 xor   $t2 , $t7 , $t3 
 xor   $t1 , $t6 , $t6 
 sh   $t7 , 0($a0) 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sh   $t1 , 0($a0) 
 addiu   $t3 , $t5 , 1835421551 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t4 
 mult  $t0 , $t2 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t7 
 or   $t3 , $t0 , $t5 
 and   $t0 , $t4 , $t1 
 sb   $t2 , 0($a0) 
 sltiu   $t0 , $t3 , 2340548187 
 addiu   $t3 , $t4 , 2420957362 
 subu   $t6 , $t3 , $t1 
 lb   $t6 , 0($a0) 
 nor   $t4 , $t3 , $t0 
 addu   $t4 , $t3 , $t0 
 lb   $t7 , 0($a0) 
 or   $t4 , $t7 , $t0 
 xori   $t1 , $t6 , 3608397949 
 lhu   $t5 , 0($a0) 
 lh   $t4 , 0($a0) 
 mult  $t0 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t5 , $t3 , 2581251622 
 addiu   $t6 , $t0 , 2161748877 
 xor   $t0 , $t7 , $t1 
 mult  $t7 , $t5 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t0 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t5 
 xor   $t2 , $t5 , $t0 
 ori   $t1 , $t0 , 4204391370 
 addiu $v0, $0, 10
 syscall

