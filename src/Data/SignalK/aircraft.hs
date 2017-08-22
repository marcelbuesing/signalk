data Aircraft = Aircraft
  { -- | URL based identity of the aircraft, if available.
    _aircraftUrl :: Url
  -- | MMSI number of the aircraft, if available.
  , _aircraftMmsi :: Mmsi
  -- | A unique Signal K flavoured maritime resource identifier, assigned by the server.
  , _aircraftUuid :: Uuid
  -- | The country of aircraft registration, or flag state of the aircraft
  , _aircraftFlag :: Flag
  -- | The home base of the aircraft
  , _aircraftBase :: Text
  -- |  "The various registrations of the aircraft.
  , _aircraftRegistrations :: AircraftRegistrations
  -- | Communication data including Radio, Telephone, E-Mail, etc.
  , _aircraftCommunication :: Communication
  -- | Environmental data measured locally including Depth, Wind, Temp, etc.
  , _aircraftEnvironment :: Environment
  -- | Navigation data including Position, Course to next WP information, etc.
  , _aircraftNavigation :: Navigation
  -- | Notifications currently raised. Major categories have
  -- | well-defined names, but the tree can be extended by any hierarchical structure
  , _aircraftNotifications :: Notifications
  -- | Design/dimensional data of this aircraft
  , _aircraftDesign :: Design
  -- | Sensors, their state, and data.
  , _aircraftSensors :: Sensors
   }

-- | The various registrations of the vessel.
data AircraftRegistrations = AircraftRegistrations
  { -- | The IMO number of the vessel.
    _aircraftRegistrationsImo :: Imo
  -- | The national registration number of the vessel.
  , _aircraftRegistrationsNational :: National
  , _aircraftRegistrationsOther :: Other
  }

  -- | The national registration number of the vessel.
data National = National
  { -- | ISO 3166-2 Country Code
    _nationalCountry :: CountryCode
  , _nationalRegistration :: RegistratonCode
  , _nationalDescription :: Text
  }

-- | Other registration or permits for the aircraft.
data Other = Other
  { _otherRegistration :: RegistratonCode
  , _otherDescription :: Text
  }
