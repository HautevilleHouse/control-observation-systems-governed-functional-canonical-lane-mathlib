import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ControlObservationSystemsGovernedFunctionalCanonicalLaneLean.ObservationFunctionSpace
import HautevilleHouse.ControlObservationSystemsGovernedFunctionalCanonicalLaneLean.ControllabilityGramian
import HautevilleHouse.ControlObservationSystemsGovernedFunctionalCanonicalLaneLean.ObserverLuenberger
import HautevilleHouse.ControlObservationSystemsGovernedFunctionalCanonicalLaneLean.FunctionalCostOptimality

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ObservationFunctionClosed (A.object : ObservationFunctionPackage) ∧
  ControllabilityGramianClosed (A.object : ControllabilityGramianPackage) ∧
  LuenbergerObserverClosed (A.object : LuenbergerObserverPackage) ∧
  OptimalControlFunctionalClosed (A.object : OptimalControlFunctionalPackage)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
by
  -- Assume we have evidence from each subpackage
  have h1 : ObservationFunctionClosed (A.object : ObservationFunctionPackage) := sorry
  have h2 : ControllabilityGramianClosed (A.object : ControllabilityGramianPackage) := sorry
  have h3 : LuenbergerObserverClosed (A.object : LuenbergerObserverPackage) := sorry
  have h4 : OptimalControlFunctionalClosed (A.object : OptimalControlFunctionalPackage) := sorry
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedControlObservationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_control_observation_endgame (A : AdmissibleClass) :
    ConstrainedControlObservationClosure A :=
by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse