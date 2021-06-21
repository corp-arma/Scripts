/* detectedBy.sqf

Check if units from one side are known by units from another side within the area
of a trigger (alternative implementation of the "DetectedBy" editor activation).
*/

params ["_detectedSide", "_detectedBySide", "_trigger"];

private _detected = false;

{
	if (_detected) exitWith {_detected};
	private _unit = _x;
	{
		if (_unit knowsAbout _x >= 1.5) exitWith {_detected = true};
	} forEach (units _detectedSide);
} forEach ((units _detectedBySide) select { (_x inArea _trigger) and !((lifeState _x) in ["INCAPACITATED", "DEAD"]) });
