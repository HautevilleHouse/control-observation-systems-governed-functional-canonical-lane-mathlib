import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.functionalClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.functionalClosed

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse