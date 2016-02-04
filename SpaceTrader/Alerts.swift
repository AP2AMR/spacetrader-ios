//
//  Alerts.swift
//  SpaceTrader
//
//  Created by Marc Auger on 2/4/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import Foundation

class Alert {
    let ID: AlertID
    let passedString: String
    let heading: String
    let text: String
    let yesButton: String
    let noButton: String
    let yesFunction: () -> ()
    let noFunction: () -> ()
    
    init(ID: AlertID, passedString: String) {
        
    }
}

enum AlertID: Int {
    case AntidoteOnBoard = 0
    case AntidoteDestroyed
    case AntidoteTaken
    case ArrivalBuyNewspaper
    case ArrivalIFFuel
    case ArrivalIFFuelRepairs
    case ArrivalIFNewspaper
    case ArrivalIFRepairs
    case ArtifactLost
    case ArtifactRelinquished
    case CargoIF
    case CargoNoEmptyBays
    case CargoNoneAvailable
    case CargoNoneToSell
    case CargoNotInterested
    case CargoNotSold
    case ChartJump
    case ChartJumpCurrent
    case ChartJumpNoSystemSelected
    case ChartTrackSystem
    case ChartWormholeUnreachable
    case Cheater
    case CrewFireMercenary
    case CrewNoQuarters
    case DebtNoBuy
    case DebtNone
    case DebtReminder
    case DebtTooLargeGrounded
    case DebtTooLargeLoan
    case DebtTooLargeTrade
    case DebtWarning
    case Egg
    case EncounterAliensSurrender
    case EncounterArrested
    case EncounterAttackCaptain
    case EncounterAttackNoDisruptors
    case EncounterAttackNoLasers
    case EncounterAttackNoWeapons
    case EncounterAttackPolice
    case EncounterAttackTrader
    case EncounterBothDestoryed
    case EncounterDisabledOpponent
    case EncounterDrinkContents
    case EncounterDumpAll
    case EncounterDumpWarning
    case EncounterEscaped
    case EncounterEscapeHit
    case EncounterEscapePodActivated
    case EncounterLooting
    case EncounterMarieCeleste
    case EncounterMarieCelesteNoBribe
    case EncounterOpponentEscaped
    case EncounterPiratesBounty
    case EncounterPiratesExamineReactor
    case EncounterPiratesFindNoCargo
    case EncounterPiratesSurrenderPrincess
    case EncounterPiratesTakeSculpture
    case EncounterPoliceBribe
    case EncounterPoliceBribeCant
    case EncounterPoliceBribeLowCash
    case EncounterPoliceFine
    case EncounterPoliceNothingFound
    case EncounterPoliceNothingIllegal
    case EncounterPoliceSubmit
    case EncounterPoliceSurrender
    case EncounterPostMarie
    case EncounterPostMarieFlee
    case EncounterScoop
    case EncounterScoopNoRoom
    case EncounterScoopNoScoop
    case EncounterSurrenderRefused
    case EncounterTonicConsumedGood
    case EncounterTonicConsumedStrange
    case EncounterTradeCompleted
    case EncounterYouLose
    case EncounterYouWin
    case EquipmentAlreadyOwn
    case EquipmentBuy
    case EquipmentEscapePod
    case EquipmentExtraBaysInUse
    case EqipmentFuelCompactor
    case EquipmentHiddenCompartments
    case EquipmentIF
    case EquipmentLightningShield
    case EquipmentMorgansLaser
    case EquipmentNotEnoughSlots
    case EquipmentQuantumDisruptor
    case EquipmentSell
    case FleaBuilt
    case GameAbandonConfirm
    case GameClearHighScores
    case GameEndBoughtMoon
    case GameEndBoughtMoonGirl
    case GameEndHighScoreAchieved
    case GameEndHighScoreCheat
    case GameEndHighScoreMissed
    case GameEndKilled
    case GameEndRetired
    case GameEndScore
    case GameRetire
    case InsuranceNoEscapePod
    case InsurancePayoff
    case InsuranceStop
    case JailConvicted
    case JailFleaReceived
    case JailHiddenCargoBaysRemoved
    case JailIllegalGoodsImpounded
    case JailInsuranceLost
    case JailMercenariesLeave
    case JailShipSold
    case JarekTakenHome
    case LeavingIFInsurance
    case LeavingIFMercenaries
    case LeavingIFWormholeTax
    case MeetCaptainAhab
    case MeetCaptainConrad
    case MeetCaptainHuie
    case NewGameConfirm
    case NewGameMoreSkillPoints
    case PreciousHidden
    case PrincessTakenHome
    case ReactorConfiscated
    case ReactorDestroyed
    case ReactorOnBoard
    case ReactorMeltdown
    case ReactorWarningFuelGone
    case ReactorWarningTemp
    case SculptureConfiscated
    case SculptureSaved
    case ShipBuyConfirm
    case ShipBuyCrewQuarters
    case ShipBuyIF
    case ShipBuyIFTransfer
    case ShipBuyNoSlots
    case ShipBuyNotAvailable
    case ShipBuyNoTransfer
    case ShipBuyPassengerQuarters
    case ShipBuyReactor
    case ShipBuyTransfer
    case ShipDesignIF
    case ShipDesignThanks
    case ShipHullUpgraded
    case SpecialCleanRecord
    case SpecialExperimentPerformed
    case SpecialIF
    case SpecialMoonBought
    case SpecialNoQuarters
    case SpecialNotEnoughBays
    case SpecialPassengerConcernedJarek
    case SpecialPassengerConcernedPrincess
    case SpecialPassengerConcernedWild
    case SpecialPassengerImpatientJarek
    case SpecialPassengerImpatientPrincess
    case SpecialPassengerImpatientWild
    case SpecialPassengerOnBoard
    case SpecialSealedCanisters
    case SpecialSkillIncrease
    case SpecialSpacetimeFabricRip
    case SpecialTrainingCompleted
    case TravelArrival
    case TravelUneventfulTrip
    case TribblesAllDied
    case TribblesAteFood
    case TribblesGone
    case TribblesHalfDied
    case TribblesKilled
    case TribblesMostDead
    case TribblesOwn
    case TribblesRemoved
    case TribblesInspector
    case TribblesSqueak
    case TribblesTradeIn
    case WildArrested
    case WildChatsPirates
    case WildGoesPirates
    case WildLeavesShip
    case WildSculpture
    case WildWontBoardLaser
    case WildWontBoardReactor
    case WildWontStayAboardLaser
    case WildWontStayAboardReactor
}