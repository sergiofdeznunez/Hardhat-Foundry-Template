//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract Storage {

  bytes32 public constant storage_admin = keccak256("strg.admin");
  //address allowed to call some functions with onlyAdmin restrictions
  bytes32 public constant contract_admin = keccak256("strg.contact.admin");
  //address of the storage upgrade (if required)
  bytes32 public constant strg_next = keccak256("strg.next");

  uint256 public token_ID;

  constructor() {
    bytes32 position = storage_admin;
    address admin = _msg_Sender();
    assembly {
        sstore(position, admin)
    }
    position = contract_admin;
    assembly {
        sstore(position, admin)
    }
    token_ID = 0;
  }
  /**
  * @dev Setter of 'storage_admin' 
  */
  function setNewAdmin(address _newAdmin) public onlyAdmin {
    bytes32 position = storage_admin;
    address admin;
    assembly {
        admin := sload(position)
    }
    require(admin != _newAdmin, "this is already the storage admin");
    assembly {
        sstore(position, _newAdmin)
    }
  }
  /**
  * @dev Setter of 'contract_admin' 
  */
  function setNewContractAdmin(address _newAdmin) public onlyAdmin {
    bytes32 position = contract_admin;
    address admin;
    assembly {
        admin := sload(position)
    }
    require(admin != _newAdmin, "this is already the contract admin");
    assembly {
        sstore(position, _newAdmin)
    }
  }
  /** 
  * @dev Setter of 'strg_next'
  */
  function setStrgNext(address _strgNext) public onlyAdmin {
    bytes32 position = strg_next;
    address strg;
    assembly {
        strg := sload(position)
    }
    require(strg != _strgNext, "this is already the storage upgrade");
    assembly {
        sstore(position, _strgNext)
    }
  }
  /**
  * @dev called by 'contract_admin' when a token is minted in the logic contract and saves the new token data
  */
  function add(/* what you need */) public onlyContractAdmin {
      /**
      * @dev your logic go here
      */
  }
  /**
  * @dev Returns the admins
  */
  function getAdmins() public view returns (address admin0, address admin1) {
    bytes32 position0 = storage_admin;
    bytes32 position1 = contract_admin;
    assembly {
        admin0 := sload(position0)
        admin1 := sload(position1)
        }
    }
  /**
  * @dev Returns true if exists
  */
  function _exists(uint256 tokenId) public view returns (bool) {
    }

  function _msg_Sender() internal view returns (address) {
      return msg.sender;
    }

    fallback() external payable {
        bytes32 position = strg_next;
    assembly {
      let _target := sload(position)
      calldatacopy(0x0, 0x0, calldatasize())
      let result := delegatecall(gas(), _target, 0x0, calldatasize(), 0x0, 0)
      returndatacopy(0x0, 0x0, returndatasize())
      switch result 
      case 0 {revert(0, returndatasize())} 
      default {return (0, returndatasize())}
        }
    }

  modifier onlyAdmin() {
      bytes32 position = storage_admin;
      address admin;
    assembly {
        admin := sload(position)
    }
    require(admin == _msg_Sender());
    _;
  }

  modifier onlyContractAdmin() {
      bytes32 position = contract_admin;
      address admin;
      assembly {
        admin := sload(position)
      }
    require(admin == _msg_Sender());
    _;
  }
}