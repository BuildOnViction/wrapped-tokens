// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "../VRC25Permit.sol";

contract WrappedMOCA is VRC25Permit {
    using Address for address;
    event Hello(address sender);

    constructor() public VRC25("Wrapped MOCA", "WMOCA", 18) {
    }

    /**
     * @notice Calculate fee required for action related to this token
     * @param value Amount of fee
     */
    function _estimateFee(uint256 value) internal view override returns (uint256) {
        return minFee();
    }

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return interfaceId == type(IVRC25).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @notice Issues `amount` tokens to the designated `address`.
     *
     * Can only be called by the current owner.
     */
    function mint(address recipient, uint256 amount) external onlyOwner returns (bool) {
        _mint(recipient, amount);
        return true;
    }
}
