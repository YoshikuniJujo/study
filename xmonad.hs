import XMonad
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, PP(ppOutput))

main = do
	h <- spawnPipe "xmobar"
	xmonad defaultConfig {
		terminal = "urxvt",
		layoutHook = myLayout,
		logHook = dynamicLogWithPP $ defaultPP {
			ppOutput = hPutStrLn h
		 },
		borderWidth = 0
	 }

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full) ||| Full
	where
	tiled = Tall 1 (3/100) (1/2)
