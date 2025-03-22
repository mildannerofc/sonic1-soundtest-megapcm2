;================================================================
; Constants
;================================================================
Options_menu_box 		equ $FFFFFF6C
Current_Zone 			equ $FFFFFE10
Level_select_flag 		equ $FFFFFFD0
Continue_count			equ $FFFFFE18
VDP_Control_Port 		equ $C00004 
Sound_Test_Sound		equ $FFFFFF84
Some_cheat_value		equ $FFFFFFB4
Player_Select_Flag		equ $FFFFF5EC	;$FFFFFF7C
Two_Player_Items_Mode   equ $FFFFFF7E
;----------------------------------------------------------------
__ = $00
_0 = $10
_A = $1E
_B = $1F
_C = $20
_D = $21
_E = $22    
_F = $23
_G = $24
_H = $25
_I = $26
_J = $27
_K = $28
_L = $29
_M = $2A
_N = $2B
_O = $2C
_P = $2D
_Q = $2E
_R = $2F
_S = $30
_T = $31
_U = $32
_V = $33
_W = $34
_X = $35
_Y = $36
_Z = $37
_st = $1A
;------------------------------------------------------------------
Opt_WaitForVBla:
			jmp WaitForVBla
Options_Pal_FadeFrom:
			jmp PaletteFadeOut
NemDecA:
			jmp NemDec
Opt_EnigmaDec:
			jmp EniDec
JmpTo_ShowVDPGraphics:
			jmp TilemapToVRAM
Opt_ClearScreen:
			jmp ClearScreen
Opt_PalLoad1:
			jmp PalLoad1
Opt_Pal_FadeTo:
			jmp PaletteFadeIn
EniDec_17BC:
			jmp EniDec
j_Dynamic_Normal equ Dynamic_Menu
;------------------------------------------------------------------------------------			
Dynamic_Menu:
                subq.b  #$01, ($FFFFF7B9).w          ; Decrementa em 1 o Tempo
                bpl.s   Exit_Dinamic_Menu            ; Se for maior ou igual a 0 sai da função
                move.b  #$07, ($FFFFF7B9).w          ; Inicializa o tempo de duração de cada frame
                move.b  ($FFFFF7B8).w, D0            ; Carrega o Id do Frame Atual em D0
                addq.b  #$01, ($FFFFF7B8).w          ; Carrega o próximo frame em $FFFFFFB8
                andi.w  #$001F, D0
                move.b  Sonic_Miles_Frame_Select(PC, D0), D0  ; Carrega o Id do frame em D0
;               muls.w  #$0140, D0                   ; Multiplica o Id pelo tamanho em bytes de cada frame                  
                lsl.w   #$06, D0
                lea     ($00C00000), A6
                move.l  #$40200000, $0004(A6)
                lea     (Sonic_Miles), A1
                lea     $00(A1, D0), A1
                move.w  #$0009, D0                   ; Tiles-1 a serem carregados por vez 
Menu_Loop_Load_Tiles:
                move.l  (A1)+, (A6)
                move.l  (A1)+, (A6)     
                move.l  (A1)+, (A6)     
                move.l  (A1)+, (A6)     
                move.l  (A1)+, (A6)     
                move.l  (A1)+, (A6)
                move.l  (A1)+, (A6)
                move.l  (A1)+, (A6)
                dbra    D0, Menu_Loop_Load_Tiles
Exit_Dinamic_Menu:                
                rts              
Sonic_Miles_Frame_Select:     
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $05, $0A
                dc.b    $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
                dc.b    $0A, $05   
		rts
;------------------------------------------------------------------------------------		
MenuScreen:
		move.b	#0,(Options_menu_box).w
		bsr.w	Options_Pal_FadeFrom
		move	#$2700,sr
		move.w	($FFFFF60C).w,d0
        	andi.b  #$BF, D0
		move.w	d0,(VDP_Control_Port).l
		bsr.w	Opt_ClearScreen
		lea	(VDP_Control_Port).l,a6
        move.w  #$8004, (A6)
		move.w  #$8230, (A6)
        move.w  #$8407, (A6)
        move.w  #$8230, (A6)
        move.w  #$8700, (A6)
        move.w  #$8C81, (A6)
        move.w  #$9001, (A6)
		lea	($FFFFAC00).w,a1
		moveq	#0,d0
		move.w	#$FF,d1

Offset_0x008B96:		; Clear Ram of Options Menu
		move.l	d0,(a1)+
		dbf	d1,Offset_0x008B96
		lea	($FFFFB000).w,a1
		moveq	#0,d0
		move.w	#$5FF,d1

loc_8C2A:
		move.l	d0,(a1)+
		dbf	d1,loc_8C2A


		clr.w	($FFFFDC00).w
		move.l	#$FFFFDC00,($FFFFDCFC).w
	
		
		move.l	#$42000000,(VDP_Control_Port).l
		lea	(OptMenu_Font).l,a0
		bsr.w	NemDecA
		move.l	#$4E000000,(VDP_Control_Port).l
		lea	(Menu_Frame).l,a0
		bsr.w	NemDecA
		lea	($FFFF0000).l,a1
		lea	(Versus_Menu_Bg_Mappings).l,a0		; background mappings for options menu

		move.w	#$6000,d0
		bsr.w	Opt_EnigmaDec
		lea	($FFFF0000).l,a1
		move.l	#$60000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		bsr.w	JmpTo_ShowVDPGraphics
		cmpi.b	#$20,(v_gamemode).w					; Options Menu?
		jsr	MenuScreen_Options					; if not branch
sub_8FBE:
	moveq	#0,d1
	move.b	(a1)+,d1

loc_8FC2:
	move.b	(a1)+,d0
	move.w	d0,(a2)+
	dbf	d1,loc_8FC2
	rts
; End of function sub_8FBE
		
MenuScreen_Options:
		lea	($FFFF0000).l,a1
		lea	(Options_Frame_Mappings).l,a0
		move.w	#$70,d0
		bsr.w	EniDec_17BC
		lea	($FFFF0160).l,a1
		lea	(Options_Frame_Mappings).l,a0
		move.w	#$2070,d0
		bsr.w	EniDec_17BC
		clr.b	(Options_menu_box).w
		bsr.w	sub_9186
		addq.b	#1,(Options_menu_box).w
		bsr.w	loc_91F8
		addq.b	#1,(Options_menu_box).w
		bsr.w	loc_91F8
		clr.b	(Options_menu_box).w
		clr.w	($FFFFF710).w
		clr.w	($FFFFF7F0).w
		bsr.w	j_Dynamic_Normal
		moveq	#$14,d0				; options menu palette
		bsr.w	Opt_PalLoad1

;		move.b	#$9A,d0			; Main_Menu_SNd
;		jsr	(PlaySound)			; play it
		clr.w	(Some_cheat_value).w
		clr.w	($FFFFFFD6).w		
		move.b	#$12,($FFFFF62A).w		; original value $16 v blank data
		bsr.w	Opt_WaitForVBla
		
		move.w	($FFFFF60C).w,d0
		ori.b	#$40,d0
		move.w	d0,($C00004).l
		bsr.w	Opt_Pal_FadeTo

loc_9060:
		move.b	#$12,($FFFFF62A).w		; original value $16 v blank data
		bsr.w	Opt_WaitForVBla
		move	#$2700,sr
		bsr.w	loc_91F8
		bsr.w	sub_90E0
		bsr.w	sub_9186
		move	#$2300,sr		
		bsr.w	j_Dynamic_Normal
		move.b	($FFFFF605).w,d0
		andi.b	#$80,d0
;		bne.s	loc_909A			; Menu_Go_Play_Mode
		bra.w	loc_9060		
		
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_909A: ;Menu_Go_Play_Mode
		move.b	(Options_menu_box).w,d0
		bne.s	loc_90B6
		moveq	#0,d0
		move.w	d0,(Current_Zone).w
;		move.b	#$20,(v_gamemode).w
;		move.w	d0,($FFFFFE20).w ; clear rings
;		move.l	d0,($FFFFFE22).w ; clear time
;		move.l	d0,($FFFFFE26).w ; clear score		
;		move.b	#3,($FFFFFE12).w ; set lives to	3
;		move.b  #$00,(Current_Character).w	; is player Sonic?
;		beq.w	@optionar					; if not branch
;		moveq	#$FFFFFF8C,d0	; play woo-hoo voice when player selects Sonic
;		jsr	PlaySample			
;@optionar
;		moveq	#$FFFFFF9A,d0
;		jsr	PlaySample
;		move.b 	#$04, (Current_Character).w ; is Tails?
;		beq.w	@optionar2					; if not branch
;@optionar2
;		moveq	#$FFFFFF9B,d0
;		jsr	PlaySample
;		move.b  #$08, (Current_Character).w	; Is Knuckles?
;		beq.w   @optionar3					; if not branch
;@optionar3
;		moveq	#$FFFFFF9F,d0
;		jsr	PlaySample
;		move.b  #$0C, (Current_Character).w ; is Mighty?
;		beq.w	@optionar4					; if not branch
@optionar4
;		move.b	#$00,(Current_Character).w
;		moveq	#$FFFFFF8C,d0	; play woo-hoo voice when player selects Sonic
;		jsr	PlaySample			
		rts
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_90B6: ; Menu Go versus mode
		subq.b	#1,d0
		bne.s	loc_90D8
		moveq	#1,d0
		move.b	#$20,(v_gamemode).w		; Tutorial Zone
;		move.b	#7,(v_zone).w
;		clr.b	(v_act).w
;		move.b	#$00,(Current_Character).w	
		rts	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_90D8:
		move.b	#$20,(v_gamemode).w		; Go back to Title Screen
		rts	

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ S U B	R O U T	I N E ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ


sub_90E0:
		moveq	#0,d2
		move.b	(Options_menu_box).w,d2
		move.b	($FFFFF605).w,d0
		btst	#0,d0
		beq.s	loc_90FC
		subq.b	#1,d2
		bcc.s	loc_90FC
		move.b	#2,d2

loc_90FC:
		btst	#1,d0
		beq.s	loc_910C
		addq.b	#1,d2
		cmpi.b	#3,d2
		bcs.s	loc_910C
		moveq	#0,d2

loc_910C:
		move.b	d2,(Options_menu_box).w
		lsl.w	#2,d2
		move.b	Menu_Options_Boundaries(pc,d2.w),d3
		movea.l	Menu_Options_Boundaries(pc,d2.w),a1
		move.w	(a1),d2
		btst	#2,d0
		beq.s	loc_9128
		subq.b	#1,d2
		bcc.s	loc_9128
		move.b	d3,d2

loc_9128:
		btst	#3,d0
		beq.s	loc_9136
		addq.b	#1,d2
		cmp.b	d3,d2
		bls.s	loc_9136
		moveq	#0,d2

loc_9136:
		btst	#6,d0
		beq.s	loc_9146
		addi.b	#$10,d2
		cmp.b	d3,d2
		bls.s	loc_9146
		moveq	#0,d2

loc_9146:
		move.w	d2,(a1)
		cmpi.b	#2,(Options_menu_box).w
		bne.s	locret_9178
		andi.w	#$30,d0
		beq.s	locret_9178
		move.w	($FFFFFF84).w,d0
;		addi.w	#$00,d0			; sound test starting value old value was $80
		jsr		(PlaySound)
		lea	(level_select_cheat).l,a0
		lea	(byte_97B7).l,a2
		lea	(Level_select_flag).w,a1
		moveq	#0,d2
		bsr.w	loc_9746

locret_9178:
		rts	
; End of function sub_90E0

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Menu_Options_Boundaries: ; Offset_0x00910C:
                dc.l    ($00<<$18)|(Player_Select_Flag&$00FFFFFF)    ; Jogador selecionado  Current_Character Flag
                dc.l    ($00<<$18)|(Two_Player_Items_Mode&$00FFFFFF) ; Opções do modo 2 Player
                dc.l    ($FF<<$18)|(Sound_Test_Sound&$00FFFFFF)      ; Intervalo do Sound Test    

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ S U B	R O U T	I N E ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

sub_9186:
		bsr.w	loc_9268
		moveq	#0,d1
		move.b	(Options_menu_box).w,d1
		lsl.w	#3,d1
		lea	(off_92BA).l,a3
		lea	(a3,d1.w),a3
		move.w	#$6000,d0		; palette line for the highlighted text
		lea	($FFFF0030).l,a2
		movea.l	(a3)+,a1
		bsr.w	sub_8FBE
		lea	($FFFF00B6).l,a2
		moveq	#0,d1
		cmpi.b	#2,(Options_menu_box).w
		beq.s	loc_91CE
		move.b	(Options_menu_box).w,d1
		lsl.w	#2,d1
		lea	(Menu_Options_Boundaries,pc),a1
		movea.l	(a1,d1.w),a1
		move.w	(a1),d1
		lsl.w	#2,d1

loc_91CE:
		movea.l	(a4,d1.w),a1
		bsr.w	sub_8FBE
		cmpi.b	#2,(Options_menu_box).w
		bne.s	loc_91E8
		lea	($FFFF00C2).l,a2
		bsr.w	loc_9296

loc_91E8:
		lea	($FFFF0000).l,a1
		move.l	(a3)+,d0
		moveq	#$15,d1
		moveq	#7,d2
		bra.w	JmpTo_ShowVDPGraphics
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_91F8:	; Offset_0x00918C
		bsr.w	loc_9268
		moveq	#0,d1
		move.b	(Options_menu_box).w,d1
		lsl.w	#3,d1
		lea	(off_92BA).l,a3		; Menu_Options_Idx
		lea	(a3,d1.w),a3
		moveq	#0,d0
		lea	($FFFF0190).l,a2
		movea.l	(a3)+,a1
		bsr.w	sub_8FBE
		lea	($FFFF0216).l,a2
		moveq	#0,d1
		cmpi.b	#2,(Options_menu_box).w
		beq.s	loc_923E
		move.b	(Options_menu_box).w,d1
		lsl.w	#2,d1
		lea	(Menu_Options_Boundaries,pc),a1
		movea.l	(a1,d1.w),a1
		move.w	(a1),d1
		lsl.w	#2,d1

loc_923E:
		movea.l	(a4,d1.w),a1
		bsr.w	sub_8FBE
		cmpi.b	#2,(Options_menu_box).w
		bne.s	loc_9258
		lea	($FFFF0222).l,a2
		bsr.w	loc_9296

loc_9258:
		lea	($FFFF0160).l,a1
		move.l	(a3)+,d0
		moveq	#$15,d1
		moveq	#7,d2
		bra.w	JmpTo_ShowVDPGraphics
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_9268:
		lea	(SelectSonic).l,a4

loc_927A:
		tst.b	(Options_menu_box).w
		beq.s	loc_9286
		lea	(off_92EA).l,a4

loc_9286:
		cmpi.b	#2,(Options_menu_box).w
		bne.s	locret_9294
		lea	(off_92F2).l,a4

locret_9294:
		rts	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_9296:
		move.w	($FFFFFF84).w,d1
		move.b	d1,d2
		lsr.b	#4,d1
		bsr.s	loc_92A2
		move.b	d2,d1

loc_92A2:
		andi.w	#$F,d1
		cmpi.b	#$A,d1
		bcs.s	loc_92B0
		addi.b	#4,d1

loc_92B0:
		addi.b	#$10,d1
		move.b	d1,d0
		move.w	d0,(a2)+
		rts	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
off_92BA:	dc.l byte_97CA	;Menu_Options_Idx
		dc.w $4192
		dc.w 3
		dc.l byte_982C
		dc.w $4592
		dc.w 3
		dc.l byte_985E
		dc.w $4992
		dc.w 3
SelectSonic:	dc.l byte_97DC	;Sonic
;		dc.l byte_97EC	; Tails
;		dc.l byte_97FC	; Knuckles
;		dc.l byte_980C	; Mighty
;		dc.l byte_981C	; Ray
off_92EA:	dc.l byte_983E
;		dc.l byte_984E
off_92F2:	dc.l byte_9870

loc_9746:
		move.w	(Some_cheat_value).w,d0
		adda.w	d0,a0
		move.w	($FFFFFF84).w,d0
		cmp.b	(a0),d0
		bne.s	loc_976A
		addq.w	#1,(Some_cheat_value).w
		tst.b	1(a0)
		bne.s	loc_9770
		move.w	#$101,(a1)
		move.b	#$B5,d0		; play Ring sfx on correct entry $B5
		jsr	(PlaySound_Special)		; play it!

loc_976A:
		move.w	#0,(Some_cheat_value).w

loc_9770:
		move.w	($FFFFFFD6).w,d0
		adda.w	d0,a2
		move.w	($FFFFFF84).w,d0
		cmp.b	(a2),d0
		bne.s	loc_97AA
		addq.w	#1,($FFFFFFD6).w
		tst.b	1(a2)
		bne.s	locret_97B0
		tst.w	d2
		bne.s	loc_979C
		move.b	#$F,(Continue_count).w
		move.b	#$BF,d0		; extra continue sfx
		jsr	(PlaySound_Special)	; play sound
		bra.s	loc_97AA
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_979C:
		move.w	#7,($FFFFFFB0).w
		move.b	#$93,d0			; Emerald SFX
		jsr	(PlaySound)			; Play it

loc_97AA:
		move.w	#0,($FFFFFFD6).w

locret_97B0:
		rts	
;-------------------------------------------------------------------------------  		
level_select_cheat:
                dc.b    $19, $65, $09, $17, $00, $00
;-------------------------------------------------------------------------------  				
byte_97B7:	
                dc.b    $01, $01, $02, $04, $00, $00
;-------------------------------------------------------------------------------  				
debug_cheat:	
                dc.b    $01, $09, $09, $02, $01, $01, $02, $04, $00, $00
;-------------------------------------------------------------------------------  				
byte_97C5:	
				dc.b    $04, $01, $02, $06, $00, $00		
;-------------------------------------------------------------------------------  
byte_97CA: ; Offset_0x009778:
                dc.b    $10
                dc.b    _st,__,_P,_L,_A,_Y,_E,_R,__,_S,_E,_L,_E,_C,_T,__,_st                   
byte_97DC: ; Offset_0x00978A: 
                dc.b    $0E
                dc.b    __,__,__,__,_S,_O,_N,_I,_C,__,__,__,__,__,__ 
byte_97EC: ; Offset_0x00979A: 
                dc.b    $0E
                dc.b    __,__,__,__,_T,_A,_I,_L,_S,__,__,__,__,__,__
byte_97FC: ; Offset_0x0097AA:
                dc.b    $0E
                dc.b    __,__,__,_K,_N,_U,_C,_K,_L,_E,_S,__,__,__,__
byte_980C: ; Offset_0x0097BA:
                dc.b    $0E
                dc.b    __,__,__,__,_M,_I,_G,_H,_T,_Y,__,__,__,__,__
byte_981C: ; Offset_0x0097CA:
                dc.b    $0E
                dc.b    __,__,__,__,__,_R,_A,_Y,__,__,__,__,__,__,__
;-------------------------------------------------------------------------------     
byte_982C: ; Offset_0x0097DA:
                dc.b    $10
                dc.b    _st,__,_T,_U,_T,_O,_R,_I,_A,_L,__,_Z,_O,_N,_E,__,_st  
byte_983E: ; Offset_0x0097EC:  
                dc.b    $0E
                dc.b    __,__,_P,_R,_E,_S,_S,__,_S,_T,_A,_R,_T,__,__
byte_984E: ; Offset_0x0097FC:
                dc.b    $0E
                dc.b    _T,_E,_L,_E,_P,_O,_R,_T,__,_O,_N,_L,_Y,__,__
;-------------------------------------------------------------------------------   
byte_985E: ; Offset_0x00980C:
                dc.b    $10
                dc.b    _st,__,__,_S,_O,_U,_N,_D,__,_T,_E,_S,_T,__,__,__,_st
		even
byte_9870: ; Offset_0x00981E:   
                dc.b    $0E
                dc.b    __,__,__,__,__,__,_0,_0,__,__,__,__,__,__,__   
		even 
;-------------------------------------------------------------------------------  		            				
;------------------------------------------------------------------------------- 
;Vs_Level_Select_Frame_Mappings: ; Offset_0x009A0E:
;                incbin  'data\menu\vsslctmn.eni' 
;-------------------------------------------------------------------------------   
Options_Frame_Mappings: ; Offset_0x009A60:
                incbin  'data\menu\optframe.eni' 
;-------------------------------------------------------------------------------                             
Menu_Icons_Mappings: ; Offset_0x009BE0: 
                incbin  'data\menu\iconsmap.eni'  
   
OptMenu_Font:     incbin  'data\menu\menufont.nem'                                 ; Offset_0x07C43A:
OptMenu_Font_end:    even             
				
Menu_Frame:                                                   ; Offset_0x07D990:
                incbin  'data\menu\menu_frm.nem'  
		even
		
Versus_Menu_Bg_Mappings:                                      ; Offset_0x07CB80:
                incbin  'data\menu\vsmenubg.eni' 			
Sonic_Miles:                                                  ; Offset_0x07CD2C: 
                incbin  'data\menu\soncmils.dat'			
				
Pal_Options:
                incbin  'data\menu\menu.pal' 

				
;===============================================================================
; Menu de opções, menu de seleção de fases no modo 1 e 2 jogadores 
; [ Término ]
;=============================================================================== 