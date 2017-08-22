module SignalK.Data.Sar where

-- | An object describing an individual SAR beacon, eg EPIRB or transponser.
-- | It should be an object in sar, named using MMSI or a UUID
data SearchAndRescueBeacons = SearchAndRescueBeacons
  { -- | URL based identity of the vessel, if available.
    _sarUrl :: Maybe Url
  -- | MMSI number of the vessel, if available.
  , _sarMmsi ;; Maybe Mmsi
  -- | A unique Signal K flavoured maritime resource identifier, assigned by the server.
  , _sarUuid :: Maybe Uuid
  -- | Communication data including Radio, Telephone, E-Mail, etc.
  , _sarCommunication :: Communication
  -- | "Navigation data including Position, Course to next WP information, etc.
  , _sarNavigation :: Navigation
  -- | Notifications currently raised. Major categories have well-defined names,
  -- | but the tree can be extended by any hierarchical structure
  , _sarNotifications :: Notifications
  }
