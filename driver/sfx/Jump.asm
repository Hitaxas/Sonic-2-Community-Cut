	sHeaderInit						; Z80 offset is $EF33
	sHeaderPrio	$80
	sHeaderCh	$01
	sHeaderSFX	$A1, ctPSG1, .PSG1, $F4+$0C, $00

.PSG1
	sVolEnv		v00
	dc.b nF2, $05
	ssMod68k	$02, $01, $F8, $65
	dc.b nBb2, $15
	sStop
