module SignalK.Data.Subscribe where

import Data.Time.Clock (DiffTime)

data Subscribe = Subscribe
  { -- | The root path for all subsequent paths, usually a vessel's path.
    _subscribeContext :: Context
  -- | An optional session key that is used in STOMP and MQTT messages where there are no session facilitie
  , _subscribeWebsocketConnectionKey :: Maybe WSConnectionKey
  -- | A reply queue that is used in STOMP and MQTT messages where there are no session facilities.
  , _subscribeReplyTo :: Text
  -- | An array of paths to subscribe to, with optional criteria.
  , _subscribeSubscribe :: []
  }

data Format = Format | Delta

data Policy = Instant | Ideal | Fixed

data PathObject = PathObject
  { -- | The path to subscribe to
    _pathObjectPath :: Text
  -- | The subscription will be sent every period millisecs.
  , _pathObjectPeriod :: DiffTime
  -- | The signal K format to use (full/delta) for the message.
  , _pathObjectFormat :: Format
  -- | The policy for sending messages (instant/ideal/fixed).
  , _pathObjectPolicy :: Policy
  -- | If policy=immediate or ideal, consequetive messages will be
  -- | buffered until minPeriod has expired so the reciever is not swamped.
  , _pathObjectMinPeriod :: DiffTime
  }
