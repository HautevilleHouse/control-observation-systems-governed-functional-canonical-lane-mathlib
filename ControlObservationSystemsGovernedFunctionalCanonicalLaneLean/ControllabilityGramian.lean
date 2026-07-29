import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure ControllabilityGramianPackage where
  stateDim : Nat
  controlDim : Nat
  dynamicsMatrix : Matrix (Fin stateDim) (Fin stateDim) ℝ
  inputMatrix : Matrix (Fin stateDim) (Fin controlDim) ℝ
  gramianMatrix : Matrix (Fin stateDim) (Fin stateDim) ℝ
  positiveDefinite : Prop
  reachabilityEquivalent : Prop

structure ControllabilityGramianEvidence (G : ControllabilityGramianPackage) where
  gramianComputed : G.gramianMatrix = ∑ i in Finset.range G.stateDim, (G.dynamicsMatrix ^ i) * G.inputMatrix * (G.inputMatrix)ᵀ * ((G.dynamicsMatrix ^ i)ᵀ)
  positiveDefiniteClosed : G.positiveDefinite
  reachabilityEquivalentClosed : G.reachabilityEquivalent

def ControllabilityGramianClosed (G : ControllabilityGramianPackage) : Prop :=
  G.positiveDefinite ∧ G.reachabilityEquivalent

theorem controllability_gramian_closed_from_evidence
    (G : ControllabilityGramianPackage) (E : ControllabilityGramianEvidence G) :
    ControllabilityGramianClosed G :=
by
  exact And.intro E.positiveDefiniteClosed E.reachabilityEquivalentClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse