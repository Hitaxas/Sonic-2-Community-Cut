Ending_Header:
	sHeaderInit						; Z80 offset is $1380
	sHeaderTempo	$02, $69
	sHeaderCh	$05, $03
	sHeaderDAC	Ending_DAC1
	sHeaderDAC	Ending_DAC2
	sHeaderFM	Ending_FM1, $E8, $10
	sHeaderFM	Ending_FM2, $F4, $09
	sHeaderFM	Ending_FM3, $F4, $08
	sHeaderFM	Ending_FM4, $F4, $0B
	sHeaderFM	Ending_FM5, $F4, $0B
	sHeaderPSG	Ending_PSG1, $D0+$0C, $30, $02, v0C
	sHeaderPSG	Ending_PSG2, $D0+$0C, $28, $00, v05
	sHeaderPSG	Ending_PSG3, $DC+$0C, $28, $02, v0C

	; Patch $00
	; $08
	; $09, $30, $70, $00,	$1F, $5F, $1F, $5F
	; $12, $0A, $0E, $0A,	$00, $04, $04, $03
	; $2F, $2F, $2F, $2F,	$25, $13, $30, $80
	spAlgorithm	$00
	spFeedback	$01
	spDetune	$00, $03, $07, $00
	spMultiple	$09, $00, $00, $00
	spRateScale	$00, $01, $00, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $0A, $0E, $0A
	spDecayRt	$00, $04, $04, $03
	spSustainLv	$02, $02, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$25, $13, $30, $00

	; Patch $01
	; $3D
	; $01, $01, $08, $01,	$90, $8F, $8D, $53
	; $0E, $0E, $0E, $05,	$02, $02, $03, $04
	; $1F, $1F, $FF, $0F,	$16, $27, $28, $80
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $08, $01
	spRateScale	$02, $02, $02, $01
	spAttackRt	$10, $0F, $0D, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0E, $0E, $05
	spDecayRt	$02, $02, $03, $04
	spSustainLv	$01, $01, $0F, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$16, $27, $28, $00

	; Patch $02
	; $3A
	; $11, $00, $1A, $11,	$89, $4F, $59, $4F
	; $0A, $06, $0D, $09,	$00, $00, $00, $01
	; $1F, $0F, $FF, $5F,	$20, $3B, $2E, $80
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$01, $00, $01, $01
	spMultiple	$01, $00, $0A, $01
	spRateScale	$02, $01, $01, $01
	spAttackRt	$09, $0F, $19, $0F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $06, $0D, $09
	spDecayRt	$00, $00, $00, $01
	spSustainLv	$01, $00, $0F, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$20, $3B, $2E, $00

	; Patch $03
	; $23
	; $6E, $26, $34, $74,	$0E, $0E, $0E, $0D
	; $08, $05, $07, $05,	$02, $03, $02, $12
	; $1F, $2F, $2F, $2F,	$29, $24, $9F, $82
	spAlgorithm	$03
	spFeedback	$04
	spDetune	$06, $02, $03, $07
	spMultiple	$0E, $06, $04, $04
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0E, $0E, $0E, $0D
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $05, $07, $05
	spDecayRt	$02, $03, $02, $12
	spSustainLv	$01, $02, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$29, $24, $1F, $02

Ending_FM1:
	sVoice		$03
	ssMod68k	$01, $02, $04, $02
	sCall		Ending_Call1
	saVol		$FC
	sCall		Ending_Call2
	saVol		$04
	sCall		Ending_Call3
	saVol		$10
	dc.b nG5, $03
	saVol		$FF
	dc.b nA5
	saVol		$FF
	dc.b nB5
	saVol		$FF
	dc.b nC6
	saVol		$FF
	dc.b nB5
	saVol		$FE
	dc.b nC6
	saVol		$FE
	dc.b nD6
	saVol		$FE
	dc.b nE6
	saVol		$FE
	dc.b nD6
	saVol		$FE
	dc.b nE6
	saVol		$FE
	dc.b nF6
	saVol		$FE
	dc.b nG6
	saVol		$FE
	dc.b nF6
	saVol		$FE
	dc.b nG6
	saVol		$FE
	dc.b nA6
	saVol		$FE
	dc.b nB6
	saVol		$09
	sCall		Ending_Call4
	dc.b nBb6, $30
	sStop

Ending_Call2:
	dc.b nE6, $12, nC6, $06, nF6, $12, nC6, $1E
	dc.b nRst, $18, nE6, $12, nC6, $06, nF6, $12
	dc.b nC6, $1E
	sRet

Ending_Call1:
	dc.b nC4, $1E, nG4, $06, nE4, nD4, nC4, $30
	dc.b nAb3, $18, nBb3, $0C, nD4, nE4, $30, nEb4
	dc.b $18, nF4, $0C, nD4, nE4, $12, nA3, $1E
	dc.b nD4, $12, nG4, $1E, nA4, $12, nG4, $1E
	dc.b nRst, $0C, nB4, nG4, $06, nD4, nG4, nAb4
	dc.b nA4, $18
	sRet

Ending_Call3:
	dc.b nRst, $18, nF6, $0C, $06, nE6, nF6, nE6
	dc.b $0C, nD6, nE6, $06, nF6, $0C, nE6, $30
	sRet

Ending_Call4:
	dc.b nG6, $18, nBb6, $0C, nEb6, nAb6, $15, nRst
	dc.b $03, nC7, $06, nBb6, nG6, $03, nAb6, $09
	dc.b nG6, $18, nBb6, $0C, nEb6, nAb6, $15, nC7
	dc.b $03, $06, nBb6, nG6, $03, nAb6, $09, nC7
	dc.b $15, $03, nB6, $06, $06, $03, $06, nBb6
	dc.b $1B, nA6, $06, $06, $03, $09, nC7, $06
	dc.b nBb6, nG6, nAb6, $18, nG6, $03, $03, nC7
	dc.b $06, nBb6, nG6, nAb6, $12, nBb6, $0C, nCs7
	dc.b $03, nC7, nBb6, nAb6, nCs7, nC7, nBb6, nAb6
	dc.b nCs7, nC7, nBb6, nAb6, nCs7, nC7, nBb6, nAb6
	sRet

Ending_FM2:
	sVoice		$01
	ssMod68k	$00, $02, $02, $02
	dc.b nRst, $06, nE5, $03, nF5, nE5, $24
	sCall		Ending_Call5
	saVol		$02
	dc.b nRst, $30

Ending_Loop1:
	dc.b nRst, $18, nG5, $02, nRst, $01, nC5, $02
	dc.b nRst, $01, nE5, $02, nRst, $01, nC5, $02
	dc.b nRst, $01, nG5, $02, nRst, $01, nC5, $02
	dc.b nRst, $01, nE5, $02, nRst, $01, nC5, $02
	dc.b nRst, $01, nRst, $18, nA5, $02, nRst, $01
	dc.b nD5, $02, nRst, $01, nF5, $02, nRst, $01
	dc.b nD5, $02, nRst, $01, nA5, $02, nRst, $01
	dc.b nD5, $02, nRst, $01, nF5, $02, nRst, $01
	dc.b nD5, $02, nRst, $01
	sLoop		$00, $02, Ending_Loop1
	saVol		$FE
	sCall		Ending_Call6
	dc.b nRst, $06
	saVol		$0A

Ending_Loop2:
	dc.b nC6, $06
	saVol		$FE
	sLoop		$00, $07, Ending_Loop2
	saVol		$03
	sCall		Ending_Call7
	dc.b nEb6, $30, sHold, $30
	sStop

Ending_Call5:
	dc.b nRst, $06, nC6, $02, nRst, $01, nC6, $02
	dc.b nRst, $01, nC6, $06, nD6, $03, nF6, $09
	dc.b nE6, $06, nD6, nC6, nEb6, nF6, $03, nC6
	dc.b $24, nRst, $03
	sLoop		$01, $02, Ending_Call5
	dc.b nRst, $18, nE6, $06, nC6, nE6, $03, nC6
	dc.b $06, nD6, $1B, nE6, $06, nC6, nE6, $03
	dc.b nC6, $06, nD6, $33
	sRet

Ending_Call7:
	dc.b nRst, $06, nEb6, $03, nD6, $09, nEb6, $03
	dc.b nBb5, $09, nEb6, $03, nD6, $09, nEb6, $03
	dc.b nC6, $15, nRst, $03, nAb6, $03, $06, nG6
	dc.b nEb6, $03, nF6, $09
	sLoop		$01, $02, Ending_Call7
	dc.b nG6, $15, $03, nF6, $06, nG6, nEb6, $03
	dc.b nF6, $06, nG6, $1B, nF6, $06, nG6, nEb6
	dc.b $03, $06, $03, nAb6, $06, nG6, nEb6, nF6
	dc.b $18, nEb6, $03, $03, nAb6, $06, nG6, nEb6
	dc.b nF6, $12, nEb6, $0C
	sRet

Ending_Call6:
	dc.b nRst, $06, nF6, $03, nG6, nA6, nRst, nF6
	dc.b $03, nG6, nA6, $18, nRst, $06, nG6, $03
	dc.b nA6, nB6, nRst, nG6, $03, nA6, nB6, $18
	dc.b nRst, $06, nA6, $03, nB6, nC7, nRst, nA6
	dc.b $03, nB6, nC7, $18
	sRet

Ending_FM3:
	sVoice		$00
	dc.b nRst, $24, nG3, $0C

Ending_Loop3:
	dc.b nC4, $15, nG3, $03, nC4, $06, $0C, $03
	dc.b nG3, nAb3, $15, nEb3, $03, nBb3, $06, $0C
	dc.b $03, nB3
	sLoop		$00, $02, Ending_Loop3
	dc.b nA3, $15, nE3, $03, nA3, $06, $06, $03
	dc.b nB3, nC4, nCs4, nD4, $15, nA3, $03, nD4
	dc.b $06, $0C, $06, nG3, $15, nD3, $03, nG3
	dc.b $06, $0C, nD4, $06, nG3, $15, nD3, $03
	dc.b nG3, nD3, nG3, $0C, $03, nAb3, nA3, $15
	dc.b nE3, $03, nA3, $06, $0C, $03, nE3, nBb3
	dc.b $15, nF3, $03, nBb3, $06, $0C, $03, nF3
	dc.b nA3, $15, nE3, $03, nA3, $06, nA3, nA3
	dc.b $03, nE3, nA3, nE3, nBb3, $15, nF3, $03
	dc.b nBb3, $06, $0C, $03, $03, nF3, $15, $03
	dc.b $06, $0C, $03, nFs3, nG3, $15, nD3, $03
	dc.b nG3, $06, $0C, $03, nAb3, nA3, $15, nE3
	dc.b $03, nA3, $06, $0C, $03, $03, nRst, $06
	saVol		$0A

Ending_Loop4:
	dc.b nG3
	saVol		$FE
	sLoop		$00, $07, Ending_Loop4
	saVol		$03

Ending_Loop5:
	dc.b nEb4, $15, $03, nD4, $06, $0C, $03, nBb3
	dc.b nAb3, $15, $03, nBb3, $06, $0C, nF4, $03
	dc.b nBb3
	sLoop		$00, $02, Ending_Loop5
	dc.b nC4, $15, $03, nB3, $06, $12, nBb3, $15
	dc.b $03, nA3, $06, $12, nAb3, nBb3, $18, nF4
	dc.b $06, nAb3, $12, nBb3, nBb3, $06, nC4, nCs4
	dc.b $15, nAb3, $03, nCs4, $06, $12, nEb3, $30
	sStop

Ending_FM4:
	sVoice		$02
	sPan		spRight
	dc.b nRst, $12, nG5, $03, nA5, nG5, $18

Ending_Loop6:
	dc.b nG5, $30, nEb5, $18, nF5, $0C, nA5
	sLoop		$00, $02, Ending_Loop6
	dc.b nE5, $12, nG5, nE5, $0C, nE5, $12, nG5
	dc.b nE5, $0C, nF5, $12, nA5, nF5, $0C, nC6
	dc.b $12, nA5, nF5, $0C

Ending_Loop7:
	dc.b nE5, $03, $03, nD5, $06, nE5, nD5, $03
	dc.b nE5, $1B, nF5, $03, $03, nE5, $06, nF5
	dc.b nE5, $03, nF5, $1B
	sLoop		$00, $02, Ending_Loop7
	dc.b nC5, $12, nA4, nC5, $0C, nB4, $12, nD5
	dc.b nB4, $0C, nC5, $12, nE5, nC5, $0C, nRst
	dc.b $06
	saVol		$0A

Ending_Loop8:
	dc.b nF5
	saVol		$FE
	sLoop		$00, $07, Ending_Loop8
	saVol		$03

Ending_Loop9:
	dc.b nBb5, $12, nG5, $03, nBb5, $0F, nG5, $0C
	dc.b nC6, $18, nAb5, $06, $06, $03, nC6, $09
	sLoop		$00, $02, Ending_Loop9
	dc.b nC6, $06, nC5, $03, nEb5, nG5, $06, nC5
	dc.b $03, nEb5, nB5, $18, nBb5, $06, nC5, $03
	dc.b nEb5, nG5, $06, nC5, $03, nEb5, nA5, $18
	dc.b nEb5, $12, nF5, $18, nG5, $03, nF5, nEb5
	dc.b $12, nF5, nF5, $0C, nC5, $06, nEb5, $03
	dc.b nC5, $06, nEb5, $03, nC6, $06, nG5, $03
	dc.b $03, nEb5, nC5, $09, nG5, $03, nAb5, nG5
	dc.b $30
	sStop

Ending_FM5:
	sVoice		$02
	sPan		spLeft
	dc.b nRst, $01, nRst, $12, nG5, $03, nA5, nG5
	dc.b $17

Ending_Loop10:
	dc.b nE5, $30, nC5, $18, nD5, $0C, nF5
	sLoop		$00, $02, Ending_Loop10
	dc.b nC5, $12, nE5, nC5, $0C, nC5, $12, nE5
	dc.b nC5, $0C, nD5, $12, nF5, nD5, $0C, nA5
	dc.b $12, nF5, nD5, $0C

Ending_Loop11:
	dc.b nC5, $03, $03, nB4, $06, nC5, nB4, $03
	dc.b nC5, $1B, nD5, $03, $03, nC5, $06, nD5
	dc.b nC5, $03, nD5, $1B
	sLoop		$00, $02, Ending_Loop11
	dc.b nA4, $12, nF4, nA4, $0C, nG4, $12, nB4
	dc.b nG4, $0C, nA4, $12, nC5, nA4, $0C, nRst
	dc.b $06
	saVol		$0A

Ending_Loop12:
	dc.b nD5, $06
	saVol		$FE
	sLoop		$00, $07, Ending_Loop12
	saVol		$03

Ending_Loop13:
	dc.b nG5, $12, nEb5, $03, nG5, $0F, nEb5, $0C
	dc.b nAb5, $18, nF5, $06, $06, $03, nAb5, $09
	sLoop		$00, $02, Ending_Loop13
	dc.b nRst, $01, nC6, $06, nC5, $03, nEb5, nG5
	dc.b $06, nC5, $03, nEb5, $02, nG5, $18, nRst
	dc.b $01, nBb5, $06, nC5, $03, nEb5, nG5, $06
	dc.b nC5, $03, nEb5, $02, nG5, $18, nC5, $12
	dc.b nD5, $18, nEb5, $03, nD5, nC5, $12, nD5
	dc.b nD5, $0C, nAb4, $06, nC5, $03, nAb4, $06
	dc.b nC5, $03, nG5, $06, nEb5, $03, $03, nC5
	dc.b nAb4, $09, nEb5, $03, nF5, nEb5, $30
	sStop

Ending_PSG1:
	ssDetune	$01
	dc.b nRst, $02

Ending_PSG2:
	dc.b nRst, $01, nRst, $06, nE5, $03, nF5, nE5
	dc.b $24
	sCall		Ending_Call5
	dc.b nRst, $30, nRst, $18
	saVol		$10
	sCall		Ending_Call2
	saVol		-$10
	dc.b nRst, $06, nF6, $02, nRst, $01, nG6, $02
	dc.b nRst, $01, nA6, $02, nRst, $01, nRst, $03
	dc.b nF6, $02, nRst, $01, nG6, $02, nRst, $01
	dc.b nA6, $14, nRst, $04, nRst, $06, nG6, $02
	dc.b nRst, $01, nA6, $02, nRst, $01, nB6, $02
	dc.b nRst, $01, nRst, $03, nG6, $02, nRst, $01
	dc.b nA6, $02, nRst, $01, nB6, $14, nRst, $04
	dc.b nRst, $06, nA6, $02, nRst, $01, nB6, $02
	dc.b nRst, $01, nC7, $02, nRst, $01, nRst, $03
	dc.b nA6, $02, nRst, $01, nB6, $02, nRst, $01
	dc.b nC7, $14, nRst, $04
	sCall		Ending_Call8
	sCall		Ending_Call7
	dc.b nEb6, $30, sHold, $18, nRst, $18
	sStop

Ending_Call8:
	saVol		$38
	dc.b nG5, $03, nA5
	saVol		-$08
	dc.b nB5, $03, nC6
	saVol		-$08
	dc.b nB5, $03, nC6
	saVol		-$08
	dc.b nD6, $03, nE6
	saVol		-$08
	dc.b nD6, $03, nE6
	saVol		-$08
	dc.b nF6, $03, nG6
	saVol		-$08
	dc.b nF6, $03, nG6
	saVol		-$08
	dc.b nA6, $03, nB6
	sRet

Ending_PSG3:
	dc.b nRst, $02
	sCall		Ending_Call1
	saTranspose	$F4
	sCall		Ending_Call2
	sCall		Ending_Call3
	sCall		Ending_Call8
	sCall		Ending_Call4
	dc.b nBb6, $18, nRst, $18
	sStop

Ending_DAC2:
	sCall		Ending_Call9

Ending_Loop14:
	dc.b dKick, $15, dKick, $03, $06, $06, dSnare, $0C
	sLoop		$00, $07, Ending_Loop14
	sCall		Ending_Call9

Ending_Loop15:
	dc.b dKick, $0C, dSnare, $09, dKick, $03, $06, $06
	dc.b dSnare, $0C
	sLoop		$00, $07, Ending_Loop15
	dc.b dKick, $06, dSnare, dSnare, dSnare, dSnare, dSnare, dSnare
	dc.b dSnare, $03, dSnare

Ending_Loop16:
	dc.b dKick, $0C, dSnare, $09, dKick, $03, $06, $06
	dc.b dSnare, $0C, dKick, $0C, dSnare, $09, dKick, $03
	dc.b $06, $06, dSnare, $06, $03, $03
	sLoop		$00, $03, Ending_Loop16

Ending_Loop17:
	dc.b dKick, $0C, dSnare, $06, dKick, $0C, dSnare, $06
	dc.b $06, $03, $03
	sLoop		$00, $02, Ending_Loop17
	dc.b dKick, $0C, dSnare, $09, dKick, $03, $06, $06
	dc.b dSnare, $0C, dKick, $30

Ending_DAC1:
	sStop

Ending_Call9:
	dc.b dKick, $15, dKick, $03, $06, $06, dSnare, dSnare
	dc.b $03, $03
	sRet
