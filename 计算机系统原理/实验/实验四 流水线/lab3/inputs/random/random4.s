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
 addu   $t5 , $t0 , $t1 
 addiu   $t1 , $t2 , 208072981 
 xori   $t7 , $t5 , 191093142 
 andi   $t4 , $t0 , 2416436246 
 sltiu   $t0 , $t1 , 2742205029 
 lw   $t3 , 0($a0) 
 mult  $t4 , $t0 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t0 , $t5 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t5 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t0 , $t5 , 2525989945 
 subu   $t5 , $t2 , $t3 
 sh   $t2 , 0($a0) 
 sb   $t3 , 0($a0) 
 andi   $t2 , $t3 , 3009997641 
 ori   $t2 , $t0 , 1898662414 
 addu   $t5 , $t4 , $t6 
 ori   $t2 , $t5 , 2685833134 
 ori   $t4 , $t5 , 1365143656 
 nor   $t4 , $t1 , $t3 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 subu   $t2 , $t6 , $t4 
 mult  $t5 , $t0 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lb   $t2 , 0($a0) 
 sb   $t6 , 0($a0) 
 and   $t6 , $t6 , $t2 
 ori   $t1 , $t1 , 686685007 
 xori   $t4 , $t1 , 2520996464 
 ori   $t0 , $t7 , 1972070826 
 sltiu   $t7 , $t1 , 2464394424 
 sw   $t1 , 0($a0) 
 sltiu   $t7 , $t2 , 546384807 
 lw   $t5 , 0($a0) 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t6 , 0($a0) 
 and   $t4 , $t2 , $t0 
 andi   $t1 , $t7 , 2733360392 
 ori   $t4 , $t3 , 2213803526 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t6 
 mult  $t4 , $t3 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t5 , $t0 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t3 , $t4 , 177832168 
 mult  $t1 , $t5 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t7 
 xor   $t4 , $t0 , $t3 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t6 
 nor   $t5 , $t5 , $t3 
 lb   $t4 , 0($a0) 
 addu   $t2 , $t1 , $t4 
 lh   $t2 , 0($a0) 
 xor   $t2 , $t0 , $t5 
 sb   $t5 , 0($a0) 
 addu   $t2 , $t5 , $t1 
 lb   $t0 , 0($a0) 
 xori   $t1 , $t1 , 1378600021 
 xori   $t4 , $t5 , 1448207620 
 andi   $t1 , $t4 , 2802452405 
 subu   $t4 , $t2 , $t5 
 nor   $t4 , $t1 , $t7 
 sw   $t2 , 0($a0) 
 lw   $t7 , 0($a0) 
 subu   $t1 , $t7 , $t3 
 xori   $t6 , $t7 , 2767943162 
 lhu   $t6 , 0($a0) 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 or   $t0 , $t6 , $t3 
 addu   $t6 , $t5 , $t2 
 mult  $t3 , $t2 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t6 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 sw   $t0 , 0($a0) 
 xori   $t0 , $t6 , 880709140 
 addiu   $t2 , $t6 , 567015801 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t2 
 addu   $t2 , $t3 , $t7 
 nor   $t4 , $t3 , $t4 
 addu   $t4 , $t1 , $t7 
 xori   $t0 , $t6 , 3420898810 
 nor   $t4 , $t3 , $t1 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t7 
 and   $t1 , $t6 , $t6 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t6 
 mult  $t7 , $t6 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t6 
 subu   $t7 , $t6 , $t0 
 lh   $t0 , 0($a0) 
 lb   $t6 , 0($a0) 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t3 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t1 
 sb   $t1 , 0($a0) 
 lb   $t5 , 0($a0) 
 sh   $t1 , 0($a0) 
 nor   $t1 , $t7 , $t5 
 lbu   $t4 , 0($a0) 
 addu   $t1 , $t5 , $t7 
 mult  $t2 , $t3 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t0 
 sh   $t2 , 0($a0) 
 sw   $t1 , 0($a0) 
 lb   $t6 , 0($a0) 
 nor   $t1 , $t5 , $t7 
 multu  $t2 , $t0 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t4 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t0 
 lhu   $t7 , 0($a0) 
 mult  $t6 , $t0 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t4 , $t0 , 3018203782 
 sh   $t3 , 0($a0) 
 subu   $t0 , $t0 , $t4 
 sb   $t7 , 0($a0) 
 sb   $t7 , 0($a0) 
 subu   $t5 , $t0 , $t4 
 xor   $t4 , $t2 , $t3 
 addu   $t5 , $t1 , $t6 
 lb   $t4 , 0($a0) 
 sw   $t7 , 0($a0) 
 ori   $t5 , $t1 , 4176988511 
 and   $t2 , $t2 , $t0 
 andi   $t1 , $t5 , 65265973 
 lb   $t3 , 0($a0) 
 ori   $t1 , $t5 , 1197245404 
 multu  $t6 , $t3 
 add $0, $0, $0
 mflo  $t7 
 subu   $t3 , $t3 , $t3 
 sw   $t6 , 0($a0) 
 andi   $t4 , $t4 , 923074137 
 subu   $t4 , $t0 , $t1 
 sh   $t6 , 0($a0) 
 nor   $t0 , $t1 , $t4 
 xori   $t5 , $t7 , 1647680818 
 sb   $t0 , 0($a0) 
 lb   $t3 , 0($a0) 
 xor   $t3 , $t4 , $t0 
 mult  $t2 , $t6 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t2 
 sw   $t6 , 0($a0) 
 xor   $t2 , $t3 , $t6 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t2 , $t7 , 3852186560 
 ori   $t7 , $t7 , 2318691241 
 sb   $t4 , 0($a0) 
 nor   $t4 , $t6 , $t1 
 sw   $t0 , 0($a0) 
 sh   $t0 , 0($a0) 
 andi   $t2 , $t4 , 281208151 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t7 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t7 
 sb   $t6 , 0($a0) 
 lb   $t4 , 0($a0) 
 xori   $t4 , $t5 , 400177696 
 ori   $t2 , $t0 , 770221841 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t0 
 addu   $t4 , $t0 , $t7 
 xor   $t0 , $t6 , $t6 
 andi   $t5 , $t7 , 2501161419 
 sh   $t7 , 0($a0) 
 andi   $t5 , $t0 , 3594168338 
 subu   $t2 , $t2 , $t0 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 sh   $t2 , 0($a0) 
 ori   $t7 , $t0 , 1833621775 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t7 , $t5 , 2054708818 
 sb   $t6 , 0($a0) 
 xori   $t6 , $t7 , 3536721249 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t7 
 xori   $t5 , $t7 , 4141118768 
 ori   $t5 , $t6 , 2415805371 
 lb   $t1 , 0($a0) 
 addiu   $t6 , $t6 , 2877010604 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t7 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t5 , $t1 , 2788901727 
 lb   $t5 , 0($a0) 
 multu  $t2 , $t0 
 add $0, $0, $0
 mflo  $t2 
 xor   $t4 , $t4 , $t7 
 ori   $t3 , $t2 , 4020405497 
 lh   $t7 , 0($a0) 
 xori   $t0 , $t2 , 3326965640 
 subu   $t4 , $t0 , $t2 
 addiu   $t5 , $t1 , 4136293600 
 sh   $t7 , 0($a0) 
 sltiu   $t2 , $t6 , 1798607572 
 mult  $t0 , $t3 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t0 
 sb   $t7 , 0($a0) 
 lb   $t6 , 0($a0) 
 sh   $t4 , 0($a0) 
 and   $t0 , $t4 , $t7 
 lw   $t0 , 0($a0) 
 xor   $t0 , $t5 , $t2 
 or   $t0 , $t6 , $t6 
 or   $t3 , $t7 , $t1 
 subu   $t5 , $t4 , $t5 
 mult  $t5 , $t0 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t3 
 addu   $t4 , $t6 , $t0 
 andi   $t6 , $t2 , 2582937308 
 and   $t1 , $t2 , $t3 
 xor   $t0 , $t3 , $t5 
 ori   $t0 , $t4 , 1620329868 
 subu   $t1 , $t1 , $t0 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t6 
 sh   $t3 , 0($a0) 
 addiu   $t0 , $t0 , 1424439688 
 sh   $t2 , 0($a0) 
 addu   $t5 , $t3 , $t6 
 and   $t4 , $t2 , $t5 
 addiu   $t4 , $t6 , 3318739880 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t5 
 lh   $t0 , 0($a0) 
 nor   $t1 , $t7 , $t4 
 sh   $t7 , 0($a0) 
 and   $t4 , $t1 , $t0 
 andi   $t0 , $t1 , 4189784269 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t4 
 sb   $t5 , 0($a0) 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t3 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t5 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t4 
 lw   $t0 , 0($a0) 
 sltiu   $t0 , $t3 , 3902178515 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 or   $t6 , $t4 , $t0 
 xor   $t6 , $t2 , $t3 
 addu   $t0 , $t0 , $t6 
 sltiu   $t0 , $t2 , 3349558268 
 and   $t5 , $t7 , $t1 
 lbu   $t7 , 0($a0) 
 sltiu   $t5 , $t0 , 2245038493 
 sltiu   $t4 , $t5 , 2950205736 
 xori   $t6 , $t6 , 3707491435 
 xori   $t5 , $t4 , 4043850920 
 lb   $t3 , 0($a0) 
 xor   $t2 , $t6 , $t6 
 mult  $t5 , $t3 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t1 
 or   $t1 , $t3 , $t3 
 mult  $t0 , $t0 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t0 
 addu   $t4 , $t2 , $t0 
 sh   $t5 , 0($a0) 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t3 , $t3 , 3595514069 
 andi   $t7 , $t6 , 791808745 
 xor   $t7 , $t1 , $t3 
 xor   $t1 , $t1 , $t3 
 lh   $t4 , 0($a0) 
 ori   $t2 , $t0 , 2067033011 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t7 , $t1 , 1593528813 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t6 
 mult  $t7 , $t7 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t4 
 xor   $t6 , $t6 , $t4 
 addu   $t7 , $t4 , $t5 
 sltiu   $t0 , $t2 , 3539651817 
 andi   $t7 , $t2 , 2877419876 
 sb   $t5 , 0($a0) 
 sltiu   $t3 , $t4 , 1299281943 
 addiu   $t3 , $t7 , 64030443 
 xori   $t6 , $t0 , 1233565142 
 addiu   $t4 , $t4 , 909740556 
 subu   $t1 , $t2 , $t1 
 sw   $t1 , 0($a0) 
 xori   $t1 , $t6 , 515024136 
 xori   $t0 , $t5 , 4008980181 
 sw   $t7 , 0($a0) 
 multu  $t7 , $t4 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t6 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sb   $t6 , 0($a0) 
 xor   $t5 , $t4 , $t5 
 lh   $t6 , 0($a0) 
 mult  $t4 , $t5 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t7 
 sh   $t7 , 0($a0) 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t6 , $t2 , 2859449436 
 xori   $t3 , $t0 , 4071130590 
 andi   $t1 , $t6 , 4209241700 
 lb   $t1 , 0($a0) 
 or   $t7 , $t7 , $t6 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t2 , $t6 , 948308293 
 mult  $t3 , $t2 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t5 
 lbu   $t3 , 0($a0) 
 subu   $t1 , $t4 , $t5 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t2 
 and   $t3 , $t1 , $t5 
 lh   $t5 , 0($a0) 
 or   $t3 , $t2 , $t2 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 addu   $t4 , $t3 , $t3 
 nor   $t0 , $t3 , $t0 
 addiu   $t4 , $t7 , 270197133 
 ori   $t4 , $t1 , 2147713868 
 lb   $t3 , 0($a0) 
 lhu   $t4 , 0($a0) 
 and   $t0 , $t6 , $t2 
 mult  $t6 , $t3 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t3 
 sw   $t1 , 0($a0) 
 and   $t7 , $t5 , $t2 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t0 
 lh   $t5 , 0($a0) 
 andi   $t7 , $t2 , 565517149 
 xor   $t6 , $t5 , $t5 
 ori   $t3 , $t0 , 2283910384 
 xor   $t5 , $t5 , $t5 
 sltiu   $t7 , $t4 , 1463503560 
 addiu   $t2 , $t2 , 1456933583 
 nor   $t1 , $t1 , $t4 
 sh   $t2 , 0($a0) 
 lhu   $t7 , 0($a0) 
 mult  $t2 , $t1 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t4 
 subu   $t0 , $t1 , $t1 
 sb   $t3 , 0($a0) 
 lhu   $t5 , 0($a0) 
 or   $t1 , $t2 , $t4 
 xori   $t7 , $t6 , 3622041052 
 xor   $t2 , $t1 , $t7 
 ori   $t0 , $t5 , 3369895931 
 multu  $t2 , $t2 
 add $0, $0, $0
 mflo  $t0 
 lh   $t6 , 0($a0) 
 or   $t2 , $t0 , $t7 
 addu   $t1 , $t2 , $t7 
 mult  $t6 , $t4 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t1 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t1 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 subu   $t4 , $t2 , $t2 
 addiu   $t4 , $t0 , 383279720 
 sb   $t2 , 0($a0) 
 addu   $t3 , $t4 , $t1 
 mult  $t2 , $t7 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t2 , $t0 , 666784861 
 sh   $t5 , 0($a0) 
 sb   $t3 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t1 
 or   $t1 , $t5 , $t6 
 and   $t4 , $t2 , $t3 
 xori   $t6 , $t0 , 1436662116 
 nor   $t0 , $t0 , $t0 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t3 
 mult  $t0 , $t4 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t5 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t1 
 ori   $t7 , $t3 , 1126574849 
 xor   $t5 , $t7 , $t4 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t0 , $t2 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t1 
 and   $t0 , $t2 , $t2 
 andi   $t4 , $t2 , 4094361254 
 ori   $t2 , $t0 , 520431286 
 mult  $t1 , $t3 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t5 
 mult  $t1 , $t5 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t1 
 addu   $t0 , $t5 , $t5 
 or   $t4 , $t7 , $t1 
 and   $t1 , $t2 , $t2 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sh   $t4 , 0($a0) 
 lw   $t7 , 0($a0) 
 ori   $t6 , $t0 , 3529239651 
 lb   $t2 , 0($a0) 
 lbu   $t4 , 0($a0) 
 and   $t5 , $t3 , $t5 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 ori   $t0 , $t7 , 4018274767 
 xor   $t1 , $t2 , $t7 
 xori   $t0 , $t5 , 891294297 
 nor   $t0 , $t2 , $t7 
 and   $t2 , $t2 , $t4 
 lh   $t1 , 0($a0) 
 mult  $t0 , $t2 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t7 
 andi   $t2 , $t5 , 1010722638 
 subu   $t0 , $t7 , $t1 
 xori   $t5 , $t6 , 3508798885 
 mult  $t0 , $t3 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t4 
 mult  $t0 , $t4 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t1 
 ori   $t4 , $t7 , 3378385300 
 sltiu   $t5 , $t4 , 1003708528 
 and   $t5 , $t4 , $t5 
 xor   $t7 , $t7 , $t2 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t2 
 and   $t7 , $t7 , $t5 
 lw   $t6 , 0($a0) 
 lh   $t1 , 0($a0) 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t2 
 nor   $t6 , $t2 , $t3 
 lhu   $t6 , 0($a0) 
 addu   $t7 , $t3 , $t4 
 sw   $t2 , 0($a0) 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t2 
 and   $t5 , $t0 , $t7 
 lb   $t4 , 0($a0) 
 subu   $t2 , $t6 , $t6 
 addiu   $t3 , $t4 , 438097886 
 mult  $t7 , $t5 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sh   $t0 , 0($a0) 
 lb   $t1 , 0($a0) 
 or   $t7 , $t1 , $t1 
 sw   $t1 , 0($a0) 
 or   $t4 , $t0 , $t2 
 xor   $t4 , $t6 , $t1 
 ori   $t0 , $t7 , 2724930865 
 lh   $t4 , 0($a0) 
 sltiu   $t2 , $t6 , 3733715767 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t2 
 mult  $t6 , $t3 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t4 , $t2 , 2826630495 
 or   $t1 , $t4 , $t2 
 mult  $t2 , $t2 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t0 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t0 , $t6 , 4093992036 
 sltiu   $t7 , $t4 , 2288236319 
 lh   $t3 , 0($a0) 
 and   $t4 , $t7 , $t2 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t4 
 multu  $t2 , $t1 
 add $0, $0, $0
 mflo  $t0 
 multu  $t1 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t6 , $t0 , 215676028 
 sh   $t1 , 0($a0) 
 mult  $t3 , $t0 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t5 
 sh   $t7 , 0($a0) 
 lhu   $t5 , 0($a0) 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t6 , $t0 , 2665727904 
 xor   $t4 , $t3 , $t3 
 subu   $t6 , $t5 , $t7 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t3 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t1 , $t7 , 1263406890 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t6 
 or   $t2 , $t5 , $t1 
 nor   $t6 , $t1 , $t6 
 sltiu   $t4 , $t2 , 358379635 
 lb   $t4 , 0($a0) 
 lb   $t3 , 0($a0) 
 addu   $t5 , $t2 , $t5 
 lbu   $t5 , 0($a0) 
 nor   $t4 , $t2 , $t0 
 sw   $t3 , 0($a0) 
 lb   $t3 , 0($a0) 
 nor   $t0 , $t6 , $t0 
 lb   $t6 , 0($a0) 
 xori   $t3 , $t5 , 1929883097 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t2 
 addu   $t4 , $t0 , $t3 
 or   $t4 , $t2 , $t2 
 sltiu   $t1 , $t1 , 2910165893 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t7 
 mult  $t4 , $t7 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t4 
 lbu   $t2 , 0($a0) 
 and   $t7 , $t2 , $t7 
 andi   $t1 , $t2 , 4284967507 
 lhu   $t2 , 0($a0) 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t5 
 andi   $t3 , $t3 , 1674272735 
 xori   $t0 , $t7 , 1874491607 
 nor   $t5 , $t2 , $t1 
 xori   $t6 , $t7 , 2250644947 
 or   $t5 , $t7 , $t7 
 or   $t0 , $t2 , $t2 
 and   $t7 , $t1 , $t7 
 addu   $t7 , $t4 , $t3 
 lbu   $t2 , 0($a0) 
 sb   $t6 , 0($a0) 
 sltiu   $t4 , $t6 , 4194320640 
 sltiu   $t0 , $t7 , 3265552350 
 lb   $t5 , 0($a0) 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t0 
 subu   $t5 , $t4 , $t7 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t3 
 sh   $t4 , 0($a0) 
 addiu   $t3 , $t5 , 3671498497 
 xori   $t6 , $t2 , 2994127802 
 sw   $t0 , 0($a0) 
 sltiu   $t7 , $t5 , 2979576019 
 subu   $t4 , $t6 , $t1 
 xori   $t0 , $t3 , 798503929 
 subu   $t2 , $t7 , $t6 
 lbu   $t4 , 0($a0) 
 or   $t0 , $t6 , $t2 
 sb   $t0 , 0($a0) 
 sltiu   $t2 , $t3 , 2980256060 
 lw   $t6 , 0($a0) 
 sh   $t0 , 0($a0) 
 sh   $t7 , 0($a0) 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t4 
 lb   $t4 , 0($a0) 
 addu   $t3 , $t3 , $t2 
 mult  $t7 , $t7 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t6 
 sh   $t6 , 0($a0) 
 or   $t2 , $t1 , $t7 
 addiu   $t1 , $t2 , 3302288039 
 lh   $t6 , 0($a0) 
 nor   $t4 , $t6 , $t4 
 or   $t0 , $t7 , $t3 
 sw   $t3 , 0($a0) 
 mult  $t0 , $t3 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t3 
 mult  $t3 , $t3 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t3 
 sw   $t3 , 0($a0) 
 andi   $t5 , $t6 , 108608867 
 subu   $t6 , $t4 , $t3 
 nor   $t2 , $t6 , $t7 
 addiu   $t4 , $t1 , 2759567563 
 nor   $t2 , $t0 , $t2 
 ori   $t4 , $t2 , 274827776 
 sltiu   $t2 , $t3 , 1800729618 
 subu   $t1 , $t5 , $t7 
 mult  $t2 , $t5 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t0 
 ori   $t4 , $t6 , 3502707279 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t1 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lw   $t7 , 0($a0) 
 subu   $t4 , $t3 , $t5 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t6 , $t6 , 2824720717 
 xori   $t7 , $t2 , 4037877394 
 andi   $t1 , $t3 , 2187790936 
 subu   $t2 , $t7 , $t3 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 lhu   $t2 , 0($a0) 
 nor   $t7 , $t5 , $t4 
 lbu   $t3 , 0($a0) 
 lh   $t7 , 0($a0) 
 subu   $t0 , $t1 , $t7 
 nor   $t1 , $t1 , $t3 
 sw   $t4 , 0($a0) 
 xor   $t5 , $t3 , $t1 
 xor   $t2 , $t7 , $t1 
 ori   $t2 , $t5 , 298342082 
 addiu   $t6 , $t7 , 2269047830 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t7 , $t3 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t0 , $t4 , 1252255549 
 and   $t7 , $t1 , $t4 
 addu   $t0 , $t0 , $t0 
 subu   $t6 , $t4 , $t0 
 andi   $t4 , $t0 , 3364510136 
 nor   $t4 , $t3 , $t6 
 lbu   $t7 , 0($a0) 
 addiu   $t5 , $t1 , 2150100879 
 andi   $t7 , $t4 , 2068463946 
 and   $t3 , $t2 , $t5 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t5 
 and   $t3 , $t2 , $t6 
 and   $t0 , $t4 , $t5 
 mult  $t1 , $t6 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t4 
 sw   $t1 , 0($a0) 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t1 
 ori   $t0 , $t6 , 1731094398 
 ori   $t6 , $t5 , 4093853695 
 sb   $t3 , 0($a0) 
 and   $t1 , $t5 , $t6 
 lb   $t0 , 0($a0) 
 and   $t3 , $t2 , $t1 
 addu   $t7 , $t3 , $t3 
 lhu   $t7 , 0($a0) 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 xor   $t6 , $t0 , $t5 
 ori   $t5 , $t4 , 3709853915 
 ori   $t0 , $t0 , 1960219885 
 sb   $t4 , 0($a0) 
 xor   $t6 , $t5 , $t5 
 xor   $t0 , $t5 , $t1 
 lb   $t2 , 0($a0) 
 subu   $t0 , $t2 , $t7 
 or   $t0 , $t2 , $t5 
 mult  $t3 , $t1 
 add $0, $0, $0
 mflo  $t6 
 xori   $t5 , $t2 , 928093466 
 ori   $t7 , $t1 , 1960439106 
 lhu   $t7 , 0($a0) 
 lhu   $t6 , 0($a0) 
 mult  $t3 , $t2 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t0 , $t6 , 3417448530 
 mult  $t3 , $t3 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t4 
 ori   $t0 , $t6 , 1416313054 
 ori   $t0 , $t3 , 4136149686 
 or   $t2 , $t0 , $t4 
 lb   $t7 , 0($a0) 
 ori   $t3 , $t7 , 2807314361 
 xor   $t1 , $t5 , $t6 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t7 
 andi   $t0 , $t6 , 3977461148 
 andi   $t2 , $t7 , 2071543922 
 addu   $t5 , $t3 , $t1 
 ori   $t6 , $t4 , 1462554956 
 sb   $t1 , 0($a0) 
 andi   $t1 , $t1 , 1261135695 
 xori   $t7 , $t6 , 1878176291 
 xor   $t6 , $t4 , $t5 
 mult  $t3 , $t3 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t2 
 lhu   $t4 , 0($a0) 
 multu  $t3 , $t7 
 add $0, $0, $0
 mflo  $t2 
 subu   $t1 , $t1 , $t5 
 xor   $t3 , $t5 , $t5 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t6 
 and   $t1 , $t6 , $t7 
 lb   $t2 , 0($a0) 
 addiu   $t5 , $t6 , 1299229419 
 addiu   $t1 , $t7 , 1656607565 
 nor   $t7 , $t7 , $t4 
 sb   $t1 , 0($a0) 
 ori   $t0 , $t4 , 3182366831 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t4 , $t7 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t0 
 lhu   $t4 , 0($a0) 
 sw   $t2 , 0($a0) 
 sh   $t6 , 0($a0) 
 lw   $t4 , 0($a0) 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t6 
 nor   $t4 , $t4 , $t1 
 ori   $t2 , $t0 , 2773705030 
 subu   $t4 , $t0 , $t7 
 addiu   $t5 , $t0 , 1883812815 
 sh   $t7 , 0($a0) 
 mult  $t3 , $t3 
 add $0, $0, $0
 mflo  $t0 
 sh   $t5 , 0($a0) 
 andi   $t2 , $t2 , 126398125 
 lb   $t2 , 0($a0) 
 subu   $t0 , $t0 , $t5 
 xori   $t7 , $t6 , 3139728337 
 sltiu   $t0 , $t1 , 890025322 
 ori   $t6 , $t6 , 1235543968 
 addu   $t5 , $t5 , $t1 
 lh   $t5 , 0($a0) 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t6 
 or   $t2 , $t6 , $t6 
 nor   $t1 , $t3 , $t2 
 sltiu   $t2 , $t5 , 4236838481 
 xori   $t0 , $t6 , 2881318315 
 addu   $t1 , $t2 , $t6 
 xor   $t4 , $t1 , $t6 
 addu   $t5 , $t5 , $t3 
 xori   $t4 , $t1 , 1524610082 
 addiu   $t1 , $t5 , 714527646 
 sb   $t1 , 0($a0) 
 subu   $t0 , $t5 , $t5 
 or   $t6 , $t4 , $t7 
 mult  $t3 , $t1 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t3 
 multu  $t0 , $t4 
 add $0, $0, $0
 mflo  $t1 
 xor   $t7 , $t4 , $t3 
 addiu   $t6 , $t1 , 3297046823 
 and   $t6 , $t1 , $t4 
 mult  $t5 , $t1 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t0 
 multu  $t0 , $t3 
 add $0, $0, $0
 mflo  $t5 
 lbu   $t2 , 0($a0) 
 sltiu   $t1 , $t6 , 133303785 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t7 
 subu   $t6 , $t1 , $t2 
 lbu   $t5 , 0($a0) 
 mult  $t1 , $t7 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t1 
 andi   $t2 , $t6 , 118342016 
 xor   $t3 , $t2 , $t6 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t2 , $t6 , 3176715870 
 sltiu   $t6 , $t6 , 3140531013 
 ori   $t7 , $t6 , 2046325662 
 subu   $t6 , $t6 , $t5 
 xori   $t5 , $t5 , 3458371584 
 andi   $t7 , $t7 , 68484031 
 multu  $t7 , $t5 
 add $0, $0, $0
 mflo  $t7 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t2 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t7 
 subu   $t3 , $t1 , $t7 
 multu  $t0 , $t6 
 add $0, $0, $0
 mflo  $t5 
 ori   $t7 , $t7 , 2113133247 
 nor   $t4 , $t4 , $t6 
 sh   $t7 , 0($a0) 
 ori   $t3 , $t5 , 1497225089 
 lbu   $t1 , 0($a0) 
 ori   $t0 , $t2 , 1828047236 
 lb   $t5 , 0($a0) 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t4 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t1 
 andi   $t2 , $t5 , 2731406201 
 lw   $t1 , 0($a0) 
 multu  $t0 , $t3 
 add $0, $0, $0
 mflo  $t7 
 sb   $t4 , 0($a0) 
 and   $t4 , $t7 , $t6 
 mult  $t5 , $t7 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 addu   $t4 , $t7 , $t6 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t2 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t4 
 or   $t0 , $t1 , $t5 
 nor   $t1 , $t6 , $t4 
 nor   $t6 , $t0 , $t5 
 and   $t5 , $t7 , $t0 
 multu  $t7 , $t2 
 add $0, $0, $0
 mflo  $t2 
 xor   $t7 , $t6 , $t0 
 ori   $t4 , $t1 , 2107864673 
 nor   $t5 , $t1 , $t7 
 andi   $t7 , $t2 , 1143188029 
 lb   $t2 , 0($a0) 
 sb   $t2 , 0($a0) 
 sw   $t3 , 0($a0) 
 or   $t2 , $t2 , $t0 
 addu   $t5 , $t7 , $t5 
 sb   $t3 , 0($a0) 
 xor   $t3 , $t7 , $t2 
 and   $t3 , $t5 , $t1 
 multu  $t7 , $t3 
 add $0, $0, $0
 mflo  $t7 
 mult  $t4 , $t1 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 subu   $t0 , $t3 , $t5 
 xor   $t3 , $t5 , $t1 
 sh   $t3 , 0($a0) 
 mult  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t6 , 0($a0) 
 multu  $t7 , $t1 
 add $0, $0, $0
 mflo  $t2 
 andi   $t2 , $t7 , 4213572941 
 addu   $t0 , $t6 , $t5 
 mult  $t1 , $t4 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t6 
 lb   $t5 , 0($a0) 
 and   $t2 , $t0 , $t3 
 ori   $t0 , $t1 , 1328147574 
 or   $t2 , $t6 , $t5 
 subu   $t1 , $t7 , $t4 
 and   $t6 , $t5 , $t1 
 xor   $t1 , $t3 , $t5 
 nor   $t2 , $t6 , $t5 
 lbu   $t6 , 0($a0) 
 xori   $t1 , $t7 , 776575528 
 addu   $t7 , $t2 , $t2 
 subu   $t0 , $t1 , $t2 
 mult  $t0 , $t6 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t2 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t1 
 or   $t4 , $t4 , $t1 
 sb   $t4 , 0($a0) 
 lw   $t6 , 0($a0) 
 xori   $t7 , $t7 , 519259259 
 addiu   $t0 , $t1 , 1567579541 
 ori   $t6 , $t5 , 227997648 
 lhu   $t3 , 0($a0) 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t2 
 andi   $t2 , $t3 , 4259290009 
 sltiu   $t2 , $t5 , 3514960304 
 subu   $t4 , $t7 , $t7 
 xori   $t1 , $t7 , 500391931 
 addiu   $t5 , $t7 , 1552846728 
 addu   $t4 , $t5 , $t4 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t5 
 lb   $t4 , 0($a0) 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t1 
 or   $t0 , $t1 , $t5 
 subu   $t7 , $t1 , $t3 
 andi   $t0 , $t5 , 82035241 
 nor   $t3 , $t5 , $t1 
 xor   $t4 , $t2 , $t0 
 mult  $t4 , $t1 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t5 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 sb   $t3 , 0($a0) 
 and   $t5 , $t7 , $t5 
 addu   $t5 , $t6 , $t1 
 sw   $t3 , 0($a0) 
 andi   $t5 , $t6 , 2683311431 
 addiu   $t6 , $t5 , 1295214711 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t3 
 lw   $t6 , 0($a0) 
 addiu   $t2 , $t5 , 2532634967 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t4 , 0($a0) 
 nor   $t1 , $t0 , $t4 
 multu  $t2 , $t2 
 add $0, $0, $0
 mflo  $t0 
 lh   $t5 , 0($a0) 
 sltiu   $t5 , $t6 , 1499986779 
 xori   $t2 , $t2 , 2276111258 
 andi   $t6 , $t1 , 949755155 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t2 
 nor   $t5 , $t1 , $t7 
 xori   $t5 , $t4 , 286239564 
 nor   $t1 , $t5 , $t6 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t1 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t1 
 lhu   $t3 , 0($a0) 
 xor   $t0 , $t7 , $t5 
 sb   $t5 , 0($a0) 
 sh   $t3 , 0($a0) 
 mult  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 sb   $t3 , 0($a0) 
 xori   $t4 , $t2 , 2669911761 
 ori   $t4 , $t3 , 421308870 
 andi   $t7 , $t1 , 2238214774 
 xor   $t0 , $t3 , $t6 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sh   $t4 , 0($a0) 
 nor   $t5 , $t7 , $t5 
 nor   $t7 , $t6 , $t2 
 xor   $t3 , $t0 , $t5 
 addu   $t4 , $t2 , $t0 
 or   $t7 , $t3 , $t0 
 ori   $t3 , $t2 , 495185827 
 sw   $t2 , 0($a0) 
 and   $t2 , $t0 , $t0 
 sb   $t3 , 0($a0) 
 sltiu   $t7 , $t0 , 3990764435 
 subu   $t2 , $t0 , $t7 
 andi   $t0 , $t0 , 1366963782 
 mult  $t4 , $t6 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t2 
 nor   $t5 , $t2 , $t0 
 lbu   $t0 , 0($a0) 
 addu   $t2 , $t4 , $t1 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t0 
 xor   $t3 , $t5 , $t2 
 subu   $t2 , $t4 , $t5 
 addiu   $t0 , $t0 , 3439276592 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t3 
 subu   $t2 , $t6 , $t5 
 sh   $t3 , 0($a0) 
 addiu   $t2 , $t1 , 4243464279 
 lh   $t7 , 0($a0) 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t7 , 0($a0) 
 and   $t7 , $t0 , $t1 
 subu   $t7 , $t0 , $t6 
 mult  $t4 , $t3 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t1 , $t0 , 2155760475 
 subu   $t1 , $t6 , $t0 
 nor   $t2 , $t4 , $t4 
 addiu   $t6 , $t0 , 1314527599 
 xor   $t4 , $t3 , $t0 
 lb   $t0 , 0($a0) 
 subu   $t2 , $t2 , $t6 
 mult  $t4 , $t1 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t0 
 sw   $t7 , 0($a0) 
 xori   $t1 , $t7 , 1616243136 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t0 
 lh   $t4 , 0($a0) 
 lhu   $t5 , 0($a0) 
 sw   $t1 , 0($a0) 
 xori   $t1 , $t5 , 485652286 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t2 , $t4 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t4 
 or   $t6 , $t2 , $t7 
 xori   $t3 , $t3 , 3607690583 
 addiu   $t5 , $t6 , 4217607583 
 multu  $t6 , $t0 
 add $0, $0, $0
 mflo  $t4 
 sh   $t3 , 0($a0) 
 addu   $t7 , $t5 , $t3 
 xor   $t0 , $t6 , $t7 
 and   $t3 , $t0 , $t5 
 addiu   $t6 , $t3 , 308069731 
 ori   $t4 , $t3 , 3918063594 
 nor   $t1 , $t3 , $t0 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t7 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t2 
 subu   $t5 , $t1 , $t1 
 nor   $t5 , $t5 , $t5 
 xor   $t5 , $t4 , $t6 
 sh   $t4 , 0($a0) 
 addiu   $t7 , $t4 , 763211800 
 xor   $t7 , $t2 , $t6 
 addu   $t1 , $t0 , $t5 
 and   $t4 , $t5 , $t1 
 lbu   $t4 , 0($a0) 
 nor   $t5 , $t0 , $t4 
 sh   $t2 , 0($a0) 
 lbu   $t3 , 0($a0) 
 addu   $t5 , $t7 , $t1 
 or   $t7 , $t5 , $t0 
 addu   $t5 , $t1 , $t4 
 sb   $t3 , 0($a0) 
 nor   $t5 , $t1 , $t2 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t1 
 nor   $t1 , $t5 , $t6 
 addiu   $t0 , $t2 , 2070855882 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t5 
 nor   $t7 , $t1 , $t5 
 lw   $t4 , 0($a0) 
 ori   $t4 , $t3 , 454845708 
 lhu   $t7 , 0($a0) 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t5 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t7 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 sw   $t1 , 0($a0) 
 xori   $t6 , $t6 , 2279331142 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t0 
 and   $t1 , $t1 , $t0 
 mult  $t4 , $t3 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t2 
 sw   $t3 , 0($a0) 
 sh   $t7 , 0($a0) 
 sw   $t6 , 0($a0) 
 sh   $t3 , 0($a0) 
 sh   $t4 , 0($a0) 
 sb   $t3 , 0($a0) 
 subu   $t4 , $t1 , $t6 
 nor   $t0 , $t3 , $t6 
 sb   $t0 , 0($a0) 
 mult  $t3 , $t3 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t4 
 and   $t6 , $t5 , $t1 
 xor   $t7 , $t7 , $t6 
 xor   $t7 , $t4 , $t3 
 sb   $t1 , 0($a0) 
 subu   $t3 , $t2 , $t0 
 xori   $t4 , $t4 , 2962491366 
 mult  $t2 , $t4 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t2 
 multu  $t3 , $t0 
 add $0, $0, $0
 mflo  $t7 
 lbu   $t5 , 0($a0) 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t7 
 or   $t1 , $t7 , $t7 
 sw   $t1 , 0($a0) 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t5 
 sh   $t6 , 0($a0) 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t1 
 xor   $t7 , $t0 , $t6 
 sw   $t2 , 0($a0) 
 addiu   $t7 , $t2 , 538689996 
 lhu   $t1 , 0($a0) 
 sw   $t4 , 0($a0) 
 sh   $t7 , 0($a0) 
 addiu   $t7 , $t6 , 163401369 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t3 
 ori   $t1 , $t3 , 1621094846 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t5 
 sh   $t4 , 0($a0) 
 mult  $t2 , $t0 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t6 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t5 
 xori   $t6 , $t7 , 1007260589 
 nor   $t2 , $t4 , $t3 
 xori   $t7 , $t3 , 4287578190 
 and   $t1 , $t6 , $t2 
 mult  $t2 , $t2 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t4 
 andi   $t6 , $t3 , 2649778791 
 multu  $t3 , $t3 
 add $0, $0, $0
 mflo  $t2 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t1 
 addu   $t2 , $t5 , $t4 
 lhu   $t1 , 0($a0) 
 mult  $t6 , $t4 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t7 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t2 
 sh   $t4 , 0($a0) 
 nor   $t0 , $t3 , $t5 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t3 
 lb   $t7 , 0($a0) 
 mult  $t4 , $t0 
 mult  $t0 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t6 , $t3 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t5 
 mult  $t0 , $t3 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t7 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t0 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t0 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t2 
 xori   $t1 , $t7 , 4263479732 
 nor   $t5 , $t7 , $t1 
 lhu   $t5 , 0($a0) 
 and   $t1 , $t5 , $t7 
 sh   $t7 , 0($a0) 
 multu  $t3 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t6 , $t7 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t5 , $t7 , 768779376 
 andi   $t2 , $t1 , 3941898179 
 mult  $t1 , $t5 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t6 
 xori   $t3 , $t1 , 3429917532 
 ori   $t4 , $t5 , 263931865 
 andi   $t0 , $t0 , 2133345446 
 subu   $t0 , $t2 , $t6 
 lh   $t1 , 0($a0) 
 lw   $t3 , 0($a0) 
 mult  $t3 , $t5 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t1 
 sltiu   $t0 , $t4 , 3412196779 
 lhu   $t1 , 0($a0) 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t1 
 sb   $t3 , 0($a0) 
 xori   $t6 , $t7 , 3328983338 
 nor   $t3 , $t4 , $t4 
 addiu   $t4 , $t4 , 2733859413 
 sltiu   $t1 , $t0 , 4185826507 
 addiu   $t7 , $t5 , 3685603049 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t5 
 lb   $t0 , 0($a0) 
 or   $t2 , $t5 , $t7 
 lb   $t6 , 0($a0) 
 sb   $t3 , 0($a0) 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t7 
 addu   $t4 , $t4 , $t4 
 mult  $t5 , $t0 
 add $0, $0, $0
 mflo  $t2 
 nor   $t4 , $t7 , $t0 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t2 
 mult  $t3 , $t3 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t4 
 mult  $t7 , $t0 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t6 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t5 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t1 
 subu   $t0 , $t3 , $t5 
 ori   $t1 , $t3 , 4221628042 
 subu   $t0 , $t6 , $t4 
 and   $t4 , $t3 , $t7 
 sb   $t0 , 0($a0) 
 subu   $t3 , $t1 , $t7 
 sltiu   $t5 , $t5 , 2613525475 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sb   $t5 , 0($a0) 
 lbu   $t4 , 0($a0) 
 lhu   $t4 , 0($a0) 
 or   $t6 , $t5 , $t4 
 sh   $t7 , 0($a0) 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t7 
 subu   $t7 , $t7 , $t1 
 multu  $t3 , $t1 
 add $0, $0, $0
 mflo  $t1 
 sh   $t3 , 0($a0) 
 ori   $t2 , $t6 , 4291209926 
 or   $t7 , $t3 , $t5 
 sltiu   $t5 , $t5 , 3825825786 
 andi   $t2 , $t0 , 2475693437 
 multu  $t0 , $t4 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t4 , 0($a0) 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t0 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t5 
 mult  $t1 , $t0 
 add $0, $0, $0
 mflo  $t0 
 mult  $t7 , $t7 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t0 
 sw   $t0 , 0($a0) 
 xori   $t1 , $t2 , 3502974431 
 sltiu   $t2 , $t6 , 50182756 
 sb   $t7 , 0($a0) 
 addiu $v0, $0, 10
 syscall

