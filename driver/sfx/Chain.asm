	sHeaderInit						; Z80 offset is $F716
	sHeaderPrio	$70
	sHeaderCh	$01
	sHeaderSFX	$80, ctFM5, .FM5, $00, $00

.FM5
	sVoice		pChain
	dc.b nCs5, $05, nRst, $04, nCs5, $04, nRst, $04
	sStop
