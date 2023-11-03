    5 MODE 9
   10 VDU 23,228,0,0,16,16,84,56,16,0  : REM DOWN
   20 VDU 23,229,0,0,8,4,62,4,8,0 : REM RIGHT
   25 VDU 23,230,0,0,0,0,0,0,0,0
   30 DIM CNUM%(7)
   40 DIM CUST%(7,7)
   50 X%=0 : Y%=0
   55 VDU5:MOVE 150,950
   60 PRINT"Custom Character Code Generator"
   70 PRINT"             by Nicholas Pratt"
   75 PRINT" "
   80 PRINT"    Cursor keys to move"
   90 PRINT"    Space bar to toggle pixel on/off."
   95 PRINT"           "
   96 MOVE 350,100:PRINT CHR$(230)
  100 FOR I%=1TO9
  110   MOVE 200+(I%*50),200
  120   DRAW 200+(I%*50),600
  130 NEXT
  140 FOR I%=1TO9
  150   MOVE 250,150+(I%*50)
  160   DRAW 650,150+(I%*50)
  170 NEXT
  190 MOVE 270+(X%*50),640 : PRINT CHR$(228)
  200 MOVE 220,590-(Y%*50) : PRINT CHR$(229)
  210 A%=GET
  220 CLG
  230 IF A%=21 AND X%<7 CLS:X%=X%+1
  240 IF A%=8 AND X%>0 CLS:X%=X%-1
  250 IF A%=10 AND Y%<7 CLS:Y%=Y%+1
  260 IF A%=11 AND Y%>0 CLS:Y%=Y%-1
  270 IF A%=32 AND CUST%(X%,Y%)=0 THEN CUST%(X%,Y%)=1 : A%=1
  280 IF A%=32 AND CUST%(X%,Y%)=1 THEN CUST%(X%,Y%)=0 : A%=1
  290 FOR I%=0TO7
  300   CNUM%(I%)=0
  310   FOR J%=0TO7
  320     IF CUST%(J%,I%)=1 THEN MOVE 250+(J%*50),600-(I%*50):PLOT &65,(250+(J%*50))+50,(600-(I%*50))-50
  330     IF CUST%(J%,I%)=1 AND J%=0 THEN CNUM%(I%)=CNUM%(I%)+128
  340     IF CUST%(J%,I%)=1 AND J%=1 THEN CNUM%(I%)=CNUM%(I%)+64
  350     IF CUST%(J%,I%)=1 AND J%=2 THEN CNUM%(I%)=CNUM%(I%)+32
  360     IF CUST%(J%,I%)=1 AND J%=3 THEN CNUM%(I%)=CNUM%(I%)+16
  370     IF CUST%(J%,I%)=1 AND J%=4 THEN CNUM%(I%)=CNUM%(I%)+8
  380     IF CUST%(J%,I%)=1 AND J%=5 THEN CNUM%(I%)=CNUM%(I%)+4
  390     IF CUST%(J%,I%)=1 AND J%=6 THEN CNUM%(I%)=CNUM%(I%)+2
  400     IF CUST%(J%,I%)=1 AND J%=7 THEN CNUM%(I%)=CNUM%(I%)+1
  410   NEXT
  420 NEXT
  430 FOR I%=0TO7
  440   MOVE 620,600-(I%*50) :PRINT CNUM%(I%)
  450 NEXT
  455 VDU 23,230,CNUM%(0),CNUM%(1),CNUM%(2),CNUM%(3),CNUM%(4),CNUM%(5),CNUM%(6),CNUM%(7)
  460 GOTO 55
  470
  480
