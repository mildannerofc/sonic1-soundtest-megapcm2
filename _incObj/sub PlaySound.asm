; ---------------------------------------------------------------------------
; Subroutine to	play a music track

; input:
;	d0 = track to play
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


PlaySound:
		cmpi.b  #$7F,d0
		ble.s   ChkSounds00to7F
		jmp	 NormalSoundRequest
ChkSounds00to7F:
		cmpi.b  #$01,d0
		bge.s   LoadSlots00to7F
		jmp	 NormalSoundRequest
LoadSlots00to7F:
		add.b   #$80,d0; Add $80 to get slot to starts at $81			
		move.b  #$01,($FFFFFFFC).w; Move $01 to $FFFFFC to make sound driver to load the secound index
NormalSoundRequest:
		move.b	d0,($FFFFF00A).w		
		rts	
; End of function PlaySound

; ---------------------------------------------------------------------------
; Subroutine to	play a sound effect
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


PlaySound_Special:
		move.b	d0,(v_playsnd2).w
		ble.s   ChkSounds00to7F_Special
		jmp	 NormalSoundRequest_Special
ChkSounds00to7F_Special:

		cmpi.b  #$01,d0
		bge.s   LoadSlots00to7F_Special
		jmp	 NormalSoundRequest_Special
LoadSlots00to7F_Special:
		add.b   #$80,d0; Add $80 to get slot to starts at $81			
		move.b  #$01,($FFFFFFFC).w; Move $01 to $FFFFFC to make the sound driver to load the secound index
NormalSoundRequest_Special:
		move.b	d0,($FFFFF00B).w		
		rts	
; End of function PlaySound_Special

; ===========================================================================
; ---------------------------------------------------------------------------
; Unused sound/music subroutine
; ---------------------------------------------------------------------------

PlaySound_Unused:
		move.b	d0,(v_playnull).w
		rts	