module SignalK.Data.SignalK where

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
