module SignalK.Data.Aton where

data AidToNavigation = AidToNavigation
  {   -- | URL based identity of the vessel, if available.
    _aidToNavigationUrl :: Maybe Url
  -- | MMSI number of the vessel, if available.
  , _aidToNavigationMmsi ;; Maybe Mmsi
  -- | A unique Signal K flavoured maritime resource identifier, assigned by the server.
  , _aidToNavigationUuid :: Maybe Uuid
  , _aidToNavigationAtonType :: AidToNavigationType
  , _aidToNavigationName :: Text
  , _aidToNavigationCommunication :: Communication
  }

data AidToNavigationType =
  -- | Default, Type of AtoN not specified
    AtoNNotSpecified
  -- | Reference Point
  | ReferencePoint
  -- | RACON
  | Racon
  -- | Fixed structures off-shore, such as oil platforms, wind farms.
  | FixedStructuresOffShore
  -- | Emergency Wreck Marking Buoy
  | EmergencyWreckMarkingBuoy
  -- | Light, without sectors
  | LightWithoutSectors
  -- | Light, without sectors
  | LightWithSectors
  -- | Leading light front
  | LeadingLightFront
  -- | Leading light rear
  | LeadingLightRear
  -- | Beacon, Cardinal N
  | BeaconCardinalN
  -- | Beacon, Cardinal E
  | BeaconCardinalE
  -- | Beacon, Cardinal S
  | BeaconCardinalS
  -- | Beacon, Cardinal W
  | BeaconCardinalW
  -- | Beacon, Port hand
  | BeaconPortHand
  -- | Beacon, Starboard hand
  | BeaconStarboardHand
  -- | Beacon, Preferred Channel port hand
  | BeaconPreferredChannelPortHand
  | BeaconPreferredChannelStarboardHand
  | BeaconIsolatedDanger
  | BeaconSafeWater
  | BeaconSpecialMark
  | CardinalMarkN
  | CardinalMarkE
  | CardinalMarkS
  | CardinalMarkW
  | PortHandMark
  | StarboardHandMark
  | PreferredChannalePortHand
  | PreferredChannelStarboardHand
  | IsolatedDanger
  | SafeWater
  | SpecialMark
  | LightVesselLanbyRigs
  deriving (Enum)
