//
//  MutatorAnchorDefinition.swift
//  Orbcode
//
//  Created by Alexander Kozlovskij on 10.04.17.
//  Copyright © 2017 FZZR. All rights reserved.
//

import Foundation
import Blockly
import AEXML

/**
A mutator for dynamically modifying the properties of a "procedure" definition block.  MutatorAnchorDefinition
*/
public class MutatorAnchorDefinition: NSObject {
	// MARK: - Properties
	
	/// The target block that will be mutated
	public weak var block: Block?
	
	/// The associated layout of the mutator
	public weak var layout: MutatorLayout?
	
	/// Flag determining if this procedure returns a value
//	public let returnsValue: Bool
	
	/// The parameters of the procedure
//	public var parameters = [ProcedureParameter]()
	
	/// Flag determining if statements can be attached to this procedure.
	/// NOTE: This value is always `true` if `returnsValue` is `false`.
//	public var allowStatements: Bool = true {
//		didSet {
//			if !returnsValue {
//				allowStatements = true
//			}
//		}
//	}
	
	/// The actual parameters that have been applied to the procedure definition
//	fileprivate var appliedParameters = [ProcedureParameter]()
	
	/// Actual flag determining if statements can be attached to this procedure.
//	fileprivate var appliedAllowStatements: Bool = true
	
	// MARK: - Initializers
	
//	public init(returnsValue: Bool) {
//		self.returnsValue = returnsValue
//	}
	
//	public init() {}
}

extension MutatorAnchorDefinition: Mutator {
	// MARK: - Mutator Implementation
	
	public func mutateBlock() throws {
		guard let block = self.block else {
			return
		}
		
		// Update parameters label
//		if let field = block.firstField(withName: "PARAMS") as? FieldLabel {
//			field.text = (!parameters.isEmpty ? "with: " : "") +
//				parameters.map({ $0.name }).joined(separator: ", ")
		}
		
		// Update statement
//		let statementInput = block.firstInput(withName: "STACK")
//		if allowStatements && statementInput == nil {
//			// Add statement input
//			let statementBuilder = InputBuilder(type: .statement, name: "STACK")
//			
//			if let index = block.inputs.index(where: { $0.name == "RETURN" }) {
//				// Insert before "return" input
//				block.insertInput(statementBuilder.makeInput(), at: index)
//			} else {
//				// Append to the very end
//				block.appendInput(statementBuilder.makeInput())
//			}
//		} else if !allowStatements,
//			let input = statementInput
//		{
//			// Remove statement input
//			try block.removeInput(input)
//		}
	
		// Save the values that have been applied
//		appliedParameters = parameters
//		appliedAllowStatements = allowStatements
	}
	
	public func toXMLElement() -> AEXMLElement {
		let xml = AEXMLElement(name: "mutation", value: nil, attributes: [:])
		
//		for parameter in appliedParameters {
//			xml.addChild(name: "arg", value: nil, attributes: [
//				"name": parameter.name,
//				"id": parameter.uuid
//				])
//		}
		
//		xml.attributes["statements"] = !appliedAllowStatements ? "false" : "true"

		return xml
	}
	
	public func update(fromXML xml: AEXMLElement) {
//		let mutationXML = xml["mutation"]
		
//		parameters.removeAll()
//		for parameterXML in (mutationXML["arg"].all ?? []) {
//			if let parameter = parameterXML.attributes["name"] {
//				let uuid = parameterXML.attributes["id"]
//				parameters.append(ProcedureParameter(name: parameter, uuid: uuid))
//			}
//		}
		
		// NOTE: `allowStatements` defaults to true
//		if let statementsAttribute = xml.attributes["statements"]?.lowercased() {
//			allowStatements = statementsAttribute != "false"
//		} else {
//			// Defaults to `true`
//			allowStatements = true
//		}
	}
	
	public func copyMutator() -> Mutator {
		let mutator = MutatorAnchorDefinition()
//		let mutator = MutatorAnchorDefinition(returnsValue: returnsValue)
//		mutator.parameters = parameters
//		mutator.allowStatements = allowStatements
//		mutator.appliedParameters = appliedParameters
//		mutator.appliedAllowStatements = appliedAllowStatements
		return mutator
	}
	
	/**
	Returns a list of inputs that have been created by this mutator on `self.block`, sorted in
	ascending order of their index within `self.block.inputs`.
	*/
	public func sortedMutatorInputs() -> [Input] {
		guard let block = self.block else {
			return []
		}
		
		var inputs = [Input]()
		
		if let input = block.firstInput(withName: "STACK") {
			inputs.append(input)
		}
		
		return inputs
	}
}
