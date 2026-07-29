import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure ObservabilityPackage (A : AdmissibleClass) where
  observableSubspace : Set (A.object.stateSpace → ℝ)
  detector : (A.object.stateSpace → ℝ) → Prop
  detectabilityCriterion : Prop
  detectorClosed : detector (fun x => 0) → detectabilityCriterion

structure ObservabilityEvidence (A : AdmissibleClass) (O : ObservabilityPackage A) where
  observableSubspaceClosed : O.observableSubspace = Set.univ
  detectabilityCriterionClosed : O.detectabilityCriterion

def ObservabilityClosed (A : AdmissibleClass) (O : ObservabilityPackage A) : Prop :=
  O.detectabilityCriterion

theorem observability_closed_from_evidence (A : AdmissibleClass) (O : ObservabilityPackage A) (E : ObservabilityEvidence A O) :
    ObservabilityClosed A O := by
  exact E.detectabilityCriterionClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse