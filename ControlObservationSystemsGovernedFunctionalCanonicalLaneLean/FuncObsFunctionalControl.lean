import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure FunctionalControlPackage (A : AdmissibleClass) where
  admissibleControls : Set (A.object.stateSpace → ℝ)
  costFunctional : (A.object.stateSpace → ℝ) → ℝ
  optimalityCondition : Prop
  constraintSatisfaction : Prop

structure FunctionalControlEvidence (A : AdmissibleClass) (F : FunctionalControlPackage A) where
  optimalityConditionClosed : F.optimalityCondition
  constraintSatisfactionClosed : F.constraintSatisfaction

def FunctionalControlClosed (A : AdmissibleClass) (F : FunctionalControlPackage A) : Prop :=
  F.optimalityCondition ∧ F.constraintSatisfaction

theorem functional_control_closed_from_evidence (A : AdmissibleClass) (F : FunctionalControlPackage A) (E : FunctionalControlEvidence A F) :
    FunctionalControlClosed A F := by
  exact And.intro E.optimalityConditionClosed E.constraintSatisfactionClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse