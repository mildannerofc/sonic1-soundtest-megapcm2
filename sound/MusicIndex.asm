; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------
; Music	Pointers
; ---------------------------------------------------------------------------

; slots 01 - 7F
MusicIndex00:
		dc.l Music01, Music02
		dc.l Music03, Music04
		dc.l Music05, Music06
		dc.l Music07, Music08
		dc.l Music09, Music0A
		dc.l Music0B, Music0C		
		dc.l Music0D, Music0E
		dc.l Music0F, Music10
		dc.l Music11, Music12
		dc.l Music13, Music14
		dc.l Music15, Music16
		dc.l Music17, Music18
		dc.l Music19, Music1A
		dc.l Music1B, Music1C
		dc.l Music1D, Music1E
		dc.l Music1F	
		dc.l Music20, Music21
		dc.l Music22, Music23
		dc.l Music24, Music25
		dc.l Music26, Music27
		dc.l Music28, Music29
		dc.l Music2A, Music2B
		dc.l Music2C, Music2D
		dc.l Music2E, Music2F
		dc.l Music30, Music31
		dc.l Music32, Music33
		dc.l Music34, Music35
		dc.l Music36, Music37
		dc.l Music38, Music39
		dc.l Music3A, Music3B
		dc.l Music3C, Music3D
		dc.l Music3E, Music3F
		dc.l Music40, Music41
		dc.l Music42, Music43
		dc.l Music44, Music45
		dc.l Music46, Music47
		dc.l Music48, Music49
		dc.l Music4A
		dc.l Music4B, Music4C
		dc.l Music4D, Music4E
		dc.l Music4F, Music50
		dc.l Music51, Music52
		dc.l Music53, Music54
		dc.l Music55, Music56
		dc.l Music57, Music58
		dc.l Music59, Music5A
		dc.l Music5B, Music5C
		dc.l Music5D, Music5E
		dc.l Music5F, Music60
		dc.l Music61, Music62
		dc.l Music63, Music64
		dc.l Music65, Music66
		dc.l Music67, Music68
		dc.l Music69, Music6A
		dc.l Music6B, Music6C
		dc.l Music6D, Music6E
		dc.l Music6F, Music70		
		dc.l Music71, Music72
		dc.l Music73, Music74
		dc.l Music75, Music76
		dc.l Music77, Music78
		dc.l Music79, Music7A
		dc.l Music7B, Music7C
		dc.l Music7D, Music7E
		dc.l Music7F; Music80 doesn't exist
; slots 81 - 9F	
MusicIndex:	
ptr_mus81:	dc.l Music81
ptr_mus82:	dc.l Music82
ptr_mus83:	dc.l Music83
ptr_mus84:	dc.l Music84
ptr_mus85:	dc.l Music85
ptr_mus86:	dc.l Music86
ptr_mus87:	dc.l Music87
ptr_mus88:	dc.l Music88
ptr_mus89:	dc.l Music89
ptr_mus8A:	dc.l Music8A
ptr_mus8B:	dc.l Music8B
ptr_mus8C:	dc.l Music8C
ptr_mus8D:	dc.l Music8D
ptr_mus8E:	dc.l Music8E
ptr_mus8F:	dc.l Music8F
ptr_mus90:	dc.l Music90
ptr_mus91:	dc.l Music91
ptr_mus92:	dc.l Music92
ptr_mus93:	dc.l Music93
ptr_mus94:	dc.l Music94
ptr_mus95:	dc.l Music95
ptr_mus96:	dc.l Music96
ptr_mus97:	dc.l Music97
ptr_mus98:	dc.l Music98
ptr_mus99:	dc.l Music99
ptr_mus9A:	dc.l Music9A
ptr_mus9B:	dc.l Music9B
ptr_mus9C:	dc.l Music9C
ptr_mus9D:	dc.l Music9D
ptr_mus9E:	dc.l Music9E
ptr_mus9F:	dc.l Music9F
; slots E5 - FF	
MusicIndexFF:		
		dc.l MusicE5, MusicE6
		dc.l MusicE7, MusicE8
		dc.l MusicE9, MusicEA
		dc.l MusicEB, MusicEC
		dc.l MusicED, MusicEE
		dc.l MusicEF, MusicF0
		dc.l MusicF1, MusicF2
		dc.l MusicF3, MusicF4
		dc.l MusicF5, MusicF6		
		dc.l MusicF7, MusicF8
		dc.l MusicF9, MusicFA
		dc.l MusicFB, MusicFC
		dc.l MusicFD, MusicFE	
		dc.l MusicFF
		
Music01:	incbin	sound\_shortmusic\silence.bin
		even
Music02:	incbin	sound\_shortmusic\alldrum4.bin
		even
Music03:	incbin	sound\_shortmusic\silence.bin
		even
Music04:	incbin	sound\_shortmusic\silence.bin
		even
Music05:	incbin	sound\_shortmusic\silence.bin
		even
Music06:	incbin	sound\_shortmusic\silence.bin
		even
Music07:	incbin	sound\_shortmusic\silence.bin
		even
Music08:	incbin	sound\_shortmusic\silence.bin
		even
Music09:	incbin	sound\_shortmusic\silence.bin
		even
Music0A:	incbin	sound\_shortmusic\silence.bin
		even
Music0B:	incbin	sound\_shortmusic\silence.bin
		even
Music0C:	incbin	sound\_shortmusic\silence.bin
		even
Music0D:	incbin	sound\_shortmusic\silence.bin
		even
Music0E:	incbin	sound\_shortmusic\silence.bin
		even
Music0F:	incbin	sound\_shortmusic\silence.bin
		even
Music10:	incbin	sound\_shortmusic\silence.bin
		even
Music11:	incbin	sound\_shortmusic\silence.bin
		even
Music12:	incbin	sound\_shortmusic\silence.bin
		even
Music13:	incbin	sound\_shortmusic\silence.bin
		even
Music14:	incbin	sound\_shortmusic\silence.bin
		even
Music15:	incbin	sound\_shortmusic\silence.bin
		even
Music16:	incbin	sound\_shortmusic\silence.bin
		even
Music17:	incbin	sound\_shortmusic\silence.bin
		even
Music18:	incbin	sound\_shortmusic\silence.bin
		even
Music19:	incbin	sound\_shortmusic\silence.bin
		even
Music1A:	incbin	sound\_shortmusic\silence.bin
		even
Music1B:	incbin	sound\_shortmusic\silence.bin
		even
Music1C:	incbin	sound\_shortmusic\silence.bin
		even
Music1D:	incbin	sound\_shortmusic\silence.bin
		even
Music1E:	incbin	sound\_shortmusic\silence.bin
		even
Music1F:	incbin	sound\_shortmusic\silence.bin
		even
Music20:	incbin	sound\_shortmusic\silence.bin
		even
Music21:	incbin	sound\_shortmusic\silence.bin
		even
Music22:	incbin	sound\_shortmusic\silence.bin
		even
Music23:	incbin	sound\_shortmusic\silence.bin
		even
Music24:	incbin	sound\_shortmusic\silence.bin
		even
Music25:	incbin	sound\_shortmusic\silence.bin
		even
Music26:	incbin	sound\_shortmusic\silence.bin
		even
Music27:	incbin	sound\_shortmusic\silence.bin
		even
Music28:	incbin	sound\_shortmusic\silence.bin
		even
Music29:	incbin	sound\_shortmusic\silence.bin
		even
Music2A:	incbin	sound\_shortmusic\silence.bin
		even
Music2B:	incbin	sound\_shortmusic\silence.bin
		even
Music2C:	incbin	sound\_shortmusic\silence.bin
		even
Music2D:	incbin	sound\_shortmusic\silence.bin
		even
Music2E:	incbin	sound\_shortmusic\silence.bin
		even
Music2F:	incbin	sound\_shortmusic\silence.bin
		even
Music30:	incbin	sound\_shortmusic\silence.bin
		even
Music31:	incbin	sound\_shortmusic\silence.bin
		even
Music32:	incbin	sound\_shortmusic\silence.bin
		even
Music33:	incbin	sound\_shortmusic\silence.bin
		even
Music34:	incbin	sound\_shortmusic\silence.bin
		even
Music35:	incbin	sound\_shortmusic\silence.bin
		even
Music36:	incbin	sound\_shortmusic\silence.bin
		even
Music37:	incbin	sound\_shortmusic\silence.bin
		even
Music38:	incbin	sound\_shortmusic\silence.bin
		even
Music39:	incbin	sound\_shortmusic\silence.bin
		even
Music3A:	incbin	sound\_shortmusic\silence.bin
		even
Music3B:	incbin	sound\_shortmusic\silence.bin
		even
Music3C:	incbin	sound\_shortmusic\silence.bin
		even
Music3D:	incbin	sound\_shortmusic\silence.bin
		even
Music3E:	incbin	sound\_shortmusic\silence.bin
		even
Music3F:	incbin	sound\_shortmusic\silence.bin
		even
Music40:	incbin	sound\_shortmusic\silence.bin
		even
Music41:	incbin	sound\_shortmusic\silence.bin
		even
Music42:	incbin	sound\_shortmusic\silence.bin
		even
Music43:	incbin	sound\_shortmusic\silence.bin
		even
Music44:	incbin	sound\_shortmusic\silence.bin
		even
Music45:	incbin	sound\_shortmusic\silence.bin
		even
Music46:	incbin	sound\_shortmusic\silence.bin
		even
Music47:	incbin	sound\_shortmusic\silence.bin
		even
Music48:	incbin	sound\_shortmusic\silence.bin
		even
Music49:	incbin	sound\_shortmusic\silence.bin
		even
Music4A		incbin	sound\_shortmusic\silence.bin
		even
Music4B:	incbin	sound\_shortmusic\silence.bin
		even
Music4C:	incbin	sound\_shortmusic\silence.bin
		even
Music4D:	incbin	sound\_shortmusic\silence.bin
		even
Music4E:	incbin	sound\_shortmusic\silence.bin
		even
Music4F:	incbin	sound\_shortmusic\silence.bin
		even
Music50:	incbin	sound\_shortmusic\silence.bin
		even
Music51:	incbin	sound\_shortmusic\silence.bin
		even
Music52:	incbin	sound\_shortmusic\silence.bin
		even
Music53:	incbin	sound\_shortmusic\silence.bin
		even	
Music54:	incbin	sound\_shortmusic\silence.bin
		even
Music55		incbin  sound\_shortmusic\silence.bin
		even
Music56:	incbin	sound\_shortmusic\silence.bin
		even
Music57:	incbin	sound\_shortmusic\silence.bin
		even
Music58:	incbin	sound\_shortmusic\silence.bin
		even
Music59:	incbin	sound\_shortmusic\silence.bin
		even
Music5A:	incbin	sound\_shortmusic\silence.bin
		even
Music5B:	incbin	sound\_shortmusic\silence.bin
		even
Music5C:	incbin	sound\_shortmusic\silence.bin
		even
Music5D:	incbin	sound\_shortmusic\silence.bin
		even
Music5E:	incbin	sound\_shortmusic\silence.bin
		even
Music5F:	incbin	sound\_shortmusic\silence.bin
		even
Music60:	incbin	sound\_shortmusic\silence.bin
		even
Music61:	incbin	sound\_shortmusic\silence.bin
		even
Music62:	incbin	sound\_shortmusic\silence.bin
		even
Music63:	incbin	sound\_shortmusic\silence.bin
		even
Music64:	incbin	sound\_shortmusic\silence.bin
		even
Music65:	incbin	sound\_shortmusic\silence.bin
		even
Music66:	incbin	sound\_shortmusic\silence.bin
		even
Music67:	incbin	sound\_shortmusic\silence.bin
		even
Music68:	incbin	sound\_shortmusic\silence.bin
		even
Music69:	incbin	sound\_shortmusic\silence.bin
		even
Music6A:	incbin	sound\_shortmusic\silence.bin
		even
Music6B:	incbin	sound\_shortmusic\silence.bin
		even
Music6C:	incbin	sound\_shortmusic\silence.bin
		even
Music6D:	incbin	sound\_shortmusic\silence.bin
		even
Music6E:	incbin	sound\_shortmusic\silence.bin
		even
Music6F:	incbin	sound\_shortmusic\silence.bin
		even
Music70:	incbin	sound\_shortmusic\silence.bin
		even
Music71:	incbin	sound\_shortmusic\silence.bin
		even
Music72:	incbin	sound\_shortmusic\silence.bin
		even
Music73:	incbin	sound\_shortmusic\silence.bin
		even
Music74:	incbin	sound\_shortmusic\silence.bin
		even
Music75:	incbin	sound\_shortmusic\silence.bin
		even
Music76:	incbin	sound\_shortmusic\silence.bin
		even
Music77:	incbin	sound\_shortmusic\silence.bin
		even
Music78:	incbin	sound\_shortmusic\silence.bin
		even
Music79:	incbin	sound\_shortmusic\silence.bin
		even
Music7A:	incbin	sound\_shortmusic\silence.bin
		even
Music7B:	incbin	sound\_shortmusic\silence.bin
		even
Music7C:	incbin	sound\_shortmusic\silence.bin
		even
Music7D:	incbin	sound\_shortmusic\silence.bin
		even
Music7E:	incbin	sound\_shortmusic\silence.bin
		even
Music7F:	incbin	sound\_shortmusic\silence.bin
		even

Music81:	incbin	sound\_shortmusic\silence.bin
		even
Music82:	incbin	sound\_shortmusic\silence.bin
		even
Music83:	incbin	sound\_shortmusic\silence.bin
		even
Music84:	incbin	sound\_shortmusic\silence.bin
		even
Music85:	incbin	sound\_shortmusic\silence.bin
		even
Music86:	incbin	sound\_shortmusic\silence.bin
		even
Music87:	incbin	sound\_shortmusic\silence.bin
		even
Music88:	incbin	sound\_shortmusic\silence.bin
		even
Music89:	incbin	sound\_shortmusic\silence.bin
		even
Music8A:	incbin	sound\_shortmusic\silence.bin
		even
Music8B:	incbin	sound\_shortmusic\silence.bin
		even
Music8C:	incbin	sound\_shortmusic\silence.bin
		even
Music8D:	incbin	sound\_shortmusic\silence.bin
		even
Music8E:	incbin	sound\_shortmusic\silence.bin
		even
Music8F:	incbin	sound\_shortmusic\silence.bin
		even
Music90:	incbin	sound\_shortmusic\silence.bin
		even
Music91:	incbin	sound\_shortmusic\silence.bin
		even
Music92:	incbin	sound\_shortmusic\silence.bin
		even
Music93:	incbin	sound\_shortmusic\silence.bin
		even
Music94:	incbin	sound\_shortmusic\silence.bin
		even
Music95:	incbin	sound\_shortmusic\silence.bin
		even
Music96:	incbin	sound\_shortmusic\silence.bin
		even
Music97:	incbin	sound\_shortmusic\silence.bin
		even
Music98:	incbin	sound\_shortmusic\silence.bin
		even
Music99:	incbin	sound\_shortmusic\silence.bin
		even
Music9A:	incbin	sound\_shortmusic\silence.bin
		even
Music9B:	incbin	sound\_shortmusic\silence.bin
		even
Music9C:	incbin	sound\_shortmusic\silence.bin
		even
Music9D:	incbin	sound\_shortmusic\silence.bin
		even
Music9E:	incbin	sound\_shortmusic\silence.bin
		even
Music9F:	incbin	sound\_shortmusic\silence.bin
		even
; slots E5 - FF		
MusicE5:	incbin	sound\_shortmusic\silence.bin
		even
MusicE6:	incbin	sound\_shortmusic\silence.bin
		even
MusicE7:	incbin	sound\_shortmusic\silence.bin
		even
MusicE8:	incbin	sound\_shortmusic\silence.bin
		even
MusicE9:	incbin	sound\_shortmusic\silence.bin
		even
MusicEA:	incbin	sound\_shortmusic\silence.bin
		even
MusicEB:	incbin	sound\_shortmusic\silence.bin
		even
MusicEC:	incbin	sound\_shortmusic\silence.bin
		even
MusicED:	incbin	sound\_shortmusic\silence.bin
		even
MusicEE:	incbin	sound\_shortmusic\silence.bin
		even
MusicEF:	incbin	sound\_shortmusic\silence.bin
		even
MusicF0:	incbin	sound\_shortmusic\silence.bin
		even
MusicF1:	incbin	sound\_shortmusic\silence.bin
		even
MusicF2:	incbin	sound\_shortmusic\silence.bin
		even
MusicF3:	incbin	sound\_shortmusic\silence.bin
		even
MusicF4:	incbin	sound\_shortmusic\silence.bin
		even
MusicF5:	incbin	sound\_shortmusic\silence.bin
		even
MusicF6:	incbin	sound\_shortmusic\silence.bin
		even
MusicF7:	incbin	sound\_shortmusic\silence.bin
		even
MusicF8:	incbin	sound\_shortmusic\silence.bin
		even
MusicF9:	incbin	sound\_shortmusic\silence.bin
		even
MusicFA:	incbin	sound\_shortmusic\silence.bin
		even
MusicFB:	incbin	sound\_shortmusic\silence.bin
		even
MusicFC:	incbin	sound\_shortmusic\silence.bin
		even
MusicFD:	incbin	sound\_shortmusic\silence.bin
		even
MusicFE:	incbin	sound\_shortmusic\silence.bin
		even
MusicFF:	incbin	sound\_shortmusic\silence.bin
		even		