import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure LuenbergerObserverPackage where
  stateDim : Nat
  outputDim : Nat
  dynamicsMatrix : Matrix (Fin stateDim) (Fin stateDim) ℝ
  outputMatrix : Matrix (Fin outputDim) (Fin stateDim) ℝ
  gainMatrix : Matrix (Fin stateDim) (Fin outputDim) ℝ
  errorDynamics : Matrix (Fin stateDim) (Fin stateDim) ℝ
  errorStable : Prop
  observerConvergence : Prop

structure LuenbergerObserverEvidence (L : LuenbergerObserverPackage) where
  errorDynamicsComputed : L.errorDynamics = L.dynamicsMatrix - L.gainMatrix * L.outputMatrix
  errorStableClosed : L.errorStable
  observerConvergenceClosed : L.observerConvergence

def LuenbergerObserverClosed (L : LuenbergerObserverPackage) : Prop :=
  L.errorStable ∧ L.observerConvergence

theorem luenberger_observer_closed_from_evidence
    (L : LuenbergerObserverPackage) (E : LuenbergerObserverEvidence L) :
    LuenbergerObserverClosed L :=
by
  exact And.intro E.errorStableClosed E.observerConvergenceClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse