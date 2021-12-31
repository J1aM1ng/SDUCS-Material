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
 nor   $t0 , $t6 , $t3 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t3 
 xori   $t7 , $t0 , 1603550030 
 multu  $t7 , $t0 
 add $0, $0, $0
 mflo  $t6 
 addu   $t6 , $t0 , $t5 
 andi   $t6 , $t3 , 576185550 
 andi   $t1 , $t6 , 738111612 
 subu   $t2 , $t6 , $t0 
 andi   $t2 , $t4 , 2458166688 
 lw   $t1 , 0($a0) 
 multu  $t3 , $t5 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t5 , 0($a0) 
 and   $t0 , $t0 , $t7 
 sw   $t4 , 0($a0) 
 lb   $t6 , 0($a0) 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t1 
 xor   $t6 , $t0 , $t1 
 lbu   $t5 , 0($a0) 
 mult  $t7 , $t6 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t3 
 andi   $t5 , $t3 , 3809280687 
 nor   $t6 , $t4 , $t0 
 sltiu   $t0 , $t2 , 2301079892 
 lb   $t5 , 0($a0) 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t4 , $t4 , 4284256026 
 xor   $t4 , $t0 , $t7 
 addu   $t0 , $t4 , $t7 
 ori   $t0 , $t3 , 1627810477 
 mult  $t6 , $t4 
 add $0, $0, $0
 mflo  $t1 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t4 
 xor   $t0 , $t0 , $t5 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sb   $t0 , 0($a0) 
 lhu   $t3 , 0($a0) 
 xor   $t2 , $t4 , $t2 
 subu   $t1 , $t3 , $t7 
 mult  $t5 , $t5 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t3 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t5 , $t4 , 2942551359 
 sltiu   $t7 , $t4 , 973491180 
 lhu   $t0 , 0($a0) 
 sltiu   $t4 , $t5 , 4075433878 
 xor   $t1 , $t7 , $t2 
 andi   $t3 , $t7 , 1339983776 
 ori   $t0 , $t7 , 1016674016 
 lhu   $t6 , 0($a0) 
 addu   $t6 , $t5 , $t6 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t1 
 nor   $t3 , $t7 , $t0 
 nor   $t7 , $t2 , $t3 
 and   $t2 , $t4 , $t0 
 xori   $t3 , $t6 , 3703040262 
 sh   $t7 , 0($a0) 
 sb   $t0 , 0($a0) 
 nor   $t1 , $t5 , $t0 
 sltiu   $t1 , $t4 , 2880914218 
 ori   $t1 , $t5 , 519673829 
 lhu   $t4 , 0($a0) 
 sltiu   $t5 , $t5 , 428502897 
 addu   $t1 , $t4 , $t5 
 lw   $t2 , 0($a0) 
 sh   $t4 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t6 
 andi   $t7 , $t7 , 645965391 
 sw   $t1 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t2 
 mult  $t1 , $t7 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t5 
 xori   $t5 , $t3 , 624231746 
 lbu   $t7 , 0($a0) 
 and   $t5 , $t5 , $t4 
 and   $t4 , $t1 , $t0 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t3 
 andi   $t5 , $t5 , 2124038535 
 mult  $t4 , $t7 
 add $0, $0, $0
 mflo  $t7 
 sw   $t6 , 0($a0) 
 and   $t2 , $t5 , $t2 
 sw   $t7 , 0($a0) 
 ori   $t7 , $t0 , 3395405930 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t3 
 xor   $t5 , $t7 , $t5 
 and   $t2 , $t5 , $t2 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t4 
 lw   $t7 , 0($a0) 
 sw   $t7 , 0($a0) 
 or   $t3 , $t7 , $t1 
 sltiu   $t6 , $t5 , 2324788356 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t5 
 xori   $t7 , $t7 , 1132473882 
 lbu   $t6 , 0($a0) 
 addu   $t1 , $t3 , $t6 
 lbu   $t3 , 0($a0) 
 lw   $t4 , 0($a0) 
 lh   $t3 , 0($a0) 
 lh   $t2 , 0($a0) 
 or   $t1 , $t4 , $t3 
 andi   $t6 , $t4 , 3893798678 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t7 
 sltiu   $t6 , $t4 , 3583734349 
 lbu   $t7 , 0($a0) 
 and   $t5 , $t0 , $t5 
 lb   $t3 , 0($a0) 
 lw   $t1 , 0($a0) 
 multu  $t7 , $t5 
 add $0, $0, $0
 mflo  $t1 
 mult  $t2 , $t5 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t3 
 mult  $t3 , $t2 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t0 
 ori   $t6 , $t2 , 2468362819 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t0 
 subu   $t0 , $t5 , $t0 
 addiu   $t7 , $t3 , 1450986175 
 xor   $t5 , $t0 , $t3 
 nor   $t1 , $t3 , $t0 
 lhu   $t1 , 0($a0) 
 sw   $t7 , 0($a0) 
 or   $t5 , $t7 , $t0 
 mult  $t6 , $t2 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sw   $t4 , 0($a0) 
 multu  $t5 , $t5 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t1 , 0($a0) 
 sltiu   $t3 , $t3 , 3074737747 
 subu   $t2 , $t1 , $t5 
 ori   $t4 , $t4 , 649869531 
 xori   $t5 , $t6 , 4232486172 
 lb   $t1 , 0($a0) 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t0 
 multu  $t5 , $t2 
 add $0, $0, $0
 mflo  $t6 
 sb   $t7 , 0($a0) 
 addu   $t1 , $t2 , $t0 
 sb   $t0 , 0($a0) 
 mult  $t0 , $t6 
 mult  $t6 , $t7 
 add $0, $0, $0
 mflo  $t3 
 ori   $t3 , $t7 , 1998903714 
 lhu   $t5 , 0($a0) 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t1 
 sw   $t3 , 0($a0) 
 lhu   $t0 , 0($a0) 
 lhu   $t1 , 0($a0) 
 sh   $t2 , 0($a0) 
 lh   $t1 , 0($a0) 
 xori   $t0 , $t3 , 1254504427 
 addiu   $t4 , $t6 , 1891636372 
 ori   $t0 , $t2 , 3935469615 
 andi   $t1 , $t0 , 1080272381 
 lh   $t6 , 0($a0) 
 ori   $t3 , $t0 , 181584960 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t4 
 xor   $t2 , $t4 , $t2 
 and   $t0 , $t3 , $t7 
 lhu   $t1 , 0($a0) 
 lbu   $t6 , 0($a0) 
 addiu   $t7 , $t0 , 1352933376 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t6 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t3 
 multu  $t1 , $t3 
 add $0, $0, $0
 mflo  $t0 
 mult  $t3 , $t6 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t3 
 ori   $t6 , $t2 , 2631330223 
 xor   $t3 , $t7 , $t7 
 addiu   $t5 , $t6 , 2204041857 
 addiu   $t2 , $t4 , 4035509124 
 multu  $t2 , $t6 
 add $0, $0, $0
 mflo  $t4 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t1 
 andi   $t6 , $t5 , 1276799927 
 sb   $t0 , 0($a0) 
 nor   $t4 , $t5 , $t4 
 sltiu   $t0 , $t5 , 2149852026 
 xor   $t4 , $t3 , $t6 
 or   $t2 , $t6 , $t2 
 ori   $t0 , $t7 , 483670181 
 lhu   $t3 , 0($a0) 
 sltiu   $t5 , $t1 , 3777577250 
 mult  $t3 , $t4 
 mult  $t7 , $t5 
 add $0, $0, $0
 mflo  $t7 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t1 
 subu   $t5 , $t4 , $t2 
 or   $t0 , $t0 , $t5 
 xori   $t1 , $t1 , 3334089176 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t5 , $t1 , 502975693 
 ori   $t7 , $t4 , 4134707365 
 sw   $t7 , 0($a0) 
 or   $t2 , $t7 , $t6 
 xori   $t6 , $t3 , 2859572443 
 mult  $t5 , $t3 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t1 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 sh   $t7 , 0($a0) 
 xori   $t3 , $t2 , 3481145048 
 mult  $t3 , $t5 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 multu  $t4 , $t7 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t0 , $t6 , 1126550001 
 sb   $t5 , 0($a0) 
 sw   $t1 , 0($a0) 
 or   $t2 , $t0 , $t0 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t7 
 ori   $t4 , $t7 , 2465712246 
 addu   $t0 , $t2 , $t3 
 sb   $t1 , 0($a0) 
 xori   $t1 , $t2 , 1199363395 
 sb   $t5 , 0($a0) 
 sltiu   $t1 , $t4 , 3080852916 
 mult  $t3 , $t7 
 add $0, $0, $0
 mflo  $t3 
 sb   $t6 , 0($a0) 
 sh   $t3 , 0($a0) 
 sb   $t0 , 0($a0) 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t0 
 sw   $t6 , 0($a0) 
 sw   $t2 , 0($a0) 
 lw   $t6 , 0($a0) 
 or   $t5 , $t1 , $t2 
 sw   $t5 , 0($a0) 
 andi   $t0 , $t6 , 4134205085 
 addu   $t6 , $t3 , $t4 
 xori   $t6 , $t2 , 1930710193 
 addiu   $t2 , $t7 , 750965448 
 addiu   $t0 , $t4 , 987528792 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t2 
 mult  $t0 , $t7 
 add $0, $0, $0
 mflo  $t3 
 subu   $t3 , $t1 , $t6 
 addiu   $t7 , $t6 , 38360005 
 multu  $t6 , $t0 
 add $0, $0, $0
 mflo  $t5 
 or   $t4 , $t2 , $t7 
 andi   $t0 , $t6 , 1418090001 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t1 , $t2 , 828530899 
 and   $t0 , $t0 , $t2 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t4 
 multu  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 nor   $t1 , $t5 , $t7 
 subu   $t4 , $t5 , $t2 
 lw   $t0 , 0($a0) 
 or   $t1 , $t1 , $t1 
 addu   $t5 , $t2 , $t7 
 mult  $t7 , $t4 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t4 
 mult  $t3 , $t6 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t3 
 lbu   $t0 , 0($a0) 
 lbu   $t2 , 0($a0) 
 sw   $t5 , 0($a0) 
 ori   $t3 , $t3 , 2557596032 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t6 
 sw   $t2 , 0($a0) 
 lw   $t2 , 0($a0) 
 lb   $t6 , 0($a0) 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t6 
 xor   $t4 , $t3 , $t5 
 addiu   $t1 , $t7 , 3737021203 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t6 
 nor   $t0 , $t4 , $t0 
 sltiu   $t5 , $t1 , 3629947743 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t7 
 sb   $t4 , 0($a0) 
 ori   $t6 , $t7 , 3875306410 
 xor   $t4 , $t2 , $t1 
 lw   $t2 , 0($a0) 
 nor   $t4 , $t4 , $t5 
 andi   $t1 , $t6 , 1156020354 
 lhu   $t3 , 0($a0) 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t5 
 mult  $t6 , $t7 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t4 
 multu  $t7 , $t6 
 add $0, $0, $0
 mflo  $t4 
 andi   $t0 , $t1 , 1474747731 
 lw   $t4 , 0($a0) 
 sh   $t7 , 0($a0) 
 or   $t6 , $t2 , $t2 
 ori   $t5 , $t2 , 3545914139 
 nor   $t5 , $t6 , $t1 
 addiu   $t3 , $t2 , 1340921947 
 addu   $t0 , $t7 , $t4 
 nor   $t1 , $t3 , $t0 
 sh   $t4 , 0($a0) 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t3 
 andi   $t6 , $t2 , 2629886637 
 lbu   $t0 , 0($a0) 
 sb   $t0 , 0($a0) 
 ori   $t0 , $t7 , 4242416943 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t7 
 sh   $t3 , 0($a0) 
 multu  $t7 , $t5 
 add $0, $0, $0
 mflo  $t4 
 xor   $t4 , $t7 , $t0 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t3 
 sltiu   $t3 , $t0 , 2094406975 
 and   $t0 , $t1 , $t7 
 nor   $t2 , $t2 , $t7 
 sh   $t1 , 0($a0) 
 sb   $t1 , 0($a0) 
 multu  $t4 , $t5 
 add $0, $0, $0
 mflo  $t5 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t2 , $t3 , 3870006616 
 andi   $t3 , $t4 , 4239438491 
 lw   $t4 , 0($a0) 
 addu   $t3 , $t0 , $t6 
 sh   $t5 , 0($a0) 
 xori   $t1 , $t0 , 1998314889 
 xor   $t4 , $t2 , $t4 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t4 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t2 
 lb   $t3 , 0($a0) 
 mult  $t6 , $t3 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t6 , 0($a0) 
 xor   $t5 , $t7 , $t1 
 addu   $t7 , $t5 , $t1 
 sb   $t5 , 0($a0) 
 or   $t5 , $t4 , $t0 
 lhu   $t6 , 0($a0) 
 sh   $t6 , 0($a0) 
 sb   $t1 , 0($a0) 
 xori   $t4 , $t6 , 1110300427 
 sltiu   $t0 , $t0 , 2752980491 
 lhu   $t0 , 0($a0) 
 andi   $t5 , $t5 , 3226495111 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t6 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t5 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t3 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t0 
 lbu   $t5 , 0($a0) 
 sw   $t7 , 0($a0) 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t7 
 xor   $t3 , $t2 , $t0 
 mult  $t6 , $t6 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t1 , $t2 , 4243440889 
 subu   $t0 , $t0 , $t1 
 addiu   $t2 , $t1 , 2792584546 
 nor   $t7 , $t0 , $t3 
 subu   $t4 , $t4 , $t3 
 multu  $t7 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t6 
 xor   $t6 , $t4 , $t5 
 andi   $t1 , $t6 , 331815885 
 ori   $t1 , $t6 , 4108720689 
 lbu   $t4 , 0($a0) 
 sb   $t1 , 0($a0) 
 sb   $t6 , 0($a0) 
 lhu   $t1 , 0($a0) 
 mult  $t1 , $t2 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t7 , $t6 , 243814841 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t1 
 ori   $t6 , $t1 , 4005534785 
 subu   $t7 , $t7 , $t0 
 nor   $t4 , $t1 , $t3 
 xori   $t5 , $t1 , 2194677424 
 lbu   $t5 , 0($a0) 
 sh   $t3 , 0($a0) 
 or   $t0 , $t1 , $t3 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t3 
 sb   $t1 , 0($a0) 
 mult  $t6 , $t3 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t3 
 and   $t4 , $t5 , $t7 
 andi   $t7 , $t7 , 2620319800 
 addiu   $t5 , $t7 , 4057269933 
 lw   $t3 , 0($a0) 
 or   $t2 , $t6 , $t2 
 mult  $t5 , $t0 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t3 
 ori   $t0 , $t3 , 2384725846 
 multu  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lbu   $t7 , 0($a0) 
 subu   $t1 , $t0 , $t0 
 lb   $t2 , 0($a0) 
 or   $t7 , $t3 , $t0 
 mult  $t1 , $t4 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t1 
 mult  $t2 , $t2 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t1 
 mult  $t0 , $t0 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t2 
 sw   $t2 , 0($a0) 
 mult  $t3 , $t5 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sb   $t4 , 0($a0) 
 and   $t6 , $t0 , $t5 
 sh   $t4 , 0($a0) 
 addu   $t6 , $t4 , $t7 
 andi   $t4 , $t6 , 3105307474 
 ori   $t2 , $t4 , 838876675 
 sltiu   $t1 , $t4 , 879464378 
 and   $t2 , $t4 , $t7 
 ori   $t0 , $t1 , 2807416973 
 nor   $t4 , $t5 , $t6 
 mult  $t0 , $t6 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t6 
 sh   $t4 , 0($a0) 
 addu   $t5 , $t0 , $t1 
 ori   $t4 , $t1 , 3151992215 
 xor   $t6 , $t0 , $t0 
 ori   $t4 , $t4 , 2447551640 
 lb   $t0 , 0($a0) 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t7 
 mult  $t2 , $t4 
 add $0, $0, $0
 mflo  $t7 
 mult  $t1 , $t7 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t6 
 xori   $t4 , $t5 , 520813354 
 or   $t7 , $t2 , $t4 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t7 
 sb   $t2 , 0($a0) 
 sb   $t4 , 0($a0) 
 sltiu   $t4 , $t4 , 3347379837 
 mult  $t4 , $t1 
 add $0, $0, $0
 mflo  $t1 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t2 
 lhu   $t2 , 0($a0) 
 subu   $t1 , $t3 , $t3 
 lbu   $t6 , 0($a0) 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 addu   $t6 , $t2 , $t4 
 nor   $t6 , $t1 , $t1 
 mult  $t6 , $t2 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t3 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t5 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t0 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t7 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sb   $t6 , 0($a0) 
 addu   $t3 , $t3 , $t7 
 mult  $t3 , $t6 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t5 
 ori   $t3 , $t0 , 514116719 
 lhu   $t1 , 0($a0) 
 addu   $t2 , $t4 , $t6 
 subu   $t6 , $t4 , $t1 
 sh   $t4 , 0($a0) 
 xori   $t5 , $t5 , 2729347184 
 lh   $t7 , 0($a0) 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t2 
 or   $t6 , $t6 , $t2 
 sh   $t2 , 0($a0) 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t4 
 addu   $t1 , $t6 , $t3 
 lw   $t4 , 0($a0) 
 sh   $t0 , 0($a0) 
 mult  $t1 , $t0 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t1 
 andi   $t2 , $t1 , 239258188 
 subu   $t1 , $t7 , $t3 
 subu   $t5 , $t6 , $t6 
 sltiu   $t0 , $t1 , 3662702653 
 andi   $t6 , $t7 , 3274579573 
 lbu   $t1 , 0($a0) 
 ori   $t3 , $t4 , 2645312517 
 addiu   $t0 , $t1 , 2378551071 
 multu  $t5 , $t1 
 add $0, $0, $0
 mflo  $t1 
 xori   $t4 , $t4 , 2178076783 
 sb   $t0 , 0($a0) 
 addiu   $t0 , $t4 , 3748135202 
 multu  $t7 , $t0 
 add $0, $0, $0
 mflo  $t7 
 ori   $t6 , $t2 , 2268978507 
 lbu   $t1 , 0($a0) 
 xori   $t3 , $t2 , 3875593 
 lh   $t4 , 0($a0) 
 xori   $t6 , $t6 , 1919339005 
 sh   $t6 , 0($a0) 
 lh   $t5 , 0($a0) 
 mult  $t7 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sw   $t6 , 0($a0) 
 xori   $t7 , $t3 , 1762918507 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t5 
 xori   $t7 , $t7 , 1357786718 
 sb   $t2 , 0($a0) 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t2 , $t5 , 2127944326 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t2 
 addiu   $t2 , $t7 , 3399836689 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t6 
 addiu   $t0 , $t4 , 3541907750 
 xori   $t3 , $t0 , 3313651845 
 or   $t1 , $t2 , $t5 
 and   $t4 , $t2 , $t4 
 subu   $t7 , $t2 , $t7 
 subu   $t6 , $t7 , $t4 
 mult  $t4 , $t0 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t5 
 multu  $t0 , $t5 
 add $0, $0, $0
 mflo  $t6 
 multu  $t0 , $t7 
 add $0, $0, $0
 mflo  $t7 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t3 
 sh   $t6 , 0($a0) 
 and   $t1 , $t4 , $t7 
 lw   $t1 , 0($a0) 
 nor   $t4 , $t5 , $t3 
 sltiu   $t1 , $t1 , 2714085459 
 or   $t3 , $t6 , $t7 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t2 
 andi   $t6 , $t1 , 1602799857 
 addiu   $t7 , $t1 , 1061303086 
 lhu   $t7 , 0($a0) 
 nor   $t7 , $t3 , $t4 
 sb   $t7 , 0($a0) 
 subu   $t2 , $t5 , $t6 
 xori   $t7 , $t4 , 2301982347 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t3 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t2 
 sw   $t2 , 0($a0) 
 sltiu   $t3 , $t7 , 1884250120 
 lbu   $t6 , 0($a0) 
 and   $t3 , $t7 , $t1 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t1 
 sb   $t6 , 0($a0) 
 ori   $t0 , $t2 , 1587788330 
 multu  $t4 , $t7 
 add $0, $0, $0
 mflo  $t0 
 xor   $t3 , $t2 , $t5 
 addu   $t2 , $t6 , $t5 
 sw   $t1 , 0($a0) 
 multu  $t1 , $t4 
 add $0, $0, $0
 mflo  $t6 
 sw   $t7 , 0($a0) 
 sb   $t2 , 0($a0) 
 xori   $t6 , $t0 , 4025420850 
 and   $t2 , $t7 , $t2 
 ori   $t5 , $t7 , 3310286410 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 lb   $t2 , 0($a0) 
 addu   $t4 , $t6 , $t4 
 multu  $t2 , $t4 
 add $0, $0, $0
 mflo  $t7 
 xori   $t4 , $t3 , 2857456609 
 sw   $t2 , 0($a0) 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t3 
 xori   $t0 , $t6 , 4201918581 
 nor   $t2 , $t7 , $t4 
 xori   $t6 , $t7 , 360208837 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t4 
 addiu   $t6 , $t0 , 3085382530 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t7 
 or   $t4 , $t4 , $t6 
 addu   $t7 , $t1 , $t5 
 ori   $t7 , $t1 , 3483850337 
 and   $t3 , $t6 , $t2 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t4 
 sb   $t0 , 0($a0) 
 addiu   $t4 , $t0 , 2461712169 
 ori   $t7 , $t4 , 1352909610 
 subu   $t2 , $t0 , $t6 
 addiu   $t5 , $t0 , 1961888916 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t4 
 nor   $t2 , $t5 , $t6 
 nor   $t5 , $t2 , $t6 
 sb   $t7 , 0($a0) 
 sb   $t3 , 0($a0) 
 or   $t2 , $t4 , $t2 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t3 
 andi   $t4 , $t1 , 4197381189 
 nor   $t7 , $t4 , $t2 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t1 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t5 
 addu   $t5 , $t3 , $t7 
 multu  $t4 , $t7 
 add $0, $0, $0
 mflo  $t7 
 and   $t0 , $t0 , $t7 
 or   $t3 , $t5 , $t0 
 xor   $t0 , $t6 , $t4 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t7 
 mult  $t3 , $t7 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t6 
 lhu   $t3 , 0($a0) 
 addu   $t0 , $t4 , $t3 
 and   $t6 , $t6 , $t5 
 addu   $t5 , $t6 , $t7 
 xori   $t4 , $t6 , 2271523930 
 xori   $t7 , $t2 , 1346377527 
 and   $t7 , $t4 , $t6 
 nor   $t7 , $t2 , $t4 
 sltiu   $t2 , $t0 , 3947011695 
 mult  $t7 , $t0 
 add $0, $0, $0
 mflo  $t1 
 lhu   $t5 , 0($a0) 
 mult  $t6 , $t6 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t1 , $t3 , 3051404406 
 lhu   $t0 , 0($a0) 
 mult  $t0 , $t0 
 add $0, $0, $0
 mflo  $t4 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t4 
 mult  $t3 , $t2 
 mult  $t6 , $t6 
 add $0, $0, $0
 mflo  $t6 
 xor   $t1 , $t2 , $t4 
 mult  $t5 , $t4 
 mult  $t0 , $t1 
 add $0, $0, $0
 mflo  $t7 
 nor   $t4 , $t7 , $t3 
 lh   $t4 , 0($a0) 
 or   $t6 , $t6 , $t1 
 lhu   $t7 , 0($a0) 
 lb   $t4 , 0($a0) 
 lhu   $t1 , 0($a0) 
 sltiu   $t7 , $t3 , 2743733922 
 lhu   $t3 , 0($a0) 
 sh   $t5 , 0($a0) 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t2 
 or   $t7 , $t1 , $t0 
 sw   $t2 , 0($a0) 
 ori   $t1 , $t1 , 3097079971 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t4 
 lb   $t1 , 0($a0) 
 and   $t6 , $t4 , $t3 
 mult  $t2 , $t2 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t2 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t3 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t0 
 mult  $t0 , $t0 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t5 
 xor   $t1 , $t3 , $t2 
 multu  $t2 , $t7 
 add $0, $0, $0
 mflo  $t5 
 mult  $t5 , $t3 
 add $0, $0, $0
 mflo  $t2 
 subu   $t5 , $t3 , $t0 
 lw   $t3 , 0($a0) 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t6 
 and   $t0 , $t5 , $t2 
 subu   $t2 , $t5 , $t3 
 addiu   $t0 , $t6 , 587327421 
 xor   $t4 , $t0 , $t5 
 multu  $t7 , $t6 
 add $0, $0, $0
 mflo  $t5 
 mult  $t3 , $t1 
 mult  $t5 , $t4 
 add $0, $0, $0
 mflo  $t0 
 lw   $t6 , 0($a0) 
 mult  $t0 , $t3 
 add $0, $0, $0
 mflo  $t1 
 mult  $t7 , $t4 
 mult  $t7 , $t4 
 add $0, $0, $0
 mflo  $t0 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t4 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t5 
 addiu   $t1 , $t6 , 4052339168 
 nor   $t2 , $t0 , $t7 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t2 , $t5 , 1126711662 
 xor   $t3 , $t5 , $t4 
 sb   $t6 , 0($a0) 
 lh   $t6 , 0($a0) 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t5 
 subu   $t1 , $t0 , $t0 
 mult  $t1 , $t0 
 mult  $t4 , $t2 
 add $0, $0, $0
 mflo  $t0 
 sw   $t3 , 0($a0) 
 mult  $t1 , $t5 
 add $0, $0, $0
 mflo  $t7 
 nor   $t7 , $t5 , $t4 
 ori   $t6 , $t5 , 4105503161 
 xor   $t2 , $t7 , $t6 
 or   $t6 , $t7 , $t6 
 mult  $t0 , $t1 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t6 
 ori   $t3 , $t7 , 3560078298 
 sb   $t1 , 0($a0) 
 addu   $t1 , $t3 , $t2 
 sb   $t1 , 0($a0) 
 mult  $t3 , $t6 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t0 
 multu  $t6 , $t7 
 add $0, $0, $0
 mflo  $t2 
 xori   $t7 , $t3 , 2856027400 
 lw   $t0 , 0($a0) 
 xori   $t3 , $t7 , 1454618823 
 multu  $t5 , $t7 
 add $0, $0, $0
 mflo  $t4 
 sltiu   $t7 , $t4 , 2040917719 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t0 
 subu   $t7 , $t2 , $t7 
 nor   $t5 , $t3 , $t5 
 mult  $t4 , $t5 
 add $0, $0, $0
 mflo  $t0 
 mult  $t3 , $t4 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t1 
 xori   $t1 , $t5 , 1124927363 
 subu   $t3 , $t6 , $t4 
 sw   $t3 , 0($a0) 
 sb   $t7 , 0($a0) 
 sh   $t1 , 0($a0) 
 xor   $t5 , $t4 , $t4 
 addiu   $t7 , $t5 , 963347609 
 or   $t0 , $t2 , $t3 
 and   $t0 , $t1 , $t2 
 mult  $t5 , $t7 
 add $0, $0, $0
 mflo  $t5 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 lh   $t5 , 0($a0) 
 and   $t1 , $t3 , $t1 
 lbu   $t3 , 0($a0) 
 sh   $t5 , 0($a0) 
 subu   $t3 , $t2 , $t2 
 sb   $t6 , 0($a0) 
 lb   $t2 , 0($a0) 
 sh   $t3 , 0($a0) 
 sltiu   $t3 , $t7 , 165270625 
 multu  $t5 , $t4 
 add $0, $0, $0
 mflo  $t0 
 sh   $t5 , 0($a0) 
 andi   $t4 , $t2 , 1266654057 
 ori   $t5 , $t4 , 2734597590 
 or   $t0 , $t7 , $t4 
 xori   $t7 , $t6 , 2916611150 
 xor   $t6 , $t6 , $t3 
 or   $t2 , $t3 , $t6 
 mult  $t1 , $t0 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t1 
 xori   $t2 , $t1 , 433521745 
 addiu   $t6 , $t7 , 1427505671 
 addiu   $t4 , $t1 , 3265041490 
 xori   $t7 , $t7 , 2952903361 
 multu  $t1 , $t1 
 add $0, $0, $0
 mflo  $t0 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t5 
 xor   $t5 , $t0 , $t4 
 lb   $t1 , 0($a0) 
 sh   $t4 , 0($a0) 
 sw   $t5 , 0($a0) 
 addu   $t1 , $t5 , $t4 
 and   $t7 , $t0 , $t2 
 or   $t3 , $t1 , $t3 
 subu   $t3 , $t4 , $t2 
 lhu   $t6 , 0($a0) 
 addu   $t1 , $t0 , $t3 
 lb   $t4 , 0($a0) 
 multu  $t2 , $t5 
 add $0, $0, $0
 mflo  $t3 
 sb   $t0 , 0($a0) 
 sw   $t1 , 0($a0) 
 mult  $t4 , $t3 
 mult  $t3 , $t6 
 add $0, $0, $0
 mflo  $t0 
 subu   $t6 , $t6 , $t4 
 sh   $t3 , 0($a0) 
 sb   $t4 , 0($a0) 
 andi   $t3 , $t4 , 3161614992 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sh   $t4 , 0($a0) 
 lbu   $t7 , 0($a0) 
 sb   $t2 , 0($a0) 
 sw   $t7 , 0($a0) 
 lb   $t6 , 0($a0) 
 sltiu   $t0 , $t7 , 4174352941 
 subu   $t2 , $t6 , $t6 
 addiu   $t3 , $t4 , 3485347140 
 mult  $t5 , $t2 
 mult  $t5 , $t5 
 add $0, $0, $0
 mflo  $t2 
 or   $t0 , $t6 , $t1 
 sltiu   $t5 , $t5 , 2185446937 
 mult  $t2 , $t4 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t7 
 and   $t3 , $t2 , $t5 
 multu  $t3 , $t7 
 add $0, $0, $0
 mflo  $t2 
 sb   $t7 , 0($a0) 
 ori   $t4 , $t7 , 2863487885 
 or   $t0 , $t2 , $t0 
 sltiu   $t2 , $t1 , 1600781348 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t7 
 sw   $t1 , 0($a0) 
 nor   $t0 , $t5 , $t1 
 mult  $t0 , $t2 
 add $0, $0, $0
 mflo  $t5 
 mult  $t6 , $t4 
 mult  $t7 , $t7 
 add $0, $0, $0
 mflo  $t5 
 and   $t5 , $t2 , $t6 
 sb   $t4 , 0($a0) 
 lb   $t3 , 0($a0) 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t7 
 and   $t7 , $t4 , $t3 
 sw   $t4 , 0($a0) 
 xor   $t7 , $t1 , $t5 
 or   $t7 , $t0 , $t2 
 lb   $t7 , 0($a0) 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t3 
 subu   $t0 , $t2 , $t0 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t7 
 addiu   $t6 , $t6 , 359471852 
 xori   $t4 , $t0 , 813475180 
 lbu   $t2 , 0($a0) 
 sh   $t7 , 0($a0) 
 addiu   $t2 , $t1 , 576702976 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t2 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t3 
 lw   $t6 , 0($a0) 
 addiu   $t2 , $t4 , 1432631532 
 sh   $t4 , 0($a0) 
 and   $t5 , $t0 , $t2 
 or   $t2 , $t6 , $t5 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t1 
 lb   $t7 , 0($a0) 
 xor   $t2 , $t5 , $t3 
 or   $t4 , $t1 , $t7 
 ori   $t7 , $t2 , 427316467 
 mult  $t1 , $t3 
 add $0, $0, $0
 mflo  $t5 
 sltiu   $t1 , $t3 , 704264630 
 ori   $t3 , $t0 , 1384398732 
 mult  $t1 , $t7 
 add $0, $0, $0
 mflo  $t1 
 lhu   $t2 , 0($a0) 
 xori   $t2 , $t5 , 157713953 
 mult  $t4 , $t6 
 mult  $t4 , $t4 
 add $0, $0, $0
 mflo  $t1 
 and   $t4 , $t7 , $t6 
 and   $t2 , $t1 , $t1 
 ori   $t4 , $t5 , 3698968313 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t2 
 lbu   $t0 , 0($a0) 
 lh   $t0 , 0($a0) 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t0 
 sltiu   $t3 , $t2 , 3710818189 
 lhu   $t0 , 0($a0) 
 mult  $t7 , $t4 
 mult  $t6 , $t5 
 add $0, $0, $0
 mflo  $t5 
 and   $t2 , $t4 , $t3 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t4 
 ori   $t1 , $t7 , 80089055 
 andi   $t5 , $t1 , 381025024 
 mult  $t3 , $t0 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sh   $t3 , 0($a0) 
 subu   $t7 , $t4 , $t7 
 ori   $t6 , $t0 , 2511748645 
 or   $t5 , $t5 , $t4 
 xori   $t7 , $t5 , 803941902 
 multu  $t4 , $t4 
 add $0, $0, $0
 mflo  $t0 
 or   $t2 , $t3 , $t6 
 mult  $t2 , $t3 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t2 
 multu  $t4 , $t0 
 add $0, $0, $0
 mflo  $t0 
 lb   $t0 , 0($a0) 
 subu   $t6 , $t2 , $t4 
 xor   $t4 , $t5 , $t6 
 andi   $t3 , $t4 , 30913569 
 ori   $t4 , $t3 , 4143158509 
 addiu   $t5 , $t2 , 866925098 
 xori   $t7 , $t3 , 1506125740 
 addu   $t4 , $t5 , $t3 
 xori   $t4 , $t6 , 3036529190 
 addiu   $t1 , $t6 , 3022017096 
 lb   $t6 , 0($a0) 
 xori   $t6 , $t3 , 4246106669 
 lh   $t0 , 0($a0) 
 multu  $t1 , $t0 
 add $0, $0, $0
 mflo  $t0 
 xori   $t1 , $t3 , 325689101 
 mult  $t2 , $t2 
 mult  $t3 , $t0 
 add $0, $0, $0
 mflo  $t0 
 lb   $t4 , 0($a0) 
 or   $t0 , $t7 , $t5 
 mult  $t7 , $t4 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t3 
 lh   $t5 , 0($a0) 
 nor   $t2 , $t4 , $t4 
 mult  $t6 , $t6 
 mult  $t0 , $t6 
 add $0, $0, $0
 mflo  $t6 
 multu  $t2 , $t4 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t2 , $t5 , 1817741480 
 addiu   $t2 , $t1 , 2144291190 
 sltiu   $t6 , $t3 , 3515758525 
 lbu   $t6 , 0($a0) 
 multu  $t6 , $t1 
 add $0, $0, $0
 mflo  $t4 
 multu  $t4 , $t3 
 add $0, $0, $0
 mflo  $t3 
 addiu   $t4 , $t5 , 2820511027 
 multu  $t5 , $t0 
 add $0, $0, $0
 mflo  $t0 
 xori   $t0 , $t6 , 977237811 
 lbu   $t4 , 0($a0) 
 xori   $t6 , $t3 , 2294602444 
 ori   $t1 , $t0 , 3760786781 
 subu   $t1 , $t5 , $t1 
 addiu   $t1 , $t7 , 4271813023 
 sltiu   $t1 , $t4 , 3227124748 
 nor   $t4 , $t2 , $t1 
 ori   $t6 , $t4 , 3980590107 
 xor   $t1 , $t0 , $t4 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t4 
 mult  $t4 , $t3 
 add $0, $0, $0
 mflo  $t4 
 sw   $t7 , 0($a0) 
 subu   $t1 , $t7 , $t7 
 sb   $t1 , 0($a0) 
 sh   $t3 , 0($a0) 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t7 
 addu   $t4 , $t0 , $t3 
 ori   $t1 , $t1 , 3958078051 
 lbu   $t0 , 0($a0) 
 ori   $t0 , $t0 , 970441440 
 subu   $t2 , $t6 , $t6 
 subu   $t1 , $t1 , $t6 
 and   $t0 , $t7 , $t2 
 andi   $t3 , $t2 , 2210146564 
 mult  $t1 , $t0 
 mult  $t6 , $t3 
 add $0, $0, $0
 mflo  $t6 
 mult  $t5 , $t5 
 mult  $t4 , $t0 
 add $0, $0, $0
 mflo  $t1 
 nor   $t5 , $t6 , $t4 
 subu   $t3 , $t3 , $t2 
 sltiu   $t0 , $t1 , 1727504874 
 lb   $t0 , 0($a0) 
 xori   $t5 , $t7 , 1548611082 
 lhu   $t4 , 0($a0) 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t3 
 ori   $t2 , $t7 , 37114862 
 addu   $t2 , $t7 , $t3 
 addiu   $t0 , $t0 , 409182360 
 lh   $t0 , 0($a0) 
 or   $t6 , $t3 , $t5 
 addiu   $t4 , $t2 , 2930337232 
 sltiu   $t0 , $t0 , 1281495532 
 mult  $t7 , $t4 
 mult  $t2 , $t3 
 add $0, $0, $0
 mflo  $t1 
 nor   $t2 , $t4 , $t1 
 lh   $t4 , 0($a0) 
 subu   $t5 , $t5 , $t1 
 xori   $t3 , $t5 , 991892692 
 sw   $t2 , 0($a0) 
 or   $t3 , $t3 , $t5 
 sh   $t6 , 0($a0) 
 ori   $t6 , $t7 , 404353860 
 subu   $t0 , $t6 , $t0 
 or   $t7 , $t1 , $t2 
 sw   $t4 , 0($a0) 
 mult  $t4 , $t4 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t7 
 sltiu   $t1 , $t0 , 1203632508 
 xor   $t3 , $t7 , $t7 
 mult  $t7 , $t6 
 mult  $t5 , $t6 
 add $0, $0, $0
 mflo  $t7 
 nor   $t6 , $t5 , $t6 
 andi   $t5 , $t2 , 1524558259 
 ori   $t3 , $t7 , 1435174462 
 xor   $t0 , $t1 , $t7 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t7 
 multu  $t1 , $t5 
 add $0, $0, $0
 mflo  $t4 
 andi   $t2 , $t2 , 2111194090 
 lhu   $t1 , 0($a0) 
 nor   $t4 , $t7 , $t0 
 addiu   $t7 , $t7 , 3034370850 
 addu   $t5 , $t7 , $t2 
 addu   $t4 , $t4 , $t1 
 lhu   $t7 , 0($a0) 
 and   $t6 , $t0 , $t1 
 nor   $t7 , $t4 , $t4 
 addiu   $t3 , $t2 , 1560622033 
 or   $t0 , $t3 , $t3 
 multu  $t6 , $t5 
 add $0, $0, $0
 mflo  $t1 
 xor   $t4 , $t5 , $t6 
 addiu   $t2 , $t7 , 2658999961 
 ori   $t0 , $t0 , 2229826389 
 multu  $t4 , $t1 
 add $0, $0, $0
 mflo  $t7 
 sw   $t5 , 0($a0) 
 nor   $t2 , $t6 , $t6 
 mult  $t2 , $t5 
 add $0, $0, $0
 mflo  $t4 
 lh   $t2 , 0($a0) 
 mult  $t2 , $t0 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t4 
 multu  $t5 , $t3 
 add $0, $0, $0
 mflo  $t6 
 nor   $t7 , $t6 , $t0 
 sb   $t1 , 0($a0) 
 xori   $t2 , $t6 , 890015980 
 sh   $t7 , 0($a0) 
 mult  $t7 , $t2 
 add $0, $0, $0
 mflo  $t7 
 sb   $t3 , 0($a0) 
 and   $t1 , $t5 , $t1 
 sltiu   $t3 , $t2 , 3924253692 
 multu  $t7 , $t2 
 add $0, $0, $0
 mflo  $t4 
 xor   $t4 , $t0 , $t7 
 sltiu   $t7 , $t2 , 473481321 
 addiu   $t1 , $t1 , 732283202 
 mult  $t1 , $t7 
 mult  $t4 , $t6 
 add $0, $0, $0
 mflo  $t5 
 xor   $t1 , $t6 , $t5 
 sw   $t5 , 0($a0) 
 mult  $t2 , $t0 
 add $0, $0, $0
 mflo  $t3 
 xor   $t4 , $t1 , $t3 
 xori   $t0 , $t3 , 515211804 
 lb   $t4 , 0($a0) 
 sw   $t2 , 0($a0) 
 sltiu   $t1 , $t1 , 1089660917 
 lb   $t0 , 0($a0) 
 lbu   $t5 , 0($a0) 
 multu  $t1 , $t6 
 add $0, $0, $0
 mflo  $t0 
 subu   $t3 , $t2 , $t3 
 mult  $t2 , $t6 
 add $0, $0, $0
 mflo  $t3 
 andi   $t3 , $t6 , 2692239825 
 lbu   $t5 , 0($a0) 
 mult  $t7 , $t4 
 mult  $t0 , $t4 
 add $0, $0, $0
 mflo  $t0 
 addiu   $t7 , $t3 , 2357641861 
 addu   $t2 , $t2 , $t4 
 mult  $t7 , $t1 
 add $0, $0, $0
 mflo  $t3 
 mult  $t5 , $t1 
 add $0, $0, $0
 mflo  $t6 
 xori   $t3 , $t4 , 4249873512 
 or   $t2 , $t2 , $t4 
 xor   $t5 , $t1 , $t6 
 sltiu   $t6 , $t4 , 3720744518 
 andi   $t4 , $t4 , 2085055678 
 lbu   $t3 , 0($a0) 
 andi   $t1 , $t5 , 3761905716 
 ori   $t5 , $t2 , 4284146878 
 lb   $t5 , 0($a0) 
 addiu   $t5 , $t2 , 570582724 
 sw   $t1 , 0($a0) 
 ori   $t1 , $t6 , 3903931494 
 mult  $t3 , $t1 
 mult  $t7 , $t3 
 add $0, $0, $0
 mflo  $t5 
 mult  $t2 , $t1 
 add $0, $0, $0
 mflo  $t1 
 addiu   $t2 , $t3 , 3625799861 
 mult  $t4 , $t3 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t1 
 mult  $t1 , $t2 
 add $0, $0, $0
 mflo  $t3 
 lbu   $t7 , 0($a0) 
 multu  $t6 , $t4 
 add $0, $0, $0
 mflo  $t4 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t1 
 xor   $t0 , $t0 , $t6 
 subu   $t4 , $t5 , $t5 
 multu  $t7 , $t6 
 add $0, $0, $0
 mflo  $t5 
 or   $t2 , $t7 , $t3 
 mult  $t6 , $t5 
 mult  $t2 , $t2 
 add $0, $0, $0
 mflo  $t7 
 mult  $t1 , $t1 
 add $0, $0, $0
 mflo  $t2 
 sltiu   $t6 , $t3 , 1536798101 
 sb   $t1 , 0($a0) 
 xor   $t0 , $t2 , $t3 
 mult  $t3 , $t5 
 add $0, $0, $0
 mflo  $t6 
 lh   $t7 , 0($a0) 
 lw   $t3 , 0($a0) 
 mult  $t6 , $t5 
 mult  $t2 , $t7 
 add $0, $0, $0
 mflo  $t0 
 sw   $t1 , 0($a0) 
 lbu   $t4 , 0($a0) 
 and   $t5 , $t7 , $t1 
 mult  $t6 , $t2 
 add $0, $0, $0
 mflo  $t6 
 and   $t3 , $t2 , $t7 
 addiu   $t2 , $t4 , 659228455 
 multu  $t7 , $t7 
 add $0, $0, $0
 mflo  $t2 
 mult  $t3 , $t4 
 add $0, $0, $0
 mflo  $t5 
 lw   $t7 , 0($a0) 
 lhu   $t3 , 0($a0) 
 sh   $t7 , 0($a0) 
 multu  $t4 , $t2 
 add $0, $0, $0
 mflo  $t4 
 sh   $t2 , 0($a0) 
 sh   $t5 , 0($a0) 
 xori   $t5 , $t7 , 2291518192 
 and   $t2 , $t7 , $t7 
 multu  $t6 , $t6 
 add $0, $0, $0
 mflo  $t3 
 mult  $t2 , $t4 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t6 
 subu   $t7 , $t5 , $t7 
 addiu   $t4 , $t2 , 3225223871 
 multu  $t0 , $t2 
 add $0, $0, $0
 mflo  $t2 
 nor   $t7 , $t4 , $t2 
 mult  $t3 , $t2 
 mult  $t1 , $t6 
 add $0, $0, $0
 mflo  $t6 
 sltiu   $t2 , $t7 , 1499763848 
 sltiu   $t2 , $t5 , 3378091351 
 xor   $t4 , $t0 , $t1 
 nor   $t5 , $t6 , $t0 
 nor   $t1 , $t6 , $t6 
 mult  $t1 , $t4 
 add $0, $0, $0
 mflo  $t4 
 ori   $t2 , $t0 , 524222440 
 addu   $t1 , $t7 , $t7 
 or   $t2 , $t7 , $t6 
 sw   $t2 , 0($a0) 
 multu  $t2 , $t3 
 add $0, $0, $0
 mflo  $t7 
 multu  $t1 , $t7 
 add $0, $0, $0
 mflo  $t6 
 mult  $t3 , $t2 
 add $0, $0, $0
 mflo  $t6 
 mult  $t6 , $t0 
 add $0, $0, $0
 mflo  $t3 
 sh   $t1 , 0($a0) 
 sb   $t4 , 0($a0) 
 lw   $t0 , 0($a0) 
 lh   $t1 , 0($a0) 
 andi   $t1 , $t1 , 3817157045 
 xori   $t6 , $t1 , 332214048 
 addiu   $t2 , $t4 , 1333209773 
 ori   $t6 , $t7 , 344738132 
 multu  $t3 , $t4 
 add $0, $0, $0
 mflo  $t7 
 nor   $t2 , $t1 , $t5 
 ori   $t5 , $t2 , 3042953330 
 and   $t3 , $t1 , $t0 
 ori   $t4 , $t5 , 2379081161 
 multu  $t0 , $t1 
 add $0, $0, $0
 mflo  $t0 
 multu  $t7 , $t2 
 add $0, $0, $0
 mflo  $t1 
 xori   $t5 , $t5 , 2841893708 
 sb   $t0 , 0($a0) 
 nor   $t6 , $t3 , $t7 
 nor   $t4 , $t3 , $t0 
 xori   $t1 , $t0 , 1409492857 
 addiu $v0, $0, 10
 syscall

