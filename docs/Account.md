# Account









## Methods

### addDeposit

```solidity
function addDeposit() external payable
```

Deposit funds for this account in Entrypoint.




### contractURI

```solidity
function contractURI() external view returns (string)
```

Returns the contract metadata URI.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### entryPoint

```solidity
function entryPoint() external view returns (contract IEntryPoint)
```

Returns the EIP 4337 entrypoint contract.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IEntryPoint | undefined |

### execute

```solidity
function execute(address _target, uint256 _value, bytes _calldata) external nonpayable
```

Executes a transaction (called directly from an admin, or by entryPoint)



#### Parameters

| Name | Type | Description |
|---|---|---|
| _target | address | undefined |
| _value | uint256 | undefined |
| _calldata | bytes | undefined |

### executeBatch

```solidity
function executeBatch(address[] _target, uint256[] _value, bytes[] _calldata) external nonpayable
```

Executes a sequence transaction (called directly from an admin, or by entryPoint)



#### Parameters

| Name | Type | Description |
|---|---|---|
| _target | address[] | undefined |
| _value | uint256[] | undefined |
| _calldata | bytes[] | undefined |

### factory

```solidity
function factory() external view returns (address)
```

EIP 4337 factory for this contract.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getAllActiveSigners

```solidity
function getAllActiveSigners() external view returns (struct IAccountPermissions.SignerPermissions[] signers)
```

Returns all signers with active permissions to use the account.




#### Returns

| Name | Type | Description |
|---|---|---|
| signers | IAccountPermissions.SignerPermissions[] | undefined |

### getAllAdmins

```solidity
function getAllAdmins() external view returns (address[])
```

Returns all admins of the account.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### getAllSigners

```solidity
function getAllSigners() external view returns (struct IAccountPermissions.SignerPermissions[] signers)
```

Returns all active and inactive signers of the account.




#### Returns

| Name | Type | Description |
|---|---|---|
| signers | IAccountPermissions.SignerPermissions[] | undefined |

### getDeposit

```solidity
function getDeposit() external view returns (uint256)
```

Returns the balance of the account in Entrypoint.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getNonce

```solidity
function getNonce() external view returns (uint256)
```

Return the account nonce. This method returns the next sequential nonce. For a nonce of a specific key, use `entrypoint.getNonce(account, key)`




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getPermissionsForSigner

```solidity
function getPermissionsForSigner(address signer) external view returns (struct IAccountPermissions.SignerPermissions)
```

Returns the restrictions under which a signer can use the smart wallet.



#### Parameters

| Name | Type | Description |
|---|---|---|
| signer | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | IAccountPermissions.SignerPermissions | undefined |

### initialize

```solidity
function initialize(address _defaultAdmin, bytes) external nonpayable
```

Initializes the smart contract wallet.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _defaultAdmin | address | undefined |
| _1 | bytes | undefined |

### isActiveSigner

```solidity
function isActiveSigner(address signer) external view returns (bool)
```

Returns whether the given account is an active signer on the account.



#### Parameters

| Name | Type | Description |
|---|---|---|
| signer | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isAdmin

```solidity
function isAdmin(address _account) external view returns (bool)
```

Returns whether the given account is an admin.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isValidSignature

```solidity
function isValidSignature(bytes32 _hash, bytes _signature) external view returns (bytes4 magicValue)
```

See EIP-1271



#### Parameters

| Name | Type | Description |
|---|---|---|
| _hash | bytes32 | undefined |
| _signature | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| magicValue | bytes4 | undefined |

### isValidSigner

```solidity
function isValidSigner(address _signer, UserOperation _userOp) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _signer | address | undefined |
| _userOp | UserOperation | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### multicall

```solidity
function multicall(bytes[] data) external nonpayable returns (bytes[] results)
```

Receives and executes a batch of function calls on this contract.

*Receives and executes a batch of function calls on this contract.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| data | bytes[] | The bytes data that makes up the batch of function calls to execute. |

#### Returns

| Name | Type | Description |
|---|---|---|
| results | bytes[] | The bytes data that makes up the result of the batch of function calls executed. |

### onERC1155BatchReceived

```solidity
function onERC1155BatchReceived(address, address, uint256[], uint256[], bytes) external nonpayable returns (bytes4)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256[] | undefined |
| _3 | uint256[] | undefined |
| _4 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### onERC1155Received

```solidity
function onERC1155Received(address, address, uint256, uint256, bytes) external nonpayable returns (bytes4)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256 | undefined |
| _3 | uint256 | undefined |
| _4 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### onERC721Received

```solidity
function onERC721Received(address, address, uint256, bytes) external nonpayable returns (bytes4)
```



*See {IERC721Receiver-onERC721Received}. Always returns `IERC721Receiver.onERC721Received.selector`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256 | undefined |
| _3 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### setAdmin

```solidity
function setAdmin(address _account, bool _isAdmin) external nonpayable
```

Adds / removes an account as an admin.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _account | address | undefined |
| _isAdmin | bool | undefined |

### setContractURI

```solidity
function setContractURI(string _uri) external nonpayable
```

Lets a contract admin set the URI for contract-level metadata.

*Caller should be authorized to setup contractURI, e.g. contract admin.                  See {_canSetContractURI}.                  Emits {ContractURIUpdated Event}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _uri | string | keccak256 hash of the role. e.g. keccak256(&quot;TRANSFER_ROLE&quot;) |

### setPermissionsForSigner

```solidity
function setPermissionsForSigner(IAccountPermissions.SignerPermissionRequest _req, bytes _signature) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _req | IAccountPermissions.SignerPermissionRequest | undefined |
| _signature | bytes | undefined |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

See {IERC165-supportsInterface}.



#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### validateUserOp

```solidity
function validateUserOp(UserOperation userOp, bytes32 userOpHash, uint256 missingAccountFunds) external nonpayable returns (uint256 validationData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| userOp | UserOperation | undefined |
| userOpHash | bytes32 | undefined |
| missingAccountFunds | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| validationData | uint256 | undefined |

### verifySignerPermissionRequest

```solidity
function verifySignerPermissionRequest(IAccountPermissions.SignerPermissionRequest req, bytes signature) external view returns (bool success, address signer)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| req | IAccountPermissions.SignerPermissionRequest | undefined |
| signature | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |
| signer | address | undefined |

### withdrawDepositTo

```solidity
function withdrawDepositTo(address payable withdrawAddress, uint256 amount) external nonpayable
```

Withdraw funds for this account from Entrypoint.



#### Parameters

| Name | Type | Description |
|---|---|---|
| withdrawAddress | address payable | undefined |
| amount | uint256 | undefined |



## Events

### AdminUpdated

```solidity
event AdminUpdated(address indexed signer, bool isAdmin)
```

Emitted when an admin is set or removed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| signer `indexed` | address | undefined |
| isAdmin  | bool | undefined |

### ContractURIUpdated

```solidity
event ContractURIUpdated(string prevURI, string newURI)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| prevURI  | string | undefined |
| newURI  | string | undefined |

### Initialized

```solidity
event Initialized(uint8 version)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| version  | uint8 | undefined |

### SignerPermissionsUpdated

```solidity
event SignerPermissionsUpdated(address indexed authorizingSigner, address indexed targetSigner, IAccountPermissions.SignerPermissionRequest permissions)
```

Emitted when permissions for a signer are updated.



#### Parameters

| Name | Type | Description |
|---|---|---|
| authorizingSigner `indexed` | address | undefined |
| targetSigner `indexed` | address | undefined |
| permissions  | IAccountPermissions.SignerPermissionRequest | undefined |



