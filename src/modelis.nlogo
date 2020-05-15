extensions [
  profiler
  csv
  py
]

breed [ foodsources foodsource ]
breed [ colonies colony ]
breed [ bees bee ]
breed [ species oneSpecies ] ; to keep species specific parameters (such as life span, max eggs, handling times etc)
breed [ badgers badger ]
breed [ signs sign ]
breed [ storebars storebar ]
breed [ deadCols deadCol]    ; deadCols store the data of all dead colonies


;..................................................................................


bees-own
[
  activity ;"hibernate", "nestConstruction", "resting", "searching", "returningEmpty", "returningUnhappyN", "returningUnhappyP", "nectarForaging", "collectNectar", "bringingNectar", "expForagingN", "pollenForaging", "collectPollen", "bringingPollen", "expForagingP", "egglaying", "nursing"
  activityList
  adultAge
  allelesList     ; list with 1 (males) or 2 (females, dipl. males) alleles, if InbreedingEffects? true they refer to the sex alleles with diploid males dying as adults
  brood? ; true: brood, false: adult
  broodAge
  caste    ; "undefined", "queen", "worker", "male"
  colonyID
  cropvolume_myl
  cumulIncubationReceived_kJ
  cumulTimeEgg_d
  cumulTimeLarva_d
  cumulTimePupa_d
  currentFoodsource
  emergingDate  ; day of emergence from hibernation in ticks
  expectation_NectarTrip_s
  expectation_PollenTrip_s
  glossaLength_mm
  knownMasterpatchesNectarList ; lists the masterpatchID's of all nectar providing patches ('layergroups') sorted by the distance to the bee's colony
  knownMasterpatchesPollenList ; similar for pollen
  mated?
  mtDNA
  nectarLoadSquadron_kJ
  nectarsourceToGoTo
  number
  personalTime_s
  ploidy   ; 1: haploid male, 2: diploid female (or diploid male)
  pollenForager?
  pollenLoadSquadron_g
  pollenPellets_g
  pollensourceToGoTo
  speciesID
  speciesName
  spermathecaList
  stage    ; egg, larva, pupa, adult
  thEgglaying
  thForagingNectar
  thForagingPollen
  thNursing
  weight_mg
  age
  ploidy
  number
  numberDied
  invadedByMiteOrganiserID
  maxLifespanWorkersOwn ;vv changed


]



;..................................................................................


colonies-own ; colony and species specific variables  ; COPY ANY CHANGES TO DEADCOLS-OWN VARIABLES
[
  ;beehave varroa
  workerCellListCondensed
  droneCellListCondensed
  cohortInvadedMitesSum
  invadedMitesHealthyRate
  invadedDroneCohortID
  invadedWorkerCohortID
  mite_age
  ploidy
  number
  numberDied
  invadedByMiteOrganiserID
  ;beehave varroa end
  allAdultActiveQueens
  allAdultMales
  allAdultQueens
  allAdults
  allAdultWorkers
  allEggs
  allLarvae
  allPatchesInRangeList
  allPupae
  allSourcesInFlowerAndRangeList  ; all foodsources (including 'layers') within the foraging range that provide nectar a/o pollen, updated, whenever a foodsource has a start or a stop day
  broodDeathBadger
  broodDeathEndSeason
  broodDeathsCP
  broodDeathsEnergyStores
  broodDeathsNoAdults
  cohortBased?
  colonyAge
  colonyFoundationDay
  colonysize
  colonyWeight_mg
  competitionPointDate
  eggDeathsIncubation
  energyNeedToday_kJ
  energyStore_kJ
  eusocialPhaseDate   ; emergence of the the first worker (Duchateau & Velthuis 1988)
  idealEnergyStore_kJ
  idealPollenStore_g
  larvaDeathsIncubation
  larvaDeathsWeight
  larvaWorkerRatio
  masterpatchesInRangeList ; all masterpatches within foraging range, determined only once, when colony is created
  masterpatchesWithNectarlayersInFlowerAndRangeList ; all masterpatches within the foraging range where at least one layer provides nectar today (in principle, i.e. it might become depleted during a day); updated, whenever a foodsource has a start or a stop day
  masterpatchesWithPollenlayersInFlowerAndRangeList ; ditto for pollen
  nectarInFlowerAndRangeList
  pollenInFlowerAndRangeList
  pollenNeedLarvaeToday_g
  pollenStore_g
  pupaDeathsIncubation
  queenProduction?
  queenProductionDate  ; the first date when diploid larvae eggs were laid that can develop into queens
  queenright?
  speciesIDcolony
  stimEgglaying
  stimNectarForaging
  stimNursing
  stimPollenForaging
  summedIncubationToday_kJ
  switchPointDate
  totalAdultsProduced
  totalEggsProduced
  totalLarvaeProduced
  totalMalesProduced
  totalPupaeProduced
  totalQueensProduced
  totalWorkersProduced






  ;beehave imports
  TotalBeesAdded
    ; beekeeper can add bees in autumn, these are added up as long
    ; as simulation runs
  TotalDroneEggs
  TotalDroneLarvae
  TotalDronePupae
  TotalDrones
  TotalEventsToday         ; sum of todays "xxxFlightsToday"
  TotalForagers
  ;TotalFPdetectionProb
 ; TotalHoneyFed_kg
    ; if "beekeeper" has to feed the colony, fed honey is added up as long
    ; as simulation runs
  ;TotalHoneyHarvested_kg
  TotalIHbees
  TotalMites
  TotalPollenAdded
    ; beekeeper can add pollen in spring, which is added up as long
    ; as simulation runs
  ;TotalWeightBees_kg ; weight of all bees (brood, adults, drones..)
  TotalWorkerAndDroneBrood

  allForagers ;vv
  LAST_SWARM_AGO ;v


  number_infectedAsPupa
  number_infectedAsAdult
  number_healthy

  workerCellListCondensed
  droneCellListCondensed
  cohortInvadedMitesSum
  invadedMitesHealthyRate
  invadedDroneCohortID
  invadedWorkerCohortID
]



;Beehave import

breed [ hives hive ]
breed [ eggCohorts eggCohort]
breed [ larvaeCohorts larvaeCohort]
breed [ pupaeCohorts pupaeCohort]
breed [ IHbeeCohorts IHbeeCohort]  ; in-hive bee
breed [ droneEggCohorts droneEggCohort]
breed [ droneLarvaeCohorts droneLarvaeCohort]
breed [ dronePupaeCohorts dronePupaeCohort]
breed [ droneCohorts droneCohort]
breed [ foragerSquadrons foragerSquadron ]
   ; small group of foragers, groupsize: SQUADRON_SIZE
breed [ miteOrganisers miteOrganiser ]
   ; keep track of mites in brood cells
breed [ flowerPatches flowerPatch]

turtles-own ; all cohorts below have these variables too
[
  age
  age_mites
  ploidy
  number
  numberDied
  invadedByMiteOrganiserID
]

miteOrganisers-own
[
  workerCellListCondensed
  droneCellListCondensed
  cohortInvadedMitesSum
  invadedMitesHealthyRate
  invadedDroneCohortID
  invadedWorkerCohortID
]



deadCols-own ; stores the data of all dead colonies
[
  ;beehave varroa
  workerCellListCondensed
  droneCellListCondensed
  cohortInvadedMitesSum
  invadedMitesHealthyRate
  invadedDroneCohortID
  invadedWorkerCohortID
  mite_age
  ploidy
  number
  numberDied
  invadedByMiteOrganiserID
  ;beehave varroa end
  colonyDeathDay ; only deadCols-own variable that is not defined for colonies
  allAdultActiveQueens
  allAdultMales
  allAdultQueens
  allAdults
  allAdultWorkers
  allEggs
  allLarvae
  allPatchesInRangeList
  allPupae
  allSourcesInFlowerAndRangeList  ; all foodsources (including 'layers') within the foraging range that provide nectar a/o pollen, updated, whenever a foodsource has a start or a stop day
  broodDeathBadger
  broodDeathEndSeason
  broodDeathsCP
  broodDeathsEnergyStores
  broodDeathsNoAdults
  cohortBased?
  colonyAge
  colonyFoundationDay
  colonysize
  colonyWeight_mg
  competitionPointDate
  eggDeathsIncubation
  energyNeedToday_kJ
  energyStore_kJ
  eusocialPhaseDate   ; emergence of the the first worker (Duchateau & Velthuis 1988)
  idealEnergyStore_kJ
  idealPollenStore_g
  larvaDeathsIncubation
  larvaDeathsWeight
  larvaWorkerRatio
  masterpatchesInRangeList ; all masterpatches within foraging range, determined only once, when colony is created
  masterpatchesWithNectarlayersInFlowerAndRangeList ; all masterpatches within the foraging range where at least one layer provides nectar today (in principle, i.e. it might become depleted during a day); updated, whenever a foodsource has a start or a stop day
  masterpatchesWithPollenlayersInFlowerAndRangeList ; ditto for pollen
  nectarInFlowerAndRangeList
  pollenInFlowerAndRangeList
  pollenNeedLarvaeToday_g
  pollenStore_g
  pupaDeathsIncubation
  queenProduction?
  queenProductionDate  ; the first date when diploid larvae eggs were laid that can develop into queens
  queenright?
  speciesIDcolony
  stimEgglaying
  stimNectarForaging
  stimNursing
  stimPollenForaging
  summedIncubationToday_kJ
  switchPointDate
  totalAdultsProduced
  totalEggsProduced
  totalLarvaeProduced
  totalMalesProduced   ; renamed from allMalesProduced
  totalPupaeProduced
  totalQueensProduced  ; renamed from allQueensProduced
  totalWorkersProduced



  ;behave imports
  TotalBeesAdded
  ; beekeeper can add bees in autumn, these are added up as long
  ; as simulation runs
  TotalDroneEggs
  TotalDroneLarvae
  TotalDronePupae
  TotalDrones
;  TotalEventsToday         ; sum of todays "xxxFlightsToday"
  TotalForagers
;  TotalFPdetectionProb
  TotalHoneyFed_kg
    ; if "beekeeper" has to feed the colony, fed honey is added up as long
    ; as simulation runs
  TotalHoneyHarvested_kg
  TotalIHbees
  TotalMites
  TotalPollenAdded
    ; beekeeper can add pollen in spring, which is added up as long
    ; as simulation runs
  TotalWeightBees_kg ; weight of all bees (brood, adults, drones..)
  TotalWorkerAndDroneBrood


  allForagers ;vv


  number_infectedAsPupa
  number_infectedAsAdult
  number_healthy

  workerCellListCondensed
  droneCellListCondensed
  cohortInvadedMitesSum
  invadedMitesHealthyRate
  invadedDroneCohortID
  invadedWorkerCohortID


]

;..................................................................................

species-own
[
  batchsize
  chanceFindNest       ;chance of queen finding a nest site per day
  dev_larvalAge_QueenDetermination_d  ; day of larval development when female bee either develops into worker or queen (i.e. now independent of age of hatching from the egg!)
  dev_Q_DeterminationWeight_mg
  devAge_Q_EmergingMax_d
  devAge_Q_EmergingMin_d
  devAge_Q_PupationMax_d
  devAge_Q_PupationMin_d
  devAgeEmergingMax_d
  devAgeEmergingMin_d
  devAgeHatchingMax_d
  devAgeHatchingMin_d
  devAgePupationMax_d
  devAgePupationMin_d
  devIncubation_Q_EmergingTH_kJ
  devIncubation_Q_PupationTH_kJ
  devIncubationEmergingTH_kJ
  devIncubationHatchingTH_kJ
  devIncubationPupationTH_kJ
  devQuotaIncubationToday_kJ
  devWeight_Q_PupationMax_mg
  devWeight_Q_PupationMin_mg
  devWeightEgg_mg
  devWeightPupationMax_mg
  devWeightPupationMin_mg
  emergingDay_mean
  emergingDay_sd
  flightCosts_kJ/m/mg
  flightVelocity_m/s
  growthFactor
  maxLifespanWorkers
  minPollenStore_g
  minToMaxFactor
  name
  nestHabitatsList
  nestSiteArea
  nestsiteFoodsourceList       ; list of foodSources suitable for species nest sites
  pollenToBodymassFactor
  proboscis_max_mm
  proboscis_min_mm
  searchLength_m
  seasonStop
  specMax_cropVolume_myl   ; species maximum size of crop (regardless of weight)
  specMax_pollenPellets_g  ; species maximum size of pellets (regardless of weight)
  timeUnloading
]


;..................................................................................


foodsources-own
[
  area_sqm
  colorMemo
  corollaDepth_mm ; (average) length of the corolla tubes
  cumulNectarVisits
  cumulPollenVisits
  flowerSpecies_relativeAbundanceList
  flowerSpeciesList
  id_Beescout
  interFlowerTime_s
  layersInPatchList ; lists who of all foodsources what belong to the same flower patch ('layergroup'), saved for masterpatches only
  masterpatch?   ; boolean, true for first layer in a 'layergroup'
  masterpatchID  ; the ID of the masterpatch of this layers' 'layergroup'
  nectar_myl
  nectarConcentration_mol/l
  nectarFlowerVolume_myl
  nectarMax_myl
  patchInfo ; short string with additional information for the user
  patchType
  pollen_g
  pollenMax_g
  proteinPollenProp
  radius_m
  startDay  ; first day of flowering period
  stopDay   ; first day AFTER the flowering period
]


;..................................................................................

patches-own
[
  nColonies
  nMalesProduced
  nQueensProduced
  pcolorSave
]

;..................................................................................



storebars-own
[
  maxSize
  store
  storeColonyID
]

;..................................................................................



globals
[
  ActiveBee
  ActiveBeesSortedList
  AssertionMessage   ; allow message to be recorded out by RNetLogo
  AssertionViolated
  CallItaDay_s
  CohortSymbolSize
  ColonyDeathsEndSeason     ; count of colonies removed due to the season ending
  ColonyDeathsNoBees        ; count of colonies removed due to no adult bees
  ColonyDensity_km2
  ColonySymbolSize
  ColorIBM
  DailyForagingPeriod_s
  DailySwitchProbability
  Date
  Day
  Daytime_s
  EnergyFactorOnFlower
  EnergyHoney_kJ/ml
  EnergyRequiredForPollenAssimilation_kJ_per_g
  EnergySucrose_kJ/mymol
  FoodsourcesInFlowerUpdate?  ; true on days when at least 1 foodsource starts or stops flowering
  FoodsourceSymbolSizeFactor
  ForagingRangeMax_m
  GetUpTime_s ; beginning of the working day
  LarvaWorkerRatioTH
  MaxLifespanMales
  MeanAdultWeight_mg
  MeanQueenWeight_mg
  MeanWorkerWeight_mg
  MetabolicRateFlight_W/kg
  MinFoodSourceSymbolSize
  MortalityForager_per_s
  MortalityAdultsBackground_daily
  N_ForeignAlleles
  NectarAvailableTotal_l
  NestSearchTime_h
  NotSetHigh   ; auxiliary variable with a high value
  NotSetLow    ; auxiliary variable with a low (i.e. negative) value
  PollenAvailableTotal_kg
  QueenDestinedEggsBeforeSP_d
  QueensProducingColoniesList
  QueenSymbolsize
  Scaling_NLpatches/m
  SpeciesList
  StepWidth ; for drawing colony cohorts
  Sunrise_s
  TotalActiveBees
  TotalAdultMales
  TotalAdultMalesEverProduced
  TotalAdultQueens
  TotalAdultQueensEverProduced
  TotalAdults
  TotalAdultsEverProduced
  TotalAdultWorkers
  TotalBeeAgents
  TotalBeesEverDied
  TotalBeesEverProduced
  TotalColonies
  TotalColoniesEverProduced ; number of colonies formed during a model run
  TotalEggs
  TotalFoodSources
  TotalForagingTripsToday
  TotalHibernatingQueens
  TotalHibernatingQueensEverRemoved
  TotalIBMColonies
  TotalLarvae
  TotalMales
  TotalMatedQueens
  TotalPupae
  TotalQueens
  TotalUnmatedQueens

  ;Beehave imports------------------------------------
  ABANDON_POLLEN_PATCH_PROB_PER_S
  AFF
  AFF_BASE
  AllDaysAllPatchesList
  BugAlarm
  ColonyDied
  ColonyTripDurationSum
  ColonyTripForagersSum
  CROPVOLUME
  CumulativeHoneyConsumption
  DailyForagingPeriod
  DailyHoneyConsumption
  DailyMiteFall
  DailyPollenConsumption_g
  DeathsAdultWorkers_t
  DeathsForagingToday
  DecentHoneyEnergyStore
  DRONE_EGGLAYING_START
  DRONE_EGGLAYING_STOP
  DRONE_EMERGING_AGE
  DRONE_HATCHING_AGE
  DRONE_LIFESPAN
  DRONE_PUPATION_AGE
  DRONE_EGGS_PROPORTION
  EMERGING_AGE
  EmptyFlightsToday
  ENERGY_HONEY_per_g
  ENERGY_SUCROSE
  ExcessBrood
  FIND_DANCED_PATCH_PROB
  FLIGHT_VELOCITY
  FLIGHTCOSTS_PER_m
  FORAGER_NURSING_CONTRIBUTION
  FORAGING_STOP_PROB
  ForagingRounds
  ForagingSpontaneousProb
  HarvestedHoney_kg
  HATCHING_AGE
  HONEY_STORE_INIT
  HoneyEnergyStore
  HoneyEnergyStoreYesterday
  HoPoMo_seasont
  InhivebeesDiedToday
  INVADING_DRONE_CELLS_AGE
  INVADING_WORKER_CELLS_AGE
  InvadingMitesDroneCellsReal
    ; actual number of mites invading the cells, might be
    ; lower than theor. number, if brood cells are crowded with mites
  InvadingMitesDroneCellsTheo
    ; theoretical number of mites invading the cells
  InvadingMitesWorkerCellsReal
  InvadingMitesWorkerCellsTheo  LAST_SEVEN_DAYS_WORKER_POP ;vv list to accumulate last seven tick worker count for swarming proc
  LIFESPAN
  LostBroodToday
    ; brood that die due to lack of nursing or lack of pollen today
  LostBroodTotal  ; .. and summed up
  MAX_AFF
  MAX_BROOD_NURSE_RATIO
  MAX_DANCE_CIRCUITS
  MAX_EGG_LAYING
  MAX_HONEY_ENERGY_STORE
  MAX_INVADED_MITES_DRONECELL
  MAX_INVADED_MITES_WORKERCELL
  MAX_PROPORTION_POLLEN_FORAGERS
  MAX_TOTAL_KM
  MIN_AFF
  MIN_IDEAL_POLLEN_STORE
  MITE_FALL_DRONECELL
  MITE_FALL_WORKERCELL
  MITE_MORTALITY_BROODPERIOD
  MITE_MORTALITY_WINTER
  MORTALITY_DRONE_EGGS
  MORTALITY_DRONE_LARVAE
  MORTALITY_DRONE_PUPAE
  MORTALITY_DRONES
  MORTALITY_DRONES_INFECTED_AS_PUPAE
  MORTALITY_EGGS
  MORTALITY_FOR_PER_SEC
  MORTALITY_INHIVE
  MORTALITY_INHIVE_INFECTED_AS_ADULT
  MORTALITY_INHIVE_INFECTED_AS_PUPA
  MORTALITY_LARVAE
  MORTALITY_PUPAE
  N_FLOWERPATCHES
  N_GENERIC_PLOTS
  NectarFlightsToday
  NewDroneEggs
  NewDroneLarvae
  NewDronePupae
  NewDrones
  NewDrones_healthy
  NewForagerSquadronsHealthy
  NewForagerSquadronsInfectedAsAdults
  NewForagerSquadronsInfectedAsPupae
  NewIHbees
  NewIHbees_healthy
  NewReleasedMitesToday
    ; all (healthy and infected) mites released from cells (mothers+offspring)
    ; on current day (calculated after MiteFall!)
  NewWorkerEggs
  NewWorkerLarvae
  NewWorkerPupae
  PATCHCOLOR
  PhoreticMites   ; all phoretic mites, healthy and infected
  PhoreticMitesHealthyRate
  POLLEN_DANCE_FOLLOWERS
  POLLEN_STORE_INIT
  PollenFlightsToday
  POLLENLOAD
  PollenStore_g_Yesterday
  POST_SWARMING_PERIOD
  PRE_SWARMING_PERIOD
  ProbPollenCollection
  PropNewToAllPhorMites
  PROTEIN_STORE_NURSES_d
  ProteinFactorNurses
  Pupae_W&D_KilledByVirusToday
    ; number of drone + worker pupae that were killed by the virus today
  PUPATION_AGE
  Queenage
  RecruitedFlightsToday
  SaveInvadedMODroneLarvaeToPupae
  SaveInvadedMOWorkerLarvaeToPupae
  SaveWhoDroneLarvaeToPupae
  SaveWhoWorkerLarvaeToPupae
  SEARCH_LENGTH_M
  SearchingFlightsToday
  SEASON_START             ; defines beginning of foraging period
  SEASON_STOP              ; end of foraging period & latest end of drone production
  SimpleDancing
  STEPWIDTHdrones
  SumLifeSpanAdultWorkers_t
  SummedForagerSquadronsOverTime
  SwarmingDate
  TIME_UNLOADING
  TIME_UNLOADING_POLLEN
  TodaysAllPatchesList
  TodaysSinglePatchList
  VIRUS_KILLS_PUPA_PROB
  VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA
    ; probability for an infected invaded mite to infect the bee pupa
  VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES
    ; probability for an infected bee pupa to infect healthy invaded mites
  WEIGHT_WORKER_g

  TotalTotalMites

  MAX_BROODCELLS
  ;END Beehave imports------------------------------------
  START_COLONY_SIZE

]


; ===============================================================================


; *******************************************************************************

to ParametersProc
  ;vv change these
  ; this procedure sets the GLOBAL parameters of the model
  set SpeciesList []
  if B_terrestris > 0 [ set SpeciesList fput "B_terrestris" SpeciesList]
  if B_pascuorum > 0 [ set SpeciesList fput "B_pascuorum" SpeciesList]
  if B_lapidarius > 0 [ set SpeciesList fput "B_lapidarius" SpeciesList]
  if B_hortorum > 0 [ set SpeciesList fput "B_hortorum" SpeciesList]
  if B_hypnorum > 0 [ set SpeciesList fput "B_hypnorum" SpeciesList]
  if B_pratorum > 0 [ set SpeciesList fput "B_pratorum" SpeciesList]
  if N_Psithyrus > 0 [ set SpeciesList fput "Psithyrus" SpeciesList]

  set AssertionViolated false
  set CallItaDay_s 24 * 3600 ; [s]
  set CohortSymbolSize 0.75 * MasterSizeFactor
  set ColonySymbolsize 9 * MasterSizeFactor
  set ColorIBM 24 ; (24 = dark orange)
  ;vv older set DailySwitchProbability 0.13  ; derived from Duchateau & Velthuis 1988 (50% of the (early switching) colonies switch within ca. 2*2.4d, i.e. 13% per day)
  set DailySwitchProbability 0.001  ; derived from Duchateau & Velthuis 1988 (50% of the (early switching) colonies switch within ca. 2*2.4d, i.e. 13% per day)


  set EnergyFactorOnFlower 0.3 ; for honeybees: Kacelnik et al 1986 (BES:19): 0.3 (rough estimation, based on Nunez 1982)
  set EnergyHoney_kJ/ml  22.67      ; 22.67 [kJ/ml] ; from B. vosnesenskii, Allen et al 1978 (J KANSAS ENTOMOLOGICAL SOCIETY; 51(3), 1978, pp. 329-342): Tab.2:
                                    ; 195ml honey contains 260g sugar; Energy Sucrose ca. 17 kJ/g; 260g * 17kJ/g = 4420 kJ energy stored in honey
                                    ; 4420kJ / 195ml = 22.67 kJ/ml (or 1 kJ = 0.04412 ml)
  ;set EnergyRequiredForPollenAssimilation_kJ_per_g 6.2 ;; Hrassnig, Crailsheim 2005 (honeybee larvae): consumes ca. 156.25 mg pollen (125-187.5 mg, Tab 1.) and 59.4 mg carbohydrates (Tab. 1, from Rortais et al 2005).
                                                       ;; Energy carbohydrates ca. 16.3 kJ/g (3.89kcal/g * 4.19 = 16.3 kJ/g (http://ndb.nal.usda.gov)),
                                                       ;; hence: energy from carbohydrates = 59.4mg * 16.3 kJ/g = 968.22 kJ to assimilate 156.25 mg pollen or 6.1966 kJ for 1 mg pollen
  set EnergyRequiredForPollenAssimilation_kJ_per_g 3.2 ;vv
  set EnergySucrose_kJ/mymol 0.00582       ; 0.00582 [kJ/micromol]   342.3 g/mol     from BEEHAVE
  set FoodsourcesInFlowerUpdate? true
  set FoodsourceSymbolSizeFactor 1.5 * MasterSizeFactor
  set ForagingRangeMax_m 758  ; 758m: Knight et al. 2005 ; 1500m: Osborne et al. 2008,
  set GetUpTime_s 1 ; 1 (i.e: 0:00:01 AM)
  set LarvaWorkerRatioTH 3 ; Duchateau & Velthuis 1988

  ;set MaxLifespanMales 30  ; 30d of aldult age; Duchateau & Marien 1995 Ins. Soc. 42:255-266 (1995): 30.48+-10.23; however: bees were kept in flight-cages hence most likely overestimating life span
  set MaxLifespanMales 37  ; beehave

  set MetabolicRateFlight_W/kg 488.6 ; Wolf et al. 1999 (Tab. 1, Open air: 488.6+-226.7 W/kg)
  set MinFoodSourceSymbolSize 2.5 * MasterSizeFactor
  if ForagingMortalityModel = "high" [ set MortalityForager_per_s 1.0E-05 ] ;  (BEEHAVE VALUE: 0.00001, from Visscher&Dukas 1997 (Mort 0.036 per hour foraging)
  if ForagingMortalityModel = "intermediate" [ set MortalityForager_per_s 2.14E-06 ] ;  (Schmid-Hempel & Heeb 1991: mortality (B. lucorum) 30-40% per week (=>35%), survival rate per week: 0.65
     ; assuming 8hrs foraging per day: 7 * 8 * 3600 = 201600 seconds, survival rate/s = 0.65^(1/201600) => mortality rate/s 2.14E-06
  if ForagingMortalityModel = "low" [ set MortalityForager_per_s 2.75E-07 ] ;  Stelzer et al. 2010 (B. terrestris) (doi:10.1111/j.1469-7998.2010.00709.x), Tab. 1 (from mean of loss rate %/h)
  set MortalityAdultsBackground_daily 0 ; Plowright & Jay 1968: negligible adult mortality in captive colonies (B. ternarius)
  set N_ForeignAlleles 24 ; (24) "The number of sex alleles in this population is estimated to be at least 24" Duchateau et al. 1994 Entomol. exp. appl. 71: 263-269, 1994.
  set NestSearchTime_h 6
  set NotSetHigh 999999999999999
  set NotSetLow -1 * NotSetHigh
  set QueenDestinedEggsBeforeSP_d 5 ; First queen destined egg is laid ca. 5d before SP  (Duchateau & Velthuis 1988 , Fig. 4: Queen destined eggs laid 5d before SP (or later))
  set QueensProducingColoniesList []
  set QueenSymbolSize 2 * MasterSizeFactor
  set StepWidth 0.5 * MasterSizeFactor
  set Sunrise_s 8 * 3600  ; 8 * 3600 = 8:00 a.m.

  set ENERGY_HONEY_per_g  12.78
  ;set MAX_EGG_LAYING 1600
  set MAX_EGG_LAYING 1600
  set FORAGER_NURSING_CONTRIBUTION  0.2
  set MAX_BROOD_NURSE_RATIO  3
  set AFF_BASE  21       ; like BEEPOP
  set MIN_AFF 7  ; Robinson 1992: 7d; see also: Winston 1987, p. 92/93
    ; models: Amdam & Omholt 2003, Beshers et al 2001: 7d
  set MAX_AFF 50
    ; within range given in Winston 1987, p. 92/93
  set DRONE_EGGLAYING_START  115
    ;  115: 25.April (Allen 1963: late April ..late August)
  set DRONE_EGGLAYING_STOP  240
    ; 240  240: 28.August (Allen 1963: late April ..late August)
  set DRONE_HATCHING_AGE  3     ; Jay 1963, Hrassnig, Crailsheim 2005
  set DRONE_PUPATION_AGE  10    ; i.e. capping of the cell; Fukuda, Ohtani 1977
  set DRONE_EMERGING_AGE  24
  set HATCHING_AGE  3           ;  Winston p. 50
  set PUPATION_AGE  9    ; i.e. capping of the cell
  set EMERGING_AGE  21
  set MAX_BROODCELLS 20000
  set START_COLONY_SIZE 0

  set INVADING_WORKER_CELLS_AGE  PUPATION_AGE - 1 ; vv for mites

    ; MITE REPRODUCTION MODELS:
  if MiteReproductionModel = "Fuchs&Langenbach"
  [
    set MAX_INVADED_MITES_DRONECELL 16
      ; 16 (Fuchs&Langenbach 1989) defines length of workercell, dronecell list
      ; of MiteOrganisers

    set MAX_INVADED_MITES_WORKERCELL 8
      ; (Fuchs&Langenbach 1989)
      ; defines length of workercell, dronecell list of MiteOrganisers
  ]

  if MiteReproductionModel = "Martin"
  [
    set MAX_INVADED_MITES_DRONECELL 4
      ; defines length of workercell, dronecell list of MiteOrganisers
    set MAX_INVADED_MITES_WORKERCELL 4
      ; defines length of workercell, dronecell list of MiteOrganisers
  ]

  if MiteReproductionModel = "Test"
  [
    set MAX_INVADED_MITES_DRONECELL 5
    set MAX_INVADED_MITES_WORKERCELL 5
  ]

  if MiteReproductionModel = "Martin+0"
  [
    set MAX_INVADED_MITES_DRONECELL 5
    set MAX_INVADED_MITES_WORKERCELL 5
  ]

  if MiteReproductionModel = "No Mite Reproduction"
  [
    set MAX_INVADED_MITES_DRONECELL 5
    set MAX_INVADED_MITES_WORKERCELL 5
  ]

  ; VIRUS TYPES;
  if Virus = "DWV"
  [
    set VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA 0.89  ; 0.89
    set VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES 1   ; 1: Martin 2001
    set VIRUS_KILLS_PUPA_PROB 0.2   ; DWV: 0.2 (Martin 2001)
    set MORTALITY_INHIVE_INFECTED_AS_PUPA 0.012; (0.0119)
      ; if pupa was infected but survived
      ; based on Martin 2001 Survivorship curve (infected, winter)
      ; calculated at: 50% mortality(=58d);

    set MORTALITY_INHIVE_INFECTED_AS_ADULT 0
      ;  Martin 2001: DWV infected adults become carriers with unaffected survivorship

    set MORTALITY_DRONES_INFECTED_AS_PUPAE 0
      ; NO data on drone mortality! Use same increase in mortality as for workers
  ]

  if Virus = "APV"
  [
    set VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA 1
    set VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES 0
      ; 0: Martin 2001 (0, as the pupae dies! - so this value doesn't matter at all!)

    set VIRUS_KILLS_PUPA_PROB 1   ; APV: 1 (Martin 2001)
    set MORTALITY_INHIVE_INFECTED_AS_PUPA 1
      ; doesn't matter, as APV infected pupae die before emergence!

    set MORTALITY_INHIVE_INFECTED_AS_ADULT 0.2
     ; (0.2: Sumpter & Martin 2004)

    set MORTALITY_DRONES_INFECTED_AS_PUPAE 1
      ; NO data on drone mortality! Use same increase in mortality as for workers
  ]

  if Virus = "benignDWV" ; like DWV but does not harm the infected bees
  [
    set VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA 0.89     ; 1
    set VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES 1
      ; 0: Martin 2001 (0, as the pupae dies!)
    set VIRUS_KILLS_PUPA_PROB 0  ; (benign!)
    set MORTALITY_INHIVE_INFECTED_AS_PUPA MORTALITY_INHIVE ; (benign!)
    set MORTALITY_INHIVE_INFECTED_AS_ADULT MORTALITY_INHIVE
    set MORTALITY_DRONES_INFECTED_AS_PUPAE MORTALITY_INHIVE_INFECTED_AS_PUPA
      ; NO data on drone mortality! Use worker mortality!
  ]

  if Virus = "modifiedAPV"
  [
    set VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA 1     ; 1
    set VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES 1   ;
    set VIRUS_KILLS_PUPA_PROB 1  ; APV: 1 (Martin 2001)
    set MORTALITY_INHIVE_INFECTED_AS_PUPA 1
      ; doesn't matter, as APV infected pupae die before emergence!

    set MORTALITY_INHIVE_INFECTED_AS_ADULT 0.2
      ; (0.2: Sumpter & Martin 2004)

    set MORTALITY_DRONES_INFECTED_AS_PUPAE MORTALITY_INHIVE_INFECTED_AS_PUPA
    ; NO data on drone mortality! Use worker mortality!
  ]

  if Virus = "TestVirus"
  [
    set VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA 1  ; 0.89
    set VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES 1   ; 1: Martin 2001
    set VIRUS_KILLS_PUPA_PROB 0   ; DWV: 0.2 (Martin 2001)
    set MORTALITY_INHIVE_INFECTED_AS_PUPA 0.012; (0.0119)
      ; if pupae was infected but survived; based on Martin 2001 Survivorship
      ; curve (infected, winter) calculated at 50% mortality = 58d age

    set MORTALITY_INHIVE_INFECTED_AS_ADULT MORTALITY_INHIVE
      ;  Martin 2001: DWV infected adults become carriers with unaffected survivorship

    set MORTALITY_DRONES_INFECTED_AS_PUPAE MORTALITY_INHIVE_INFECTED_AS_PUPA
      ; NO data on drone mortality! Use worker mortality!
  ]





end


; *******************************************************************************
;vv change these
to CreateSpeciesProc
ifelse ( file-exists? SpeciesFilename )  ; ***MB*** 2018-04-13
[
 let speciesDataCSV csv:from-file SpeciesFilename ; a csv input file is loaded and saved
 let header item 0 speciesDataCSV  ; first line of the input file is the header
 foreach speciesDataCSV ; goes through all lines in ordered way
  [ ?1 ->
    if member? item 0 ?1 SpeciesList ; if the species (i.e.first entry) of the current row is member of the SpeciesList (i.e. the list with those bee species added to the simulation, which was created in ParametersProc)
    [
      create-Species 1
      [
        set name item (position "name" header) ?1  ; checks in which column of the input data the species are listed and uses the value of the current row
        set maxLifespanWorkers item (position  "maxLifespanWorkers" header) ?1
        set emergingDay_mean item (position "emergingDay_mean" header) ?1
        set emergingDay_sd round (item (position "emergingDay_sd" header) ?1)
        set batchsize item (position "batchsize" header) ?1
        set flightVelocity_m/s item (position "flightVelocity_m/s" header) ?1
        set flightCosts_kJ/m/mg MetabolicRateFlight_W/kg / flightVelocity_m/s / (1000 * 1000 * 1000)  ; W/kg = J/s/kg; div. by speed => J/m/kg i.e. 0.001kJ/s/(1000000*mg)
        set searchLength_m item (position "searchLength_m" header) ?1
        set seasonStop item (position "seasonStop" header) ?1
        set timeUnloading item (position "timeUnloading" header) ?1
        set specMax_cropVolume_myl item (position "specMax_cropVolume_myl" header) ?1
        set specMax_pollenPellets_g item (position "specMax_pollenPellets_g" header) ?1
        set nestHabitatsList []
        set nestHabitatsList read-from-string item (position "nestHabitatsList" header) ?1
        set minToMaxFactor item (position "minToMaxFactor" header) ?1
        set devAgeHatchingMin_d item (position "devAgeHatchingMin_d" header) ?1
        set devAgePupationMin_d item (position "devAgePupationMin_d" header) ?1
        set devAgeEmergingMin_d item (position "devAgeEmergingMin_d" header) ?1
        set devWeightEgg_mg item (position "devWeightEgg_mg" header) ?1
        set devWeightPupationMin_mg item (position "devWeightPupationMin_mg" header) ?1
        set devWeightPupationMax_mg item (position "devWeightPupationMax_mg" header) ?1
        set pollenToBodymassFactor item (position "pollenToBodymassFactor" header) ?1
        set dev_Q_DeterminationWeight_mg item (position "dev_Q_DeterminationWeight_mg" header) ?1
        set devAge_Q_PupationMin_d item (position "devAge_Q_PupationMin_d" header) ?1
        set devWeight_Q_PupationMin_mg item (position "devWeight_Q_PupationMin_mg" header) ?1
        set devWeight_Q_PupationMax_mg item (position "devWeight_Q_PupationMax_mg" header) ?1
        set devAge_Q_EmergingMin_d item (position "devAge_Q_EmergingMin_d" header) ?1
        set growthFactor item (position "growthFactor" header) ?1
        set proboscis_min_mm item (position "proboscis_min_mm" header) ?1
        set proboscis_max_mm item (position "proboscis_max_mm" header) ?1
        set chanceFindNest   item (position "dailyNestSiteChance" header) ?1  ;dailychance for queen finding nest site
        set devQuotaIncubationToday_kJ 10 / (1.5 * batchsize)   ; 10 kJ: Silvola 1984: Queen (B. terrestris) spends ca. 10kJ/day for incubation; during this time it incubates about 1.5 batches of brood
        set devAgeHatchingMax_d devAgeHatchingMin_d * minToMaxFactor
        set devAgePupationMax_d devAgePupationMin_d * minToMaxFactor - devAgeHatchingMin_d
        set devAgeEmergingMax_d devAgeEmergingMin_d * minToMaxFactor -  devAgePupationMin_d
        set devIncubationHatchingTH_kJ devQuotaIncubationToday_kJ * devAgeHatchingMin_d
        set devIncubationPupationTH_kJ devQuotaIncubationToday_kJ * devAgePupationMin_d
        set devIncubationEmergingTH_kJ devQuotaIncubationToday_kJ * devAgeEmergingMin_d
        set dev_larvalAge_QueenDetermination_d   3    ; (3d) (Roeseler 1970 Z. Naturforsdi. 25 b, 543— 548: within the first 3.5 days of larval development
        set devAge_Q_PupationMax_d devAge_Q_PupationMin_d * minToMaxFactor - devAgeHatchingMin_d
        set devAge_Q_EmergingMax_d devAge_Q_EmergingMin_d * minToMaxFactor - devAge_Q_PupationMin_d
        set devIncubation_Q_PupationTH_kJ devQuotaIncubationToday_kJ * devAge_Q_PupationMin_d
        set devIncubation_Q_EmergingTH_kJ devQuotaIncubationToday_kJ * devAge_Q_EmergingMin_d ; * Incubation_Q_Factor

       ;Create list of foodSources as nest sites and calculate their total area
        set nestsiteFoodsourceList    FoodSources with [ (member? patchtype [nestHabitatsList] of myself) AND masterPatch? ]

        set nestSiteArea sum [area_sqm] of nestsiteFoodsourceList
       ; queen may start egg lying once 50% of pollen needed to raise 1 batch of eggs is stored:
        set minPollenStore_g 0.5 * 0.001 * devWeightPupationMin_mg * batchsize / pollenToBodymassFactor
        if count nestsiteFoodsourceList = 0 and name != "Psithyrus"
         [output-print (word name " has no suitable nesting foodsources. No colonies will form")]

      ]
    ]
  ]
]
; if SpeciesFilename doesn't exist
[ user-message (word "The file SpeciesFilename (" SpeciesFilename ") doesn't exist in the current directory. Check file names!")]
end


; *******************************************************************************


; Reporter to find foodSource for queens that have found a nest site.
to-report NestSiteFoodSourceREP [ memoSpecies ]
  let chosenFoodSource  nobody
  let foodSourceList    shuffle sort [nestsiteFoodsourceList] of memoSpecies  ; Randomise order of species-suitable foodSources (actually not necessary!)
  let foodSourceArea    [nestSiteArea] of memoSpecies                 ; total area of species-suitable foodSources
  let p                 random-float 1
  let probsSummedUp     0
  let foodCounter       0
  let fsFound?          FALSE
  while [not fsFound?] ; go through all food sources in the list
  [
   let probs          [area_sqm / foodSourceArea] of (item foodCounter foodSourceList)
   set probsSummedUp  probs + probsSummedUp

   if probsSummedUp > p
   [
     set chosenFoodSource  (item foodCounter foodSourceList)
     set fsFound?          TRUE
   ]
   set foodCounter foodCounter + 1
  ]
  report chosenFoodSource
end

; ******************************************************************************


;vv getNestcoord
to-report getNestCoord [ xscor yscor ]

  py:set "bees" 500
  py:set "start_x" xscor
  py:set "start_y" yscor
  py:run "start_x*=5.0166666666666666666666666666667"
  py:run "start_y*=5.0166666666666666666666666666667"
  py:run "max_itrs = int(10000 / (bees * 2))"
  py:run "fig, ax = plt.subplots()"
  (py:run
        "mapScale = (5000000/( 1505*1050 )) "
        "max_r = 1000/mapScale"
        "max_d = math.sqrt(2)*max_r"
        "model = HiveS.BeeHive(lower=[max(0,start_x-max_d),max(0,start_y-max_d)], upper=[min(1050,start_x+max_d),min(1505,start_y+max_d)], fun=imager3, numb_bees=bees,"
        "                        max_itrs=max_itrs, max_trials=10, start_x=start_x, start_y=start_y, r=max_r, verbose=False)"
        "cost, b_vector = model.run()"

       "ax.contourf(X*mapScale, Y*mapScale, np.array(z), cmap='gray', ) #norm=colors.SymLogNorm(vmin=z.min(), vmax=z.max(),linthresh=0.03)"
       "divider = make_axes_locatable(ax)"
       "cax = divider.append_axes('right', size='5%', pad=0.05)"
       "br = ax.imshow(np.array(z)*(-1), interpolation='nearest', origin='lower', cmap='binary')"
       "fig.colorbar(br, cax=cax, orientation='vertical')"

       "ax.plot([int(b_vector[0])*mapScale], [int(b_vector[1])*mapScale], '.', linewidth=1, color='red', fillstyle='none')"
       "ax.plot((start_x * mapScale, int(b_vector[0]) * mapScale),"
       "        (start_y * mapScale, int(b_vector[1]) * mapScale), ls=':', linewidth=1, color='red',"
       "        fillstyle='none')"

       "circle1 = plt.Circle((start_x* mapScale, start_y* mapScale), max_r* mapScale, color='black', fill=False, linewidth=1)"
       "ax.add_artist(circle1)"
       "ax.plot(start_x*mapScale, start_y*mapScale, '*', linewidth=5, color='blue')"

       "plt.show(fig)"
  )
  report py:runresult "[int(b_vector[0]/5.0166666666666666666666666666667), int(b_vector[1]/5.0166666666666666666666666666667)]"

end

; *******************************************************************************

to NestSitesSearchingProc
  let memoX 0
  let memoY 0
  let memoSpecies    oneSpecies speciesID
  let nestSiteFound  false
  let memoFoodSource nobody
  let dailyChance    [chanceFindNest] of memoSpecies  ; chance is species-own variable
  ; Decide if queen finds a nest today
  if random-float 1 <= dailyChance
  [
    ; Find FoodSource for colony
    set memoFoodSource NestSiteFoodSourceREP memoSpecies
    ; Find patch for colony
    ask memoFoodSource
    [
      ask one-of patches with [ distance myself < ([radius_m] of myself * SCALING_NLpatches/m) ]
      [
        set memoX pxcor
        set memoY pycor
      ]
    ]
    set nestSiteFound true
  ]

  ifelse nestSiteFound = true
  [
    setxy memoX memoY
    set activity "nestConstruction"
  ]
  ; If nest site not found, queen has probability of dying based on foraging mortality per sec multiplied by seconds searching for nest site
  [
    if random-float 1 < 1 - ((1 - MortalityForager_per_s) ^ (NestSearchTime_h * 60 * 60))
          ; 1 - MortalityForager_per_s: prob. to survive 1s
          ; ^ (NestSearchTime_h * 60 * 60): prob to survive the searching period
          ; 1 - prob. to survive = prob. to die
    [
      DieProc "Queen: died while searching nest site"
    ]
  ]
end


; *******************************************************************************

to PatchesInRangeProc
  ; called by a colony; creates 2 lists, containing the who of all foodsources and masterpatch-foodsources within the foraging range of the colony

 let allPatches []
 let allMasterPatches []
 let xcol xcor
 let ycol ycor
 set allPatchesInRangeList []
 set masterpatchesInRangeList []
 ask foodsources with [ distancexy xcol ycol <= (ForagingRangeMax_m * Scaling_NLpatches/m )  ]
 [
   set allPatches fput who allPatches
   if masterpatch? = true [ set allMasterPatches fput who allMasterPatches ]
 ]
 set allPatchesInRangeList allPatches ; rather: all food sources in range
 set masterpatchesInRangeList allMasterPatches
end


; *******************************************************************************

to FoodsourcesInFlowerAndRangeProc
  ; called by a colony; creates 5 lists, containing the who of foodsources or masterpatches offering nectar, offering pollen or offering either nectar or pollen within the foraging range

 set pollenInFlowerAndRangeList []
 set nectarInFlowerAndRangeList []
 set allSourcesInFlowerAndRangeList []
 let pol []
 let polM []
 let nec []
 let necM []


 foreach allPatchesInRangeList ; all patches within foraging range are addressed
 [ ?1 ->
   ask foodsource ?1
   [
     if pollen_g > 0 ; if they contain pollen..
      [
        set pol lput who pol ; .. their ID is added to the list pol
        set polM lput masterpatchID polM ; .. and their masterpatch is added to the list polM
      ]
     if nectar_myl > 0  ; similar for nectar
      [
        set nec lput who nec
        set necM lput masterpatchID necM
      ]
    ]
  ]

 set polM remove-duplicates polM ; make sure, a masterpatch occurs only once in the polM list
 set necM remove-duplicates necM ; ditto for necM
 set pollenInFlowerAndRangeList pol
 set masterpatchesWithPollenlayersInFlowerAndRangeList polM
 set nectarInFlowerAndRangeList nec
 set masterpatchesWithNectarlayersInFlowerAndRangeList necM
 set allSourcesInFlowerAndRangeList remove-duplicates (sentence pollenInFlowerAndRangeList nectarInFlowerAndRangeList) ; combines the nectar and pollen list into a single list

end



; *******************************************************************************


to PopulateColoniesProc

;qwerty



ask colonies
  [

  let whoColony who

    let memoSpeciesID -1
    let speciesShape "Error"


     ask one-of bees with [ caste = "queen" ]
   [
     let xcol xcor  ;  x and y coordinates of the queen are saved, so that the nest can be located where the queen is
     let ycol ycor
     set colonyID whoColony ; queen gets the ID of the colony..
     set memoSpeciesID SpeciesID ; and saves her species-type for the colony
     set activity "resting"      ; as the colony is created now, the queen rests
     set speciesShape speciesName  ; saves the species of the queen so that the colony can be displayed in the according shape
     if ShowQueens? = true [show-turtle]
   ]

    let newCohorts START_COLONY_SIZE ; this will later be changed for IBM colonies

    hatch-bees 1 ;START_COLONY_SIZE
    [
    let mother caste  ; to distinguish queen and worker laid eggs
    set ploidy 2
    set spermathecaList [] ;list (allele)
    set spermathecaList fput (random-float 139.9) spermathecaList
    set colonyID whoColony ; i.e. does not belong to any colony yet
    set speciesID memoSpeciesID
    set speciesName speciesShape
    set allelesList list (random-float 139.9) (random-float 139.9)
    ;set myAllelesList fput one-of allelesList myAllelesList   ; egg gets (only) one allele from its mother
    ;set allelesList myAllelesList
    EggsParameterSettingProc START_COLONY_SIZE




     ;output-print "bruh"
     set shape "circle"
     if ShowQueens? = false [ hide-turtle ]
     set size QueenSymbolSize
     set adultAge 0  ; queens have hibernated (exact age doesn't matter)
     set broodAge 21  ; (exact age doesn't matter)
     set color red
     set brood? false
     set caste "worker"
     set mated? false
     set number START_COLONY_SIZE;1
     set ploidy 2
;     set mtDNA random-float 139.9 ; i.e. within the range of Netlogo colours
;     set allelesList list (random-float 139.9) (random-float 139.9)

     set stage "adult"
      ;vv bnm
     set thEgglaying ThresholdLevelREP "eggLaying" "worker"
     set thForagingNectar ThresholdLevelREP "nectarForaging" "worker"
     set thForagingPollen ThresholdLevelREP "pollenForaging" "worker"
     set thNursing ThresholdLevelREP "nursing" "worker"
     set activity "hibernate"
     set activityList [ ]
     set personalTime_s random (2 * 3600) + (GetUpTime_s - 3600) ; = Start_time_s +- 1hr (i.e. between 7:00 and 9:00 am)
     let yearEndSeason [seasonStop] of OneSpecies speciesID ; prevent bees from setting emergingDate past the end of season




     while [ emergingDate <= 0 OR emergingDate >= yearEndSeason]
       [ set emergingDate  round random-normal [ emergingDay_mean ]
    of OneSpecies speciesID [emergingDay_sd] of OneSpecies speciesID ]
    ; emerging from hibernation next year on day "emergingDay_mean" (+- s.d.)

     set currentFoodsource -1
     set nectarsourceToGoTo -1
     set pollensourceToGoTo -1
     set pollenForager? true
     set knownMasterpatchesNectarList [ ]
     set knownMasterpatchesPollenList [ ]

      ;vv todo
     ; determination of the queen's weight:
     set weight_mg random-normal 1000 100 ;vv otherwise takes from queen
     if weight_mg > 1100 [ set weight_mg 1100 ]
     if weight_mg < 900 [ set weight_mg 900 ]
     set glossaLength_mm ProboscisLengthREP
     set cropvolume_myl   CropAndPelletSizeREP "nectar"
     set pollenPellets_g  CropAndPelletSizeREP "pollen"

      let myAllelesList []
      set caste "worker"   ; "undefined", "queen", "worker", "male"
      set spermathecaList [] ; eggs haven't mated yet..
      set size CohortSymbolSize
      set shape "halfline"
      __set-line-thickness 0.5
      set heading 0
      set number START_COLONY_SIZE ;1
      set TotalBeesEverProduced TotalBeesEverProduced + number
      set activity "resting"
      ;  set cumulTimeEgg_d    0   ; Set to 0, not mother's value
      ;  set cumulTimeLarva_d  0   ; Set to 0, not mother's value
      ;  set cumulTimePupa_d   0   ; Set to 0, not mother's value
      set cropVolume_myl    0   ; now based on weight, has to be set on emergence
      set pollenPellets_g   0   ; now based on weight, has to be set on emergence
      set currentFoodsource -1  ; not set yet
      set nectarsourceToGoTo -1 ; not set yet
      set pollensourceToGoTo -1 ; not set yet
      set mated? false
      set activityList [ ]
      set knownMasterpatchesNectarList [ ]
      set knownMasterpatchesPollenList [ ]
      ;  set weight_mg [ devWeightEgg_mg ] of OneSpecies speciesID
      ;  set cumulIncubationReceived_kJ 0
      ;  set emergingDate NotSetLow
      ;  set expectation_NectarTrip_s 0
      ;  set expectation_PollenTrip_s 0
      ;  set glossaLength_mm 0
      ;  set nectarLoadSquadron_kJ 0
      ;  set personalTime_s 0
      ;  set pollenForager? false
      ;  set pollenLoadSquadron_g 0
      ; location of egg cohort on the interface is relative to its colony's location:

    ]

    set totalEggsProduced  totalEggsProduced + START_COLONY_SIZE

    set number round ( START_COLONY_SIZE / 2 )

    hatch-bees 1 ; "hatch" command, as "create" is not possible in a turtle context
    [
      let mother caste  ; to distinguish queen and worker laid eggs
      set ploidy 2
      set spermathecaList [] ;list (allele)
      set spermathecaList fput (random-float 139.9) spermathecaList
      set colonyID whoColony ; i.e. does not belong to any colony yet
      set speciesID memoSpeciesID
      set speciesName speciesShape
      set allelesList list (random-float 139.9) (random-float 139.9)
      set ploidy 2   ; 2: diploid bee (worker, queen or diploid male)
      EggsParameterSettingProc round ( START_COLONY_SIZE / 2 )


    ]


    set totalEggsProduced  totalEggsProduced + round (START_COLONY_SIZE / 2)

  ]

end



; ****************************************************************************





to CreateColoniesProc
; Purpose: creates and sets up initial values of a newly founded colony

 let whoColony -1
 let memoSpeciesID -1
 let xcol -1
 let ycol -1
 let speciesShape "bumblebeenest" ; will be replaced by species specific bumblebee symbol
 let nNewColonies count bees with [ activity = "nestConstruction" ]

 ; each colony needs 2 storebars to display on the interface the relative amount of nectar and pollen stored:
 create-storebars 2 * nNewColonies
 [
   set shape "halfline"
   set heading 90
   set size 10 * MasterSizeFactor
   set maxSize size
   set storeColonyID whoColony
 ]

 ; now the COLONIES are created:
 create-Colonies nNewColonies
 [
   set whoColony who ; the ID of the colony
   set colonyFoundationDay ticks
   ask one-of bees with [ activity = "nestConstruction" and caste = "queen" ]
   [
     set xcol xcor  ;  x and y coordinates of the queen are saved, so that the nest can be located where the queen is
     set ycol ycor
     set colonyID whoColony ; queen gets the ID of the colony..
     set memoSpeciesID SpeciesID ; and saves her species-type for the colony
     set activity "resting"      ; as the colony is created now, the queen rests
     set speciesShape speciesName  ; saves the species of the queen so that the colony can be displayed in the according shape
     if ShowQueens? = true [show-turtle]
   ]







   set queenProduction? false   ; no production of queens yet
   set switchPointDate NotSetHigh ; queen won't lay haploid eggs until switchPointDate is re-set
   set competitionPointDate NotSetHigh
   set eusocialPhaseDate NotSetHigh
   set queenProductionDate NotSetHigh
   set speciesIDcolony memoSpeciesID ; colony gets species-type from queen
   if ShowNests? = false [ hide-turtle ]
   set xcor xcol      ; the colony is placed at the location of queen
   set ycor ycol
   set queenright? true  ; queen is still alive
   set shape speciesShape ; colony is displayd on the interface as a bumblebee, showing the species of the queen
   set heading 0
   set color 33  ; (33) dark brown
   set size ColonySymbolsize; 14 (14)
   ;vv old set energyStore_kJ 100 * EnergySucrose_kJ/mymol * 1.5  ; i.e. 0.873kJ (= 100 microliter of 1.5M nectar (i.e. ca. 1 crop))
    ; beehav 0.5 * MAX_HONEY_STORE_kg * 1000 max = 5
   set energyStore_kJ 2500 * 100 * EnergySucrose_kJ/mymol * 1.5 * 300  ; i.e. 0.873kJ (= 100 microliter of 1.5M nectar (i.e. ca. 1 crop))
   set pollenStore_g 2000
   ;set pollenStore_g 1000

   set colonysize 1  ; i.e. the queen
   set cohortBased? true
   if count Colonies with [ cohortBased? = false ] < COLONIES_IBM
   [
     set cohortBased? false
     set color ColorIBM
     set InspectTurtle Who
   ]

   PatchesInRangeProc
   FoodsourcesInFlowerAndRangeProc

   let barX 3.5
   let barY 5
   ; a nectar and a pollen storebar is now assigned to the new colony
   ask one-of storebars with [ storeColonyID = -1 ]
   [
     ifelse xcol - barX > min-pxcor and ycol - barY > min-pycor
      [ setxy xcol - barX ycol - barY ]
      [ hide-turtle ]
     set storeColonyID whoColony
     set store "Nectar"
     set color yellow
   ]

   set barY barY - 1
   ask one-of storebars with [ storeColonyID = -1 ]
   [
     ifelse xcol - barX > min-pxcor and ycol - barY > min-pycor
      [ setxy xcol - barX ycol - barY ]
      [ hide-turtle ]
     set storeColonyID whoColony
     set store "Pollen"
     set color orange - 0.5
   ]
   set TotalColoniesEverProduced  TotalColoniesEverProduced + 1
   ;beehave import
   set PhoreticMites  N_INITIAL_MITES_HEALTHY + N_INITIAL_MITES_INFECTED
   set TotalMites  PhoreticMites
 ]

end


; *******************************************************************************

to CreateFoodsourcesProc
  ifelse ( file-exists? InputMap )
   [
     import-pcolors InputMap
     ask patches [ set pcolorSave pcolor ]
   ]
   [
     ask patches
      [
        set pcolor 5 ; background/matrix colour if no map image is available; color 5  = grey
        set pcolorSave pcolor
       ]
    ]

  ifelse ( file-exists? INPUT_FILE )
    [
      file-open INPUT_FILE
      set SCALING_NLpatches/m precision (1 / file-read) 8  ; CAUTION! Scaling in BEESCOUT: m/NLpatch; Scaling Bumbleworld: NLpatches per m !!!
      let dustbin file-read-line  ; N patches in old input file format or heading in new format
      if length dustbin <= 10 [ set dustbin file-read-line ] ; heading
      while [ not file-at-end? ]
      [
        create-foodsources 1
        [
          ; imported file format:
          ; id patchType patchColour xcor ycor size_sqm quantityPollen_g quantityNectar_l concentration startDay stopDay corollaLength_mm nectarFlowerVolume_myl interFlowerTime_s patchInfo
          set id_Beescout file-read
          set patchType file-read
          set flowerSpecies_relativeAbundanceList (list patchType 1)
          let memoFoodpatchColour file-read   ; the colour of the food patch, as shown on the map
          set color memoFoodpatchColour - 1   ; the colour of the food source (= turtle), slightly darker then the food patch to be visible
          set colorMemo color  ; saves original color (for use in buttons)
          set xcor file-read
          set ycor file-read
          set area_sqm file-read  ; [m^2]
          set pollen_g AbundanceBoost * file-read ; [g]
          set pollenMax_g pollen_g
          set proteinPollenProp file-read
          set nectar_myl AbundanceBoost * file-read * 1000 * 1000 ; [quantityNectar_l: l * 1000 = ml; ml * 1000 = myl]
          set nectarMax_myl nectar_myl
          set nectarConcentration_mol/l file-read  ; [mol/l]
          set startDay file-read   ; day of year
          set stopDay file-read    ; day of year
          set corollaDepth_mm file-read   ; [mm]
          set nectarFlowerVolume_myl file-read  ; [microlitre]
          set interFlowerTime_s file-read       ; [s]
          set flowerSpeciesList file-read       ; [s]
          set patchInfo file-read-line        ; the rest of the line is now read in
          set radius_m sqrt (area_sqm / pi)   ; [m]
          set shape "circle"
          set size FoodsourceSymbolSizeFactor * radius_m * Scaling_NLpatches/m
          if size < MinFoodSourceSymbolSize [ set size MinFoodSourceSymbolSize ]
          ifelse ShowFoodsources? = false
            [ hide-turtle ]
            [ show-turtle ]
          set masterpatch? true
          set layersInPatchList (list who)
          set masterpatchID who

          if MapAreaIncluded = "top left quarter" and (xcor > max-pxcor / 2 or ycor < max-pycor / 2)  [ die ]
          if MapAreaIncluded = "top right quarter" and (xcor <= max-pxcor / 2 or ycor < max-pycor / 2)  [ die ]
          if MapAreaIncluded = "bottom left quarter" and (xcor > max-pxcor / 2 or ycor >= max-pycor / 2)  [ die ]
          if MapAreaIncluded = "bottom right quarter" and (xcor <= max-pxcor / 2 or ycor >= max-pycor / 2)  [ die ]
          if MapAreaIncluded = "top half" and (ycor < max-pycor / 2)  [ die ]
          if MapAreaIncluded = "bottom half" and (ycor >= max-pycor / 2)  [ die ]
          if MapAreaIncluded = "left half" and (xcor > max-pxcor / 2)  [ die ]
          if MapAreaIncluded = "right half" and (xcor <= max-pxcor / 2)  [ die ]

;          output-print "Pic info"
;          output-print max-pycor
;          output-print max-pxcor
;          output-print SCALING_NLpatches/m


        ]
      ]
      file-close
    ]
    [
      user-message (word "The INPUT_FILE (" INPUT_FILE ") does not exist in the current directory! ")
    ]

    if MergeHedges? = true [MergeHedgesProc]

    CreateLayersProc   ; creates new foodsources from those foodsources with multiple species (i.e. with flowerSpeciesList != [] )
    set TotalFoodSources count foodsources
end


; *******************************************************************************

to MergeHedgesProc
  ; hedges are often represented by a large number of very small patches. If "MinSizeFoodSources?" (and "RemoveEmptyFoodSources?") are switched on, they may only contain one (Average willow) or very few foodsources.
  ; To avoid this, several small patches of hedges can be merged into a single, larger one (no loss of total area)
  ; The procedure is called before CreateLayersProc. First, the closest non-hedge food patch for each hedge patch is determiend, Then hedges sharing the same closest non-hedge patch are merged by
  ; summing up their areas in one of those (randonmly chosen) hedge patches, the other hedge patches get an area of 0 and will be removed in CreateLayersProc.

  let fieldsHedgeLinksList [] ; to link hedges with their closest non-hedge field, format e.g. [[1 17] [5 29] [1 18]..] each sublist with 2 elements: 1st: who of closest non-hedge patch, 2nd: who of hedge
  let fieldsWithHedgesList [] ; contains who of all non-hedge patches that are closest to at least one hedge patch
  ask foodsources with [ patchType = "Hedgerow" ]
  [
     let singleHedgeMatchList (list who)
     let myField min-one-of foodsources with [ patchType != "Hedgerow" ] [distance myself]  ; myField saves the (non-hedge) foodsource closest to the current hedge patch

     if myField != nobody
     [
       set singleHedgeMatchList fput [who] of myField singleHedgeMatchList  ; this is a 2 item list, 1st item: who of the hegde's closest non-hedge field, second item who of the hedge
       set fieldsWithHedgesList lput [who] of myField fieldsWithHedgesList
       set fieldsHedgeLinksList lput  singleHedgeMatchList fieldsHedgeLinksList
     ]
  ]
  set fieldsWithHedgesList remove-duplicates fieldsWithHedgesList  ; duplicates are removed from the list

  foreach fieldsWithHedgesList
  [ ?1 ->
    let myFieldID ?1
    let hedgesSublist filter [ ??1 -> first ??1 = myFieldID ] fieldsHedgeLinksList ; this sublist only contains those elements where the current field is present
    let shortSublist []
    foreach hedgesSublist [ ??1 -> set shortSublist lput (item 1 ??1) shortSublist ] ; this shortSublist only contains the who of those hedges, linked to the current field

    let masterHedgeID -1  ; will save who of the hedge patch that will increase in area
    foreach shortSublist
    [ ??1 ->
      ifelse masterHedgeID = -1 ; in this case, the foodsource is the first hedge at that field and will increase in size
       [ set masterHedgeID ??1 ]
       [  ; the areas of all other hedge patches are now added to the "master" hedge patch
         let areaToBeAdded_sqm [ area_sqm ] of foodsource ??1
         let nectarToBeAdded_myl [nectarMax_myl]  of foodsource ??1
         let pollenToBeAdded_g [pollenMax_g]  of foodsource ??1
         ask foodsource masterHedgeID
          [
            set area_sqm area_sqm + areaToBeAdded_sqm
            set nectarMax_myl nectarMax_myl + nectarToBeAdded_myl ; if hedges are composed of layers/several foodsources, this value will be overwritten in CreateLayersProc
            set pollenMax_g pollenMax_g + pollenToBeAdded_g  ; if hedges are composed of layers/several foodsources, this value will be overwritten in CreateLayersProc
          ]
         ask foodsource ??1
          [
            set area_sqm 0
            hide-turtle
          ]
       ]
     ]
   ]

  ask foodsources with [ patchType = "Hedgerow" ]
   [
     set radius_m sqrt (area_sqm / pi)   ; [m]
     set size FoodsourceSymbolSizeFactor * radius_m * Scaling_NLpatches/m
     ; if size < MinFoodSourceSymbolSize [ set size MinFoodSourceSymbolSize ]
   ]

end

; *******************************************************************************


to CreateLayersProc

; if the flowerSpeciesList of food source is not empty (i.e. it usually contains several plant species that might be in flower at different times) this procedure then creates a single flowerspecies food source (at the same location, area etc) for
; each flowerspecies of the original foodsource. At the end, the original food source is removed.

; Remove foodsources with low resource values
                ; If the switch MinSizeFoodSources? is ON, all foodsources with either nectarMax or pollenMax values under a certain threshold will
                ; have that resource set to 0. This is to prevent foragers from visiting low-resource flowers and having very high handling times, leading
                ; to poor colony performance. The thresholds for nectar and pollen are set below, each one being the amount of nectar/pollen an average Bterr
                ; queen can carry multiplied by the FoodSourceLimit interface variable. For example, if the variable is set to 20, the minimum nectar/pollen
                ; amount at a foodsource is enough for FoodSourceLimit trips by a queen Bterr with a crop size of 180myl and pollen pellets of 0.05g.
                ; If the switch RemoveEmptyFoodSources? is ON, all foodsources with BOTH nectarMax and pollenMax levels set to 0 by the above are removed from
                ; the model, which greatly improves the speed of the model.

 ; set minimum resource limits for foodsources. FSs with lower nectar or pollen amounts than these will have their values set to 0 if SetEmptySmallFoodSources? is TRUE
 let foodsourcesRemoved false
 let minNectSize_myl  FoodSourceLimit  * 180  ; minimum nectar for a foodsource is amount equal to "FoodSourceLimit" number of trips by a queen with a crop volume of 180myl
 let minPolsize_g     FoodSourceLimit  * 0.05 ; minimum pollen for a foodsource is amount equal to "FoodSourceLimit" number of trips by a queen with pollen pellet size of 0.05g

 ifelse ( file-exists? FlowerspeciesFile )
 [
   let flowerspeciesDataCSV csv:from-file FlowerspeciesFile ; reads flower species data from csv file and saves it in list, i.e. [[line 1][line 2]..[last line]]
   let header item 0 flowerspeciesDataCSV  ; saves header = first line of csv file = item 0 of list
     ; e.g. ["Flowerspecies" "Default_pollen_g/m2" "Default_nectar_ml/m2" "proteinPollenProp" "concentration_mol/l" "startDay" "stopDay" "corollaDepth_mm" "nectarFlowerVolume_myl" "intFlowerTime_s"]
   let allFlowerspeciesList []
   foreach but-first flowerspeciesDataCSV ; but-first: ignores header
   [ ?1 ->
     let flowerSpec read-from-string item 0 ?1 ; gets the first value (= flower species) of each column (in actual order)
     set allFlowerspeciesList lput flowerSpec allFlowerspeciesList ;  the species is now added to the list containing all possible flower species
         ; e.g. ["Bugle" "Burdock" "Oilseed_rape" "Giant_bindweed" "Common_knapweed" ... ]
   ]

   ask foodsources with [ flowerSpeciesList != [] ]  ; if foodsource is composed of several flower species
   [
     let memoMasterpatchID -1
     foreach flowerSpeciesList  ; for each flowerspecues a new foodsource is created (flowerSpeciesList is a Foodsources-own)
     [ ?1 ->
       hatch 1
       [
         set flowerSpecies_relativeAbundanceList ?1   ; e.g. ["Bugle" 0.236]
         let mySpecies item 0 flowerSpecies_relativeAbundanceList   ; e.g. "Bugle"
         if member? "Margin" mySpecies  ; (as in e.g. "MarginRed_clover")
           [ set shape "fieldmargin" ] ; margins of (crop) fields are presented on the map as a blue ring
         let myDataLine item (position mySpecies allFlowerspeciesList + 1) flowerspeciesDataCSV
           ; myDataLine: the relevant line of the csv file for this particular flower species; position..+1 to account for header
           ; e.g. ["\"Bugle\"" 7.7381E-5 9.63889E-5 0.072103857 0.824737635 120 211 10 0.80966667 2.5]
         let myRelativeAbundance AbundanceBoost * (item 1 flowerSpecies_relativeAbundanceList) ; proportion of patch area covered by this species
         ;  pollen available at patch: pollen produced by this plant species per m2 (where present) * total area of this foodsource * relative abundance of this flowerspecies in the habitat * ProportionModelledColonies (as only a fraction of the colonies is simulated)
         set pollenMax_g area_sqm * myRelativeAbundance * (item (position "pollen_g/flower" header) myDataLine)
         set nectarMax_myl area_sqm * myRelativeAbundance * 1000 * (item (position "nectar_ml/flower" header) myDataLine)
         set nectarConcentration_mol/l (item (position "concentration_mol/l" header) myDataLine)  ; [mol/l] "position" determines the column with the relevant data
         set proteinPollenProp (item (position "proteinPollenProp" header) myDataLine)
         set startDay (item (position "startDay" header) myDataLine)
         set stopDay (item (position "stopDay" header) myDataLine)
         set corollaDepth_mm (item (position "corollaDepth_mm" header) myDataLine)
         set nectarFlowerVolume_myl (item (position "nectarFlowerVolume_myl" header) myDataLine)
         set interFlowerTime_s (item (position "intFlowerTime_s" header) myDataLine)

         ; Set nectar / pollen levels to 0 if smaller than the minimum size
         if MinSizeFoodSources? AND nectarMax_myl < minNectSize_myl
           [ set nectarMax_myl 0 ]
         if MinSizeFoodSources? AND pollenMax_g < minPolsize_g
           [ set pollenMax_g   0 ]

         ; kill the foodSource if both nectar and pollen are below the respective minimum values and if RemoveEmptyFoodSources? is TRUE
         if nectarMax_myl = 0 AND pollenMax_g = 0 AND RemoveEmptyFoodSources?
           [
              set foodsourcesRemoved true
              die
           ]

         ifelse memoMasterpatchID < 0  ; if the masterpatch hasn't been set yet..
         [
           set memoMasterpatchID who  ; ..the first foodsource/layer will be the masterpatch
           set masterpatchID memoMasterpatchID   ; only masterpatchID has to be updated,  as 'masterpatch?' is true by default
         ]
         [
           set masterpatch? false    ; .. for all other 'layers' of the original foodsource, masterpatch? is set false
           set masterpatchID memoMasterpatchID  ; set to the first 'layer' created at this flower patch

           set layersInPatchList []  ; will be populated later
           if ShowMasterpatchesOnly? = true [ hide-turtle ] ; non-masterpatches might be hidden
         ]
       ]
     ]  ; end of "foreach flowerSpeciesList" loop
     die ; the original foodsource  is no longer needed and can be removed
   ]
 ]
 [ if FlowerspeciesFile != "No Input File"
   [ user-message "There is no such FlowerspeciesFile in current directory!" ]
 ]
 if foodsourcesRemoved = true [ output-print "One or more very small food sources removed! To avoid, set RemoveEmptyFoodSources? 'false'!" ]

 ; set layersInPatchList to a list of all foodsources at same location
 ask foodsources [set layersInPatchList sort [who] of foodsources-here ]

end

; *******************************************************************************

to Setup
  clear-all
  stop-inspecting-dead-agents
  reset-ticks
  if RAND_SEED != 0 [ random-seed RAND_SEED ]
  ParametersProc
  CreateFoodsourcesProc
  CreateSpeciesProc
  CreateBadgersProc
  CreateInitialQueensProc

  UpdateMorning_Proc
  CreateSignsProc
  OutputDailyProc
  if ShowGrid? = true
  [
    ask patches with [ remainder pxcor round (Gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]
    ask patches with [ remainder pycor round (Gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]
    ask patch 290 5 [ set  plabel-color black set plabel word Gridsize " m" ]
  ]

  py:setup py:python3
  py:run "from PIL import Image"
  py:run "import math"
  py:run "import numpy as np"
  py:run "import os"
  py:run "os.getcwd()"
  py:run "from pathlib import Path"
  py:run "from Hive import HiveS"
  py:run "import matplotlib.pyplot as plt"

  py:run "im = Image.open('BBH-I_Suss1.png')"
  py:run "out = im.transpose(Image.FLIP_TOP_BOTTOM)"
  py:run "pix = im.load()"
  py:run "i_width, i_height = im.size"
  py:run "from mpl_toolkits.axes_grid1 import make_axes_locatable"

(py:run
"def getMap():"
"    rows = []"
"    for line in open('BBH-T_Suss1.txt'):"
"        rows.append(line.split(" "))"
"    print(rows[2])"
"    rows=rows[3:-1]"

"    def cval(val):"
"        return int(float(val))"

"    circles = []"
"    constDiff = 5.0166666666666666666666666666667"
"    for row in rows:"
"        x = cval(row[3])*constDiff"
"        y = cval(row[4])*constDiff"
"    #     sq = (math.sqrt((cval(row[5])/constDiff)/math.pi))   +    10"
"        sq = (math.sqrt((cval(row[5])/(4.2**2))/math.pi))/2   +    1"
"        vl = 1+( cval(row[6])*cval(row[7])+cval(row[8])*cval(row[9])) * (cval(row[11])-cval(row[10]))"
"        circles.append([x,y,sq,vl])"
"    print(i_width, i_height)"
"    grid = np.zeros((1506,1056), dtype=np.float)"
"    square_length = 0.5"
"    xx = np.arange(grid.shape[0])"
"    yy = np.arange(grid.shape[1])"

"    for val in circles:"
"        radius = val[2]"
"        inside = (xx[:,None] - val[0]) ** 2 + (yy[None, :] - val[1]) ** 2 <= (radius ** 2)"
"        grid = grid + inside*val[3]"
"    return grid"
  )

  py:run "grid = getMap()"



  (py:run
  "def imager2(vector):"
  " x=int(vector[0])"
  " y=int(vector[1])"
  " if x > (i_width-1): x=0"
  " if y > (i_height-1): y=0"
  " pixel = pix[x,y]"
  " field =  pixel[0]+pixel[1]+pixel[2]"
  " return (math.sin(vector[0]*2*math.pi)*math.cos(vector[1]))*25 - field"
  )


  (py:run
    "def imager3(vector):"
    "    x=int(vector[0])"
    "    y=int(vector[1])"
    "    if x > 1506:x=0# (i_width-1): x=0"
    "    if y > 1051:y=0 # (i_height-1): y=0"
    "    pixel = grid[x][y]"
    "    field = pixel"
    "    return abs(math.sin(vector[0]*2*math.pi)*math.cos(vector[1]))*0.00001 - pixel"
  )

  (py:run
        "spaces = []"
        "spaces.append(np.linspace(0, 1505, 1000))"
        "spaces.append(np.linspace(0, 1050, 1000))"
        "X, Y = np.meshgrid(spaces[0], spaces[1])"
        "z = []"
        "for j in (spaces[1]):"
        "   for i in spaces[0]:"
        "      z.append(imager3([i, j]))"
        "z = np.reshape(z,(len(spaces[0]),len(spaces[1])))"
  )




;  py:run "model = HiveS.BeeHive(lower=[0] * 2, upper=[1049] * 2, fun=imager2, numb_bees=bees, max_itrs=(3000/(2 * bees)), max_trials=(2 * bees) / 2, bestLimit=(2 * bees), start_x=700, start_y=500)"
;  py:run "cost, b_vector = model.run()"
;  show py:runresult "b_vector"
;  py:setup py:python3
;  (py:run
;  "import matplotlib"
;  "matplotlib.use('TkAgg')"
;  "import numpy as np"
;  "import matplotlib.pyplot as plt"
;  "for i in range(10):"
;  "    plt.plot([ x ** i for x in range(0, 10) ])"
;  "plt.show()"
;  )






  if not ( file-exists? "map.csv" )
  [

    file-open "map.csv"  ;; Opening file for writing
    ask patches
    [
      file-write pxcor
      file-type ","
      file-write pycor
      file-type ","
      file-write pcolorSave
      file-print ""
    ]
    file-close


  ]


end

; *******************************************************************************

to-report dood
;  ask foodsources
  ;lopp
;  [
;    output-print word patchType
;  ]

  report foodsources
end




; *******************************************************************************



to-report NextActiveBeeREP
  ; determines which is the next bee to become active

 set ActiveBee first ActiveBeesSortedList ; this refers to a bee that in most cases JUST HAD BEEN active! (but not e.g.if the previously active bee just had died!)
 let persTime_activeBee [ personalTime_s ] of bee ActiveBee
 ; the actual position is somewhere between the minimal and the maximal position:
 let minPosition 0  ; counting of items in listst start with 0
 let maxPosition length ActiveBeesSortedList - 1  ; -1, as counting of items in list start with 0
 let currentPosition round (maxPosition / 2) ; don't know where the final position will be so currentPosition is set to right into the middle

 ; now the correct position is determined:
 while [ maxPosition - minPosition > 1 ]
  [
    ifelse [ personalTime_s ] of bee item currentPosition ActiveBeesSortedList > persTime_activeBee
      [
        set maxPosition currentPosition
        set currentPosition round ((currentPosition + minPosition) / 2)
      ]
      [
        set minPosition currentPosition
        set currentPosition round ((maxPosition + currentPosition) / 2)
      ]
  ]
  ; beginningList is activeList to currentposition & endList is currentPosition to end of list:
  let beginningList sublist ActiveBeesSortedList 0 currentPosition ; beginning to (excluding) currentPosition
  let endList sublist ActiveBeesSortedList currentPosition length ActiveBeesSortedList  ; from (including) currentPosition to end

  ; the activeBee is now removed from its original position..
  ;(if the number of bees in ActiveBeesSortedList is greater than 1, the first bee from the beginningList is removed, as this is the activeBee duplicated
                 ; if number of bees in list is 0, the first bee from the endList is removed, as this is the activeBee duplicated)
  ifelse length ActiveBeesSortedList > 1
   [ set beginningList but-first beginningList ]  ; first item of beginningList is removed
   [ set endlist but-first endlist ]               ; first item of endList is removed

  ;.. and then the activeBee is placed at its correct position
  ifelse (length endList = 1
          and persTime_activeBee > [ personalTime_s ] of bee item 0 endList )
   [ set ActiveBeesSortedList (sentence beginningList endList ActiveBee) ]
   [ set ActiveBeesSortedList (sentence beginningList ActiveBee endList) ]

  ; the new activeBee is now the first in the list:
  report first ActiveBeesSortedList
end

; *******************************************************************************



to BeekeepingProc



  ask colonies
 [

  let myColony who

  ; RELATIVE AMOUNTS TO BE FED:
  ; Calculate amount of NP to be fed to larvae relative to the amount they require for maximum growth
  let winterPauseStart 320 ; 320 = mid November
  let winterPauseStop 45 ; 45 = mid February
  let minWinterStore_kg 16 ; [kg] honey
  let minSummerStore_kg 3   ; [kg]
  let addedFondant_kg 1 ; [kg]
  let addedPollen_kg 0.5  ; [kg]

  if FeedBees = true
     and day < winterPauseStart
     and day > winterPauseStop
     and energyStore_kJ / ( ENERGY_HONEY_per_g * 1000 ) < minSummerStore_kg
       ; feeding colony in spring or summer
  [
    set TotalHoneyFed_kg TotalHoneyFed_kg + addedFondant_kg
    set energyStore_kJ energyStore_kJ + (addedFondant_kg * ENERGY_HONEY_per_g * 1000)
    output-type "Feeding colony on day "
    output-type ceiling (day mod 30.4374999) ; day
    output-type "."
    output-type floor(day / (365.25 / 12)) + 1 ; month
    output-type "."
    output-type ceiling (ticks / 365)     ; year
    output-type " Fondant provided [kg]: "
    output-type precision addedFondant_kg 1
    output-type " total food added [kg]: "
    output-print precision TotalHoneyFed_kg 1
    ask Signs with [shape = "ambrosia"] [ show-turtle]
  ]

  if FeedBees = true
    and day = winterPauseStart
    and energyStore_kJ / ( ENERGY_HONEY_per_g * 1000 ) < minWinterStore_kg
      ; feeding colony before winter
  [
    set TotalHoneyFed_kg TotalHoneyFed_kg
       + minWinterStore_kg
       -(HoneyEnergyStore / ( ENERGY_HONEY_per_g * 1000 ))

    ;output-type "Feeding colony on day "
;    output-type day
;    output-type ". Ambrosia fed [kg]: "
;    output-type precision (minWinterStore_kg - (HoneyEnergyStore / ( ENERGY_HONEY_per_g * 1000 ))) 1
;    output-type " total food added [kg]: "
;    output-print precision TotalHoneyFed_kg 1
    set energyStore_kJ minWinterStore_kg * 1000 * ENERGY_HONEY_per_g
       ; if honey store is smaller than minWinterStore it is filled up to minWinterStore

    ask Signs with [shape = "ambrosia"] [ show-turtle]
  ]

  ; ADD BEES TO WEAK COLONY - a weak colony is "merged" with another
  ; (not modelled!) weak colony (all of them are healthy):
  ask signs with [shape = "colonies_merged"] [ hide-turtle ]
  if MergeWeakColonies = true
    and (TotalIHbees + TotalForagers) < MergeColoniesTH
    and day = winterPauseStart
  [
    set TotalBeesAdded TotalBeesAdded + MergeColoniesTH
    output-type "Merging colonies in autumn! "
    output-type " # added bees: "
    output-type MergeColoniesTH
    output-type " total bees added: "
    output-print TotalBeesAdded
    ask signs with [shape = "colonies_merged"] [ show-turtle ]

;    create-foragerSquadrons (MergeColoniesTH / SQUADRON_SIZE)
;    [
;      set age 60 + random 40
;      setxy 30 9
;      set color grey
;      set size 2
;      set heading 90
;      set shape "bee_mb_1"
;      set mileometer random (MAX_TOTAL_KM / 5)
;      set activity "resting"
;      set activityList [ ]
;      set cropEnergyLoad 0 ; [kJ] no nectar in the crop yet
;      set collectedPollen 0 ; [g] no pollen pellets
;      set knownNectarPatch -1  ; -1 = no nectar Flower patch known
;      set knownPollenPatch -1 ; -1 = no pollen Flower patch known
;      set pollenForager false ; new foragers are nectar foragers
;      set infectionState "healthy"
;        ; possible infection states are: "healthy" "infectedAsPupa" "infectedAsAdult"
;    ]
  ]  ; if MergeWeakColonies = true  ...

  ; ADDING POLLEN IN SPRING:
  ask signs with [shape = "pollengrain"] [ hide-turtle ] ;vv pollen remapped from PollenStore_g to pollenStore_g
  if AddPollen = true and day = 90 ; day 90: end of March
  [
    ask signs with [shape = "pollengrain"] [ show-turtle ]
    set TotalPollenAdded TotalPollenAdded + addedPollen_kg
    output-type "Added pollen [kg]: "
    output-type addedPollen_kg
    output-type " total pollen added [kg]: "
    output-print TotalPollenAdded
    set pollenStore_g pollenStore_g + addedPollen_kg * 1000
  ]

  ask Signs with [shape = "honeyjar"] [ hide-turtle ]
  if ((Day >=  HarvestingDay)
    and (Day <  HarvestingDay + HarvestingPeriod)
    and (HoneyHarvesting = true))
      ; honey can only be harvested within HarvestingPeriod
  [
    if energyStore_kJ / ( ENERGY_HONEY_per_g * 1000 ) > HarvestingTH
    [
      set HarvestedHoney_kg (energyStore_kJ  / (ENERGY_HONEY_per_g * 1000)) - RemainingHoney_kg ;vv modified HoneyEnergyStore to Bumble's energyStore_kJ
      set energyStore_kJ energyStore_kJ - (HarvestedHoney_kg * ENERGY_HONEY_per_g * 1000)
      set TotalHoneyHarvested_kg TotalHoneyHarvested_kg + HarvestedHoney_kg
      output-type "Honey harvest on day "
      output-type ceiling (day mod 30.4374999)
      output-type "."
      output-type floor(day / (365.25 / 12)) + 1
      output-type "."
      output-type ceiling (ticks / 365)
      output-type ". Amount [kg]: "
      output-type precision HarvestedHoney_kg 1
      output-type " total honey harvested: "
      output-print precision TotalHoneyHarvested_kg 1
      ask Signs with [shape = "honeyjar"]
      [
        show-turtle
        set label precision HarvestedHoney_kg 1
      ]
    ]
  ]

  if QueenAgeing = true
  [
    let requeening true ; true
    if requeening = true and Queenage >= 375
    [
      set Queenage 10
      output-print word "New queen inserted on day " day
    ]  ; old queen is replaced by the beekeeper
   ]

  let treatmentDay 270   ; 270: 27.September
  let treatmentDuration 40  ; (28-40d) Fries et al. 1994
  let treatmentEfficiency 0.115
    ; (0.115) Fries et al. 1994 kills X*100% of phoretic mites each treatment Day

  ifelse ((varroaTreatment = true) and (Day >= treatmentDay)
    and (Day <=  treatmentDay + treatmentDuration )
    and (N_INITIAL_MITES_HEALTHY + N_INITIAL_MITES_INFECTED > 0))
    [
      set PhoreticMites round(PhoreticMites * (1 - treatmentEfficiency))
      ;ask signs with [shape = "x" or shape = "varroamite03"] [ show-turtle]
    ]
    [
      ;ask signs with [shape = "x" or shape = "varroamite03"] [ hide-turtle]
    ]
  ]
end


; *******************************************************************************


to MiteProc ; calls the Varroa related procedures
  CreateMiteOrganisersProc
  CountingProc ; updating number of brood & adults of drones & workers
  MitesInvasionProc
  MitePhoreticPhaseProc
  MiteDailyMortalityProc
  MiteOrganisersUpdateProc
end


; ********************************************************************************************************************************************************************************

to CountingProc
  ask colonies [
    let thisColony who
  ; counts # bees in different stages, castes CALLED BY: 1. BroodCareProc 2. Go 3. MiteProcedure

  ; WORKERS:

   set TotalEggs allEggs
   set TotalLarvae allLarvae
   set TotalPupae allPupae
   set TotalIHbees allAdultWorkers
   set TotalForagers allForagers

;vv asdfg
  ; DRONES:
  ;set TotalDroneEggs 0 ask DroneEggCohorts [ set TotalDroneEggs (TotalDroneEggs + number)]
  ;set TotalDroneLarvae 0 ask DroneLarvaeCohorts [ set TotalDroneLarvae (TotalDroneLarvae + number)]
  ;set TotalDronePupae 0 ask DronePupaeCohorts [ set TotalDronePupae (TotalDronePupae + number)]
  ;set TotalDrones 0 ask DroneCohorts [ set TotalDrones (TotalDrones + number)]
  ;set TotalWorkerAndDroneBrood TotalEggs + TotalLarvae + TotalPupae + TotalDroneEggs + TotalDroneLarvae + TotalDronePupae

  set TotalDroneEggs count bees with [stage = "egg" and colonyId = thisColony and caste = "male"]
  set TotalDroneLarvae count bees with [stage = "larva" and colonyId = thisColony and caste = "male"]
  set TotalDronePupae count bees with [stage = "pupa" and colonyId = thisColony and caste = "male"]
  set TotalDrones count bees with [stage = "adult" and colonyId = thisColony and caste = "male"]
  set TotalWorkerAndDroneBrood TotalEggs + TotalLarvae + TotalPupae;


  if TotalEggs  < 0 OR TotalLarvae < 0 OR TotalPupae < 0 OR TotalIHbees < 0 OR TotalForagers < 0
  [
    set BugAlarm true
    output-show (word ticks " BUG ALARM! negative number in total bees")
    type "TotalEggs: "
    type TotalEggs
    type " TotalLarvae: "
    type TotalLarvae
    type " TotalPupae: "
    type TotalPupae
    type " TotalIHbees: "
    type TotalIHbees
    type " TotalForagers: "
    print TotalForagers
  ]

  ask turtles
  [
    if number < 0
    [
      set BugAlarm true
      type (word ticks " BUG ALARM! negative number in turtles: ")
      show number
      ]
  ]

  if TotalMites < 0 or PhoreticMites < 0 or PhoreticMitesHealthyRate > 1  or PhoreticMitesHealthyRate < 0
  [
    set BugAlarm true
    output-show (word ticks " BUG ALARM! Check number of mites and PhoreticMitesHealthyRate!")
    type "PhoreticMitesHealthyRate: "
    type PhoreticMitesHealthyRate
    type " TotalMites: "
    type TotalMites
    type " PhoreticMites: "
    type PhoreticMites
  ]

  ask (turtle-set pupaeCohorts dronePupaeCohorts droneCohorts)
  [
    if number != number_infectedAsPupa + number_healthy
    [
      set BugAlarm true
      show "BUG ALARM! (CountingProc) number <> healthy + infected"
    ]
  ]

  ask IHbeeCohorts
  [
    if number != number_infectedAsAdult + number_infectedAsPupa + number_healthy
    [
      set BugAlarm true
      show "BUG ALARM! (CountingProc) number <> healthy + infected (IH-bees)"
    ]
  ]
  ]
end




to CreateMiteOrganisersProc
  ; called by MiteProc, creates a single miteOrganiser turtle, that
  ; stores info on number and distribution of mites newly invaded into the brood cells
  ask colonies
  [
  hatch-miteOrganisers 1
  [
;    setxy -1 -7
;    set heading 0
;    set size 1.3
;    set color 33.5
;    set shape "VarroaMite03"   ;"Virus1" ;"VarroaMite03"
    set workerCellListCondensed n-values (MAX_INVADED_MITES_WORKERCELL + 1) [ 0 ]
      ; +1 as also the number of mite free cells is stored in this list

    set droneCellListCondensed n-values (MAX_INVADED_MITES_DRONECELL + 1) [ 0 ]
      ; +1 as also the number of mite free cells is stored in this list

    set label-color white
    set cohortInvadedMitesSum 0
      ; sum of all mites that invaded a worker or drone cell on the same Day

    set invadedMitesHealthyRate PhoreticMitesHealthyRate
      ; rate of healthy mites in this cohort of invading mites equals the rate of healthy
      ; phoretic mites on this day

    set mite_age INVADING_WORKER_CELLS_AGE
      ; "age" refers to mite_age of invaded brood. If mite_age for invasion differs in
      ; worker and drone brood..

    if INVADING_DRONE_CELLS_AGE < INVADING_WORKER_CELLS_AGE
    [
      set mite_age INVADING_DRONE_CELLS_AGE
    ] ; ..then mite_age refers to the younger of both
  ]
  ]
end

; ********************************************************************************************************************************************************************************

to MitesInvasionProc
   ask colonies
  [
  ; called by MiteProc  calculates the number of phoretic mites that
  ; enter worker and drone brood cells on this day based on: Calis et al. 1999, Martin 2001

  let factorDrones 6.49  ; (Boot et al. 1995, Martin 2001)
  let factorWorkers 0.56 ; (Boot et al. 1995, Martin 2001)
  let adultsWeight_g (TotalIHbees + TotalForagers) * WEIGHT_WORKER_g
    ; weight of all adult worker bees
  let invadingBroodCellProb 0
    ; probability for a phoretic mite to enter any suitable brood cell
  let invadingWorkerCellProb 0
    ; probaility to invade a worker cell (only if any cell was invaded)
  let suitableWorkerCells 0
  let suitableDroneCells 0
    ; number of worker and drone cells, that are suitable for mite invasion
  let rD 0
  let rW 0
    ; rD, rW: Rate of invasion into Drone cells and Worker cells (Boot et al. 1995)

  ask larvaeCohorts with [ mite_age = INVADING_WORKER_CELLS_AGE ]
  [
    set suitableWorkerCells number
  ] ; (age = 8) mites enter worker larvae cells ~1d before capping (at 9d age) (Boot, Calis, Beetsma 1992)

  ask droneLarvaeCohorts with [ mite_age = INVADING_DRONE_CELLS_AGE ]
  [
    set suitableDroneCells number
  ]  ; (age = 8) mites enter drone larvae cells ~ 2d before capping (at 10d age) (Boot, Calis, Beetsma 1992)

  if adultsWeight_g > 0
  [ ; invasion rates in worker and drone cells:
    set rW factorWorkers * (suitableWorkerCells / adultsWeight_g)  ; (Martin 1998, 2001; Calis et al.1999)
    set rD factorDrones * (suitableDroneCells / adultsWeight_g)
  ]

  let exitingMites 0
    ; # mites, that theoretically should invade cells but leave it immediatly,
    ; because the cell is already invaded by the max. number of mites

  let workerCellListTemporary n-values suitableWorkerCells [ 0 ]
    ; two temporary lists of all suitable worker/drone cells, to store
    ; the number of mites in each cell..

  let droneCellListTemporary n-values suitableDroneCells [ 0 ]
    ; .. of which later the number of cells invaded by 0, 1, 2.. mites can be calculated

  let cell -1
    ;  stores randomly chosen cell, which is invaded by a mite in the below
    ; "repeat phoreticMites.." process. -1 will be changed to a random number >= 0

  set InvadingMitesWorkerCellsTheo 0
  set InvadingMitesDroneCellsTheo 0
  set invadingBroodCellProb (1 - (exp (-(rW + rD))))
    ; probability for a phoretic mite to enter a brood cell; similar to
    ; Martin 2001, however: we use probability instead of proportion

  if rW + rD > 0 ; if invasion takes place..
  [
    set invadingWorkerCellProb (rW / (rW + rD))
  ]

  ; based on the Boot/Martin/Calis rates of cell invasion, which are used as probabilities,
  ; it is calculated how many phoretic mites enter a brood cell, and whether it is
  ; a drone or a worker cell; each invading mite is then associated with a random brood
  ; cell number (WorkerCellsInvasionList), finally, the mites in each "brood cell" are
  ; counted and saved in the condensed nMitesInCellsList
  repeat PhoreticMites
  [
    if random-float 1 < invadingBroodCellProb
      ; mites have a chance to enter a brood cell
    [
      ifelse random-float 1 < invadingWorkerCellProb ; the brood cell might be a WORKER cell
        [
          set InvadingMitesWorkerCellsTheo InvadingMitesWorkerCellsTheo + 1
            ; mites entering worker cells are counted

          set cell random suitableWorkerCells
            ; randomly, one of the suitable WORKER cells is invaded by a mite

          set WorkerCellListTemporary replace-item cell WorkerCellListTemporary
            (item cell WorkerCellListTemporary + 1)
            ; this list contains all worker cells and the number of mites
            ; invading into each cell
        ]
        [
          ; ELSE: invasion into DRONE cell
          set InvadingMitesDroneCellsTheo InvadingMitesDroneCellsTheo + 1
          set cell random suitableDroneCells
            ; randomly, one of the suitable drone cells is invaded by a mite

          set DroneCellListTemporary replace-item cell DroneCellListTemporary
            (item cell DroneCellListTemporary + 1)
            ; this list contains all drone cells and the number of mites
            ; invading into each cell
        ]
    ]
  ]

  ; excess of invaded mites: # mites in each cells is restricted to MAX_INVADED_MITES:
  let counter 0
  foreach WorkerCellListTemporary
  [
    ; (note: items are addressed in ordered way - NOT randomly)
    this-variable8 -> if this-variable8 > MAX_INVADED_MITES_WORKERCELL
    [
      set exitingMites exitingMites + (this-variable8 - MAX_INVADED_MITES_WORKERCELL)
        ; if too many mites in cells: they leave the cell ("?": # of mites in the cell)

      set WorkerCellListTemporary replace-item
        counter WorkerCellListTemporary MAX_INVADED_MITES_WORKERCELL
          ; .. mites left in the cell = max. mites in worker cell
    ]

    set counter counter + 1
  ]
  set InvadingMitesWorkerCellsReal InvadingMitesWorkerCellsTheo - exitingMites

  ; and the same for the drones..
  set counter 0  ; resetting the counter

  foreach DroneCellListTemporary
  [
    this-variable9 -> if this-variable9 > MAX_INVADED_MITES_DRONECELL
    [
      set exitingMites exitingMites + (this-variable9 - MAX_INVADED_MITES_DRONECELL)
        ; if too many mites in cells: they leave the cell ("?": # of mites in the cell)

      set DroneCellListTemporary replace-item counter
        DroneCellListTemporary MAX_INVADED_MITES_DRONECELL
        ; .. mites left in the cell = max. mites in drone cell
    ]
    set counter counter + 1
  ]

  set InvadingMitesDroneCellsReal InvadingMitesDroneCellsTheo
    - exitingMites
    + (InvadingMitesWorkerCellsTheo - InvadingMitesWorkerCellsReal)
      ; mites invaded drone cells = mites theor. invading drone cells
      ; - mites exiting drone&worker cells
      ; + mites exiting worker cells (here: exitingMites: sum of worker&drone cell mites!)

  set PhoreticMites PhoreticMites
    - InvadingMitesWorkerCellsTheo
    - InvadingMitesDroneCellsTheo
    + exitingMites
      ; # of phoretic mites left (=phor.mites - invading mites
      ; + mites immediately leaving cells and become phoretic again

  if PhoreticMites < 0
  [
    user-message "Error in MitesInvasionProc - negative number of phoretic Mites"
    set BugAlarm true
  ] ; assertion

  let memory -1 ; -1: = no cohort invaded

  ask miteOrganisers with [age = INVADING_WORKER_CELLS_AGE]
  [
    foreach workerCellListTemporary
      ; checks the list that contains all worker brood cells for
      ; how many mites have entered..
    [
     this-variable10 -> set workerCellListCondensed replace-item this-variable10 workerCellListCondensed
        ((item this-variable10 workerCellListCondensed) + 1)
    ]  ; sums up the number of cells entered by 0, 1,2..n mites in the mitesOrganisers own list

    set cohortInvadedMitesSum cohortInvadedMitesSum + InvadingMitesWorkerCellsReal

    let whoMO who  ; stores the "who" of the current miteOrganiser
    ask larvaeCohorts with [age = INVADING_WORKER_CELLS_AGE]
    [
      set invadedByMiteOrganiserID whoMO
      set memory who
    ]
    set invadedWorkerCohortID memory
  ] ; "ask miteorganisers ..."

  ask miteOrganisers with [age = INVADING_DRONE_CELLS_AGE]
  [
    foreach droneCellListTemporary
      ; checks the list that contains all drone brood cells for
      ; how many mites have entered..
    [
      this-variable11 -> set droneCellListCondensed replace-item this-variable11 droneCellListCondensed
        ((item this-variable11 droneCellListCondensed) + 1)
    ] ; sums up the cell entered by 0, 1,2..n mites in the mitesOrganisers own list

    set cohortInvadedMitesSum cohortInvadedMitesSum + InvadingMitesDroneCellsReal
    set memory -1  ; -1: = no cohort invaded

    ask droneLarvaeCohorts with [age = INVADING_DRONE_CELLS_AGE]
    [
      set memory who
    ]
    set invadedDroneCohortID memory
    let whoMO who  ; stores the "who" of the current miteOrganiser

    ask droneLarvaeCohorts with [ mite_age = INVADING_DRONE_CELLS_AGE ]
    [
      set invadedByMiteOrganiserID whoMO
    ]
  ] ; "ask miteOrganisers with ..."

  if (PhoreticMites + InvadingMitesWorkerCellsReal
    +  InvadingMitesDroneCellsReal) > 0 ; avoid div 0!
  [
    set PropNewToAllPhorMites NewReleasedMitesToday
      / ( PhoreticMites + InvadingMitesWorkerCellsReal + InvadingMitesDroneCellsReal)
  ] ; Proportion of new emerged phoretic mites (today) to all phoretic mites
    ; present (needed in the MitePhoreticPhaseProc to determine # of newly infected phoretic mites etc)
  ]
end

; ********************************************************************************************************************************************************************************

to-report MiteDensityFactorREP [ ploidyMiteOrg mitesIndex ]
  ; reports the (single) density factor for a certain number of invaded mites
  ; depending on ploidy of bee brood and chosen reproduction model

  let dataList []

  if MiteReproductionModel = "Martin"
  [ ifelse ploidyMiteOrg = 2
    [ set dataList [ 0 1 0.91 0.86 0.60 ] ]
      ; workers  (list length: 5) [ 0 1 0.91 0.86 0.60 ]
      ; from Martin 1998, Tab. 4; first value (0) doesn't matter, as no
      ; mother mite invaded these cells

    [ set dataList [ 0 1 0.84 0.65 0.66 ] ]
  ]   ; drones (list length: 5)  [ 0 1 0.84 0.65 0.66 ] from Martin 1998, Tab. 4

  if MiteReproductionModel = "Fuchs&Langenbach"
  [
    ifelse ploidyMiteOrg = 2
      [ set dataList [ 0 1 0.96 0.93 0.89 0.86 0.82 0.79 0 ]]
        ; workers   (list length: 9) calculated from Fuchs&Langenbach 1989 Tab.III
      [ set dataList [ 0 1 0.93 0.86 0.80 0.73 0.66 0.59 0.52 0.45 0.39 0.32 0.25 0.18 0.11 0.05 0 ] ]
  ]  ; (list length: 17) calculated from Fuchs&Langenbach 1989 Tab.III

  if MiteReproductionModel = "No Mite Reproduction"  ; only for model testing
  [
    ifelse ploidyMiteOrg = 2
      [ set dataList [ 0 1 1 1 1 1 ] ] ; workers   (list length: 6)
      [ set dataList [ 0 1 1 1 1 1 ] ]
  ]  ; drones  (list length: 6)

  if MiteReproductionModel = "Martin+0"
    ; like Martin, but max # of mites in brood cell is increased by
    ; one with a rel. reprod. rate of 0 (= 0 at the end of the list)

  [ ; Martin Test with 0
    ifelse ploidyMiteOrg = 2
      [ set dataList [ 0 1 0.91 0.86 0.60 0 ] ]
        ; workers   (list length: 6) [ 0 1 0.91 0.86 0.60 0 ]
        ; from Martin 1998, Tab. 4; first value (0) doesn't matter, as no
        ; mother mite invaded these cells
      [ set dataList [ 0 1 0.84 0.65 0.66 0 ] ]
  ]  ; drones (list length: 6)  [ 0 1 0.84 0.65 0.66 0 ] from Martin 1998, Tab. 4

  report item mitesIndex dataList

end

; ********************************************************************************************************************************************************************************

to-report  MiteOffspringREP [ ploidyMiteOrg ]
  ; reports offspring per mite depending on ploidy of bee brood and chosen reproduction model

  let result 0
  if ploidyMiteOrg != 1 and ploidyMiteOrg != 2
  [
    set BugAlarm true
    type "BUG ALARM in MiteOffspringREP! Wrong ploidyMiteOrg: "
    print ploidyMiteOrg
  ]

  if MiteReproductionModel = "Martin" or MiteReproductionModel = "Martin+0"
  [
    ifelse ploidyMiteOrg = 2
      [ set result 1.01 ]
        ; workers (1.01: Martin 1998; fertilisation already taken into account)

      [ set result 2.91 ]
  ]     ; drones (2.91: Martin 1998; fertilisation already taken into account)

 if MiteReproductionModel = "Fuchs&Langenbach"
 [
   ifelse ploidyMiteOrg = 2
     [ set result 1.4 * 0.95 ]
       ; workers (1.4: Fuchs&Langenbach 1989; of which 5% are
       ; unfertilised (Martin 1998 p.271))
     [ set result 2.21 * 0.967 ]
 ]  ; drones (2.21: Fuchs&Langenbach 1989; of which 3.3% are unfertilised (Martin 1998 p.271))

 if MiteReproductionModel = "No Mite Reproduction"  ; only for model testing
 [
   ifelse ploidyMiteOrg = 2
      [ set result 0 ]   ; workers
      [ set result 0 ]
 ] ; drones

 report result
end

; ********************************************************************************************************************************************************************************

; MitesReleaseProc: determines how many healthy and infected mites emerge from cells with a) dead or b) emerging bees
; CALLED BY: WorkerLarvaeDevProc (dying), DroneLarvaeDevProc (dying), WorkerPupaeDevProc (2x, for dying & emerging brood)
; DronePupaeDevProc (2x, for dying & emerging brood), BroodCareProc (4x, dying of drone & worker larvae & pupae)

; .. all these procedures are called BEFORE the mite module (MiteProc)!

to MitesReleaseProc [ miteOrganiserID ploidyMiteOrg diedBrood releaseCausedBy ]
  ask colonies[
    ; 1. rate of healthy mites in the cellList 2. the relevant worker/drone
    ; cellListCondensed 3.  # died broodCells (0..n) 4. "emergingBrood" or "dyingBrood"

  let cellListCondensed []
    ; to not double the code for worker and drones, the local variable
    ; cellListCondensed is defined which stores EITHER the workerCellListCondensed
    ; OR the droneCellListCondensed

  let mitesInfectedSumUncappedCells 0
    ; sums up the infected mites of the current cohort

  let mitesHealthySumUncappedCells 0 ; sums up the healthy mites of the current cohort
  let mitesHealthy&InfectedSumUncappedCells 0
    ; sums up the healthy and infected mites of the current cohort

  let nPhoreticMitesBeforeEmergenceHealthy round (PhoreticMitesHealthyRate * PhoreticMites)
    ; saves the number healthy phoretic mites before the new mites emerge from their
    ; cells - necessary to calculate new PhoreticMitesHealthyRate

  let nPhoreticMitesBeforeEmergenceInfected PhoreticMites - nPhoreticMitesBeforeEmergenceHealthy
    ; saves the number infected phoretic mites before the new mites emerge from
    ; their cells - necessary to calculate new PhoreticMitesHealthyRate

  let healthyRateMiteOrg 0
    ; proportion of healthy mites in the current cohort (miteOrganiser)

  let totalCells 0
    ; number of brood cells in the current cohort

  let releasedPupaeCohortsID -1

  let repetitions MAX_INVADED_MITES_WORKERCELL + 1
    ; to count the brood cells; (for worker cells); +1 as cells can also bee mite free
  if ploidyMiteOrg = 1
  [
    set repetitions MAX_INVADED_MITES_DRONECELL + 1
  ] ; ..the same for drone cells, +1 as cells can also bee mite free

  ; to save the required "cellListCondensed" and to determine the "who"
  ; of the affected (worker or drone) pupaeCohort:
  ask miteOrganisers with [ who = miteOrganiserID ]
  [
    ifelse ploidyMiteOrg = 1
      [
        set cellListCondensed droneCellListCondensed
          ; IF DRONES: local cellListCondensed =  droneCellListCondensed
        set releasedPupaeCohortsID invadedDroneCohortID
      ]   ; ... and affected droneCohort is the miteOrganisers "invadedDroneCohortID"
      [
        set cellListCondensed workerCellListCondensed
          ; ELSE WORKERS: local cellListCondensed = workerCellListCondensed
        set releasedPupaeCohortsID invadedWorkerCohortID
      ]  ; ... and affected workerCohort is the miteOrganisers "invadedWorkerCohortID"
    set healthyRateMiteOrg invadedMitesHealthyRate
      ; saves the rate of healthy mites invaded to the current miteOrganiser
  ]

  let i 0
  repeat repetitions
  ; repetitions = MAX_INVADED_MITES_WORKER/DRONE_CELL + 1
  [
    ; counts the # of cells in the cellList
    set totalCells totalCells + (item i cellListCondensed)
    set i i + 1
  ]

  let uncappedCells 0  ; number of cells that are uncapped ...
  if releaseCausedBy = "dyingBrood" [ set uncappedCells diedBrood  ]
    ; .. because some pupae died..

  if releaseCausedBy = "emergingBrood" [ set uncappedCells totalCells  ]
    ; .. or because all pupae emerge

  if releaseCausedBy != "dyingBrood" and  releaseCausedBy != "emergingBrood"
  [
    set BugAlarm true
    type "BUG ALARM in ReleaseMitesProc(1)! releaseCausedBy: "
    print releaseCausedBy
  ]  ; assertion

  repeat uncappedCells
  [
    ; uncapped brood cells are randomly chosen from all brood cells of
    ; this cohort. These cells may contain 0,1,2..invadedMitesCounter mites.
    ; These mother mites are released from the cell WITH OR WITHOUT
    ; reproduction and become phoretic

    let randomCell (random totalCells) + 1
      ; choses a random cell -> 1..totalCells (+1 as: random n = 0, 1, ..n-1)
      ; (totalCells is decreased at the end of each repetition by 1)

    let cellCounter 0
    let allMitesInSingleCell -1
      ; starting value of allMitesInSingleCell: -1 as it is increased by 1 in the
      ; following "while" loop
      ; allMitesInSingleCell: # of mites that invaded the randomly chosen cell

    while [ cellCounter < randomCell ]
      ; determines, by how many mites the "random cell"
      ; is invaded: sums up the # of cells invaded by 0 mites (1st loop)
      ; by 1 mite (2nd loop) etc. until the cellCounter >= randomCell
      ; the number of mites in random cell is then allMitesInSingleCell
    [
      set allMitesInSingleCell allMitesInSingleCell + 1
        ; in 1st loop: allMitesInSingleCell = 0! (i.e. item 0 = first item in list = 0 mites)
        ; in 2nd loop: 1 mite etc.

      set cellCounter cellCounter + (item allMitesInSingleCell cellListCondensed)
        ; cellCounter is increased by the # of cells with x mites in it
        ; (x = allMitesInSingleCell, i.e. 0,1,2..n)
    ]

    ; how many of the released mites are infected? -> 1. how many infected
    ; mites entered? 2. did they infect the larva? 3. how many healthy mites become
    ; infected by the infected larva?
    let mitesIndex allMitesInSingleCell
      ; to address the correct item in the cellListCondensed after mite
      ; reproduction (i.e. when allMitesInSingleCell has changed)

    let pupaInfected false ; a young larva is healthy
    let infectedMitesInSingleCell 0
      ; the number of mites that were diseased on day of cell invasion

    repeat allMitesInSingleCell
    [
      ; invaded mites might be infected: repeat over all mites in the current brood cell
      if random-float 1 > healthyRateMiteOrg
      [
        set infectedMitesInSingleCell infectedMitesInSingleCell + 1
        ; this invaded mite was infected when invading the cell and is now counted as infected
      ]
    ]

    let healthyMitesInSingleCell allMitesInSingleCell - infectedMitesInSingleCell
      ; healthy invaded mites are all invaded mites minus infected ones

    if random-float 1 > (1 - VIRUS_TRANSMISSION_RATE_MITE_TO_PUPA) ^ infectedMitesInSingleCell
    [
      set pupaInfected true
    ] ; as soon as at least 1 infected mite successfully infects the bee pupa, the bee pupa is infected

    ; PUPA ALIVE OR DEAD? (either died normally, died due to lack of nursing or killed by virus
    let pupaAlive 1 ; (0 or 1) 1: = "yes", pupa is alive 0: = "no", pupa is dead
    if pupaInfected = true
    [
      if random-float 1 < VIRUS_KILLS_PUPA_PROB
      [
        set pupaAlive 0
      ]
    ] ; infected pupa might be killed by the virus. In this case:
      ; no offspring mites but still transmission of viruses to healthy mites in this cell
      ; (at least for DWV)

    if releaseCausedBy = "dyingBrood"
    [
      set pupaAlive 0
    ] ; larva/pupa is dead, if MitesReleaseProcis called, BECAUSE the brood died..

    if releaseCausedBy = "emergingBrood" and allMitesInSingleCell > 0
    [
      ; callow bees are emerging and with them the invaded mother mites and their offspring
      if pupaAlive = 0
      [
        ask turtles with [ who = releasedPupaeCohortsID ]
        [
          set number number - 1
            ; pupa died, hence the number of bees in this pupae cohort is reduced by 1
          set number_healthy number_healthy - 1
            ; pupa dies due to virus infection and has previously been healthy
          set Pupae_W&D_KilledByVirusToDay Pupae_W&D_KilledByVirusToDay + 1
        ]
      ]

      ; surviving but infected pupae:
      if pupaAlive = 1 and pupaInfected = true
      [
        ask turtles with [ who = releasedPupaeCohortsID ]
        [
          set number_infectedAsPupa number_infectedAsPupa + 1
          ; the bee was infected as pupa
          set number_healthy number_healthy - 1
          ; the pupa has become infected and is no longer healthy
        ]
      ]

      let averageOffspring
        random-poisson (MiteOffspringREP ploidyMiteOrg * MiteDensityFactorREP ploidyMiteOrg mitesIndex)
        ; average # offspring of a single mother mite in the single cell (depends on ploidy of bee pupa and # invaded mites)

      set healthyMitesInSingleCell allMitesInSingleCell
        * averageOffspring
            ; Offspring: all mites in cell x reprod. rate. NOTE: also infected mites
            ; may have healthy offspring! (MiteOffspringREP: reports # offspring for
            ; 1 mite in single invaded cell, for drones or workers)
        * pupaAlive
          ; pupaAlive =  1 or 0; if pupa is alive: normal mite reproduction, if dead:
          ; offspring = 0
        + healthyMitesInSingleCell             ; + mother mites

      set healthyMitesInSingleCell round healthyMitesInSingleCell
      ; this line is NOT NECESSARY as averageOffspring is integer!
      set allMitesInSingleCell healthyMitesInSingleCell + infectedMitesInSingleCell
        ; update of total mites in the cell
    ]  ; END of "if releaseCausedBy = 'emergingBrood' "

    if pupaAlive = 1 and pupaInfected = true
    [
      ; if the bee pupa was infected by an infected mite AND IS STILL ALIVE,
      ; then the healthy mites (invaded or offspring) might become infected too

      repeat healthyMitesInSingleCell
      [
        ; all healthy mites have then the risk to become infected too
        if random-float 1 < VIRUS_TRANSMISSION_RATE_PUPA_TO_MITES
        ; if random number < the transmission rate from bee pupa to mite, the healthy
        ; mite becomes infected
        [
          set healthyMitesInSingleCell healthyMitesInSingleCell - 1
            ; hence: the number of healthy released mites decreases by 1..

          set infectedMitesInSingleCell infectedMitesInSingleCell + 1
        ]  ; .. and the number of infected released mites increases by 1
      ] ; end of 'repeat sumInvadedMitesHealthy'
    ] ; end of 'IF pupaInfected' - now the numbers of healthy and infected (mother) mites in
    ; single cell is known (= healthyMitesInSingleCell and infectedMitesInSingleCell)

    if healthyMitesInSingleCell + infectedMitesInSingleCell != allMitesInSingleCell
    [
      set BugAlarm true
      type "BUG ALARM in ReleaseMitesProc(2)! allMitesInSingleCell: "
      type allMitesInSingleCell
      type " infectedMitesInSingleCell: "
      type infectedMitesInSingleCell
      type " healthyMitesInSingleCell: "
      print healthyMitesInSingleCell
    ]

    ; MITE FALL:
    let miteFallProb MITE_FALL_DRONECELL
    if ploidyMiteOrg = 2
    [
      set miteFallProb MITE_FALL_WORKERCELL
    ] ; probabilities of mites to fall from comb, depending on cell type

    repeat healthyMitesInSingleCell
    [ ; determined for healthy and infected mites separately
      if random-float 1 < miteFallProb
      [
        set healthyMitesInSingleCell healthyMitesInSingleCell - 1
        set allMitesInSingleCell allMitesInSingleCell - 1
        set DailyMiteFall DailyMiteFall + 1
      ]
    ]

    repeat infectedMitesInSingleCell
    [
      if random-float 1 < miteFallProb
      [
        set infectedMitesInSingleCell infectedMitesInSingleCell - 1
        set allMitesInSingleCell allMitesInSingleCell - 1
        set DailyMiteFall DailyMiteFall + 1
      ]
    ]

    set mitesHealthySumUncappedCells mitesHealthySumUncappedCells + healthyMitesInSingleCell
      ; sums up all healthy mites emerging from current cohort
      ; (set to 0 at beginning of this procedure)

    set mitesInfectedSumUncappedCells mitesInfectedSumUncappedCells + infectedMitesInSingleCell
      ; same for infected mites (set to 0 at beginning of this procedure)

    set PhoreticMites PhoreticMites + allMitesInSingleCell
      ; mother mites in this uncapped brood cell are released from the brood
      ; cell and become phoretic..

    set mitesHealthy&InfectedSumUncappedCells
      mitesHealthy&InfectedSumUncappedCells + allMitesInSingleCell
        ; released mites from all brood cell in this cohort are totaled up

    set cellListCondensed replace-item mitesIndex cellListCondensed
      (item mitesIndex cellListCondensed - 1)
        ; .. and one brood cell is removed; mitesIdex: number of mother mites that
        ; invaded the brood cell

    if item mitesIndex cellListCondensed < 0
    [
      set BugAlarm true
      type "BUG ALARM in ReleaseMitesProc(3)! Negative number in cellListCondensed (releaseMitesProc)! "
      show cellListCondensed
    ]

    set totalCells totalCells - 1
      ; number of total brood cells in this cohort is reduced by 1

    if totalCells < 0
    [
      set BugAlarm true
      type "BUG ALARM in ReleaseMitesProc(4)! Negative number of  total cells in releaseMitesProc: "
      print totalCells
    ]
  ] ; END OF "REPEAT UNCAPPEDCELLS"

  set NewReleasedMitesToday
    NewReleasedMitesToday + mitesHealthy&InfectedSumUncappedCells
      ; # of newly released (mother+offspring) mites (only those that survived
      ; MiteFall) is summed up (set to 0 in DailyUpdateProc)

  if mitesInfectedSumUncappedCells + mitesHealthySumUncappedCells
     != mitesHealthy&InfectedSumUncappedCells
  [ ; assertion
    set BugAlarm true
    type "BUG ALARM in ReleaseMitesProc(5)! mitesInfectedSumUncappedCells: "
    type mitesInfectedSumUncappedCells
    type " mitesHealthySumUncappedCells: "
    type mitesHealthySumUncappedCells
    type " mitesHealthy&InfectedSumUncappedCells: "
    print mitesHealthy&InfectedSumUncappedCells
  ]

  if mitesInfectedSumUncappedCells < 0 or mitesHealthySumUncappedCells < 0
  [ ; assertion
    set BugAlarm true
    type "BUG ALARM in ReleaseMitesProc(6)! mitesInfectedSumUncappedCells: "
    type mitesInfectedSumUncappedCells
    type " mitesHealthySumUncappedCells: "
    type mitesHealthySumUncappedCells
    type " mitesHealthy&InfectedSumUncappedCells: "
    print mitesHealthy&InfectedSumUncappedCells
  ]

 ; Updating of the actual cell lists - either for the drone or for the worker brood:
  ask miteOrganisers with [ who = miteOrganiserID ]
  [ ; assertion
    if ploidyMiteOrg = 1 [ set droneCellListCondensed cellListCondensed ]    ; IF drones
    if ploidyMiteOrg = 2 [ set workerCellListCondensed cellListCondensed ]    ; IF workers
    if (ploidyMiteOrg != 1) and (ploidyMiteOrg != 2)
    [
      set BugAlarm true
      type "BUG ALARM in releaseMitesProc(7)! Wrong ploidyMiteOrg: "
      print ploidyMiteOrg
    ]
                                                    ]
  ; UPDATE of the healthy mite rate:
  if ( nPhoreticMitesBeforeEmergenceHealthy
       + nPhoreticMitesBeforeEmergenceInfected
       + mitesHealthySumUncappedCells
       + mitesInfectedSumUncappedCells) > 0
  [
    set PhoreticMitesHealthyRate
      ( nPhoreticMitesBeforeEmergenceHealthy + mitesHealthySumUncappedCells)
        / ( nPhoreticMitesBeforeEmergenceHealthy
            + nPhoreticMitesBeforeEmergenceInfected
            + mitesHealthySumUncappedCells
            + mitesInfectedSumUncappedCells )
  ]
  ]
 end

; ********************************************************************************************************************************************************************************

to MiteDailyMortalityProc
  ask colonies
  [
  ifelse ( TotalEggs + TotalLarvae
           + TotalPupae + TotalDroneEggs
           + TotalDroneLarvae + TotalDronePupae) > 0 ; is it within brood period?
    [
      set PhoreticMites
        (PhoreticMites - random-poisson (PhoreticMites *  MITE_MORTALITY_BROODPERIOD))
    ]  ; IF brood is present
    [
      set PhoreticMites
      (PhoreticMites - random-poisson (PhoreticMites *  MITE_MORTALITY_WINTER))
    ] ; ELSE: if no brood is present
  ]
end

; ********************************************************************************************************************************************************************************

to MitePhoreticPhaseProc
  ask colonies [
  ; infection of healthy worker bees via infected phoretic mites and of
  ; healthy phoretic mites via infected workers; Called daily by MiteProc

  let healthyPhoreticMites round (PhoreticMites * PhoreticMitesHealthyRate)
    ; # of healthy, phoretic mites is calculated from the rate of healthy phoretic mites

  let infectedPhoreticMites PhoreticMites - healthyPhoreticMites
    ; all other phoretic mites are infected

  let phoreticMitesPerIHbee 0

  if ( TotalIHbees + InhivebeesDiedToday
       + NewForagerSquadronsHealthy
       + NewForagerSquadronsInfectedAsPupae
       + NewForagerSquadronsInfectedAsAdults > 0 ) ; avoid division by 0
  [
    set phoreticMitesPerIHbee
       ( PhoreticMites - NewReleasedMitesToday)
         / (TotalIHbees + InhivebeesDiedToday
            + SQUADRON_SIZE *
               ( NewForagerSquadronsHealthy
                 + NewForagerSquadronsInfectedAsPupae
                 + NewForagerSquadronsInfectedAsAdults
               )
           )
  ] ; phoretic mites are assumed to infest only inhive bees,
    ; "ih-bees" here = current ih-bees + ih-bees died today
    ;                  + ih-bees developed into foragers today!

 ; mites are released from inhive bees, if ih-bees die or develop into foragers:
  let mitesReleasedFromInhivebees
    precision
       (
        phoreticMitesPerIHbee
         * ( InhivebeesDiedToday  ; died ih-bees
             + SQUADRON_SIZE      ; new foragers:
              * ( NewForagerSquadronsHealthy
                  + NewForagerSquadronsInfectedAsPupae
                  + NewForagerSquadronsInfectedAsAdults
                )
            )
       ) 5

  if mitesReleasedFromInhivebees > PhoreticMites
  [
    set BugAlarm true
    type "BugAlarm!!! mitesReleasedFromInhivebees > PhoreticMites! mitesReleasedFromInhivebees: "
    type mitesReleasedFromInhivebees
    type " PhoreticMites: "
    print PhoreticMites
  ]

  let healthyPhoreticMitesSwitchingHosts
    round
      (
        mitesReleasedFromInhivebees * PhoreticMitesHealthyRate
        + PhoreticMites * PropNewToAllPhorMites * PhoreticMitesHealthyRate
      )  ; # healthy phoretic mites that infest a bee. These are: newly
         ; released mites that haven't entered a brood cell (hence:
         ; "phoreticMites * PropNewToAllPhorMites") and phoretic mites, where the host
         ; bee just died; all multiplied with PhoreticMitesHealthyRate as only healthy
         ; mites are considered

  if healthyPhoreticMitesSwitchingHosts > healthyPhoreticMites
  [
    ; set BugAlarm true
    if (healthyPhoreticMitesSwitchingHosts - healthyPhoreticMites) > 1
    [
      set BugAlarm true  ; if difference > 1 it can't be explained by rounding errors..
      type "BugAlarm!!! (MitePhoreticPhaseProc)  healthyPhoreticMitesSwitchingHosts > healthyPhoreticMites! healthyPhoreticMitesSwitchingHosts: "
      type healthyPhoreticMitesSwitchingHosts
      type " healthyPhoreticMites: "
      print healthyPhoreticMites
    ]

    set healthyPhoreticMitesSwitchingHosts healthyPhoreticMites
  ] ; to ensure that not more mites switch their hosts than actually present!

  ; healthy and infected IN-HIVE bees:
  let totalInfectedWorkers 0
  let totalHealthyWorkers 0
  ask IHbeeCohorts
  [
    set totalInfectedWorkers
      totalInfectedWorkers + number_infectedAsPupa + number_infectedAsAdult
        ; infected: either during pupal phase or as adults
    set totalHealthyWorkers totalHealthyWorkers + number_healthy
  ]

  ; Infection of healthy mites:
  let newlyInfectedMites 0
   ; the probability of healthy mites to become infected equals the proportion of
    ; infected in-hive workers to all in-hive workers:
  if (totalInfectedWorkers + totalHealthyWorkers) > 0  ; avoid division by 0!
   [
    repeat healthyPhoreticMitesSwitchingHosts
     [
       if random-float 1 <  totalInfectedWorkers / (totalInfectedWorkers + totalHealthyWorkers)
        [
          set newlyInfectedMites newlyInfectedMites + 1
        ]
      ]
   ]

  ; infection of healthy adult workers - ONLY IN-HIVE WORKERS!
  let allInfectedMitesSwitchingHosts
    round
      ( PhoreticMites * PropNewToAllPhorMites * (1 - PhoreticMitesHealthyRate)
        + mitesReleasedFromInhivebees * (1 - PhoreticMitesHealthyRate))
        ; # infected phoretic mites that infest a new bee. These are: newly
        ; released mites, that haven't entered a brood cell (hence: "phoreticMites
        ; * PropNewToAllPhorMites") and phoretic mites, where the host bee just died;
        ; all multiplied with (1 - PhoreticMitesHealthyRate) as only infected mites are considered

  ask IHbeeCohorts
  [
    if TotalIHbees > 0 and number > 0  ; avoid division by 0!
    [
      let infectedMitesSwitchingHostsInThisCohort
        (allInfectedMitesSwitchingHosts / TotalIHbees) *  number
          ; # of infected mites switching their host in current bee cohort: # mites per ih-bee * number of ih-bees
          ; in this cohort (assumes an equal distribution of mites)

      let newlyInfectedIHbeesInThisCohort 0
      repeat number_healthy  ; only healthy bees can become newly infected
        [
          if random-float 1 > (1 - (1 / number)) ^ infectedMitesSwitchingHostsInThisCohort
          ; "number" (i.e. all bees in this cohort) as mites can also jump on already infected bees
            [
              set newlyInfectedIHbeesInThisCohort newlyInfectedIHbeesInThisCohort + 1
               ; # of newly infected bees is increased by 1
              set infectedMitesSwitchingHostsInThisCohort infectedMitesSwitchingHostsInThisCohort - 1
              if infectedMitesSwitchingHostsInThisCohort < 0
                 [ set infectedMitesSwitchingHostsInThisCohort 0 ]
            ]
        ]


      ; Assertion to be sure there are not more newly infected bees than there were healthy bees:
      if newlyInfectedIHbeesInThisCohort > number_healthy
      [
        set BugAlarm true
        print "Bug Alarm! newlyInfectedIHbeesInThisCohort > number_healthy!"

      ]

      set number_infectedAsAdult number_infectedAsAdult + newlyInfectedIHbeesInThisCohort
      set number_healthy  number_healthy - newlyInfectedIHbeesInThisCohort

      if number_healthy < 0
      [
        set BugAlarm true
        type "BUG ALARM!!! (MitePhoreticPhaseProc) Negative number of healthy IH bees (MitePhoreticPhaseProc): "
        show number_healthy
      ]

      if number_healthy + number_infectedAsPupa + number_infectedAsAdult != number
      [
        set BugAlarm true
        type "BUG ALARM!!! (MitePhoreticPhaseProc) Wrong sum of healthy + infected bees in this cohort: "
        type number_healthy + number_infectedAsPupa + number_infectedAsAdult
        type " instead of: "
        show number
      ]
    ]  ; end "if TotalIHbees > 0 and number > 0 "
  ] ; end "ask IHbeeCohorts "

  set infectedPhoreticMites infectedPhoreticMites + newlyInfectedMites
  set healthyPhoreticMites healthyPhoreticMites - newlyInfectedMites

  if healthyPhoreticMites < 0
  [
    set BugAlarm true
    type "BUG ALARM!!! Negative number of healthy mites (MitePhoreticPhaseProc): "
    show healthyPhoreticMites
  ]

  if infectedPhoreticMites + healthyPhoreticMites > 0
  [
    set PhoreticMitesHealthyRate
      healthyPhoreticMites / (infectedPhoreticMites + healthyPhoreticMites)
  ]
  ]
end

; ********************************************************************************************************************************************************************************

to MiteOrganisersUpdateProc
  ask colonies
  [
  set TotalMites 0
    ; all mites in the colony, irrespective if phoretic or in cells

  ask miteOrganisers
  [
    back 1 ; new position in the GUI
    set mite_age age + 1
    set cohortInvadedMitesSum 0
    let counter 0
      ; counts total numbers of mites in brood cells for each miteOrganiser (="mite cohort")

    foreach workerCellListCondensed
    [
      this-variable12 -> set cohortInvadedMitesSum cohortInvadedMitesSum + (this-variable12 * counter)
      set counter counter + 1
    ] ; sums up the mites in worker cells ( multiplication of # cells with X mites in them * X) (X = counter)

    set counter 0

    foreach droneCellListCondensed
    [
      this-variable13 -> set cohortInvadedMitesSum cohortInvadedMitesSum
          + (this-variable13 * counter)
      set counter counter + 1
    ] ; sums up the mites in drone cells ( multiplication of # cells with X mites in them * X) (X = counter)

    set label cohortInvadedMitesSum
    set TotalMites TotalMites + cohortInvadedMitesSum
      ; interim result: summing up all the mites in the cells

    if (age > DRONE_EMERGING_AGE) and (age >= EMERGING_AGE)
    [
      die
    ]  ; ">" (not ">=") as they mite_age at the beginning of this procedure
  ] ; end "ask miteOrganisers "

 set TotalMites TotalMites + PhoreticMites
   ; final result: TotalMites = all mites in the cells + phoretic mites
  ]
end

; ********************************************************************************************************************************************************************************

; ...............  END OF THE VARROA MITE SUBMODEL   ...................................................................  END OF THE VARROA MITE SUBMODEL   .....................


; ********************************************************************************************************************************************************************************


; ********************************************************************************************************************************************************************************

; ...............  END OF THE VARROA MITE SUBMODEL   ...................................................................  END OF THE VARROA MITE SUBMODEL   .....................


; ********************************************************************************************************************************************************************************


; Varroa import
; ********************************************************************************



to GO

  if AssertionViolated = true
     [
       ask patches [ set pcolor red ]
       user-message "Assertion violated!"
       stop
      ]
  ; make sure, InspectTurtle refers to a colony:
  if (count bees with [ colonyID = InspectTurtle ] = 0 and count Colonies > 0)
   [ set InspectTurtle [ who ] of one-of colonies ]

  if any? turtles with [ who = InspectTurtle ] and count Colonies > 0
  [
    if ([ breed ] of turtle InspectTurtle != Colonies)
    [ set InspectTurtle [ who ] of one-of colonies ]
  ]

  let continueWorking true
  tick
  UpdateMorning_Proc
  NeedNectarPollenLarvaeTodayProc ; this calculates how much nectar and pollen is required for the brood
  while [ continueWorking = true ; still some time left today to do some work..
          and count bees with [ (caste = "worker" or caste = "queen") and (activity != "hibernate") and stage = "adult" ] > 0 ; there are actually (active) bees, that can work
          and count colonies > 0 ]
   [
     set ActiveBee NextActiveBeeREP   ;  runs faster than using "ask min-one-of bees with [ (caste = "worker" or caste = "queen") and (activity != "hibernate") and stage = "adult" ][ personalTime_s ]"
     ask bee ActiveBee
     [
       ifelse personalTime_s > CallItaDay_s
         [ set continueWorking false ]
         [
           set Daytime_s personalTime_s ; day time based on personal time of current bee
           ifelse (floor (remainder personalTime_s 3600) / 60) >= 10 ; adds current personal time to activityList (hh:mm)
             [ set activityList lput ( word floor (personalTime_s / 3600) ":" floor ((remainder personalTime_s 3600) / 60)) activityList ]
             [ set activityList lput ( word floor (personalTime_s / 3600) ":0" floor ((remainder personalTime_s 3600) / 60)) activityList ]
           ActivityProc
         ]
       if colonyID = -1 [ set personalTime_s CallItaDay_s + 1 ]  ; if queen hasn't founded a colony yet, it won't be active for the rest of the day
     ]
   ]

  ask bees with [ stage = "adult" and activity != "hibernate" and caste != "male" ]
  [
    set activity "resting"
    set activityList lput "End" activityList
  ]

  ask colonies
  [
    let toBeUsed ( ( ( 42.42 * allEggs / MAX_BROOD_NURSE_RATIO ) + ( allLarvae ) * ( 55.4 / ( PUPATION_AGE - HATCHING_AGE ) ) + allAdults * 9.5 ) / 1000 ) * 12.78
    if toBeUsed < (200 / 7000) * 12.78 [ set toBeUsed (200 / 7000) * 12.78 ]
    set energyStore_KJ energyStore_kJ - toBeUsed
    ;output-print word "used : " word toBeUsed word " adults: " word allAdults word " brood: " word (allEggs + allLarvae) word " day" day
  ]


  QueensLeavingNestProc ; young queens leave the nest to mate & hibernate
  FeedLarvaeProc
  QueenProductionDateProc
  DevelopmentProc
  MortalityBroodProc
  BadgersOnTheProwlProc
  BeekeepingProc
  SwarmingProc
  ;DriftingProc
  ;MiteProc
  OutputDailyProc

  if ShowCohorts? = true [ DrawCohortsProc ]
  if count Colonies + count Bees = 0 and StopExtinct? = true [ stop ]
end


; *******************************************************************************


to-report ThresholdLevelREP [ thType situation ]
  ;TYPES: eggLaying pollenForaging nectarForaging nursing
  ;SITUATIONS: egg worker youngQueen QueenInitiationPhase QueenSocialPhase Psith

  let th  -1
  ;Egg Laying
  if thType = "eggLaying"
  [
    if situation = "egg"                  [set th NotSetHigh]
    if situation = "worker"               [set th NotSetHigh]
    if situation = "youngQueen"           [set th NotSetHigh]
    if situation = "QueenInitiationPhase" [set th 0.1]
    if situation = "QueenSocialPhase"     [set th 0]
    if situation = "Psith"                [set th 0.2]
  ]

  ; Pollen foraging
  if thType = "pollenForaging"
  [
    if situation = "egg"                  [set th NotSetHigh]
    if situation = "worker"               [set th 0.9]
    if situation = "youngQueen"           [set th NotSetHigh]
    if situation = "QueenInitiationPhase" [set th 0.7]
    if situation = "QueenSocialPhase"     [set th NotSetHigh]
    if situation = "Psith"                [set th NotSetHigh]
  ]

  ; Nectar foraging
  if thType = "nectarForaging"
  [
    if situation = "egg"                  [set th NotSetHigh]
    if situation = "worker"               [set th 0.9]
    if situation = "youngQueen"           [set th NotSetHigh]
    if situation = "QueenInitiationPhase" [set th 0.7]
    if situation = "QueenSocialPhase"     [set th NotSetHigh]
    if situation = "Psith"                [set th NotSetHigh]
  ]

  ; Nursing
  if thType = "nursing"
  [
    if situation = "egg"                  [set th NotSetHigh]
    if situation = "worker"               [set th 0.9]
    if situation = "youngQueen"           [set th NotSetHigh]
    if situation = "QueenInitiationPhase" [set th 0.5]
    if situation = "QueenSocialPhase"     [set th 0.9]
    if situation = "Psith"                [set th NotSetHigh]
  ]
 if th = -1 [ AssertionProc "Assertion violated in ThresholdLevelREP: TH not set!" ]
 report th
end


; *******************************************************************************

to QueensLeavingNestProc
 ; young queens leave the colony, mate and hibernate:
  ask bees with [ stage = "adult" and caste = "queen" and mated? = false and colonyID != -1 ]  ; young, adult queens still in a colony..
  [
    let memoSpecies speciesID
    ifelse count bees with [ caste = "male" and stage = "adult" and speciesID = memoSpecies ] > 0  ; if suitable males are present..
     [
       let newAlleleList []  ; .. the queen will mate with one
       ask one-of bees with [ caste = "male" and stage = "adult" and speciesID = memoSpecies ] ;   mating with a haploid or diploid(!) adult male of the same species,
         [ set newAlleleList allelesList ]
       set spermathecaList newAlleleList
     ]
     [ ; mating with a male from outside:
       if UnlimitedMales? = false [ DieProc "Queen: no mating" ] ; if queen's can't mate, they are removed
       let foreignAllele -1 * (random N_ForeignAlleles) - 1 ; random integer number: -1, -2, ... -N_ForeignAlleles
       set spermathecaList fput foreignAllele spermathecaList
       if length spermathecaList > 1 [ AssertionProc "Assertion violated in QueensLeavingNestProc: too many alleles here!" ]
     ]
    set mated? true    ; queen is now mated
    set thEgglaying ThresholdLevelREP "eggLaying" "QueenInitiationPhase"  ; queen is now ready to lay eggs
    set size QueenSymbolSize
    set shape "circle"
    set color red
    set activity "hibernate"  ; queen hibernates and be active untile she emerges in spring
    set colonyID -1   ; queen is no longer member of a colony
    if length spermathecaList = 2 [ DieProc "Queen: mating with diploid male" ]
       ; queens mating with diploid male are removed from the simulation as they are not able to establish a colony (Duchateau & Marien 1995)
    DieProc "Queen: disabled more colonies" ;vv temp fix
  ]
end


; *******************************************************************************

to CreateInitialQueensProc
  let newQueens 0
  foreach SpeciesList ; lists bee species present
  [ ?1 ->
   if ?1 = "B_lapidarius" [ set newQueens B_lapidarius ] ; numbers specified on interface
   if ?1 = "B_pascuorum" [ set newQueens B_pascuorum ]
   if ?1 = "B_terrestris" [ set newQueens B_terrestris ]
   if ?1 = "B_hortorum" [ set newQueens B_hortorum ]
   if ?1 = "B_hypnorum" [ set newQueens B_hypnorum ]
   if ?1 = "B_pratorum" [ set newQueens B_pratorum ]
   if ?1 = "Psithyrus" [ set newQueens N_Psithyrus ]
   let modelledSpecies ?1
   create-bees newQueens  ; newQueens = number of new queens created here
   [
     set shape "circle"
     if ShowQueens? = false [ hide-turtle ]
     set size QueenSymbolSize
     set adultAge 180  ; queens have hibernated (exact age doesn't matter)
     set broodAge 36  ; (exact age doesn't matter)
     set color red
     set brood? false
     set caste "queen"
     set mated? true
     set number 1
     set ploidy 2
     set mtDNA random-float 139.9 ; i.e. within the range of Netlogo colours
     set allelesList list (random-float 139.9) (random-float 139.9)
     set spermathecaList [] ;list (allele)
     set spermathecaList fput (random-float 139.9) spermathecaList
     set colonyID -1 ; i.e. does not belong to any colony yet
     let speciesIDmemo -1
     let speciesNameMemo "noName"
     ask one-of Species with [ name = modelledSpecies ]
       [
         set speciesIDmemo who
         set speciesNameMemo name
       ]
     set speciesID speciesIDmemo
     set speciesName speciesNameMemo
     set stage "adult"
     set thEgglaying ThresholdLevelREP "eggLaying" "QueenInitiationPhase"
     set thForagingNectar ThresholdLevelREP "nectarForaging" "QueenInitiationPhase"
     set thForagingPollen ThresholdLevelREP "pollenForaging" "QueenInitiationPhase"
     set thNursing ThresholdLevelREP "nursing" "QueenInitiationPhase"
     set activity "hibernate"
     set activityList [ ]
     set personalTime_s random (2 * 3600) + (GetUpTime_s - 3600) ; = Start_time_s +- 1hr (i.e. between 7:00 and 9:00 am)
     let yearEndSeason [seasonStop] of OneSpecies speciesID ; prevent bees from setting emergingDate past the end of season
     while [ emergingDate <= 0 OR emergingDate >= yearEndSeason]
       [ set emergingDate  round random-normal [ emergingDay_mean ]
    of OneSpecies speciesID [emergingDay_sd] of OneSpecies speciesID ]
    ; emerging from hibernation next year on day "emergingDay_mean" (+- s.d.)

     set currentFoodsource -1
     set nectarsourceToGoTo -1
     set pollensourceToGoTo -1
     set pollenForager? false
     set knownMasterpatchesNectarList [ ]
     set knownMasterpatchesPollenList [ ]

     ; determination of the queen's weight:
     let minWeight_mg [ devWeight_Q_PupationMin_mg ] of oneSpecies speciesID
     let maxWeight_mg [ devWeight_Q_PupationMax_mg ] of oneSpecies speciesID
     let meanWeight_mg (maxWeight_mg + minWeight_mg) / 2
     let sd_weight (maxWeight_mg - minWeight_mg) / 4 ; mean +- 2xSD > 95%

     set weight_mg random-normal meanWeight_mg sd_weight
     if weight_mg > maxWeight_mg [ set weight_mg maxWeight_mg ]
     if weight_mg < minWeight_mg [ set weight_mg minWeight_mg ]
     set glossaLength_mm ProboscisLengthREP
     set cropvolume_myl   CropAndPelletSizeREP "nectar"
     set pollenPellets_g  CropAndPelletSizeREP "pollen"
   ]


    ;vv

  ]
end


; *******************************************************************************


to-report CropAndPelletSizeREP [ forage ]
 ; bee crop and pollen capacity based on weight using (1) linear formula
 ; (2) pollen:crop ratio from HBs in BEEHAVE, with both
 ; having an upper limit set by species-own variables.
  let beeWeightToLoadFactor 0.402 ; 0.402: derived from Ings et al 2006 for nectar loads
  let beehaveCropToPelletFactor_ul-to-g 0.015 / 50  ; nectar load BEEHAVE: 50ul (Winston (1987), Nuñez (1966, 1970), Schmid-Hempel et al. (1985); POLLENLOAD  0.015 [g]  (from HoPoMo, Schmickl Crailsheim 2007, based on Seeley 1995)
  let result 0
  let maxCropVol_myl [ specMax_cropVolume_myl ] of oneSpecies speciesID
  let maxPollen_g  [ specMax_pollenPellets_g ] of oneSpecies speciesID
  if forage = "nectar"
    [ set result min list (maxCropVol_myl) (weight_mg * beeWeightToLoadFactor) ] ; result is the lower of these two values
; equation derived from Ings et al 2006
  if forage = "pollen"
    [ set result min list (maxPollen_g)  (weight_mg * beeWeightToLoadFactor * beehaveCropToPelletFactor_ul-to-g) ]  ; result is the lower of these two values
; pollen load in same proportion as values used in BEEHAVE
  if result = 0 [  AssertionProc "Assertion violated: Error in CropAndPelletSizeREP" ]
  report result  ; units: ul for nectar, g for pollen!
end

; *******************************************************************************

to CreateBadgersProc
  ; suggestions for initial number of badgers: zero, intermediate (>0–3 setts km2) and high (>3 setts km2),
  ; Reilly & Courtenay 2007 (Preventive Veterinary Medicine 80 (2007) 129–142)

  let burrowHabitatsList  ["Scrub"]  ; habitats badgers can nest in
  let distanceLimit_m     300          ; badgers cannot be created within this distance of a current sett
                                       ; (Kruuk 1978, J. Zool., Lond.184, 1-19; Fig. 2)
  let memoX 0
  let memoY 0
  ; convert distance to netlogo patches:
  let distance_patches    distanceLimit_m * SCALING_NLpatches/m
  ; agentset of suitable foodsources:
  let burrowFsSet FoodSources with [ (member? patchtype burrowHabitatsList) AND masterPatch? ]
  create-badgers N_Badgers ; create the badgers
  [
    ifelse count burrowFsSet > 0 ; check for suitable foodsource
    [
      let chosenFs     one-of burrowFsSet  ; one of the suitable patches is chosen..
      ask chosenFs     [ set memoX pxcor set memoY pycor ]  ; its location is saved..
      setxy            memoX memoY           ; .. the badger moves to the location of the patch
      set size         9 * MasterSizeFactor
      set shape        "badger"
      ; recreate the agentset, only taking masterpatches without any badgers in a certain radius into account:
      set burrowFsSet  FoodSources with [ (member? patchtype burrowHabitatsList) AND
                                          masterPatch? AND
                                          count badgers-here = 0 AND
                                          count badgers in-radius distance_patches = 0
                                        ]
    ]
    [ DieProc "Badger: not enough habitat!" ]; no badgers if there is no habitat for their burrows!
  ]
end

; *******************************************************************************

to BadgersOnTheProwlProc
  let foragingRange_m 735 ; estimated from Kruuk & Parish, J. Zool., Lond. (1982) 196,31-39, Tab. 1: territory: ca. 170ha, hence radius ca. 735m
  let encounterProb  0.19 ; probablity to come across the nest; Kowalczyk et al 2006, Wildlife Biology 12(4):385-391. 2006 Tab1;  DR% daily range as % of total home range: 19% (19+-18%);
  let digUpProb 0.1 ; probability to perceive the nest and dig it up - ARBITRARY VALUE
  ask Badgers
  [
   let memoX xcor
   let memoY ycor
   ask colonies with [ distancexy memoX memoY < SCALING_NLpatches/m * foragingRange_m ]
   [
     if random-float 1 < encounterProb * digUpProb
     [
       set energyStore_kJ 0
       set pollenStore_g 0
       set color red
       let victimColonyID who
       let memobroodDeaths 0
       ask bees with [ colonyID = victimColonyID ]
       [
         if brood? [set memobroodDeaths memobroodDeaths + number]
         DieProc "Colony killed by badger!"
       ]
       set broodDeathBadger broodDeathBadger + memobroodDeaths
     ]
    ]
  ]
end

; *******************************************************************************

to PsithyrusNestSearchProc
  ;  determines if a cuckoo bee finds a suitable host colony and can enter it successfully
  let memoColID -1
  let findSingleNestProb 0.05     ;    arbitrary value
  let getAccessProb 0.25          ;    arbitrary value
  let getKilledProb 0.25          ;    arbitrary value
  let killQueenProb 0.5           ;    arbitrary value
  let succesful false
  let myWho who
  let findAnyNestProb 1 - ((1 - findSingleNestProb) ^ count colonies)

  if random-float 1 < findAnyNestProb
  [
    if random-float 1 < getAccessProb
    [
      ifelse random-float 1 < getKilledProb
      [ DieProc "Psithyrus: killed by Bombus queen" ]
      [
        set succesful true
        set color black
        set size size * 8
        set shape "circleSingle"
        ask one-of colonies [ set memoColID who ]
        set colonyID memoColID
        move-to colony colonyID
        set thForagingNectar ThresholdLevelREP "nectarForaging" "Psith"
        set thForagingPollen ThresholdLevelREP "pollenForaging" "Psith"
        set thNursing ThresholdLevelREP "nursing" "Psith"
        set thEgglaying ThresholdLevelREP "eggLaying" "Psith"
      ]
    ]
  ]
  ifelse succesful = true
  [
    if count bees with [colonyID = memoColID and caste = "queen" and mated? = true] > 0
    [
      ask bees with [colonyID = memoColID and caste = "queen" and mated? = true and who != myWho ]   ; queen might be killed by Psithyrus
      [
        if random-float 1 < killQueenProb
        [
          DieProc "Queen killed by cuckoo bee!"
        ]
      ]
    ]
  ]
  ; If not successful at finding a nest
  [
    if random-float 1 < 1 - ((1 - MortalityForager_per_s) ^ (NestSearchTime_h * 60 * 60))
    [
      DieProc "Psithyrus: died while searching nest"
    ]
  ]
end

; *******************************************************************************

to AssertionProc [ message ]
  show message
  set AssertionMessage  message
  set AssertionViolated true
end

; *******************************************************************************

;vv todo
to QueenProductionDateProc
  ; for B. terrestris, based on Duchateau & Velthuis 1988 - no data for other species!
  ; queenProductionDate: the (theoretical) date (time step) when the first queen-destined eggs were laid, back calculated on the day when "queenProduction?" is set true (in QueenProductionDateProc).
  ; Does not require that any eggs were actually laid on that day.
  ask colonies
  [
    let memoColony who
    let averageCumulTimeEgg_d 7 ; average (realised) duration of egg phase in the model is about 6.4; set to 7 as this results in better sex ratio than 6 (min hatching age 5, max hatching age 10)
    let timeEggToLarvalAgeAtQueenDetermination averageCumulTimeEgg_d + [ dev_larvalAge_QueenDetermination_d ] of OneSpecies speciesIDcolony  ;  i.e. 7+3=10d for B. terrestris
   ; (only) if larvae of the right age are present, timeEggToLarvalAgeAtQueenDetermination can be directly determined from their brood age (in this case, the previous value is overwritten)
    if any? bees with [ stage = "larva" and colonyID = memoColony and cumulTimeLarva_d = [ dev_larvalAge_QueenDetermination_d ] of OneSpecies speciesID ]
      [ set timeEggToLarvalAgeAtQueenDetermination max[ broodAge ] of bees with [ stage = "larva" and colonyID = memoColony and cumulTimeLarva_d = [ dev_larvalAge_QueenDetermination_d ] of OneSpecies speciesID ] ]
       ; asking for "max" in case there are 2 larval cohorts of dev_larvalAge_QueenDetermination_d age but different broodAges (because younger cohort has developed quicker as eggs).
       ; This should not happen in the current version, but might be the case in a future version.
    if queenProduction? = false  ; is set true ca. 5 - 16 days after SW was determined
       and ticks - timeEggToLarvalAgeAtQueenDetermination  ; this is the date when the larvae which are today at the queen determination stage were laid as eggs
           >= switchPointDate - QueenDestinedEggsBeforeSP_d  ; "queen eggs" are laid QueenDestinedEggsBeforeSP_d (5d) before switchpoint at earliest
       and larvaWorkerRatio < LarvaWorkerRatioTH        ; but also the L:W ratio on that day has to be below LarvaWorkerRatioTH (= 3)
      [
        set queenProduction? true ; female larvae can now develop into queens
        set queenProductionDate ticks - timeEggToLarvalAgeAtQueenDetermination ; ..these larvae were laid as eggs on that day
      ]
  ]
end

; *******************************************************************************

to-report MaxWeightGainToday_mg_REP [ myID ] ; calculates a larva's maximal weight gain during 24 hrs
 let maxWeightGain_mg 0
 let memoQPupationMax [ devWeight_Q_PupationMax_mg ] of OneSpecies speciesID ; max. weight a queen pupa of this species can have
 let memoWPupationMax [ devWeightPupationMax_mg ] of OneSpecies speciesID  ; max. weight a worker pupa of this species can have

 ask bee myID
 [
  let myGrowthFactor [ growthFactor ] of OneSpecies speciesID ; growth factor depends on the species
  set maxWeightGain_mg (weight_mg * myGrowthFactor) - weight_mg ; i.e. a larva's max. weight gain today
    ; weight can't exceed a caste specific maximal weight, i.e. no weight gain in this case!
    ; if the maximum new weight is greater than the pupation max, reduce maxWeightGain to difference between pupation max and current weight

  if caste = "queen" and weight_mg + maxWeightGain_mg > memoQPupationMax
      [ set maxWeightGain_mg   memoQPupationMax - weight_mg ]  ; for queens

  ; .. and for worker (or still undefined) larvae:
  if (caste = "worker" or caste = "undefined" or caste = "male") and weight_mg + maxWeightGain_mg > memoWPupationMax
      [ set maxWeightGain_mg   memoWPupationMax - weight_mg ]
 ]
 report maxWeightGain_mg
end

; *******************************************************************************

to NeedNectarPollenLarvaeTodayProc ; calculates how much nectar and pollen is approximately required today to feed the larvae
 ask colonies
 [
  let myColony who
  let pollenNeedMyColony_g 0
  ask bees with [ stage = "larva" and colonyID = myColony ]
    [ set pollenNeedMyColony_g pollenNeedMyColony_g ; pollen need summed up here..
                               + number             ; calculated from cohort size ..
                               * ((MaxWeightGainToday_mg_REP who)    ; times max. possible gain in weight..
                               / ([pollenToBodymassFactor] of OneSpecies speciesID)) ;..translated into pollen
                               / 1000 ]                                              ; units: mg -> g
  set pollenNeedLarvaeToday_g pollenNeedMyColony_g
  set energyNeedToday_kJ pollenNeedLarvaeToday_g * EnergyRequiredForPollenAssimilation_kJ_per_g
 ]
end

; *******************************************************************************

to DevelopmentProc
 ask bees
 [
   let whoCol colonyID
   ifelse stage = "adult"
    [
      set adultAge adultAge + 1
      ;if adultAge > 700 [ AssertionProc "Assertion violated: Bee with 2 hibernations!" ]
      if brood? = true [ AssertionProc "Assertion violated: adult bee with brood? = true (DevelopmentProc)" ]
      Development_Mortality_AdultsProc
    ]
    [
      set broodAge broodAge + 1
      if brood? = false  [ AssertionProc "Assertion violated: brood with brood? = false (DevelopmentProc)" ]
      if stage =  "pupa" [ Development_PupaeProc ]
      if stage = "larva" [ Development_LarvaeProc whoCol ]
      if stage =  "egg"  [ Development_EggsProc ]
    ]
  if xcor + StepWidth < max-pxcor and mated? = false  ; move graphic representation of bees on GUI
       [ set xcor xcor + StepWidth ]
 ]
end

; *******************************************************************************

to Development_Mortality_AdultsProc
 if caste = "worker" ; behavioural development workers
 [
   if adultAge + random 2 > maxLifespanWorkersOwn [
      ;Output-print word "Soz" word adultAge word " " maxLifespanWorkersOwn
      DieProc "Worker: adultAge > maxLifespanWorkers"
    ]
   ;if adultAge > [ maxLifespanWorkers ] of OneSpecies speciesID [ DieProc "Worker: adultAge > maxLifespanWorkers" ]
 ]

 if caste = "male"    ; death of adult males after max lifespan
 [
   if adultAge > MaxLifespanMales [ DieProc "Male: adultAge > MaxLifespanMales" ]
 ]

 if caste = "queen" and mated? = true and colonyID >= 0 and [ allAdultWorkers ] of colony colonyID > 0 ; i.e. if colony is in the social phase
 [
    set thForagingNectar ThresholdLevelREP "nectarForaging" "QueenSocialPhase"
    set thForagingPollen ThresholdLevelREP "pollenForaging" "QueenSocialPhase"
    set thNursing ThresholdLevelREP "nursing" "QueenSocialPhase"
    set thEgglaying ThresholdLevelREP "eggLaying" "QueenSocialPhase"
 ]

 if MortalityAdultsBackground_daily > 0 and random-float 1 > MortalityAdultsBackground_daily ; MortalityAdultsBackground_daily = 0 so no effect!
   [ DieProc "Adult bee: mortality in colony" ]
end

; *******************************************************************************

to Development_PupaeProc ; procedure checks if pupae develop into adults
  set cumulTimePupa_d cumulTimePupa_d + 1 ; potential ouput (time spent as pupa)
  if caste = "worker"
  [
    ; Development factors pupae: age & incubation:
    if cumulIncubationReceived_kJ >= [ devIncubationEmergingTH_kJ ] of OneSpecies speciesID
          and broodAge >= [ devAgeEmergingMin_d ] of OneSpecies speciesID
          [
            set stage "adult"
            set brood? false
            set color black

            let newWorkers number ; saves the cohort size
            set TotalAdultsEverProduced TotalAdultsEverProduced + number
            ask colony colonyID [set totalAdultsProduced  totalAdultsProduced + newWorkers]
            ask colony colonyID [set totalWorkersProduced  totalWorkersProduced + newWorkers]


            ; bee crop and pollen capacity based on weight using (1) linear formula (2) pollen:crop ratio from HBs in BEEHAVE, with both
            ; having an upper limit set by species-own variables.
            set cropvolume_myl   CropAndPelletSizeREP "nectar"
            set pollenPellets_g  CropAndPelletSizeREP "pollen"

            set thEgglaying      ThresholdLevelREP "eggLaying" "worker"
            set thForagingNectar ThresholdLevelREP "nectarForaging" "worker"
            set thForagingPollen ThresholdLevelREP "pollenForaging" "worker"
            set thNursing        ThresholdLevelREP "nursing" "worker"
            set glossaLength_mm  ProboscisLengthREP
          ]
  ]

  ;vv todo
  ; NOTE: in bumblebees (B. terrestris) diplod males develop into (sterile) adults (Duchateau et al. 1994)
  ; (dipl. males can also mate but these queens are not able to establish a colony (Duchateau & Marien 1995) and are removed (in QueensLeavingNestProc)
  if caste = "male" ; MALE PUPAE - might develop into adult males
  [
     if cumulIncubationReceived_kJ >= [ devIncubationEmergingTH_kJ ] of OneSpecies speciesID
     and broodAge >= [ devAgeEmergingMin_d ] of OneSpecies speciesID
          [
             set brood? false
             set stage "adult"
             set color green
             let newMales number
             set TotalAdultsEverProduced TotalAdultsEverProduced + number
             set TotalAdultMalesEverProduced TotalAdultMalesEverProduced + number
             ask colony colonyID
             [
               set totalAdultsProduced totalAdultsProduced + newMales
               set totalMalesProduced  totalMalesProduced + newMales
             ]
          ]
   ]

  if caste = "queen" ; QUEEN PUPAE - might develop into adult queens
  [
     if cumulIncubationReceived_kJ >= [ devIncubation_Q_EmergingTH_kJ ] of OneSpecies speciesID
     and broodAge >= [ devAge_Q_EmergingMin_d ] of OneSpecies speciesID
          [
            let yearEndSeason (365 * ceiling (ticks / 365)) + [seasonStop] of OneSpecies speciesID ; prevent bees from setting emergingDate past the end of season
            let yearStartSeason (365 * ceiling (ticks / 365))
            while [ emergingDate <= yearStartSeason  OR emergingDate > yearEndSeason] ; add start season to the while statement
              [ set emergingDate  (365 * ceiling (ticks / 365)) ; emerging from hibernation next year on day "emergingDay_mean" (+- s.d.)
                    + round random-normal [ emergingDay_mean ] of OneSpecies speciesID ; mean
                                          [ emergingDay_sd ] of OneSpecies speciesID] ; SD
            set stage "adult"
            set brood? false
            set color red
            let newQueensProduced number
            if not member? colonyID QueensProducingColoniesList ; output
              [ set QueensProducingColoniesList lput colonyID QueensProducingColoniesList ]
            set TotalAdultsEverProduced TotalAdultsEverProduced + number
            set TotalAdultQueensEverProduced TotalAdultQueensEverProduced + number
            ask colony colonyID
            [
              set totalQueensProduced totalQueensProduced + newQueensProduced
              set totalAdultsProduced  totalAdultsProduced + newQueensProduced
            ]
            set cropvolume_myl   CropAndPelletSizeREP "nectar"
            set pollenPellets_g  CropAndPelletSizeREP "pollen"
            set thEgglaying      ThresholdLevelREP "eggLaying" "youngQueen"
            set thForagingNectar ThresholdLevelREP "nectarForaging" "youngQueen"
            set thForagingPollen ThresholdLevelREP "pollenForaging" "youngQueen"
            set thNursing        ThresholdLevelREP "nursing" "youngQueen"
            set glossaLength_mm ProboscisLengthREP
          ]
   ]

   if caste = "undefined" [ AssertionProc "Assertion violated: undefined caste! (Development_PupaeProc)" ]
end

; *******************************************************************************


to-report DetermineCaste_REP [ whoCol ]
 let mycaste "worker" ; bee will develop into a worker, unless it becomes a queen
 ; it will be a queen if individual weight and colony conditions for becoming a queen are both fulfilled:
 if (weight_mg >= [ dev_Q_DeterminationWeight_mg ] of OneSpecies speciesID ; individual criterion
   and [ queenProduction? ] of colony whoCol = true)                        ; colony criterion
   [ set mycaste "queen" ]
 report mycaste
end


; *******************************************************************************

to Development_LarvaeProc [ whoCol ] ; procedure checks if larvae develop into pupa
  ; Development factors larva: age, incubation and weight - option to develop into queen!
  set cumulTimeLarva_d cumulTimeLarva_d + 1
  if caste = "undefined" and cumulTimeLarva_d = [ dev_larvalAge_QueenDetermination_d ] of OneSpecies speciesID ; age of determination is independent of of time spent as egg
  [
    set caste DetermineCaste_REP whoCol ; this reporter-procedure determines the caste
    if caste = "queen" [ set color orange ]
    if caste = "undefined" [ AssertionProc "Assertion violated: undefined caste! (Development_LarvaeProc)" ]
  ]

  if caste = "worker" or caste = "male"  ; larvae develop into pupae as soon as they  1) received enough incubation, and 2) they are old enough and 3.) heavy enough
     and cumulIncubationReceived_kJ >= [ devIncubationPupationTH_kJ ] of OneSpecies speciesID
     and broodAge >= [ devAgePupationMin_d ] of OneSpecies speciesID
     and weight_mg >= [ devWeightPupationMin_mg ] of OneSpecies speciesID
  [
    set stage "pupa"
    set color brown
    if ploidy = 1 [ set color grey - 2 ]
    let memoNumber number
    ask colony colonyID [set totalPupaeProduced  totalPupaeProduced + memoNumber]
  ]

  if caste = "queen" ;
     and cumulIncubationReceived_kJ >= [ devIncubation_Q_PupationTH_kJ ] of OneSpecies speciesID
     and broodAge >= [ devAge_Q_PupationMin_d ] of OneSpecies speciesID
     and weight_mg >= [ devWeight_Q_PupationMin_mg ] of OneSpecies speciesID
  [
    set stage "pupa"
    set color red
    let memoNumber number
    ask colony colonyID [set totalPupaeProduced  totalPupaeProduced + memoNumber]
  ]

end

; *******************************************************************************

to Development_EggsProc  ; ; procedure checks if eggs develop into larvae
 set cumulTimeEgg_d cumulTimeEgg_d + 1
 if cumulIncubationReceived_kJ >= [ devIncubationHatchingTH_kJ ] of OneSpecies speciesID
    and broodAge >= [ devAgeHatchingMin_d ] of OneSpecies speciesID
    [
      set stage "larva"
      set color white
      if ploidy = 1 [ set color yellow ]  ; male larvae are represented by yellow bars on the interface
      let memoNumber number
      ask colony colonyID [set totalLarvaeProduced  totalLarvaeProduced + memoNumber]
    ]
end


; *******************************************************************************

to MortalityBroodProc
  ; Duchateau & Velthuis 1988: "At the end of the colony development the third important phase sets in with the start of worker oviposition and of mutual
  ;                             overt aggression between the workers and between the workers and their queen. In this ultimate phase of the colony development most of the eggs
  ;                             and larvae from queen and workers will not survive to adulthood due to the aggressive interactions and to reciprocal oophagy (SLADEN, 1912;
  ;                             RICHARDS, 1977; VAN DOORN & HERINGA, 1986; own observations)."

 ask bees
 [
   let memoNumber number ; (either 1 or cohort size)
   if stage = "egg" and broodAge > [ devAgeHatchingMax_d ] of OneSpecies speciesID
   [
     ask colony colonyID [ set eggDeathsIncubation  eggDeathsIncubation + memoNumber]
     DieProc "Egg: broodAge > devAgeHatchingMax_d"
   ]
   if stage = "larva"
     [
      if ((caste = "worker" or caste = "male" or caste = "undefined") and  broodAge > [ devAgePupationMax_d] of OneSpecies speciesID )
       or (caste = "queen" and  broodAge > [ devAge_Q_PupationMax_d] of OneSpecies speciesID )
       [
         ; Get relative incubation and weights (relative to minimum target required for developing into the next stage).
         let relativeIncub  -1
         let relativeWeight -1
         ifelse caste = "queen"
           [
             set relativeWeight (weight_mg / [ devWeight_Q_PupationMin_mg ] of OneSpecies speciesID)
             set relativeIncub  (cumulIncubationReceived_kJ / [ devIncubation_Q_PupationTH_kJ ] of OneSpecies speciesID)
           ]
           [
             set relativeWeight (weight_mg / [ devWeightPupationMin_mg ] of OneSpecies speciesID)
             set relativeIncub  (cumulIncubationReceived_kJ / [ devIncubationPupationTH_kJ ] of OneSpecies speciesID)
           ]
         ; Record the outputs: number of bees that die due to relative weight/incubation received is less than 1
         if relativeWeight < 1 AND relativeWeight < relativeIncub [ ask colony colonyID [set larvaDeathsWeight  larvaDeathsWeight + memoNumber] ]
         if relativeIncub  < 1 AND relativeIncub < relativeWeight [ ask colony colonyID [set larvaDeathsIncubation  larvaDeathsIncubation + memoNumber] ]
         if relativeWeight >= 1 AND relativeIncub >= 1 [ assertionProc "Neither Weight or Incubation reason for death: MortalityBroodProc (1)"]
         DieProc "Larva: broodAge > max. pupation age"
       ]
     ]
   if stage = "pupa"
     [
       if caste = "undefined" [ assertionProc "Pupa with undefined caste (MortalityProc)!" ]
       if ((caste = "worker" or caste = "male") and  broodAge > [ devAgeEmergingMax_d ] of OneSpecies speciesID )
       or (caste = "queen" and  broodAge > [ devAge_Q_EmergingMax_d ] of OneSpecies speciesID )
       [
         ask colony colonyID ; as pupae are not fed, they died due to lack of incubation
               [ set pupaDeathsIncubation  pupaDeathsIncubation + memoNumber ]
         DieProc "Pupa: broodAge > max. emerging age"
       ]
     ]
   if colonyID >= 0 and ticks > [ competitionPointDate ] of Colony colonyID   ; development of eggs into larvae only possible before CP! (Duchateau & Velthuis 1988)
   [
      if stage = "egg"
      [
        ask colony colonyID [set broodDeathsCP  broodDeathsCP + memoNumber]
        DieProc "Egg: CP!"
      ]
   ]
 ]
end

; *******************************************************************************

to DieProc [ causeOfDeath ] ; calls the actual "die" command for all biologically relevant agents and keeps track of all their deaths
 ;output-print word causeOfDeath day
 if breed = bees
  [
    set TotalBeesEverDied TotalBeesEverDied + number
    ;if number < 1 [ show ticks AssertionProc "Less than 1 bee in bee agent (CheckNumbersProc)" ]
    ; Remove dying bees from the ActiveBeesSortedList:
    if member? who ActiveBeesSortedList
     [
       set ActiveBeesSortedList filter [ ?1 -> ?1 != who ] ActiveBeesSortedList ]
       die
     ]
 if breed = colonies
  [
    if eusocialPhaseDate +  switchPointDate + competitionPointDate < NotSetHigh
     [
        output-type "ticks id 1stWorker SP CP QPD death #Q #M: "
        output-type ticks output-type " "
        output-type who output-type " "
        output-type eusocialPhaseDate output-type " "
        output-type switchPointDate output-type " "
        output-type competitionPointDate output-type " "
        output-type queenproductiondate output-type " "
        output-type ticks output-type " "
        output-type totalQueensProduced output-type " "
        output-type totalMalesProduced output-print " "
     ]

    ; instead of removing colony, change breed to deadCol
                   ; also kill store bars and change agent into a small white dot on the 2D view
    ask storebars with [ storeColonyID = [who] of myself ] [ die ]
    set breed deadCols
    set size 1
    set label ""
    set color white
    set shape "circle"
    set colonyDeathDay ticks
    if not showDeadCols? [ ht ]
 ]

 if breed = badgers
  [
    output-show causeOfDeath
    die
  ]

 if breed != deadCols [ AssertionProc "Zombie alarm in DieProc" ] ; only dead colonies are supposed to survive DieProc

end


;;;; *******************************************************************************

to CheckNumbersProc

  let totalInitalBees
  B_lapidarius
  + B_pascuorum
  + B_terrestris
  + B_hortorum
  + B_hypnorum
  + B_pratorum
  + N_Psithyrus

  let totalBeesPresent sum [ number ] of bees
  ;if totalInitalBees + TotalBeesEverProduced - TotalBeesEverDied != totalBeesPresent
  ;[ AssertionProc "Error in number of bees ever produced/died! (CheckNumbersProc)" ]

  set TotalEggs sum [ allEggs ] of Colonies
  set TotalLarvae sum [ allLarvae ] of Colonies
  set TotalPupae sum [ allPupae ] of Colonies
  set TotalAdultWorkers sum [ allAdultWorkers ] of Colonies
  set TotalAdultQueens sum [ number ] of bees with [ stage = "adult" and caste = "queen" ] ; total adult queens, (not necessarily member of a colony!)
  set TotalAdultMales sum [ allAdultMales ] of Colonies
  set TotalAdults sum [ number ] of bees with [ stage = "adult" ]                          ; total adults, including queens (not necessarily member of a colony!)
  set TotalForagingTripsToday 0

  if TotalEggs != sum [ number ] of bees with [ stage = "egg" ]
     or TotalLarvae != sum [ number ] of bees with [ stage = "larva" ]
     or TotalPupae != sum [ number ] of bees with [ stage = "pupa" ]
     or TotalAdultWorkers != sum [ number ] of bees with [ caste = "worker" and  stage = "adult" ]
     or TotalAdultMales != sum [ number ] of bees with [ stage = "adult" and caste = "male" ]
  [
  ]
  ;[OUTPUT-PRINT "Error in total numbers of bees! (CheckNumbersProc)"]
  ;[ AssertionProc "Error in total numbers of bees! (CheckNumbersProc)" ]

  if day = 364
  [
    ;let colCheck TotalColoniesEverProduced - (ColonyDeathsEndSeason + ColonyDeathsNoBees)
    ;if colCheck != 0 [AssertionProc "Colonies produced cannot be accounted for"]
    ask deadCols
    [
       let eggcheck totalEggsProduced - (totalAdultsProduced
                                       + broodDeathsEnergyStores
                                       + broodDeathsNoAdults
                                       + broodDeathsCP
                                       + broodDeathEndSeason
                                       + broodDeathBadger
                                       + eggDeathsIncubation
                                       + larvaDeathsIncubation
                                       + larvaDeathsWeight
                                       + pupaDeathsIncubation
                                       )

     ;if eggcheck != 0 [AssertionProc (word "Dead Colony " who " cannot account for all eggs produced" eggcheck)]
    ]
  ]

end

;;;; *******************************************************************************

to-report StimEgglayingREP
  ; calculates the stimulus for egg laying within a colony
  let egglayingStim 0
  if ((pollenStore_g > [ minPollenStore_g ] of oneSpecies speciesIDcolony
       and (allEggs + allLarvae) = 0))
     or allAdults > 1 ; i.e. if at least 1 worker is present
   [ set egglayingStim  1 ]
  report egglayingStim
end

; *******************************************************************************

to-report StimNursingREP      ; asked by colony
  ; if the energy required for incubation today (devQuotaIncubationToday_kJ), which is the average energy required per day
  ; for an individual (devQuotaIncubationToday_kJ) times the individual brood (allEggs + allLarvae + allPupae) is smaller then
  ; the incubation actually received today (), then the stimulus to nurse (nursingStim) is set to 1 or otherwise to 0.

 let nursingStim 0
 let incubationRequiredToday_kJ [ devQuotaIncubationToday_kJ ]  of Onespecies speciesIDcolony * (allEggs + allLarvae + allPupae) ; approx. incubation required for whole brood nest today
 set nursingStim 0
 if incubationRequiredToday_kJ > summedIncubationToday_kJ [ set nursingStim 1 ] ; bees will try to incubate brood nest, until requirements for today are fulfilled
 report nursingStim

end

; *******************************************************************************

to-report StimForagingNectarREP ; asked by colony

  let storeSize_d 30
  ;if day > 250 [set storeSize_d 30]
  let minNectarStore_kJ 50000
  let nectarStimTH  0.005 ; heuristically determined
  let idealEnergyFactor 60
  ; heuristically determined
  set idealEnergyStore_kJ idealEnergyFactor * energyNeedToday_kJ * storeSize_d + minNectarStore_kJ
  if idealEnergyStore_kJ < 0 [ AssertionProc "Negative idealEnergyStore_kJ! (StimForagingNectarREP)" ]
  let nectarStim (idealEnergyStore_kJ - energyStore_kJ) / idealEnergyStore_kJ
  ifelse nectarStim > nectarStimTH
    [ set nectarStim 1 ]
    [ set nectarStim 0 ]
  if (Daytime_s < Sunrise_s) or (Daytime_s > Sunrise_s + DailyForagingPeriod_s)   ; foraging only during daytime
    [ set nectarStim 0 ]
  ;vv fgh
;  if NectarAvailableTotal_l < 1
;    [ set nectarStim 0 ]
  if TotalForagingTripsToday > 800000
  [ set nectarStim 0 ]
  report nectarStim
 end

; *******************************************************************************

to-report StimForagingPollenREP ; asked by colony
  let storeSize_d 5
  let pollenStimTH  0.005 ; heuristically determined
  set idealPollenStore_g pollenNeedLarvaeToday_g * storeSize_d + [ minPollenStore_g ] of oneSpecies speciesIDcolony
  if idealPollenStore_g < 0 [ AssertionProc "Negative idealPollenStore_kJ! (StimForagingPollenREP)" ]
  let pollenStim (idealPollenStore_g - pollenStore_g) / idealPollenStore_g
  ifelse pollenStim > pollenStimTH
    [ set pollenStim 1 ]
    [ set pollenStim 0 ]
  if (Daytime_s < Sunrise_s) or (Daytime_s > Sunrise_s + DailyForagingPeriod_s)    ; foraging only during daytime
    [ set pollenStim 0 ]
  report pollenStim
end


; *******************************************************************************

to ActivityProc
  let break_s 0.5 * 3600 ; time a bee spents resting
  set activity "resting"
  if colonyID >= 0  ; only colony members can engage in tasks
  [
   ask Colony colonyID  ; the stimuli in a bees' colony are determined
     [
       set stimEgglaying StimEgglayingREP
       set stimNectarForaging StimForagingNectarREP
       set stimPollenForaging StimForagingPollenREP
       set stimNursing StimNursingREP
     ]

  ; if a colony-specific stimulus exceeds the individual threshold, "activity" of the bee is set to this particular task,
  ; tasks are ordered by their importance:
  if [ stimEgglaying ] of Colony colonyID > thEgglaying [ set activity "egglaying" ]
  if [ stimNursing ] of Colony colonyID > thNursing [ set activity "nursing" ]
  if [ stimPollenForaging ] of Colony colonyID > thForagingPollen [ set activity "pollenForaging" ]
  if [ stimNectarForaging ] of Colony colonyID > thForagingNectar [ set activity "nectarForaging" ]
 ]

  if speciesName = "Psithyrus" and (activity = "nursing" or activity = "pollenForaging" or  activity = "nectarForaging")
    [ set activity "resting" ]

  if activity = "resting" [ set activityList lput "REST" activityList
                            set personalTime_s personalTime_s + break_s
                          ]
  if activity = "egglaying" [ set activityList lput "EGG" activityList
                              EgglayingProc
                            ]
  if activity = "nursing" [ set activityList lput "NURSE" activityList
                            BroodIncubationProc
                          ]
  if activity = "pollenForaging"
                          [ set activityList lput "P-FOR" activityList
                            ForagingProc
                          ]
  if activity = "nectarForaging"
                          [ set activityList lput "N-FOR" activityList
                            ForagingProc
                          ]
end

; *******************************************************************************

to EgglayingProc

  ;vv

  let ELRt (MAX_EGG_LAYING * (1 - Season_HoPoMoREP day []))
  let rELRt round ELRt
  set rELRt rELRT + 1

  let mother caste  ; to distinguish queen and worker laid eggs
  let newCohorts 1  ; this will later be changed for IBM colonies
  ;let beesInCohort [ batchsize ] of OneSpecies speciesID               ; this will later be changed for IBM colonies
  let beesInCohort[ batchsize ] of OneSpecies speciesID
  let eggWeight [devWeightEgg_mg] of OneSpecies speciesID
  let pollenToMass [pollenToBodymassFactor] of OneSpecies speciesID

  if [ cohortBased? ] of colony colonyID = false   ; i.e. IBM colonies..
    [
      let thisColonyID colonyID
      ;let ELRt (MAX_EGG_LAYING * (1 - Season_HoPoMoREP day []))
      ;let rELRt round ELRt
      ;set rELRt rELRT + 1

      let TotalAdultsHere sum [ number ] of bees with [ stage = "adult" and colonyID = thisColonyID] ; and  [ colonyID ] of bees = colony]
      let TotalForagersHere sum [ number ] of bees with [ stage = "adult" and colonyID = thisColonyID and (activity = "searching" or activity = "returningEmpty" or activity = "returningUnhappyN" or activity = "returningUnhappyP" or activity = "nectarForaging" or activity = "collectNectar" or activity = "bringingNectar" or activity = "expForagingN" or activity = "pollenForaging" or activity = "collectPollen" or activity = "bringingPollen" or activity = "expForagingP")]

;      let rELRt_IH (TotalIHbees
;        + TotalForagers * FORAGER_NURSING_CONTRIBUTION)
;      * MAX_BROOD_NURSE_RATIO / EMERGING_AGE

      let rELRt_IH ( ( TotalAdultsHere - TotalForagersHere ) + TotalForagersHere * FORAGER_NURSING_CONTRIBUTION)
      * MAX_BROOD_NURSE_RATIO / EMERGING_AGE
      set rELRt_IH round rELRt_IH + 1

      if rELRt_IH > rELRt [ set rELRt_IH rELRt ]
      ;iopp
      if (allEggs + allLarvae + allPupae ) + ELRt > MAX_BROODCELLS
      [
        set ELRt MAX_BROODCELLS - (allEggs + allLarvae + allPupae )
      ]

      ;vv switched from batchsize set newCohorts [ batchsize ] of OneSpecies speciesID
      set newCohorts rELRt_IH  ; .. number of "cohorts" = batchSize, as each "cohort" contains only a single bee (as IBM colony)..
      set beesInCohort 1                                    ; .. with only 1 bee in each
    ]

  ; Pollen cost is total mass of laid eggs * the conversion of pollen to bee body mass
  ; Energy cost is amount needed by female to facilitate replacement lost pollen
  let pollenCost_g   beesInCohort * eggWeight * pollenToMass / 1000
  let energyCost_kJ  pollenCost_g * EnergyRequiredForPollenAssimilation_kJ_per_g

  if [ pollenStore_g ] of colony colonyID > pollenCost_g and mother = "queen"
  [  ; eggs can only be laid, if enough energy and pollen is present!
    let thisColonyID colonyID

      set TotalAdults sum [ number ] of bees with [ stage = "adult" ] ;
       let TotalAdultsHere sum [ number ] of bees with [ stage = "adult" and colonyID = thisColonyID] ; and  [ colonyID ] of bees = colony]
       let TotalForagersHere sum [ number ] of bees with [ stage = "adult" and colonyID = thisColonyID and (activity != "nursing")]

;      let rELRt_IH (TotalIHbees
;        + TotalForagers * FORAGER_NURSING_CONTRIBUTION)
;      * MAX_BROOD_NURSE_RATIO / EMERGING_AGE

      let rELRt_IH ( ( TotalAdultsHere - TotalForagersHere ) + TotalForagersHere * FORAGER_NURSING_CONTRIBUTION)
      * MAX_BROOD_NURSE_RATIO / EMERGING_AGE
      set rELRt_IH round rELRt_IH + 1
;      let rELRt_IH (TotalAdultsHere * FORAGER_NURSING_CONTRIBUTION * 2 )
;      * MAX_BROOD_NURSE_RATIO / EMERGING_AGE
;      set rELRt_IH round rELRt_IH + 1
      if rELRt_IH > rELRt [ set rELRt_IH rELRt ]
      if rELRt_IH < 0 [ set rELRt_IH 1 ]
      ;if rELRt_IH < rELRt / 3 [ set rELRt_IH rELRt / 3 ]

      ;EggsParameterSettingProc beesInCohort ; calls the procedure EggsParameterSettingProc and transfers the local variable beesInCohort





    hatch newCohorts ; "hatch" command, as "create" is not possible in a turtle context
    [
      ifelse mother = "queen"
        [ ; queens can produce male and female offspring:
          ifelse ticks > [ switchPointDate ] of colony colonyID  ; after the switch point, only males are produced
            ;[ set ploidy 1 ]   ; 1: haploid male
            [ set ploidy 2 ]   ; 2: diploid bee (worker, queen or diploid male)
            [ set ploidy 2 ]   ; 2: diploid bee (worker, queen or diploid male)
        ]
        [ ; workers can only produce male offspring:
          set ploidy 1         ; 1: haploid male
        ]

;      let testAdults sum [ number ] of bees with [ stage = "adult" and colonyID = thisColonyID]
;      OUTPUT-PRINT word "count" word testAdults word " " thisColonyID


      EggsParameterSettingProc rELRt_IH


    ]

    ; Remove costs from store
    ask colony colonyID
    [
     set pollenStore_g  pollenStore_g - pollenCost_g
     ;output-print word "Check egglaying! " word energyStore_kJ energyCost_kJ
     set energyStore_kJ energyStore_kJ - energyCost_kJ
    ]
  ]
  set personalTime_s personalTime_s + 24 * 3600  ; will be reset on next morning!



end

; *******************************************************************************

to EggsParameterSettingProc [ beesInCohort ]
  ; sets parameter values for new eggs
  ; alleles of the egg:
  let shiftDrawnCohorts 1  ; (1) to show cohorts above the colony
  let myAllelesList []
  set myAllelesList fput one-of allelesList myAllelesList   ; egg gets (only) one allele from its mother
  set allelesList myAllelesList
  set caste "undefined"   ; "undefined", "queen", "worker", "male"
  ifelse ploidy = 1  ; haploid males
    [
      set color violet
      set caste "male"
    ]
    [                    ; females and diploid males:
      if ploidy != 2 [ AssertionProc "Wrong ploidy! (EggsParameterSettingProc)" ]
      set color blue
      set allelesList fput one-of spermathecaList allelesList  ; diploid bees get another allele from their father/spermatheca
      if  SexLocus? = true  ; if alleles refer to the sex locus..
          and item 0 allelesList = item 1 allelesList  ; .. and bee is homozygous..
        [ set caste "male" ]   ; .. it becomes a diploid male!
    ]
  set spermathecaList [] ; eggs haven't mated yet..
  set size CohortSymbolSize
  set shape "halfline"
  __set-line-thickness 0.5
  set heading 0
  set number beesInCohort
  set TotalBeesEverProduced TotalBeesEverProduced + number
  set activity "resting"
  set adultAge 0 ; (changed from -1. To stop both brood and adultAge incrementing in tick of maturity/emergence)
  set brood? true
  set broodAge          0   ; set to 0 as eggs are created with the "hatch" command
  set cumulTimeEgg_d    0   ; Set to 0, not mother's value
  set cumulTimeLarva_d  0   ; Set to 0, not mother's value
  set cumulTimePupa_d   0   ; Set to 0, not mother's value
  set cropVolume_myl    0   ; now based on weight, has to be set on emergence
  set pollenPellets_g   0   ; now based on weight, has to be set on emergence
  set currentFoodsource -1  ; not set yet
  set nectarsourceToGoTo -1 ; not set yet
  set pollensourceToGoTo -1 ; not set yet
  set stage "egg"   ; egg, larva, pupa, adult
  set mated? false

  set thEgglaying       ThresholdLevelREP "eggLaying" "egg"
  set thForagingNectar  ThresholdLevelREP "nectarForaging" "egg"
  set thForagingPollen  ThresholdLevelREP "pollenForaging" "egg"
  set thNursing         ThresholdLevelREP "nursing" "egg"
  set activityList [ ]
  set knownMasterpatchesNectarList [ ]
  set knownMasterpatchesPollenList [ ]
  set weight_mg [ devWeightEgg_mg ] of OneSpecies speciesID
  set cumulIncubationReceived_kJ 0
  set emergingDate NotSetLow
  set expectation_NectarTrip_s 0
  set expectation_PollenTrip_s 0
  set glossaLength_mm 0
  set nectarLoadSquadron_kJ 0
  set personalTime_s 0
  set pollenForager? false
  set pollenLoadSquadron_g 0
  set maxLifespanWorkersOwn [maxLifespanWorkers] of oneSpecies speciesID
  if day >= 190
  [set maxLifespanWorkersOwn round ( ( [maxLifespanWorkers] of oneSpecies speciesID )+ (  ( day ) - 190) * 2.6 ) ] ;( [maxLifespanWorkers] of oneSpecies speciesID ) * 3.6 ]
  if day <= 60
  [set maxLifespanWorkersOwn round ( ( [maxLifespanWorkers] of oneSpecies speciesID )+ (  ( 60 - day ) * 2 ) ) ] ;( [maxLifespanWorkers] of oneSpecies speciesID ) * 3.6 ]
  ; location of egg cohort on the interface is relative to its colony's location:
  set xcor [ xcor ] of Colony colonyID - [ devAgeEmergingMin_d / 10 ] of OneSpecies speciesID
  set ycor [ ycor ] of Colony colonyID + shiftDrawnCohorts
  ifelse ShowCohorts? = false
    [ hide-turtle ]
    [ show-turtle ]
  ask colony colonyID [set totalEggsProduced  totalEggsProduced + beesInCohort]

end


; *******************************************************************************

to BroodIncubationProc
  ; vv change these
  ; Heinrich p. 70, Fig. 5.2: 144 tempertature recordings in 24hrs (every 10 minutes) of which ca. 48 are below optimal (20 heating periods)
  ; hence: 96 * 10 min = 960 mins heating in 20 periods = 2880s heating
  ; Silvola 1984: Queen (B. terrestris) spends ca. 10kJ/day for incubation
  ; Bombus terrestris Queen weight: mean: 0.8g (Beekman et al 1998)  2017-03-29: HOWEVER:Silvola assumes a weight of 650mg, which should have been used here!
  ; hence: 10kJ/0.8g = 12.5 kJ/g per day provided from heating bees
  ; with 1 day = 960 minutes (16hrs) (Heinrich (see above))
  ; hence incubation energy per heating bee-mass is:
  ; 0.0130208333kJ per minute and g (or 0.000217013888 kJ per second and g)
  ; or 0.000000217013888 kJ per second and mg

 let heatingPeriod_s 2880  ; (2880s = 48 min) time spent on incubation - ca. 48 min. between foraging flights of incubating queen, Heinrich, p. 92, Fig. 5.2
 let incubationEnergy_kJ_per_mg_s 0.000000217013888 ; (better alternative: 0.00000026709?) kJ per mg heating bee-mass per second (calculation see above)
 let heatProvided_kJ heatingPeriod_s * incubationEnergy_kJ_per_mg_s * weight_mg * number ; [kJ] energy released by heating bee during an incubation phase
 let heatProvidedPerBrood_kJ 0
 if [ allEggs + allLarvae + allPupae ] of  Colony colonyID > 0
  [ set heatProvidedPerBrood_kJ heatProvided_kJ / [ allEggs + allLarvae + allPupae ] of  Colony colonyID ]   ; the amount of heat is equally distributed over the brood
 let memoColonyID colonyID
 ask bees with [ colonyID = memoColonyID and (stage = "egg" or stage = "larva" or stage = "pupa") ]
  [ set cumulIncubationReceived_kJ cumulIncubationReceived_kJ + heatProvidedPerBrood_kJ ]
 ask Colony colonyID
 [
   set summedIncubationToday_kJ summedIncubationToday_kJ + heatProvided_kJ
;   if energyStore_kJ - heatProvided_kJ < 0 and heatProvided_kJ > 1
;    [
;    output-print word "OI" word energyStore_kJ heatProvided_kJ
;    ]
   ;set energyStore_kJ energyStore_kJ - heatProvided_kJ  ; energy spent for heating is subtracted from colonies' energy stores
   ;set energyStore_kJ energyStore_kJ - ( ( ( 42.42 * allEggs / MAX_BROOD_NURSE_RATIO ) + ( allLarvae ) * ( 65.4 / ( PUPATION_AGE - HATCHING_AGE ) ) ) / 1000 ) * 12.78 ;vv beehave
 ]
 set personalTime_s personalTime_s + heatingPeriod_s  ; heating takes some time..
end

; *******************************************************************************

to UpdateMorning_Proc
  if AssertionViolated [ ask patches [ set pcolor red ] user-message "Assertion violated!" ]
  set Day round (ticks mod 365.00000001)
  if ticks > 0 and (Day < 1 or Day > 365) [ AssertionProc "Error in calculation of Day! (Updates_Proc)" ]
  set Date DateREP
  if Day > 0 [ set DailyForagingPeriod_s Foraging_PeriodREP ]
  UpdateFoodsourcesProc
        ;vv this kills the workers and will not work on honeybees
  ;UpdateSeasonalEventsProc
  EmergenceNewQueensProc
  let randomTimeToGetUp_s 1800 ; [s]
  set ActiveBeesSortedList []
  ask bees with [ (caste = "worker" or caste = "queen") and (activity != "hibernate") and stage = "adult" ]
  [
    set personalTime_s GetUpTime_s + random randomTimeToGetUp_s
    set activityList [ ]
    set ActiveBeesSortedList fput who ActiveBeesSortedList
  ]
  set ActiveBeesSortedList sort-by [ [?1 ?2] -> [personalTime_s] of bee ?1 < [personalTime_s] of bee ?2 ] ActiveBeesSortedList
  UpdateColoniesProc
  UpdateColonyStoreBarsProc
  CheckNumbersProc
end


; *******************************************************************************

to UpdateSeasonalEventsProc
  ; addresses seasonal events such as the species specific end of the season
;  ask Species
;    [
;      let whoSpec who
;
;
;      if Day = seasonStop
;      [
;        ask bees with [ speciesID = whoSpec and activity != "hibernate" ]
;          [
;            let memoNumber number
;            if brood? [ ask colony colonyID [ set broodDeathEndSeason  broodDeathEndSeason + memoNumber ] ]
;            DieProc "End of season"
;          ]
;      ]
;    ]
  if TotalHibernatingQueens = TotalQueens and (TotalEggs + TotalLarvae + TotalPupae = 0) and TotalMales > 0;  i.e. kill males in autumn if all queens are in hibernation and no brood is left
    [
      ask bees with [ caste = "male" ][ DieProc "Males: all queens in hibernation!" ]
    ]
  if Day = 1
    [
      with-local-randomness [ ask bees with [ caste = "queen" and activity = "hibernate" ] [ setxy 0 0 ] ]   ; hibernating queens are moved to bottem left corner to distinguish this year's and last years queens
         ; with-local-randomness: to not change sequence of random numbers, results of "Version test", 2017-04-21
      let queensToKill TotalHibernatingQueens - MaxHibernatingQueens
      if queensToKill > 0
        [
          set TotalHibernatingQueensEverRemoved TotalHibernatingQueensEverRemoved  + queensToKill
          output-print "Reduced number of hibernating queens to no more than MaxHibernatingQueens!"
        ]
      while [ queensToKill > 0 ]
      [
        ask one-of bees with [ caste = "queen" and activity = "hibernate" ] ; hibernatingQueensToBeKilled of hibernating queens are killed on 1st January
           [
             set queensToKill queensToKill - number
             DieProc "max. number of hibernating queens"
           ]
      ]
    ]
end

; *******************************************************************************

to UpdateFoodsourcesProc
  ; updating FOODSOURCES (nectar & pollen):
  set PollenAvailableTotal_kg 0
  set NectarAvailableTotal_l 0
  set FoodsourcesInFlowerUpdate? false ; might be set true below (if true, colonies need to update their nectarInFlowerAndRangeList)
  ask foodsources
  [
    if startDay > StopDay ; turn of the year must not occur during the flowering period of any food source!
      [ AssertionProc "Foodsource: startDay > StopDay! (UpdateFoodsourcesProc)"  ]
    if day = startDay or day = stopDay [ set FoodsourcesInFlowerUpdate? true ] ; if true, colonies need to update their nectarInFlowerAndRangeList
    ifelse day >= startDay and day < StopDay  ; IMPRORTANT: day < StopDay  (and NOT <=) otherwise nectarInFlowerAndRangeList is not updated correctly!!
    [
       set nectar_myl nectarMax_myl
       set pollen_g pollenMax_g
    ]
    [
       set nectar_myl 0
       set pollen_g 0
    ]
    set NectarAvailableTotal_l NectarAvailableTotal_l + (nectar_myl / (1000 * 1000))
    set PollenAvailableTotal_kg PollenAvailableTotal_kg + (pollen_g / 1000)
  ]
end

; *******************************************************************************

to UpdateColonyStoreBarsProc
 ask storeBars
  [
    let nectarSizeFactor 0
    let pollenSizeFactor 0
    ifelse colony storeColonyID = nobody
     [ die ]  ; storeBars die here (and not in DieProc as not a biological agent)
     [
       ask colony storeColonyID
       [
         set nectarSizeFactor energyStore_kJ / (idealEnergyStore_kJ + 0.00001)   ; + 0.00001 to avoid division by zero
         set pollenSizeFactor pollenStore_g / (idealPollenStore_g + 0.00001)
         if nectarSizeFactor > 1 [ set nectarSizeFactor 1 ]
         if pollenSizeFactor > 1 [ set pollenSizeFactor 1 ]
       ]
     ]
    if store = "Nectar"
     [ set size maxSize * nectarSizeFactor ]
    if store = "Pollen"
     [ set size maxSize * pollenSizeFactor ]
  ]
end

; *******************************************************************************

to-report CompetitionPointDateREP
  ; determines the date of a colonies' competition point
 let compDate NotSetHigh
 let x queenProductionDate - eusocialPhaseDate   ; range: ca; -5..40 i.e. y ca. 12 - 43.5
 let y 0.7 * x + 15.5   ; from Duchateau & Velthuis 1988, Fig. 6
 let latestCPafter_d 45
 set compDate round (eusocialPhaseDate + y)
 if compDate - eusocialPhaseDate > latestCPafter_d
    [ set compDate eusocialPhaseDate + latestCPafter_d ]
 report compDate
end

; *******************************************************************************

to UpdateColoniesProc
  ask colonies
  [
    let whoCol who
    let countBroodMort_NA 0 ;count number of brood dying through no adults left
    let countBroodMort_ES 0 ;count number of brood dying through energy stores being empty
    if FoodsourcesInFlowerUpdate? = true
      [ FoodsourcesInFlowerAndRangeProc ]   ; updated, if some foodsources started or stopped flowering today
;    if ticks > competitionPointDate ; death of colony after competition point
;       and allEggs + allLarvae + allPupae = 0
;       [
;         ask bees with [ colonyID = whoCol and adultAge > 10 and (caste = "worker"  or caste = "queen")];  as males are outside the colony they are killed separately in UpdateSeasonalEventsProc
;           [ DieProc "Colony death after CP!"]
;       ]

    if energyStore_kJ <= 0
      [
        ask bees with [ colonyID = whoCol ]
        [
          if brood? = TRUE [set countBroodMort_ES countBRoodMort_ES + number]
          DieProc "Colony's energy store depleted!"

        ]
      ]
    if (sum [ number ] of bees with [ colonyID = whoCol and brood? = false ] = 0)
       [ ask bees with [ colonyID = whoCol ]
         [
           if brood? = TRUE [set countBroodMort_NA countBroodMort_NA + number]
           DieProc "No adult bees left!"
         ]
       ]
    set broodDeathsNoAdults       broodDeathsNoAdults + countBroodMort_NA
    set broodDeathsEnergyStores   broodDeathsEnergyStores + countBRoodMort_ES
    set summedIncubationToday_kJ  0

    ; STATS:
    set allEggs sum [ number ] of bees with [ colonyID = whoCol and stage = "egg" ]
    set allLarvae sum [ number ] of bees with [ colonyID = whoCol and stage = "larva" ]
    set allPupae sum [ number ] of bees with [ colonyID = whoCol and stage = "pupa" ]
    set allAdults sum [ number ] of bees with [ colonyID = whoCol and stage = "adult" ]
    set allAdultWorkers sum [ number ] of bees with [ colonyID = whoCol and caste = "worker" and stage = "adult" ]
    set allForagers sum [ number ] of bees with [ colonyID = whoCol and caste = "worker" and stage = "adult" and activity != "nursing" and activity != "resting" ]
    set allAdultQueens sum [ number ] of bees with [ colonyID = whoCol and caste = "queen" and brood? = false ]
    set allAdultActiveQueens sum [ number ] of bees with [ colonyID = whoCol and caste = "queen" and activity != "hibernate" and brood? = false ]
    set allAdultMales sum [ number ] of bees with [ colonyID = whoCol and caste = "male" and brood? = false ]
    set colonysize sum [ number ] of bees with [ colonyID = whoCol ]
    ifelse allAdultWorkers > 0
      [ set larvaWorkerRatio allLarvae / allAdultWorkers ]
      [ set larvaWorkerRatio NotSetHigh ]
    set colonyWeight_mg sum [number * weight_mg] of bees with [ colonyID = whoCol ]

    ; determine eusocial phase (starts with emergence of first worker):
    if eusocialPhaseDate = NotSetHigh and allAdultWorkers > 0
      [ set eusocialPhaseDate ticks ]

    ; determine SWITCH POINT:
    if switchPointDate = NotSetHigh  ; i.e. the colony/queen hasn't switched to lay haploid eggs
    [
      if eusocialPhaseDate < NotSetHigh  ; i.e. colony is now in the eusocial phase
      and larvaWorkerRatio < LarvaWorkerRatioTH
      [
        if random-float 1 <= DailySwitchProbability   ; DailySwitchProbability affects the sex ratio: increasing it results in more males, decreasing it in more queens
        [ set switchPointDate ticks ]
      ]
    ]

    ; vv do we need this?
    ; determine COMPETITION POINT and TERMINATE colony:
    ;if competitionPointDate = NotSetHigh
    ;     and eusocialPhaseDate    < NotSetHigh
    ;     and queenProductionDate  < NotSetHigh
    ;[ set competitionPointDate CompetitionPointDateREP ]
    ;if ticks >= competitionPointDate [ set heading 180 ] ; colony symbol is turned on its head after CP

    ; LABELS & SIGNS:
    set label colonysize
    if count bees with [ colonyID = whoCol and caste = "queen" and mated? = true ] = 0
      [ set queenright? false ]

    ifelse count bees with [ colonyID = whoCol ] = 0
      [
        ; to diplay the production of reproductives on the map..
        let malesHere totalMalesProduced   ; ... the numer of adult males..
        let queensHere totalQueensProduced  ; .. and adult queens ever produced by this dying colony..
        ask patch-here
         [
           set nMalesProduced nMalesProduced + malesHere     ; .. is added to the total neumber of males..
           set nQueensProduced nQueensProduced + queensHere  ; and queens ever produced here at this Netlogo patch
           set nColonies nColonies + 1      ; ..and the total colonies here
         ]
        let endSeasonDate [seasonStop] of onespecies speciesIDcolony
        ifelse day >= EndSeasonDate
          [ set ColonyDeathsEndSeason  ColonyDeathsEndSeason + 1 ]
          [ set ColonyDeathsNoBees     ColonyDeathsNoBees + 1 ]
        DieProc "Colony: No adults or brood left in this colony!"    ; colony dies, as no bees are left
      ]
      [
        set colonyAge colonyAge + 1
      ]



     let TotalAdultsHere sum [ number ] of bees with [ stage = "adult" and colonyID = whoCol] ; and  [ colonyID ] of bees = colony]
     let TotalForagersHere sum [ number ] of bees with [ stage = "adult" and colonyID = whoCol and (activity = "searching" or activity = "returningEmpty" or activity = "returningUnhappyN" or activity = "returningUnhappyP" or activity = "nectarForaging" or activity = "collectNectar" or activity = "bringingNectar" or activity = "expForagingN" or activity = "pollenForaging" or activity = "collectPollen" or activity = "bringingPollen" or activity = "expForagingP")]


    let workloadNurses 0
    if ( ( ( ( TotalAdultsHere - TotalForagersHere ) + TotalForagersHere * FORAGER_NURSING_CONTRIBUTION)
      *  MAX_BROOD_NURSE_RATIO ) > 0 ) [
    set workloadNurses ( ( allEggs + allLarvae + allPupae)
      / ( ( TotalAdultsHere - TotalForagersHere ) + TotalForagersHere * FORAGER_NURSING_CONTRIBUTION)
      *  MAX_BROOD_NURSE_RATIO )
  ]


    ;output-print word "Checking colony: " whoCol
    ;output-print word "Workload from brood: " workloadNurses

    ifelse PollenStore_g > 25
    [
    set ProteinFactorNurses ProteinFactorNurses + (1 / 7)
    ]
    [
    set ProteinFactorNurses ProteinFactorNurses - (workloadNurses / 7)
    ]

    if ProteinFactorNurses > 1 [ set ProteinFactorNurses 1 ]
    if ProteinFactorNurses < 0 [ set ProteinFactorNurses 0 ]

    let starvedBrood ceiling ((allLarvae) * (1 - ProteinFactorNurses))

    ;output-print word "Protein reserve: " ProteinFactorNurses
    ;output-print word "Starve brood: " starvedBrood

    let ExcessBroodHere
    ceiling ( ( allEggs + allLarvae + allPupae)
      - ( ( TotalAdultsHere - TotalForagersHere ) + TotalForagersHere * FORAGER_NURSING_CONTRIBUTION)
      *  MAX_BROOD_NURSE_RATIO )

    if ExcessBroodHere < starvedBrood
    [
      set ExcessBroodHere starvedBrood
    ]
    ;output-print word "Excess brood: " ExcessBroodHere
    ;output-print word "Total brood: " ( allEggs + allLarvae + allPupae)

    if ExcessBroodHere > ( allEggs + allLarvae + allPupae)
    [
      set ExcessBroodHere ( allEggs + allLarvae + allPupae)
    ]

    if ExcessBroodHere > 0 and TotalAdultsHere > 10000 and ExcessBroodHere < 1000 and (allEggs + allLarvae + allPupae) > 1000
    [
      let setToKill ExcessBroodHere
      ask up-to-n-of setToKill bees with [ (stage = "larva" or stage = "pupa" or stage = "egg") and colonyID = whoCol]
      [
        dieProc ["Starving brood killed"]
      ]

    ]

    set allEggs sum [ number ] of bees with [ colonyID = whoCol and stage = "egg" ]
    set allLarvae sum [ number ] of bees with [ colonyID = whoCol and stage = "larva" ]
    set allPupae sum [ number ] of bees with [ colonyID = whoCol and stage = "pupa" ]
    set allAdults sum [ number ] of bees with [ colonyID = whoCol and stage = "adult" ]
    set allAdultWorkers sum [ number ] of bees with [ colonyID = whoCol and caste = "worker" and stage = "adult" ]
    set allAdultQueens sum [ number ] of bees with [ colonyID = whoCol and caste = "queen" and brood? = false ]
    set allAdultActiveQueens sum [ number ] of bees with [ colonyID = whoCol and caste = "queen" and activity != "hibernate" and brood? = false ]
    set allAdultMales sum [ number ] of bees with [ colonyID = whoCol and caste = "male" and brood? = false ]
    set colonysize sum [ number ] of bees with [ colonyID = whoCol ]
    ifelse allAdultWorkers > 0
      [ set larvaWorkerRatio allLarvae / allAdultWorkers ]
      [ set larvaWorkerRatio NotSetHigh ]
    set colonyWeight_mg sum [number * weight_mg] of bees with [ colonyID = whoCol ]



    ;jkl

  ]
  if KeepDeadColonies? = false and Day = 1 [ ask DeadCols [ die ] ]  ; dead colonies can be removed from the simulation with the new year



        ;asdf






end

; *******************************************************************************

to-report WintermortalityProbREP
  ; Winter survival (survivalProb) is calculated from Beekman et al 1998 (Entomologia Experimentalis et Applicata 89: 207–214, 1998)
  ; Fig. 1B: survival prob. is calculated from proportion of survivors to survivors + non-survivors. Using the relative weight rather than the absolute weight, we fitted a sigmoid curve (survivalProb) to the left site only,
  ; as the low surv. prob. of heavy queens is an artefact of the treatment:
  ; "One would expect that queens with the highest weight will survive diapause. It is therefore surprising that the initial weight distribution of dead queens exceeds that of the surviving queens (Figure 1B and 1C).
  ; However, in 1993 the average initial weight of the queens was highest and in this period the most severe diapause regimes (6 or 8 months) were started. Since the majority of the queens that were given a treatment
  ; with a length of 6 or 8 months died, the initial weight distribution of dead queens exceeds that of the surviving queens."

 let minWeightSpecies_mg [ devWeight_Q_PupationMin_mg ] of oneSpecies speciesID ; the min. weight of a queen for this species
 let maxWeightSpecies_mg [ devWeight_Q_PupationMax_mg ] of oneSpecies speciesID ; the max. weight of a queen for this species
 let myRelativeWeight (weight_mg - minWeightSpecies_mg) / (maxWeightSpecies_mg - minWeightSpecies_mg) ; the relative weight of this queen
 if myRelativeWeight < 0 or myRelativeWeight > 1 [ AssertionProc "Wrong weight! (WintermortalityProbREP)"  ]
 let survivalProb 0.64 / (1 + e ^ (-22 * (myRelativeWeight - 0.32))) ; survival probability of B. terrestris, based on Beekman et al. 1998, with bees' weight relative to the min/max weights in this data set
 report survivalProb
end

; *******************************************************************************

to EmergenceNewQueensProc
  ; new queens emerge from hibernation and found new colonies (note: most queens will still be represented as cohorts here!)
  ; Winter survival (survivalProb) is calculated from Beekman et al 1998 (Entomologia Experimentalis et Applicata 89: 207–214, 1998)
  ; Fig. 1B: survival prob. is calculated from proportion of survivors to survivors + non-survivors. Fitted a sigmoid curve to the left site only, as the low surv. prob. of heavy queens
  ; is an artefact of the treatment:
  ; "One would expect that queens with the highest weight will survive diapause. It is therefore surprising that the initial weight distribution of dead queens exceeds that of the surviving queens (Figure 1B and 1C).
  ; However, in 1993 the average initial weight of the queens was highest and in this period the most severe diapause regimes (6 or 8 months) were started. Since the majority of the queens that were given a treatment
  ; with a length of 6 or 8 months died, the initial weight distribution of dead queens exceeds that of the surviving queens."

  ;cohorts split into individuals before being challenged for over-winter survival
  ask bees with [emergingDate = ticks]
  [
    ; EMERGING:
    ;if caste != "queen" [ show "WARNING! Something else than a queen emerged from hibernation! (1)" ]
    set activity "emerging"
    ; thresholds are updated:
    set thEgglaying ThresholdLevelREP "eggLaying" "QueenInitiationPhase"
    set thForagingNectar ThresholdLevelREP "nectarForaging" "QueenInitiationPhase"
    set thForagingPollen ThresholdLevelREP "pollenForaging" "QueenInitiationPhase"
    set thNursing ThresholdLevelREP "nursing" "QueenInitiationPhase"

    ; HATCHING INDIVIDUALS:
    ; cohort based queens become individuals:
    let hatchlings number - 1 ; for cohort based queens: bee needs to be "cloned" cohortsize - 1 times!
    set number 1        ; new queens are individuals now (not cohorts)
    hatch hatchlings    ; the "clones" of the originally cohort-based queenagent are created
  ]


  ask bees with [activity = "emerging"]
  [
    ;if caste != "queen" [ show "WARNING! Something else than a queen emerged from hibernation! (2)" ]
    ;vv winter mortality
    ; WINTER MORTALITY:
    ; Queen has a risk of dying over winter:
    if WinterMortality? = true and random-float 1 > WintermortalityProbREP
      [ DieProc "winter mortality"
        output-print "winter mortality"
      ]

    ; AFTER SURVIVAL:
    set activity "resting"
    set colonyID -1   ; queens haven't found a nest site yet nor started a colony
    ifelse ShowQueens? = true
      [show-turtle]
      [hide-turtle]
  ]

  ; create new colonies for freshly emerged queens:
  if count bees with [ caste = "queen" and colonyID = -1 and activity != "hibernate" ] > 0 ; i.e. (relatively) newly emerged queens (though might have emerged a few days ago)
  [
    ; queens without a colony search for nest sites
    ask bees with [ caste = "queen" and colonyID = -1 and activity != "hibernate" ]
    [
      ifelse count [nestsiteFoodsourceList] of onespecies speciesID > 0 ;check that the habitat contains suitable foodsources for this species to nest in
      [
        ifelse speciesName != "Psithyrus"
          [ NestSitesSearchingProc  ]  ; social BB
          [ PsithyrusNestSearchProc ]  ; cuckoo BB
       if ShowSearchingQueens? = false [hide-turtle]
      ]
      [
        DieProc (word "no suitable foodsources for nesting exist for " speciesname) ; kill off bees with no chance of finding a nest site
      ]
    ]
    ; if successful, they build a new nest:
    if count bees with [ activity = "nestConstruction" ] > 0
     [ CreateColoniesProc
       PopulateColoniesProc
    ]
    if count bees with [ activity = "nestConstruction" ] > 0
     [ show "That's weird - no constructions here, please!" ]
  ]
end

; *******************************************************************************

to DrawCohortsProc
 ask colonies
 [
   let whoCol who  ; saves colony ID
   if count bees with [ colonyID = whoCol and shape = "halfline" ] > 0
   [
     let currentAge 0
     let maxAge 1 + [ broodAge + adultage ] of
                max-one-of bees with [ colonyID = whoCol and shape = "halfline" ] [ broodAge + adultage ]
     repeat maxAge
     [
       let cohortSize sum [number] of Bees
                      with [ broodAge + adultage = currentAge
                      and  colonyID = whoCol
                      and shape = "halfline" ] ; i.e. not the mother queen
       ask bees with [ broodAge + adultage = currentAge
                and colonyID = whoCol
                and shape = "halfline" ]
          [ set size cohortSize * CohortSymbolSize ]
       set currentAge currentAge + 1
     ]
   ]
 ]
end


; *******************************************************************************

to FeedLarvaeProc  ; determines how much nectar and pollen is fed to larvae in each colony,
    ; calculates the resulting weight gain of the larvae and updates the colony stores

ask colonies
 [

  let myColony who

  ; RELATIVE AMOUNTS TO BE FED:
  ; Calculate amount of NP to be fed to larvae relative to the amount they require for maximum growth
  let relativePollenToBeFed 0 ; may be updated below
  let relativeEnergyToBeFed 0

  ; This will be set based on how large the stores are relative to the ideal stores (these have already been filled through foraging today)
  ; Both stores must be greater than 0, as pollen and nectar are both required for growth
  if idealPollenStore_g * idealEnergyStore_kJ > 0   ; i.e. if both > 0
  [
    set relativePollenToBeFed pollenStore_g / idealPollenStore_g
    set relativeEnergyToBeFed energyStore_kJ / idealEnergyStore_kJ

    ; set values to be bound by 0 1. Added bound by 0 because values can be lower if the energyStore is negative (this is okay, because
    ; the colony will die at the start of the next tick). Negative values lead to energy being taken from the larvae and added back to the store.
    set relativePollenToBeFed median (list 0 1 relativePollenToBeFed) ; input of the median command needs to be a list..
    set relativeEnergyToBeFed median (list 0 1 relativeEnergyToBeFed) ; ..picks the "middle" of the three values, i.e. usually relativePollen/EnergyToBeFed

  ]

  ; So set the growth limiting factor as the lowest of either relativeEnergy or relativePollen
  ; based on Liebig's law of the minimum, larval growth is assumed to be limited by only one factor:
  let growthLimitingFactor relativePollenToBeFed
  if relativeEnergyToBeFed < relativePollenToBeFed  ; amount of nectar fed is adjusted to the amount of pollen fed
    [ set growthLimitingFactor relativeEnergyToBeFed ]


  ; ACTUAL FEEDING OF EACH INDIVIDUAL LARVA:
  let totalPollenFedToday_g 0  ; sums up the total amount of pollen a colony feeds to the larvae
  ask bees with [ stage = "larva" and colonyID = myColony ]
  [
    ; Calculate pollen gained based on conversion to max weight gain adjusted by limiting factor
    ; amount of pollen fed to a single larva (no "number" here as it refers to amount an individual larva gets)
    let pollenReceivedToday_mg growthLimitingFactor * ((MaxWeightGainToday_mg_REP who) / ([pollenToBodymassFactor] of OneSpecies speciesID))
    if pollenReceivedToday_mg > [ pollenStore_g ] of colony myColony * 1000  ; to avoid negative pollen stores
      [
        set pollenReceivedToday_mg [ pollenStore_g ] of colony myColony * 1000
        if pollenReceivedToday_mg < 0 [ set pollenReceivedToday_mg 0 ] ; in case of negative pollen stores, larvae are not fed at all!


       ]

    ; Update the larva's weight
    let oldWeight_mg weight_mg
    set weight_mg weight_mg + pollenReceivedToday_mg * [pollenToBodymassFactor] of OneSpecies speciesID
    if weight_mg < 0 [ AssertionProc "BUG in FeedPOLLENProc" ]
    if weight_mg < oldWeight_mg [ AssertionProc "BUG in FeedPOLLENProc: WeightLoss" ]
    ; Update the total pollen to be taken from the store by the number of indivuals in the cohort
    set totalPollenFedToday_g totalPollenFedToday_g + (number * pollenReceivedToday_mg / 1000)      ; multiplied by "number" here as it refers to the total costs for the colony
  ]

  ; Update the total energy required to assimilate the pollen consumed
  let totalEnergyFedToday_kJ totalPollenFedToday_g * EnergyRequiredForPollenAssimilation_kJ_per_g

  ; REMOVING RESOURCES FROM THE STORES:
  set pollenStore_g pollenStore_g - totalPollenFedToday_g
  if pollenStore_g < 0  [ type "negative pollen store! Ticks: " show ticks ]
;vv feeding  set energyStore_kJ energyStore_kJ - totalEnergyFedToday_kJ  ; negative energy store doesn't matter as it results in the death of the colony the next morning (in UpdateColoniesProc)
;    if day > 362
;    [
;      output-print word "food consumed : " word energyStore_kJ word " " word totalEnergyFedToday_kJ word " " day
;    ]

]

end


;;; *******************************************************************************

to-report DetectionProbREP [ patchWho xcol ycol ]
  let dist_m 0
  let patchRadius_m -999
  ; calculation of the distance between Foodsource and Colony:
  ask foodsource patchWho
    [
      set dist_m (distancexy xcol ycol) / SCALING_NLpatches/m  ; distancexy: in NetLogo gridcells
      set patchRadius_m radius_m
     ]
  ; calculation of the detection probability, based on the distance (see BEESCOUT model, Becher et al. 2016, Ecological Modelling):
  let relevantDistance_m dist_m - patchRadius_m ; the "relevant" distance is the distance to the edge of the field, i.e. dist_m (=centre) - patchRadius_m
  if relevantDistance_m < 0 [ set relevantDistance_m 0 ] ; no negative distances!
  let detProb e ^ (Lambda_detectProb * relevantDistance_m)
  if relevantDistance_m > ForagingRangeMax_m
     [ set detProb 0 ] ; patch is beyond the colonies foraging range
  report precision detProb 10
end



; *******************************************************************************



; ===============================================================================     ===============================================================================     ===============================================================================
; *******************************************************************************     *******************************************************************************     *******************************************************************************
; #####     FORAGING MODULE     #####     FORAGING MODULE     #####     #########     #####     FORAGING MODULE     #####     FORAGING MODULE     #####     #########     #####     FORAGING MODULE     #####     FORAGING MODULE     #####     #########
; *******************************************************************************     *******************************************************************************     *******************************************************************************
; ===============================================================================     ===============================================================================     ===============================================================================


to ForagingProc


 set TotalForagingTripsToday TotalForagingTripsToday + number
 ifelse activity = "pollenForaging" ; if bee decided to collect pollen..
  [
     set pollenForager? true        ; .. it becomes a pollen forager..
     set currentFoodsource pollensourceToGoTo
  ]
  [
     set pollenForager? false       ; or otherwise a nectar forager
     set currentFoodsource nectarsourceToGoTo
  ]

 ifelse currentFoodsource < 0 ; i.e. currentFoodsource  does not refer to an existing food source
  [
     set activity "searching"
     set activityList lput "S" activityList
   ]
  [
     ifelse pollenForager? = true
       [
         set activity "collectPollen"
         set activityList lput "cP" activityList
       ]
       [
         set activity "collectNectar"
         set activityList lput "cN" activityList
       ]
  ]

 Foraging_searchingProc    ; unexperienced foragers search new flower patch
 set activityList lput (word "(" currentFoodsource ")"  ) activityList ; add foodsource to activityList after search
 Foraging_collectNectarPollenProc  ; succesful scouts and experienced Foragers gather nectar
 Foraging_costs&choiceProc  ; energy costs for flights and trip duration
 Foraging_unloadingProc  ; ..and unload their crop & increase colony's honey store

 if (pollenLoadSquadron_g + nectarLoadSquadron_kJ) > 0
    [ AssertionProc "Bee carries pollen or nectar after unloading! (ForagingProc)"]

end

; *******************************************************************************

to-report Foraging_SortKnownPatchesListREP [ knownPatchesList ]
; removes duplicates in list and sorts it  by distances of masterpatches and the bee's colony
 let newList []
 set knownPatchesList remove-duplicates knownPatchesList  ; duplicates are removed from the list
 ask Colony colonyID ; this is the colony of the scouting bee
   [ set newList sort-by [ [?1 ?2] -> distance (Foodsource  ?1) < distance (Foodsource ?2) ] knownPatchesList ] ; division by SCALING_NLpatches/m is not necessary here!
 report newList
end

; *******************************************************************************

to Foraging_searchingProc
 ; foragers with activity = "searching" may find a food source, other foragers (activity: collect nectar or pollen) don't do anything here
  if activity = "searching"
  [
    let chosenMasterpatch -1 ; bee hasn't found a food source yet
    let myMasterpatchesWithFoodList []
    let xcol NotSetHigh  ; saves the location of the bee's colony to determine the detection probability
    let ycol NotSetHigh
    let pollenFor false
    if pollenForager? = true [ set pollenFor true ]
    ask colony colonyID
    [
      set xcol xcor
      set ycol ycor

      ifelse pollenFor = true
        [ set myMasterpatchesWithFoodList masterpatchesWithPollenlayersInFlowerAndRangeList ]  ; only masterpatches are considered, otherwise, detection prob. would increase with the number of flowerspecies at a patch!
        [ set myMasterpatchesWithFoodList masterpatchesWithNectarlayersInFlowerAndRangeList ]
    ]

    foreach shuffle myMasterpatchesWithFoodList ; shuffled only once, not every time a new item is addressed!
    [ ?1 ->
      if random-float 1 <  DetectionProbREP ?1 xcol ycol  ; all items in list are addressed, hence chosenMasterpatch may be set several times - only last patch detected is the patch chosen!
      [ set chosenMasterpatch ?1 ]            ; this is a masterpatch that has at least 1 layer currently providing the forage the bee is searching for
    ]

    ifelse chosenMasterpatch >= 0  ; if the bee has found a patch:
    [
      set currentFoodsource Foraging_bestLayerREP chosenMasterpatch  ; the bees new food source is then the best layer at that patch (based on handling time) (only sources actually providing the food the bee is after are considered)
      ifelse currentFoodsource >= 0
      [
        ifelse pollenForager? = true
        [
          set knownMasterpatchesPollenList fput chosenMasterpatch knownMasterpatchesPollenList ; food source is added to the list of known pollen patches
          set knownMasterpatchesPollenList Foraging_SortKnownPatchesListREP knownMasterpatchesPollenList  ; the list is now sorted again by distances, with duplicates being removed
          set activity "collectPollen"
          set activityList lput "cP" activityList
        ]
        [
          set knownMasterpatchesNectarList fput chosenMasterpatch knownMasterpatchesNectarList  ; food source is added to the bees' list of known nectar patches
          set knownMasterpatchesNectarList Foraging_SortKnownPatchesListREP knownMasterpatchesNectarList ; the bees' list is now sorted again by distance, with duplicates being removed
          set activity "collectNectar"
          set activityList lput "cN" activityList
        ]
      ]
      [
        ; bee found a patch but with 0 nectar or pollen (because this foodsource was visited by bees and depleted earlier today)
        set activity "returningEmpty"
        set activityList lput "rE0" activityList
      ]
    ]
    [
      ; otherwise, if bee does not find a patch:
        set activity "returningEmpty"
        set activityList lput "rE" activityList
    ]
  ]
  if activity =  "searching" [ AssertionProc "Bee is still searching! (Foraging_searchingProc)"  ]
end

; *******************************************************************************

to Foraging_collectNectarPollenProc
; foragers with activity = "collectPollen" or activity = "expForagingP" OR activity = "collectNectar" or activity = "expForagingN" can gather food from a food source. No other bees are addressed
  if activity = "collectPollen" or activity = "expForagingP"
  [
    ; amount of pollen that can be collected by the forager squadron
    ; does patch still have any pollen?:
    ifelse [ pollen_g ] of Foodsource currentFoodsource > 0
      [ ; the forager will then be bringing pollen:
        set pollenLoadSquadron_g min list ; takes the smaller value of an ad hoc created list with two items: 1st: max. pollen bee (cohort) can carry, 2nd: pollen left at patch.
          (pollenPellets_g * number)   ; 1st item: max. pollen a bee (cohort) can carry
          ([ pollen_g ] of Foodsource currentFoodsource)   ; 2nd item: max. pollen bee (cohort) can carry
        set activity "bringingPollen"
        set activityList lput "P" activityList
        ; amount of pollen at the patch is reduced
        let memoNumber number
        let memoPollenLoad pollenLoadSquadron_g
        ask foodsource currentFoodsource
          [
            set pollen_g pollen_g - memoPollenLoad
            set cumulPollenVisits cumulPollenVisits + memoNumber ; all pollen visits at patch, ever
          ]
      ]
      [
        set activity "returningEmpty"
        set activityList lput "Ep" activityList
      ]
   ]

  if activity = "collectNectar" or activity = "expForagingN"
  [
    ; does patch still have any nectar?:
    ifelse [ nectar_myl ] of Foodsource currentFoodsource > 0
      [ ; the forager will then be bringing nectar:
        let nectarRemoved min list  ; takes the smaller value of an ad hoc created list
                                    ; with two items: 1st: max. nectar a bee (cohort) can carry, 2nd: nectar left at patch.
          (cropvolume_myl * number)                              ; 1st item: max. nectar a bee (cohort) can carry
          ([ nectar_myl ] of Foodsource currentFoodsource)      ; 2nd item: max. pollen bee (cohort) can carry

        set nectarLoadSquadron_kJ nectarRemoved * EnergySucrose_kJ/mymol * [ nectarConcentration_mol/l ] of Foodsource currentFoodsource
          ; set the nectar energy load with the amount removed

        set activity "bringingNectar"
        set activityList lput "N" activityList
        ; amount of nectar at the patch is reduced:
        let memoNumber number
        ask foodsource currentFoodsource
         [
           set nectar_myl nectar_myl - NectarRemoved
           set cumulNectarVisits cumulNectarVisits + memoNumber  ; all nectar visits at patch, ever
         ]
      ]
      [
        ; if NECTAR foodsource is EMPTY:
        set activity "returningEmpty"
        set activityList lput "En" activityList  ; "Empty nectar"
      ]
   ]
end

; ********************************************************************************************************************************************************************************



; ********************************************************************************************************************************************************************************



; *******************************************************************************

to-report ProboscisLengthREP
  let minWeight_mg [ devWeightPupationMin_mg ] of oneSpecies speciesID
  let maxWeight_mg [ devWeight_Q_PupationMax_mg ] of oneSpecies speciesID
  let minLength_mm [ proboscis_min_mm ] of oneSpecies speciesID
  let maxLength_mm [ proboscis_max_mm ] of oneSpecies speciesID
  let slope (maxLength_mm - minLength_mm) / (maxWeight_mg - minWeight_mg)
  let proboscisLength_mm minLength_mm + (weight_mg - minWeight_mg) * slope
  if weight_mg < minWeight_mg or weight_mg > maxWeight_mg [ AssertionProc ("Wrong bee weight in ProboscisLengthREP Min") ]
  report proboscisLength_mm
end

; *******************************************************************************

to-report HandlingTime_s_REP [ myPatch pollenPatch? ]; called by bee
; calculates the time [s] to gather of full load of nectar or pollen
; for nectar: based on Harder 1983: Oecologia 57:274-280

 let maxHandlingTime_s 60 * 60 ; approx. max. from Ings et al. 2006, Fig. 1; Journal of Applied Ecology, 43,940–948; also comparable to data from Fig. 6 in Stelzer et al 2010, PloS One, 5(3), e9559
 let handlingTime_s -999
 let fillingLevel 0 ; minFillingLevel  ; amount of food (nectar or pollen) currently at the patch relative to its max. value for today, calculated below

 ifelse pollenPatch? = false
 ; NECTAR FORAGING:
 [
  ask foodsource myPatch
   [
     if nectarMax_myl > 0
      [ set fillingLevel  nectar_myl / nectarMax_myl ]
   ]

  ; Harder 1983, Fig. 4:
  let W_beeWeight_g weight_mg / 1000
  let G_lengthGlossa_mm glossaLength_mm ; mm
  let C_CorollaDepth_mm [ corollaDepth_mm ] of Foodsource myPatch
  let V_nectarVolume_myl [ nectarFlowerVolume_myl ] of Foodsource myPatch
  let Ta_accessTime_s 0.3 + 0.04 * C_CorollaDepth_mm ; time to access a flower
  let numerator log (V_nectarVolume_myl + 1) 10
  let num 0.3 * W_beeWeight_g ^ 0.3333 * G_lengthGlossa_mm
  let base (1.41 - C_CorollaDepth_mm / G_lengthGlossa_mm)
  if base < 0.001 [ set base 0.001 ]   ; as 0 ^ -0.4 is not valid (in calculation of local variable den, see below)
  let den (base ^ -0.4) - 0.3 * Ta_accessTime_s
  let denominator log (num / den + 1) 10
  let Ti_ingestionTime_s numerator / denominator

  let handlingTimePerFlower_s maxHandlingTime_s  ; handling time set to maximal value..
  if fillingLevel > 0  ; avoid division by 0     ; .. unless there is nectar available, then it is recalculated
                                                 ; (if the new value is lager than maxHandlingTime_s, it will be set back to maxHandlingTime_s at the end of this procedure)
  [
    set handlingTimePerFlower_s (
                                 (
                                   [ interFlowerTime_s ] of Foodsource myPatch     ; the time to travel to the next flower
                                   + Ta_accessTime_s                               ; + the time to test whether it contains nectar
                                  )
                                 / fillingLevel                ; divided by the filling level to account for depletion of the patch
                                )
                                + Ti_ingestionTime_s                               ; + time to actually load the nectar, once a filled flower is found
  ]
  let flowersVisited 1  ; at least one flower has to be visited..
  if V_nectarVolume_myl < cropvolume_myl [ set flowersVisited (cropvolume_myl / V_nectarVolume_myl) ]   ; but ususally more than one flower is needed
  set handlingTime_s handlingTimePerFlower_s * flowersVisited   ; the time to find a flower and empty it is then multiplied by the number of flowers, needed to fill the crop

 ] ; end if nectar forager

 ; POLLEN FORAGING:
 [

  let timeInFlowers_s 257.4  ; time  bee spents in flower(s) to collect 1 pollen load, derived (for poppy flowers) from Raine & Chittka 2007, Tab. 1, "Number of flowers visited" times "Mean flower handling time/ s" (mean of all three bouts)
  let flowersNeededForPollenLoad 58  ; Raine & Chittka 2007, Tab. 1 "Number of flowers visited" (mean of all 3 bouts)
  ask foodsource myPatch    ; get the filling level for this foodsource:
   [
     ifelse pollenMax_g > 0
      [ set fillingLevel  pollen_g / pollenMax_g ]
      [ set fillingLevel  0 ] ; (this should actually never be the case)
   ]

  ifelse fillingLevel > 0
  [
    set handlingTime_s [ interFlowerTime_s ] of Foodsource myPatch     ; the time to travel to the next flower
                           * flowersNeededForPollenLoad                ; times the number of flowers needed to be visited
                           / fillingLevel                ; divided by the filling level to account for depletion of the patch
                        + timeInFlowers_s                               ; + time to actually collect the pollen, once a flower with pollen is found
  ]
  [ set handlingTime_s  maxHandlingTime_s ]
 ] ; end: if pollen forager
 if handlingTime_s > maxHandlingTime_s [ set handlingTime_s maxHandlingTime_s ]
 report handlingTime_s
end


; *******************************************************************************


to-report Foraging_bestLayerREP [ myCurrentFoodsource ]
; reports most profitable foodsource ("layer") within the currently used flower patch, based on minimal handling time

 let memoBestHandlingtime notSetHigh
 let memoBestEEF notSetLow
 let memoBestPatch -1
 let myBeeID who
 let distanceColonyFoodpatch_m 0  ;; distance (same for all layers!) will be set now:
 ask colony colonyID
  [
    set distanceColonyFoodpatch_m ; distance between the colony and the food patch
        distance (Foodsource myCurrentFoodsource) ; the distance in NetLogo patches
        / SCALING_NLpatches/m  ; div. by scling => distance in m
  ]

 foreach [ layersInPatchList ]  of foodsource myCurrentFoodsource  ; for each foodsource of the bees 'layergroup', the handling time is calculated
  [ ?1 ->
     let currentLayer ?1
     if pollenforager? = true and [ pollen_g ]  of foodsource currentLayer > 0  ; only patches that actually provide pollen are considered
     [
       ask bee myBeeID
       [
         ; handling time is determined:
         let handlingTime_s HandlingTime_s_REP currentLayer pollenforager?
         if handlingTime_s < memoBestHandlingtime  ; and if it is the shortest so far..
         [
           set memoBestPatch currentLayer    ; the ID of this foodsource..
           set memoBestHandlingtime handlingTime_s   ; and the handling time are saved
         ]
      ]
     ]

     if pollenforager? = false and [ nectar_myl ] of foodsource currentLayer > 0  ; only patches that actually provide nectar are considered
     [
      ask bee myBeeID
      [
        ; handling time is determined:
        let handlingTime_s HandlingTime_s_REP currentLayer pollenforager?


        if number = 0
        [set number 1]

        let energyCostsThisLayer_kJ  ; energy needed to exploit this layer:
           (

             2 * distanceColonyFoodpatch_m + 0.001 ; bees fly to and return from food patch
                ; plus distances they fly within the patch, but reduced by rests on flowers:
             + handlingTime_s
                * [ flightVelocity_m/s ] of OneSpecies speciesID  ; [s] * [m/s] = [m]
                * (EnergyFactorOnFlower + 0.001) + 0.001
            )
            * [ flightCosts_kJ/m/mg ] of OneSpecies speciesID * weight_mg   ; flight costs (kJ) per m, dependent on the bees' weight
            * number  ; [m] * [kJ/m/mg] * [mg] => [kJ]

        ; energy gained when exploiting this layer:
        let energyGainThisLayer_kJ cropvolume_myl
                                * EnergySucrose_kJ/mymol ; [ul] * [kJ/umol] => [kJ/mol * l]
                                * [ nectarConcentration_mol/l ] of Foodsource currentLayer ; [kJ/mol * l] * [mol/l] => [kJ]
        ; energetic efficiency of exploiting this layer:
        let eef (energyGainThisLayer_kJ - energyCostsThisLayer_kJ) / energyCostsThisLayer_kJ

        if eef > memoBestEEF    ; if it is the energetically best so far...
        [
          set memoBestPatch currentLayer            ; the ID of this foodsource..
          set memoBestEEF eef                       ; and the energetic efficiency are saved
        ]
      ]
     ]
   ]
 report memoBestPatch ; this might be negative, if no foodsource was found!
end

; *******************************************************************************

to Foraging_PatchChoiceProc [ currentTripDuration_s ]
; determines if bees are still happy with their current food source (based on the duration of the trip). If not, they will either switch to the best layer/flowerspecies at the
; current patch or - if they already forage at the best layer/flowerspecies, they will switch to another patch/'layergroup' they know or search for a new one
; (note: expectation_Nectar/PollenTrip_s is 0 for a novice forager, hence they are likely to search new patches until they get more experienced)
; Ref: Wiegmann et al 2003, Physiology & Behavior 79 (2003) 561– 566

 let preferenceClosePatchesProb 0.9 ; heuristically determined to result in highest numbers of hibernating queens
 let happy? true ; defines whether or not a bee is still happy with her current food source
 let gotoNewLayergroup? false ; whether or not the bee is going to exploit a different flower patch
 let bestLayer -1 ; ID (who) of best food source in the current flower patch. As long as the bee is happy, it doesn't matter which foodsource is the best layer
 let myExpectation_s expectation_NectarTrip_s ; expectation of a bee about the duration of the trip
 let myKnownMasterpatchesList knownMasterpatchesNectarList
 let searchProbBase 0.1

 if pollenforager? = true ; some changes if a bee is a pollen forager and not a nectar forager
  [
    set myExpectation_s expectation_PollenTrip_s
    set myKnownMasterpatchesList knownMasterpatchesPollenList
  ]
 let myMasterpatchID -1
 let myCurrentPatchPosition -1

; the longer a trip takes in comparison to a bees' expectation, the higher is the probability to become unhappy. Expectations are then recalculated as the mean of the duration of current trip and the previous expectation
 ifelse activity = "returningEmpty"
   [ set gotoNewLayergroup? true] ;     unsuccessful bees always search for a new flower patch/'layergroup'
   [
     set myMasterpatchID [ masterpatchID ] of foodsource currentFoodsource
     if position myMasterpatchID myKnownMasterpatchesList = false [ AssertionProc ("No number for myMasterpatchID (Foraging_PatchChoiceProc) Possible reason: 2 flower patches (masterpatches, not just layers) at same location?") ]
     ; the "position" (in the list) of the currently used 'layergroup' in the myKnownMasterpatchesList:
     set myCurrentPatchPosition position myMasterpatchID myKnownMasterpatchesList ; NeLogo command "position": "On a list, reports the first position of item in list, or false if it does not appear."
     if myCurrentPatchPosition  = false [ set myCurrentPatchPosition -1 ] ; to avoid an error if myMasterpatchID is not part of the myKnownMasterpatchesList

     ; determine whether or not a bee becomes unhappy with her current foodsource:
     let unhappyProb (currentTripDuration_s - myExpectation_s) / currentTripDuration_s
       ;  bee compares her expectations on trip duration with the acutal duration
     if unhappyProb < 0 [ set unhappyProb 0 ] ; no negative probability
     ; the probability to search a new patch then depends on searchProbBase
     ; and her degree of unhappiness:
     if random-float 1 < (searchProbBase + unhappyProb) [ set happy? false ]
     let newExpectation (myExpectation_s + currentTripDuration_s) / 2 ; new expectation take duration of current and previous trips into account
     ; new expectation take duration of current and previous trips into account
     ifelse pollenforager? = true
      [ set expectation_PollenTrip_s newExpectation ]   ; as expectations for pollen trips
      [ set expectation_NectarTrip_s newExpectation ]   ; .. or for nectar trips
   ]

 if happy? = false
    [
      set activityList lput ":(" activityList   ; unhappy smiley added to activityList
      ifelse pollenforager? = true                         ; splitting returningUnhappy into two types
        [ set activity "returningUnhappyP" ]
        [ set activity "returningUnhappyN" ]
      set bestLayer Foraging_bestLayerREP currentFoodsource
      ifelse bestLayer = currentFoodsource
        [ set gotoNewLayergroup? true ] ; if bee is already foraging from the best layer, it will search for a completely now patch/'layergroup'
        [ set currentFoodsource bestLayer ]    ; .. otherwise it will stay at the current patch but switch to the best foodsource/flowerspecies here
    ]

 if gotoNewLayergroup? = true
   [
     set activityList lput "..." activityList
     let newPatchPosition -999
     ifelse random-float 1 < preferenceClosePatchesProb  ; the new patch has a similar distance to the colony as the old patch, but patches closer to the colony are preferred
       [ set newPatchPosition random (myCurrentPatchPosition + 1) - 1 ]  ; a random position < current position, includ. 0 and -1 (-1 results in search of a new 'layergroup'. Prob. decreases, the more patches are known)
       [ set newPatchPosition myCurrentPatchPosition + 1 ]
     ifelse newPatchPosition < 0 or newPatchPosition >= length myKnownMasterpatchesList
       [
         set currentFoodsource -1    ; bees will search for a completely new foodsource/'layergroup'
       ]
       [ set currentFoodsource Foraging_bestLayerREP item newPatchPosition myKnownMasterpatchesList ] ; bee goes to a patch ('layergroup') it already knows and chooses the best foodsource (layer) there
   ]
  ifelse pollenforager? = true
    [ set pollensourceToGoTo currentFoodsource ] ; the (new) current foodsource will be used for the next pollen foraging trip
    [ set nectarsourceToGoTo currentFoodsource ] ; the (new) current foodsource will be used for the next nectar foraging trip
end


; *******************************************************************************

to Foraging_costs&choiceProc ; costs in time, energy and mortality
; first bees with activity = "returningEmpty" and then bees with  activity = "bringingNectar" or activity = "bringingPollen" are addressed to calculate time and energy spent on the trip;
; finally Foraging_PatchChoiceProc is called, as the future patch/flowerspecies choice is based on the time spent on the trip.

 let persTimeSave personalTime_s ; the current time
 let saveNumber number           ; number of individuals, this cohort/forager agent represents
 let saveWeight_mg weight_mg     ; save variable for weight of individual/s
 let saveFlightCosts_kJ/m/mg  [ flightCosts_kJ/m/mg ] of OneSpecies speciesID   ;FlightCosts set as the same for all foragers

 ; Test for errors
 if not member? caste ["worker" "queen"] [ AssertionProc (word stage " " caste " " who " shouldn't be foraging (Foraging_costs&timeProc)")]
 if saveFlightCosts_kJ/m/mg < 0 [ AssertionProc "saveFlightCosts local variable not set (Foraging_costs&timeProc)"]

; EMPTY BEES:
 if activity = "returningEmpty"
  [
    ; nectar store in the colony is reduced to reflect the energy consumed during the trip:
    let tripDuration_s 0


    ; a Bee dies during the foraging trip, unless she survives every single second:
    let survivalChance (1 - MortalityForager_per_s * ForagingMortalityFactor) ; probability to survive a single second of the foraging trip
                        ^ tripDuration_s        ; ... to survive EACH second of the trip
    let mortalityRisk 1 - survivalChance   ; risk to die = 1 - probability to survive
    ;VV SUBSTANTIAL CHANGES
    ask Colony colonyID
    [
      set tripDuration_s [ searchLength_m ] of OneSpecies speciesIDcolony / [ flightVelocity_m/s ] of OneSpecies speciesIDcolony

    ]
     set personalTime_s personalTime_s + tripDuration_s  ; some time has passed..


    ifelse random-float 1 < mortalityRisk [ DieProc "foraging: empty" ]   ; does bee die?
    [
      ask Colony colonyID
      [
        ;vv bfg
        set energyStore_kJ energyStore_kJ - ( [ searchLength_m ] of OneSpecies speciesIDcolony * saveFlightCosts_kJ/m/mg * saveNumber * saveWeight_mg )
        ;output-print word "returningEmpty " word  energyStore_kJ word "  " ( [ searchLength_m ] of OneSpecies speciesIDcolony * saveFlightCosts_kJ/m/mg * saveNumber * saveWeight_mg )
      ]
    ]

  ]

; SUCCESSFUL FORAGERS:
 ; energy consumption of successful foragers:
 let handlingTime_s 0
 if activity = "bringingNectar" or activity = "bringingPollen"
  [
    if activity = "bringingNectar"
      [
        set handlingTime_s HandlingTime_s_REP currentFoodsource pollenForager?
        set activity "expForagingN"
        set activityList lput "Xn" activityList
      ]
    if activity = "bringingPollen"
      [
        set handlingTime_s HandlingTime_s_REP currentFoodsource pollenForager?
        set activity "expForagingP"
        set activityList lput "Xp" activityList
      ]
    let memoPatch currentFoodsource
    let tripDuration_s 0





    ask Colony colonyID
    [
      set energyStore_kJ energyStore_kJ -
           (
             2 * distance (Foodsource memoPatch) / SCALING_NLpatches/m ; bees have to fly to the patch and back, distance [NLpatches] / Scaling = [m]
                ; plus distances they fly within the patch, but reduced by rests on flowers
             + handlingTime_s
               * [ flightVelocity_m/s ] of OneSpecies speciesIDcolony * EnergyFactorOnFlower    ; [kJ] = [m * kJ/m + kJ/m * s * m/s]
            )
            * saveFlightCosts_kJ/m/mg * saveWeight_mg  ; flight costs (kJ) per m, dependent on the bees' weight
            * saveNumber                               ; multiplied by number of bees in the cohort
       set tripDuration_s (2 * distance (Foodsource memoPatch) / SCALING_NLpatches/m  / [ flightVelocity_m/s ] of OneSpecies speciesIDcolony) + handlingTime_s
       if energyStore_kJ < 0
      [
        output-print word "See debug AA " word energyStore_kJ word " " ( (
             2 * distance (Foodsource memoPatch) / SCALING_NLpatches/m ; bees have to fly to the patch and back, distance [NLpatches] / Scaling = [m]
                ; plus distances they fly within the patch, but reduced by rests on flowers
             + handlingTime_s
               * [ flightVelocity_m/s ] of OneSpecies speciesIDcolony * EnergyFactorOnFlower    ; [kJ] = [m * kJ/m + kJ/m * s * m/s]
            )
            * saveFlightCosts_kJ/m/mg * saveWeight_mg  ; flight costs (kJ) per m, dependent on the bees' weight
            * saveNumber   )                            ; multiplied by number of bees in the cohort
      ]

    ]






    set personalTime_s personalTime_s + tripDuration_s    ; some time has passed..
    let survivalChance (1 - MortalityForager_per_s * ForagingMortalityFactor) ; probability to survive a single second of the foraging trip
                                                      ; ForagingMortalityFactor (set on GUI): allows to easliy modify foraging mortality
                        ^ tripDuration_s        ; ... to survive EACH second of the trip
    let mortalityRisk 1 - survivalChance   ; risk to die = 1 - probability to survive
    if random-float 1 < mortalityRisk [  DieProc "foraging: N or P forager" ]
    set activityList lput (word "HT:" precision handlingTime_s 1) activityList
  ]

  if personalTime_s - persTimeSave <= 0 [ AssertionProc "No time - or negative time - passed for this bee! (Foraging_costs&timeProc)" ]
  Foraging_PatchChoiceProc personalTime_s - persTimeSave ; the bee makes a choice about where to forage next, based on the trip duration
end

; *******************************************************************************

to Foraging_unloadingProc
  ; successful foragers (irrespective whether they are happy or not) unload their nectar or pollen load
  ifelse activity = "expForagingN" or activity = "expForagingP" or activity = "returningUnhappyN" or activity = "returningUnhappyP"
  [
    let nectarIncrease nectarLoadSquadron_kJ
    let pollenIncrease pollenLoadSquadron_g

    ask Colony colonyID    ; load is added to the colony's stores:
    [
     set energyStore_kJ energyStore_kJ + nectarIncrease
     set pollenStore_g pollenStore_g + pollenIncrease
    ]
    ifelse activity = "expForagingN" or activity = "returningUnhappyN"
      [  set activityList lput (word "N+:" precision nectarIncrease 2) activityList ]
      [  set activityList lput (word "P+:" precision pollenIncrease 4) activityList ]
    set nectarLoadSquadron_kJ 0
    set pollenLoadSquadron_g 0
    set personalTime_s personalTime_s + [ timeUnloading ] of OneSpecies speciesID
  ]
  [ ; make sure bees with other activities don't carry nectar or pollen:
    if nectarLoadSquadron_kJ + pollenLoadSquadron_g > 0
      [ AssertionProc "Bee did not unload nectar or pollen in Foraging_unloadingProc!" ]
  ]

end

; *******************************************************************************

to OutputDailyProc
 with-local-randomness    ; allows changing/switching off plots without changing the sequence of random numbers
 [
  random-seed ticks       ; local random seed, only valid within this procedure
  set TotalIBMColonies       count colonies with [ cohortBased? = false ]
  set TotalQueens            sum [ number ] of bees with [ caste = "queen" ]
  set TotalMatedQueens       sum [ number ] of bees with [ caste = "queen" and mated? = true ]
  set TotalUnmatedQueens     sum [ number ] of bees with [ caste = "queen" and mated? = false ]
  set TotalHibernatingQueens sum [ number ] of bees with [ activity = "hibernate"]
  set TotalColonies          count colonies
  set TotalBeeAgents         count bees
  set TotalMales             sum [ number ] of bees with [ caste = "male" ]
  set TotalActiveBees        length ActiveBeesSortedList
  ifelse count bees with [brood? = false and caste = "worker"] > 0
    [ set MeanWorkerWeight_mg   mean [ weight_mg ] of bees with [brood? = false and caste = "worker"] ]
    [ set MeanWorkerWeight_mg   0 ]
  ifelse count bees with [brood? = false and caste = "queen"] > 0
    [ set MeanQueenWeight_mg   mean [ weight_mg ] of bees with [brood? = false and caste = "queen"] ]
    [ set MeanQueenWeight_mg   0 ]
  ifelse count bees with [brood? = false] > 0
    [ set MeanAdultWeight_mg   mean [ weight_mg ] of bees with [brood? = false] ]
    [ set MeanAdultWeight_mg   0 ]
  set ColonyDensity_km2      TotalColonies / TotalMapArea_km2

  if ShowPlots?  = true
  [
    PlottingProc "plot 1" GenericPlot1  ; PlottingProc is called repeatedly..
    PlottingProc "plot 2" GenericPlot2
    PlottingProc "plot 3" GenericPlot3
    PlottingProc "plot 4" GenericPlot4
    PlottingProc "plot 5" GenericPlot5
  ]


  if ShowWeather? = true
  [
    ask Signs with [ shape = "sun"]
    [
      ifelse DailyForagingPeriod_s > 0
        [ show-turtle set label precision (DailyForagingPeriod_s / 3600) 1 ]
        [ hide-turtle set label " " ]
    ]   ; "sun" sign is shown, whenever there is an opportunity to forage

    ask Signs with [ shape = "cloud"]
    [
      ifelse DailyForagingPeriod_s < (4 * 3600)
        [ show-turtle ]
        [ hide-turtle ]
    ]   ; "cloud" sign is shown, whenever there is less than 4 hrs of foraging possible
  ]
 ]
end

; *******************************************************************************

to PlottingProc [ plotname plotChoice ]

  set-current-plot plotname
  if plotChoice = "Foodsources sizes (histogram)"
    [
      set-plot-x-range 0 10
      create-temporary-plot-pen "N  "
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-color black
      set-plot-pen-interval 1
      histogram [ size ] of Foodsources
    ]

  if plotChoice = "Matrilines (histogram)" ; NOTE: this plot does NOT correct for "number" (cohort size), hence IBM colonies will be overrepresented!
    [
      set-plot-x-range 0 140
      create-temporary-plot-pen "mtGene"
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-color black
      set-plot-pen-interval 0.1
      histogram [ mtDNA ] of bees with [ caste = "queen" ]
    ]

  if plotChoice = "Genepool (histogram)" ; NOTE: this plot does NOT correct for "number" (cohort size), hence IBM colonies will be overrepresented!
    [
      let genepool []
      ask bees with [ caste = "queen" ]
       [
         foreach allelesList
           [ ?1 -> set genepool fput ?1 genepool ]
         foreach spermathecaList
           [ ?1 -> set genepool fput ?1 genepool ]
       ]
      set-plot-x-range 0 140
      create-temporary-plot-pen "alleles"
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-color black
      set-plot-pen-interval 0.1
      histogram genepool ;
    ]

  if plotChoice = "Colony sizes (histogram)" and count Colonies > 0 ; NOTE: this plot does NOT correct for "number" (cohort size), hence IBM colonies will be overrepresented!
    [
      if (max [colonysize] of Colonies > 0)
      [
        set-plot-x-range 0 10
        set-plot-x-range  0 max [colonysize] of Colonies
        create-temporary-plot-pen "N  "
        set-plot-pen-mode 1 ; 1: bars
        set-plot-pen-color black
        set-plot-pen-interval 20
        histogram [ colonysize ] of Colonies
      ]
    ]

   if plotChoice = "Bee weights [mg] (histogram)"  ; NOTE: this plot does NOT correct for "number" (cohort size), hence IBM colonies will be overrepresented!
    [
      create-temporary-plot-pen "queens"
      set-plot-pen-color red
      set-plot-x-range  0 1500
      set-plot-y-range  0 40
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-interval 50
      histogram [ weight_mg ] of bees with [brood? = false and caste = "queen"]

      create-temporary-plot-pen "workers"
      set-plot-pen-color black
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-interval 50
      histogram [ weight_mg ] of bees with [brood? = false and caste = "worker"]

      create-temporary-plot-pen "males"
      set-plot-pen-color green
      set-plot-pen-mode 1 ; 1: bars
      set-plot-pen-interval 50
      histogram [ weight_mg ] of bees with [brood? = false and caste = "male"]
    ]

  if plotChoice = "N colonies"
   [
     set-plot-x-range 0 10
     create-temporary-plot-pen "Cols"
     plotxy ticks count Colonies
   ]

  if plotChoice = "Species N colonies"
    [
      set-plot-x-range 0 10

      create-temporary-plot-pen "B_terrestris"
      set-plot-pen-color yellow
      plotxy ticks count colonies with [shape = "b_terrestris"]

      create-temporary-plot-pen "B_lapidarius"
      set-plot-pen-color black
      plotxy ticks count colonies with [shape = "b_lapidarius"]

      create-temporary-plot-pen "B_pascuorum"
      set-plot-pen-color brown
      plotxy ticks count colonies with [shape = "b_pascuorum"]

      create-temporary-plot-pen "B_hortorum"
      set-plot-pen-color green
      plotxy ticks count colonies with [shape = "b_hortorum"]

      create-temporary-plot-pen "B_pratorum"
      set-plot-pen-color orange
      plotxy ticks count colonies with [shape = "b_pratorum"]

      create-temporary-plot-pen "B_hypnorum"
      set-plot-pen-color blue
      plotxy ticks count colonies with [shape = "b_hypnorum"]

    ]


  if plotChoice = "Foraging period max. [hrs]"
    [
     set-plot-x-range 0 10
     create-temporary-plot-pen "max. foraging"
     plotxy ticks DailyForagingPeriod_s / 3600
    ]

  if plotChoice = "Foraging trips daily"
  [
   ; set-plot-x-range 0 10
    create-temporary-plot-pen "N trips total"
    plotxy ticks TotalForagingTripsToday
  ]

  if plotChoice = "Food available"
    [
    ; set-plot-x-range 0 10
     create-temporary-plot-pen "Nectar_l"
       set-plot-pen-color yellow
       plotxy ticks NectarAvailableTotal_l
     create-temporary-plot-pen "Pollen_kg"
       set-plot-pen-color red
       plotxy ticks PollenAvailableTotal_kg
    ]

  if plotChoice = "Total adults"
  [
    set-plot-x-range 0 10
    create-temporary-plot-pen "Adults"
    plotxy ticks TotalAdults
    ;plotxy ticks ( round ( TotalAdults / 3 ) + round (4000 / ( ( TotalAdults / 1000) + 1 ) ) )
  ]

  if plotChoice = "Species total adults"
    [
     set-plot-x-range 0 10
     create-temporary-plot-pen "B_terrestris"
       set-plot-pen-color yellow
       plotxy ticks sum [ number ] of bees with [ speciesName = "B_terrestris" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "B_lapidarius"
       set-plot-pen-color black
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_lapidarius" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "B_pascuorum"
       set-plot-pen-color brown
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pascuorum" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "B_hortorum"
       set-plot-pen-color green
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_hortorum" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "B_pratorum"
       set-plot-pen-color orange
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pratorum" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "B_hypnorum"
       set-plot-pen-color blue
       plotxy ticks count bees with [ speciesName = "B_hypnorum" and brood? = false and colonyID > 0 ]

     create-temporary-plot-pen "Psithyrus"
       set-plot-pen-color red
       plotxy ticks sum [ number ] of  bees with [ speciesName = "Psithyrus" and brood? = false and colonyID > 0 ]
    ]

  if plotChoice = "Species total adult queens"
    [
     set-plot-x-range 0 10
     create-temporary-plot-pen "B_terrestris"
       set-plot-pen-color yellow
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_terrestris" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "B_lapidarius"
       set-plot-pen-color black
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_lapidarius" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "B_pascuorum"
       set-plot-pen-color brown
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pascuorum" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "B_hortorum"
       set-plot-pen-color green
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_hortorum" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "B_pratorum"
       set-plot-pen-color orange
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pratorum" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "B_hypnorum"
       set-plot-pen-color blue
       plotxy ticks sum [ number ] of  bees with [ speciesName = "B_hypnorum" and brood? = false and caste = "queen" ]

     create-temporary-plot-pen "Psithyrus"
       set-plot-pen-color red
       plotxy ticks sum [ number ] of  bees with [ speciesName = "Psithyrus" and brood? = false and caste = "queen" ]
    ]


  if plotChoice = "Species hibernating queens"
  [
    set-plot-x-range 0 10

    create-temporary-plot-pen "B_terrestris"
    set-plot-pen-color yellow
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_terrestris" and brood? = false and caste = "queen" and activity = "hibernate" ]

    create-temporary-plot-pen "B_lapidarius"
    set-plot-pen-color black
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_lapidarius" and brood? = false and caste = "queen"  and activity = "hibernate"  ]

    create-temporary-plot-pen "B_pascuorum"
    set-plot-pen-color brown
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pascuorum" and brood? = false and caste = "queen"  and activity = "hibernate"  ]

    create-temporary-plot-pen "B_hortorum"
    set-plot-pen-color green
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_hortorum" and brood? = false and caste = "queen"  and activity = "hibernate"  ]

    create-temporary-plot-pen "B_pratorum"
    set-plot-pen-color orange
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_pratorum" and brood? = false and caste = "queen"  and activity = "hibernate"  ]

    create-temporary-plot-pen "B_hypnorum"
    set-plot-pen-color blue
    plotxy ticks sum [ number ] of  bees with [ speciesName = "B_hypnorum" and brood? = false and caste = "queen"  and activity = "hibernate"  ]

    create-temporary-plot-pen "Psithyrus"
    set-plot-pen-color red
    plotxy ticks sum [ number ] of  bees with [ speciesName = "Psithyrus" and brood? = false and caste = "queen"  and activity = "hibernate"  ]
  ]

  if plotChoice = "Hibernating queens"
  [
    set-plot-x-range 0 10
    create-temporary-plot-pen  "N  "
    plotxy ticks sum [ number ] of bees with [ activity = "hibernate"]
  ]

  if plotChoice = "Egg laying"
    [
     set-plot-x-range 0 10
     create-temporary-plot-pen "period"
     ifelse ShowInspectedColony? = true
          [

            ifelse count colonies with [ who = InspectTurtle ] = 1
              [ plotxy ticks [allEggs] of Colony InspectTurtle]
              [ clear-plot ]
           ]
          [ plotxy ticks (TotalEggs) ]
    ]

  if plotChoice = "Stores: honey [ml] & pollen [g]"  ; and count Colonies > 0
    [


     set-plot-x-range 0 10
     create-temporary-plot-pen "honey"
     set-plot-pen-color black

     ifelse count Colonies = 0
       [ plotxy ticks 0 ]
       [
         ifelse ShowInspectedColony? = true
         [
           ifelse count colonies with [ who = InspectTurtle ] = 1
             [ plotxy ticks [energyStore_kJ] of Colony InspectTurtle / ( EnergyHoney_kJ/ml * 1000 ) ]
             [ clear-plot ]
         ]
         [ plotxy ticks (mean [ energyStore_kJ ] of Colonies) / ( EnergyHoney_kJ/ml * 1000 ) ]

       ]
     create-temporary-plot-pen "pollen x 20"
     set-plot-pen-color orange
     ifelse count Colonies = 0
       [ plotxy ticks 0 ]
       [
         ifelse ShowInspectedColony? = true
         [
           ifelse count colonies with [ who = InspectTurtle ] = 1
            [ plotxy ticks ( [pollenStore_g] of Colony InspectTurtle ) * 20 / 1000 ]
            [ clear-plot ]
         ]
         [ plotxy ticks (mean [ pollenStore_g ] of Colonies) * 20 / 1000 ]
       ]
    ]

  if plotChoice = "Colony structures"
  [
   ifelse ShowInspectedColony? = true
   [
     ifelse count colonies with [ who = InspectTurtle ] = 1
     [
        set-plot-x-range 0 10
        create-temporary-plot-pen "Eggs"
          set-plot-pen-color blue
          plotxy ticks [allEggs] of Colony InspectTurtle
        create-temporary-plot-pen "Larvae"
          set-plot-pen-color yellow
          plotxy ticks [allLarvae] of Colony InspectTurtle
        create-temporary-plot-pen "Pupae"
          set-plot-pen-color brown
          plotxy ticks [allPupae] of Colony InspectTurtle
        create-temporary-plot-pen "Brood"
          set-plot-pen-color blue
          plotxy ticks [allPupae + allLarvae + allEggs] of Colony InspectTurtle
        create-temporary-plot-pen "Workers"
          set-plot-pen-color black
          plotxy ticks [allAdultWorkers] of Colony InspectTurtle
        create-temporary-plot-pen "Foragers"
          set-plot-pen-color magenta
          plotxy ticks [allForagers] of Colony InspectTurtle ;vv add
        create-temporary-plot-pen "Males"
          set-plot-pen-color green
          plotxy ticks [allAdultMales] of Colony InspectTurtle
        create-temporary-plot-pen "Queens"
          set-plot-pen-color red
          plotxy ticks [allAdultQueens] of Colony InspectTurtle
     ]
     [ clear-plot ]  ; plot is cleared after the previous 'inspected colony' has died
  ]

   [  ; if  ShowInspectedColony? = FALSE:
     set-plot-x-range 0 10
        create-temporary-plot-pen "Eggs"
          set-plot-pen-color blue
          plotxy ticks TotalEggs
        create-temporary-plot-pen "Larvae"
          set-plot-pen-color yellow
          plotxy ticks TotalLarvae
        create-temporary-plot-pen "Pupae"
          set-plot-pen-color brown
          plotxy ticks TotalPupae
        create-temporary-plot-pen "Workers"
          set-plot-pen-color orange
          plotxy ticks TotalAdultWorkers
        create-temporary-plot-pen "Males"
          set-plot-pen-color green
          plotxy ticks TotalAdultMales
        create-temporary-plot-pen "Queens"
          set-plot-pen-color black
          plotxy ticks TotalAdultQueens
     ]
    ]

  if plotChoice = "Switchpoints"
  [
    set-plot-x-range 0 50
    create-temporary-plot-pen "SP"
    set-plot-pen-color black
    set-plot-pen-mode  1
    histogram [ switchPointDate - eusocialPhaseDate ] of Colonies with [ eusocialPhaseDate + switchPointDate < NotSetHigh ]
  ]

  if plotChoice = "Sex ratio"
  [
    set-plot-y-range 0 1
    create-temporary-plot-pen "M:F"
    set-plot-pen-color black
    set-plot-pen-mode  0

    if TotalAdultQueens > 0
    [
      plot TotalAdultMales / TotalAdultQueens
    ]
  ]

  if plotChoice = "Total mites" and count Colonies > 0
  [
    if (max [TotalMites] of Colonies > 0)
      [
        set-plot-x-range 0 10
        create-temporary-plot-pen  "N  "
        plotxy ticks sum [ TotalMites ] of Colonies
      ]
  ]

end

; ********************************************************************************************************************************************************************************

to-report DateREP
  let month-names (list "January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
  let days-in-months (list 31 28 31 30 31 30 31 31 30 31 30 31)
  let year floor (ticks / 365.01) + 1
  if ticks = 0 [ set year 0 ]
  let month 0
  let dayOfYear remainder ticks 365
  if dayOfYear = 0 [ set dayOfYear 365 ]
  let dayOfMonth 0
  let sumDaysInMonths 0
  while [ sumDaysInMonths < dayOfYear ]
  [
    set month month + 1
    set sumDaysInMonths sumDaysInMonths + item (month - 1) days-in-months
    set dayOfMonth dayOfYear - sumDaysInMonths + item (month - 1) days-in-months
  ]
  let result ""
  if month > 0
    [ set result (word dayOfMonth "  " (item (month - 1) month-names) " " year )]
  report result
end

; *******************************************************************************

to-report Foraging_periodREP
  let foragingPeriod_s -1
  let foragingHoursList [ ]
  let foragingHoursExample [ 0  3.1  0  0  0  1.5  0  0.1  0  0  1.7  1.6  0  0  0  0  0  0  0  0  1.5  5  0  3.2  0  0  0  0.2  0  0  0  0.1  0.9  5.9  3.5  6.9  1.3  7.7  2.3  4.6  2.2  0 .5 9.2  0  8  3.2 4.1  0  9  9.1  7.3  5.7  4.9  0  12.1  6.5  7.9  7.9  11.1  2.8  0  2.8  6  5.7  0  4  10.1  2.9  10.1  0  11.4  6.3  9.9  4.4  7.5  8  12.3  8.7  10.3  3.7  11.3  13.2  14  4.2  7.7  8.2  7.2  9.2  5  13.1  10.5  3.5  11.1  13.6  6.2  8.4  7.8  8.5  9.8  6.5  4.1  10.8  12.5  15.1  10.1  4.3  7  9.4  8.9  7.5  7.8  6.6  11.4  12.1  12.4  11.9  10.1  14.7  7.8  13.1  3.3  16.6  14.8  17.9  5.7  0.2  2.9  10  14.7  16.2  15.8  5.3  5.8  2.5  6  15.2  1.3  13.1  11.2  2  12.9  9.7  2.1  17.3  5.7  8.5  13.1  18.5  1.7  6.7  13.8  0.5  0.8  15.7  4.9  11.4  11.9  3.8  11.7  7.1  21.2  17.7  1.8  12.3  15.7  16.9  16.8  9.9  3.6  20.4  13  5.1  0.6  11.7  2.1  4.7  13.9  13.8  1.4  0.3  18.4  14.8  12.8  3.7  13.5  4.7  0.3  5.5  4  17.5  1.7  0.3  14.9  12.4  11.6  8.5  4.5  11.1  16  13.2  13.8  0.7  7.1  14.3  3.4  2.2  5.6  10.6  3.4  15.5  15.6  12.8  15  14  5.9  15.5  9.1  2  1  3.2  9.3  3  3.1  14  10.2  1  9.7  8.8  3.8  1.9  11.9  9.3  6.5  6.6  8.4  4.3  7.2  1.5  11.4  10.4  13.5  1.2  6  4.4  13.5  12.4  8  9.3  5.9  0.9  6.8  5.9  9.1  10.5  6  7.9  2.3  0.8  0  7.9  11  1.3  8.7  6.5  6.6  7.6  0  0  9.4  7.1  6.4  4  6.6  0  2.7  0  0  7.8  0  8.7  0.3  2  4.8  1.8  0.9  0  0  7.2  5.8  6.5  0  1.1  0  0  0.7  6.3  1.3  0  5.5  1.4  2.8  0  0  0  4  0  1.4  5.1  0  0  2.1  0  0.5  0  1  0  0  2.3  0  0  0  1.4  0.6  0  0  0  0  0.8  0  0  1  0.9  0  0  0  0  0  0  2.3  0  0  1.9  1.4  0  0  0  1.5  0  0  0  1  1.9  0  0  3.4  0  0  1  0  0  0  0  0  0  1.6 ]
  let foragingHoursListRothamsted2011 [ 0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  5.4  1.7  0  0  0  0  0  0  0  0  0  0  0  0  3.2  0  4.9  0  0  3.9  0  0  0  0  0  3.1  1.1  10.1  10.5  10.2  3  7.5  6.5  4.6  0.2  4.8  3.3  3.9  6.1  6.2  0  11.5  10.2  12.5  12  11.1  8.5  10.2  0  0.2  5  3.6  6.6  6.7  11.3  8.5  7.8  12.6  12.7  10.1  12.8  4.6  10.9  6.8  5.3  12.9  12.2  13  13.2  13.6  6.6  11.8  3.2  6.8  10.8  11  2.1  8  7.2  8.7  5.1  3.6  2.6  1.3  9.8  8.6  12.3  9.4  4.5  11.9  13  3.8  4.1  2.9  4.2  1.5  10.8  9.7  9.8  13.5  10.7  2.6  0.9  9.1  8.5  4.5  6.6  9.4  2  6.6  11.8  3.6  5.2  1.3  6.7  9.8  7.1  7.1  5.2  7  7.3  6.7  12  8.9  1.6  11.1  8.2  8.5  8.3  4.8  4.6  8.7  6.7  4.4  3.3  5.6  4.2  8.3  1  2.1  8.1  9.5  3.2  3.1  1.1  3.6  1.4  1.3  8  6.6  12.7  9.2  1.7  2.3  6.9  2.2  11.3  8.7  7.5  6.9  8.7  0.3  3.5  1.8  4.9  7.5  10.1  7.1  2.5  2.8  2  6.4  7.2  3.5  4.1  0.1  9.6  5.4  6.6  8.8  0  4.2  3.2  1.2  5.6  4.4  4.6  0  1  6.2  8.4  5  2  5.8  0  1.2  1.5  1.5  2.3  5.2  6.9  7.5  8.6  7  4.9  5.9  6  6.6  0.2  2.6  5.3  8.4  6.4  6.9  2.7  6.3  9.5  9.7  9.8  9.2  9.7  6.3  4.1  1.3  7  3.3  0.8  2.3  4.7  1.6  2.3  0.1  8.3  9.3  4.5  2.3  8.2  6  0  3.3  9.1  6.4  4.8  2.8  5.8  0  8.3  4.1  0  0  4.1  3.5  0  1.4  0.5  0  0  0  1.1  1.2  0  0.7  5.9  0  0  0  2.2  3  0  0  0  0  0  2  0  2.8  5.6  0  0.3  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0.4  0  0  0  0  0 ]

  if Weather = "foragingHoursExample"
    [
      set foragingHoursList foragingHoursExample
      set foragingPeriod_s (item (day - 1) foragingHoursList) * 3600
    ]

    if Weather = "Rothamsted2011"
    [
      set foragingHoursList foragingHoursListRothamsted2011
      set foragingPeriod_s (item (day - 1) foragingHoursList) * 3600
    ]

  if Weather = "Constant 24 hrs" [ set foragingPeriod_s 24 * 3600 ]
  if Weather = "Constant 20 hrs" [ set foragingPeriod_s 20 * 3600 ]
  if Weather = "Constant 16 hrs" [ set foragingPeriod_s 16 * 3600 ]
  if Weather = "Constant 12 hrs" [ set foragingPeriod_s 12 * 3600 ]
  if Weather = "Constant 11 hrs" [ set foragingPeriod_s 11 * 3600 ]
  if Weather = "Constant 10 hrs" [ set foragingPeriod_s 10 * 3600 ]
  if Weather = "Constant 9 hrs" [ set foragingPeriod_s 9 * 3600 ]
  if Weather = "Constant 8 hrs" [ set foragingPeriod_s 8 * 3600 ]
  if Weather = "Constant 7 hrs" [ set foragingPeriod_s 7 * 3600 ]
  if Weather = "Constant 6 hrs" [ set foragingPeriod_s 6 * 3600 ]
  if Weather = "Constant 5 hrs" [ set foragingPeriod_s 5 * 3600 ]
  if Weather = "Constant 4 hrs" [ set foragingPeriod_s 4 * 3600 ]
  if Weather = "Constant 3 hrs" [ set foragingPeriod_s 3 * 3600 ]
  if Weather = "Constant 2 hrs" [ set foragingPeriod_s 2 * 3600 ]
  if Weather = "Constant 1 hrs" [ set foragingPeriod_s 1 * 3600 ]
  report foragingPeriod_s
end

; *******************************************************************************

to CreateSignsProc
  create-signs 1  ; Weather symbol: Sun
  [
    setxy max-pxcor - 6 max-pycor - 16
    set shape "sun"
    set size 11
    set color 44.2
    hide-turtle
  ]

  create-Signs 1  ; Weather symbol: Cloud
  [
    setxy max-pxcor - 10 max-pycor - 17
    set shape "cloud"
    set size 11
    set color grey - 2
    hide-turtle
  ]

  create-Signs 1  ;  Symbol for FIND-Button
  [
    set color red
    set shape "circletarget"
    set size 30
    hide-turtle
  ]
end


; **************************************************************************************
; ======   BUTTONS   ===   BUTTONS   ===   BUTTONS   ===   BUTTONS   ===   BUTTONS   ===
; **************************************************************************************


to ActivityListButton
type "day: " type day print " (species caste colony bee age activities) "

; foragers sorted by "colonyID" and then by "who"
foreach sort-on [ speciesID * 1000000000000000 + colonyID * 10000000 + who ]  bees with [ stage = "adult" and colonyID >=  0]
  [ ?1 -> ask ?1
     [
       type speciesName type " "
       if caste = "worker"  [ type "W" type " " ]
       if caste = "queen" and mated? = true [ type "Q" type " " ]
       if caste = "queen" and mated? = false [ type "q" type " " ]
       if caste = "male" and mated? = false [ type "M" type " " ]
       type colonyID type " "
       type who type " "
       type adultAge type " "
       print activityList ] ]
end

; *******************************************************************************

to DefaultProc
  ;set RAND_SEED 1
  set AbundanceBoost 1
  set B_hortorum 0
  set B_hypnorum 0
  set B_lapidarius 0
  set B_pascuorum 0
  set B_pratorum 0
  set B_terrestris 500
  set Backgroundcolour 5
  set ChooseInputFile "BBH-T_Suss1.txt"
  set ChooseInputMap "BBH-I_Suss1.png"
  set COLONIES_IBM 0
  set FlowerspeciesFile "BBH-Flowerspecies_Suss.csv"
  set FoodSourceLimit 25
  set ForagingMortalityFactor 1
  set ForagingMortalityModel "high"
  set GenericPlot1 "Species total adult queens"
  set GenericPlot2 "Species N colonies"
  set GenericPlot3 "Food available"
  set GenericPlot4 "Colony structures"
  set GenericPlot5 "Species total adults"
  set Gridsize 500
  set INPUT_FILE "BBH-T_Suss1.txt"
  set InputMap "BBH-I_Suss1.png"
  set InspectTurtle 1
  set KeepDeadColonies? true
  set Lambda_detectProb -0.005
  set MapAreaIncluded "complete"
  set MasterSizeFactor 1
  set MaxHibernatingQueens 10000 ; reduces number of hibernating queens (if exceeding) on 1st January to this number
  set MergeHedges? true
  set MinSizeFoodSources? TRUE
  set N_Badgers 0
  set N_Psithyrus 0
  set RemoveEmptyFoodSources? TRUE
  set SexLocus? false ; true
  set ShowCohorts? true
  set ShowDeadCols? false
  set ShowFoodsources? true
  set ShowGrid? false
  set ShowInspectedColony? false
  set ShowMasterpatchesOnly? false
  set ShowNests? true
  set ShowPlots? true
  set ShowQueens? true
  set ShowSearchingQueens? true
  set ShowWeather? true
  set SpeciesFilename "BBH-BumbleSpecies_UK_01.csv"
  set StopExtinct? true
  set UnlimitedMales? true
  set Weather "Constant 8 hrs"
  set WinterMortality? true
  set X_Days 90
end

; *******************************************************************************

to VersionTestProc ; to test whether the model was changed

 let expectedValue 8560

 DefaultProc

 set RAND_SEED 1
 set B_hortorum 20
 set B_hypnorum 20
 set B_lapidarius 20
 set B_pascuorum 20
 set B_pratorum 20
 set B_terrestris 100
 set N_Psithyrus 20
 set N_Badgers 5

 Setup
 repeat 2 * 365
  [
    Go
    if AssertionViolated = true
     [
       ask patches [ set pcolor red ]
       stop
      ]
  ]
  let testValue TotalBeesEverProduced + TotalHibernatingQueens + TotalMales + TotalAdultWorkers + TotalFoodSources
  type testValue type "    Difference: " print testValue - expectedValue
  ifelse testValue = expectedValue
    [ user-message "No deviation detected from the pulished version of Bumble-BEEHAVE (2017)" ]
    [ user-message "CHANGES MADE TO THE MODEL OR INPUT FILES!"]
end



to-report Season_HoPoMoREP [ today parameterList ]
  ; see Schmickl&Crailsheim2007: p.221 and p.230
  ; Values HoPoMo: x1 385; x2 30; x3 36; x4 155; x5 30

;  let x1 385  ;385
;  let x2 25 ; (earlier increase in egg laying rate than in HoPoMo)
;  let x3 36    ; 36
;  let x4 155   ;155  ; Day of max. egg laying
;  let x5 30    ;30

  let time day + 5
  if time < 0 [ set time 0 ]

  let x1 385  ;385
  let x2 25 ; (earlier increase in egg laying rate than in HoPoMo)
  let x3 36    ; 36
  let x4 155   ;155  ; Day of max. egg laying
  let x5 30    ;30

  if empty? parameterList = false
  [
    set x1 item 0 parameterList
    set x2 item 1 parameterList
    set x3 item 2 parameterList
    set x4 item 3 parameterList
    set x5 item 4 parameterList
  ]
  let seas1 (1 - (1 / (1 + x1 * e ^ (-2 * time / x2))))
  let seas2 (1 / (1 + x3 * e ^ (-2 * (time - x4) / x5)))
  ifelse seas1 > seas2
    [ report seas1 ]
    [ report seas2 ]
end


; *******************************************************************************

to SwarmingProc



   ; McLellan, Rowland 1986: 162 (modelled),

  ;VV counting new workers in last seven days ---

;  if is-list? LAST_SEVEN_DAYS_WORKER_POP
;  [
;    set LAST_SEVEN_DAYS_WORKER_POP fput (NewIHbees) LAST_SEVEN_DAYS_WORKER_POP
;  ]
;
;  if length LAST_SEVEN_DAYS_WORKER_POP > 7
;  [
;    set LAST_SEVEN_DAYS_WORKER_POP but-last LAST_SEVEN_DAYS_WORKER_POP
;  ]
;
;  let new_workers_in_7_days sum LAST_SEVEN_DAYS_WORKER_POP
;
;  if length LAST_SEVEN_DAYS_WORKER_POP < 7 or (TotalIHbees + TotalForagers) < ( broodSwarmingTH / 2 )
;  [
;    set new_workers_in_7_days 0
;  ]
;
;  if new_workers_in_7_days > ((TotalIHbees + TotalForagers) / 3)
;  [
;    output-type "VV Swarming on day because of too many new workers: " output-print day
;  ]
;
;  output-type "How close to proc?: " output-print ( ((TotalIHbees + TotalForagers) / 3) - new_workers_in_7_days )




  ;VV end of counting new workers in last seven days ---


;  if TotalWorkerAndDroneBrood > broodSwarmingTH or ;Default BEEHAVE check by brood size
;  TotalIHbees + TotalForagers > workerSwarmingTH ;or   ;VV custom check by worker bee size

  ;(new_workers_in_7_days > ((TotalIHbees + TotalForagers) / 3) and minTimeBetweenSwarms < LAST_SWARM_AGO)



ask colonies [
    let firstCol who
    let gotx xcor
    let goty ycor
  ; # total brood triggers swarming
  ; PRE_SWARMING_PERIOD: 3d of preparation before swarming
  ; SwarmingDate: set to 0 in Param.Proc and in SwarmingProc (after swarming and on day 365)
  set LAST_SWARM_AGO (LAST_SWARM_AGO + 1)
  let fractionSwarm 0.6  ; 0.6 ; Winston p. 187
  let broodSwarmingTH 17000 ; Fefferman & Starks 2006 (model)
  let lastSwarmingDate 199; Winston 1980: prime: 14.05.(134) after swarm: 18.07.(199)
  let workerSwarmingTH 16000 ;
  ;let workerSwarmingTH 1000 ;
  let minTimeBetweenSwarms 43
  let beez sum [ number ] of bees with [colonyId = firstCol and caste = "worker" and stage = "adult"]
  let eggz sum [ number ] of bees with [colonyId = firstCol and caste = "worker" and stage != "adult"]

  if beez > workerSwarmingTH or eggz > broodSwarmingTH;
  [
    if SwarmingDate = 0 and day <= (lastSwarmingDate - PRE_SWARMING_PERIOD) and minTimeBetweenSwarms < LAST_SWARM_AGO
    [
      set SwarmingDate (day + PRE_SWARMING_PERIOD)
    ]
  ]
  if day = SwarmingDate
     and Swarming = "Swarm control"
  [
    output-type "Swarming (prevented) on day: " output-print day
  ]








; newQueens = number of new queens created here
;  output-type "Swarming chrck on day: " output-print day
;  output-type "Req: " output-print SwarmingDate - PRE_SWARMING_PERIOD
;  output-type "Req2: " output-print SwarmingDate
;  output-type "Beez: " output-print beez
;  output-type "TH: " output-print workerSwarmingTH
  if day >= SwarmingDate - PRE_SWARMING_PERIOD
     and day <= SwarmingDate
  [
    if Swarming = "Swarming (parental colony)"
    [ ; Swarm PREPARATION of PARENTAL colony:
      let whoColony who
      set LAST_SWARM_AGO 0
      set NewDroneEggs 0
      set NewWorkerEggs 0
      if  day = SwarmingDate
      [ ; SWARMING of PARENTAL colony:
        set Queenage -7
          ; a new queen is left in the hive, still in a capped cell, ca. 7d
          ; before she emerges (Winston p. 187)

        ; Winston p. 185: 36mg honey is taken by a swarming bee:
        let otherEnergy beez * 0.036 * ENERGY_HONEY_per_g * fractionSwarm
        set energyStore_kJ energyStore_kJ - otherEnergy

        ; (1-fractionSwarm) of all healthy & infected in-hive bees stay in the hive:


        ; ask IHbeeCohorts
        ; [
        ;   set number_Healthy round (number_Healthy * (1 - fractionSwarm))
        ;   set number_infectedAsPupa round (number_infectedAsPupa * (1 - fractionSwarm))
        ;   set number_infectedAsAdult round (number_infectedAsAdult * (1 - fractionSwarm))
        ;   set number number_Healthy + number_infectedAsPupa + number_infectedAsAdult
        ; ]
        ;
        ; ; (1-fractionSwarm) of all healthy & infected drones stay in the hive:
        ; ask droneCohorts
        ; [
        ;   set number_Healthy round (number_Healthy * (1 - fractionSwarm))
        ;   set number_infectedAsPupa round (number_infectedAsPupa * (1 - fractionSwarm))
        ;   set number number_Healthy + number_infectedAsPupa
        ; ]
        ;
        ; ; fractionSwarm foragers leave the colony and are considered to be dead in the model:
        ; ask foragerSquadrons
        ; [
        ;   if random-float 1 < fractionSwarm [ die ]
        ; ] ; LEAVING foragers are treated as being dead

        ; the phoretic mite population in the hive is reduced:
        set PhoreticMites round (PhoreticMites * (1 - fractionSwarm))
        output-type "Swarming on day: " output-print day
        set SwarmingDate 0  ; allows production of after swarms






hatch-bees 1  ; newQueens = number of new queens created here
 [
   set shape "circle"
   if ShowQueens? = false [ hide-turtle ]
   set size QueenSymbolSize
   set adultAge 180  ; queens have hibernated (exact age doesn't matter)
   set broodAge 36  ; (exact age doesn't matter)
   set color red
   set brood? false
   set caste "queen"
   set mated? true
   set number 1
   set ploidy 2
   set mtDNA random-float 139.9 ; i.e. within the range of Netlogo colours
   set allelesList list (random-float 139.9) (random-float 139.9)
   set spermathecaList [] ;list (allele)
   set spermathecaList fput (random-float 139.9) spermathecaList
   set colonyID -1 ; i.e. does not belong to any colony yet
   let speciesIDmemo -1
   let speciesNameMemo "noName"
   ask one-of Species with [ name = "B_terrestris" ]
     [
       set speciesIDmemo who
       set speciesNameMemo name
     ]
   set speciesID speciesIDmemo
   set speciesName speciesNameMemo
   set stage "adult"
   set thEgglaying ThresholdLevelREP "eggLaying" "QueenInitiationPhase"
   set thForagingNectar ThresholdLevelREP "nectarForaging" "QueenInitiationPhase"
   set thForagingPollen ThresholdLevelREP "pollenForaging" "QueenInitiationPhase"
   set thNursing ThresholdLevelREP "nursing" "QueenInitiationPhase"
   set activity "nestConstruction"
   set activityList [ ]
   let founds getNestCoord gotx goty
   output-type "Py_x: " output-print item 0 founds
   output-type "Py_y: " output-print item 1 founds
   set xcor item 0 founds
   set ycor item 1 founds
   set personalTime_s random (2 * 3600) + (GetUpTime_s - 3600) ; = Start_time_s +- 1hr (i.e. between 7:00 and 9:00 am)
   let yearEndSeason [seasonStop] of OneSpecies speciesID ; prevent bees from setting emergingDate past the end of season
   while [ emergingDate <= 0 OR emergingDate >= yearEndSeason]
     [ set emergingDate  round random-normal [ emergingDay_mean ]
  of OneSpecies speciesID [emergingDay_sd] of OneSpecies speciesID ]
  ; emerging from hibernation next year on day "emergingDay_mean" (+- s.d.)

   set currentFoodsource -1
   set nectarsourceToGoTo -1
   set pollensourceToGoTo -1
   set pollenForager? false
   set knownMasterpatchesNectarList [ ]
   set knownMasterpatchesPollenList [ ]

   ; determination of the queen's weight:
   let minWeight_mg [ devWeight_Q_PupationMin_mg ] of oneSpecies speciesID
   let maxWeight_mg [ devWeight_Q_PupationMax_mg ] of oneSpecies speciesID
   let meanWeight_mg (maxWeight_mg + minWeight_mg) / 2
   let sd_weight (maxWeight_mg - minWeight_mg) / 4 ; mean +- 2xSD > 95%

   set weight_mg random-normal meanWeight_mg sd_weight
   if weight_mg > maxWeight_mg [ set weight_mg maxWeight_mg ]
   if weight_mg < minWeight_mg [ set weight_mg minWeight_mg ]
   set glossaLength_mm ProboscisLengthREP
   set cropvolume_myl   CropAndPelletSizeREP "nectar"
   set pollenPellets_g  CropAndPelletSizeREP "pollen"

 ]

let newColony 0

; now the COLONIES are created:
hatch-Colonies 1
[
 set newColony who
 let memoSpeciesID -1
 let xcol -1
 let ycol -1
 let speciesShape "bumblebeenest" ; will be replaced by species specific bumblebee symbol
 let nNewColonies count bees with [ activity = "nestConstruction" ]
 set whoColony who ; the ID of the colony
 set colonyFoundationDay ticks
 ask one-of bees with [ activity = "nestConstruction" and caste = "queen" ]

 [
   set xcol xcor  ;  x and y coordinates of the queen are saved, so that the nest can be located where the queen is
   set ycol ycor
   set colonyID whoColony ; queen gets the ID of the colony..
   set memoSpeciesID SpeciesID ; and saves her species-type for the colony
   set activity "resting"      ; as the colony is created now, the queen rests
   set speciesShape speciesName  ; saves the species of the queen so that the colony can be displayed in the according shape
   if ShowQueens? = true [show-turtle]
 ]

 set queenProduction? false   ; no production of queens yet
 set switchPointDate NotSetHigh ; queen won't lay haploid eggs until switchPointDate is re-set
 set competitionPointDate NotSetHigh
 set eusocialPhaseDate NotSetHigh
 set queenProductionDate NotSetHigh
 set speciesIDcolony memoSpeciesID ; colony gets species-type from queen
 if ShowNests? = false [ hide-turtle ]
 set xcor xcol      ; the colony is placed at the location of queen
 set ycor ycol
 set queenright? true  ; queen is still alive
 set shape speciesShape ; colony is displayd on the interface as a bumblebee, showing the species of the queen
 set heading 0
 set color 33  ; (33) dark brown
 set size ColonySymbolsize; 14 (14)
 ;vv old set energyStore_kJ 100 * EnergySucrose_kJ/mymol * 1.5  ; i.e. 0.873kJ (= 100 microliter of 1.5M nectar (i.e. ca. 1 crop))
  ; beehav 0.5 * MAX_HONEY_STORE_kg * 1000 max = 5
; set energyStore_kJ 2500 * 100 * EnergySucrose_kJ/mymol * 1.5 * 300  ; i.e. 0.873kJ (= 100 microliter of 1.5M nectar (i.e. ca. 1 crop))
; set pollenStore_g 2000
  set energyStore_kJ otherEnergy



 ;set pollenStore_g 1000

 set colonysize 1  ; i.e. the queen
 set cohortBased? true
 if count Colonies with [ cohortBased? = false ] < COLONIES_IBM
 [
   set cohortBased? false
   set color ColorIBM
   set InspectTurtle Who
 ]

 PatchesInRangeProc
 FoodsourcesInFlowerAndRangeProc

; let barX 3.5
; let barY 5
; ; a nectar and a pollen storebar is now assigned to the new colony
; ask one-of storebars with [ storeColonyID = -1 ]
; [
;   ifelse xcol - barX > min-pxcor and ycol - barY > min-pycor
;    [ setxy xcol - barX ycol - barY ]
;    [ hide-turtle ]
;   set storeColonyID whoColony
;   set store "Nectar"
;   set color yellow
; ]
;
; set barY barY - 1
; ask one-of storebars with [ storeColonyID = -1 ]
; [
;   ifelse xcol - barX > min-pxcor and ycol - barY > min-pycor
;    [ setxy xcol - barX ycol - barY ]
;    [ hide-turtle ]
;   set storeColonyID whoColony
;   set store "Pollen"
;   set color orange - 0.5
; ]
 set TotalColoniesEverProduced  TotalColoniesEverProduced + 1
 ;beehave import
 set PhoreticMites  N_INITIAL_MITES_HEALTHY + N_INITIAL_MITES_INFECTED
 set TotalMites  PhoreticMites
]






; each colony needs 2 storebars to display on the interface the relative amount of nectar and pollen stored:



  let leftcount beez * 0.6

     while [leftcount > 0  ]
     [
          ask one-of bees with [colonyId = firstCol and caste = "worker" and stage = "adult"]
          [
            set colonyId newColony
            set leftcount leftcount - number
            output-print word "Bees " leftcount
          ]
     ]
  output-print (beez * fractionSwarm)
  output-print sum [ number ] of bees with [colonyId = newColony and caste = "worker" and stage = "adult"]
  output-print sum [ number ] of bees with [colonyId = firstCol and caste = "worker" and stage = "adult"]

] ;if day


  ] ; if swarming ..



  ; resetting SwarmingDate to zero at the end of a year:





] ; if swarming ..

if day = 365 [ set SwarmingDate 0 ]
] ;ask colonies'
end

;**************************************************************************************************************************
to DriftingProc
  let scale TotalMapArea_km2 / max-pxcor
  ;output-print "Drift Cycle"
  ;output-print max-pxcor
  ;output-print TotalMapArea_km2 / max-pxcor
  ask colonies
  [
   let firstCol who
   let x1 xcor
   let y1 ycor
   output-print word "Colony at x1: " word x1 word " y1: " y1
   ask colonies
   [
    let secondCol who
    let x2 xcor
    let y2 ycor
      if firstCol != secondCol
      [
      let distanceHere sqrt ( ( x1 - x2 )  ^ 2 + ( y1 - y2 ) ^ 2 ) * scale
      if distanceHere < 0.2
        [
      output-print distanceHere
          if count bees with [colonyId = firstCol and caste = "worker" and stage = "adult"] > 100
          [

          ask up-to-n-of 3 bees with [colonyId = firstCol and caste = "worker" and stage = "adult"]
          [
            set colonyId secondCol
            ;output-print word "bee " word who word " drifted to colony: " secondCol
          ]

          ]

        ]
      ]
   ]
  ]
end



;; ==============================================================================
;; END OF THE CODE     +++     END OF THE CODE     +++     END OF THE CODE    +++
;; ==============================================================================











@#$#@#$#@
GRAPHICS-WINDOW
86
66
1049
744
-1
-1
3.173
1
10
1
1
1
0
0
0
1
0
300
0
210
0
0
1
time steps
30.0

BUTTON
1269
116
1352
167
SETUP
Setup
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
1355
116
1463
168
Run
Go
T
1
T
OBSERVER
NIL
R
NIL
NIL
1

BUTTON
1518
81
1579
114
1 year
repeat 365\n[\n  Go\n  if AssertionViolated = true\n   [\n     ask patches [ set pcolor red ]\n     stop\n    ]\n]
NIL
1
T
OBSERVER
NIL
5
NIL
NIL
1

BUTTON
1463
47
1519
82
1 day
Go\n  if AssertionViolated = true\n  [\n    ask patches [ set pcolor red ]\n    stop\n   ]
NIL
1
T
OBSERVER
NIL
1
NIL
NIL
1

BUTTON
1518
47
1579
81
1 week
repeat 7\n[\n  Go\n  if AssertionViolated = true\n   [\n     ask patches [ set pcolor red ]\n     stop\n    ]\n]
NIL
1
T
OBSERVER
NIL
7
NIL
NIL
1

BUTTON
1463
81
1519
114
1 month
if ticks = 0 [ Go ]\nlet days-in-months (list 31 28 31 30 31 30 31 31 30 31 30 31)\nlet month 0\nlet repetitions 30\nlet dayOfYear remainder ticks 365\n  let dayOfMonth 0\n  let sumDaysInMonths 0\n  while [ sumDaysInMonths < dayOfYear ]\n  [\n    set month month + 1\n    set sumDaysInMonths sumDaysInMonths + item (month - 1) days-in-months\n    set dayOfMonth dayOfYear - sumDaysInMonths + item (month - 1) days-in-months\n  ]\n\nifelse ticks = 0\n [ set repetitions 31 ]\n [ set repetitions item (month - 1) days-in-months ]\n\nrepeat repetitions\n  [\n    Go\n    if AssertionViolated = true\n     [\n       ask patches [ set pcolor red ]\n       stop\n      ]\n  ]
NIL
1
T
OBSERVER
NIL
3
NIL
NIL
1

INPUTBOX
1582
48
1662
108
RAND_SEED
0.0
1
0
Number

TEXTBOX
1604
89
1655
107
0: no seed!
10
0.0
1

PLOT
1163
567
1662
839
plot 2
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS

CHOOSER
1163
537
1662
582
GenericPlot2
GenericPlot2
"show nothing" "Bee weights [mg] (histogram)" "Colony sizes (histogram)" "Colony structures" "Egg laying" "Food available" "Foodsources sizes (histogram)" "Foraging period max. [hrs]" "Foraging trips daily" "Genepool (histogram)" "Hibernating queens" "Matrilines (histogram)" "N colonies" "Sex ratio" "Species hibernating queens" "Species N colonies" "Species total adult queens" "Species total adults" "Stores: honey [ml] & pollen [g]" "Switchpoints" "Total adults" "Total mites"
9

CHOOSER
2067
375
2393
420
Weather
Weather
"foragingHoursExample" "Constant 24 hrs" "Constant 20 hrs" "Constant 16 hrs" "Constant 12 hrs" "Constant 11 hrs" "Constant 10 hrs" "Constant 9 hrs" "Constant 8 hrs" "Constant 7 hrs" "Constant 6 hrs" "Constant 5 hrs" "Constant 4 hrs" "Constant 3 hrs" "Constant 2 hrs" "Constant 1 hrs" "Rothamsted2011"
9

INPUTBOX
1582
108
1662
168
X_Days
1825.0
1
0
Number

BUTTON
1518
116
1579
168
run X days
repeat X_Days\n[\n  Go\n  if AssertionViolated = true\n   [\n     ask patches [ set pcolor red ]\n     stop\n    ]\n]
NIL
1
T
OBSERVER
NIL
X
NIL
NIL
1

BUTTON
878
10
933
43
grid
ifelse ShowGrid? = false\n[\n  ask patches with [ remainder pxcor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n  ask patches with [ remainder pycor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n  ask patch 290 5 [ set  plabel-color black set plabel word gridsize \" m\" ]\n  set ShowGrid? true\n]\n[\n  ask patches [ set pcolor pcolorSave ]\n  ask patch 290 5 [ set  plabel-color black set plabel \"\" ]\n  set ShowGrid? false\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
214
842
370
875
ShowCohorts?
ShowCohorts?
1
1
-1000

INPUTBOX
1071
10
1154
70
InspectTurtle
19820.0
1
0
Number

BUTTON
698
10
753
43
who
ask foodsources\n[ show-turtle\n  set label \"\"\n  ]\nask Colonies [ set label who ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
625
10
698
43
colony size
ask foodsources\n[ show-turtle\n  set label \"\"\n  ]\nask Colonies [ set label ColonySize ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
752
10
813
43
honey [ml]
ask foodsources\n[ show-turtle\n  set label \"\"\n  ]\nask Colonies [ set label who ]\nask Colonies [ set label precision (energyStore_kJ / EnergyHoney_kJ/ml) 1 ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
812
10
878
43
pollen [g]
ask Colonies [ set label precision pollenstore_g 1 ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
660
841
820
874
ShowInspectedColony?
ShowInspectedColony?
0
1
-1000

INPUTBOX
1678
230
1838
290
Colonies_IBM
0.0
1
0
Number

MONITOR
176
1655
454
1700
Colony density [cols / km^2] (all species, total area)
ColonyDensity_km2
17
1
11

SWITCH
374
875
536
908
ShowFoodsources?
ShowFoodsources?
1
1
-1000

BUTTON
467
1704
678
1737
Activity List
ActivityListButton
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
1165
871
2398
1182
plot 3
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS

CHOOSER
1166
843
2399
888
GenericPlot3
GenericPlot3
"show nothing" "Bee weights [mg] (histogram)" "Colony sizes (histogram)" "Colony structures" "Egg laying" "Food available" "Foodsources sizes (histogram)" "Foraging period max. [hrs]" "Foraging trips daily" "Genepool (histogram)" "Hibernating queens" "Matrilines (histogram)" "N colonies" "Sex ratio" "Species hibernating queens" "Species N colonies" "Species total adult queens" "Species total adults" "Stores: honey [ml] & pollen [g]" "Switchpoints" "Total adults"
3

PLOT
1167
1209
1659
1522
plot 4
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS

CHOOSER
1165
1180
2398
1225
GenericPlot4
GenericPlot4
"show nothing" "Bee weights [mg] (histogram)" "Colony sizes (histogram)" "Colony structures" "Egg laying" "Food available" "Foodsources sizes (histogram)" "Foraging period max. [hrs]" "Foraging trips daily" "Genepool (histogram)" "Hibernating queens" "Matrilines (histogram)" "N colonies" "Sex ratio" "Species hibernating queens" "Species N colonies" "Species total adult queens" "Species total adults" "Stores: honey [ml] & pollen [g]" "Switchpoints" "Total adults"
2

MONITOR
651
911
741
956
# bee agents
TotalBeeAgents
17
1
11

MONITOR
15
910
105
955
IBM colonies
TotalIBMColonies
17
1
11

MONITOR
848
911
1010
956
N foodsources
TotalFoodSources
17
1
11

MONITOR
321
911
427
956
hibernating Queens
TotalHibernatingQueens
17
1
11

MONITOR
163
910
232
955
all queens
TotalQueens
17
1
11

MONITOR
236
910
319
955
virgin queens
TotalUnmatedQueens
17
1
11

SWITCH
214
875
370
908
ShowQueens?
ShowQueens?
1
1
-1000

SWITCH
374
842
536
875
ShowNests?
ShowNests?
0
1
-1000

SWITCH
820
843
987
876
ShowGrid?
ShowGrid?
1
1
-1000

SWITCH
659
874
821
907
ShowWeather?
ShowWeather?
1
1
-1000

BUTTON
467
1736
678
1769
Activities Queens
type \"day: \" type day print \" \"\n\nforeach sort-on [ colonyID * 1000000000 + who ]  bees with [ caste = \"queen\" ]\n  [ ?1 -> ask ?1\n     [ if caste = \"worker\"  [ type \"W\" type \" \" ]\n       if caste = \"queen\" and mated? = true [ type \"Q\" type \" \" ]\n       if caste = \"queen\" and mated? = false [ type \"q\" type \" \" ]\n       type colonyID type \" \" type who type \" \" type \" \"  print activityList ]\n  ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
428
911
504
956
drones
TotalMales
17
1
11

MONITOR
384
1561
453
1606
N colonies
totalColonies
17
1
11

BUTTON
934
11
1019
71
Inspect turtle
ask foodsources\n[ show-turtle\n  set label \"\"\n  ]\nask Colonies [ set label who ]\nask turtle InspectTurtle\n[\n\n  inspect turtle InspectTurtle\n\n ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
854
1445
998
1505
ForagingMortalityFactor
1.0
1
0
Number

MONITOR
153
1084
232
1129
mated queens
TotalMatedQueens
17
1
11

MONITOR
118
11
221
56
Date & Year
Date
17
1
11

INPUTBOX
2067
156
2230
216
Input_File
BBH-T_Suss1.txt
1
0
String

INPUTBOX
1003
1401
1156
1461
Backgroundcolour
5.0
1
0
Color

SLIDER
467
1667
678
1700
MasterSizeFactor
MasterSizeFactor
0.5
2
1.0
0.1
1
NIL
HORIZONTAL

INPUTBOX
2068
43
2229
103
InputMap
BBH-I_Suss1.png
1
0
String

BUTTON
1463
116
1518
168
31st Dec
while [ day != 365 and day != 0]\n[ Go\n  if AssertionViolated = true\n     [\n       ask patches [ set pcolor red ]\n       stop\n      ]\n ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
1681
10
1921
37
Initial Queens & Badgers
20
0.0
1

INPUTBOX
1678
47
1755
107
B_terrestris
3.0
1
0
Number

INPUTBOX
1678
107
1755
167
B_lapidarius
0.0
1
0
Number

INPUTBOX
1678
166
1755
226
B_pascuorum
0.0
1
0
Number

CHOOSER
2067
327
2392
372
SpeciesFilename
SpeciesFilename
"BBH-BumbleSpecies_UK_01.csv" "BBH-BumbleSpecies_UK_02.csv" "BBH-BumbleSpecies_UK_03.csv" "BBH-BumbleSpecies_UK_04.csv" "BBH-BumbleSpecies_UK_06.csv"
4

INPUTBOX
1759
47
1836
107
B_hortorum
0.0
1
0
Number

INPUTBOX
1759
107
1836
167
B_pratorum
0.0
1
0
Number

INPUTBOX
1759
167
1837
227
B_hypnorum
0.0
1
0
Number

BUTTON
498
10
553
43
species
ask colonies\n[\n  ifelse label != shape\n  [ set label shape ]\n  [\n    show-turtle\n    set label \"\"\n  ]\n\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
553
10
626
43
patch types
ask foodsources with [ masterpatch? = false ] [ hide-turtle ]\nask foodsources ; with [ masterpatch? = true ]\n[\n  ifelse label != patchtype\n    [ set label patchtype ]\n    [\n      show-turtle\n      set label \"\"\n    ]\n]\n\n;wait 10\n;\n;ask foodsources\n;[\n; set label \"\";\n;]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
175
1798
452
1843
mean weight [mg]
meanAdultWeight_mg
1
1
11

MONITOR
175
1702
453
1747
mean weight workers
meanWorkerWeight_mg
1
1
11

MONITOR
175
1749
453
1794
mean weight queens
meanQueenWeight_mg
1
1
11

BUTTON
1018
11
1073
71
Find!
ask signs with  [ shape = \"circletarget\" ]\n[\n  set hidden? not hidden?\n  setxy [xcor] of turtle InspectTurtle [ycor] of turtle InspectTurtle\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
467
1467
678
1500
WinterMortality?
WinterMortality?
1
1
-1000

MONITOR
68
11
118
56
NIL
Day
17
1
11

INPUTBOX
1846
292
1959
352
N_Badgers
0.0
1
0
Number

INPUTBOX
1846
231
2020
291
N_Psithyrus
0.0
1
0
Number

BUTTON
1162
74
1258
107
Reproduction
with-local-randomness\n[\nrandom-seed 1\nask turtles [ hide-turtle ]\n\nlet maxDeaths max [ nColonies ] of patches\nif maxDeaths > 0\n[\n  ask patches\n    [\n      ;set pcolor scale-color sky sqrt nColonies 0 sqrt (maxDeaths / 10)\n     ; set pcolor black\n      let repropcolor pcolor\n      let colorChanged false\n      if nColonies > 0 [ set pcolor black - 1 set colorChanged true ]\n      if nMalesProduced > 0 [ set repropcolor yellow - 1 set colorChanged true ]\n      if nQueensProduced > 0 [ set repropcolor red - 1 set colorChanged true ]\n      if nMalesProduced * nQueensProduced > 0 [ set repropcolor green - 1 set colorChanged true ]\n      set pcolor repropcolor\n      if colorChanged = true [ ask neighbors [ set pcolor repropcolor ]]\n    ]\n\n\n ]\n ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
467
1501
678
1534
SexLocus?
SexLocus?
1
1
-1000

MONITOR
505
911
586
956
workers
TotalAdultWorkers
17
1
11

MONITOR
107
910
162
955
N colonies
TotalColonies
17
1
11

MONITOR
11
11
68
56
NIL
ticks
17
1
11

BUTTON
1269
47
1352
116
DEFAULT*
DefaultProc\n; change in DefaultProc: renamed some input files\n; by adding prefix \"SI_07_\"\nSetup
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
1355
47
1464
80
VERSION TEST
VersionTestProc
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
6
1407
170
1452
NIL
TotalBeesEverProduced
17
1
11

CHOOSER
2067
273
2391
318
FlowerspeciesFile
FlowerspeciesFile
"No Input File" "BBH-Flowerspecies_Suss.csv" "BBH-Flowerspecies_Suss_02.csv"
2

CHOOSER
2123
104
2387
149
ChooseInputMap
ChooseInputMap
"None" "BBH-I_Suss1.png"
1

CHOOSER
2122
217
2388
262
ChooseInputFile
ChooseInputFile
"None" "BBH-T_Suss1.txt"
1

BUTTON
2067
104
2122
149
Apply!
set InputMap ChooseInputMap
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
16
842
214
875
ShowMasterpatchesOnly?
ShowMasterpatchesOnly?
1
1
-1000

INPUTBOX
468
1603
679
1663
Lambda_detectProb
-0.005
1
0
Number

TEXTBOX
1850
48
2000
90
Note: changing these numbers during a run results in an error message!
11
0.0
1

PLOT
1162
205
1662
537
plot 1
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS

CHOOSER
3
1006
1159
1051
genericPlot5
genericPlot5
"show nothing" "Bee weights [mg] (histogram)" "Colony sizes (histogram)" "Colony structures" "Egg laying" "Food available" "Foodsources sizes (histogram)" "Foraging period max. [hrs]" "Foraging trips daily" "Genepool (histogram)" "Hibernating queens" "Matrilines (histogram)" "N colonies" "Sex ratio" "Species hibernating queens" "Species N colonies" "Species total adult queens" "Species total adults" "Stores: honey [ml] & pollen [g]" "Switchpoints" "Total adults"
20

BUTTON
436
10
499
43
map
ifelse count patches with [pcolor != pcolorSave] > 0\n [ ask patches [ set pcolor pcolorSave ]]\n [ ask patches [ set pcolor Backgroundcolour]]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
6
1454
170
1499
NIL
TotalAdultsEverProduced
17
1
11

MONITOR
6
1361
170
1406
Queens producing colonies
length QueensProducingColoniesList
17
1
11

MONITOR
176
1561
384
1606
Colonies/ha (all species, total area)
ColonyDensity_km2 / 100
2
1
11

INPUTBOX
854
1506
998
1567
AbundanceBoost
1.0
1
0
Number

SWITCH
466
1432
678
1465
RemoveEmptyFoodSources?
RemoveEmptyFoodSources?
0
1
-1000

INPUTBOX
467
1537
679
1600
FoodSourceLimit
25.0
1
0
Number

SWITCH
536
842
660
875
showDeadCols?
showDeadCols?
1
1
-1000

SWITCH
467
1399
678
1432
MinSizeFoodSources?
MinSizeFoodSources?
0
1
-1000

BUTTON
220
10
303
43
update view
ask deadCols [ set color white set size 1 set label \"\" ]\nask foodsources [ set color colorMemo ]\nask Colonies [ set label ColonySize ]\n\nifelse showFoodSources?\n[\n   ifelse showMasterPatchesOnly?\n   [\n     ask Foodsources with [masterPatch?] [show-turtle]\n     ask Foodsources with [not masterPatch?] [hide-turtle]\n   ]\n   [\n     ask Foodsources [st]\n   ]\n]\n[\n  ask foodsources [ht]\n]\n\nifelse showSearchingQueens?\n[\n  ask bees with [ caste = \"queen\" and colonyID = -1 and activity != \"hibernate\" ] [st]\n][\n  ask bees with [ caste = \"queen\" and colonyID = -1 and activity != \"hibernate\" ] [ht]\n]\n\n\nifelse showCohorts?\n[\n  ask bees with [ shape = \"halfline\" ] [st]\n][\n  ask bees with [ shape = \"halfline\" ] [ht]\n]\n\nifelse showQueens?\n[\n  ask bees with [ caste = \"queen\" and mated? = true ] [st]\n][\n  ask bees with [ caste = \"queen\" and mated? = true ] [ht]\n]\n\nifelse showNests?\n[\n  ask colonies [st]\n][\n  ask colonies [ht]\n]\n\n\n\nifelse showDeadCols?\n[\n  ask deadCols [st]\n][\n  ask deadCols [ht]\n]\n\nask badgers [ st]\n\nifelse showGrid?\n[\n    ask patches with [ remainder pxcor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n    ask patches with [ remainder pycor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n    ask patch 290 5 [ set  plabel-color black set plabel word gridsize \" m\" ]\n]\n[\n  ask patches [ set pcolor pcolorSave ]\n  ask patch 290 5 [ set plabel \"\"]\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
2067
217
2122
262
Apply!
set INPUT_FILE ChooseInputFile
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
174
1362
452
1552
Colony density total area [cols/km2]
NIL
NIL
0.0
10.0
0.0
1.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plotxy ticks ColonyDensity_km2"

MONITOR
587
911
650
956
total brood
TotalEggs + TotalLarvae + TotalPupae
17
1
11

BUTTON
1161
140
1258
173
Queens Producers
ask deadCols\n[\n  ifelse totalQueensProduced > 0\n  [\n    show-turtle\n    set size 4\n    set color red\n    set label totalQueensProduced\n  ]\n  [\n    set color white\n    set size 1\n  ]\n\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1161
107
1258
140
Males Producers
ask deadCols\n[\n  ifelse totalMalesProduced > 0\n  [\n    show-turtle\n    set size 4\n    set color green\n    set label totalMalesProduced\n  ]\n  [\n    set color white\n    set size 1\n  ]\n\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
354
10
436
43
hide agents
ask turtles [ hide-turtle ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
679
1400
850
1433
UnlimitedMales?
UnlimitedMales?
0
1
-1000

SWITCH
679
1433
850
1466
KeepDeadColonies?
KeepDeadColonies?
1
1
-1000

BUTTON
1162
10
1258
43
Pollen visits
let averageCumulPollenVisits 0 ; all pollen visits of ALL patches\n  ask foodsources\n   [\n     show-turtle\n     set averageCumulPollenVisits averageCumulPollenVisits + cumulPollenVisits\n     ]\n\n   set averageCumulPollenVisits averageCumulPollenVisits / count foodsources  with [ masterpatch? = true ]\n   ask foodsources with [ masterpatch? = true ]\n   [\n     let myMasterpatch who\n     let summedCumulPollenVisits 0 ; all pollen visits within a layergroup\n     ask foodsources with [ masterpatchID = myMasterpatch ]\n      [ set summedCumulPollenVisits summedCumulPollenVisits + cumulPollenVisits ]\n     let mapDisplay summedCumulPollenVisits / averageCumulPollenVisits\n     ask foodsources with [ masterpatchID = myMasterpatch ]\n      [  set color scale-color orange sqrt mapDisplay 0 3 ]\n\n   ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1162
42
1258
75
Nectar visits
let averageCumulNectarVisits 0 ; all pollen visits of ALL patches\n  ask foodsources\n   [\n     show-turtle\n     set averageCumulNectarVisits averageCumulNectarVisits + cumulNectarVisits\n     ]\n\n   set averageCumulNectarVisits averageCumulNectarVisits / count foodsources  with [ masterpatch? = true ]\n   ask foodsources with [ masterpatch? = true ]\n   [\n     let myMasterpatch who\n     let summedCumulNectarVisits 0 ; all pollen visits within a layergroup\n     ask foodsources with [ masterpatchID = myMasterpatch ]\n      [ set summedCumulNectarVisits summedCumulNectarVisits + cumulNectarVisits ]\n     let mapDisplay summedCumulNectarVisits / averageCumulNectarVisits\n     ask foodsources with [ masterpatchID = myMasterpatch ]\n      [  set color scale-color yellow sqrt mapDisplay 0 4 ]\n\n   ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
521
1418
671
1436
very small N or P sources set to 0
9
0.0
1

TEXTBOX
522
1450
672
1468
soruces with no N&P are removed
9
0.0
1

MONITOR
7
1648
170
1693
overall sex ratio M:Q
TotalAdultMalesEverProduced / TotalAdultQueensEverProduced
2
1
11

MONITOR
7
1599
171
1644
mean Queens/year
TotalAdultQueensEverProduced / ceiling (ticks / 365)
2
1
11

MONITOR
1013
911
1158
956
NIL
PollenAvailableTotal_kg
2
1
11

MONITOR
1012
958
1159
1003
NIL
NectarAvailableTotal_l
2
1
11

SLIDER
821
874
1155
907
Gridsize
Gridsize
10
1000
500.0
10
1
m
HORIZONTAL

INPUTBOX
1003
1463
1158
1523
MaxHibernatingQueens
10000.0
1
0
Number

TEXTBOX
695
1469
845
1511
If \"KeepDeadColonies\" = false, dead colonies are removed after each year
11
0.0
1

SWITCH
16
875
213
908
ShowSearchingQueens?
ShowSearchingQueens?
1
1
-1000

INPUTBOX
2230
43
2388
103
TotalMapArea_km2
5.0
1
0
Number

MONITOR
850
958
1011
1003
NIL
Scaling_NLpatches/m
3
1
11

TEXTBOX
527
1643
666
1661
(determine with BEESCOUT)
10
0.0
1

TEXTBOX
2270
74
2393
100
(only used to calculated nest density)\n
10
0.0
1

BUTTON
1678
292
1838
325
all 100
set B_terrestris 100\nset B_lapidarius 100\nset B_pascuorum 100\nset B_hortorum 100\nset B_pratorum 100\nset B_hypnorum 100\n;set N_Psithyrus 100
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1678
325
1838
358
all 0
set B_terrestris 0\nset B_lapidarius 0\nset B_pascuorum 0\nset B_hortorum 0\nset B_pratorum 0\nset B_hypnorum 0\nset N_Psithyrus 0
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
1162
176
1662
221
GenericPlot1
GenericPlot1
"show nothing" "Bee weights [mg] (histogram)" "Colony sizes (histogram)" "Colony structures" "Egg laying" "Food available" "Foodsources sizes (histogram)" "Foraging period max. [hrs]" "Foraging trips daily" "Genepool (histogram)" "Hibernating queens" "Matrilines (histogram)" "N colonies" "Sex ratio" "Species hibernating queens" "Species N colonies" "Species total adult queens" "Species total adults" "Stores: honey [ml] & pollen [g]" "Switchpoints" "Total adults" "Total mites"
3

BUTTON
300
10
355
43
clear
ask foodsources [ set label \"\"  ]\nask colonies [ set label \"\"  ]\nask deadCols [ set label \"\"  ]\nask signs with  [ shape = \"circletarget\" ]\n[ set hidden? true ]\nask deadCols [ set color white set size 1 ]\nask patches [ set pcolor Backgroundcolour]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
6
1502
171
1547
NIL
TotalAdultMalesEverProduced
1
1
11

MONITOR
176
1609
454
1654
Colonies/ha nesting habitat (B. terrestris)
10000 * (count colonies with [shape = \"b_terrestris\"]) / (item 0 [nestsitearea] of species with [name = \"B_terrestris\"])
3
1
11

TEXTBOX
2069
10
2325
41
Input Files, Map & Weather
20
0.0
1

TEXTBOX
1274
11
1424
36
SETUP & RUN
20
0.0
1

TEXTBOX
1675
405
1825
430
Colony statistics
20
0.0
1

TEXTBOX
468
1360
618
1385
Advanced Input
20
0.0
1

MONITOR
6
1549
171
1594
NIL
TotalAdultQueensEverProduced
17
1
11

BUTTON
1355
81
1464
114
Setup* (no cohorts)
set ShowCohorts? false\nSetup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
536
875
659
908
ShowPlots?
ShowPlots?
0
1
-1000

BUTTON
1678
362
1839
395
Plots: show nothing
set GenericPlot1 \"show nothing\"\nset GenericPlot2 \"show nothing\"\nset GenericPlot3 \"show nothing\"\nset GenericPlot4 \"show nothing\"\nset GenericPlot5 \"show nothing\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
986
843
1155
876
update view
ask deadCols [ set color white set size 1 set label \"\" ]\nask foodsources [ set color colorMemo ]\n\n\nifelse showFoodSources?\n[\n   ifelse showMasterPatchesOnly?\n   [\n     ask Foodsources with [masterPatch?] [show-turtle]\n     ask Foodsources with [not masterPatch?] [hide-turtle]\n   ]\n   [\n     ask Foodsources [st]\n   ]\n]\n[\n  ask foodsources [ht]\n]\n\nifelse showSearchingQueens?\n[\n  ask bees with [ caste = \"queen\" and colonyID = -1 and activity != \"hibernate\" ] [st]\n][\n  ask bees with [ caste = \"queen\" and colonyID = -1 and activity != \"hibernate\" ] [ht]\n]\n\n\nifelse showCohorts?\n[\n  ask bees with [ shape = \"halfline\" ] [st]\n][\n  ask bees with [ shape = \"halfline\" ] [ht]\n]\n\nifelse showQueens?\n[\n  ask bees with [ caste = \"queen\" and mated? = true ] [st]\n][\n  ask bees with [ caste = \"queen\" and mated? = true ] [ht]\n]\n\nifelse showNests?\n[\n  ask colonies [st]\n][\n  ask colonies [ht]\n]\n\n\n\nifelse showDeadCols?\n[\n  ask deadCols [st]\n][\n  ask deadCols [ht]\n]\n\nifelse showGrid?\n[\n    ask patches with [ remainder pxcor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n    ask patches with [ remainder pycor round (gridsize * Scaling_NLpatches/m) = 0 ] [ set pcolor black ]\n    ask patch 290 5 [ set  plabel-color black set plabel word gridsize \" m\" ]\n]\n[\n  ask patches [ set pcolor pcolorSave ]\n  ask patch 290 5 [ set plabel \"\"]\n]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
1174
1532
1866
1552
Please note: Histograms to not take the cohort size into account, hence IBM colonies may be overrepresented in histograms!
11
0.0
1

CHOOSER
854
1400
998
1445
ForagingMortalityModel
ForagingMortalityModel
"low" "intermediate" "high"
2

CHOOSER
2231
156
2387
201
MapAreaIncluded
MapAreaIncluded
"complete" "top half" "bottom half" "left half" "right half" "top left quarter" "top right quarter" "bottom left quarter" "bottom right quarter"
0

MONITOR
1960
292
2021
337
N badgers
count badgers
17
1
11

TEXTBOX
1858
332
1951
350
suggested: 0-3/km2
10
0.0
1

BUTTON
1846
350
1958
383
1 badger/ km2
set N_Badgers TotalMapArea_km2
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
682
1533
851
1566
StopExtinct?
StopExtinct?
0
1
-1000

MONITOR
6
1694
170
1739
Hibernating Queens removed
TotalHibernatingQueensEverRemoved
17
1
11

BUTTON
743
911
846
956
Show habitat areas
print \"Habitat areas [m2]: \"\ntype \"Grassland: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Grassland\"]\ntype \"Hedges: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Hedgerow\"]\ntype \"Scrub: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Scrub\"]\ntype \"Woodland: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Woodland\"]\ntype \"Maize: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Crop_Maize\"]\ntype \"OSR: \" print sum [area_sqm] of foodsources with [ masterpatch? = true and patchtype = \"Crop_Oilseed_rape\"]\nprint \"\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
682
1567
851
1600
MergeHedges?
MergeHedges?
0
1
-1000

BUTTON
467
1770
678
1803
Total nectar & pollen per year
let totalNectar_perYear_l 0\nlet totalPollen_perYear_kg 0\nask foodsources ; with [patchtype = \"Hedgerow\"]\n[\n  set totalNectar_perYear_l totalNectar_perYear_l + ((nectarMax_myl * (stopDay - startDay)) / 1000000)\n  set totalPollen_perYear_kg totalPollen_perYear_kg + ((pollenMax_g * (stopDay - startDay)) / 1000)\n]\n\ntype \"total nectar [l] produced per year: \" print precision totalNectar_perYear_l 1\ntype \"total pollen [kg] produced per year: \" print precision totalPollen_perYear_kg 1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
1376
1698
1486
1731
FeedBees
FeedBees
1
1
-1000

SWITCH
1375
1736
1542
1769
MergeWeakColonies
MergeWeakColonies
1
1
-1000

INPUTBOX
889
1621
1044
1681
MergeColoniesTH
5000.0
1
0
Number

SWITCH
1376
1810
1486
1843
AddPollen
AddPollen
1
1
-1000

INPUTBOX
1048
1754
1205
1814
HarvestingDay
135.0
1
0
Number

INPUTBOX
889
1750
1044
1810
HarvestingPeriod
80.0
1
0
Number

INPUTBOX
890
1685
1045
1745
HarvestingTH
20.0
1
0
Number

SWITCH
1376
1773
1527
1806
HoneyHarvesting
HoneyHarvesting
1
1
-1000

INPUTBOX
1049
1692
1204
1752
RemainingHoney_kg
5.0
1
0
Number

SWITCH
1377
1659
1508
1692
QueenAgeing
QueenAgeing
1
1
-1000

SWITCH
1376
1621
1526
1654
VarroaTreatment
VarroaTreatment
1
1
-1000

INPUTBOX
1048
1621
1203
1681
N_INITIAL_MITES_HEALTHY
1000.0
1
0
Number

INPUTBOX
1207
1622
1368
1701
N_INITIAL_MITES_INFECTED
20.0
1
0
Number

CHOOSER
1042
1573
1209
1618
MiteReproductionModel
MiteReproductionModel
"Fuchs&Langenbach" "Martin" "Martin+0" "Test" "No Mite Reproduction"
1

INPUTBOX
1559
1691
1714
1751
SQUADRON_SIZE
100.0
1
0
Number

PLOT
5
1049
1159
1363
plot 5
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS

CHOOSER
1763
1635
1963
1680
Swarming
Swarming
"Swarm control" "Swarming (parental colony)"
1

CHOOSER
1213
1573
1351
1618
Virus
Virus
"DWV" "APV" "benignDWV" "modifiedAPV" "TestVirus"
0

OUTPUT
1675
435
2409
760
9

@#$#@#$#@
# Terms of use of the software Bumble-Beehave


Bumble-Beehave is the implementation of the model Bumble-BEEHAVE, developed by Matthias Becher and colleagues:


Becher, MA, Twiston-Davies, G, Penny, TD, Goulson, D, Rotheray, EL, Osborne, JL (2018) Bumble-BEEHAVE: a systems model for exploring multifactorial causes of bumblebee decline at individual, colony, population and community level. _Journal of Applied Ecology_.


This implementation is based on the software platform NetLogo (Wilensky 1999), and can be downloaded for free from http://beehave-model.net/.



## Copyright and Licence Information:
Copyright 2018 by the University of Exeter and Matthias Becher

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

A copy of the GNU General Public License can be found at http://www.gnu.org/licenses/gpl.html or write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

ambrosia
false
15
Rectangle -1 true true 51 107 246 218
Rectangle -1 true true 46 40 256 205
Rectangle -13345367 true false 60 90 240 180
Circle -1 true true 39 24 42
Circle -1 true true 219 24 42
Circle -1 true true 219 204 42
Circle -1 true true 39 204 42
Rectangle -1 true true 39 45 60 222
Rectangle -1 true true 246 46 261 224
Rectangle -1 true true 57 23 243 53
Rectangle -1 true true 57 218 240 246
Line -1184463 false 72 113 72 158
Line -1184463 false 74 134 88 134
Circle -1184463 false false 102 117 43
Rectangle -2674135 true false 192 9 239 23
Polygon -1 true true 58 27 65 8 140 8 147 27
Line -1184463 false 73 114 97 114
Circle -1184463 false false 151 115 43
Polygon -1184463 false false 207 115 221 117 226 129 226 146 221 155 207 158
Rectangle -16777216 true false 74 16 132 27

anarchy
false
0
Circle -16777216 true false -4 -2 300
Circle -2674135 true false 30 30 240
Circle -16777216 true false 47 44 208
Rectangle -2674135 true false 15 165 75 195
Rectangle -2674135 true false 58 168 100 193
Rectangle -2674135 true false 89 169 126 192
Rectangle -2674135 true false 121 171 155 189
Rectangle -2674135 true false 151 175 189 188
Rectangle -2674135 true false 188 178 223 188
Rectangle -2674135 true false 220 180 264 187
Rectangle -2674135 true false 246 184 284 187
Polygon -2674135 true false 14 166 16 163 15 194
Polygon -16777216 true false 14 163 22 176 20 180 23 189 13 197 9 163 16 165
Polygon -2674135 true false 55 258 71 232 83 213 95 194 112 171 136 139 163 106 180 81 221 23 204 36 206 22 193 40 184 49 172 66 154 92 131 121 105 154 88 173 77 190 63 206 49 223 32 234 48 240
Polygon -2674135 true false 227 283 230 271 244 279 243 269 236 246 200 118 176 53 164 15 163 18 155 11 155 22 151 22 174 100 214 232 225 289

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

b_appositus
true
0
Circle -7500403 true true 110 45 80
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -1 true false 94 91 106
Circle -16777216 true false 99 168 102
Circle -1184463 true false 117 135 64
Circle -16777216 true false 110 108 75
Rectangle -955883 true false 100 221 200 235
Rectangle -1184463 true false 125 154 173 184
Polygon -7500403 true true 187 94 243 168 258 198 243 228 215 229 172 184 171 111 187 94
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93

b_griseocollis
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -1184463 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -16777216 true false 97 165 102
Circle -16777216 true false 134 110 34
Rectangle -1184463 true false 97 149 202 206
Rectangle -16777216 true false 97 163 201 176
Polygon -7500403 true true 111 97 55 167 40 197 55 227 85 227 130 182 129 109 115 92
Polygon -7500403 true true 189 93 245 167 260 197 245 227 217 228 174 183 173 110 189 93

b_hortorum
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -1 true false 97 165 102
Circle -16777216 true false 89 127 120
Rectangle -1184463 true false 96 203 198 218
Circle -1184463 true false 94 91 106
Circle -16777216 true false 111 108 75
Polygon -7500403 true true 187 94 243 168 258 198 243 228 215 229 172 184 171 111 187 94
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93

b_hypnorum
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -1 true false 93 161 110
Circle -955883 true false 90 99 120
Circle -16777216 true false 89 127 120
Circle -6459832 true false 91 99 120
Rectangle -16777216 true false 106 176 191 222
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

b_impatiens
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -16777216 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 112 120
Circle -1 true false 108 83 88
Rectangle -1 true false 91 144 196 201
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

b_lapidarius
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -16777216 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -2674135 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 112 120
Circle -16777216 true false 92 106 114
Rectangle -16777216 true false 105 165 195 195
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

b_pascuorum
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -6459832 true false 97 165 102
Circle -955883 true false 90 99 120
Circle -6459832 true false 89 127 120
Circle -6459832 true false 92 136 114
Circle -6459832 true false 91 99 120
Rectangle -6459832 true false 105 180 195 225
Rectangle -16777216 true false 106 242 188 250
Rectangle -16777216 true false 100 225 196 233
Rectangle -16777216 true false 97 207 199 214
Rectangle -16777216 true false 99 187 201 194
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93

b_pratorum
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -1184463 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -955883 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 126 120
Rectangle -1184463 true false 98 176 195 202
Rectangle -1184463 true false 116 98 187 120
Polygon -7500403 true true 189 94 245 168 260 198 245 228 217 229 174 184 173 111 189 94
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93

b_terrestris
true
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -1184463 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -1 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 127 120
Circle -16777216 true false 92 121 114
Rectangle -1184463 true false 98 181 199 210
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

badger
false
0
Polygon -1 true false 104 41 108 32 134 29 156 29 192 31 202 40 168 234 151 229 132 242
Polygon -1 true false 176 247 224 85 246 67 255 57 244 172 197 231 168 259 182 236
Polygon -1 true false 128 256 120 220 69 63 45 59 64 173 92 227 134 267
Circle -1 true false 39 5 67
Circle -1 true false 120 220 60
Circle -16777216 true false 131 238 38
Polygon -16777216 true false 198 29 219 29 245 68 173 249 160 230
Polygon -16777216 true false 109 32 88 33 60 60 123 257 140 233 109 40
Circle -1 true false 191 10 67
Circle -16777216 true false 189 19 64
Circle -16777216 true false 41 13 64
Circle -1 true false 84 91 24
Circle -1 true false 192 91 24
Circle -16777216 true false 197 96 14
Circle -16777216 true false 88 96 14

bar
false
0
Rectangle -7500403 true true 135 0 165 150

bar2
false
0
Rectangle -7500403 true true 105 15 195 285

bee_mb_1
true
0
Circle -7500403 true true 110 75 80
Circle -7500403 true true 101 157 98
Circle -6459832 true false 107 124 86
Line -7500403 true 150 100 105 60
Line -7500403 true 150 100 195 60
Circle -7500403 true true 103 178 92
Circle -7500403 true true 117 227 62
Polygon -7500403 true true 120 150 60 225 60 240 75 255 105 255 120 240 135 165 120 150
Polygon -7500403 true true 180 150 240 225 240 240 225 255 195 255 180 240 165 165 180 150
Circle -16777216 true false 116 88 19
Circle -16777216 true false 163 86 19
Circle -16777216 true false 112 99 19
Circle -16777216 true false 168 97 19

bee_mb_pollen
true
0
Circle -7500403 true true 110 75 80
Circle -7500403 true true 101 157 98
Circle -6459832 true false 107 124 86
Line -7500403 true 150 100 105 60
Line -7500403 true 150 100 195 60
Circle -7500403 true true 103 178 92
Circle -7500403 true true 117 227 62
Polygon -7500403 true true 120 150 60 225 60 240 75 255 105 255 120 240 135 165 120 150
Polygon -7500403 true true 180 150 240 225 240 240 225 255 195 255 180 240 165 165 180 150
Circle -16777216 true false 116 88 19
Circle -16777216 true false 163 86 19
Circle -16777216 true false 112 99 19
Circle -16777216 true false 168 97 19
Circle -1184463 true false 90 240 30
Circle -1184463 true false 180 240 30

beehive1
false
3
Rectangle -6459832 true true 15 135 285 270
Rectangle -7500403 true false 0 105 300 135
Line -16777216 false 15 240 285 240
Rectangle -16777216 true false 120 240 180 255

beehive1super
false
3
Rectangle -6459832 true true 15 195 150 300
Rectangle -7500403 true false 0 180 165 195
Line -16777216 false 15 285 150 285
Rectangle -16777216 true false 60 285 105 300
Line -16777216 false 15 225 150 225

beehive2super
false
3
Rectangle -6459832 true true 15 165 150 300
Rectangle -7500403 true false 0 150 165 165
Line -16777216 false 15 285 150 285
Rectangle -16777216 true false 60 285 105 300
Line -16777216 false 15 225 150 225
Line -16777216 false 15 195 150 195

beehive3super
false
3
Rectangle -6459832 true true 15 135 150 300
Rectangle -7500403 true false 0 120 165 135
Line -16777216 false 15 285 150 285
Rectangle -16777216 true false 60 285 105 300
Line -16777216 false 15 225 150 225
Line -16777216 false 15 195 150 195
Line -16777216 false 15 165 150 165

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

bumblebee
false
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -1184463 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -16777216 true false 121 52 19
Circle -16777216 true false 160 51 19
Circle -16777216 true false 113 59 19
Circle -16777216 true false 166 59 19
Circle -1 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 127 120
Circle -16777216 true false 92 121 114
Rectangle -1184463 true false 105 165 195 195
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

bumblebeenest
false
3
Circle -6459832 true true 135 105 90
Circle -6459832 true true 15 135 90
Circle -6459832 true true 150 180 90
Circle -6459832 true true 75 150 90
Circle -6459832 true true 90 210 90
Circle -6459832 true true 195 120 90
Circle -16777216 true false 45 136 42
Circle -16777216 true false 109 151 42
Circle -16777216 true false 166 181 42
Circle -6459832 true true 15 195 90

bumblebeepupa
false
3
Circle -6459832 true true 63 96 175
Circle -16777216 true false 85 118 134
Circle -955883 true false 130 134 16
Circle -955883 true false 151 135 16
Circle -1 true false 140 129 16
Circle -1 true false 136 138 24
Circle -1 true false 125 152 48
Circle -1 true false 134 204 38
Circle -1 true false 127 181 46
Polygon -7500403 true false 139 159 121 191 135 184 122 209 133 234 144 223 144 211 147 168 151 218 156 238 174 225 167 192 174 189 161 159 153 164 145 164

bumbleeggcup
false
3
Circle -6459832 true true 63 93 175
Circle -16777216 true false 105 90 90
Circle -1 true false 116 110 16

bumblelarva
false
0
Circle -6459832 true false 29 59 212
Circle -16777216 true false 45 75 180
Circle -7500403 true true 150 122 60
Circle -7500403 true true 135 110 60
Circle -7500403 true true 120 105 60
Circle -7500403 true true 105 105 60
Circle -7500403 true true 90 105 60
Circle -7500403 true true 69 111 58
Circle -7500403 true true 52 132 44
Circle -7500403 true true 50 152 32
Circle -7500403 true true 54 175 14
Circle -7500403 true true 168 145 44

bumblepupa
true
3
Circle -6459832 true true 61 60 180
Circle -16777216 true false 73 74 152
Circle -955883 true false 133 103 16
Circle -955883 true false 150 102 16
Circle -1 true false 141 96 16
Circle -1 true false 137 108 24
Circle -1 true false 126 116 48
Circle -1 true false 132 166 38
Circle -1 true false 127 143 46
Polygon -7500403 true false 139 121 121 153 135 146 122 171 133 196 144 185 144 173 147 130 151 180 156 200 174 187 167 154 174 151 161 121 153 126 145 126

bumblepupa2
false
3
Circle -6459832 true true 63 93 175

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

christmastree1
false
0
Polygon -6459832 true false 137 286 140 261 162 261 164 279 172 289
Polygon -14835848 true false 164 261 201 270 217 264 208 256 164 244 164 235 190 243 210 241 213 231 196 232 157 213 160 194 184 210 199 205 214 191 194 196 174 181 156 171 160 145 172 162 184 163 172 137 155 117 139 127 115 140 141 143 147 146 137 161 143 164 125 176 95 177 83 181 101 186 107 195 122 194
Polygon -14835848 true false 164 261 119 261 104 267 78 262 83 255 100 255 107 258 122 251 130 243 122 239 105 245 91 246 91 233 116 234 126 229 106 222 82 222 99 214 117 216 130 216 129 203
Circle -2674135 true false 171 156 16
Circle -2674135 true false 109 173 16
Circle -2674135 true false 172 190 16
Circle -2674135 true false 125 205 16
Circle -2674135 true false 186 222 16
Circle -2674135 true false 107 231 16
Circle -2674135 true false 149 229 16
Circle -2674135 true false 181 248 16
Circle -2674135 true false 136 160 16
Polygon -2674135 true false 148 123 158 124 154 80

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

circleline
true
0
Circle -2674135 false false 60 60 180
Circle -2674135 false false 53 53 194
Circle -2674135 false false 45 45 210
Circle -2674135 false false 45 45 210
Circle -2674135 false false 48 48 204
Circle -2674135 false false 50 50 200
Circle -2674135 false false 47 47 206
Circle -2674135 false false 51 51 198
Circle -2674135 false false 54 54 192
Circle -2674135 false false 55 55 190
Circle -2674135 false false 57 57 186
Circle -2674135 false false 58 58 184
Circle -2674135 false false 52 52 196
Circle -2674135 false false 51 51 198
Circle -2674135 false false 49 49 202
Circle -2674135 false false 45 45 210
Circle -2674135 false false 43 43 214
Circle -2674135 false false 47 47 206

circlelines
true
0
Circle -2674135 false false 15 15 270
Circle -2674135 false false 60 60 180
Circle -2674135 false false 45 45 210
Circle -2674135 false false 30 30 240
Circle -2674135 false false 0 0 300

circlelinesrb
false
0
Circle -2674135 false false 60 60 180
Circle -16777216 false false 45 45 210
Circle -2674135 false false 30 30 240

circlesingle
false
0
Circle -7500403 false true 30 30 240

circletarget
false
1
Circle -2674135 false true 60 60 180
Circle -2674135 false true 53 53 194
Circle -2674135 false true 45 45 210
Circle -2674135 false true 45 45 210
Circle -2674135 false true 48 48 204
Circle -2674135 false true 50 50 200
Circle -2674135 false true 47 47 206
Circle -2674135 false true 51 51 198
Circle -2674135 false true 54 54 192
Circle -2674135 false true 55 55 190
Circle -2674135 false true 57 57 186
Circle -2674135 false true 58 58 184
Circle -2674135 false true 52 52 196
Circle -2674135 false true 51 51 198
Circle -2674135 false true 49 49 202
Circle -2674135 false true 45 45 210
Circle -2674135 false true 43 43 214
Circle -2674135 false true 47 47 206
Line -16777216 false 60 150 240 150
Line -16777216 false 150 60 150 240

cloud
false
0
Circle -7500403 true true 13 118 94
Circle -7500403 true true 86 101 127
Circle -7500403 true true 51 51 108
Circle -7500403 true true 118 43 95
Circle -7500403 true true 158 68 134

comet
false
4
Polygon -1184463 true true 287 134 268 121 234 109 196 108 169 108 144 109 110 114 87 124 55 131 39 143 14 155 7 168 25 159 54 153 30 168 15 177 6 189 28 182 75 166 107 161 80 180 29 203 10 230 41 221 83 200 116 195 77 214 55 228 36 261 91 229 116 218 139 203 146 184 158 177 196 162 238 155 265 159 289 165 295 155 297 140

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

crown
false
0
Polygon -1184463 true false 15 150 45 225 255 225 285 150 15 150
Polygon -1184463 true false 150 120 90 150 210 150 150 120
Polygon -1184463 true false 45 120 15 150 75 150 45 120
Polygon -1184463 true false 255 120 225 150 285 150 255 120
Rectangle -1184463 true false 135 75 165 135
Rectangle -1184463 true false 120 90 180 105
Circle -2674135 true false 120 150 60

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fadedflower
false
0
Polygon -6459832 true false 75 195 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 10 252 38
Circle -7500403 true true 70 132 38
Circle -7500403 true true 102 175 38
Circle -7500403 true true 87 237 38
Circle -7500403 true true -5 145 38
Circle -7500403 true true 6 156 108
Circle -16777216 true false 23 173 74
Polygon -6459832 true false 189 233 210 225 240 225 225 285 210 240
Polygon -6459832 true false 180 240 150 240 105 240 90 285 120 255

fieldmargin
false
4
Circle -13345367 true false 0 0 300
Circle -1184463 true true 30 30 240

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

flowerorange
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -955883 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

halfline
true
0
Line -7500403 true 150 0 150 150

hammerandsickle
false
0
Circle -16777216 true false 40 40 224
Circle -2674135 true false 116 75 118
Circle -16777216 true false 94 62 118
Polygon -2674135 true false 137 173 147 182 116 212 109 206
Circle -2674135 true false 100 198 24
Polygon -2674135 true false 226 228 232 212 123 103 112 113
Polygon -2674135 true false 100 141 77 125 118 81 153 82

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

pete
false
13
Polygon -2064490 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -1 true false 60 195 90 210 114 154 120 195 180 195 187 157 210 210 240 195 195 90 165 90 150 105 150 150 135 90 105 90
Circle -2064490 true true 110 5 80
Rectangle -2064490 true true 127 79 172 94
Polygon -1 true false 120 90 120 180 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 180 90 172 89 165 135 135 135 127 90
Polygon -1 true false 115 2 112 19 70 31 70 38 108 46 116 32 143 25 179 24 187 34 223 21 221 12 177 14 166 -2
Rectangle -7500403 true false 225 209 258 255
Rectangle -16777216 false false 115 24 182 99
Line -16777216 false 127 26 127 95
Line -16777216 false 142 24 143 96
Line -16777216 false 156 27 157 96
Line -16777216 false 167 25 168 96
Line -16777216 false 115 76 181 75
Line -16777216 false 115 85 182 85
Line -16777216 false 117 60 180 60
Line -16777216 false 116 45 179 45
Circle -7500403 true false 222 188 36
Polygon -7500403 true false 249 211 257 217 276 188 268 184 247 195
Polygon -6459832 true false 226 204 199 205 227 250
Circle -16777216 true false 143 173 10
Circle -16777216 true false 142 151 10
Line -16777216 false 120 195 179 195
Line -16777216 false 115 34 178 34

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

psithyrus
false
0
Circle -7500403 true true 110 45 80
Circle -16777216 true false 90 116 120
Circle -1184463 true false 91 84 120
Line -7500403 true 152 76 120 34
Line -7500403 true 150 72 181 33
Circle -2674135 true false 121 52 19
Circle -2674135 true false 160 51 19
Circle -2674135 true false 113 59 19
Circle -2674135 true false 166 59 19
Circle -1 true false 97 165 102
Circle -16777216 true false 90 99 120
Circle -16777216 true false 89 127 120
Circle -16777216 true false 92 121 114
Rectangle -1184463 true false 98 181 199 210
Polygon -7500403 true true 111 98 55 168 40 198 55 228 85 228 130 183 129 110 115 93
Polygon -7500403 true true 188 95 244 169 259 199 244 229 216 230 173 185 172 112 188 95

queen
true
6
Circle -13840069 true true 114 48 72
Circle -13840069 true true 101 112 98
Circle -16777216 true false 107 79 86
Line -13840069 true 150 70 105 30
Line -13840069 true 150 70 195 30
Circle -13840069 true true 109 170 78
Circle -13840069 true true 125 230 50
Polygon -7500403 true false 120 120 60 195 60 210 75 225 105 225 120 210 135 135 120 120
Polygon -7500403 true false 180 120 240 195 240 210 225 225 195 225 180 210 165 135 180 120
Circle -16777216 true false 116 58 19
Circle -16777216 true false 163 56 19
Circle -16777216 true false 112 69 19
Circle -16777216 true false 168 67 19
Circle -13840069 true true 115 199 70
Circle -13791810 true false 121 95 60
Circle -13840069 true true 137 267 26
Circle -13840069 true true 132 253 34
Line -16777216 false 117 228 181 227
Line -16777216 false 126 258 174 256
Line -16777216 false 166 275 133 276
Line -16777216 false 123 192 176 190

reindeer
false
0
Polygon -7500403 true true 195 193 195 251 184 247 183 192 172 156 141 170 98 169 65 154 61 210 47 211 46 183 35 151 23 122 23 91 33 83 103 91 177 77 196 78 250 66 270 83 293 110 291 123 259 115 240 111 219 158
Polygon -7500403 true true 62 207 73 246 62 249 48 208
Polygon -7500403 true true 41 83 9 81 18 90 24 104
Polygon -7500403 true true 241 75 220 48 207 22 200 0 218 27 226 38 231 17 236 26 231 45 237 56 241 37 247 46 244 60 250 71

rip
false
0
Circle -16777216 true false 90 15 150
Circle -7500403 true true 75 15 150
Rectangle -16777216 true false 75 60 255 270
Rectangle -7500403 true true 60 60 240 270
Polygon -16777216 true false 94 215 100 214 99 177 110 219 120 214 104 171 113 169 122 166 125 157 125 145 120 133 109 130 99 130 87 130 80 132 81 140 88 139 90 147 89 164 89 176 89 190 86 202 88 211 89 216 98 216
Rectangle -16777216 true false 144 130 157 216
Polygon -16777216 true false 188 216 194 215 193 178 198 173 198 172 207 170 216 167 219 158 219 146 214 134 203 131 193 131 181 131 174 133 175 141 182 140 184 148 183 165 183 177 183 191 180 203 182 212 183 217 192 217
Circle -7500403 true true 190 138 22
Circle -7500403 true true 95 138 22

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

skull
false
0
Circle -1 true false 17 -5 232
Circle -1 true false 5 10 220
Circle -1 true false 62 0 220
Circle -1 true false 62 19 220
Circle -1 true false 5 10 220
Circle -1 true false 47 -5 232
Rectangle -1 true false 75 225 210 285
Rectangle -7500403 true true 150 258 178 285
Polygon -1 true false 203 250 230 194 177 183
Circle -16777216 true false 46 76 88
Polygon -16777216 true false 135 165 135 210 120 210 135 165
Polygon -16777216 true false 150 165 150 210 165 210 150 165
Line -16777216 false 135 285 135 261
Line -16777216 false 120 285 120 262
Rectangle -7500403 true true 135 269 153 285
Rectangle -7500403 true true 195 260 210 285
Polygon -1 true false 60 195 76 254 105 240 75 210 60 210
Circle -16777216 true false 153 77 88
Rectangle -7500403 true true 75 260 103 285

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

sun
false
0
Circle -7500403 true true 75 75 150
Polygon -7500403 true true 300 150 240 120 240 180
Polygon -7500403 true true 150 0 120 60 180 60
Polygon -7500403 true true 150 300 120 240 180 240
Polygon -7500403 true true 0 150 60 120 60 180
Polygon -7500403 true true 60 195 105 240 45 255
Polygon -7500403 true true 60 105 105 60 45 45
Polygon -7500403 true true 195 60 240 105 255 45
Polygon -7500403 true true 240 195 195 240 255 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

virus1
true
0
Polygon -7500403 true true 90 45 120 15 180 15 210 45 210 90 180 120 120 120 90 90 90 45
Rectangle -7500403 true true 135 120 165 195
Rectangle -7500403 true true 105 210 195 195
Rectangle -7500403 true true 105 195 195 210
Polygon -7500403 true true 180 195 195 210 240 165 225 150 180 195 195 210
Polygon -7500403 true true 105 210 120 195 75 150 60 165 105 210
Polygon -7500403 true true 240 165 285 210 270 225 225 180
Polygon -7500403 true true 60 165 75 180 30 225 15 210 60 165
Rectangle -7500403 true true 120 150 135 225
Rectangle -7500403 true true 165 150 180 225

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="Default" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="3650"/>
    <metric>Day</metric>
    <metric>ColonyDensity_km2</metric>
    <metric>TotalActiveBees</metric>
    <metric>TotalAdultMales</metric>
    <metric>TotalAdultMalesEverProduced</metric>
    <metric>TotalAdultQueens</metric>
    <metric>TotalAdultQueensEverProduced</metric>
    <metric>TotalAdults</metric>
    <metric>TotalAdultsEverProduced</metric>
    <metric>TotalAdultWorkers</metric>
    <metric>TotalBeeAgents</metric>
    <metric>TotalBeesEverDied</metric>
    <metric>TotalBeesEverProduced</metric>
    <metric>TotalColonies</metric>
    <metric>TotalColoniesEverProduced</metric>
    <metric>TotalEggs</metric>
    <metric>TotalFoodSources</metric>
    <metric>TotalForagingTripsToday</metric>
    <metric>TotalHibernatingQueens</metric>
    <metric>TotalLarvae</metric>
    <metric>TotalMales</metric>
    <metric>TotalMatedQueens</metric>
    <metric>TotalPupae</metric>
    <metric>TotalQueens</metric>
    <metric>TotalUnmatedQueens</metric>
    <metric>sum [totalLarvaeProduced] of deadCols</metric>
    <metric>sum [totalPupaeProduced] of deadCols</metric>
    <metric>sum[totalEggsProduced] of deadCols</metric>
    <metric>sum [cumulNectarVisits] of foodsources</metric>
    <metric>sum [cumulPollenVisits] of foodsources</metric>
    <enumeratedValueSet variable="StopExtinct?">
      <value value="false"/>
    </enumeratedValueSet>
    <steppedValueSet variable="RAND_SEED" first="1" step="1" last="10"/>
    <enumeratedValueSet variable="AbundanceBoost">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_hortorum">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_hypnorum">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_lapidarius">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_pascuorum">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_pratorum">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="B_terrestris">
      <value value="500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Backgroundcolour">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ChooseInputFile">
      <value value="&quot;BBH-T_Suss1.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ChooseInputMap">
      <value value="&quot;BBH-I_Suss1.png&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Colonies_IBM">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FlowerspeciesFile">
      <value value="&quot;BBH-Flowerspecies_Suss.csv&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FoodSourceLimit">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ForagingMortalityFactor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ForagingMortalityModel">
      <value value="&quot;high&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="GenericPlot1">
      <value value="&quot;Species total adult queens&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="GenericPlot2">
      <value value="&quot;Species N colonies&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="GenericPlot3">
      <value value="&quot;Food available&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="GenericPlot4">
      <value value="&quot;Colony structures&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="genericPlot5">
      <value value="&quot;Species total adults&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Gridsize">
      <value value="500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Input_File">
      <value value="&quot;BBH-T_Suss1.txt&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InputMap">
      <value value="&quot;BBH-I_Suss1.png&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InspectTurtle">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="KeepDeadColonies?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Lambda_detectProb">
      <value value="-0.005"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="MapAreaIncluded">
      <value value="&quot;complete&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="MasterSizeFactor">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="MaxHibernatingQueens">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="MergeHedges?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="MinSizeFoodSources?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N_Badgers">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="N_Psithyrus">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="RemoveEmptyFoodSources?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="SexLocus?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowCohorts?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="showDeadCols?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowFoodsources?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowGrid?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowInspectedColony?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowMasterpatchesOnly?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowNests?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowPlots?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowQueens?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowSearchingQueens?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ShowWeather?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="SpeciesFilename">
      <value value="&quot;BBH-BumbleSpecies_UK_01.csv&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="TotalMapArea_km2">
      <value value="25"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="UnlimitedMales?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Weather">
      <value value="&quot;Constant 8 hrs&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="WinterMortality?">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="X_Days">
      <value value="90"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
