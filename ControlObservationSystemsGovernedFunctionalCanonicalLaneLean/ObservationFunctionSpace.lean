import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure ObservationFunctionPackage where
  stateSpace : Type u
  observationSpace : Type v
  systemDynamics : stateSpace → stateSpace
  observationMap : stateSpace → observationSpace
  functionalCost : (stateSpace → observationSpace) → Prop
  observabilityCondition : Prop

structure ObservationFunctionEvidence (O : ObservationFunctionPackage) where
  dynamicsWellDefined : Prop
  observationMapMeasurable : Prop
  functionalCostSatisfied : O.functionalCost O.observationMap
  observabilityConditionClosed : O.observabilityCondition

def ObservationFunctionClosed (O : ObservationFunctionPackage) : Prop :=
  O.observabilityCondition ∧ O.functionalCost O.observationMap

theorem observation_function_closed_from_evidence
    (O : ObservationFunctionPackage) (E : ObservationFunctionEvidence O) :
    ObservationFunctionClosed O :=
by
  exact And.intro E.observabilityConditionClosed E.functionalCostSatisfied

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse