/// @description Frame Counter Manager

global.frameCounter = (global.frameCounter < global.maxFrames ? global.frameCounter + 1 : 0);
