import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlObservationSystemsGovernedFunctionalCanonicalLaneLean

structure OptimalControlFunctionalPackage where
  stateTrajectory : ℝ → ℝ
  controlFunction : ℝ → ℝ
  runningCost : ℝ → ℝ → ℝ
  terminalCost : ℝ → ℝ
  horizon : ℝ
  totalCost : ℝ
  optimalityCondition : Prop

structure OptimalControlFunctionalEvidence (O : OptimalControlFunctionalPackage) where
  totalCostComputed : O.totalCost = ∫ t in (0 : ℝ)..O.horizon, O.runningCost (O.stateTrajectory t) (O.controlFunction t) ∂ volume + O.terminalCost (O.stateTrajectory O.horizon)
  optimalityConditionClosed : O.optimalityCondition

def OptimalControlFunctionalClosed (O : OptimalControlFunctionalPackage) : Prop :=
  O.optimalityCondition ∧ True

theorem optimal_control_functional_closed_from_evidence
    (O : OptimalControlFunctionalPackage) (E : OptimalControlFunctionalEvidence O) :
    OptimalControlFunctionalClosed O :=
by
  exact And.intro E.optimalityConditionClosed True.intro

end ControlObservationSystemsGovernedFunctionalCanonicalLaneLean
end HautevilleHouse