local core = require "SSP_Core"

function onScriptStart()
	if ReadValueString(0x0, 6) ~= "GSYE6S" and ReadValueString(0x0, 6) ~= "GSYP6S"  then
		CancelScript()
	end
end

function onScriptCancel()
end

function onScriptUpdate()
	text = ""


	text = text .. "\n==== MAP INFO ====\n"
				.. "Realm: " .. core.getMapPosition().realm .. "\n"
				.. string.format("Current Space: %i", core.getMapPosition().spaces) .. "\n"
				.. string.format("Remaining Spaces: %i", core.getMapPosition().remainingSpaces) .. "\n"

				.. "\n==== ORBS ====\n"
				.. string.format("P1 Orbs: %i", core.getOrbCount().P1) .. "\n"
				.. string.format("P2 Orbs: %i", core.getOrbCount().P2) .. "\n"
				.. string.format("P3 Orbs: %i", core.getOrbCount().P3) .. "\n"
				.. string.format("P4 Orbs: %i", core.getOrbCount().P4) .. "\n"

				.. "\n==== MINIGAME INFO ====\n"
				.. string.format("Timer: %10.7f", core.getMinigameTimer()) .. "\n\n"

				.. string.format("P1 Score: %i    Estimator: %10.7f", core.getMinigameScore().P1, core.getMinigameScoreEstimator().P1) .. "\n"
				.. string.format("P2 Score: %i    Estimator: %10.7f", core.getMinigameScore().P2, core.getMinigameScoreEstimator().P2) .. "\n"
				.. string.format("P3 Score: %i    Estimator: %10.7f", core.getMinigameScore().P3, core.getMinigameScoreEstimator().P3) .. "\n"
				.. string.format("P4 Score: %i    Estimator: %10.7f", core.getMinigameScore().P4, core.getMinigameScoreEstimator().P4) .. "\n"
	
	SetScreenText(text)
end