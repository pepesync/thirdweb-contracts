// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.11;

/// @author thirdweb

import "../../extension/interface/IRulesEngine.sol";

import "../../eip/interface/IERC20.sol";
import "../../eip/interface/IERC721.sol";
import "../../eip/interface/IERC1155.sol";

import "../../openzeppelin-presets/utils/structs/EnumerableSet.sol";

library RulesEngineStorage {
    bytes32 public constant RULES_ENGINE_STORAGE_POSITION = keccak256("rules.engine.storage");

    struct Data {
        address rulesEngineOverride;
        EnumerableSet.Bytes32Set ids;
        mapping(bytes32 => IRulesEngine.RuleWithId) rules;
    }

    function rulesEngineStorage() internal pure returns (Data storage rulesEngineData) {
        bytes32 position = RULES_ENGINE_STORAGE_POSITION;
        assembly {
            rulesEngineData.slot := position
        }
    }
}

abstract contract RulesEngine is IRulesEngine {
    using EnumerableSet for EnumerableSet.Bytes32Set;

    /*///////////////////////////////////////////////////////////////
                            View functions
    //////////////////////////////////////////////////////////////*/

    function getScore(address _tokenOwner) public view returns (uint256 score) {
        address engineOverride = getRulesEngineOverride();
        if (engineOverride != address(0)) {
            return IRulesEngine(engineOverride).getScore(_tokenOwner);
        }

        bytes32[] memory ids = _rulesEngineStorage().ids.values();
        uint256 len = ids.length;

        for (uint256 i = 0; i < len; i += 1) {
            RuleWithId memory rule = _rulesEngineStorage().rules[ids[i]];
            score += _getScoreForRule(_tokenOwner, rule);
        }
    }

    function getAllRules() external view returns (RuleWithId[] memory rules) {
        bytes32[] memory ids = _rulesEngineStorage().ids.values();
        uint256 len = ids.length;

        rules = new RuleWithId[](len);

        for (uint256 i = 0; i < len; i += 1) {
            rules[i] = _rulesEngineStorage().rules[ids[i]];
        }
    }

    function getRulesEngineOverride() public view returns (address rulesEngineAddress) {
        rulesEngineAddress = _rulesEngineStorage().rulesEngineOverride;
    }

    /*///////////////////////////////////////////////////////////////
                            External functions
    //////////////////////////////////////////////////////////////*/

    function createRuleMulitiplicative(RuleTypeMultiplicative memory rule) external returns (bytes32 ruleId) {
        require(_canSetRules(), "RulesEngine: cannot set rules");

        ruleId = keccak256(
            abi.encodePacked(rule.token, rule.tokenType, rule.tokenId, rule.scorePerOwnedToken, RuleType.Multiplicative)
        );
        _createRule(
            RuleWithId(
                ruleId,
                rule.token,
                rule.tokenType,
                rule.tokenId,
                0, // balance
                rule.scorePerOwnedToken,
                RuleType.Multiplicative
            )
        );
    }

    function createRuleThreshold(RuleTypeThreshold memory rule) external returns (bytes32 ruleId) {
        require(_canSetRules(), "RulesEngine: cannot set rules");

        ruleId = keccak256(
            abi.encodePacked(rule.token, rule.tokenType, rule.tokenId, rule.balance, rule.score, RuleType.Threshold)
        );
        _createRule(
            RuleWithId(ruleId, rule.token, rule.tokenType, rule.tokenId, rule.balance, rule.score, RuleType.Threshold)
        );
    }

    function deleteRule(bytes32 _ruleId) external {
        require(_canSetRules(), "RulesEngine: cannot set rules");
        _deleteRule(_ruleId);
    }

    /*///////////////////////////////////////////////////////////////
                            Internal functions
    //////////////////////////////////////////////////////////////*/

    function _getScoreForRule(address _tokenOwner, RuleWithId memory _rule) internal view returns (uint256 score) {
        uint256 balance = 0;

        if (_rule.tokenType == TokenType.ERC20) {
            balance = IERC20(_rule.token).balanceOf(_tokenOwner);
        } else if (_rule.tokenType == TokenType.ERC721) {
            balance = IERC721(_rule.token).balanceOf(_tokenOwner);
        } else if (_rule.tokenType == TokenType.ERC1155) {
            balance = IERC1155(_rule.token).balanceOf(_tokenOwner, _rule.tokenId);
        }

        if (_rule.ruleType == RuleType.Threshold) {
            if (balance >= _rule.balance) {
                score = _rule.score;
            }
        } else if (_rule.ruleType == RuleType.Multiplicative) {
            score = balance * _rule.score;
        }
    }

    function _createRule(RuleWithId memory _rule) internal {
        require(_rulesEngineStorage().ids.add(_rule.ruleId), "RulesEngine: rule already exists");
        _rulesEngineStorage().rules[_rule.ruleId] = _rule;
        emit RuleCreated(_rule.ruleId, _rule);
    }

    function _deleteRule(bytes32 _ruleId) internal {
        require(_rulesEngineStorage().ids.remove(_ruleId), "RulesEngine: rule already exists");
        delete _rulesEngineStorage().rules[_ruleId];
        emit RuleDeleted(_ruleId);
    }

    function setRulesEngineOverride(address _rulesEngineAddress) external {
        require(_canOverrieRulesEngine(), "RulesEngine: cannot override rules engine");
        _rulesEngineStorage().rulesEngineOverride = _rulesEngineAddress;

        emit RulesEngineOverriden(_rulesEngineAddress);
    }

    function _rulesEngineStorage() internal pure returns (RulesEngineStorage.Data storage data) {
        data = RulesEngineStorage.rulesEngineStorage();
    }

    function _canSetRules() internal view virtual returns (bool);

    function _canOverrieRulesEngine() internal view virtual returns (bool);
}
