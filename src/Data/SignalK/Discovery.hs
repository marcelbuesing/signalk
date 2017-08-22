module SignalK.Data.Discovery where

-- | SignalK discovery resources used to locate server endpoints.
data Discovery = Discovery
  { -- | The set of endpoints known to this server
    _discoveryEndpoints :: Endpoints
  }

-- | The set of endpoints known to this server
data Endpoints = Endpoints
  { -- | The version this group supports
    _endpointsVersion :: Version
  -- | The URL of a HTTP(s) REST API endpoint e.g. http://localhost/signalk/v1/api/
  , _endpointsSignalKHttp :: Maybe URL
  -- | The URL of a WebSocket streaming endpoint e.g. http://localhost/signalk/v1/stream
  , _endpointsSignalKWs :: Maybe URL
  -- | The URL of a tcp socket streaming endpoint e.g. tcp://localhost:55555
  , _endpointsSignalKTcp :: Maybe URL
  }
