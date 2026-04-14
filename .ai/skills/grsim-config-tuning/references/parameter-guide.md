# Parameter guide

## Geometry
- `Radius`, `Height`: robot dimensions.
- `Wheel*Angle`: wheel placement and kinematic response.
- `Kicker*` fields: kicker dimensions/position.

## Physics
- `Bodymass`, `Wheelmass`: inertia and acceleration behavior.
- `Wheel*TangentFriction`, `WheelPerpendicularFriction`: grip/slip behavior.
- `WheelMotorMaximumApplyingTorque`: acceleration ceiling.

## Tuning strategy
- Make small changes (5-10%) per run.
- Evaluate stability and top speed separately.
- Revert quickly if oscillation increases.
