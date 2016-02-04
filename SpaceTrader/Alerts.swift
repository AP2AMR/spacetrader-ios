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
    var returnBool: Bool            // do we need this?
    
    init(ID: AlertID, passedString: String) {
        
    }
    
//    case AlertType.Alert:
//    result	= (new FormAlert("^1", "^2", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.AntidoteOnBoard:
//    result	= (new FormAlert("Antidote", "Ten of your cargo bays now contain antidote for the Japori system.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.AntidoteDestroyed:
//    result	= (new FormAlert("Antidote Destroyed", "The antidote for the Japori system has been destroyed with your ship. You should return to ^1 and get some more.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.AntidoteTaken:
//    result	= (new FormAlert("Antidote Taken", "The Space Corps removed the antidote for Japori from your ship and delivered it, fulfilling your assignment.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.AppStart:
//    (new FormAlert("Space Trader for Windows", SPLASH_INDEX)).ShowDialog(owner);
//    break;
//				case AlertType.ArrivalBuyNewspaper:
//    result	= (new FormAlert("Buy Newspaper?", "The local newspaper costs ^1. Do you wish to buy a copy?", "Buy Newspaper", DialogResult.Yes, "Cancel", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArrivalIFFuel:
//    result	= (new FormAlert("No Full Tanks", "You do not have enough money to buy full tanks.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArrivalIFFuelRepairs:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough money to get a full tank or full hull repairs.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArrivalIFNewspaper:
//    result	= (new FormAlert("Can't Afford it!", "Sorry! A newspaper costs ^1 in this system. You don't have enough money!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArrivalIFRepairs:
//    result	= (new FormAlert("No Full Repairs", "You don't have enough money to get your hull fully repaired.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArtifactLost:
//    result	= (new FormAlert("Artifact Lost", "The alien artifact has been lost in the wreckage of your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ArtifactRelinquished:
//    result	= (new FormAlert("Artifact Relinquished", "The aliens take the artifact from you.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoIF:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough money to spend on any of these goods.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoNoEmptyBays:
//    result	= (new FormAlert("No Empty Bays", "You don't have any empty cargo holds available at the moment", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoNoneAvailable:
//    result	= (new FormAlert("Nothing Available", "None of these goods are available.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoNoneToSell:
//    result	= (new FormAlert("None To ^1", "You have none of these goods in your cargo bays.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoNotInterested:
//    result	= (new FormAlert("Not Interested", "Nobody in this system is interested in buying these goods.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CargoNotSold:
//    result	= (new FormAlert("Not Available", "That item is not available in this system.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ChartJump:
//    result	= (new FormAlert("Use Singularity?", "Do you wish to use the Portable Singularity to transport immediately to ^1?", "Use Singularity", DialogResult.Yes, "Don't use it", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.ChartJumpCurrent:
//    result	= (new FormAlert("Cannot Jump", "You are tracking the system where you are currently located. It's useless to jump to your current location.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ChartJumpNoSystemSelected:
//    result	= (new FormAlert("No System Selected", "To use the Portable Singularity, track a system before clicking on this button.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ChartTrackSystem:
//    result	= (new FormAlert("Track System?", "^1?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.ChartWormholeUnreachable:
//    result	= (new FormAlert("Wormhole Unreachable", "The wormhole to ^1 is only accessible from ^2.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.Cheater:
//    result	= (new FormAlert("Cheater!", "Cheaters never prosper!  (Well, not with that command, anyway.)", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.CrewFireMercenary:
//    result	= (new FormAlert("Fire Mercenary", "Are you sure you wish to fire ^1?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.CrewNoQuarters:
//    result	= (new FormAlert("No Quarters Available", "You do not have any crew quarters available for ^1.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtNoBuy:
//    result	= (new FormAlert("You Have A Debt", "You can't buy that as long as you have debts.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtNone:
//    result	= (new FormAlert("No Debt", "You have no debts.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtReminder:
//    result	= (new FormAlert("Loan Notification", "The Bank's  Loan Officer reminds you that your debt continues to accrue interest. You currently owe ^1.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtTooLargeGrounded:
//    result	= (new FormAlert("Large Debt", "Your debt is too large.  You are not allowed to leave this system until your debt is lowered.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtTooLargeLoan:
//    result	= (new FormAlert("Debt Too High", "Your debt is too high to get another loan.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtTooLargeTrade:
//    result	= (new FormAlert("Large Debt", "Your debt is too large.  Nobody will trade with you.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.DebtWarning:
//    result	= (new FormAlert("Warning: Large Debt", "Your debt is getting too large. Reduce it quickly or your ship will be put on a chain!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.Egg:
//    result	= (new FormAlert("Egg", "Congratulations! An eccentric Easter Bunny decides to exchange your trade goods for a special present!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAliensSurrender:
//    result	= (new FormAlert("Surrender", "If you surrender to the aliens, they will take the artifact. Are you sure you wish to do that?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterArrested:
//    result	= (new FormAlert("Arrested", "You are arrested and taken to the space station, where you are brought before a court of law.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackCaptain:
//    result	= (new FormAlert("Really Attack?", "Famous Captains get famous by, among other things, destroying everyone who attacks them. Do you really want to attack?", "Really Attack", DialogResult.Yes, "OK, I Won't", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackNoDisruptors:
//    result	= (new FormAlert("No Disabling Weapons", "You have no disabling weapons! You would only be able to destroy your opponent, which would defeat the purpose of your quest.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackNoLasers:
//    result	= (new FormAlert("No Hull-Damaging Weapons", "You only have disabling weapons, but your opponent cannot be disabled!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackNoWeapons:
//    result	= (new FormAlert("No Weapons", "You can't attack without weapons!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackPolice:
//    result	= (new FormAlert("Attack Police", "Are you sure you wish to attack the police? This will turn you into a criminal!", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterAttackTrader:
//    result	= (new FormAlert("Attack Trader", "Are you sure you wish to attack the trader? This will immediately set your police record to dubious!", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterBothDestroyed:
//    result	= (new FormAlert("Both Destroyed", "You and your opponent have managed to destroy each other.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterDisabledOpponent:
//    result	= (new FormAlert("Opponent Disabled", "You have disabled your opponent. Without life support they'll have to hibernate. You notify Space Corps, and they come and tow the ^1 to the planet, where the crew is revived and then arrested. ^2", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterDrinkContents:
//    result	= (new FormAlert("Drink Contents?", "You have come across an extremely rare bottle of Captain Marmoset's Amazing Skill Tonic! The \"use-by\" date is illegible, but might still be good.  Would you like to drink it?", "Yes, Drink It", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterDumpAll:
//    result	= (new FormAlert("Dump All?", "You paid ^1 credits for these items. Are you sure you want to just dump them?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterDumpWarning:
//    Game.CurrentGame.LitterWarning	= true;
//    result	= (new FormAlert("Space Littering", "Dumping cargo in space is considered littering. If the police find your dumped goods and track them to you, this will influence your record. Do you really wish to dump?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterEscaped:
//    result	= (new FormAlert("Escaped", "You have managed to escape your opponent.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterEscapedHit:
//    result	= (new FormAlert("You Escaped", "You got hit, but still managed to escape.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterEscapePodActivated:
//    result	= (new FormAlert("Escape Pod Activated", "Just before the final demise of your ship, your escape pod gets activated and ejects you. After a few days, the Space Corps picks you up and drops you off at a nearby space port.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterLooting:
//    result	= (new FormAlert("Looting", "The pirates board your ship and transfer as much of your cargo to their own ship as their cargo bays can hold.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterMarieCeleste:
//    result	= (new FormAlert("Engage Marie Celeste", "The ship is empty: there is nothing in the ship's log, but the crew has vanished, leaving food on the tables and cargo in the holds. Do you wish to offload the cargo to your own holds? ", "Yes, Take Cargo", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterMarieCelesteNoBribe:
//    result	= (new FormAlert("No Bribe", "We'd love to take your money, but Space Command already knows you've got illegal goods onboard.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterOpponentEscaped:
//    result	= (new FormAlert("Opponent Escaped", "Your opponent has managed to escape.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPiratesBounty:
//    result	= (new FormAlert("Bounty", "You ^1 the pirate ship^2 and earned a bounty of ^3.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPiratesExamineReactor:
//    result	= (new FormAlert("Pirates Examine Reactor", "The pirates poke around the Ion Reactor while trying to figure out if it's valuable. They finally conclude that the Reactor is worthless, not to mention dangerous, and leave it on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPiratesFindNoCargo:
//    result	= (new FormAlert("Pirates Find No Cargo", "The pirates are very angry that they find no cargo on your ship. To stop them from destroying you, you have no choice but to pay them an amount equal to 5% of your current worth - ^1.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPiratesSurrenderPrincess:
//    result	= (new FormAlert("You Have the Princess", "Pirates are not nice people, and there's no telling what they might do to the Princess. Better to die fighting than give her up to them!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPiratesTakeSculpture:
//    result	= (new FormAlert("Pirates Take Sculpture", "As the pirates ransack your ship, they find the stolen sculpture. \"This is worth thousands!\" one pirate exclaims, as he stuffs it into his pack.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceBribe:
//    result	= (new FormAlert("Bribe", "These police officers are willing to forego inspection for the amount of ^1.", "Offer Bribe", DialogResult.Yes, "Forget It", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceBribeCant:
//    result	= (new FormAlert("No Bribe", "These police officers can't be bribed.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceBribeLowCash:
//    result	= (new FormAlert("Not Enough Cash", "You don't have enough cash for a bribe.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceFine:
//    result	= (new FormAlert("Caught", "The police discovers illegal goods in your cargo holds. These goods impounded and you are fined ^1 credits.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceNothingFound:
//    result	= (new FormAlert("Nothing Found", "The police find nothing illegal in your cargo holds, and apologize for the inconvenience.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceNothingIllegal:
//    result	= (new FormAlert("You Have Nothing Illegal", "Are you sure you want to do that? You are not carrying illegal goods, so you have nothing to fear!", "Yes, I still want to", DialogResult.Yes, "OK, I won't", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceSubmit:
//    result	= (new FormAlert("You Have Illegal Goods", "Are you sure you want to let the police search you? You are carrying ^1! ^2", "Yes, let them", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPoliceSurrender:
//    result	= (new FormAlert("Surrender", "^1If you surrender, you will spend some time in prison and will have to pay a hefty fine. ^2Are you sure you want to do that?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPostMarie:
//    result	= (new FormAlert("Contraband Removed", "The Customs Police confiscated all of your illegal cargo, but since you were cooperative, you avoided stronger fines or penalties.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterPostMarieFlee:
//    result	= (new FormAlert("Criminal Act!", "Are you sure you want to do that? The Customs Police know you have engaged in criminal activity, and will report it!", "Yes, I still want to", DialogResult.Yes, "OK, I won't", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterScoop:
//    result	= (new FormAlert("Scoop Canister", "A canister from the destroyed ship, labeled ^1, drifts within range of your scoops.", "Pick It Up", DialogResult.Yes, "Let It Go", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterScoopNoRoom:
//    result	= (new FormAlert("No Room To Scoop", "You don't have any room in your cargo holds. Do you wish to jettison goods to make room, or just let it go.", "Make Room", DialogResult.Yes, "Let it go", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterScoopNoScoop:
//    result	= (new FormAlert("No Scoop", "You regret finding nothing in your holds that can be dumped, and let the canister go.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterSurrenderRefused:
//    result	= (new FormAlert("To The Death!", "Surrender? Hah! We want your HEAD!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterTonicConsumedGood:
//    result	= (new FormAlert("Tonic Consumed", "Mmmmm. Captain Marmoset's Amazing Skill Tonic not only fills you with energy, but tastes like a fine single-malt." + Environment.NewLine, "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterTonicConsumedStrange:
//    result	= (new FormAlert("Tonic Consumed", "While you don't know what it was supposed to taste like, you get the feeling that this dose of tonic was a bit off.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterTradeCompleted:
//    result	= (new FormAlert("Trade Completed", "Thanks for ^1 the ^2. It's been a pleasure doing business with you.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterYouLose:
//    result	= (new FormAlert("You Lose", "Your ship has been destroyed by your opponent.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EncounterYouWin:
//    result	= (new FormAlert("You Win", "You have destroyed your opponent.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentAlreadyOwn:
//    result	= (new FormAlert("You Already Have One", "It's not useful to buy more than one of this item.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentBuy:
//    result	= (new FormAlert("Buy ^1", "Do you wish to buy this item for ^2 credits?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentEscapePod:
//    result	= (new FormAlert("Escape Pod", "Do you want to buy an escape pod for 2000 credits?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentExtraBaysInUse:
//    result	= (new FormAlert("Cargo Bays Full", "The extra cargo bays are still filled with goods. You can only sell them when they're empty.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentFuelCompactor:
//    result	= (new FormAlert("Fuel Compactor", "You now have a fuel compactor installed on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentHiddenCompartments:
//    result	= (new FormAlert("Hidden Compartments", "You now have hidden compartments equivalent to 5 extra cargo bays installed in your ship. Police won't find illegal cargo hidden in these compartments.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentIF:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough money to spend on this item.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentLightningShield:
//    result	= (new FormAlert("Lightning Shield", "You now have one lightning shield installed on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentMorgansLaser:
//    result	= (new FormAlert("Morgan's Laser", "You now have Henry Morgan's special laser installed on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentNotEnoughSlots:
//    result	= (new FormAlert("Not Enough Slots", "You have already filled all of your available slots for this type of item.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentQuantumDisruptor:
//    result	= (new FormAlert("Quantum Disruptor", "You now have one quantum disruptor installed on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.EquipmentSell:
//    result	= (new FormAlert("Sell Item", "Are you sure you want to sell this item?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.FileErrorOpen:
//    result	= (new FormAlert("Error", "An error occurred while trying to open ^1." + Environment.NewLine + Environment.NewLine + "^2", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.FileErrorSave:
//    result	= (new FormAlert("Error", "An error occurred while trying to save ^1." + Environment.NewLine + Environment.NewLine + "^2", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.FleaBuilt:
//    result	= (new FormAlert("Flea Built", "In 3 days and with 500 credits, you manage to convert your pod into a Flea.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameAbandonConfirm:
//    result	= (new FormAlert("Are You Sure?", "Are you sure you want to abandon your current game?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameClearHighScores:
//    result	= (new FormAlert("Clear High Scores", "Are you sure you wish to clear the high score table?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndBoughtMoon:
//    (new FormAlert("You Have Retired", (int)GameEndType.BoughtMoon)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndBoughtMoonGirl:
//    (new FormAlert("You Have Retired with the Princess", (int)GameEndType.BoughtMoonGirl)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndHighScoreAchieved:
//    result	= (new FormAlert("Congratulations!", "You have made the high-score list!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndHighScoreCheat:
//    result	= (new FormAlert("Naughy, Naughty!", "You would have made the high-score list if you weren't a Cheat!.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndHighScoreMissed:
//    result	= (new FormAlert("Sorry", "Alas! This is not enough to enter the high-score list.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndKilled:
//    (new FormAlert("You Are Dead", (int)GameEndType.Killed)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndRetired:
//    (new FormAlert("You Have Retired", (int)GameEndType.Retired)).ShowDialog(owner);
//    break;
//				case AlertType.GameEndScore:
//    result	= (new FormAlert("Score", "You achieved a score of ^1.^2%.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.GameRetire:
//    result	= (new FormAlert("Retire", "Are you sure you wish to retire?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.InsuranceNoEscapePod:
//    result	= (new FormAlert("No Escape Pod", "Insurance isn't useful for you, since you don't have an escape pod.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.InsurancePayoff:
//    result	= (new FormAlert("Insurance", "Since your ship was insured, the bank pays you the total worth of the destroyed ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.InsuranceStop:
//    result	= (new FormAlert("Stop Insurance", "Do you really wish to stop your insurance and lose your no-claim?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailConvicted:
//    result	= (new FormAlert("Convicted", "You are convicted to ^1 in prison and a fine of ^2.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailFleaReceived:
//    result	= (new FormAlert("Flea Received", "When you leave prison, the police have left a second-hand Flea for you so you can continue your travels.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailHiddenCargoBaysRemoved:
//    result	= (new FormAlert("Hidden Compartments Removed", "When your ship is impounded, the police go over it with a fine-toothed comb. You hidden compartments are found and removed.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailIllegalGoodsImpounded:
//    result	= (new FormAlert("Illegal Goods Impounded", "The police also impound all of the illegal goods you have on board.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailInsuranceLost:
//    result	= (new FormAlert("Insurance Lost", "Since you cannot pay your insurance while you're in prison, it is retracted.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailMercenariesLeave:
//    result	= (new FormAlert("Mercenaries Leave", "Any mercenaries who were traveling with you have left.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JailShipSold:
//    result	= (new FormAlert("Ship Sold", "Because you don't have the credits to pay your fine, your ship is sold.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.JarekTakenHome:
//    result	= (new FormAlert("Jarek Taken Home", "The Space Corps decides to give ambassador Jarek a lift home to Devidia.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.LeavingIFInsurance:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough cash to pay for your insurance.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.LeavingIFMercenaries:
//    result	= (new FormAlert("Pay Mercenaries", "You don't have enough cash to pay your mercenaries to come with you on this trip. Fire them or make sure you have enough cash.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.LeavingIFWormholeTax:
//    result	= (new FormAlert("Wormhole Tax", "You don't have enough money to pay for the wormhole tax.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.MeetCaptainAhab:
//    result	= (new FormAlert("Meet Captain Ahab", "Captain Ahab is in need of a spare shield for an upcoming mission. He offers to trade you some piloting lessons for your reflective shield. Do you wish to trade?", "Yes, Trade Shield", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.MeetCaptainConrad:
//    result	= (new FormAlert("Meet Captain Conrad", "Captain Conrad is in need of a military laser. She offers to trade you some engineering training for your military laser. Do you wish to trade?", "Yes, Trade Laser", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.MeetCaptainHuie:
//    result	= (new FormAlert("Meet Captain Huie", "Captain Huie is in need of a military laser. She offers to exchange some bargaining training for your military laser. Do you wish to trade?", "Yes, Trade Laser", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.NewGameConfirm:
//    result	= (new FormAlert("New Game", "Are you sure you wish to start a new game?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.NewGameMoreSkillPoints:
//    result	= (new FormAlert("More Skill Points", "You haven't awarded all 20 skill points yet.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.OptionsNoGame:
//    result	= (new FormAlert("No Game Active", "You don't have a game open, so you can only change the default options.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.PreciousHidden:
//    result	= (new FormAlert("Precious Cargo Hidden", "You quickly hide ^1 in your hidden cargo bays before the pirates board your ship. This would never work with the police, but pirates are usually in more of a hurry.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.PrincessTakenHome:
//    result	= (new FormAlert("Princess Taken Home", "The Space Corps decides to give the Princess a ride home to Galvon since you obviously weren't up to the task.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorConfiscated:
//    result	= (new FormAlert("Police Confiscate Reactor", "The Police confiscate the Ion reactor as evidence of your dealings with unsavory characters.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorDestroyed:
//    result	= (new FormAlert("Reactor Destroyed", "The destruction of your ship was made much more spectacular by the added explosion of the Ion Reactor.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorOnBoard:
//    result	= (new FormAlert("Reactor", "Five of your cargo bays now contain the unstable Ion Reactor, and ten of your bays contain enriched fuel.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorMeltdown:
//    result	= (new FormAlert("Reactor Meltdown!", "Just as you approach the docking bay, the reactor explodes into a huge radioactive fireball!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorWarningFuel:
//    result	= (new FormAlert("Reactor Warning", "You notice the Ion Reactor has begun to consume fuel rapidly. In a single day, it has burned up nearly half a bay of fuel!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorWarningFuelGone:
//    result	= (new FormAlert("Reactor Warning", "The Ion Reactor is emitting a shrill whine, and it's shaking. The display indicates that it is suffering from fuel starvation.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ReactorWarningTemp:
//    result	= (new FormAlert("Reactor Warning", "The Ion Reactor is smoking and making loud noises. The display warns that the core is close to the melting temperature.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.RegistryError:
//    result	= (new FormAlert("Error...", "Error accessing the Registry: ^1", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SculptureConfiscated:
//    result	= (new FormAlert("Police Confiscate Sculpture", "The Police confiscate the stolen sculpture and return it to its rightful owner.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SculptureSaved:
//    result	= (new FormAlert("Sculpture Saved", "On your way to the escape pod, you grab the stolen sculpture. Oh well, at least you saved something.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyConfirm:
//    result	= (new FormAlert("Buy New Ship", "Are you sure you wish to trade in your ^1 for a new ^2^3?", "Yes", DialogResult.Yes, "No", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyCrewQuarters:
//    result	= (new FormAlert("Too Many Crewmembers", "The new ship you picked doesn't have enough quarters for all of your crewmembers. First you will have to fire one or more of them.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyIF:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough money to buy this ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyIFTransfer:
//    result	= (new FormAlert("Not Enough Money", "You won't have enough money to buy this ship and pay the cost to transfer all of your unique equipment. You should choose carefully which items you wish to transfer!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyNoSlots:
//    result	= (new FormAlert("Can't Transfer Item", "If you trade your ship in for a ^1, you won't be able to transfer your ^2 because the new ship has insufficient ^3 slots!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyNotAvailable:
//    result	= (new FormAlert("Ship Not Available", "That type of ship is not available in the current system.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyNoTransfer:
//    result	= (new FormAlert("Can't Transfer Item", "Unfortunately, if you make this trade, you won't be able to afford to transfer your ^1 to the new ship!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyPassengerQuarters:
//    result	= (new FormAlert("Passenger Needs Quarters", "You must get a ship with enough crew quarters so that ^1 can stay on board.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyReactor:
//    result	= (new FormAlert("Shipyard Engineer", "Sorry! We can't take your ship as a trade-in. That Ion Reactor looks dangerous, and we have no way of removing it. Come back when you've gotten rid of it.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipBuyTransfer:
//    result	= (new FormAlert("Transfer ^1", "I'll transfer your ^2 to your new ship for ^3 credits.", "Do it!", DialogResult.Yes, "No thanks", DialogResult.No, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipDesignIF:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough money to create this design.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipDesignThanks:
//    result	= (new FormAlert("Thank you!", "^1 thanks you for your business!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.ShipHullUpgraded:
//    result	= (new FormAlert("Hull Upgraded", "Technicians spend the day retrofitting the hull of your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialCleanRecord:
//    result	= (new FormAlert("Clean Record", "The hacker resets your police record to Clean.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialExperimentPerformed:
//    result	= (new FormAlert("Experiment Performed", "The galaxy is abuzz with news of a terrible malfunction in Dr. Fehler's laboratory. Evidently, he was not warned in time and he performed his experiment... with disastrous results!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialIF:
//    result	= (new FormAlert("Not Enough Money", "You don't have enough cash to spend to accept this offer.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialMoonBought:
//    result	= (new FormAlert("Moon Bought", "You bought a moon in the Utopia system. Go there to claim it.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialNoQuarters:
//    result	= (new FormAlert("No Free Quarters", "There are currently no free crew quarters on your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialNotEnoughBays:
//    result	= (new FormAlert("Not Enough Bays", "You don't have enough empty cargo bays at the moment.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerConcernedJarek:
//    result	= (new FormAlert("Ship's Comm.", "Commander? Jarek here. Do you require any assitance in charting a course to Devidia?", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerConcernedPrincess:
//    result	= (new FormAlert("Ship's Comm.", "[Ziyal] Oh Captain? (giggles) Would it help if I got out and pushed?", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerConcernedWild:
//    result	= (new FormAlert("Ship's Comm.", "Bridge? This is Jonathan. Are we there yet? Heh, heh. Sorry, I couldn't resist.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerImpatientJarek:
//    result	= (new FormAlert("Ship's Comm.", "Captain! This is the Ambassador speaking. We should have been there by now?!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerImpatientPrincess:
//    result	= (new FormAlert("Ship's Comm.", "Sir! Are you taking me home or merely taking the place of my previous captors?!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerImpatientWild:
//    result	= (new FormAlert("Ship's Comm.", "Commander! Wild here. What's taking us so long?!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialPassengerOnBoard:
//    result	= (new FormAlert("Passenger On Board", "You have taken ^1 on board. While on board ^1 will lend you expertise, but may stop helping if the journey takes too long.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialSealedCanisters:
//    result	= (new FormAlert("Sealed Canisters", "You bought the sealed canisters and put them in your cargo bays.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialSkillIncrease:
//    result	= (new FormAlert("Skill Increase", "The alien increases one of your skills. ", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialTimespaceFabricRip:
//    result	= (new FormAlert("Timespace Fabric Rip", "You have flown through a tear in the timespace continuum caused by Dr. Fehler's failed experiment. You may not have reached" + Environment.NewLine + " your planned destination!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.SpecialTrainingCompleted:
//    result	= (new FormAlert("Training Completed", "After a few hours of training with a top expert, you feel your abilities have improved significantly.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TravelArrival:
//    result	= (new FormAlert("Arrival", "You arrive at your destination.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TravelUneventfulTrip:
//    result	= (new FormAlert("Uneventful Trip", "After an uneventful trip, you arrive at your destination.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesAllDied:
//    result	= (new FormAlert("All The Tribbles Died", "The radiation from the Ion Reactor is deadly to Tribbles. All of the Tribbles on board your ship have died.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesAteFood:
//    result	= (new FormAlert("Tribbles Ate Food", "You find that, instead of food, some of your cargo bays contain only tribbles!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesGone:
//    result	= (new FormAlert("No More Tribbles", "The alien uses his alien technology to beam over your whole collection of tribbles to his ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesHalfDied:
//    result	= (new FormAlert("Half The Tribbles Died", "The radiation from the Ion Reactor seems to be deadly to Tribbles. Half the Tribbles on board died.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesKilled:
//    result	= (new FormAlert("Tribbles Killed", "Your tribbles all died in the explosion.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesMostDied:
//    result	= (new FormAlert("Most Tribbles Died", "You find that, instead of narcotics, some of your cargo bays contain only dead tribbles!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesOwn:
//    result	= (new FormAlert("A Tribble", "You are now the proud owner of a little, cute, furry tribble.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesRemoved:
//    result	= (new FormAlert("Tribbles Removed", "The tribbles were sold with your ship.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesInspector:
//    result	= (new FormAlert("Space Port Inspector", "Our scan reports you have ^1 tribbles on board your ship. Tribbles are pests worse than locusts! You are running the risk of getting a hefty fine!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesSqueek:
//    result	= (new FormAlert("A Tribble", "Squeek!", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.TribblesTradeIn:
//    result	= (new FormAlert("You've Got Tribbles", "Hm. I see you got a tribble infestation on your current ship. I'm sorry, but that severely reduces the trade-in price.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildArrested:
//    result	= (new FormAlert("Wild Arrested", "Jonathan Wild is arrested, and taken away to stand trial.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildChatsPirates:
//    result	= (new FormAlert("Wild Chats With Pirates", "The Pirate Captain turns out to be an old associate of Jonathan Wild's. They talk about old times, and you get the feeling that Wild would switch ships if the Pirates had any quarters available.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildGoesPirates:
//    result	= (new FormAlert("Wild Goes With Pirates", "The Pirate Captain turns out to be an old associate of Jonathan Wild's, and invites him to go to Kravat aboard the Pirate ship. Wild accepts the offer and thanks you for the ride.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildLeavesShip:
//    result	= (new FormAlert("Wild Leaves Ship", "Jonathan Wild leaves your ship, and goes into hiding on ^1.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildSculpture:
//    result	= (new FormAlert("Wild Eyes Sculpture", "Jonathan Wild sees the stolen sculpture. \"Wow, I only know of one of these left in the whole Universe!\" he exclaims, \"Geurge Locas must be beside himself with it being stolen.\" He seems very impressed with you, which makes you feel much better about the item your delivering.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildWontBoardLaser:
//    result	= (new FormAlert("Wild Won't Board Ship", "Jonathan Wild isn't willing to go with you if you're not armed with at least a Beam Laser. He'd rather take his chances hiding out here." + Environment.NewLine, "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildWontBoardReactor:
//    result	= (new FormAlert("Wild Won't Board Ship", "Jonathan Wild doesn't like the looks of that Ion Reactor. He thinks it's too dangerous, and won't get on board.", "Ok", DialogResult.OK, null, DialogResult.None, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildWontStayAboardLaser:
//    result	= (new FormAlert("Wild Won't Stay Aboard", "Jonathan Wild isn't about to go with you if you're not armed with at least a Beam Laser. He'd rather take his chances hiding out here on ^1." + Environment.NewLine, "Say Goodbye to Wild", DialogResult.OK, "Cancel", DialogResult.Cancel, args)).ShowDialog(owner);
//    break;
//				case AlertType.WildWontStayAboardReactor:
//    result	= (new FormAlert("Wild Won't Stay Aboard", "Jonathan Wild isn't willing to go with you if you bring that Reactor on board. He'd rather take his chances hiding out here on ^1." + Environment.NewLine, "Say Goodbye to Wild", DialogResult.OK, "Cancel", DialogResult.Cancel, args)).ShowDialog(owner);
//    break;
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