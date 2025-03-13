
const assert = require("assert");
const { TestHelpers } = require("generated");
const { MockDb, L1ChugSplashProxy } = TestHelpers;

describe("L1ChugSplashProxy contract ERC20BridgeFinalized event tests", () => {
  // Create mock db
  const mockDb = MockDb.createMockDb();

  // Creating mock for L1ChugSplashProxy contract ERC20BridgeFinalized event
  const event = L1ChugSplashProxy.ERC20BridgeFinalized.createMockEvent({/* It mocks event fields with default values. You can overwrite them if you need */});

  it("L1ChugSplashProxy_ERC20BridgeFinalized is created correctly", async () => {
    // Processing the event
    const mockDbUpdated = await L1ChugSplashProxy.ERC20BridgeFinalized.processEvent({
      event,
      mockDb,
    });

    // Getting the actual entity from the mock database
    let actualL1ChugSplashProxyERC20BridgeFinalized = mockDbUpdated.entities.L1ChugSplashProxy_ERC20BridgeFinalized.get(
      `${event.chainId}_${event.block.number}_${event.logIndex}`
    );

    // Creating the expected entity
    const expectedL1ChugSplashProxyERC20BridgeFinalized = {
      id:`${event.chainId}_${event.block.number}_${event.logIndex}`,
      localToken: event.params.localToken,
      remoteToken: event.params.remoteToken,
      from: event.params.from,
      to: event.params.to,
      amount: event.params.amount,
      extraData: event.params.extraData,
    };
    // Asserting that the entity in the mock database is the same as the expected entity
    assert.deepEqual(
      actualL1ChugSplashProxyERC20BridgeFinalized,
      expectedL1ChugSplashProxyERC20BridgeFinalized,
      "Actual L1ChugSplashProxyERC20BridgeFinalized should be the same as the expectedL1ChugSplashProxyERC20BridgeFinalized"
    );
  });
});
