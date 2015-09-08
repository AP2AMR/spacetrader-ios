//
//  Enums.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/7/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

enum TechLevelType: String {
    case techLevel0 = "Pre-agricultural"
    case techLevel1 = "Agricultural"
    case techLevel2 = "Medieval"
    case techLevel3 = "Renaissance"
    case techLevel4 = "Early Industrial"
    case techLevel5 = "Industrial"
    case techLevel6 = "Post-industrial"
    case techLevel7 = "Hi-tech"
}

enum StatusType: String {
    case none = "under no particular pressure"
    case war = "at war"
    case plague = "ravaged by a plague"
    case drought = "suffering from a drought"
    case boredom = "suffering from extreme boredom"
    case cold = "suffering from a cold spell"
    case cropFailure = "suffering from a crop failure"
    case employment = "lacking enough workers"
}

enum PoliceRecord: String {
    case psychopathScore = "Psyco"
    case villainScore = "Villain"
    case criminalScore = "Criminal"
    case crookScore = "Crook"
    case dubiousScore = "Dubious"
    case cleanScore = "Clean"
    case lawfulScore = "Lawful"
    case trustedScore = "Trusted"
    case likedScore = "Liked"
    case heroScore = "Hero"
}

enum Reputation: String {
    case harmlessRep = "Harmless"
    case mostlyHarmlessRep = "Mostly Harmless"
    case poorRep = "Poor"
    case averageRep = "Average"
    case aboveAverageRep = "Above average"
    case competentRep = "Competent"
    case dangerousRep = "Dangerous"
    case deadlyRep = "Deadly"
    case eliteRep = "Elite"
}

enum DifficultyLevel: String {
    case beginner = "Beginner"
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hard"
    case impossible = "Impossible"
}

enum SpecialResourcesType: String {
    case specialResources1 = "Nothing special"
    case specialResources2 = "Mineral rich"
    case specialResources3 = "Mineral poor"
    case specialResources4 = "Desert"
    case specialResources5 = "Sweetwater oceans"
    case specialResources6 = "Rich soil"
    case specialResources7 = "Poor soil"
    case specialResources8 = "Rich fauna"
    case specialResources9 = "Lifeless"
    case specialResources10 = "Weird mushrooms"
    case specialResources11 = "Special herbs"
    case specialResources12 = "Artistic populace"
    case specialResources13 = "Warlike populace"
}

enum Activity: String {
    case absent = "Absent"
    case minimal = "Minimal"
    case few = "Few"
    case some = "Some"
    case moderate = "Moderate"
    case many = "Many"
    case abundant = "Abundant"
    case swarms = "Swarms"
}

enum MercenaryNames: String {
    case alyssa = "Alyssa"
    case armatur = "Armatur"
    case bentos = "Bentos"
    case c2u2 = "C2U2"
    case chiti = "Chi'Ti"
    case crystal = "Crystal"
    case dane = "Dane"
    case deirdre = "Deirdre"
    case doc = "Doc"
    case draco = "Draco"
    case iranda = "Iranda"
    case jeremiah = "Jeremiah"
    case jujubal = "Jujubal"
    case krydon = "Krydon"
    case luis = "Luis"
    case mercedez = "Mercedez"
    case milete = "Milete"
    case muril = "Muri-L"
    case mystyc = "Mystyc"
    case nandi = "Nandi"
    case orestes = "Orestes"
    case panco = "Pancho"
    case ps37 = "PS37"
    case quarck = "Quarck"
    case sosumi = "Sosumi"
    case uma = "Uma"
    case wesley = "Wesley"
    case wonton = "Wonton"
    case yorvick = "Yorvick"
    case zeethibal = "Zeethibal"
}

enum StarSystemID {
    case Acamar
    case Adahn          // The alternate personality for The Nameless One in "Planescape: Torment"
    case Aldea
    case Andevian
    case Antedi
    case Balosnee
    case Baratas
    case Brax			// One of the heroes in Master of Magic
    case Bretel         // This is a Dutch device for keeping your pants up.
    case Calondia
    case Campor
    case Capelle		// The city I lived in while programming this game
    case Carzon
    case Castor         // A Greek demi-god
    case Cestus
    case Cheron
    case Courteney      // After Courteney Cox...
    case Daled
    case Damast
    case Davlos
    case Deneb
    case Deneva
    case Devidia
    case Draylon
    case Drema
    case Endor
    case Esmee          // One of the witches in Pratchett's Discworld
    case Exo
    case Ferris         // Iron
    case Festen         // A great Scandinavian movie
    case Fourmi         // An ant, in French
    case Frolix         // A solar system in one of Philip K. Dick's novels
    case Gemulon
    case Guinifer		// One way of writing the name of king Arthur's wife
    case Hades          // The underworld
    case Hamlet         // From Shakespeare
    case Helena         // Of Troy
    case Hulst          // A Dutch plant
    case Iodine         // An element
    case Iralius
    case Janus          // A seldom encountered Dutch boy's name
    case Japori
    case Jarada
    case Jason          // A Greek hero
    case Kaylon
    case Khefka
    case Kira			// My dog's name
    case Klaatu         // From a classic SF movie
    case Klaestron
    case Korma          // An Indian sauce
    case Kravat         // Interesting spelling of the French word for "tie"
    case Krios
    case Laertes		// A king in a Greek tragedy
    case Largo
    case Lave			// The starting system in Elite
    case Ligon
    case Lowry          // The name of the "hero" in Terry Gilliam's "Brazil"
    case Magrat         // The second of the witches in Pratchett's Discworld
    case Malcoria
    case Melina
    case Mentar         // The Psilon home system in Master of Orion
    case Merik
    case Mintaka
    case Montor         // A city in Ultima III and Ultima VII part 2
    case Mordan
    case Myrthe         // The name of my daughter
    case Nelvana
    case Nix			// An interesting spelling of a word meaning "nothing" in Dutch
    case Nyle			// An interesting spelling of the great river
    case Odet
    case Og             // The last of the witches in Pratchett's Discworld
    case Omega          // The end of it all
    case Omphalos		// Greek for navel
    case Orias
    case Othello		// From Shakespeare
    case Parade         // This word means the same in Dutch and in English
    case Penthara
    case Picard         // The enigmatic captain from ST:TNG
    case Pollux         // Brother of Castor
    case Quator
    case Rakhar
    case Ran			// A film by Akira Kurosawa
    case Regulas
    case Relva
    case Rhymus
    case Rochani
    case Rubicum		// The river Ceasar crossed to get into Rome
    case Rutia
    case Sarpeidon
    case Sefalla
    case Seltrice
    case Sigma
    case Sol			// That's our own solar system
    case Somari
    case Stakoron
    case Styris
    case Talani
    case Tamus
    case Tantalos		// A king from a Greek tragedy
    case Tanuga
    case Tarchannen
    case Terosa
    case Thera          // A seldom encountered Dutch girl's name
    case Titan          // The largest moon of Jupiter
    case Torin          // A hero from Master of Magic
    case Triacus
    case Turkana
    case Tyrus
    case Umberlee		// A god from AD&D, which has a prominent role in Baldur's Gate
    case Utopia         // The ultimate goal
    case Vadera
    case Vagra
    case Vandor
    case Ventax
    case Xenon
    case Xerxes         // A Greek hero
    case Yew			// A city which is in almost all of the Ultima games
    case Yojimbo		// A film by Akira Kurosawa
    case Zalkon
    case Zuul			// From the first Ghostbusters movie
}

enum SizeType {
    
}

