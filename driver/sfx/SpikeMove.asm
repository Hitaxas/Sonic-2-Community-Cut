	sHeaderInit						; Z80 offset is $F32F
	sHeaderPrio	$70
	sHeaderCh	$01
	sHeaderSFX	$A1, ctPSG3, .PSG3, $00+$0C, $00

.PSG3
	ssMod68k	$00, $01, $F0, $08
	sNoisePSG	$E7
	dc.b nE5, $07

.Loop1
	dc.b nA5, $01
	saVol		$08
	sLoop		$00, $0C, .Loop1
	sStop
