	sHeaderInitSFX						; Z80 offset is $F7AF
	sHeaderPrio	$70
	sHeaderCh	$02
	sHeaderSFX	$80, ctFM5, .FM5, $00, $00
	sHeaderSFX	$A1, ctPSG3, .PSG3, $00+$0C, $00

.FM5
	sVoice		pBossHit
	ssMod68k	$02, $01, $20, $04

.Loop1
	dc.b nC0, $18
	saVol		$0A
	sLoop		$00, $06, .Loop1
	sStop

.PSG3
	ssMod68k	$00, $01, $0F, $05
	sNoisePSG	$E7

.Loop2
	dc.b nB3, $18, sHold
	saVol		$18
	sLoop		$00, $05, .Loop2
	sStop
