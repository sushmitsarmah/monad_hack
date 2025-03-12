open Table
open Enums.EntityType
type id = string

type internalEntity = Internal.entity
module type Entity = {
  type t
  let name: Enums.EntityType.t
  let schema: S.t<t>
  let rowsSchema: S.t<array<t>>
  let table: Table.table
  let entityHistory: EntityHistory.t<t>
}
module type InternalEntity = Entity with type t = internalEntity
external entityModToInternal: module(Entity with type t = 'a) => module(InternalEntity) = "%identity"
external entityModsToInternal: array<module(Entity)> => array<module(InternalEntity)> = "%identity"

@get
external getEntityId: internalEntity => string = "id"

exception UnexpectedIdNotDefinedOnEntity
let getEntityIdUnsafe = (entity: 'entity): id =>
  switch Utils.magic(entity)["id"] {
  | Some(id) => id
  | None =>
    UnexpectedIdNotDefinedOnEntity->ErrorHandling.mkLogAndRaise(
      ~msg="Property 'id' does not exist on expected entity object",
    )
  }

//shorthand for punning
let isPrimaryKey = true
let isNullable = true
let isArray = true
let isIndex = true

@genType
type whereOperations<'entity, 'fieldType> = {
  eq: 'fieldType => promise<array<'entity>>,
  gt: 'fieldType => promise<array<'entity>>
}

module FiatTokenProxy_AdminChanged = {
  let name = FiatTokenProxy_AdminChanged
  @genType
  type t = {
    id: id,
    newAdmin: string,
    previousAdmin: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newAdmin: s.field("newAdmin", S.string),
    previousAdmin: s.field("previousAdmin", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newAdmin", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "previousAdmin", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Approval = {
  let name = FiatTokenProxy_Approval
  @genType
  type t = {
    id: id,
    owner: string,
    spender: string,
    value: bigint,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    owner: s.field("owner", S.string),
    spender: s.field("spender", S.string),
    value: s.field("value", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "owner", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "spender", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "value", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_AuthorizationCanceled = {
  let name = FiatTokenProxy_AuthorizationCanceled
  @genType
  type t = {
    authorizer: string,
    id: id,
    nonce: string,
  }

  let schema = S.object((s): t => {
    authorizer: s.field("authorizer", S.string),
    id: s.field("id", S.string),
    nonce: s.field("nonce", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "authorizer", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "nonce", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_AuthorizationUsed = {
  let name = FiatTokenProxy_AuthorizationUsed
  @genType
  type t = {
    authorizer: string,
    id: id,
    nonce: string,
  }

  let schema = S.object((s): t => {
    authorizer: s.field("authorizer", S.string),
    id: s.field("id", S.string),
    nonce: s.field("nonce", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "authorizer", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "nonce", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Blacklisted = {
  let name = FiatTokenProxy_Blacklisted
  @genType
  type t = {
    _account: string,
    id: id,
  }

  let schema = S.object((s): t => {
    _account: s.field("_account", S.string),
    id: s.field("id", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "_account", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_BlacklisterChanged = {
  let name = FiatTokenProxy_BlacklisterChanged
  @genType
  type t = {
    id: id,
    newBlacklister: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newBlacklister: s.field("newBlacklister", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newBlacklister", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Burn = {
  let name = FiatTokenProxy_Burn
  @genType
  type t = {
    amount: bigint,
    burner: string,
    id: id,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    burner: s.field("burner", S.string),
    id: s.field("id", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "burner", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_MasterMinterChanged = {
  let name = FiatTokenProxy_MasterMinterChanged
  @genType
  type t = {
    id: id,
    newMasterMinter: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newMasterMinter: s.field("newMasterMinter", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newMasterMinter", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Mint = {
  let name = FiatTokenProxy_Mint
  @genType
  type t = {
    amount: bigint,
    id: id,
    minter: string,
    to: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    minter: s.field("minter", S.string),
    to: s.field("to", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "minter", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "to", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_MinterConfigured = {
  let name = FiatTokenProxy_MinterConfigured
  @genType
  type t = {
    id: id,
    minter: string,
    minterAllowedAmount: bigint,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    minter: s.field("minter", S.string),
    minterAllowedAmount: s.field("minterAllowedAmount", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "minter", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "minterAllowedAmount", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_MinterRemoved = {
  let name = FiatTokenProxy_MinterRemoved
  @genType
  type t = {
    id: id,
    oldMinter: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    oldMinter: s.field("oldMinter", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "oldMinter", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_OwnershipTransferred = {
  let name = FiatTokenProxy_OwnershipTransferred
  @genType
  type t = {
    id: id,
    newOwner: string,
    previousOwner: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newOwner: s.field("newOwner", S.string),
    previousOwner: s.field("previousOwner", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newOwner", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "previousOwner", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Pause = {
  let name = FiatTokenProxy_Pause
  @genType
  type t = {
    id: id,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_PauserChanged = {
  let name = FiatTokenProxy_PauserChanged
  @genType
  type t = {
    id: id,
    newAddress: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newAddress: s.field("newAddress", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newAddress", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_RescuerChanged = {
  let name = FiatTokenProxy_RescuerChanged
  @genType
  type t = {
    id: id,
    newRescuer: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    newRescuer: s.field("newRescuer", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "newRescuer", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Transfer = {
  let name = FiatTokenProxy_Transfer
  @genType
  type t = {
    from: string,
    id: id,
    to: string,
    value: bigint,
  }

  let schema = S.object((s): t => {
    from: s.field("from", S.string),
    id: s.field("id", S.string),
    to: s.field("to", S.string),
    value: s.field("value", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "from", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "to", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "value", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_UnBlacklisted = {
  let name = FiatTokenProxy_UnBlacklisted
  @genType
  type t = {
    _account: string,
    id: id,
  }

  let schema = S.object((s): t => {
    _account: s.field("_account", S.string),
    id: s.field("id", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "_account", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Unpause = {
  let name = FiatTokenProxy_Unpause
  @genType
  type t = {
    id: id,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FiatTokenProxy_Upgraded = {
  let name = FiatTokenProxy_Upgraded
  @genType
  type t = {
    id: id,
    implementation: string,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    implementation: s.field("implementation", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "implementation", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module TokenMintERC20Token_Approval = {
  let name = TokenMintERC20Token_Approval
  @genType
  type t = {
    id: id,
    owner: string,
    spender: string,
    value: bigint,
  }

  let schema = S.object((s): t => {
    id: s.field("id", S.string),
    owner: s.field("owner", S.string),
    spender: s.field("spender", S.string),
    value: s.field("value", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "owner", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "spender", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "value", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module TokenMintERC20Token_Transfer = {
  let name = TokenMintERC20Token_Transfer
  @genType
  type t = {
    from: string,
    id: id,
    to: string,
    value: bigint,
  }

  let schema = S.object((s): t => {
    from: s.field("from", S.string),
    id: s.field("id", S.string),
    to: s.field("to", S.string),
    value: s.field("value", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
    (name :> string),
    ~schemaName=Env.Db.publicSchema,
    ~fields=[
      mkField(
      "from", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "to", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "value", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

let allEntities = [
  module(FiatTokenProxy_AdminChanged),
  module(FiatTokenProxy_Approval),
  module(FiatTokenProxy_AuthorizationCanceled),
  module(FiatTokenProxy_AuthorizationUsed),
  module(FiatTokenProxy_Blacklisted),
  module(FiatTokenProxy_BlacklisterChanged),
  module(FiatTokenProxy_Burn),
  module(FiatTokenProxy_MasterMinterChanged),
  module(FiatTokenProxy_Mint),
  module(FiatTokenProxy_MinterConfigured),
  module(FiatTokenProxy_MinterRemoved),
  module(FiatTokenProxy_OwnershipTransferred),
  module(FiatTokenProxy_Pause),
  module(FiatTokenProxy_PauserChanged),
  module(FiatTokenProxy_RescuerChanged),
  module(FiatTokenProxy_Transfer),
  module(FiatTokenProxy_UnBlacklisted),
  module(FiatTokenProxy_Unpause),
  module(FiatTokenProxy_Upgraded),
  module(TokenMintERC20Token_Approval),
  module(TokenMintERC20Token_Transfer),
  module(TablesStatic.DynamicContractRegistry),
]->entityModsToInternal
