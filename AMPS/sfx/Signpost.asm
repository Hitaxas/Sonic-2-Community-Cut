	sHeaderInitSFX						; Z80 offset is $F83E
	sHeaderPrio	$80
	sHeaderCh	$02
	sHeaderSFX	$80, ctFM4, .FM4, $27, $03
	sHeaderSFX	$80, ctFM5, .FM5, $27, $00

.FM4
	dc.b nRst, $04

.FM5
	sVoice		pSignpost

.Loop1
	dc.b nEb4, $05
	saVol		$02
	sLoop		$00, $15, .Loop1
	sStop
