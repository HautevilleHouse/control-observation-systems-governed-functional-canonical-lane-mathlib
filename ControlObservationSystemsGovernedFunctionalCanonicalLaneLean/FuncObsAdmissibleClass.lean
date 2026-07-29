import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure ControlledObservationObject where
  stateSpace : Type u
  observationMap : stateSpace → ℝⁿ
  functional : (stateSpace → ℝ) → ℝ
  constraintSet : Set (stateSpace → ℝ)

structure AdmissibleClass where
  object : ControlledObservationObject
  functionalClosed : Prop
  observationClosed : Prop
  gateWitness : functionalClosed ∨ observationClosed

def admittedClosure (A : AdmissibleClass) : Prop :=
  (bridgeClosed A) ∧ (gateClosed A)

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse