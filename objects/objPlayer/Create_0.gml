/// @description Init Player Values

event_inherited();

//Player width & height
WIDTH = global.blockSize;
HEIGHT = global.blockSize;

//Original point coordinates struct
pointCoords = {
	None : {
		_x : WIDTH / 2,
		_y : HEIGHT / 2
	},
	Idle : {
		Neutral : {
			_p0 : {
				_x : -10,
				_y : -10
			},
			_p1 : {
				_x : 10,
				_y : -10
			},
			_p2 : {
				_x : -15,
				_y : 16
			},
			_p3 : {
			_x : 15,
			_y : 16
		}
		}
	},
	Moving : {
		Neutral : {
			_p0 : {
				_x : -10,
				_y : -10
			},
			_p1 : {
				_x : 10,
				_y : -10
			},
			_p2 : {
				_x : -15,
				_y : 16
			},
			_p3 : {
				_x : 15,
				_y : 16
			}
		},
		Left : {
			_p0 : {
				_x : -15,
				_y : -8
			},
			_p1 : {
				_x : 5,
				_y : -7
			},
			_p2 : {
				_x : -11,
				_y : 16
			},
			_p3 : {
				_x : 16,
				_y : 16
			}
		},
		Right : {
			_p0 : {
				_x : -5,
				_y : -7
			},
			_p1 : {
				_x : 15,
				_y : -8
			},
			_p2 : {
				_x : -16,
				_y : 16
			},
			_p3 : {
				_x : 11,
				_y : 16
			}
		}
	},
	Jumping : {
		Neutral : {
			_p0 : {
				_x : -10,
				_y : -14
			},
			_p1 : {
				_x : 10,
				_y : -14
			},
			_p2 : {
				_x : -11,
				_y : 15
			},
			_p3 : {
				_x : 11,
				_y : 15
			}
		},
		Left : {
			_p0 : {
				_x : -15,
				_y : -16
			},
			_p1 : {
				_x : 7,
				_y : -9
			},
			_p2 : {
				_x : -9,
				_y : 7
			},
			_p3 : {
				_x : 14,
				_y : 16
			}
		},
		Right : {
			_p0 : {
				_x : -7,
				_y : -9
			},
			_p1 : {
				_x : 15,
				_y : -16
			},
			_p2 : {
				_x : -14,
				_y : 16
			},
			_p3 : {
				_x : 9,
				_y : 7
			}
		}
	},
	Falling : {
		Neutral : {
			_p0 : {
				_x : -12,
				_y : -15
			},
			_p1 : {
				_x : 12,
				_y : -15
			},
			_p2 : {
				_x : -10,
				_y : 16
			},
			_p3 : {
				_x : 10,
				_y : 16
			}
		},
		Left : {
			_p0 : {
				_x : -9,
				_y : -7
			},
			_p1 : {
				_x : 14,
				_y : -16
			},
			_p2 : {
				_x : -15,
				_y : 16
			},
			_p3 : {
				_x : 7,
				_y : 9
			}
		},
		Right : {
			_p0 : {
				_x : -14,
				_y : -16
			},
			_p1 : {
				_x : 9,
				_y : -7
			},
			_p2 : {
				_x : -7,
				_y : 9
			},
			_p3 : {
				_x : 15,
				_y : 16
			}
		}
	}
}

//Coordinate point list struct
pointList = {
	_p0 : {
		_x : x - pointCoords.Idle.Neutral._p0._x,
		_y : y - pointCoords.Idle.Neutral._p0._y
	},
	_p1 : {
		_x : x + pointCoords.Idle.Neutral._p1._x,
		_y : y - pointCoords.Idle.Neutral._p1._y
	},
	_p2 : {
		_x : x - pointCoords.Idle.Neutral._p2._x,
		_y : y + pointCoords.Idle.Neutral._p2._y
	},
	_p3 : {
		_x : x + pointCoords.Idle.Neutral._p3._x,
		_y : y + pointCoords.Idle.Neutral._p3._y
	}
}

//Player point variance list struct
pointVary = {
	Idle : {
		Neutral : {
			_p0 : {
				_x : 1,
				_y : 8
			},
			_p1 : {
				_x : -1,
				_y : 8
			},
			_p2 : {
				_x : -1,
				_y : 0
			},
			_p3 : {
				_x : 1,
				_y : 0
			}
		}
	},
	Moving : {
		Neutral : {
			_p0 : {
				_x : 0,
				_y : 0
			},
			_p1 : {
				_x : 0,
				_y : 0
			},
			_p2 : {
				_x : 0,
				_y : 0
			},
			_p3 : {
				_x : 0,
				_y : 0
			}
		},
		Left : {
			_p0 : {
				_x : 1,
				_y : -1
			},
			_p1 : {
				_x : -2,
				_y : 2
			},
			_p2 : {
				_x : 1,
				_y : 0
			},
			_p3 : {
				_x : -2,
				_y : 0
			}
		},
		Right : {
			_p0 : {
				_x : -1,
				_y : 2
			},
			_p1 : {
				_x : 2,
				_y : -2
			},
			_p2 : {
				_x : -2,
				_y : 0
			},
			_p3 : {
				_x : 1,
				_y : 0
			}
		}
	},
	Jumping : {
		Neutral : {
			_p0 : {
				_x : 1,
				_y : 2
			},
			_p1 : {
				_x : -1,
				_y : 2
			},
			_p2 : {
				_x : -1,
				_y : 2
			},
			_p3 : {
				_x : 1,
				_y : 2
			}
		},
		Left : {
			_p0 : {
				_x : -2,
				_y : -1
			},
			_p1 : {
				_x : -1,
				_y : 1
			},
			_p2 : {
				_x : 1,
				_y : -1
			},
			_p3 : {
				_x : -2,
				_y : -1
			}
		},
		Right : {
			_p0 : {
				_x : -1,
				_y : 1
			},
			_p1 : {
				_x : -2,
				_y : 1
			},
			_p2 : {
				_x : -2,
				_y : -1
			},
			_p3 : {
				_x : 1,
				_y : -1
			}
		}
	},
	Falling : {
		Neutral : {
			_p0 : {
				_x : 1,
				_y : 2
			},
			_p1 : {
				_x : -1,
				_y : 2
			},
			_p2 : {
				_x : -1,
				_y : -1
			},
			_p3 : {
				_x : 1,
				_y : -1
			}
		},
		Left : {
			_p0 : {
				_x : -1,
				_y : 1
			},
			_p1 : {
				_x : -1,
				_y : -1
			},
			_p2 : {
				_x : -2,
				_y : 2
			},
			_p3 : {
				_x : -2,
				_y : -1
			}
		},
		Right : {
			_p0 : {
				_x : 1,
				_y : 1
			},
			_p1 : {
				_x : 1,
				_y : 1
			},
			_p2 : {
				_x : 2,
				_y : 2
			},
			_p3 : {
				_x : 2,
				_y : -1
			}
		}
	}
}

//Player movement states struct
playerStates = {
	Idle : {
		Neutral : true,
	},
	Moving : {
		Neutral : false,
		Left : false,
		Right : false
	},
	Jumping : {
		Neutral : false,
		Left : false,
		Right : false
	},
	Falling : {
		Neutral : false,
		Left : false,
		Right : false
	}
}

//Point variance values for each player state struct
varyFrames = {
	Idle : {
		Neutral : 10
	},
	Moving : {
		Neutral : 10,
		Left : 10,
		Right : 10
	},
	Jumping : {
		Neutral : 15,
		Left : 15,
		Right : 15
	},
	Falling : {
		Neutral : 10,
		Left : 10,
		Right : 10
	}
}

//Player-specific local variables
jumpCounter = 0;		//How many times jumped:	0 = No jumps	| 1 = Single jump	| 2 = Double jump	| 3+ = From jump crystals
maxJumps = 2;			//How many jumps maximum
availableJumps = 2;		//How many jumps left
dJumpTrigger = false;	//Apply double-jump effect
jumpFadeFX = -1;		//Opacity of FX ring
lastJump = [x, y];		//Last jump coordinates
lastJumpDir = 0;		//Last jump direction
moveSpeed = 7;			//Player max move speed
jumpAmount = 7;			//Player jump timing
deathFadeFX = 1;		//Opacity of death FX
deathFadePos = 0;		//Position of death FX

//Set on top
depth = -3000;
