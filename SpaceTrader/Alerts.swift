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
    let header: String
    let text: String
    let yesButton: String
    let noButton: String?
    
    init(ID: AlertID, passedString: String) {
        self.ID = ID
        self.passedString = passedString
        
        switch ID {
        case .AntidoteOnBoard:
            self.header = "Antidote"
            self.text = "Ten of your cargo bays now contain antidote for the Japori system."
            self.yesButton = "OK"
            self.noButton = nil
        case .AntidoteDestroyed:
            self.header = "Antidote Destroyed"
            self.text = "The antidote for the Japori system has been destroyed with your ship. You should return to ^1 and get some more."
            self.yesButton = "OK"
            self.noButton = nil
        case .AntidoteTaken:
            self.header = "Antidote Taken"
            self.text = "The Space Corps removed the antidote for Japori from your ship and delivered it, fulfilling your assignment."
            self.yesButton = "OK"
            self.noButton = nil
        case .ArrivalBuyNewspaper:
            self.header = "Buy Newspaper?"
            self.text = "The local newspaper costs ^1. Do you wish to buy a copy?"
            self.yesButton = "Buy Newspaper"
            self.noButton = "Cancel"
        case .ArrivalIFFuel:
            self.header = "No Full Tanks"
            self.text = "You do not have enough money to buy full tanks."
            self.yesButton = "OK"
            self.noButton = nil
        case .ArrivalIFFuelRepairs:
            self.header = "Not Enough Money"
            self.text = "You don't have enough money to get a full tank or full hull repairs."
            self.yesButton = "OK"
            self.noButton = nil
        case .ArrivalIFNewspaper:
            self.header = "Can't Afford it!"
            self.text = "Sorry! A newspaper costs \(self.passedString) cr. in this system. You don't have enough money!"
            self.yesButton = "OK"
            self.noButton = nil
        case .ArrivalIFRepairs:
            self.header = "No Full Repairs"
            self.text = "You don't have enough money to get your hull fully repaired."
            self.yesButton = "OK"
            self.noButton = nil
        case .ArtifactLost:
            self.header = "Artifact Lost"
            self.text = "The alien artifact has been lost in the wreckage of your ship."
            self.yesButton = "OK"
            self.noButton = nil
        case .ArtifactRelinquished:
            self.header = "Artifact Relinquished"
            self.text = "The aliens take the artifact from you."
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoIF:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoNoEmptyBays:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoNoneAvailable:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoNoneToSell:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoNotInterested:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CargoNotSold:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ChartJump:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ChartJumpCurrent:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ChartJumpNoSystemSelected:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ChartTrackSystem:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ChartWormholeUnreachable:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .Cheater:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CrewFireMercenary:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .CrewNoQuarters:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtNoBuy:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtNone:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtReminder:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtTooLargeGrounded:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtTooLargeLoan:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtTooLargeTrade:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .DebtWarning:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .Egg:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAliensSurrender:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterArrested:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackCaptain:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackNoDisruptors:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackNoLasers:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackNoWeapons:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackPolice:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterAttackTrader:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterBothDestoryed:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterDisabledOpponent:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterDrinkContents:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterDumpAll:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterDumpWarning:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterEscaped:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterEscapeHit:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterEscapePodActivated:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterLooting:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterMarieCeleste:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterMarieCelesteNoBribe:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterOpponentEscaped:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPiratesBounty:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPiratesExamineReactor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPiratesFindNoCargo:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPiratesSurrenderPrincess:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPiratesTakeSculpture:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceBribe:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceBribeCant:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceBribeLowCash:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceFine:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceNothingFound:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceNothingIllegal:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceSubmit:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPoliceSurrender:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPostMarie:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterPostMarieFlee:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterScoop:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterScoopNoRoom:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterScoopNoScoop:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterSurrenderRefused:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterTonicConsumedGood:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterTonicConsumedStrange:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterTradeCompleted:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterYouLose:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EncounterYouWin:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentAlreadyOwn:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentBuy:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentEscapePod:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentExtraBaysInUse:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EqipmentFuelCompactor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentHiddenCompartments:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentIF:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentLightningShield:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentMorgansLaser:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentNotEnoughSlots:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentQuantumDisruptor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .EquipmentSell:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .FleaBuilt:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameAbandonConfirm:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameClearHighScores:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndBoughtMoon:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndBoughtMoonGirl:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndHighScoreAchieved:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndHighScoreCheat:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndHighScoreMissed:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndKilled:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndRetired:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameEndScore:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .GameRetire:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .InsuranceNoEscapePod:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .InsurancePayoff:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .InsuranceStop:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailConvicted:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailFleaReceived:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailHiddenCargoBaysRemoved:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailIllegalGoodsImpounded:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailInsuranceLost:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailMercenariesLeave:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JailShipSold:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .JarekTakenHome:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .LeavingIFInsurance:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .LeavingIFMercenaries:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .LeavingIFWormholeTax:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .MeetCaptainAhab:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .MeetCaptainConrad:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .MeetCaptainHuie:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .NewGameConfirm:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .NewGameMoreSkillPoints:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .PreciousHidden:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .PrincessTakenHome:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorConfiscated:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorDestroyed:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorOnBoard:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorMeltdown:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorWarningFuelGone:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ReactorWarningTemp:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SculptureConfiscated:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SculptureSaved:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyConfirm:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyCrewQuarters:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyIF:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyIFTransfer:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyNoSlots:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyNotAvailable:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyNoTransfer:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyPassengerQuarters:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyReactor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipBuyTransfer:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipDesignIF:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipDesignThanks:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .ShipHullUpgraded:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialCleanRecord:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialExperimentPerformed:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialIF:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialMoonBought:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialNoQuarters:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialNotEnoughBays:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerConcernedJarek:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerConcernedPrincess:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerConcernedWild:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerImpatientJarek:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerImpatientPrincess:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerImpatientWild:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialPassengerOnBoard:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialSealedCanisters:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialSkillIncrease:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialSpacetimeFabricRip:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .SpecialTrainingCompleted:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TravelArrival:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TravelUneventfulTrip:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesAllDied:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesAteFood:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesGone:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesHalfDied:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesKilled:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesMostDead:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesOwn:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesRemoved:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesInspector:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesSqueak:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .TribblesTradeIn:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildArrested:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildChatsPirates:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildGoesPirates:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildLeavesShip:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildSculpture:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildWontBoardLaser:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildWontBoardReactor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildWontStayAboardLaser:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        case .WildWontStayAboardReactor:
            self.header = ""
            self.text = ""
            self.yesButton = "OK"
            self.noButton = nil
        }
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