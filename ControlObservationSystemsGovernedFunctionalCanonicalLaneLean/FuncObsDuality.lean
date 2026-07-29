import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure DualityPackage (A : AdmissibleClass) where
  primalFunctional : (A.object.stateSpace → ℝ) → ℝ
  dualFunctional : (A.object.stateSpace → ℝ) → ℝ
  dualityGap : Prop
  strongDuality : Prop

structure DualityEvidence (A : AdmissibleClass) (D : DualityPackage A) where
  dualityGapClosed : D.dualityGap
  strongDualityClosed : D.strongDuality

def DualityClosed (A : AdmissibleClass) (D : DualityPackage A) : Prop :=
  D.strongDuality

theorem duality_closed_from_evidence (A : AdmissibleClass) (D : DualityPackage A) (E : DualityEvidence A D) :
    DualityClosed A D := by
  exact E.strongDualityClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse