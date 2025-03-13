export interface VolumeResponse {
  erc20Volume: Record<string, string>
  weiVolume: Record<string, string>
}

export interface WalletResponse {
  transactions: any[]
}
