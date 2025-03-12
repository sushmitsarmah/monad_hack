import assert from "assert";
import { 
  TestHelpers,
  FiatTokenProxy_AdminChanged
} from "generated";
const { MockDb, FiatTokenProxy } = TestHelpers;

describe("FiatTokenProxy contract AdminChanged event tests", () => {
  // Create mock db
  const mockDb = MockDb.createMockDb();

  // Creating mock for FiatTokenProxy contract AdminChanged event
  const event = FiatTokenProxy.AdminChanged.createMockEvent({/* It mocks event fields with default values. You can overwrite them if you need */});

  it("FiatTokenProxy_AdminChanged is created correctly", async () => {
    // Processing the event
    const mockDbUpdated = await FiatTokenProxy.AdminChanged.processEvent({
      event,
      mockDb,
    });

    // Getting the actual entity from the mock database
    let actualFiatTokenProxyAdminChanged = mockDbUpdated.entities.FiatTokenProxy_AdminChanged.get(
      `${event.chainId}_${event.block.number}_${event.logIndex}`
    );

    // Creating the expected entity
    const expectedFiatTokenProxyAdminChanged: FiatTokenProxy_AdminChanged = {
      id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
      previousAdmin: event.params.previousAdmin,
      newAdmin: event.params.newAdmin,
    };
    // Asserting that the entity in the mock database is the same as the expected entity
    assert.deepEqual(actualFiatTokenProxyAdminChanged, expectedFiatTokenProxyAdminChanged, "Actual FiatTokenProxyAdminChanged should be the same as the expectedFiatTokenProxyAdminChanged");
  });
});
