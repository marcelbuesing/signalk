newtype Urn = Urn Text

newtype Flag = Flag Text
newtype Port = Port Text
-- | The International Maritime Organization (IMO) number is
-- | a unique reference for ships and for registered ship owners
-- | and management companies
newtype Imo = Imo Text

-- | ISO 3166-2 Country Code
newtype CountryCode = CountryCode Text

newtype RegistrationCode = RegistrationCode Text

newtype Version = Version Text

-- | Root schema of Signal K. Contains the list of vessels plus a reference to the
-- | local boat (also contained in the vessels list).
data SignalK = SignalK
  { -- | Version of the schema and APIs that this data is using in Canonical format i.e. V1.0.0.
    _signalKVersion :: Version
  -- | A wrapper object for vessel objects, each describing vessels in range, including this vessel.
  , _signalKVessels :: Vessel
  -- | A wrapper object for aircraft, primarily intended for SAR aircraft in relation
  -- | to marine search and rescue. For clarity about seaplanes etc, if it CAN fly, its an aircraft.
  , _signalKAircraft :: Aircraft
  -- | A wrapper object for Aids to Navigation (aton's).
  , _signalKAtron :: Aton
  -- | A wrapper object for Search And Rescue (SAR) MMSI's usied in transponders. MOB, EPIRBS etc.
  , _signalKSar :: Sar
  -- | Metadata about the data sources; physical interface, address, protocol, etc.
  , _signalKSources :: Sources
  -- | Resources to aid in navigation and operation of the vessel including waypoints, routes, notes, etc.
  , _signalKResources :: Resources
  }

data Vessel = Vessel
  {
  -- | URL based identity of the vessel, if available.
    _vesselUrl
  -- | MMSI number of the vessel, if available.
  , _vesselMmsi
  -- | MMSI number of the mothership of this vessel, if available.
  , _vesselMothershipMmsi
  -- | A unique Signal K flavoured maritime resource identifier, assigned by the server.
  , _vesselUuid :: Maybe Uuid
  -- | The common name of the vessel.
  , _vesselName :: Text
  -- | The country of ship registration, or flag state of the vessel
  , _vesselFlag :: Flag
  -- | The home port of the vessel
  , _vesselPort :: Port
  -- |- The various registrations of the vessel.
  , _vesselRegistrations :: Registrations
  -- | Communication data including Radio, Telephone, E-Mail, etc.
  , _vesselCommunication :: Communication
  -- | Environmental data measured locally including Depth, Wind, Temp, etc.
  , _vesselEnvironment :: Environment
  -- | Notifications currently raised. Major categories have well-defined names,
  -- | but the tree can be extended by any hierarchical structure
  , _vesselNavigation :: Navigation
  -- | Engine data, each engine identified by a unique name i.e. Port_Engine
  , _vesselPropulsion :: Propulsion
  -- | Electrical data, each electrical device indentified by a unique name i.e. Battery_1
  , _vesselElectrical :: Electrical
  -- | Notifications currently raised. Major categories have well-defined names,
  -- | but the tree can be extended by any hierarchical structure
  , _vesselNotifications :: Notifications
  -- | Vessel steering data for steering controls (not Autopilot 'Nav Data')
  , _vesselSteering :: Steering
  -- | Tank data, each tank indentified by a unique name i.e. FreshWater_2
  , _vesselTanks :: Tanks
  -- | Design/dimensional data of this vessel
  , _vesselDesign :: Design
  -- | Sails data
  , _vesselSails :: Sails
  -- | Sensors, their state, and data.
  , _vesselSensors :: Sensors
  -- | Performance Sailing data including VMG, Polar Speed, tack angle, etc.
  , _vesselPerformance :: Performance
  }

  -- | Notifications currently raised. Major categories have well-defined names,
  -- | but the tree can be extended by any hierarchical structure
data Notifications = Notifications
  {
  -- | Man overboard
    _notificationsMob :: Mob
  -- | Fire onboard
  , _notificationsFire :: Fire
  -- | Vessel is sinking
  , _notificationsSinking :: Sinking
  -- | Vessel is flooding
  , _notificationsFlooding :: Flooding
  -- | In collision with another vessel or object
  , _notificationsCollision :: Collision
  -- | Vessel grounding
  , _notificationsGrounding :: Grounding
  -- | Vessel is listing
  , _notificationsListing :: Listing
  -- | Vessel is adrift
  , _notificationsAdrift :: Adrift
  -- | Under attack or danger from pirates
  , _notificationsPiracy :: Piracy
  -- | Abandon ship
  , _notificationsAbandon :: Abandon
  }

-- | The various registrations of the vessel.
data Registrations = Registrations
  { -- | The IMO number of the vessel.
    _registrationsImo :: Imo
  -- | The national registration number of the vessel.
  , _registrationsNational :: National
  -- | A local or state registration number of the vessel.
  , _registrationsLocal :: Local
  -- | Other registration or permits for the vessel.
  , _registrationsOther :: Other
  }y

-- | The national registration number of the vessel.
data National = National
  { -- | ISO 3166-2 Country Code
    _nationalCountry :: CountryCode
  , _nationalRegistration :: RegistratonCode
  , _nationalDescription :: Text
  }

-- | A local or state registration number of the vessel.
data Local = Local
  { _localRegistration :: RegistratonCode
  , _localDescription :: Text
  }

-- | Other registration or permits for the vessel.
data Other = Other
  { _otherRegistration :: RegistratonCode
  , _otherDescription :: Text
  }
