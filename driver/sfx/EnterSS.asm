	sHeaderInit						; Z80 offset is $F782
	sHeaderPrio	$70
	sHeaderCh	$01
	sHeaderSFX	$80, ctFM5, .FM5, $00, $02

.FM5
	sVoice		pEnterSS
	ssMod68k	$00, $01, $5B, $02
	dc.b nEb6, $65
	sStop
