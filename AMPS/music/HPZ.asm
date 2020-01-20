HiddenPalace_Header:
	sHeaderInit						; Z80 offset is $1380
	sHeaderTempo	$02, $20
	sHeaderCh	$05, $03
	sHeaderDAC	HiddenPalace_DAC1
	sHeaderDAC	HiddenPalace_DAC2
	sHeaderFM	HiddenPalace_FM1, $00, $06
	sHeaderFM	HiddenPalace_FM2, $0C, $10
	sHeaderFM	HiddenPalace_FM3, $00, $14
	sHeaderFM	HiddenPalace_FM4, $00, $0E
	sHeaderFM	HiddenPalace_FM5, $F4, $14
	sHeaderPSG	HiddenPalace_PSG1, $E8+$0C, $30, $00, vNone
	sHeaderPSG	HiddenPalace_PSG2, $E8+$0C, $40, $00, v08
	sHeaderPSG	HiddenPalace_PSG3, $F4+$0C, $40, $00, v08

	; Patch $00
	; $3B
	; $01, $13, $02, $02,	$5D, $5D, $5D, $4A
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $05, $04, $05, $0A,	$1E, $28, $1E, $09
	spAlgorithm	$03
	spFeedback	$07
	spDetune	$00, $01, $00, $00
	spMultiple	$01, $03, $02, $02
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1D, $1D, $1D, $0A
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$05, $04, $05, $0A
	spTotalLv	$1E, $28, $1E, $09

	; Patch $01
	; $3A
	; $22, $71, $68, $32,	$12, $14, $16, $0C
	; $0A, $0A, $06, $04,	$00, $00, $00, $00
	; $16, $56, $26, $06,	$1F, $1C, $22, $00
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$02, $07, $06, $03
	spMultiple	$02, $01, $08, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$12, $14, $16, $0C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $0A, $06, $04
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $05, $02, $00
	spReleaseRt	$06, $06, $06, $06
	spTotalLv	$1F, $1C, $22, $00

	; Patch $02
	; $3B
	; $32, $32, $32, $72,	$4F, $1A, $18, $11
	; $0E, $0B, $16, $00,	$04, $00, $00, $00
	; $50, $00, $10, $0A,	$1B, $1E, $1F, $00
	spAlgorithm	$03
	spFeedback	$07
	spDetune	$03, $03, $03, $07
	spMultiple	$02, $02, $02, $02
	spRateScale	$01, $00, $00, $00
	spAttackRt	$0F, $1A, $18, $11
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0B, $16, $00
	spDecayRt	$04, $00, $00, $00
	spSustainLv	$05, $00, $01, $00
	spReleaseRt	$00, $00, $00, $0A
	spTotalLv	$1B, $1E, $1F, $00

	; Patch $03
	; $38
	; $32, $32, $52, $72,	$17, $1A, $18, $11
	; $17, $0B, $16, $00,	$00, $00, $00, $00
	; $10, $00, $10, $0A,	$20, $21, $11, $00
	spAlgorithm	$00
	spFeedback	$07
	spDetune	$03, $03, $05, $07
	spMultiple	$02, $02, $02, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$17, $1A, $18, $11
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$17, $0B, $16, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $00, $01, $00
	spReleaseRt	$00, $00, $00, $0A
	spTotalLv	$20, $21, $11, $00

HiddenPalace_FM5:
	sPan		spRight
	ssMod68k	$18, $01, $FE, $04
	sVoice		$03
	ssDetune	$02
	sJump		HiddenPalace_Loop3

HiddenPalace_FM4:
	dc.b nRst, $06
	ssMod68k	$0C, $01, $FD, $05
	sVoice		$00
	ssDetune	$02
	sJump		HiddenPalace_Jump3

HiddenPalace_PSG2:
	ssDetune	$FF
	dc.b nRst, $06

HiddenPalace_PSG1:
	ssMod68k	$0C, $01, $FF, $04
	sJump		HiddenPalace_Jump3

HiddenPalace_FM1:
	ssMod68k	$0C, $01, $03, $05

HiddenPalace_Jump3:
	dc.b nRst, $18
	sVoice		$00

HiddenPalace_Loop1:
	dc.b nF4, $06, nG4, nA4, $18, nG4, $0C, nA4
	dc.b $18, nC5, $0C, nB4, nA4, nG4, nA4, $18
	dc.b nF4, $06, nG4, nA4, $18, nG4, $0C, nA4
	dc.b $18, nC5, $0C, nD5, nB4, nG4, nA4, $18
	dc.b nF4, $0C, nG4, $18, nF4, $0C, nG4, $18
	dc.b nC5, $0C, nA4, $24, nG4, $18, nF4, $0C
	dc.b nA4, $24, nB4, nC5, nB4, $18
	sLoop		$00, $02, HiddenPalace_Loop1
	dc.b sHold, nB4, $0C, nF5, $24, $0C, nG5, nF5
	dc.b nE5, $24, nCs5, $18
	sJump		HiddenPalace_Loop1

HiddenPalace_FM2:
HiddenPalace_Loop2:
	dc.b nRst, $18
	sVoice		$01
	dc.b nA1, $0C, nD2, $06, nRst, $12
	dc.b nA1, $0C

HiddenPalace_Jump1:
	dc.b nD2, $06, nRst, $12, nA1, $0C, nG1, $06
	dc.b nRst, $12, nG1, $0C, nD2, $06, nRst, $12
	dc.b nA1, $0C, nD2, $06, nRst, $12, nA1, $0C
	dc.b nD2, $06, nRst, $12, nA1, $0C, nG1, $06
	dc.b nRst, $12, nG1, $0C, nD2, $06, nRst, $12
	dc.b nD2, $0C, nG1, $06, nRst, $12, nD2, $0C
	dc.b nG1, $06, nRst, $12, nG1, $0C, nF1, $06
	dc.b nRst, $12, nC2, $0C, nF1, $06, nRst, $12
	dc.b nC2, $0C, nD2, $06, nRst, $12, nA1, $0C
	dc.b nD2, $06, nRst, $12, nA1, $0C, nD2, $06
	dc.b nRst, $12, nA1, $0C
	sLoop		$00, $02, HiddenPalace_Loop2
	dc.b nD2, $06, nRst, $12, nA1, $0C, nBb1, $18
	dc.b $0C, $18, $0C, nC2, $18, $0C, nCs2, $18
	dc.b nA1, $0C, nD2, $06, nRst, $12, nA1, $0C
	sJump		HiddenPalace_Jump1

HiddenPalace_FM3:
	sPan		spLeft
	saTranspose	$F4
	ssMod68k	$18, $01, $02, $04
	sVoice		$02

HiddenPalace_Loop3:
	dc.b nD4, $0C, nA4, nF4

HiddenPalace_Jump2:
	dc.b nC5, $24, sHold, nC5, nB4, nE5, $18, nA4
	dc.b $0C, nC5, $24, sHold, nC5, nB4, nD5, nRst
	dc.b $0C, nG4, nA4, nB4, $18, nA4, $0C, nRst
	dc.b nA4, nB4, nC5, nB4, nC5, nD5, $24, sHold
	dc.b $18, nE5, $0C, nD5, $24
	sLoop		$00, $02, HiddenPalace_Loop3
	saTranspose	$0C
	dc.b sHold, nD4, $24, nD4, nBb3, $0C, nD4, nA4
	dc.b nG4, $24
	saTranspose	$F4
	dc.b nE4, $0C, nA4, nF4
	sJump		HiddenPalace_Jump2

HiddenPalace_PSG3:
	dc.b nRst, $24
	sGate		$10

HiddenPalace_Loop4:
	saVol		-$10
	dc.b nF4, $06
	saVol		$10
	dc.b nC5, nC5, nF4, nA4, nF4
	saVol		-$10
	dc.b nB4
	saVol		$10
	dc.b nF4, nC5, nF4, nB4, nF4
	sLoop		$00, $10, HiddenPalace_Loop4

HiddenPalace_Loop5:
	dc.b nA5, $06, nF5, nE5, nD5
	sLoop		$00, $04, HiddenPalace_Loop5
	dc.b nA5, $06, nF5, nE5, nCs5, nA5, nG5, nE5
	dc.b nCs5
	sJump		HiddenPalace_Loop4

HiddenPalace_Call1:
	dc.b dKick, $12, dSnare, $06, dFloorTom, $0C, dKick, $0C
	dc.b dSnare, $12, dFloorTom, $06
	sRet

HiddenPalace_DAC1:
	sStop

HiddenPalace_DAC2:
	dc.b dSnare, $06, dMidTom, $0C, dLowTom, $06, dFloorTom, $0C

HiddenPalace_Loop6:
	sCall		HiddenPalace_Call1
	sLoop		$00, $07, HiddenPalace_Loop6
	dc.b dKick, $12, dSnare, $06, dFloorTom, $0C, dKick, $06
	dc.b dMidTom, $0C, dLowTom, $06, dKick, $0C

HiddenPalace_Loop7:
	sCall		HiddenPalace_Call1
	sLoop		$00, $08, HiddenPalace_Loop7
	dc.b dKick, $12, dSnare, $06, dKick, $0C, dKick, $0C
	dc.b dKick, dSnare, dKick, $12, dSnare, $06, dKick, $0C
	sJump		HiddenPalace_DAC2
