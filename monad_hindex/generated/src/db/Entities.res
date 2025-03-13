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

module CHOGTokenMintERC20Token_Approval = {
  let name = CHOGTokenMintERC20Token_Approval
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

module CHOGTokenMintERC20Token_Transfer = {
  let name = CHOGTokenMintERC20Token_Transfer
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

module DAKTokenMintERC20Token_Approval = {
  let name = DAKTokenMintERC20Token_Approval
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

module DAKTokenMintERC20Token_Transfer = {
  let name = DAKTokenMintERC20Token_Transfer
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

module WETHTokenMintERC20Token_Approval = {
  let name = WETHTokenMintERC20Token_Approval
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

module WETHTokenMintERC20Token_Transfer = {
  let name = WETHTokenMintERC20Token_Transfer
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

module YAKITokenMintERC20Token_Approval = {
  let name = YAKITokenMintERC20Token_Approval
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

module YAKITokenMintERC20Token_Transfer = {
  let name = YAKITokenMintERC20Token_Transfer
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
  module(CHOGTokenMintERC20Token_Approval),
  module(CHOGTokenMintERC20Token_Transfer),
  module(DAKTokenMintERC20Token_Approval),
  module(DAKTokenMintERC20Token_Transfer),
  module(WETHTokenMintERC20Token_Approval),
  module(WETHTokenMintERC20Token_Transfer),
  module(YAKITokenMintERC20Token_Approval),
  module(YAKITokenMintERC20Token_Transfer),
  module(TablesStatic.DynamicContractRegistry),
]->entityModsToInternal
