LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY testbench IS
END testbench;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY testbench_mock IS
Port (
INT:IN std_logic;
HSYNC:IN std_logic
);
END testbench_mock;
ARCHITECTURE behavior OF testbench_mock IS
BEGIN
mpock_proc: process(INT,HSYNC)
begin
end process;
END;
ARCHITECTURE behavior OF testbench IS
signal INT:std_logic:='X';
signal VSYNC:std_logic:='X';
signal HSYNC:std_logic:='X';
COMPONENT testbench_mock
PORT(
INT : IN  std_logic;
HSYNC : IN  std_logic
);
END COMPONENT;
BEGIN
tbm: testbench_mock PORT MAP (
INT => INT,
HSYNC => HSYNC
);
-- Stimulus process
stim_proc: process
begin
HSYNC<='X';
INT<='X';
VSYNC<='X';
--step from 0 to 2
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='X';
--step from 2 to 102
wait for 100 ns;
HSYNC<='0';
INT<='1';
VSYNC<='X';
--step from 102 to 104
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='X';
--step from 104 to 126
wait for 22 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 126 to 128
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 128 to 232
wait for 104 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 232 to 234
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 234 to 254
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 254 to 256
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 256 to 336
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 336 to 338
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 338 to 382
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 382 to 384
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 384 to 440
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 440 to 442
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 442 to 510
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 510 to 512
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 512 to 544
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 544 to 546
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 546 to 638
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 638 to 640
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 640 to 648
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 648 to 650
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 650 to 752
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 752 to 754
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 754 to 766
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 766 to 768
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 768 to 856
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 856 to 858
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 858 to 894
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 894 to 896
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 896 to 960
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 960 to 962
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 962 to 1022
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1022 to 1024
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1024 to 1064
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1064 to 1066
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1066 to 1150
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1150 to 1152
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1152 to 1168
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1168 to 1170
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1170 to 1272
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1272 to 1274
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1274 to 1278
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1278 to 1280
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1280 to 1376
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1376 to 1378
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1378 to 1406
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1406 to 1408
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1408 to 1480
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1480 to 1482
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1482 to 1534
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1534 to 1536
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1536 to 1584
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1584 to 1586
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1586 to 1662
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1662 to 1664
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1664 to 1688
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1688 to 1690
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1690 to 1790
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1790 to 1792
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1792 to 1794
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1794 to 1896
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 1896 to 1898
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1898 to 1918
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 1918 to 1920
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 1920 to 2000
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2000 to 2002
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2002 to 2046
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2046 to 2048
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2048 to 2104
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2104 to 2106
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2106 to 2174
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2174 to 2176
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2176 to 2208
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2208 to 2210
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2210 to 2302
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2302 to 2304
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2304 to 2312
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2312 to 2314
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2314 to 2416
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2416 to 2418
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2418 to 2430
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2430 to 2432
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2432 to 2520
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2520 to 2522
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2522 to 2558
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2558 to 2560
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2560 to 2624
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2624 to 2626
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2626 to 2686
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2686 to 2688
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2688 to 2728
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2728 to 2730
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2730 to 2814
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2814 to 2816
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2816 to 2832
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2832 to 2834
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2834 to 2936
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 2936 to 2938
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2938 to 2942
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 2942 to 2944
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 2944 to 3040
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3040 to 3042
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3042 to 3070
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3070 to 3072
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3072 to 3144
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3144 to 3146
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3146 to 3198
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3198 to 3200
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3200 to 3248
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3248 to 3250
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3250 to 3326
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3326 to 3328
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3328 to 3352
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3352 to 3354
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3354 to 3454
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3454 to 3456
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3456 to 3458
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3458 to 3560
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3560 to 3562
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3562 to 3582
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3582 to 3584
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3584 to 3664
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3664 to 3666
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3666 to 3710
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3710 to 3712
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3712 to 3768
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3768 to 3770
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3770 to 3838
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3838 to 3840
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3840 to 3872
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3872 to 3874
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3874 to 3966
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 3966 to 3968
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3968 to 3976
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 3976 to 3978
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 3978 to 4080
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4080 to 4082
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4082 to 4094
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4094 to 4096
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4096 to 4184
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4184 to 4186
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4186 to 4222
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4222 to 4224
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4224 to 4288
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4288 to 4290
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4290 to 4350
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4350 to 4352
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4352 to 4392
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4392 to 4394
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4394 to 4478
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4478 to 4480
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4480 to 4496
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4496 to 4498
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4498 to 4600
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4600 to 4602
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4602 to 4606
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4606 to 4608
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4608 to 4704
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4704 to 4706
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4706 to 4734
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4734 to 4736
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4736 to 4808
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4808 to 4810
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4810 to 4862
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4862 to 4864
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4864 to 4912
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 4912 to 4914
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4914 to 4990
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 4990 to 4992
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 4992 to 5016
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5016 to 5018
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5018 to 5118
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5118 to 5120
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5120 to 5122
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5122 to 5224
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5224 to 5226
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5226 to 5246
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5246 to 5248
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5248 to 5328
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5328 to 5330
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5330 to 5374
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5374 to 5376
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5376 to 5432
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5432 to 5434
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5434 to 5502
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5502 to 5504
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5504 to 5536
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5536 to 5538
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5538 to 5630
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5630 to 5632
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5632 to 5640
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5640 to 5642
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5642 to 5744
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5744 to 5746
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5746 to 5758
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5758 to 5760
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5760 to 5848
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5848 to 5850
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5850 to 5886
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 5886 to 5888
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5888 to 5952
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 5952 to 5954
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 5954 to 6014
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6014 to 6016
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6016 to 6056
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6056 to 6058
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6058 to 6142
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6142 to 6144
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6144 to 6160
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6160 to 6162
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6162 to 6264
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6264 to 6266
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6266 to 6270
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6270 to 6272
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6272 to 6368
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6368 to 6370
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6370 to 6398
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6398 to 6400
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6400 to 6472
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6472 to 6474
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6474 to 6526
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6526 to 6528
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6528 to 6576
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6576 to 6578
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6578 to 6654
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6654 to 6656
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6656 to 6680
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6680 to 6682
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6682 to 6782
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6782 to 6784
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6784 to 6786
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6786 to 6888
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6888 to 6890
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6890 to 6910
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 6910 to 6912
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6912 to 6992
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 6992 to 6994
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 6994 to 7038
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7038 to 7040
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7040 to 7096
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7096 to 7098
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7098 to 7166
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7166 to 7168
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7168 to 7200
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7200 to 7202
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7202 to 7294
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7294 to 7296
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7296 to 7304
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7304 to 7306
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7306 to 7408
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7408 to 7410
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7410 to 7422
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7422 to 7424
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7424 to 7512
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7512 to 7514
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7514 to 7550
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7550 to 7552
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7552 to 7616
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7616 to 7618
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7618 to 7678
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7678 to 7680
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7680 to 7720
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7720 to 7722
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7722 to 7806
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7806 to 7808
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7808 to 7824
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7824 to 7826
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7826 to 7928
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 7928 to 7930
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7930 to 7934
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 7934 to 7936
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 7936 to 8032
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8032 to 8034
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8034 to 8062
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8062 to 8064
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8064 to 8136
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8136 to 8138
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8138 to 8190
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8190 to 8192
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8192 to 8240
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8240 to 8242
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8242 to 8318
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8318 to 8320
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8320 to 8344
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8344 to 8346
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8346 to 8446
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8446 to 8448
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8448 to 8450
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8450 to 8552
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8552 to 8554
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8554 to 8574
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8574 to 8576
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8576 to 8656
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8656 to 8658
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8658 to 8702
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8702 to 8704
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8704 to 8760
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8760 to 8762
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8762 to 8830
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8830 to 8832
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8832 to 8864
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8864 to 8866
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8866 to 8958
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 8958 to 8960
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8960 to 8968
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 8968 to 8970
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 8970 to 9072
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9072 to 9074
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9074 to 9086
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9086 to 9088
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9088 to 9176
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9176 to 9178
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9178 to 9214
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9214 to 9216
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9216 to 9280
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9280 to 9282
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9282 to 9342
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9342 to 9344
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9344 to 9384
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9384 to 9386
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9386 to 9470
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9470 to 9472
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9472 to 9488
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9488 to 9490
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9490 to 9592
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9592 to 9594
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9594 to 9598
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9598 to 9600
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9600 to 9696
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9696 to 9698
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9698 to 9726
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9726 to 9728
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9728 to 9800
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9800 to 9802
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9802 to 9854
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9854 to 9856
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9856 to 9904
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 9904 to 9906
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9906 to 9982
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 9982 to 9984
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 9984 to 10008
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10008 to 10010
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10010 to 10110
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10110 to 10112
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10112 to 10114
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10114 to 10216
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10216 to 10218
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10218 to 10238
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10238 to 10240
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10240 to 10320
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10320 to 10322
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10322 to 10366
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10366 to 10368
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10368 to 10424
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10424 to 10426
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10426 to 10494
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10494 to 10496
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10496 to 10528
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10528 to 10530
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10530 to 10622
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10622 to 10624
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10624 to 10632
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10632 to 10634
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10634 to 10736
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10736 to 10738
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10738 to 10750
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10750 to 10752
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10752 to 10840
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10840 to 10842
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10842 to 10878
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 10878 to 10880
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10880 to 10944
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 10944 to 10946
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 10946 to 11006
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11006 to 11008
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11008 to 11048
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11048 to 11050
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11050 to 11134
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11134 to 11136
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11136 to 11152
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11152 to 11154
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11154 to 11256
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11256 to 11258
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11258 to 11262
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11262 to 11264
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11264 to 11360
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11360 to 11362
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11362 to 11390
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11390 to 11392
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11392 to 11464
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11464 to 11466
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11466 to 11518
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11518 to 11520
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11520 to 11568
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11568 to 11570
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11570 to 11646
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11646 to 11648
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11648 to 11672
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11672 to 11674
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11674 to 11774
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11774 to 11776
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11776 to 11778
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11778 to 11880
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11880 to 11882
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11882 to 11902
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 11902 to 11904
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11904 to 11984
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 11984 to 11986
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 11986 to 12030
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12030 to 12032
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12032 to 12088
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12088 to 12090
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12090 to 12158
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12158 to 12160
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12160 to 12192
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12192 to 12194
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12194 to 12286
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12286 to 12288
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12288 to 12296
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12296 to 12298
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12298 to 12400
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12400 to 12402
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12402 to 12414
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12414 to 12416
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12416 to 12504
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12504 to 12506
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12506 to 12542
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12542 to 12544
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12544 to 12608
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12608 to 12610
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12610 to 12670
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12670 to 12672
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12672 to 12712
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12712 to 12714
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12714 to 12798
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12798 to 12800
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12800 to 12816
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12816 to 12818
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12818 to 12920
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 12920 to 12922
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12922 to 12926
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 12926 to 12928
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 12928 to 13024
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13024 to 13026
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13026 to 13054
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13054 to 13056
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13056 to 13128
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13128 to 13130
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13130 to 13182
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13182 to 13184
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13184 to 13232
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13232 to 13234
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13234 to 13310
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13310 to 13312
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13312 to 13336
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13336 to 13338
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13338 to 13438
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13438 to 13440
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13440 to 13442
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13442 to 13544
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13544 to 13546
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13546 to 13566
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13566 to 13568
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13568 to 13648
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13648 to 13650
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13650 to 13694
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13694 to 13696
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13696 to 13752
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13752 to 13754
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13754 to 13822
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13822 to 13824
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13824 to 13856
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13856 to 13858
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13858 to 13950
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 13950 to 13952
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13952 to 13960
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 13960 to 13962
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 13962 to 14064
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14064 to 14066
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14066 to 14078
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14078 to 14080
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14080 to 14168
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14168 to 14170
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14170 to 14206
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14206 to 14208
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14208 to 14272
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14272 to 14274
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14274 to 14334
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14334 to 14336
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14336 to 14376
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14376 to 14378
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14378 to 14462
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14462 to 14464
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14464 to 14480
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14480 to 14482
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14482 to 14584
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14584 to 14586
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14586 to 14590
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14590 to 14592
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14592 to 14688
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14688 to 14690
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14690 to 14718
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14718 to 14720
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14720 to 14792
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14792 to 14794
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14794 to 14846
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14846 to 14848
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14848 to 14896
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 14896 to 14898
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14898 to 14974
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 14974 to 14976
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 14976 to 15000
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15000 to 15002
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15002 to 15102
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15102 to 15104
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15104 to 15106
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15106 to 15208
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15208 to 15210
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15210 to 15230
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15230 to 15232
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15232 to 15312
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15312 to 15314
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15314 to 15358
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15358 to 15360
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15360 to 15416
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15416 to 15418
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15418 to 15486
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15486 to 15488
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15488 to 15520
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15520 to 15522
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15522 to 15614
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15614 to 15616
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15616 to 15624
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15624 to 15626
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15626 to 15728
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15728 to 15730
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15730 to 15742
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15742 to 15744
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15744 to 15832
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15832 to 15834
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15834 to 15870
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15870 to 15872
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15872 to 15936
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 15936 to 15938
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 15938 to 15998
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 15998 to 16000
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16000 to 16040
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16040 to 16042
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16042 to 16126
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16126 to 16128
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16128 to 16144
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16144 to 16146
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16146 to 16248
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16248 to 16250
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16250 to 16254
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16254 to 16256
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16256 to 16352
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16352 to 16354
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16354 to 16382
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16382 to 16384
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16384 to 16456
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16456 to 16458
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16458 to 16510
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16510 to 16512
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16512 to 16560
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16560 to 16562
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16562 to 16638
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16638 to 16640
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16640 to 16664
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16664 to 16666
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16666 to 16766
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16766 to 16768
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16768 to 16770
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16770 to 16872
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16872 to 16874
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16874 to 16894
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 16894 to 16896
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16896 to 16976
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 16976 to 16978
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 16978 to 17022
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17022 to 17024
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17024 to 17080
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17080 to 17082
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17082 to 17150
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17150 to 17152
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17152 to 17184
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17184 to 17186
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17186 to 17278
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17278 to 17280
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17280 to 17288
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17288 to 17290
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17290 to 17392
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17392 to 17394
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17394 to 17406
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17406 to 17408
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17408 to 17496
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17496 to 17498
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17498 to 17534
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17534 to 17536
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17536 to 17600
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17600 to 17602
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17602 to 17662
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17662 to 17664
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17664 to 17704
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17704 to 17706
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17706 to 17790
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17790 to 17792
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17792 to 17808
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17808 to 17810
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17810 to 17912
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 17912 to 17914
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17914 to 17918
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 17918 to 17920
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 17920 to 18016
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18016 to 18018
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18018 to 18046
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18046 to 18048
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18048 to 18120
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18120 to 18122
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18122 to 18174
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18174 to 18176
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18176 to 18224
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18224 to 18226
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18226 to 18302
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18302 to 18304
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18304 to 18328
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18328 to 18330
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18330 to 18430
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18430 to 18432
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18432 to 18434
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18434 to 18536
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18536 to 18538
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18538 to 18558
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18558 to 18560
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18560 to 18640
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18640 to 18642
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18642 to 18686
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18686 to 18688
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18688 to 18744
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18744 to 18746
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18746 to 18814
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18814 to 18816
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18816 to 18848
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18848 to 18850
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18850 to 18942
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 18942 to 18944
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18944 to 18952
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 18952 to 18954
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 18954 to 19056
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19056 to 19058
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19058 to 19070
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19070 to 19072
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19072 to 19160
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19160 to 19162
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19162 to 19198
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19198 to 19200
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19200 to 19264
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19264 to 19266
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19266 to 19326
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19326 to 19328
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19328 to 19368
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19368 to 19370
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19370 to 19454
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19454 to 19456
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19456 to 19472
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19472 to 19474
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19474 to 19576
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19576 to 19578
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19578 to 19582
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19582 to 19584
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19584 to 19680
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19680 to 19682
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19682 to 19710
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19710 to 19712
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19712 to 19784
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19784 to 19786
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19786 to 19838
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19838 to 19840
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19840 to 19888
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19888 to 19890
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19890 to 19966
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 19966 to 19968
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19968 to 19992
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 19992 to 19994
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 19994 to 20094
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20094 to 20096
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20096 to 20098
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20098 to 20200
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20200 to 20202
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20202 to 20222
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20222 to 20224
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20224 to 20304
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20304 to 20306
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20306 to 20350
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20350 to 20352
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20352 to 20408
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20408 to 20410
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20410 to 20478
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20478 to 20480
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20480 to 20512
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20512 to 20514
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20514 to 20606
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20606 to 20608
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20608 to 20616
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20616 to 20618
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20618 to 20720
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20720 to 20722
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20722 to 20734
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20734 to 20736
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20736 to 20824
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20824 to 20826
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20826 to 20862
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20862 to 20864
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20864 to 20928
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 20928 to 20930
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20930 to 20990
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 20990 to 20992
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 20992 to 21032
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21032 to 21034
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21034 to 21118
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21118 to 21120
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21120 to 21136
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21136 to 21138
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21138 to 21240
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21240 to 21242
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21242 to 21246
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21246 to 21248
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21248 to 21344
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21344 to 21346
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21346 to 21374
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21374 to 21376
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21376 to 21448
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21448 to 21450
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21450 to 21502
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21502 to 21504
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21504 to 21552
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21552 to 21554
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21554 to 21630
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21630 to 21632
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21632 to 21656
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21656 to 21658
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21658 to 21758
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21758 to 21760
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21760 to 21762
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21762 to 21864
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21864 to 21866
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21866 to 21886
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 21886 to 21888
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21888 to 21968
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 21968 to 21970
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 21970 to 22014
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22014 to 22016
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22016 to 22072
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22072 to 22074
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22074 to 22142
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22142 to 22144
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22144 to 22176
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22176 to 22178
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22178 to 22270
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22270 to 22272
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22272 to 22280
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22280 to 22282
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22282 to 22384
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22384 to 22386
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22386 to 22398
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22398 to 22400
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22400 to 22488
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22488 to 22490
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22490 to 22526
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22526 to 22528
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22528 to 22592
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22592 to 22594
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22594 to 22654
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22654 to 22656
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22656 to 22696
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22696 to 22698
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22698 to 22782
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22782 to 22784
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22784 to 22800
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22800 to 22802
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22802 to 22904
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 22904 to 22906
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22906 to 22910
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 22910 to 22912
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 22912 to 23008
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23008 to 23010
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23010 to 23038
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23038 to 23040
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23040 to 23112
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23112 to 23114
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23114 to 23166
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23166 to 23168
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23168 to 23216
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23216 to 23218
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23218 to 23294
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23294 to 23296
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23296 to 23320
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23320 to 23322
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23322 to 23422
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23422 to 23424
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23424 to 23426
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23426 to 23528
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23528 to 23530
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23530 to 23550
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23550 to 23552
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23552 to 23632
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23632 to 23634
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23634 to 23678
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23678 to 23680
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23680 to 23736
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23736 to 23738
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23738 to 23806
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23806 to 23808
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23808 to 23840
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23840 to 23842
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23842 to 23934
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 23934 to 23936
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23936 to 23944
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 23944 to 23946
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 23946 to 24048
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24048 to 24050
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24050 to 24062
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24062 to 24064
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24064 to 24152
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24152 to 24154
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24154 to 24190
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24190 to 24192
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24192 to 24256
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24256 to 24258
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24258 to 24318
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24318 to 24320
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24320 to 24360
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24360 to 24362
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24362 to 24446
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24446 to 24448
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24448 to 24464
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24464 to 24466
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24466 to 24568
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24568 to 24570
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24570 to 24574
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24574 to 24576
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24576 to 24672
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24672 to 24674
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24674 to 24702
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24702 to 24704
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24704 to 24776
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24776 to 24778
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24778 to 24830
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24830 to 24832
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24832 to 24880
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24880 to 24882
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24882 to 24958
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 24958 to 24960
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24960 to 24984
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 24984 to 24986
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 24986 to 25086
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25086 to 25088
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25088 to 25090
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25090 to 25192
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25192 to 25194
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25194 to 25214
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25214 to 25216
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25216 to 25296
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25296 to 25298
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25298 to 25342
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25342 to 25344
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25344 to 25400
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25400 to 25402
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25402 to 25470
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25470 to 25472
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25472 to 25504
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25504 to 25506
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25506 to 25598
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25598 to 25600
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25600 to 25608
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25608 to 25610
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25610 to 25712
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25712 to 25714
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25714 to 25726
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25726 to 25728
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25728 to 25816
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25816 to 25818
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25818 to 25854
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25854 to 25856
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25856 to 25920
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 25920 to 25922
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25922 to 25982
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 25982 to 25984
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 25984 to 26024
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26024 to 26026
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26026 to 26110
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26110 to 26112
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26112 to 26128
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26128 to 26130
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26130 to 26232
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26232 to 26234
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26234 to 26238
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26238 to 26240
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26240 to 26336
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26336 to 26338
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26338 to 26366
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26366 to 26368
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26368 to 26440
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26440 to 26442
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26442 to 26494
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26494 to 26496
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26496 to 26544
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26544 to 26546
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26546 to 26622
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26622 to 26624
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26624 to 26648
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26648 to 26650
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26650 to 26750
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26750 to 26752
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26752 to 26754
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26754 to 26856
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26856 to 26858
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26858 to 26878
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 26878 to 26880
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26880 to 26960
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 26960 to 26962
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 26962 to 27006
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27006 to 27008
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27008 to 27064
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27064 to 27066
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27066 to 27134
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27134 to 27136
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27136 to 27168
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27168 to 27170
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27170 to 27262
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27262 to 27264
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27264 to 27272
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27272 to 27274
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27274 to 27376
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27376 to 27378
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27378 to 27390
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27390 to 27392
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27392 to 27480
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27480 to 27482
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27482 to 27518
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27518 to 27520
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27520 to 27584
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27584 to 27586
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27586 to 27646
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27646 to 27648
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27648 to 27688
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27688 to 27690
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27690 to 27774
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27774 to 27776
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27776 to 27792
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27792 to 27794
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27794 to 27896
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 27896 to 27898
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27898 to 27902
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 27902 to 27904
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 27904 to 28000
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28000 to 28002
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28002 to 28030
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28030 to 28032
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28032 to 28104
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28104 to 28106
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28106 to 28158
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28158 to 28160
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28160 to 28208
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28208 to 28210
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28210 to 28286
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28286 to 28288
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28288 to 28312
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28312 to 28314
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28314 to 28414
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28414 to 28416
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28416 to 28418
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28418 to 28520
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28520 to 28522
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28522 to 28542
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28542 to 28544
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28544 to 28624
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28624 to 28626
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28626 to 28670
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28670 to 28672
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28672 to 28728
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28728 to 28730
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28730 to 28798
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28798 to 28800
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28800 to 28832
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28832 to 28834
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28834 to 28926
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 28926 to 28928
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28928 to 28936
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 28936 to 28938
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 28938 to 29040
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29040 to 29042
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29042 to 29054
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29054 to 29056
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29056 to 29144
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29144 to 29146
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29146 to 29182
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29182 to 29184
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29184 to 29248
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29248 to 29250
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29250 to 29310
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29310 to 29312
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29312 to 29352
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29352 to 29354
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29354 to 29438
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29438 to 29440
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29440 to 29456
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29456 to 29458
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29458 to 29560
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29560 to 29562
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29562 to 29566
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29566 to 29568
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29568 to 29664
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29664 to 29666
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29666 to 29694
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29694 to 29696
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29696 to 29768
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29768 to 29770
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29770 to 29822
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29822 to 29824
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29824 to 29872
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29872 to 29874
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29874 to 29950
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 29950 to 29952
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29952 to 29976
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 29976 to 29978
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 29978 to 30078
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30078 to 30080
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30080 to 30082
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30082 to 30184
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30184 to 30186
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30186 to 30206
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30206 to 30208
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30208 to 30288
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30288 to 30290
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30290 to 30334
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30334 to 30336
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30336 to 30392
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30392 to 30394
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30394 to 30462
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30462 to 30464
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30464 to 30496
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30496 to 30498
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30498 to 30590
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30590 to 30592
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30592 to 30600
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30600 to 30602
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30602 to 30704
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30704 to 30706
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30706 to 30718
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30718 to 30720
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30720 to 30808
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30808 to 30810
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30810 to 30846
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30846 to 30848
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30848 to 30912
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 30912 to 30914
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30914 to 30974
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 30974 to 30976
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 30976 to 31016
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31016 to 31018
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31018 to 31102
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31102 to 31104
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31104 to 31120
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31120 to 31122
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31122 to 31224
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31224 to 31226
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31226 to 31230
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31230 to 31232
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31232 to 31328
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31328 to 31330
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31330 to 31358
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31358 to 31360
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31360 to 31432
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31432 to 31434
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31434 to 31486
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31486 to 31488
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31488 to 31536
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31536 to 31538
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31538 to 31614
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31614 to 31616
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31616 to 31640
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31640 to 31642
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31642 to 31742
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31742 to 31744
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31744 to 31746
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31746 to 31848
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31848 to 31850
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31850 to 31870
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31870 to 31872
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31872 to 31952
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 31952 to 31954
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 31954 to 31998
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 31998 to 32000
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32000 to 32056
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32056 to 32058
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32058 to 32126
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32126 to 32128
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32128 to 32160
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32160 to 32162
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32162 to 32254
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32254 to 32256
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32256 to 32264
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32264 to 32266
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32266 to 32368
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32368 to 32370
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32370 to 32382
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32382 to 32384
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32384 to 32472
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32472 to 32474
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32474 to 32510
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32510 to 32512
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32512 to 32576
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32576 to 32578
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32578 to 32638
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32638 to 32640
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32640 to 32680
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32680 to 32682
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32682 to 32766
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32766 to 32768
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32768 to 32784
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32784 to 32786
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32786 to 32888
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32888 to 32890
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32890 to 32894
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 32894 to 32896
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32896 to 32992
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 32992 to 32994
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 32994 to 33022
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33022 to 33024
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33024 to 33096
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33096 to 33098
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33098 to 33150
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33150 to 33152
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33152 to 33200
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33200 to 33202
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33202 to 33278
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33278 to 33280
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33280 to 33304
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33304 to 33306
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33306 to 33406
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33406 to 33408
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33408 to 33410
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33410 to 33512
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33512 to 33514
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33514 to 33534
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33534 to 33536
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33536 to 33616
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33616 to 33618
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33618 to 33662
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33662 to 33664
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33664 to 33720
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33720 to 33722
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33722 to 33790
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33790 to 33792
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33792 to 33824
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33824 to 33826
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33826 to 33918
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 33918 to 33920
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33920 to 33928
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 33928 to 33930
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 33930 to 34032
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34032 to 34034
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34034 to 34046
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34046 to 34048
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34048 to 34136
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34136 to 34138
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34138 to 34174
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34174 to 34176
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34176 to 34240
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34240 to 34242
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34242 to 34302
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34302 to 34304
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34304 to 34344
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34344 to 34346
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34346 to 34430
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34430 to 34432
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34432 to 34448
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34448 to 34450
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34450 to 34552
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34552 to 34554
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34554 to 34558
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34558 to 34560
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34560 to 34656
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34656 to 34658
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34658 to 34686
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34686 to 34688
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34688 to 34760
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34760 to 34762
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34762 to 34814
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34814 to 34816
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34816 to 34864
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34864 to 34866
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34866 to 34942
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 34942 to 34944
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34944 to 34968
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 34968 to 34970
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 34970 to 35070
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35070 to 35072
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35072 to 35074
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35074 to 35176
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35176 to 35178
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35178 to 35198
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35198 to 35200
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35200 to 35280
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35280 to 35282
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35282 to 35326
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35326 to 35328
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35328 to 35384
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35384 to 35386
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35386 to 35454
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35454 to 35456
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35456 to 35488
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35488 to 35490
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35490 to 35582
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35582 to 35584
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35584 to 35592
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35592 to 35594
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35594 to 35696
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35696 to 35698
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35698 to 35710
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35710 to 35712
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35712 to 35800
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35800 to 35802
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35802 to 35838
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35838 to 35840
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35840 to 35904
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 35904 to 35906
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35906 to 35966
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 35966 to 35968
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 35968 to 36008
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36008 to 36010
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36010 to 36094
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36094 to 36096
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36096 to 36112
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36112 to 36114
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36114 to 36216
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36216 to 36218
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36218 to 36222
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36222 to 36224
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36224 to 36320
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36320 to 36322
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36322 to 36350
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36350 to 36352
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36352 to 36424
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36424 to 36426
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36426 to 36478
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36478 to 36480
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36480 to 36528
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36528 to 36530
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36530 to 36606
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36606 to 36608
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36608 to 36632
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36632 to 36634
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36634 to 36734
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36734 to 36736
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36736 to 36738
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36738 to 36840
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36840 to 36842
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36842 to 36862
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36862 to 36864
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36864 to 36944
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 36944 to 36946
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36946 to 36990
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 36990 to 36992
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 36992 to 37048
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37048 to 37050
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37050 to 37118
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37118 to 37120
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37120 to 37152
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37152 to 37154
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37154 to 37246
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37246 to 37248
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37248 to 37256
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37256 to 37258
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37258 to 37360
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37360 to 37362
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37362 to 37374
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37374 to 37376
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37376 to 37464
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37464 to 37466
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37466 to 37502
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37502 to 37504
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37504 to 37568
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37568 to 37570
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37570 to 37630
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37630 to 37632
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37632 to 37672
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37672 to 37674
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37674 to 37758
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37758 to 37760
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37760 to 37776
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37776 to 37778
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37778 to 37880
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37880 to 37882
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37882 to 37886
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 37886 to 37888
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37888 to 37984
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 37984 to 37986
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 37986 to 38014
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38014 to 38016
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38016 to 38088
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38088 to 38090
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38090 to 38142
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38142 to 38144
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38144 to 38192
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38192 to 38194
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38194 to 38270
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38270 to 38272
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38272 to 38296
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38296 to 38298
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38298 to 38398
wait for 100 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38398 to 38400
wait for 2 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38400 to 38402
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38402 to 38504
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38504 to 38506
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38506 to 38526
wait for 20 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38526 to 38528
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38528 to 38608
wait for 80 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38608 to 38610
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38610 to 38654
wait for 44 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38654 to 38656
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38656 to 38712
wait for 56 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38712 to 38714
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38714 to 38782
wait for 68 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38782 to 38784
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38784 to 38816
wait for 32 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38816 to 38818
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38818 to 38910
wait for 92 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 38910 to 38912
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38912 to 38920
wait for 8 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 38920 to 38922
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 38922 to 39024
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39024 to 39026
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39026 to 39038
wait for 12 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39038 to 39040
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39040 to 39128
wait for 88 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39128 to 39130
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39130 to 39166
wait for 36 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39166 to 39168
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39168 to 39232
wait for 64 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39232 to 39234
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39234 to 39294
wait for 60 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39294 to 39296
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39296 to 39336
wait for 40 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39336 to 39338
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39338 to 39422
wait for 84 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39422 to 39424
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39424 to 39440
wait for 16 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39440 to 39442
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39442 to 39544
wait for 102 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39544 to 39546
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39546 to 39550
wait for 4 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39550 to 39552
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39552 to 39648
wait for 96 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39648 to 39650
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39650 to 39678
wait for 28 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39678 to 39680
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39680 to 39752
wait for 72 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39752 to 39754
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39754 to 39806
wait for 52 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39806 to 39808
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39808 to 39856
wait for 48 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39856 to 39858
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39858 to 39934
wait for 76 ns;
HSYNC<='X';
INT<='0';
VSYNC<='1';
--step from 39934 to 39936
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39936 to 39960
wait for 24 ns;
HSYNC<='0';
INT<='1';
VSYNC<='1';
--step from 39960 to 39962
wait for 2 ns;
HSYNC<='0';
INT<='0';
VSYNC<='1';
--step from 39962 to 40000
wait for 38 ns;
wait;
end process;
END;
