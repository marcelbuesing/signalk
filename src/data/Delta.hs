module SignalK.Data.Delta where

import Data.Aeson.Types (Value)
import qualified Data.Text as T

data Delta = Delta
  { -- | The context path of the updates, eg. the top level path plus object identifier.
    _deltaContext :: T.Text
  -- | The updates
  , _deltaUpdates :: [Update]
  -- TODO flatten JSON items
  -- | A subscription request
  , _deltaSubscribe :: [Subscription]
  -- TODO flatten JSON items
  -- | An unsubscribe request.
  , _deltaUnsubscribe :: [Unsubscribe]
  -- TODO flatten JSON items
  -- | A websockets equivalent to a REST GET request.This is for one-off requests,
  -- | use the subscribe message for regular changes.
  , _deltaGet :: Get
  -- TODO flatten JSON items
  -- | Gets a list of known keys for this path
  , _deltaList :: [Path]
  -- TODO flatten JSON items
  -- | A websockets equivalent to a REST PUT request. This is for one-off
  -- | changes, use the updates message for regular changes.
  , _deltaPut :: [Put]
  }

data Update = Update
  { _updateSourceRef :: SourceRef
  , _updateSource :: Source
  , _updateTimestamp :: Timestamp
  , _updateValues :: [UpdateVal]
  }

data UpdateVal = UpdateVal
  { _updateValPath :: T.Text
  , _updateValValue :: Value
  }

-- | A subscription request
data Subscription = Subscription
  { -- | The relative path of the subscription,  supports jsonPath syntax for complex matches
    _subscriptionPath :: Path
  -- | The period to repeat the message in millisecs
  , _subscriptionPeriod :: Maybe DiffTime
  -- | The message format for periodic messages
  , _subscriptionFormat :: Maybe Format
  -- | The policy rules for repetition. [instant]=send all changes as fast as they are received,
  -- | but no faster than minPeriod. [ideal]=use instant policy, but send the value every `period`
  -- |millisecs anyway, whether changed or not. [fixed]=send the last known values every period.
  , _subscriptionPolicy :: Maybe Policy
  -- | The the fastest message transmission rate allowed, e.g. every `minPeriod/1000` seconds.
  , _subscriptionMinPeriod :: Maybe DiffTime
  }

-- | An unsubscribe request.
data Unsubscribe = Unsubscribe
  { -- | The relative path to unsubscribe,  supports jsonPath syntax for complex matches
    _subscriptionPath :: Path
  -- | The period to repeat the message in millisecs
  , _subscriptionPeriod :: Maybe DiffTime
  -- | The message format for periodic messages
  , _subscriptionFormat :: Maybe Format
  -- | The policy rules for repetition. [instant]=send all changes as fast as they are received,
  -- | but no faster than minPeriod. [ideal]=use instant policy, but send the value every `period`
  -- |millisecs anyway, whether changed or not. [fixed]=send the last known values every period.
  , _subscriptionPolicy :: Maybe Policy
  -- | The the fastest message transmission rate allowed, e.g. every `minPeriod/1000` seconds.
  , _subscriptionMinPeriod :: Maybe DiffTime
  }

  -- | A websockets equivalent to a REST PUT request. This is for one-off
  -- | changes, use the updates message for regular changes.
data Put = Put
  { -- | The relative path to set.
    _putPath :: Path
    -- | The value to set at the path"
  , _putValue :: Value
  }
