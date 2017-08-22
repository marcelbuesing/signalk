module SignalK.Data.Vessels where

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


data Vessel = Vessel
  {
  -- | URL based identity of the vessel, if available.
    _vesselUrl :: Maybe URL
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
  , _vesselRegistrations :: VesselRegistrations
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
data VesselRegistrations = VesselRegistrations
  { -- | The IMO number of the vessel.
    _vesselsRegistrationsImo :: Imo
  -- | The national registration number of the vessel.
  , _vesselsRegistrationsNational :: National
  -- | A local or state registration number of the vessel.
  , _vesselsRegistrationsLocal :: Local
  -- | Other registration or permits for the vessel.
  , _vesselsRegistrationsOther :: Other
  }

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
