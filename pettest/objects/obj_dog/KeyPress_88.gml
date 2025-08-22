if isSleeping and !isPassedOut {
	isSleeping = false
	global.new_tc.hideTip(tip_indices.WAKE_UP)
}