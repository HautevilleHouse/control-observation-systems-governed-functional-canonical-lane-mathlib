import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.functionalClosed ∨ A.observationClosed

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse