# StayWithSomnia Token (SWS)

ERC20 smart contract for **Somnia Network** — a community-driven token representing loyalty and long-term support for the Somnia ecosystem.

---

## 🧠 Overview

**StayWithSomnia (SWS)** is a custom ERC20 token deployed on the **Somnia Mainnet**.  
It includes flexible features for managing supply, deposit/withdraw system, and adjustable parameters — all fully controlled by the contract owner.

### ✨ Features
- 🪙 **Editable Token Name & Symbol** — Owner can change the name and symbol anytime.
- 💰 **Deposit to Earn Tokens** — Users can deposit native SOM and automatically receive SWS tokens.
- 🔥 **Burn Function** — Owner can manually reduce token supply.
- 💸 **Withdraw Function** — Owner can withdraw native SOM from the contract.
- ⚙️ **Adjustable Deposit Rate** — Owner can set the conversion rate between SOM and SWS tokens.

---

## ⚙️ Contract Details

| Item | Description |
|------|--------------|
| **Network** | Somnia Mainnet |
| **Name** | StayWithSomnia |
| **Symbol** | SWS |
| **Language** | Solidity ^0.8.17 |
| **License** | MIT |
| **Framework** | [OpenZeppelin ERC20](https://github.com/OpenZeppelin/openzeppelin-contracts) |

---

## 🚀 Deployment Guide (via Remix)

1. Open [Remix IDE](https://remix.ethereum.org)
2. Connect MetaMask → switch to **Somnia Mainnet**
3. Open file `Somniatoken_fixed.sol`
4. Click **Compile** (Solidity 0.8.17)
5. Go to **Deploy & Run Transactions**
6. Set parameters:
   - `initialName`: `"StayWithSomnia"`
   - `initialSymbol`: `"SWS"`
   - `initialSupply`: `1000000000000000000000000000` (example: 1B tokens)
   - `initialDepositRate`: `1`
7. Click **Transact** and confirm in MetaMask.

---

## 💵 Functions Overview

| Function | Description |
|-----------|-------------|
| `setName(string)` | Change token name |
| `setSymbol(string)` | Change token symbol |
| `mint(address, uint256)` | Mint new tokens |
| `burn(address, uint256)` | Burn existing tokens |
| `deposit()` | Deposit SOM to receive SWS |
| `withdrawNative(address,uint256)` | Withdraw SOM from contract |
| `setDepositRate(uint256)` | Adjust token reward rate |
| `rescueERC20(address,address,uint256)` | Recover stuck ERC20 tokens |

---

## 👑 Owner Permissions

Only the **contract owner** (deployer address) can:
- Change token name/symbol  
- Mint or burn tokens  
- Adjust deposit rate  
- Withdraw native SOM  

---

## 🧰 Tech Stack
- Solidity ^0.8.17  
- OpenZeppelin ERC20 Library  
- Remix IDE  
- MetaMask  
- GitHub version control  

---

## 📄 License
This project is licensed under the **MIT License** — you are free to modify, share, and deploy it.

---

💙 Built for the **Somnia community**  
> _“Stay loyal, stay with Somnia — SWS forever.”_
