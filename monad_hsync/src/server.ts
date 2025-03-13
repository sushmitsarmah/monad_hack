import express from 'express';
import get_volumes from './get_volumes';
import wallet_tracker from './wallet_tracker';

const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Types
interface VolumeResponse {
  erc20Volume: Record<string, string>;
  weiVolume: Record<string, string>;
}

interface WalletResponse {
  transactions: any[];
}

interface ApiError {
  error: string;
}

// API Routes
app.post('/api/volumes', async (req: any, res: any) => {
  try {
    const { addresses } = req.body;
    
    if (!addresses || !Array.isArray(addresses)) {
      return res.status(400).json({ error: 'Invalid addresses array provided' });
    }

    const lowerCaseAddresses = addresses.map(addr => addr.toLowerCase());
    const result: VolumeResponse = await get_volumes(lowerCaseAddresses);
    res.json(result);
  } catch (error) {
    console.error('Error in txn-tracker:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.post('/api/wallet-txns', async (req: any, res: any) => {
  try {
    const { address } = req.body;
    
    if (!address || typeof address !== 'string') {
      return res.status(400).json({ error: 'Invalid address provided' });
    }

    const result: WalletResponse = await wallet_tracker(address.toLowerCase());
    res.json(result);
  } catch (error) {
    console.error('Error in reverse-wallet:', error);
    res.status(500).json({ 
      error: error instanceof Error ? error.message : 'Internal server error' 
    });
  }
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
}); 