// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.6.12;

import {Errors} from '../libraries/helpers/Errors.sol';
import {ILendingPool} from '../../interfaces/ILendingPool.sol';
import {AToken} from './AToken.sol';

/**
 * @title Aave AToken enabled to delegate voting power of the underlying asset to a different address
 * @dev The underlying asset needs to be compatible with the COMP delegation interface
 * @author Aave
 */
contract DelegationAwareAToken is AToken {
  modifier onlyPoolAdmin {
    require(
      _msgSender() == ILendingPool(_pool).getAddressesProvider().getPoolAdmin(),
      Errors.CALLER_NOT_POOL_ADMIN
    );
    _;
  }


}
