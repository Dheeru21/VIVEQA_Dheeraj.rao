
Assignment: Number Systems

Q1. Complete the table with equivalents...

1. 143.75 (decimal)

Binary:
Integer part: 143/2=71 rem 1, 71/2=35 rem 1, 35/2=17 rem 1, 17/2=8 rem 1, 8/2=4 rem 0, 4/2=2 rem 0, 2/2=1 rem 0, 1/2=0 rem 1. Reading from bottom: 10001111
Fraction: 0.75 * 2 = 1.5 (1), 0.5 * 2 = 1.0 (1). Reading top down: .11
Ans: 10001111.11

Octal:
Integer: 143/8 = 17 rem 7, 17/8 = 2 rem 1, 2/8 = 0 rem 2 -> 217
Fraction: 0.75 * 8 = 6.0 (6) -> .6
Ans: 217.6

Hex:
Integer: 143/16 = 8 rem 15(F), 8/16 = 0 rem 8 -> 8F
Fraction: 0.75 * 16 = 12.0(C) -> .C
Ans: 8F.C


2. 11011.101 (binary)
Decimal: 16 + 8 + 0 + 2 + 1 + 0.5 + 0 + 0.125
Ans: 27.625

Octal: group into 3s -> 011 011 . 101
Ans: 33.5

Hex: group into 4s -> 0001 1011 . 1010
Ans: 1B.A 


3. 453 (octal)
Decimal: 4(64) + 5(8) + 3(1) = 256 + 40 + 3
Ans: 299 

Binary: 4 is 100, 5 is 101, 3 is 011
Ans: 100101011

Hex: group binary into 4s -> 0001 0010 1011
Ans: 12B


4. 1F.C (hex)
Decimal: 1(16) + 15(1) + 12(1/16) = 16 + 15 + 0.75
Ans: 31.75

Binary: 1 is 0001, F is 1111, C is 1100
Ans: 11111.11

Octal: group binary into 3s -> 011 111 . 110
Ans: 37.6


Q2. Find equivalents:
a) 324 base 5 = ? base 10
= 3*(5^2) + 2*(5^1) + 4*(5^0)
= 75 + 10 + 4
Ans: 89

b) 32.23 base 4 = ? base 10
= 3*(4^1) + 2*(4^0) + 2*(4^-1) + 3*(4^-2)
= 12 + 2 + 0.5 + 0.1875
Ans: 14.6875

c) 231 base 10 = ? base 7
231 / 7 = 33 rem 0
33 / 7 = 4 rem 5
4 / 7 = 0 rem 4
Read bottom up
Ans: 450 base 7

d) 189 base 10 = ? base 6
189 / 6 = 31 rem 3
31 / 6 = 5 rem 1
5 / 6 = 0 rem 5
Read bottom up
Ans: 513 base 6

Q3. Find the radix r:
a) (312/20)_r = (13.1)_r
writing it out as an equation:
(3r^2 + r + 2) / 2r = r + 3 + 1/r
multiply by 2r on both sides:
3r^2 + r + 2 = 2r^2 + 6r + 2
r^2 - 5r = 0
r(r - 5) = 0. 
r has to be greater than 3, 
so r = 5.

b) 264_r + 136_r = 433_r
if you look at the units place, 4 + 6 = 10 in decimal.
the sum has a 3 in the units place.
so 10 - r = 3, which means
 r = 7.

c) 221505_8 = 12345_r
convert left side to decimal first:
2(8^5) + 2(8^4) + 1(8^3) + 5(8^2) + 0 + 5
= 65536 + 8192 + 512 + 320 + 5 = 74565
so 12345_r = 74565
1 * r^4 is around 74565. 16^4 is 65536, so let's check r=16.
1(16^4) + 2(16^3) + 3(16^2) + 4(16) + 5
= 65536 + 8192 + 768 + 64 + 5 = 74565.
so r = 16.

Q4. Addition:
a) 1101_2 + 11011111_2
(right to left)
1 + 1 = 2 (write 0, carry 1)
0 + 1 + 1 = 2 (write 0, carry 1)
1 + 1 + 1 = 3 (write 1, carry 1)
1 + 1 + 1 = 3 (write 1, carry 1)
0 + 1 + 1 = 2 (write 0, carry 1)
0 + 0 + 1 = 1 (write 1)
0 + 1 = 1 (write 1)
0 + 1 = 1 (write 1)
Ans: 11101100_2

b) 77652_8 + 76543_8
(right to left)
2 + 3 = 5 (write 5)
5 + 4 = 9 -> 9-8=1 (write 1, carry 1)
6 + 5 + 1 = 12 -> 12-8=4 (write 4, carry 1)
7 + 6 + 1 = 14 -> 14-8=6 (write 6, carry 1)
7 + 7 + 1 = 15 -> 15-8=7 (write 7, carry 1)
bring down carry 1
Ans: 176415_8

c) 578A_16 + ABDE_16
(right to left)
10 + 14 = 24 -> 24-16=8 (write 8, carry 1)
8 + 13 + 1 = 22 -> 22-16=6 (write 6, carry 1)
7 + 11 + 1 = 19 -> 19-16=3 (write 3, carry 1)
5 + 10 + 1 = 16 -> 16-16=0 (write 0, carry 1)
bring down carry 1
Ans: 10368_16

d) 234_6 + 315_6
(right to left)
4 + 5 = 9 -> 9-6=3 (write 3, carry 1)
3 + 1 + 1 = 5 (write 5)
2 + 3 = 5 (write 5)
Ans: 553

Q5. Binary -> Gray code:
(drop MSB, XOR consecutive bits)
a) 10101_2
1 -> 1
1 xor 0 = 1
0 xor 1 = 1
1 xor 0 = 1
0 xor 1 = 1
Ans: 11111

b) 01110_2
0 -> 0
0 xor 1 = 1
1 xor 1 = 0
1 xor 1 = 0
1 xor 0 = 1
Ans: 01001

Q6. Gray code -> Binary:
(drop MSB, XOR current bin bit with next gray bit)
a) 01101 (gray)
0 -> 0
0 xor 1 = 1
1 xor 1 = 0
0 xor 0 = 0
0 xor 1 = 1
Ans: 01001

b) 10101 (gray)
1 -> 1
1 xor 0 = 1
1 xor 1 = 0
0 xor 0 = 0
0 xor 1 = 1
Ans: 11001