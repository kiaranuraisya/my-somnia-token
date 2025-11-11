// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SomniaToken is ERC20, Ownable {
    string private _customName;
        string private _customSymbol;
            uint256 public depositRate;

                event NameChanged(string oldName, string newName);
                    event SymbolChanged(string oldSymbol, string newSymbol);
                        event Deposit(address indexed from, uint256 nativeAmount, uint256 mintedTokens);
                            event Withdraw(address indexed to, uint256 amount);
                                event RateChanged(uint256 oldRate, uint256 newRate);

                                    constructor(
                                            string memory initialName,
                                                    string memory initialSymbol,
                                                            uint256 initialSupply,
                                                                    uint256 initialDepositRate
                                                                        ) ERC20(initialName, initialSymbol) {
                                                                                _customName = initialName;
                                                                                        _customSymbol = initialSymbol;
                                                                                                depositRate = initialDepositRate;

                                                                                                        if (initialSupply > 0) {
                                                                                                                    _mint(msg.sender, initialSupply);
                                                                                                                            }
                                                                                                                                }

                                                                                                                                    function name() public view override returns (string memory) {
                                                                                                                                            return _customName;
                                                                                                                                                }

                                                                                                                                                    function symbol() public view override returns (string memory) {
                                                                                                                                                            return _customSymbol;
                                                                                                                                                                }

                                                                                                                                                                    function setName(string memory newName) external onlyOwner {
                                                                                                                                                                            string memory old = _customName;
                                                                                                                                                                                    _customName = newName;
                                                                                                                                                                                            emit NameChanged(old, newName);
                                                                                                                                                                                                }

                                                                                                                                                                                                    function setSymbol(string memory newSymbol) external onlyOwner {
                                                                                                                                                                                                            string memory old = _customSymbol;
                                                                                                                                                                                                                    _customSymbol = newSymbol;
                                                                                                                                                                                                                            emit SymbolChanged(old, newSymbol);
                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                    function mint(address to, uint256 amount) external onlyOwner {
                                                                                                                                                                                                                                            _mint(to, amount);
                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                    function burn(address from, uint256 amount) external onlyOwner {
                                                                                                                                                                                                                                                            _burn(from, amount);
                                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                                    receive() external payable {
                                                                                                                                                                                                                                                                            _handleDeposit(msg.sender, msg.value);
                                                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                                                    fallback() external payable {
                                                                                                                                                                                                                                                                                            _handleDeposit(msg.sender, msg.value);
                                                                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                                                                    function deposit() external payable returns (uint256 minted) {
                                                                                                                                                                                                                                                                                                            _handleDeposit(msg.sender, msg.value);
                                                                                                                                                                                                                                                                                                                    return msg.value * depositRate;
                                                                                                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                                                                                                            function _handleDeposit(address user, uint256 nativeAmount) internal {
                                                                                                                                                                                                                                                                                                                                    require(nativeAmount > 0, "No native value sent");
                                                                                                                                                                                                                                                                                                                                            uint256 tokensToMint = nativeAmount * depositRate;
                                                                                                                                                                                                                                                                                                                                                    _mint(user, tokensToMint);
                                                                                                                                                                                                                                                                                                                                                            emit Deposit(user, nativeAmount, tokensToMint);
                                                                                                                                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                                                                                                                                    function withdrawNative(address payable to, uint256 amount) external onlyOwner {
                                                                                                                                                                                                                                                                                                                                                                            require(address(this).balance >= amount, "Insufficient balance");
                                                                                                                                                                                                                                                                                                                                                                                    (bool ok, ) = to.call{value: amount}("");
                                                                                                                                                                                                                                                                                                                                                                                            require(ok, "Transfer failed");
                                                                                                                                                                                                                                                                                                                                                                                                    emit Withdraw(to, amount);
                                                                                                                                                                                                                                                                                                                                                                                                        }

                                                                                                                                                                                                                                                                                                                                                                                                            function setDepositRate(uint256 newRate) external onlyOwner {
                                                                                                                                                                                                                                                                                                                                                                                                                    emit RateChanged(depositRate, newRate);
                                                                                                                                                                                                                                                                                                                                                                                                                            depositRate = newRate;
                                                                                                                                                                                                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                                                                                                                                                                                                    function rescueERC20(address tokenAddress, address to, uint256 amount) external onlyOwner {
                                                                                                                                                                                                                                                                                                                                                                                                                                            IERC20(tokenAddress).transfer(to, amount);
                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                }