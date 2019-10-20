VoiceBank:
sPatNum := 0
	; Voice $00
	; $04
	; $37, $72, $77, $49,	$1F, $1F, $1F, $1F
	; $07, $0A, $07, $0D,	$00, $0B, $00, $0B
	; $1F, $0F, $1F, $0F,	$23, $80, $23, $80
	spAlgorithm	$04, Rings
	spFeedback	$00
	spDetune	$03, $07, $07, $04
	spMultiple	$07, $07, $02, $09
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $07, $0A, $0D
	spSustainLv	$01, $01, $00, $00
	spDecayRt	$00, $00, $0B, $0B
	spSSGEG		$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$23, $23, $00, $00

	; Patch $01
	; $3C
	; $05, $0A, $01, $01,	$56, $5C, $5C, $5C
	; $0E, $11, $11, $11,	$09, $06, $0A, $0A
	; $4F, $3F, $3F, $3F,	$17, $20, $80, $80
	spAlgorithm	$04, Starpost
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$05, $0A, $01, $01
	spRateScale	$01, $01, $01, $01
	spAttackRt	$16, $1C, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $11, $11, $11
	spDecayRt	$09, $06, $0A, $0A
	spSustainLv	$04, $03, $03, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spSSGEG		$00, $00, $00, $00
	spTotalLv	$17, $20, $00, $00

	; Patch $02
	; $30
	; $30, $30, $30, $30,	$9E, $DC, $D8, $DC
	; $0E, $04, $0A, $05,	$08, $08, $08, $08
	; $BF, $BF, $BF, $BF,	$14, $14, $3C, $80
	spAlgorithm	$00, Death
	spFeedback	$06
	spDetune	$03, $03, $03, $03
	spMultiple	$00, $00, $00, $00
	spRateScale	$02, $03, $03, $03
	spAttackRt	$1E, $1C, $18, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $04, $0A, $05
	spDecayRt	$08, $08, $08, $08
	spSustainLv	$0B, $0B, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$14, $14, $3C, $00

	; Patch $03
	; $FA
	; $21, $10, $30, $32,	$2F, $2F, $1F, $2F
	; $05, $09, $08, $02,	$06, $06, $0F, $02
	; $1F, $4F, $2F, $2F,	$0F, $0E, $1A, $80
	spAlgorithm	$02, PushBlock
	spFeedback	$07
	spDetune	$02, $01, $03, $03
	spMultiple	$01, $00, $00, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0F, $0F, $1F, $0F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $09, $08, $02
	spDecayRt	$06, $06, $0F, $02
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0F, $0E, $1A, $00

	; Patch $04
	; $3B
	; $3C, $30, $39, $31,	$DF, $1F, $1F, $DF
	; $04, $04, $05, $01,	$04, $04, $04, $02
	; $FF, $1F, $0F, $AF,	$29, $0F, $20, $80
	spAlgorithm	$03, SpikeHit
	spFeedback	$07
	spDetune	$03, $03, $03, $03
	spMultiple	$0C, $00, $09, $01
	spRateScale	$03, $00, $00, $03
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $04, $05, $01
	spDecayRt	$04, $04, $04, $02
	spSustainLv	$0F, $01, $00, $0A
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$29, $0F, $20, $00

	; Patch $05
	; $07
	; $73, $33, $33, $73,	$0F, $19, $14, $1A
	; $0A, $0A, $0A, $0A,	$0A, $0A, $0A, $0A
	; $57, $57, $57, $57,	$00, $00, $00, $00
	spAlgorithm	$07, Sparkle
	spFeedback	$00
	spDetune	$07, $03, $03, $07
	spMultiple	$03, $03, $03, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0F, $19, $14, $1A
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $0A, $0A, $0A
	spDecayRt	$0A, $0A, $0A, $0A
	spSustainLv	$05, $05, $05, $05
	spReleaseRt	$07, $07, $07, $07
	spTotalLv	$00, $00, $00, $00

	; Patch $06
	; $00
	; $00, $02, $03, $00,	$D9, $1F, $DF, $1F
	; $12, $14, $11, $0F,	$0A, $0A, $00, $0D
	; $FF, $FF, $FF, $FF,	$22, $27, $07, $80
	spAlgorithm	$00, Splash
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $02, $03, $00
	spRateScale	$03, $00, $03, $00
	spAttackRt	$19, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $14, $11, $0F
	spDecayRt	$0A, $0A, $00, $0D
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$22, $27, $07, $00

	; Patch $07
	; $F9
	; $21, $10, $30, $32,	$1F, $1F, $1F, $1F
	; $05, $09, $18, $02,	$0B, $10, $1F, $05
	; $1F, $4F, $2F, $2F,	$0E, $04, $07, $80
	spAlgorithm	$01, BossHit
	spFeedback	$07
	spDetune	$02, $01, $03, $03
	spMultiple	$01, $00, $00, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $09, $18, $02
	spDecayRt	$0B, $10, $1F, $05
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0E, $04, $07, $00

	; Patch $08
	; $35
	; $05, $08, $09, $07,	$1E, $0D, $0D, $0E
	; $0C, $03, $15, $06,	$16, $09, $0E, $10
	; $2F, $1F, $2F, $1F,	$15, $12, $12, $80
	spAlgorithm	$05, Bubble
	spFeedback	$06
	spDetune	$00, $00, $00, $00
	spMultiple	$05, $08, $09, $07
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1E, $0D, $0D, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0C, $03, $15, $06
	spDecayRt	$16, $09, $0E, $10
	spSustainLv	$02, $01, $02, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$15, $12, $12, $00

	; Patch $09
	; $FA
	; $02, $00, $03, $05,	$12, $0F, $11, $13
	; $05, $09, $18, $02,	$06, $06, $0F, $02
	; $1F, $4F, $2F, $2F,	$2F, $0E, $1A, $80
	spAlgorithm	$02, LavaBall
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$02, $00, $03, $05
	spRateScale	$00, $00, $00, $00
	spAttackRt	$12, $0F, $11, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $09, $18, $02
	spDecayRt	$06, $06, $0F, $02
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$2F, $0E, $1A, $00

	; Patch $0A
	; $30
	; $30, $30, $30, $30,	$9E, $AC, $A8, $DC
	; $0E, $04, $0A, $05,	$08, $08, $08, $08
	; $BF, $BF, $BF, $BF,	$04, $14, $2C, $80
	spAlgorithm	$00, Shield
	spFeedback	$06
	spDetune	$03, $03, $03, $03
	spMultiple	$00, $00, $00, $00
	spRateScale	$02, $02, $02, $03
	spAttackRt	$1E, $0C, $08, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $04, $0A, $05
	spDecayRt	$08, $08, $08, $08
	spSustainLv	$0B, $0B, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$04, $14, $2C, $00

	; Patch $0B
	; $83
	; $1F, $1F, $15, $1F,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$02, $02, $02, $02
	; $2F, $FF, $2F, $3F,	$0B, $01, $16, $82
	spAlgorithm	$03, Saw
	spFeedback	$00
	spDetune	$01, $01, $01, $01
	spMultiple	$0F, $0F, $05, $0F
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$02, $0F, $02, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0B, $01, $16, $02

	; Patch $0C
	; $83
	; $12, $13, $10, $1E,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$02, $02, $02, $02
	; $2F, $FF, $2F, $3F,	$05, $34, $10, $87
	spAlgorithm	$03, Electric
	spFeedback	$00
	spDetune	$01, $01, $01, $01
	spMultiple	$02, $03, $00, $0E
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$02, $0F, $02, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$05, $34, $10, $07

	; Patch $0D
	; $35
	; $14, $04, $1A, $09,	$0E, $11, $10, $0E
	; $0C, $03, $15, $06,	$16, $09, $0E, $10
	; $2F, $4F, $2F, $4F,	$2F, $12, $12, $80
	spAlgorithm	$05, Drown
	spFeedback	$06
	spDetune	$01, $00, $01, $00
	spMultiple	$04, $04, $0A, $09
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0E, $11, $10, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0C, $03, $15, $06
	spDecayRt	$16, $09, $0E, $10
	spSustainLv	$02, $04, $02, $04
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$2F, $12, $12, $00

	; Patch $0E
	; $3C
	; $05, $0A, $01, $01,	$56, $5C, $5C, $5C
	; $0E, $11, $11, $11,	$09, $06, $0A, $0A
	; $4F, $3F, $3F, $3F,	$1F, $2B, $80, $80
	spAlgorithm	$04, Bumper1
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$05, $0A, $01, $01
	spRateScale	$01, $01, $01, $01
	spAttackRt	$16, $1C, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $11, $11, $11
	spDecayRt	$09, $06, $0A, $0A
	spSustainLv	$04, $03, $03, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$1F, $2B, $00, $00

	; Patch $0F
	; $05
	; $00, $00, $00, $00,	$1F, $1F, $1F, $1F
	; $12, $0C, $0C, $0C,	$12, $08, $08, $08
	; $1F, $5F, $5F, $5F,	$07, $80, $80, $80
	spAlgorithm	$05, Bumper2
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $0C, $0C, $0C
	spDecayRt	$12, $08, $08, $08
	spSustainLv	$01, $05, $05, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$07, $00, $00, $00

	; Patch $10
	; $FA
	; $21, $10, $30, $32,	$1F, $1F, $1F, $1F
	; $05, $09, $18, $02,	$06, $06, $0F, $02
	; $1F, $4F, $2F, $2F,	$0F, $0E, $1A, $80
	spAlgorithm	$02, Rumble
	spFeedback	$07
	spDetune	$02, $01, $03, $03
	spMultiple	$01, $00, $00, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $09, $18, $02
	spDecayRt	$06, $06, $0F, $02
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0F, $0E, $1A, $00

	; Patch $11
	; $1C
	; $2E, $0F, $02, $02,	$1F, $1F, $1F, $1F
	; $18, $14, $0F, $0E,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$20, $1B, $80, $80
	spAlgorithm	$04, Diamonds
	spFeedback	$03
	spDetune	$02, $00, $00, $00
	spMultiple	$0E, $0F, $02, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$18, $14, $0F, $0E
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$20, $1B, $00, $00

	; Patch $12
	; $3C
	; $00, $00, $00, $00,	$1F, $1F, $1F, $1F
	; $00, $0F, $16, $0F,	$00, $00, $00, $00
	; $0F, $FF, $AF, $FF,	$00, $0A, $80, $80
	spAlgorithm	$04, Door
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $0F, $16, $0F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $0F, $0A, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $0A, $00, $00

	; Patch $13
	; $FD
	; $09, $00, $03, $00,	$1F, $1F, $1F, $1F
	; $10, $0C, $0C, $0C,	$0B, $10, $1F, $05
	; $1F, $4F, $2F, $2F,	$09, $92, $84, $8E
	spAlgorithm	$05, Dash
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$09, $00, $03, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$10, $0C, $0C, $0C
	spDecayRt	$0B, $10, $1F, $05
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$09, $12, $04, $0E

	; Patch $14
	; $FA
	; $21, $19, $3A, $30,	$1F, $1F, $1F, $1F
	; $05, $09, $18, $02,	$0B, $10, $1F, $05
	; $1F, $4F, $2F, $2F,	$0E, $04, $07, $80
	spAlgorithm	$02, Stomp1
	spFeedback	$07
	spDetune	$02, $01, $03, $03
	spMultiple	$01, $09, $0A, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $09, $18, $02
	spDecayRt	$0B, $10, $1F, $05
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0E, $04, $07, $00

	; Patch $15
	; $FA
	; $31, $10, $30, $32,	$1F, $1F, $1F, $1F
	; $05, $05, $18, $10,	$0B, $10, $1F, $10
	; $1F, $1F, $2F, $2F,	$0D, $01, $00, $80
	spAlgorithm	$02, Stomp2
	spFeedback	$07
	spDetune	$03, $01, $03, $03
	spMultiple	$01, $00, $00, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $18, $10
	spDecayRt	$0B, $10, $1F, $10
	spSustainLv	$01, $01, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0D, $01, $00, $00

	; Patch $16
	; $3C
	; $00, $02, $44, $02,	$1F, $1F, $1F, $15
	; $00, $00, $1F, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$0D, $28, $00, $00
	spAlgorithm	$04, Roll
	spFeedback	$07
	spDetune	$00, $00, $04, $00
	spMultiple	$00, $02, $04, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $15
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $1F, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0D, $28, $00, $00

	; Patch $17
	; $14
	; $25, $36, $33, $11,	$1F, $1F, $1F, $1F
	; $15, $1C, $18, $13,	$0B, $0D, $08, $09
	; $0F, $8F, $9F, $0F,	$24, $0A, $05, $80
	spAlgorithm	$04, Continue
	spFeedback	$02
	spDetune	$02, $03, $03, $01
	spMultiple	$05, $06, $03, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$15, $1C, $18, $13
	spDecayRt	$0B, $0D, $08, $09
	spSustainLv	$00, $08, $09, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$24, $0A, $05, $00

	; Patch $18
	; $3C
	; $0F, $03, $01, $01,	$1F, $1F, $1F, $1F
	; $19, $19, $12, $0E,	$05, $00, $12, $0F
	; $0F, $FF, $7F, $FF,	$00, $00, $80, $80
	spAlgorithm	$04, Break
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$0F, $03, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$19, $19, $12, $0E
	spDecayRt	$05, $00, $12, $0F
	spSustainLv	$00, $0F, $07, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $00, $00, $00

	; Patch $19
	; $FA
	; $21, $10, $30, $32,	$1F, $1F, $1F, $1F
	; $05, $05, $18, $10,	$0B, $10, $1F, $10
	; $1F, $4F, $2F, $2F,	$0D, $04, $07, $80
	spAlgorithm	$02, Explode
	spFeedback	$07
	spDetune	$02, $01, $03, $03
	spMultiple	$01, $00, $00, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$05, $05, $18, $10
	spDecayRt	$0B, $10, $1F, $10
	spSustainLv	$01, $04, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0D, $04, $07, $00

	; Patch $1A
	; $30
	; $30, $34, $5C, $30,	$9E, $AC, $A8, $DC
	; $0E, $04, $0A, $05,	$08, $08, $08, $08
	; $BF, $BF, $BF, $BF,	$24, $04, $1C, $80
	spAlgorithm	$00, BigRing1
	spFeedback	$06
	spDetune	$03, $03, $05, $03
	spMultiple	$00, $04, $0C, $00
	spRateScale	$02, $02, $02, $03
	spAttackRt	$1E, $0C, $08, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $04, $0A, $05
	spDecayRt	$08, $08, $08, $08
	spSustainLv	$0B, $0B, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$24, $04, $1C, $00

	; Patch $1B
	; $30
	; $30, $34, $5C, $30,	$9E, $AC, $A8, $DC
	; $0E, $04, $0A, $05,	$08, $08, $08, $08
	; $BF, $BF, $BF, $BF,	$24, $04, $2C, $80
	spAlgorithm	$00, BigRing2
	spFeedback	$06
	spDetune	$03, $03, $05, $03
	spMultiple	$00, $04, $0C, $00
	spRateScale	$02, $02, $02, $03
	spAttackRt	$1E, $0C, $08, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $04, $0A, $05
	spDecayRt	$08, $08, $08, $08
	spSustainLv	$0B, $0B, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$24, $04, $2C, $00

	; Patch $1C
	; $04
	; $37, $77, $72, $49,	$1F, $1F, $1F, $1F
	; $07, $07, $0A, $0D,	$00, $00, $0B, $0B
	; $1F, $1F, $0F, $0F,	$13, $13, $81, $88
	spAlgorithm	$04, BigRing3
	spFeedback	$00
	spDetune	$03, $07, $07, $04
	spMultiple	$07, $07, $02, $09
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $07, $0A, $0D
	spDecayRt	$00, $00, $0B, $0B
	spSustainLv	$01, $01, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$13, $13, $01, $08

	; Patch $1D
	; $28
	; $2F, $37, $5F, $2B,	$1F, $1F, $1F, $1F
	; $15, $15, $15, $13,	$13, $0D, $0C, $10
	; $2F, $3F, $2F, $2F,	$00, $1F, $10, $80
	spAlgorithm	$00, Chain
	spFeedback	$05
	spDetune	$02, $03, $05, $02
	spMultiple	$0F, $07, $0F, $0B
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$15, $15, $15, $13
	spDecayRt	$13, $0D, $0C, $10
	spSustainLv	$02, $03, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $1F, $10, $00

	; Patch $1E
	; $3B
	; $03, $02, $02, $06,	$18, $1A, $1A, $96
	; $17, $0A, $0E, $10,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$00, $39, $28, $80
	spAlgorithm	$03, Register1
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$03, $02, $02, $06
	spRateScale	$00, $00, $00, $02
	spAttackRt	$18, $1A, $1A, $16
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$17, $0A, $0E, $10
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $39, $28, $00

	; Patch $1F
	; $04
	; $37, $77, $72, $49,	$1F, $1F, $1F, $1F
	; $07, $07, $0A, $0D,	$00, $00, $0B, $0B
	; $1F, $1F, $0F, $0F,	$23, $23, $80, $80
	spAlgorithm	$04, Register2
	spFeedback	$00
	spDetune	$03, $07, $07, $04
	spMultiple	$07, $07, $02, $09
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $07, $0A, $0D
	spDecayRt	$00, $00, $0B, $0B
	spSustainLv	$01, $01, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$23, $23, $00, $00

	; Patch $20
	; $3B
	; $0A, $05, $31, $02,	$5F, $5F, $5F, $5F
	; $04, $16, $14, $0C,	$00, $00, $04, $00
	; $1F, $D8, $6F, $FF,	$03, $00, $25, $80
	spAlgorithm	$03, Bonu
	spFeedback	$07
	spDetune	$00, $00, $03, $00
	spMultiple	$0A, $05, $01, $02
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $16, $14, $0C
	spDecayRt	$00, $00, $04, $00
	spSustainLv	$01, $0D, $06, $0F
	spReleaseRt	$0F, $08, $0F, $0F
	spTotalLv	$03, $00, $25, $00

	; Patch $21
	; $20
	; $36, $30, $35, $31,	$41, $3B, $49, $4B
	; $09, $09, $06, $08,	$01, $02, $03, $A9
	; $0F, $0F, $0F, $0F,	$29, $23, $27, $80
	spAlgorithm	$00, EnterSS
	spFeedback	$04
	spDetune	$03, $03, $03, $03
	spMultiple	$06, $00, $05, $01
	spRateScale	$01, $00, $01, $01
	spAttackRt	$01, $1B, $09, $0B
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$09, $09, $06, $08
	spDecayRt	$01, $02, $03, $A9
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$29, $23, $27, $00

	; Patch $22
	; $20
	; $36, $30, $35, $31,	$DF, $9F, $DF, $9F
	; $07, $09, $06, $06,	$07, $06, $06, $08
	; $2F, $1F, $1F, $FF,	$16, $13, $30, $80
	spAlgorithm	$00, Spring
	spFeedback	$04
	spDetune	$03, $03, $03, $03
	spMultiple	$06, $00, $05, $01
	spRateScale	$03, $02, $03, $02
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $09, $06, $06
	spDecayRt	$07, $06, $06, $08
	spSustainLv	$02, $01, $01, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$16, $13, $30, $00

	; Patch $23
	; $F4
	; $06, $0F, $04, $0E,	$1F, $1F, $1F, $1F
	; $00, $0B, $00, $0B,	$00, $05, $00, $08
	; $0F, $FF, $0F, $FF,	$0C, $03, $8B, $80
	spAlgorithm	$04, Signpost
	spFeedback	$06
	spDetune	$00, $00, $00, $00
	spMultiple	$06, $0F, $04, $0E
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $0B, $00, $0B
	spDecayRt	$00, $05, $00, $08
	spSustainLv	$00, $0F, $00, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$0C, $03, $0B, $00

	; Patch $24
	; $83
	; $12, $13, $10, $1E,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$02, $02, $02, $02
	; $2F, $FF, $2F, $3F,	$06, $34, $10, $87
	spAlgorithm	$03, Zapper
	spFeedback	$00
	spDetune	$01, $01, $01, $01
	spMultiple	$02, $03, $00, $0E
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$02, $02, $02, $02
	spSustainLv	$02, $0F, $02, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$06, $34, $10, $07

	; Patch $25
	; $3C
	; $02, $01, $00, $01,	$1F, $1F, $1F, $1F
	; $00, $19, $0E, $10,	$00, $00, $0C, $0F
	; $0F, $FF, $EF, $FF,	$05, $00, $80, $80
	spAlgorithm	$04, Unk51
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$02, $01, $00, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $19, $0E, $10
	spDecayRt	$00, $00, $0C, $0F
	spSustainLv	$00, $0F, $0E, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$05, $00, $00, $00

	; Patch $26
	; $28
	; $21, $21, $21, $30,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$29, $20, $29, $80
	spAlgorithm	$00, Unk52
	spFeedback	$05
	spDetune	$02, $02, $02, $03
	spMultiple	$01, $01, $01, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$29, $20, $29, $00

	; Patch $27
	; $07
	; $0A, $0C, $0C, $0C,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $FF, $FF, $FF, $FF,	$2A, $0F, $0F, $80
	spAlgorithm	$07, Signpost2P
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$0A, $0C, $0C, $0C
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$2A, $0F, $0F, $00

	; Patch $28
	; $07
	; $03, $02, $03, $00,	$FF, $6F, $6F, $3F
	; $12, $14, $11, $0E,	$1A, $0A, $03, $0D
	; $FF, $FF, $FF, $FF,	$03, $07, $07, $80
	spAlgorithm	$07, LidPop
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$03, $02, $03, $00
	spRateScale	$03, $01, $01, $00
	spAttackRt	$1F, $0F, $0F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $14, $11, $0E
	spDecayRt	$1A, $0A, $03, $0D
	spSustainLv	$0F, $0F, $0F, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$03, $07, $07, $00

	; Patch $29
	; $42
	; $20, $0E, $0F, $0F,	$1F, $1F, $1F, $1F
	; $1F, $1F, $1F, $1F,	$0F, $0E, $0F, $0E
	; $0F, $0F, $0F, $0F,	$2E, $80, $20, $80
	spAlgorithm	$02, SpikeRing
	spFeedback	$00
	spDetune	$02, $00, $00, $00
	spMultiple	$00, $0E, $0F, $0F
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$1F, $1F, $1F, $1F
	spDecayRt	$0F, $0E, $0F, $0E
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$2E, $00, $20, $00

	; Patch $2A
	; $0D
	; $06, $00, $00, $E5,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$27, $80, $80, $80
	spAlgorithm	$05, Elevator
	spFeedback	$01
	spDetune	$00, $00, $00, $0E
	spMultiple	$06, $00, $00, $05
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$27, $00, $00, $00

	; Patch $2B
	; $04
	; $09, $70, $00, $30,	$1C, $1F, $DF, $1F
	; $15, $12, $0B, $0F,	$0C, $0D, $00, $0D
	; $07, $2F, $FA, $FA,	$00, $29, $00, $00
	spAlgorithm	$04, PlatKnock
	spFeedback	$00
	spDetune	$00, $07, $00, $03
	spMultiple	$09, $00, $00, $00
	spRateScale	$00, $00, $03, $00
	spAttackRt	$1C, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$15, $12, $0B, $0F
	spDecayRt	$0C, $0D, $00, $0D
	spSustainLv	$00, $02, $0F, $0F
	spReleaseRt	$07, $0F, $0A, $0A
	spTotalLv	$00, $29, $00, $00

	; Patch $2C
	; $3C
	; $05, $0A, $01, $01,	$56, $5C, $5C, $5C
	; $0E, $11, $11, $11,	$09, $06, $0A, $0A
	; $4F, $3F, $3F, $3F,	$17, $20, $80, $80
	spAlgorithm	$04, TinyBumper
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$05, $0A, $01, $01
	spRateScale	$01, $01, $01, $01
	spAttackRt	$16, $1C, $1C, $1C
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $11, $11, $11
	spDecayRt	$09, $06, $0A, $0A
	spSustainLv	$04, $03, $03, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$17, $20, $00, $00

	; Patch $2D
	; $32
	; $30, $30, $40, $70,	$1F, $1F, $1F, $1F
	; $12, $0A, $01, $0D,	$00, $01, $01, $0C
	; $00, $23, $C3, $F6,	$08, $07, $1C, $03
	spAlgorithm	$02, LargeBumper1
	spFeedback	$06
	spDetune	$03, $03, $04, $07
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $0A, $01, $0D
	spDecayRt	$00, $01, $01, $0C
	spSustainLv	$00, $02, $0C, $0F
	spReleaseRt	$00, $03, $03, $06
	spTotalLv	$08, $07, $1C, $03

	; Patch $2E
	; $47
	; $03, $02, $02, $04,	$5F, $5F, $5F, $5F
	; $0E, $1A, $11, $0A,	$09, $0A, $0A, $0A
	; $4F, $3F, $3F, $3F,	$7F, $80, $80, $A3
	spAlgorithm	$07, Gloop
	spFeedback	$00
	spDetune	$00, $00, $00, $00
	spMultiple	$03, $02, $02, $04
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $1A, $11, $0A
	spDecayRt	$09, $0A, $0A, $0A
	spSustainLv	$04, $03, $03, $03
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$7F, $00, $00, $23

	; Patch $2F
	; $38
	; $0F, $0F, $0F, $0F,	$1F, $1F, $1F, $0E
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $1F,	$00, $00, $00, $80
	spAlgorithm	$00, ArrowFire
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$0F, $0F, $0F, $0F
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $01
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $00, $00, $00

	; Patch $30
	; $FA
	; $12, $01, $01, $01,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$81, $8E, $14, $80
	spAlgorithm	$02, Fire
	spFeedback	$07
	spDetune	$01, $00, $00, $00
	spMultiple	$02, $01, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$01, $0E, $14, $00

	; Patch $31
	; $35
	; $30, $44, $40, $51,	$1F, $1F, $1F, $1F
	; $10, $00, $13, $15,	$1F, $00, $1F, $1A
	; $7F, $0F, $7F, $5F,	$02, $A8, $80, $80
	spAlgorithm	$05, Helicopter
	spFeedback	$06
	spDetune	$03, $04, $04, $05
	spMultiple	$00, $04, $00, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$10, $00, $13, $15
	spDecayRt	$1F, $00, $1F, $1A
	spSustainLv	$07, $00, $07, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$02, $28, $00, $00

	; Patch $32
	; $3A
	; $70, $30, $04, $01,	$0F, $14, $19, $16
	; $08, $0A, $0B, $05,	$03, $03, $03, $05
	; $1F, $6F, $8F, $5F,	$1F, $22, $1F, $80
	spAlgorithm	$02, Transform2
	spFeedback	$07
	spDetune	$07, $03, $00, $00
	spMultiple	$00, $00, $04, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0F, $14, $19, $16
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$08, $0A, $0B, $05
	spDecayRt	$03, $03, $03, $05
	spSustainLv	$01, $06, $08, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$1F, $22, $1F, $00

	; Patch $33
	; $34
	; $00, $03, $0C, $09,	$9F, $8C, $8F, $95
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$00, $1D, $00, $00
	spAlgorithm	$04, Spindash
	spFeedback	$06
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $03, $0C, $09
	spRateScale	$02, $02, $02, $02
	spAttackRt	$1F, $0C, $0F, $15
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $1D, $00, $00

	; Patch $34
	; $32
	; $30, $30, $50, $30,	$1F, $0E, $19, $0E
	; $07, $12, $15, $09,	$0A, $09, $1D, $06
	; $E8, $03, $0A, $17,	$07, $00, $00, $00
	spAlgorithm	$02, Rumble2
	spFeedback	$06
	spDetune	$03, $03, $05, $03
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $0E, $19, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$07, $12, $15, $09
	spDecayRt	$0A, $09, $1D, $06
	spSustainLv	$0E, $00, $00, $01
	spReleaseRt	$08, $03, $0A, $07
	spTotalLv	$07, $00, $00, $00

	; Patch $35
	; $34
	; $0C, $10, $73, $0C,	$AF, $AC, $FF, $D5
	; $06, $00, $02, $01,	$02, $0A, $04, $08
	; $BF, $BF, $BF, $BF,	$00, $08, $80, $80
	spAlgorithm	$04, LaunchSpring
	spFeedback	$06
	spDetune	$00, $01, $07, $00
	spMultiple	$0C, $00, $03, $0C
	spRateScale	$02, $02, $03, $03
	spAttackRt	$0F, $0C, $1F, $15
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$06, $00, $02, $01
	spDecayRt	$02, $0A, $04, $08
	spSustainLv	$0B, $0B, $0B, $0B
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$00, $08, $00, $00

	; Patch $36
	; $3D
	; $12, $10, $77, $30,	$5F, $5F, $5F, $5F
	; $0F, $0A, $00, $01,	$0A, $0A, $0D, $0D
	; $4F, $0F, $0F, $0F,	$13, $80, $80, $80
	spAlgorithm	$05, Flipper
	spFeedback	$07
	spDetune	$01, $01, $07, $03
	spMultiple	$02, $00, $07, $00
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0F, $0A, $00, $01
	spDecayRt	$0A, $0A, $0D, $0D
	spSustainLv	$04, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$13, $00, $00, $00

	; Patch $37
	; $24
	; $2A, $02, $05, $01,	$1A, $1F, $10, $1F
	; $0F, $1F, $1F, $1F,	$0C, $0D, $11, $11
	; $0C, $09, $09, $0F,	$0E, $04, $80, $80
	spAlgorithm	$04, TrackLift
	spFeedback	$04
	spDetune	$02, $00, $00, $00
	spMultiple	$0A, $02, $05, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1A, $1F, $10, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0F, $1F, $1F, $1F
	spDecayRt	$0C, $0D, $11, $11
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0C, $09, $09, $0F
	spTotalLv	$0E, $04, $00, $00

	; Patch $38
	; $32
	; $33, $17, $34, $13,	$0F, $0D, $1B, $17
	; $00, $04, $02, $0B,	$08, $00, $08, $09
	; $6F, $5F, $4F, $6F,	$05, $00, $00, $80
	spAlgorithm	$02, GloopDrop
	spFeedback	$06
	spDetune	$03, $01, $03, $01
	spMultiple	$03, $07, $04, $03
	spRateScale	$00, $00, $00, $00
	spAttackRt	$0F, $0D, $1B, $17
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $04, $02, $0B
	spDecayRt	$08, $00, $08, $09
	spSustainLv	$06, $05, $04, $06
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$05, $00, $00, $00

	; Patch $39
	; $3D
	; $09, $34, $34, $28,	$1F, $16, $16, $16
	; $00, $00, $00, $04,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$15, $02, $02, $00
	spAlgorithm	$05, Lazer
	spFeedback	$07
	spDetune	$00, $03, $03, $02
	spMultiple	$09, $04, $04, $08
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $16, $16, $16
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $04
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$15, $02, $02, $00

	; Patch $3A
	; $00
	; $53, $30, $03, $30,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $00, $00, $00, $0F,	$0F, $06, $23, $80
	spAlgorithm	$00, Swap1
	spFeedback	$00
	spDetune	$05, $03, $00, $03
	spMultiple	$03, $00, $03, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$00, $00, $00, $0F
	spTotalLv	$0F, $06, $23, $00

	; Patch $3B
	; $3C
	; $72, $32, $32, $72,	$14, $14, $0F, $0F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $02, $02, $08, $08,	$35, $14, $00, $00
	spAlgorithm	$04, Swap2
	spFeedback	$07
	spDetune	$07, $03, $03, $07
	spMultiple	$02, $02, $02, $02
	spRateScale	$00, $00, $00, $00
	spAttackRt	$14, $14, $0F, $0F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$02, $02, $08, $08
	spTotalLv	$35, $14, $00, $00

	; Patch $3C
	; $3A
	; $30, $30, $40, $70,	$1F, $1F, $1F, $1F
	; $12, $0A, $01, $07,	$00, $01, $01, $03
	; $00, $23, $C3, $46,	$08, $07, $1C, $03
	spAlgorithm	$02, LazerFloor
	spFeedback	$07
	spDetune	$03, $03, $04, $07
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$12, $0A, $01, $07
	spDecayRt	$00, $01, $01, $03
	spSustainLv	$00, $02, $0C, $04
	spReleaseRt	$00, $03, $03, $06
	spTotalLv	$08, $07, $1C, $03

	; Patch $3D
	; $38
	; $00, $00, $00, $00,	$1F, $1F, $1F, $1F
	; $00, $00, $00, $00,	$00, $00, $00, $00
	; $0F, $0F, $0F, $0F,	$1F, $0C, $17, $00
	spAlgorithm	$00, Error
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $00, $00
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$1F, $0C, $17, $00

	; Patch $3E
	; $33
	; $00, $10, $00, $31,	$1F, $1D, $1E, $0E
	; $00, $0C, $1D, $00,	$00, $00, $01, $00
	; $0F, $0F, $0F, $0F,	$08, $06, $07, $80
	spAlgorithm	$03, MechaSonic
	spFeedback	$06
	spDetune	$00, $01, $00, $03
	spMultiple	$00, $00, $00, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1D, $1E, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $0C, $1D, $00
	spDecayRt	$00, $00, $01, $00
	spSustainLv	$00, $00, $00, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$08, $06, $07, $00
