local API = require('api')
local class = require('middleclass')

local api = API()
local Transaction = class('Transaction')


function Transaction:get_transaction(id)
  -- Get a single transaction.
  -- :param id: Valid transaction ID.
  return api:get("api/transactions/get", {id=id})
end


function Transaction:get_transactions(...)
  -- Get all transactions.
  -- :param ...: Optionnal parameters. blockId, limit, orderBy, offset, senderPublicKey, vendorField, ownerPublicKey, 
  -- ownerAddress, senderId, recipientId, amount, fee
  local query_parameters = ...
  return api:get("api/transactions", query_parameters)
end


function Transaction:get_unconfirmed_transaction(id)
  -- Get a single unconfirmed transaction.
  -- :param id: Valid transaction ID.
  return api:get("api/transactions/unconfirmed/get", {id=id})
end


function Transaction:get_unconfirmed_transactions(...)
  -- Get all unconfirmed transactions.
  -- :param ...: Optionnal parameters. senderPublicKey, address.
  local query_parameters = ...
  return api:get("api/transactions/unconfirmed", query_parameters)
end

return Transaction