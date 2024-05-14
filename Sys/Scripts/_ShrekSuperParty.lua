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


	tournament = core.getTournament()
	text = text .. "\n==== MAP INFO ====\n"
				.. "Realm: " .. tournament.map.realm .. "\n"
				.. string.format("Current Space: %i", tournament.map.spaces) .. "\n"
				.. string.format("Remaining Spaces: %i", tournament.map.remainingSpaces) .. "\n"

				.. "\n==== ORBS ====\n"
				.. string.format("P1 Orbs: %i", tournament.orbCount.P1) .. "\n"
				.. string.format("P2 Orbs: %i", tournament.orbCount.P2) .. "\n"
				.. string.format("P3 Orbs: %i", tournament.orbCount.P3) .. "\n"
				.. string.format("P4 Orbs: %i", tournament.orbCount.P4) .. "\n"

	if (core.isInMinigame()) then
		minigame = core.getMinigame()
		text = text .. "\n==== MINIGAME INFO ====\n"
					.. string.format("Timer: %10.7f", minigame.timer) .. "\n\n"

					.. string.format("P1 Score: %i    Estimator: %10.7f", minigame.score.P1, minigame.scoreEstimator.P1) .. "\n"
					.. string.format("P2 Score: %i    Estimator: %10.7f", minigame.score.P2, minigame.scoreEstimator.P2) .. "\n"
					.. string.format("P3 Score: %i    Estimator: %10.7f", minigame.score.P3, minigame.scoreEstimator.P3) .. "\n"
					.. string.format("P4 Score: %i    Estimator: %10.7f", minigame.score.P4, minigame.scoreEstimator.P4) .. "\n"

					.. core.getSpecificMinigameVariables()
	end
	SetScreenText(text)
end