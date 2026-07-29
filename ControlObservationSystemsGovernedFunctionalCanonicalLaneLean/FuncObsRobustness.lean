import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure RobustnessPackage (A : AdmissibleClass) where
  perturbationModel : Set (A.object.stateSpace → ℝ)
  performanceGuarantee : Prop
  worstCaseBound : Prop
  robustnessMargin : ℝ

structure RobustnessEvidence (A : AdmissibleClass) (R : RobustnessPackage A) where
  performanceGuaranteeClosed : R.performanceGuarantee
  worstCaseBoundClosed : R.worstCaseBound

def RobustnessClosed (A : AdmissibleClass) (R : RobustnessPackage A) : Prop :=
  R.worstCaseBound

theorem robustness_closed_from_evidence (A : AdmissibleClass) (R : RobustnessPackage A) (E : RobustnessEvidence A R) :
    RobustnessClosed A R := by
  exact E.worstCaseBoundClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse