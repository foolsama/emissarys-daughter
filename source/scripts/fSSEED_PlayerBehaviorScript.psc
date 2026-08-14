Scriptname fSSEED_PlayerBehaviorScript extends Quest  

function BenchmarkPlayer()
; BaseSneakAttacks = Game.QueryStat("Sneak Attacks")
; BaseCriticalStrikes = Game.QueryStat("Critical Strikes")
; BasePotionsUsed = Game.QueryStat("Potions Used")
; BasePoisonsUsed = Game.QueryStat("Poisons Used")
; BaseLocksPicked = Game.QueryStat("Locks Picked")
; BasePeopleKilled = Game.QueryStat("People Killed")
; BaseDungeonsCleared = Game.QueryStat("Dungeons Cleared")
endFunction

function ProcessCurrentBehavior()
; subtract base benchmark from current
endFunction

; weight
; observed behavior since recruitment: heavy
; current skills: moderately
; lifetsime stats: lightly, tie-breaker

function ClassifyPlayerClass()
; Int Class
; 1 = martial 2 = ranged 3 = arcane
; martial - combats started with a one-handed or two-handed weapon;combats started with a shield;OneHanded, TwoHanded, and Block skill;Critical Strikes delta.
; MartialScore = (MeleeStarts * 4) + MeleeSwitches
; ranged - combats started with bow or crossbow;Marksman skill;Sneak Attacks delta, with limited weight.
; RangedScore  = (BowStarts * 4) + BowSwitches
; Arcane - combats started with spells equipped;capped combat spell casts;highest relevant magical school skills.
; ArcaneScore  = (SpellStarts * 4) + CappedCombatSpellCasts

; MartialScore += ((HighestMartialSkill - 15) / 10) as Int
; RangedScore  += ((P.GetBaseAV("Marksman") - 15) / 10) as Int
; ArcaneScore  += ((HighestMagicSkill - 15) / 10) as Int

endFunction

function ClassifyPlayerOperation()
; pattern 1=Direct 2=Prepared 3=Adaptive

; Direct regularly begins combat openly; low sneak-start percentage; stays with the same combat category; high critical-strike or kill rate relative to observed combats.
; Prepared regularly begins while sneaking; uses poisons and potions; produces sneak attacks; tends to start fights from favorable positioning. 
; Adaptive uses two or more combat categories in the same encounter; switches between weapon and magic; has no single method overwhelmingly dominant; changes approach after resource depletion.

endFunction