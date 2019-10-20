AquaticRuin_Header:
	sHeaderInit						; Z80 offset is $1380
	sHeaderTempo	$01, $20
	sHeaderCh	$05, $03
	sHeaderDAC	AquaticRuin_DAC1
	sHeaderDAC	AquaticRuin_DAC2
	sHeaderFM	AquaticRuin_FM1, $00, $0C
	sHeaderFM	AquaticRuin_FM2, $00, $0F
	sHeaderFM	AquaticRuin_FM3, $00, $13
	sHeaderFM	AquaticRuin_FM4, $00, $0F
	sHeaderFM	AquaticRuin_FM5, $00, $0C
	sHeaderPSG	AquaticRuin_PSG1, $D0+$0C, $20, $00, v01
	sHeaderPSG	AquaticRuin_PSG2, $D0+$0C, $30, $00, v01
	sHeaderPSG	AquaticRuin_PSG3, $00, $01, $00, v02

	; Patch $00
	; $18
	; $37, $31, $32, $31,	$9E, $1C, $DC, $9C
	; $0D, $04, $06, $01,	$08, $03, $0A, $05
	; $B6, $36, $B6, $28,	$2C, $14, $22, $00
	spAlgorithm	$00
	spFeedback	$03
	spDetune	$03, $03, $03, $03
	spMultiple	$07, $01, $02, $01
	spRateScale	$02, $00, $03, $02
	spAttackRt	$1E, $1C, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0D, $04, $06, $01
	spDecayRt	$08, $03, $0A, $05
	spSustainLv	$0B, $03, $0B, $02
	spReleaseRt	$06, $06, $06, $08
	spTotalLv	$2C, $14, $22, $00

	; Patch $01
	; $3A
	; $01, $01, $01, $02,	$8D, $07, $07, $52
	; $09, $00, $00, $03,	$01, $02, $02, $00
	; $52, $02, $02, $28,	$18, $18, $22, $80
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $01, $01, $02
	spRateScale	$02, $00, $00, $01
	spAttackRt	$0D, $07, $07, $12
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$09, $00, $00, $03
	spDecayRt	$01, $02, $02, $00
	spSustainLv	$05, $00, $00, $02
	spReleaseRt	$02, $02, $02, $08
	spTotalLv	$18, $18, $22, $00

	; Patch $02
	; $3D
	; $01, $02, $02, $02,	$10, $50, $50, $50
	; $07, $08, $08, $08,	$01, $00, $00, $00
	; $24, $18, $18, $18,	$1C, $82, $82, $82
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$01, $02, $02, $02
	spRateScale	$00, $01, $01, $01
	spAttackRt	$10, $10, $10, $10
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $08, $08, $08
	spDecayRt	$01, $00, $00, $00
	spSustainLv	$02, $01, $01, $01
	spReleaseRt	$04, $08, $08, $08
	spTotalLv	$1C, $02, $02, $02

	; Patch $03
	; $32
	; $71, $33, $0D, $01,	$5F, $5F, $99, $94
	; $05, $05, $05, $07,	$02, $02, $02, $02
	; $11, $11, $11, $72,	$23, $26, $2D, $80
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$07, $03, $00, $00
	spMultiple	$01, $03, $0D, $01
	spRateScale	$01, $01, $02, $02
	spAttackRt	$1F, $1F, $19, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $05, $07
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$01, $01, $01, $07
	spReleaseRt	$01, $01, $01, $02
	spTotalLv	$23, $26, $2D, $00

	; Patch $04
	; $3A
	; $32, $52, $01, $31,	$1F, $1F, $1F, $18
	; $01, $00, $1F, $00,	$00, $00, $0F, $00
	; $5A, $03, $0F, $1A,	$3B, $4F, $30, $00
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$03, $05, $00, $03
	spMultiple	$02, $02, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $18
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $00, $1F, $00
	spDecayRt	$00, $00, $0F, $00
	spSustainLv	$05, $00, $00, $01
	spReleaseRt	$0A, $03, $0F, $0A
	spTotalLv	$3B, $4F, $30, $00

	; Patch $05
	; $32
	; $71, $33, $0D, $01,	$5F, $5F, $99, $94
	; $05, $05, $05, $07,	$02, $02, $02, $02
	; $11, $11, $11, $77,	$23, $26, $2D, $80
	spAlgorithm	$02
	spFeedback	$06
	spDetune	$07, $03, $00, $00
	spMultiple	$01, $03, $0D, $01
	spRateScale	$01, $01, $02, $02
	spAttackRt	$1F, $1F, $19, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $05, $07
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$01, $01, $01, $07
	spReleaseRt	$01, $01, $01, $07
	spTotalLv	$23, $26, $2D, $00

AquaticRuin_Call1:
	dc.b nD5, $06, nC5, nD5, $12, nF5, nD5, $0C
	dc.b nE5, nRst, $06, $12, nG5, $0C, nF5, $06
	dc.b nRst, nC6, nA5, $30, sHold, $0C
	sRet

AquaticRuin_Call2:
	dc.b nC5, $12, nBb4, nG4, nC5, $06, nRst, nBb4
	dc.b nC5, nRst, nBb4, nRst, nBb4, $12, nA4, nF4
	dc.b nBb4, $06, nRst, nA4, nBb4, nRst, nA4, nRst
	dc.b nA4, $12, nG4, nE4, nA4, $06, nRst, nG4
	dc.b nA4, nRst, nG4, nRst
	sRet

AquaticRuin_Call3:
	dc.b nBb5, $12, nC6, nD6, nD6, $06, nRst, nD6
	dc.b nC6, nRst, nBb5, nRst, nA5, $30, nRst, $06
	dc.b nC6, nRst, nC6, nBb5, nRst, nA5, nRst, nG5
	dc.b $30, nRst, $06, nBb5, nRst, nBb5, nA5, nRst
	dc.b nG5, nRst
	sRet

AquaticRuin_Call4:
	dc.b nF5, $12, nG5, nA5, nG5, $06, nRst, nG5
	dc.b nF5, nRst, nG5, nRst, nF5, $30, nRst, $06
	dc.b nA5, nRst, nA5, nG5, nRst, nF5, nRst, nE5
	dc.b $30, nRst, $06, nG5, nRst, nG5, nE5, nRst
	dc.b nE5, nRst, $06
	sRet

AquaticRuin_FM1:
	sVoice		$00
	ssMod68k	$06, $02, $02, $02
	dc.b nC2, $06, nD2

AquaticRuin_Jump1:
	dc.b nD1, $30, sHold, $30, sHold, nD1, nRst, $12
	dc.b nA1, $06, nA1, nRst, nC2, nD2, nD1, $30
	dc.b sHold, $30, sHold, nD1, nRst, $12, nA1, $06
	dc.b nA1, nRst, $12, nRst, nG1, nBb1, $06, nRst
	dc.b $18, nC2, $12, nG1, $06, nRst, nRst, $12
	dc.b nF1, nA1, $06, nRst, $18, nBb1, $12, nF1
	dc.b $06, nRst, nRst, $12, nE1, nG1, $06, nRst
	dc.b $18, nA1, $12, nCs2, $06, nRst, nRst, $12
	dc.b nD1, nFs1, $08, nRst, $16, nA1, $06, nE1
	dc.b nF1, nG1, nA1, nRst, $12, nG1, nBb1, $08
	dc.b nRst, $16, nC2, $12, nG1, $09, nRst, $03
	dc.b nRst, $12, nF1, nA1, $06, nRst, $18, nBb1
	dc.b $12, nF1, $07, nRst, $05, nRst, $12, nE2
	dc.b nCs2, $08, nRst, $16, nA1, $12, nE2, $08
	dc.b nRst, $04, nRst, $12, nD2, $06, $0C, nA1
	dc.b $06, nRst, nA1, nA1, $0C, $06, nD2, nA1
	dc.b $12, nG1, $0C, nRst, $06, nD2, $12, nG1
	dc.b $0C, nG1, nRst, $06, nD2, $12, nG1, $0C
	dc.b nF1, nRst, $06, nC2, $12, nF1, $0C, nF1
	dc.b nRst, $06, nC2, $12, nF1, $0C, nE1, nRst
	dc.b $06, nE2, $12, nCs2, $0C, nA1, nRst, $06
	dc.b nE1, $12, nA1, $0C, nD2, nRst, $06, nA1
	dc.b $12, nFs1, $0C, nRst, $08, nD1, nE1, nFs1
	dc.b nG1, nA1, nG1, $0C, nRst, $06, nD2, $12
	dc.b nG2, $0C, nRst, $06, nG2, nRst, nD2, $12
	dc.b nG1, $0C, nF1, nRst, $06, nC2, $12, nF2
	dc.b $0C, nF2, nRst, $06, nC2, $12, nA1, $0C
	dc.b nE1, nRst, $06, nA1, $12, nCs2, $0C, nE2
	dc.b $12, nCs2, nA1, $0C, nD2, $03, nRst, nD2
	dc.b nRst, nD2, $06, nRst, $12, nD2, $03, nRst
	dc.b $03, nD2, nRst, nD2, $06, nRst, $1E, nC2
	dc.b $06, nD2
	sJump		AquaticRuin_Jump1

AquaticRuin_FM2:
	dc.b nRst, $0C

AquaticRuin_Jump2:
	sVoice		$01
	ssMod68k	$04, $02, $03, $02
	dc.b nD5, $12, nE5, nF5, $0C, nA5, $30, sHold
	dc.b $30, sHold, $0C, nRst, $06, nCs5, nCs5, nRst
	dc.b $12, nD5, nE5, nF5, $06, nD5, nA5, $30
	dc.b sHold, $30, sHold, $0C, nRst, $06, nCs5, nCs5
	dc.b nRst
	sVoice		$02
	saVol		$06
	sCall		AquaticRuin_Call1
	dc.b nRst, $06, nA5, nRst, nBb5, $12, nA5, nG5
	dc.b $06, nF5, nE5, $18, nG5, nFs5, $30, sHold
	dc.b $18, nRst, $0C
	sCall		AquaticRuin_Call1
	dc.b nRst, $06, $0C, nBb5, $12, nA5, nG5, $06
	dc.b nF5, nE5, $18, nCs5, nD5, $30, sHold, $18
	dc.b nRst, $18
	sVoice		$01
	saVol		$F8
	sCall		AquaticRuin_Call2
	dc.b nFs4, nRst, nFs4, nRst, nG4, nG4, nRst, nA4
	dc.b $30, nRst, $06
	sCall		AquaticRuin_Call2
	dc.b nD4, $03, nRst, nD4, nRst, nD4, $06, nRst
	dc.b $12, nD4, $03, nRst, $03, nD4, nRst, nD4
	dc.b $06, nRst, $2A
	saVol		$02
	sJump		AquaticRuin_Jump2

AquaticRuin_FM3:
	sVoice		$01
	ssMod68k	$04, $02, $03, $02
	dc.b nRst, $0C
	sPan		spLeft

AquaticRuin_Jump3:
	dc.b nRst, $07, nD5, $12, nE5, nF5, $0C, nA5
	dc.b $30, sHold, $30, sHold, $0B, nG5, $06, nG5
	dc.b nRst, $12, nRst, $07, nD5, $12, nE5, nF5
	dc.b $06, nD5, nA5, $30, sHold, $30, sHold, $0B
	dc.b nG5, $06, nG5, nRst, nRst, $07
	sVoice		$02
	saVol		$06
	sCall		AquaticRuin_Call1
	dc.b nRst, $06, nA5, nRst, nBb5, $12, nA5, nG5
	dc.b $06, nF5, nE5, $18, nG5, nFs5, $30, sHold
	dc.b $18, nRst, $0C
	sCall		AquaticRuin_Call1
	dc.b nRst, $06, $0C, nBb5, $12, nA5, nG5, $06
	dc.b nF5, nE5, $18, nCs5, nD5, $30, sHold, $18
	dc.b nRst, $18
	sVoice		$01
	saVol		$F8
	sCall		AquaticRuin_Call2
	dc.b nFs4, nRst, nFs4, nRst, nG4, nG4, nRst, nA4
	dc.b $30, nRst, $06, nC5, $12, nBb4, nG4, nC5
	dc.b $06, nRst, nBb4, nC5, nRst, nBb4, nRst, nBb4
	dc.b $12, nA4, nF4, nBb4, $06, nRst, nA4, nBb4
	dc.b nRst, nA4, nRst, nA4, $12, nG4, nE4, nA4
	dc.b $06, nRst, nG4, nA4, nRst, nG4, $05
	saVol		$FC
	dc.b nF5, $03, nRst, nF5, nRst, nF5, $06, nRst
	dc.b $12, nF5, $03, nRst, $03, nF5, nRst, nF5
	dc.b $06, nRst, $2A
	saVol		$06
	sJump		AquaticRuin_Jump3

AquaticRuin_FM4:
	dc.b nRst, $0C

AquaticRuin_Loop1:
	sVoice		$03
	sPan		spRight
	dc.b nD4, $0C, nF4, $06, nC4, nRst, nE4, nRst
	dc.b nD4, $0C, nD4, $06, nRst, nF4, nC4, $0C
	dc.b nE4, nD4, nF4, $06, nC4, $0C, nE4, $06
	dc.b nRst, nD4, $18
	sVoice		$05
	dc.b nA3, $06, nA3, nRst, $12
	sVoice		$03
	sLoop		$00, $02, AquaticRuin_Loop1

AquaticRuin_Loop2:
	dc.b nBb3, $0C, nD4, $06, nF4, $0C, nBb3, nC4
	dc.b $06, nRst, nC4, $0C, nE4, $06, nG4, $0C
	dc.b nC4, $06, nRst, nF4, $0C, nA4, $06, nC4
	dc.b $0C, nE4, nF4, nA4, $06, nRst, nA4, nBb3
	dc.b $0C, nD4, nE4, nG4, $06, nCs4, $0C, nD4
	dc.b nE4, nG4, $06, nRst, nG4, nCs4, $0C, nE4
	dc.b nD4, nFs4, $06, nA3, $0C, nC4, nD4, nFs4
	dc.b $06, nRst, nFs4, nA3, $0C, nC4
	sLoop		$00, $02, AquaticRuin_Loop2
	sVoice		$01
	saVol		$04
	ssMod68k	$02, $02, $01, $02
	sCall		AquaticRuin_Call3
	dc.b nA5, $06, nRst, nA5, nRst, nBb5, nBb5, nRst
	dc.b nC6, nRst, nRst, $02, nFs5, $08, nG5, nA5
	dc.b nBb5, nC6
	sCall		AquaticRuin_Call3
	dc.b nF5, nF5, nF5, nRst, $12, nF5, $06, nF5
	dc.b nF5, nRst, $2A
	saVol		$FC
	sJump		AquaticRuin_Loop1

AquaticRuin_FM5:
	dc.b nRst, $0C

AquaticRuin_Jump4:
	ssMod68k	$06, $01, $06, $05
	saTranspose	$F4
	sPan		spCenter

AquaticRuin_Loop3:
	dc.b nRst, $30, nRst
	sVoice		$04
	dc.b nD6, $06, nA6, nD6, nA6, nD6, $18, nRst
	dc.b $12, nCs6, $06, nCs6, nRst, $12
	sLoop		$00, $02, AquaticRuin_Loop3
	dc.b nRst, $30, nRst, nRst, nF5, $06, nF5, nC6
	dc.b nA5, $1E, nRst, $30, nRst, nRst, $06, nD6
	dc.b nRst, nD6, nC6, nRst, nC6, nRst, nBb5, nRst
	dc.b nBb5, nRst, nA5, $03, nRst, nA5, nRst, $09
	dc.b nRst, $06, nRst, $30, nRst, nRst, nF5, $06
	dc.b nF5, nC6, nA5, $1E, nRst, $30, nRst, nRst
	dc.b $06, nD6, nRst, nD6, nD6, nRst, nC6, nRst
	dc.b nD6, $0C, nC6, $06, nD6, $12, nC6, $02
	dc.b nB5, nA5, nG5, nF5, nE5
	saVol		$04
	saTranspose	$0C
	sVoice		$01
	ssMod68k	$02, $02, $01, $02
	sPan		spLeft
	sCall		AquaticRuin_Call4
	dc.b nFs5, $06, nRst, nFs5, nRst, nG5, nG5, nRst
	dc.b nA5, nRst, nRst, $02, nD5, $08, nE5, nFs5
	dc.b nG5, nA5
	sCall		AquaticRuin_Call4
	dc.b nA5, $06, nA5, nA5, nRst, $12, nA5, $06
	dc.b nA5, nA5, nRst, $2A
	saVol		$FC
	sJump		AquaticRuin_Jump4

AquaticRuin_Call5:
	dc.b dKick, $0C, dSnare, $06, dKick, $12, dKick, $06
	dc.b dKick, $12, dMidTom, $06, dSnare, $0C, dClap, $06
	dc.b dKick, nRst
	sRet

AquaticRuin_Call6:
	dc.b dKick, $0C, dSnare, $06, dKick, $12, dMidTom, $06
	dc.b dMidTom
	sRet

AquaticRuin_DAC1:
	sStop

AquaticRuin_DAC2:
	dc.b dClap, $06, dClap

AquaticRuin_Jump6:
	dc.b dKick, $12, $1E, $12, $1E, $12, $1E, $12
	dc.b dClap, $06, dSnare, nRst, nRst, $0C, dKick, $12
	dc.b dKick, dMidTom, $06, dLowTom, dKick, $12, dKick, dLowTom
	dc.b $06, dFloorTom, dKick, $12, $06, dMidTom, dMidTom, dLowTom
	dc.b dLowTom, dFloorTom, dFloorTom, nRst, dSnare, $06, $0C, dKick

AquaticRuin_Loop8:
	sCall		AquaticRuin_Call5
	sLoop		$00, $03, AquaticRuin_Loop8
	dc.b dClap, $06, dSnare, dKick, dSnare, dSnare, nRst, dSnare
	dc.b nRst, dSnare, nRst, dSnare, nRst, dSnare, dSnare, dClap
	dc.b dClap

AquaticRuin_Loop9:
	sCall		AquaticRuin_Call5
	sLoop		$00, $03, AquaticRuin_Loop9
	dc.b dSnare, $04, dClap, dClap, dClap, dClap, dClap, dClap
	dc.b $0C, $06, dClap, dClap, dClap, dClap, dClap, dClap
	dc.b dClap, dClap, $0C

AquaticRuin_Loop10:
	sCall		AquaticRuin_Call6
	sLoop		$00, $06, AquaticRuin_Loop10
	dc.b dKick, $0C, dSnare, dKick, $06, dClap, $0C, $06
	dc.b dKick, $08, dSnare, dSnare, dSnare, dSnare, dSnare

AquaticRuin_Loop11:
	sCall		AquaticRuin_Call6
	sLoop		$00, $06, AquaticRuin_Loop11
	dc.b dClap, $06, dSnare, dSnare, $18, dSnare, $06, dSnare
	dc.b dSnare, $18, dKick, $0C, dClap, $06, dClap
	sJump		AquaticRuin_Jump6

AquaticRuin_PSG1:
	dc.b nRst, $0C

AquaticRuin_Jump5:
	saTranspose	$0C

AquaticRuin_Loop4:
	dc.b nA3, $0C, nD4, $06, nG3, nRst, nC4, nRst
	dc.b nA3, $0C, nA3, $06, nRst, nD4, nG3, $0C
	dc.b nC4, nA3, nD4, $06, nG3, nRst, nC4, nRst
	dc.b nA3, $18, nF3, $06, nF3, nRst, $12
	sLoop		$00, $02, AquaticRuin_Loop4

AquaticRuin_Loop5:
	dc.b nG3, $0C, nBb3, $06, nD4, $0C, nG3, nG3
	dc.b $06, nRst, nG3, $0C, nBb3, $06, nE4, $0C
	dc.b nG3, $06, nRst, $06, nC4, $0C, nF4, $06
	dc.b nA3, $0C, nC4, nD4, nF4, $06, nRst, nF4
	dc.b nF3, $0C, nBb3, nBb3, nE4, $06, nG3, $0C
	dc.b nBb3, nCs4, nE4, $06, nRst, nE4, nA3, $0C
	dc.b nCs4, nA3, nD4, $06, nG3, $0C, nA3, nA3
	dc.b nD4, $06, nRst, nD4, nFs3, $0C, nA3
	sLoop		$00, $02, AquaticRuin_Loop5
	saTranspose	$F4
	dc.b nG5, $0C, nBb5, $06, nD5, $0C, nF5, nG5
	dc.b $06, nRst, nBb5, nRst, nD5, nF5, $0C, nG5
	dc.b $06, nRst, nF5, $0C, nA5, $06, nC5, $0C
	dc.b nE5, nF5, $06, nRst, nA5, nRst, nC5, nE5
	dc.b $0C, nF5, $06, nRst, nE5, $0C, nG5, $06
	dc.b nCs5, $0C, nD5, nE5, $06, nRst, nG5, nRst
	dc.b nCs5, nD5, $0C, nE5, $06, nRst, nFs5, $0C
	dc.b nA5, $06, nD5, $0C, nE5, nFs5, $06, nRst
	dc.b nA5, nRst, nD5, nE5, $0C, nFs5, $06, nRst
	dc.b nG5, $0C, nBb5, $06, nD5, $0C, nF5, nG5
	dc.b nBb5, $06, nRst, nD5, nF5, $0C, nG5, $06
	dc.b nRst, nF5, $0C, nA5, $06, nC5, $0C, nE5
	dc.b nF5, nA5, $06, nRst, nC5, nE5, $0C, nF5
	dc.b $06, nRst, nE5, $0C, nG5, $06, nCs5, $0C
	dc.b nD5, nE5, nG5, $06, nRst, nCs5, nD5, $0C
	dc.b nE5, $06, nRst, nA5, nA5, nA5, nRst, $12
	dc.b nA5, $06, nA5, nA5, nRst, $2A
	sJump		AquaticRuin_Jump5

AquaticRuin_PSG2:
	dc.b nRst, $0C
	ssMod68k	$03, $02, $01, $05

AquaticRuin_Loop6:
	dc.b nRst, $30, nRst
	sVolEnv		v0A
	dc.b nA5, $06, nE6, nA5, nE6, nA5, $18, nRst
	dc.b $12, nF5, $06, nF5, nRst, $12
	sLoop		$00, $02, AquaticRuin_Loop6
	dc.b nRst, $30, nRst, nRst, nC5, $06, nD5, nA5
	dc.b nF5, $1E, nRst, $30, nRst, nRst, $06, nA5
	dc.b nRst, nA5, nG5, nRst, nG5, nRst, nFs5, nRst
	dc.b nFs5, nRst, nD5, $03, nRst, nD5, nRst, $09
	dc.b nRst, $06, nRst, $30, nRst, nRst, nC5, $06
	dc.b nD5, nA5, nF5, $1E, nRst, $30, nRst, nRst
	dc.b $06, nA5, nRst, nG5, nA5, nRst, nG5, nRst
	dc.b nA5, $0C, nG5, $06, nA5, $12, nG5, $02
	dc.b nF5, nE5, nD5, nC5, nB4
	sVolEnv		v01
	saVol		-$10
	dc.b nD5, $0C, nG5, $06, nBb4, $0C, nD5, nD5
	dc.b $06, nRst, nF5, nRst, nG4, nD5, $0C, nD5
	dc.b $06, nRst, nC5, $0C, nF5, $06, nA4, $0C
	dc.b nC5, nC5, $06, nRst, nF5, nRst, nA4, nC5
	dc.b $0C, nC5, $06, nRst, nCs5, $0C, nE5, $06
	dc.b nA4, $0C, nBb4, nCs5, $06, nRst, nE5, nRst
	dc.b nA4, nA4, $0C, nA4, $06, nRst, nD5, $0C
	dc.b nFs5, $06, nA4, $0C, nC5, nD5, $06, nRst
	dc.b nFs5, nRst, nA4, nC5, $0C, nD5, $06, nRst
	dc.b nD5, $0C, nG5, $06, nBb4, $0C, nD5, nD5
	dc.b nF5, $06, nRst, nG4, nD5, $0C, nD5, $06
	dc.b nRst, nC5, $0C, nF5, $06, nA4, $0C, nC5
	dc.b nC5, nF5, $06, nRst, nA4, nC5, $0C, nC5
	dc.b $06, nRst, nCs5, $0C, nE5, $06, nA4, $0C
	dc.b nBb4, nCs5, nE5, $06, nRst, nA4, nA4, $0C
	dc.b nA4, $06, nRst, nE5, nE5, nE5, nRst, $12
	dc.b nE5, $06, nE5, nE5, nRst, $2A
	saVol		$10
	sJump		AquaticRuin_Loop6

AquaticRuin_PSG3:
	sNoisePSG	$E7
	dc.b nRst, $0C
	sVolEnv		v02

AquaticRuin_Loop7:
	dc.b nRst, $0C, nHiHat, $06, nRst, $07, nHiHat, $06
	dc.b nRst, $11, nHiHat, $0C, nRst, $06, nHiHat, $0C
	dc.b nRst, $06, nHiHat, nRst
	sLoop		$00, $13, AquaticRuin_Loop7
	dc.b nHiHat, $06, $06, $06, nRst, $12, nHiHat, $06
	dc.b $06, $06, nRst, $2A
	sJump		AquaticRuin_Loop7
