Config = {}

Config.trucker_logistics = {					-- Settings related to the link with the Truck Logistics script
	['enable'] = false,							-- Set this as true if you own the Truck Logistics script and want to link the jobs created in the Hire Deliveryman page with the truckers
	['quick_jobs_page'] = true,					-- true: The jobs created will appear in the Quick jobs page in the trucker logistics (it uses a rented truck). false: They will appear in the Freights page (it requires an owned truck)
	['available_trucks'] = {					-- List of trucks that are generated in contracts
		"hauler","packer"
	},
	['available_trailers'] = {					-- List of trailers that are generated in contracts
		"trailers", "trailers2", "trailers3"
	}
}

Config.max_stores_per_player = 1				-- Maximum number of stores that each player can have
Config.max_stores_employed = 2					-- Maximum number of stores that each player can be employed
Config.has_stock_when_unowed = true				-- If true, the store stock will be full stock when there is no owner. If false, the store stock will be empty when there is no owner
Config.max_jobs = 20							-- Max amount of jobs that each store can create
Config.disable_rename_business = false 			-- Set this to true if you want to disable the function to rename the business
Config.group_map_blips = true					-- true: will group all the blips into a single category in the map. false: all the blips will be grouped just by the name and icon
Config.charge_import_money_before = false

-- Here are the places where the person can open the market menu
-- You can add as many locations as you want, just use the location already created as an example
Config.market_locations = {
	["market_1"] = {															-- ID
		['buy_price'] = 600000,													-- Price to buy this market
		['sell_price'] = 300000,												-- Price to sell this market
		['coord'] = {-709.57440185547,-905.78985595703,19.215585708618},		-- Coordinate to open the menu (vector3)
		['garage_coord'] = {-707.13,-924.98,19.02,179.01},						-- Garage coordinates, where the trucks will spawn (vector4)
		['truck_parking_location'] = {-707.95, -929.8, 19.01, 180.0},			-- Location that the trucks from Trucker Logistics script will park when delivering cargo for this store (vector3)
		['map_blip_coord'] = {-714.77,-912.22,19.21},							-- Map blip coordinates, where the map blip will appear (vector3)
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (vector3)
			{-714.77520751953,-912.22875976562,19.215589523315},
			{-707.40911865234,-913.48266601562,19.215589523315},
			{-711.70471191406,-912.08258056641,19.215587615967}
		},
		['deliveryman_coord'] = {-714.55,-917.8,19.22},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = '247store', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["market_2"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {25.4531, -1344.4296, 26.3849},
		['garage_coord'] = {15.3,-1345.17,29.29,179.17},
		['truck_parking_location'] = {24.0538,-1357.3694, 29.503,88.4017},
		['map_blip_coord'] = {25.71,-1346.47,29.49},
		['sell_blip_coords'] = {
			{25.71, -1346.47, 29.497},
			{29.7374, -1345.4561, 29.4968},
			{33.3493, -1345.3802, 29.4968},
		},
		['deliveryman_coord'] = {22.906536102295,-1350.3334960938,29.327049255371},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_3"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {2554.6882, 381.7898, 105.5108},
		['garage_coord'] = {2588.82,413.31,108.46,178.94},
		['truck_parking_location'] = {2564.896,366.3779, 108.7248,177.4842},
		['map_blip_coord'] = {2556.73,382.11,108.62},
		['sell_blip_coords'] = {
			{2556.3818, 382.5208, 108.6227},
			{2552.5500, 384.6687, 108.6227},
			{2555.7834, 389.7756, 108.6227},
			{2555.5181, 386.0621, 108.6227},
		},
		['deliveryman_coord'] = {2560.1857910156,382.88265991211,108.62112426758},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_4"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1159.861328125,-315.43588256836,69.205146789551},
		['garage_coord'] = {1177.4652, -315.0400, 69.1830, 278.1840},
		['truck_parking_location'] = {1177.4652, -315.0400, 69.1830, 278.1840},
		['map_blip_coord'] = {1163.42,-322.91,69.20},
		['sell_blip_coords'] = {
			{1159.1940, -322.2794, 69.2052},
			{1156.2062, -323.0072, 69.2052},
			{1153.3070, -325.1383, 69.2052},
			{1163.2216, -324.1305, 69.2052},
		},
		['deliveryman_coord'] = {1154.8171386719,-326.7705078125,69.205146789551},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_5"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-1827.9733886719,798.20367431641,138.17694091797},
		['garage_coord'] = {-1802.0958, 781.9829, 137.4001, 107.7465},
		['truck_parking_location'] = {-1805.8776, 783.1971, 137.4318, 0.0},
		['map_blip_coord'] = {-1820.92,793.17,138.11},
		['sell_blip_coords'] = {
			{-1820.6680, 792.2952, 138.1180},
			{-1824.8546, 792.0608, 138.1890},
			{-1827.2061, 789.2152, 138.2580},
			{-1828.4482, 786.2008, 138.3103},
		},
		['deliveryman_coord'] = {-1826.259765625,785.52191162109,138.28074645996},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_6"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {374.0375, 328.6724, 100.4542},
		['garage_coord'] = {366.43,332.03,103.51,165.15},
		['truck_parking_location'] = {361.3589,319.2109, 103.9061,76.4428},
		['map_blip_coord'] = {374.20,326.91,103.56},
		['sell_blip_coords'] = {
			{374.5185, 326.9845, 103.5661},
			{377.3197, 330.2812, 103.5661},
			{378.0167, 326.8365, 103.5661},
			{381.6371, 326.0295, 103.5661},
		},
		['deliveryman_coord'] = {381.8680, 321.3836, 103.3291},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_7"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-3244.7141, 1001.0849, 9.7186},
		['garage_coord'] = {-3238.1858, 975.4171, 12.8244, 189.4554},
		['truck_parking_location'] = {-3238.1858, 975.4171, 12.8244, 189.4554},
		['map_blip_coord'] = {-3243.1589, 1004.6935, 12.8305},
		['sell_blip_coords'] = {
			{-3243.1411, 1001.8630, 12.8304},
			{-3246.8237, 1003.9171, 12.8304},
			{-3243.5713, 1005.3202, 12.8304},
			{-3243.2771, 1008.9247, 12.8304},
		},
		['deliveryman_coord'] = {-3239.6523, 1011.0063, 12.3120},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_8"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1729.7755, 6417.1094, 31.9251},
		['garage_coord'] = {1718.27,6418.38,33.45,152.26},
		['truck_parking_location'] = {1713.1648,6410.5093, 33.6366,155.0778},
		['map_blip_coord'] = {1729.38,6415.42,35.03},
		['sell_blip_coords'] = {
			{1729.9640, 6415.3223, 35.0369},
			{1733.2626, 6417.9751, 35.0369},
			{1733.3225, 6414.4688, 35.0369},
			{1736.5818, 6412.9390, 35.0369},
		},
		['deliveryman_coord'] = {1728.1453, 6412.1074, 35.0007},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_9"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {548.5235, 2668.7041, 39.0443},
		['garage_coord'] = {533.9,2667.9,42.28,8.76},
		['truck_parking_location'] = {533.3693,2669.5442, 42.5447,7.0399},
		['map_blip_coord'] = {547.74,2671.56,42.15},
		['sell_blip_coords'] = {
			{547.3465, 2670.0825, 42.1562},
			{546.0253, 2666.0061, 42.1562},
			{544.1346, 2668.9180, 42.1562},
			{540.6022, 2668.4553, 42.1562},
		},
		['deliveryman_coord'] = {541.56079101563,2674.0302734375,42.173282623291},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_10"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1959.5815, 3742.6533, 29.2316},
		['garage_coord'] = {1977.5361, 3737.3359, 32.4112, 213.9682}, 
		['truck_parking_location'] = {1977.5361, 3737.3359, 32.4112, 213.9682},
		['map_blip_coord'] = {1961.35,3741.49,32.34},
		['sell_blip_coords'] = {
			{1961.1743, 3741.7942, 32.3435},
			{1963.7758, 3744.1904, 32.3435},
			{1960.7245, 3746.0750, 32.3435},
			{1966.8129, 3745.9670, 32.3435},
		},
		['deliveryman_coord'] = {1971.0476, 3742.0896, 32.3347},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_11"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {2676.2493, 3281.4148, 52.1290},
		['garage_coord'] = {2689.24,3272.53,55.25,328.87},
		['truck_parking_location'] = {2651.1384,3263.427, 55.4719,151.0635},
		['map_blip_coord'] = {2679.80,3286.73,55.24},
		['sell_blip_coords'] = {
			{2678.0210, 3281.5259, 55.2408},
			{2675.5247, 3284.8760, 55.2408},
			{2678.8660, 3284.8528, 55.2408},
			{2680.7622, 3288.0032, 55.2408},
		},
		['deliveryman_coord'] = {2679.7431640625,3276.6286621094,55.408432006836},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_12"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1706.8068847656,4921.125,42.063636779785},
		['garage_coord'] = {1711.16, 4941.8, 42.13, 53.63}, --old cords {1689.02,4919.69,42.08,57.01},
		['truck_parking_location'] = {1686.8475,4922.3828, 42.3414,55.4782},
		['map_blip_coord'] = {1700.00,4925.55,42.06},
		['sell_blip_coords'] = {
			{1698.1360, 4924.9482, 42.0637},
			{1702.1271, 4926.3364, 42.0637},
			{1704.0109, 4929.3027, 42.0637},
			{1704.4790, 4932.5513, 42.0637},
		},
		['deliveryman_coord'] = {1700.3133544922,4932.724609375,42.078147888184},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_13"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-44.314395904541,-1749.6755371094,29.42099571228},
		['garage_coord'] = {-63.1,-1742.7,29.31,57.2},
		['truck_parking_location'] = {-20.8732,-1767.8015, 29.4571,231.7498},
		['map_blip_coord'] = {-50.81,-1754.87,29.42},
		['sell_blip_coords'] = {
			{-48.6667, -1757.6652, 29.4210},
			{-49.7035, -1753.5856, 29.4210},
			{-52.8778, -1751.5118, 29.4210},
			{-55.7893, -1750.7067, 29.4210},
		},
		['deliveryman_coord'] = {-55.720436096191,-1755.5327148438,29.439630508423},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	-- ["market_14"] = {
	-- 	['buy_price'] = 600000,
	-- 	['sell_price'] = 300000,
	-- 	['coord'] = {1391.2985, 3609.1440, 34.9809},
	-- 	['garage_coord'] = {1384.52,3593.7,34.9,210.34},
	-- 	['truck_parking_location'] = {1381.198,3594.0959, 35.1478,200.0481},
	-- 	['map_blip_coord'] = {1398.45,3607.05,34.98},
	-- 	['sell_blip_coords'] = {
	-- 		{1398.4554443359,3607.0505371094,34.980926513672},
	-- 		{1389.3104248047,3602.6013183594,34.980926513672},
	-- 	},
	-- 	['deliveryman_coord'] = {1391.8991699219,3598.4467773438,35.031749725342},
	-- 	['type'] = '247store',
	-- 	['account'] = {
	-- 		['item'] = {
	-- 			[1] = {
	-- 				['icon'] = 'img/credit_card.png',
	-- 				['account'] = 'bank'
	-- 			},
	-- 			[2] = {
	-- 				['icon'] = 'img/cash.png',
	-- 				['account'] = 'cash'
	-- 			}
	-- 		},
	-- 		['store'] = 'bank',
	-- 	}
	-- },
	["market_15"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-3041.6575, 584.5955, 4.7968},
		['garage_coord'] = {-3031.6433, 593.6188, 7.7203, 190.8660},
		['truck_parking_location'] = {-3042.8213, 601.6755, 7.4625, 0.0},
		['map_blip_coord'] = {-3041.66,586.27,7.90},
		['sell_blip_coords'] = {
			{-3040.5444, 586.0891, 7.9087},
			{-3044.6543, 586.5796, 7.9087},
			{-3042.3064, 588.8171, 7.9087},
			{-3043.3545, 592.4124, 7.9087},
		},
		['deliveryman_coord'] = {-3038.25,593.58,7.81},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_16"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1166.1985, 2714.3770, 38.1577},
		['garage_coord'] = {1169.43,2694.08,37.84,85.41},
		['truck_parking_location'] = {1181.8191,2695.3115, 38.2108,268.9558},
		['map_blip_coord'] = {1164.06,2707.60,38.15},
		['sell_blip_coords'] = {
			{1164.0694580078,2707.6005859375,38.157665252686},
			{1166.1302490234,2707.2504882813,38.157676696777},
		},
		['deliveryman_coord'] = {1160.2208251953,2702.11328125,38.183746337891},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_17"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {1952.6755, 3829.2263, 32.4726},
		['garage_coord'] = {1932.5168, 3799.4570, 32.2976, 31.3480},
		['truck_parking_location'] = {1932.5168, 3799.4570, 32.2976, 31.3480},
		['map_blip_coord'] = {1949.15,3847.62,32.61},
		['sell_blip_coords'] = {
			{1943.4618, 3843.6602, 32.4726},
			{1949.4509, 3848.7620, 32.4726},
			{1952.3662, 3842.0847, 32.4873},
		},
		['deliveryman_coord'] = {1929.2423, 3829.1221, 32.4457},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["market_18"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {169.27001953125,6644.1645507813,31.71063041687},
		['garage_coord'] = {146.9,6634.98,31.61,175.81},
		['truck_parking_location'] = {164.0575,6625.502, 32.0364,225.7734},
		['map_blip_coord'] = {164.15,6641.15,31.71},
		['sell_blip_coords'] = {
			{164.15994262695,6641.15625,31.710638046265},
			{167.01026916504,6637.4892578125,31.710649490356},
		},
		['deliveryman_coord'] = {157.05537414551,6641.224609375,31.605260848999},
		['type'] = '247store',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_1"] = {					--POSTAL 745--
		['buy_price'] = 900000,
		['sell_price'] = 450000,
		['coord'] = {23.9216, -1105.8318, 29.7970},
		['garage_coord'] = {27.71,-1113.25,29.3,329.89},
		['truck_parking_location'] = {-13.8833,-1125.8661, 27.5543,157.6875},
		['map_blip_coord'] = {20.91,-1110.49,29.79},
		['sell_blip_coords'] = {
			{22.0406, -1107.4171, 29.7970},
			{18.9452, -1109.9900, 29.7970}
		},
		['deliveryman_coord'] = {18.89,-1116.02,29.79},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_2"] = {				--POSTAL 608--
		['buy_price'] = 900000,
		['sell_price'] = 450000,
		['coord'] = {250.0198, -52.0200, 69.9412},
		['garage_coord'] = {235.88, -46.17, 69.58, 158.04},
		['truck_parking_location'] = {237.9055, -36.8189, 69.7336, 156.6352},
		['map_blip_coord'] = {244.6759,-45.3816,69.9411},
		['sell_blip_coords'] = {
			{251.6593, -50.5591, 69.9412},
			{253.3062, -48.1959, 69.9411}
		},
		['deliveryman_coord'] = {242.9363, -47.2410, 69.8965},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_3"] = {					--POSTAL 769--
		['buy_price'] = 900000,
		['sell_price'] = 450000,
		['coord'] = {839.6948, -1032.2825, 28.1948},
		['garage_coord'] = {852.1, -1009.02, 28.8, 104.37},
		['truck_parking_location'] = {868.05, -1009.95, 30.63, 92.85},
		['map_blip_coord'] = {844.1235,-1024.1575,28.1342},
		['sell_blip_coords'] = {
			{841.7493, -1033.0394, 28.1949},
			{844.1791, -1033.9147, 28.1949}
		},
		['deliveryman_coord'] = {840.6039, -1021.8599, 27.5336},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_4"] = {					--POSTAL 726--
		['buy_price'] = 900000,
		['sell_price'] = 450000,
		['coord'] = {-659.7081, -936.6115, 21.8292},
		['garage_coord'] = {-661.5736, -953.8605, 21.3825, 87.1772},
		['truck_parking_location'] = {-661.5736, -953.8605, 21.3825, 87.1772},
		['map_blip_coord'] = {-664.1187,-943.6521,21.8292},
		['sell_blip_coords'] = {
			{-664.1121, -935.0978, 21.829},
			{-661.6235, -935.6307, 21.8292}
		},
		['deliveryman_coord'] = {-661.8074, -945.1057, 21.7796},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_5"] = {					--POSTAL 285--
		['buy_price'] = 350000,
		['sell_price'] = 175000,
		['coord'] = {1696.2888, 3760.8335, 34.7053},
		['garage_coord'] = {1709.6709, 3760.3096, 34.1960, 204.1694},
		['truck_parking_location'] = {1709.6709, 3760.3096, 34.1960, 204.1694},
		['map_blip_coord'] = {1699.5743,3752.2832,34.7128},
		['sell_blip_coords'] = {
			{1691.9999, 3758.6116, 34.7054},
			{1694.2161, 3760.1445, 34.7054}
		},
		['deliveryman_coord'] = {1700.9490, 3754.0325, 34.3531},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_6"] = {					--POSTAL 046--
		['buy_price'] = 350000,
		['sell_price'] = 175000,
		['coord'] = {-327.3238, 6084.5654, 31.4548},
		['garage_coord'] = {-314.9787, 6088.2661, 31.4024, 223.6691},
		['truck_parking_location'] = {-314.9787, 6088.2661, 31.4024, 223.6691},
		['map_blip_coord'] = {-324.9963,6075.8467,31.2503},
		['sell_blip_coords'] = {
			{-331.6950, 6082.4160, 31.4548},
			{-329.6848, 6083.9976, 31.4548}
		},
		['deliveryman_coord'] = {-326.4119, 6073.6118, 31.2373},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_7"] = {					--POSTAL 807--
		['buy_price'] = 900000,
		['sell_price'] = 450000,
		['coord'] = {808.8498, -2159.1545, 29.6190},
		['garage_coord'] = {821.5950, -2138.7520, 29.1549, 354.1159},
		['truck_parking_location'] = {821.5950, -2138.7520, 29.1549, 354.1159},
		['map_blip_coord'] = {811.8365,-2148.5630,29.6227},
		['sell_blip_coords'] = {
			{809.8536, -2157.2585, 29.6190},
			{812.0969, -2153.3499, 29.6190}
		},
		['deliveryman_coord'] = {815.4039, -2147.3108, 29.4212},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_8"] = {					--POSTAL 433--
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-3169.4895, 1089.5140, 20.8387},
		['garage_coord'] = {-3149.1643, 1080.9310, 20.6888, 335.8377},
		['truck_parking_location'] = {-3149.1643, 1080.9310, 20.6888, 335.8377},
		['map_blip_coord'] = {-3168.7004, 1086.2480, 20.8329},
		['sell_blip_coords'] = {
			{-3172.9504, 1086.0759, 20.8387},
			{-3171.4504, 1088.0111, 20.8387}
		},
		['deliveryman_coord'] = {-3162.6169, 1085.0494, 20.8477},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_9"] = {					--POSTAL 668--
		['buy_price'] = 700000,
		['sell_price'] = 350000,
		['coord'] = {-1307.7856, -396.5825, 36.6958},
		['garage_coord'] = {-1334.6670, -391.8501, 36.6436, 120.6675},
		['truck_parking_location'] = {-1334.6670, -391.8501, 36.6436, 120.6675},
		['map_blip_coord'] = {-1305.1049, -391.5028, 36.6899},
		['sell_blip_coords'] = {
			{-1306.2094, -394.8260, 36.6958},
			{-1305.2004, -392.4186, 36.6958}
		},
		['deliveryman_coord'] = {-1315.5012, -393.1687, 36.5871},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_10"] = {					--POSTAL 557--
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {2566.62, 292.58, 108.73},
		['garage_coord'] = {2583.44, 296.59, 108.46, 353.22},
		['truck_parking_location'] = {2583.44, 296.59, 108.46, 353.22},
		['map_blip_coord'] = {2569.43, 304.07, 108.61},
		['sell_blip_coords'] = {
			{2569.91, 293.96, 108.73},
			{2567.37, 294.62, 108.73}
		},
		['deliveryman_coord'] = {2579.0, 285.72, 108.61},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["ammunation_11"] = {					--POSTAL 403--
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {-1117.89, 2701.19, 18.55},
		['garage_coord'] = {-1105.5385, 2686.4343, 19.1895, 130.0779},
		['truck_parking_location'] = {-1105.5385, 2686.4343, 19.1895, 130.0779},
		['map_blip_coord'] = {-1116.19, 2693.10, 18.55},
		['sell_blip_coords'] = {
			{-1117.65, 2698.43, 18.55},
			{-1116.89, 2694.50, 18.55}
		},
		['deliveryman_coord'] = {-1110.23, 2691.99, 18.60},
		['type'] = 'ammunation',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},	
	["hardwarestore_1"] = {					--Postal 313--
		['buy_price'] = 400000,
		['sell_price'] = 200000, -- Price to sell this market
        ['coord'] = {2748.1772, 3505.2273, 55.6960}, -- Coordinate to open the menu
        ['garage_coord'] = {2701.3838, 3447.4543, 55.7994, 158.5060}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ['truck_parking_location'] = {2701.3838, 3447.4543, 55.7994, 158.5060},
		['map_blip_coord'] = {2724.1387, 3489.1531, 56.3830},
        ['sell_blip_coords'] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {2725.9568, 3489.5730, 55.6973},
			{2727.5405, 3493.4944, 55.6973},
			{2732.4968, 3491.2629, 55.6970},
			{2733.8430, 3481.0178, 55.6966},
			{2737.1116, 3485.0134, 55.6965},
        },
        ['deliveryman_coord'] = {2735.88, 3438.02, 56.41}, -- Coord where the deliveryman will take the jobs you've created
        ['type'] = 'hardware', -- Insert here the market type ID
        ['account'] = {
            -- Account settings for this store
            ['item'] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ['icon'] = 'img/credit_card.png',
                    ['account'] = 'bank'
                },
                [2] = {
                    ['icon'] = 'img/cash.png',
                    ['account'] = 'cash'
                }
            },
            ['store'] = 'bank' -- Account that should be used with store expenses (owner)
        }
    }, 
	["hardwarestore_2"] = {					--Postal 433--
		['buy_price'] = 600000,
		['sell_price'] = 250000, -- Price to sell this market
        ['coord'] = {-3161.12, 1113.45, 20.86}, -- Coordinate to open the menu
        ['garage_coord'] = {-3172.98, 1111.88, 20.86, 326.94}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ['truck_parking_location'] = {-3172.98, 1111.88, 20.86, 326.94},
		['map_blip_coord'] = {-3152.76, 1110.05, 20.87},
        ['sell_blip_coords'] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {-3152.76, 1110.05, 20.87}
        },
        ['deliveryman_coord'] = {-3157.05, 1104.64, 20.88}, -- Coord where the deliveryman will take the jobs you've created
        ['type'] = 'hardware', -- Insert here the market type ID
        ['account'] = {
            -- Account settings for this store
            ['item'] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ['icon'] = 'img/credit_card.png',
                    ['account'] = 'bank'
                },
                [2] = {
                    ['icon'] = 'img/cash.png',
                    ['account'] = 'cash'
                }
            },
            ['store'] = 'bank' -- Account that should be used with store expenses (owner)
        }
    }, 

    ["sports_1"] = {				--Postal 412--
        ["buy_price"] = 500000, -- Price to buy this market
        ["sell_price"] = 250000,
        ["coord"] = {-1506.61, 1517.28, 115.29},
        ["garage_coord"] = {-1493.59, 1530.87, 114.4, 261.74},
        ["truck_parking_location"] = {-1493.59, 1530.87, 114.4, 261.74},
        ['map_blip_coord'] = {-1506.61, 1517.28, 115.29},
        ["sell_blip_coords"] = {
            {-1510.35, 1518.33, 115.31}
        },
        ["deliveryman_coord"] = {-1508.18, 1503.44, 115.29},
        ["type"] = "sports",
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },

	["sports_2"] = {				--Postal 049--
	["buy_price"] = 500000, -- Price to buy this market
	["sell_price"] = 250000,
	["coord"] = {-672.8, 5831.23, 17.34},
	["garage_coord"] = {-664.25, 5820.91, 17.33, 69.06},
	["truck_parking_location"] = {-664.25, 5820.91, 17.33, 69.06},
	['map_blip_coord'] = {-679.33, 5834.02, 17.33},
	["sell_blip_coords"] = {
		{-675.48, 5836.32, 17.34}
	},
	["deliveryman_coord"] = {-683.39, 5839.53, 17.33},
	["type"] = "sports",
	["account"] = {
		-- Account settings for this store
		["item"] = {
			-- Account that the money should be debited when buying item in the market (player can choose between 2)
			[1] = {
				["icon"] = "img/credit_card.png",
				["account"] = "bank"
			},
			[2] = {
				["icon"] = "img/cash.png",
				["account"] = "cash"
			}
		},
		["store"] = "bank" -- Account that should be used with store expenses (owner)
	}
	},

	["liquor_1"] = {				--postal 700--
		['buy_price'] = 250000,													-- Price to buy this market
        ["sell_price"] = 125000, -- Price to sell this market
        ["coord"] = {-1219.65, -908.01, 12.33}, -- Coordinate to open the menu
        ["garage_coord"] = {-1251.3, -861.88, 12.38, 215}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {-1251.3, -861.88, 12.38, 215},
		['map_blip_coord'] = {-1219.65, -908.01, 12.33},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {-1222.33, -904.38, 12.33}
        },
        ["deliveryman_coord"] = {-1232.3, 905.46, 12.07}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "liquor", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
    ["liquor_2"] = {					--Postal 671--
		['buy_price'] = 250000,													-- Price to buy this market
        ["sell_price"] = 125000, -- Price to sell this market
        ["coord"] = {-1486.93, -375.63, 40.16}, -- Coordinate to open the menu
        ["garage_coord"] = {-1458.4069, -384.1710, 38.4737, 130.0679}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {-1458.4069, -384.1710, 38.4737, 130.0679},
		['map_blip_coord'] = {-1486.93, -375.63, 40.16},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {-1490.24, -379.43, 40.06}
        },
        ["deliveryman_coord"] = {-1487.04, -389.27, 39.26}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "liquor", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
    ["liquor_3"] = {					--Postal 772--
		['buy_price'] = 250000,													-- Price to buy this market
        ["sell_price"] = 125000, -- Price to sell this market
        ["coord"] = {1133.67, -984.57, 46.42}, -- Coordinate to open the menu
        ["garage_coord"] = {1116.7598, -976.4403, 46.4070, 6.4729}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {1116.7598, -976.4403, 46.4070, 6.4729},
		['map_blip_coord'] = {1133.67, -984.57, 46.42},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {1138.07, -983.85, 46.42}
        },
        ["deliveryman_coord"] = {1141.81, -978.13, 46.34}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "liquor", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
    ["liquor_4"] = {				--Postal 437--
		['buy_price'] = 250000,													-- Price to buy this market
        ["sell_price"] = 125000, -- Price to sell this market
        ["coord"] = {-2965.34, 392.79, 15.04}, -- Coordinate to open the menu
        ["garage_coord"] = {-2966.98, 399.69, 15.09, 88.32}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {-2966.98, 399.69, 15.09, 88.32},
		['map_blip_coord'] = {-2965.34, 392.79, 15.04},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {-2969.67, 393.11, 15.04}
        },
        ["deliveryman_coord"] = {-2973, 71, 396.7}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "liquor", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
	["digiden1"] = {				--Postal 757--
		['buy_price'] = 1200000,													-- Price to buy this market
		['sell_price'] = 550000, -- Price to sell this market
        ["coord"] = {380.2592, -827.7764, 29.3054}, -- Coordinate to open the menu
        ["garage_coord"] = {365.47, -831.3, 29.29, 188.6}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {365.47, -831.3, 29.29, 188.6},
		['map_blip_coord'] = {388.01, -825.6, 29.32},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {389.8757, -826.8191, 29.3054}
        },
        ["deliveryman_coord"] = {390.59, -833.76, 29.29}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "digiden", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
	["digiden2"] = {				--Postal 607--
		['buy_price'] = 1200000,													-- Price to buy this market
		['sell_price'] = 550000, -- Price to sell this market
        ["coord"] = {-8.2343, -97.3442, 56.9843}, -- Coordinate to open the menu
        ["garage_coord"] = {-31.8883, -92.7742, 57.2545, 162.1250}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {-31.8883, -92.7742, 57.2545, 162.1250},
		['map_blip_coord'] = {-21.7076, -99.4817, 57.1833},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {-23.1117, -98.1890, 57.1094},
			{-19.9534, -99.2159, 57.0419}
        },
        ["deliveryman_coord"] = {-25.0563, -105.8344, 57.1217}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "digiden", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
	["digiden3"] = {				--Postal 296--
		['buy_price'] = 1200000,													-- Price to buy this market
		['sell_price'] = 550000, -- Price to sell this market
        ["coord"] = {1935.0681, 3821.0757, 32.4725}, -- Coordinate to open the menu
        ["garage_coord"] = {1933.7013, 3796.8423, 32.2976, 28.7579}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
        ["truck_parking_location"] = {1933.7013, 3796.8423, 32.2976, 28.7579},
		['map_blip_coord'] = {1937.5405, 3819.0642, 32.4725},
		["sell_blip_coords"] = {
            -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
            {1939.4458, 3821.7080, 32.4725},
			{1939.7412, 3824.4143, 32.4725},
        },
        ["deliveryman_coord"] = {1931.5781, 3824.9739, 32.4457}, -- Coord where the deliveryman will take the jobs you've created
        ["type"] = "digiden", -- Insert here the market type ID
        ["account"] = {
            -- Account settings for this store
            ["item"] = {
                -- Account that the money should be debited when buying item in the market (player can choose between 2)
                [1] = {
                    ["icon"] = "img/credit_card.png",
                    ["account"] = "bank"
                },
                [2] = {
                    ["icon"] = "img/cash.png",
                    ["account"] = "cash"
                }
            },
            ["store"] = "bank" -- Account that should be used with store expenses (owner)
        }
    },
	-- ["digiden4"] = {				--Postal 7141--
	-- 	['buy_price'] = 1200000,													-- Price to buy this market
	-- 	['sell_price'] = 550000,-- Price to sell this market
    --     ["coord"] = {-1530.59, -403.94, 35.64}, -- Coordinate to open the menu
    --     ["garage_coord"] = {-1524.1, -438.75, 35.44, 213.48}, -- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
    --     ["truck_parking_location"] = {-1524.1, -438.75, 35.44, 213.48},
	-- 	['map_blip_coord'] = {-1530.59, -403.94, 35.64},
	-- 	["sell_blip_coords"] = {
    --         -- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
    --         {-1527.2, -406.75, 35.64}
    --     },
    --     ["deliveryman_coord"] = {-1522.93, -407.37, 35.6}, -- Coord where the deliveryman will take the jobs you've created
    --     ["type"] = "digiden", -- Insert here the market type ID
    --     ["account"] = {
    --         -- Account settings for this store
    --         ["item"] = {
    --             -- Account that the money should be debited when buying item in the market (player can choose between 2)
    --             [1] = {
    --                 ["icon"] = "img/credit_card.png",
    --                 ["account"] = "bank"
    --             },
    --             [2] = {
    --                 ["icon"] = "img/cash.png",
    --                 ["account"] = "cash"
    --             }
    --         },
    --         ["store"] = "bank" -- Account that should be used with store expenses (owner)
    --     }
    -- },
	-- ["whitewidow"] = { --Postal 7191						   				    -- ID
	-- ['buy_price'] = 10000000,													-- Price to buy this market
	-- ['sell_price'] = 0,												-- Price to sell this market
	-- ['coord'] = {182.8126, -251.5964, 54.0705},
	-- ['garage_coord'] = {192.3425, -274.3117, 49.0471, 246.4440},
	-- ['truck_parking_location'] = {192.3425, -274.3117, 49.0471, 246.4440},
	-- ['map_blip_coord'] = {0, 0, 0},
	-- ['sell_blip_coords'] = {
	-- 	{176.1433, -239.5464, 50.0553}
	-- },
	-- ['deliveryman_coord'] = {204.6347, -246.3024, 53.9645},
	-- ['type'] = 'weedshop',
	-- ['account'] = {
	-- 	['item'] = {
	-- 		[1] = {
	-- 			['icon'] = 'img/credit_card.png',
	-- 			['account'] = 'bank'
	-- 		},
	-- 		[2] = {
	-- 			['icon'] = 'img/cash.png',
	-- 			['account'] = 'cash'
	-- 		}
	-- 	},
	-- 	['store'] = 'bank',
	-- }
	-- },
	["highnote"] = { --Postal 7209						   				    -- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-851.87, -241.36, 62.18},
		['garage_coord'] = {-843.54, -212.43, 37.32, 294.51},
		['truck_parking_location'] = {-843.54, -212.43, 37.32, 294.51},
		['map_blip_coord'] = {0, 0, 0},
		['sell_blip_coords'] = {
			{-848.79, -239.15, 30.98}
		},
		['deliveryman_coord'] = {-845.87, -219.57, 37.33},
		['type'] = 'weedshop',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["smoking"] = { --Postal 829					   				    -- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {442.56, -1896.99, 26.97},
		['garage_coord'] = {440.14, -1865.22, 27.40, 314.83},
		['truck_parking_location'] = {440.14, -1865.22, 27.40, 314.83},
		['map_blip_coord'] = {438.68, -1891.32, 26.97},
		['sell_blip_coords'] = {
			{444.82, -1894.99, 26.97}
		},
		['deliveryman_coord'] = {433.64, -1880.81, 26.93},
		['type'] = 'smoking',
		['account'] = {
			['item'] = {
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',
		}
	},
	["stance"] = { -- 437
		["buy_price"] = 1000000000,
		["sell_price"] = 1,
		["coord"] = {-3074.3838, 455.2912, 6.9732}, -- Main Menu
		["garage_coord"] = {-3053.4028, 449.8026, 6.6722, 194.1003}, -- Truck drops
		["truck_parking_location"] = {-3053.4028, 449.8026, 6.6722, 194.1003},
		['map_blip_coord'] = {-3075.2681, 453.0134, 6.9732},
		["sell_blip_coords"] = {
			{-3075.2681, 453.0134, 6.9732}, -- Buy Menu

		},
		["deliveryman_coord"] = {-3073.0837, 427.8835, 6.9432}, -- Jobs
		["type"] = "stance",
		["account"] = {

			["item"] = {
				[1] = {
					["icon"] = "img/credit_card.png",
					["account"] = "bank"
				},
				[2] = {
					["icon"] = "img/cash.png",
					["account"] = "cash"
				}
			},
			["store"] = "bank" -- Account that should be used with store expenses (owner)
		}
	},
	["LS Customs Garage Mechanic Shop"] = { --Postal 627										-- ID
	    ['buy_price'] = 10000000,													-- Price to buy this market
	    ['sell_price'] = 0,												-- Price to sell this market
	    ['coord'] = {-347.35, -132.47, 42.04},		-- Coordinate to open the menu
	    ['garage_coord'] = {-382.01, -110.34, 38.7, 199.77},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
	    ['truck_parking_location'] = {-382.01, -110.34, 38.7, 199.77},
		['map_blip_coord'] = {-347.35, -132.47, 42.04},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
	    	{-374.3, -94.37, 39.55}
	    },
	    ['deliveryman_coord'] = {-374.7626, -99.9938, 39.5463},							-- Coord where the deliveryman will take the jobs you've created
	    ['type'] = 'mechanic', 													-- Insert here the market type ID
	    ['account'] = {															-- Account settings for this store
	    	['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
	    		[1] = {
	    			['icon'] = 'img/credit_card.png',
	    			['account'] = 'bank'
	    		},
	    		[2] = {
	    			['icon'] = 'img/cash.png',
	    			['account'] = 'cash'
	    		}
	    	},
	    	['store'] = 'bank',													-- Account that should be used with store expenses (owner)
	}
	},
		["Cruisin Craftsmen Mechanic"] = { --Postal 865											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-349.4790, -1336.0486, 36.2897},		-- Coordinate to open the menu
		['garage_coord'] = {-346.5626, -1316.4744, 31.4423, 286.8848},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {-346.5626, -1316.4744, 31.4423, 286.8848},
		['map_blip_coord'] = {-349.4790, -1336.0486, 36.2897},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{-348.1559, -1327.9241, 31.4548}
		},
		['deliveryman_coord'] = {-326.7245, -1355.0610, 31.5921},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'mechanic', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
		["East Side Motorworks"] = { --Postal 771										-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {1150.8198, -793.7918, 57.6362},		-- Coordinate to open the menu
		['garage_coord'] = {1111.31, -772.94, 58.01, 358.5},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {1111.31, -772.94, 58.01, 358.5},
		['map_blip_coord'] = {1138.1078, -785.3152, 57.7907},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{1146.3162, -785.8110, 53.1032}
		},
		['deliveryman_coord'] = {1138.5568, -775.4243, 57.6014},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'mechanic', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
		["Seaton Sands"] = { --Postal 1015											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {1693.9626, 3703.6045, 38.9986},		-- Coordinate to open the menu
		['garage_coord'] = {1710.9305, 3708.3257, 34.3414, 212.2287},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {1707.9971, 3712.9009, 34.3430, 215.2090},
		['map_blip_coord'] = {1693.9626, 3703.6045, 38.9986},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{1701.0526, 3690.6284, 38.9986}
		},
		['deliveryman_coord'] = {1717.8583, 3685.4282, 34.5907},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'seaton', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	-- ["Burgershot"] = { --Postal 8092											-- ID
	-- 	['buy_price'] = 10000000,													-- Price to buy this market
	-- 	['sell_price'] = 0,												-- Price to sell this market
	-- 	['coord'] = {-1178.07, -894.02, 13.97},		-- Coordinate to open the menu
	-- 	['garage_coord'] = {-1175.74, -884.23, 13.93, 30.87},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
	-- 	['truck_parking_location'] = {-1175.74, -884.23, 13.93, 30.87},
	-- 	['map_blip_coord'] = {-1186.11, -885.86, 13.97},
	-- 	['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
	-- 		{-1198.66, -903.53, 13.97}
	-- 	},
	-- 	['deliveryman_coord'] = {-1185.38, -877.21, 13.8},							-- Coord where the deliveryman will take the jobs you've created
	-- 	['type'] = 'burgershot', 													-- Insert here the market type ID
	-- 	['account'] = {															-- Account settings for this store
	-- 		['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
	-- 			[1] = {
	-- 				['icon'] = 'img/credit_card.png',
	-- 				['account'] = 'bank'
	-- 			},
	-- 			[2] = {
	-- 				['icon'] = 'img/cash.png',
	-- 				['account'] = 'cash'
	-- 			}
	-- 		},
	-- 		['store'] = 'bank',													-- Account that should be used with store expenses (owner)
	-- 	}
	-- },
	["moo"] = { --Postal 725											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-589.11, -1064.18, 26.39},		-- Coordinate to open the menu
		['garage_coord'] = {-618.6, -1053.16, 21.79, 356.42},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {-618.6, -1053.16, 21.79, 356.42},
		['map_blip_coord'] = {-589.11, -1064.18, 26.39},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{-598.1, -1067.0, 22.34}
		},
		['deliveryman_coord'] = {-600.36, -1070.16, 22.33},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'moo', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["pitapan"] = { --Postal 750											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {257.79, -813.65, 30.2},		-- Coordinate to open the menu
		['garage_coord'] = {239.04, -782.37, 30.63, 161.59},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {239.04, -782.37, 30.63, 161.59},
		['map_blip_coord'] = {257.4510, -820.6282, 29.8858},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{250.3313, -811.8250, 30.1995}
		},
		['deliveryman_coord'] = {251.06, -826.53, 29.78},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'pitapan', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["bahama"] = { --Postal 669											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-1371.71, -629.68, 30.32},		-- Coordinate to open the menu
		['garage_coord'] = {-1406.13, -568.92, 30.3, 117.32},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {-1406.13, -568.92, 30.3, 117.32},
		['map_blip_coord'] = {-1371.71, -629.68, 30.32},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{-1401.11, -597.53, 30.32}
		},
		['deliveryman_coord'] = {-1383.18, -584.17, 30.18},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'bahama', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["photo"] = { --Postal 684											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-2719.52, -142.25, 16.07},		-- Coordinate to open the menu
		['garage_coord'] = {-2684.86, -138.33, 11.32, 41.2},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {-2684.86, -138.33, 11.32, 41.2},
		['map_blip_coord'] = {-2719.52, -142.25, 16.07},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{-2703.92, -140.11, 11.38}
		},
		['deliveryman_coord'] = {-2682.49, -151.03, 11.35},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'photo', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	-- ["cardshop"] = { --Postal 503										-- ID
	-- 	['buy_price'] = 100000000,													-- Price to buy this market
	-- 	['sell_price'] = 0,												-- Price to sell this market
	-- 	['coord'] = {-147.43, 217.6, 94.93},		-- Coordinate to open the menu
	-- 	['garage_coord'] = {-145.84, 207.41, 92.44, 268.51},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
	-- 	['truck_parking_location'] = {-145.84, 207.41, 92.44, 268.51},
	-- 	['map_blip_coord'] = {-145.7, 224.09, 94.93},
	-- 	['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
	-- 		{-145.7, 224.09, 94.93}
	-- 	},
	-- 	['deliveryman_coord'] = {-139.74, 229.62, 94.94},							-- Coord where the deliveryman will take the jobs you've created
	-- 	['type'] = 'cardshop', 													-- Insert here the market type ID
	-- 	['account'] = {															-- Account settings for this store
	-- 		['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
	-- 			[1] = {
	-- 				['icon'] = 'img/credit_card.png',
	-- 				['account'] = 'bank'
	-- 			},
	-- 			[2] = {
	-- 				['icon'] = 'img/cash.png',
	-- 				['account'] = 'cash'
	-- 			}
	-- 		},
	-- 		['store'] = 'bank',													-- Account that should be used with store expenses (owner)
	-- 	}
	-- },
	["lilypad"] = { --Postal 574											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {1117.09, -641.49, 59.89},		-- Coordinate to open the menu
		['garage_coord'] = {1216.35, -654.97, 63.81, 110.54},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {1216.35, -654.97, 63.81, 110.54},
		['map_blip_coord'] = {1117.09, -641.49, 59.89},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{1116.6, -638.7, 56.7}
		},
		['deliveryman_coord'] = {1123.88, -658.32, 56.78},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'lilypad', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["boathouse"] = { --Postal 574											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {1547.19, 3794.8, 34.51},		-- Coordinate to open the menu
		['garage_coord'] = {1566.38, 3790.61, 34.22, 222.64},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {1566.38, 3790.61, 34.22, 222.64},
		['map_blip_coord'] = {1512.44, 3775.15, 34.51},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{1545.71, 3793.99, 34.51}
		},
		['deliveryman_coord'] = {1536.36, 3781.83, 34.52},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'boathouse', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
	["saltlab"] = { --Postal 574											-- ID
		['buy_price'] = 10000000,													-- Price to buy this market
		['sell_price'] = 0,												-- Price to sell this market
		['coord'] = {-3065.01, 459.62, 11.8},		-- Coordinate to open the menu
		['garage_coord'] = {-3054.11, 448.08, 6.67, 247.27},						-- Garage coordinates, where the trucks will spawn (coordinates composed of x, y, z, h)
		['truck_parking_location'] = {-3054.11, 448.08, 6.67, 247.27},
		['map_blip_coord'] = {-3071.5, 442.77, 11.8},
		['sell_blip_coords'] = {												-- The coordinates where customes will buy things on this store (coordinates composed of x, y, z)
			{-3071.5, 442.77, 11.8}
		},
		['deliveryman_coord'] = {-3057.19, 458.44, 6.83},							-- Coord where the deliveryman will take the jobs you've created
		['type'] = 'saltlab', 													-- Insert here the market type ID
		['account'] = {															-- Account settings for this store
			['item'] = {														-- Account that the money should be debited when buying item in the market (player can choose between 2)
				[1] = {
					['icon'] = 'img/credit_card.png',
					['account'] = 'bank'
				},
				[2] = {
					['icon'] = 'img/cash.png',
					['account'] = 'cash'
				}
			},
			['store'] = 'bank',													-- Account that should be used with store expenses (owner)
		}
	},
}

-- Here you configure each type of market available to buy
Config.market_types = {
	['247store'] = {							-- Market type ID
		['stock_capacity'] = 1000,				-- Max stock capacity
		['max_employees'] = 2,					-- Max employees
		['required_job'] = {},					-- Required job do purchase goods in this store (set to {} to dont require any job here, or put the job name there like this: ['required_job'] = {'cop', 'gang', 'job_name'},)
		['upgrades'] = {						-- Definition of each upgrade
			['stock'] = {						-- Stock capacity
				['price'] = 25000,				-- Price to upgrade
				['level_reward'] = {			-- Reward of each level (max level: 5)
					[0] = 0,
					[1] = 500,
					[2] = 1000,
					[3] = 2000,
					[4] = 3000,
					[5] = 4000,
				}
			},
			['truck'] = {						-- Truck capacity
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {				-- Relationship
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 5,		-- The max amount of categories that can be purchased
		['categories'] = {						-- Here you configure the categories available to purchase in your store
			"food_market", "drink_market", "smoke_market", "misc_market"
		},
		['default_categories'] = {				-- Here you can configure the categories available when the store has no owner
			"food_market", "drink_market", "smoke_market", "misc_market"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 59,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "Market",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 2,						-- Blip Color
			['scale'] = 0.7,					-- Blip Scale
		}
	},

	['ammunation'] = {
		['stock_capacity'] = 200,				-- Max stock capacity
        ['max_employees'] = 2,
		['required_job'] = {},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 3,
		['categories'] = {
			"melee_weapons", "pistol_weapons", "ammo_weapons"
		},
		['default_categories'] = {
			"melee_weapons", "pistol_weapons", "ammo_weapons"
		},
		['blips'] = {
			['id'] = 156,
			['name'] = "Ammunation",
			['color'] = 75,
			['scale'] = 0.7,
		}
	},

	['hardware'] = {
		['stock_capacity'] = 1000,				-- Max stock capacity
        ['max_employees'] = 2,
		['required_job'] = {},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 1,
		['categories'] = {
			"tools"
		},
		['default_categories'] = {
			"tools"
		},
		['blips'] = {
			['id'] = 643,
			['name'] = "Hardware",
			['color'] = 37,
			['scale'] = 0.7,
		}
	},

    ['sports'] = {
		['stock_capacity'] = 1000,				-- Max stock capacity
        ['max_employees'] = 2,
		['required_job'] = {},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 1,
		['categories'] = {
			"sporting_goods"
		},
		['default_categories'] = {
			"sporting_goods"
		},
		['blips'] = {
			['id'] = 549,  
			['name'] = "Sporting Goods",
			['color'] = 37,
			['scale'] = 0.7,
		}
	},

	['liquor'] = {
		['stock_capacity'] = 1000,				-- Max stock capacity
        ['max_employees'] = 2,
		['required_job'] = {},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 1,
		['categories'] = {
			"alcohol_market"
		},
		['default_categories'] = {
			"alcohol_market"
		}
		-- ['blips'] = {
		-- 	['id'] = 52,
		-- 	['name'] = "Liquor Store",
		-- 	['color'] = 5,
		-- 	['scale'] = 0.7,
		-- }
	},

	['digiden'] = {
		['stock_capacity'] = 200,				-- Max stock capacity
        ['max_employees'] = 2,
		['required_job'] = {},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
		},
		['max_purchasable_categories'] = 1,
		['categories'] = {
			"electronics_market"
		},
		['default_categories'] = {
			"electronics_market"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 521,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "Electronics Store",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 32,						-- Blip Color
			['scale'] = 0.6,					-- Blip Scale
		}
	},

	['stance'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'stance'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 6,
		['categories'] = {
			"stance"
		},
		['default_categories'] = {
			"stance"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	
	['mechanic'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'lscustoms', 'ccm', 'ss', 'esm'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 500,
					[2] = 1000,
					[3] = 1500,
					[4] = 2000,
					[5] = 3000,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"mechanic"
		},
		['default_categories'] = {
			"mechanic"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},

	['seaton'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'ss'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 500,
					[2] = 1000,
					[3] = 1500,
					[4] = 2000,
					[5] = 3000,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"seaton"
		},
		['default_categories'] = {
			"seaton"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},

	['weedshop'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'whitewidow', 'highnote'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"weedshop"
		},
		['default_categories'] = {
			"weedshop"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},

	['smoking'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'smoking'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"smoking"
		},
		['default_categories'] = {
			"smoking"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},

	['moo'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'moo'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"moo"
		},
		['default_categories'] = {
			"moo"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},

	['bahama'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'bahama'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"bahama"
		},
		['default_categories'] = {
			"bahama"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	['pitapan'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'pitapan'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"pitapan"
		},
		['default_categories'] = {
			"pitapan"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	['lilypad'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'lilypad'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"lilypad"
		},
		['default_categories'] = {
			"lilypad"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	['boathouse'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'boathouse'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"boathouse"
		},
		['default_categories'] = {
			"boathouse"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	['saltlab'] = {
		['stock_capacity'] = 2000, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'saltlabsmoothies'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 20,
					[4] = 30,
					[5] = 40,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"saltlab"
		},
		['default_categories'] = {
			"saltlab"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 0,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 0,						-- Blip Color
			['scale'] = 0,					-- Blip Scale
		}
	},
	['photo'] = {
		['stock_capacity'] = 100, -- Max stock capacity
		['max_employees'] = 3,
		['required_job'] = {'photo'},
		['upgrades'] = {
			['stock'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 250,
					[2] = 500,
					[3] = 750,
					[4] = 1000,
					[5] = 1500,
				}
			},
			['truck'] = {
				['price'] = 25000,
				['level_reward'] = {
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['relationship'] = {
				['price'] = 35000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 13,
					[5] = 20,
				}
			},
		},
		['trucks'] = {
			[0] = 'gstslt1',
			[1] = 'gstslt1',
			[2] = 'mule3',
			[3] = 'mule3',
			[4] = 'tooltruck',
			[5] = 'tooltruck'
			},
		['max_purchasable_categories'] = 9,
		['categories'] = {
			"lights"
		},
		['default_categories'] = {
			"lights"
		},
		['blips'] = {							-- Create the blips on map
			['id'] = 184,						-- Blip ID [Set this value 0 to dont have blip]
			['name'] = "Vibe Studios",				-- Blip Name [Will be replaced when the owner rename the store]
			['color'] = 15,						-- Blip Color
			['scale'] = 0.7,					-- Blip Scale
		}
	},
	-- ['cardshop'] = {
	-- 	['stock_capacity'] = 200, -- Max stock capacity
	-- 	['max_employees'] = 3,
	-- 	['required_job'] = {},
	-- 	['upgrades'] = {
	-- 		['stock'] = {
	-- 			['price'] = 25000,
	-- 			['level_reward'] = {
	-- 				[0] = 0,
	-- 				[1] = 250,
	-- 				[2] = 500,
	-- 				[3] = 750,
	-- 				[4] = 1000,
	-- 				[5] = 1500,
	-- 			}
	-- 		},
	-- 		['truck'] = {
	-- 			['price'] = 25000,
	-- 			['level_reward'] = {
	-- 				[0] = 0,
	-- 				[1] = 25,
	-- 				[2] = 50,
	-- 				[3] = 100,
	-- 				[4] = 200,
	-- 				[5] = 300,
	-- 			}
	-- 		},
	-- 		['relationship'] = {
	-- 			['price'] = 35000,
	-- 			['level_reward'] = {
	-- 				[0] = 0,
	-- 				[1] = 3,
	-- 				[2] = 5,
	-- 				[3] = 8,
	-- 				[4] = 13,
	-- 				[5] = 20,
	-- 			}
	-- 		},
	-- 	},
	-- 	['trucks'] = {
	-- 		[0] = 'gstslt1',
	-- 		[1] = 'gstslt1',
	-- 		[2] = 'mule3',
	-- 		[3] = 'mule3',
	-- 		[4] = 'tooltruck',
	-- 		[5] = 'tooltruck'
	-- 		},
	-- 	['max_purchasable_categories'] = 9,
	-- 	['categories'] = {
	-- 		"cards"
	-- 	},
	-- 	['default_categories'] = {
	-- 		"cards"
	-- 	},
	-- 	['blips'] = {							-- Create the blips on map
	-- 		['id'] = 671,						-- Blip ID [Set this value 0 to dont have blip]
	-- 		['name'] = "HardCore Comic",				-- Blip Name [Will be replaced when the owner rename the store]
	-- 		['color'] = 8,						-- Blip Color
	-- 		['scale'] = .7,					-- Blip Scale
	-- 	}
	-- },
}

-- Here you configure each category to purchase inside the markets
Config.market_categories = {
	['alcohol_market'] = {
		['page_name'] = "Alcohol",
		['page_desc'] = "Indulge in a sophisticated and diverse collection of alcoholic beverages, from premium spirits to fine wines and craft beers, all available at our supermarket to elevate your drinking experience",
		['page_icon'] = '<img src="img/categories/alcohol-icon.png" style="padding:15px">', -- Its the icon that will appear in the page tab. "padding:12px" means that the image will be 15px smaller, use it to resize the image if needed. Tip: You can get nice images here: https://icon-icons.com/search/icons/
		-- ['page_icon'] = '<i class="fa-solid fa-burger"></i>', -- As an alternative to the page icon, you can use icons from here (https://fontawesome.com/search?m=free&s=solid)
		['page_img'] = 'img/categories/alcohol.png',	-- This is the category image in the page to buy categories
		['category_buy_price'] = 2500, 			-- Price to buy the category
		['category_sell_price'] = 1250, 		-- Price to sell the category
		['items'] = {
			['beer'] = {						-- The item ID
				['name'] = "Beer",				-- The item display name
				['price_to_customer'] = 300,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 210,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'beer.png',			-- Image file name of this item inside nui/img/items
			},
			['whiskey'] = {
				['name'] = "Whiskey",
				['price_to_customer'] = 300,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 210,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'whiskey.png',
			},
			['vodka'] = {
				['name'] = "Vodka",
				['price_to_customer'] = 300,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 210,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'vodka.png',
			},
			['wine'] = {
				['name'] = "Wine",
				['price_to_customer'] = 300,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 210,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'wine.png',
			},
		}
	},

	['drink_market'] = {
		['page_name'] = "Drinks",
		['page_desc'] = "Quench your thirst and elevate your beverage game with our diverse range of refreshing drinks, from classic favorites to innovative flavors, all waiting for you to discover at our supermarket",
		['page_icon'] = '<img src="img/categories/drinks-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/drinks.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['juicebox'] = {
				['name'] = "Juice Box",
				['price_to_customer'] = 250,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 175,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'juicebox.png',
			},
			['popsoda'] = {
				['name'] = "Pop Soda",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'popsoda.png',
			},
			['greentea'] = {
				['name'] = "Green Tea",
				['price_to_customer'] = 250,		-- Price the customer will pay when buy the product in store
				['price_to_customer_min'] = 1,	-- Min price that the owner will be able to set on this product
				['price_to_customer_max'] = 300,	-- Max price that the owner will be able to set on this product
				['price_to_export'] = 0,		-- Price the owner will receive when exporting the item
				['price_to_owner'] = 175,			-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'greentea.png',
			},
		}
	},

	['smoke_market'] = {
		['page_name'] = "Smoking",
		['page_desc'] = "Sit back and relax with our top quality cigarettes. Don't forget to get yourself a lighter so you can enjoy instant stress relief, only at our supermarket.",
		['page_icon'] = '<img src="img/categories/weed.png" style="padding:15px">',
		['page_img'] = 'img/categories/weed.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['offportcigarette'] = {
				['name'] = "Offport Cigarette",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 245,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'offportcigarette.png',
			},
			['offportspack'] = {
				['name'] = "Offport Cigarette Pack",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 2450,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'offportspack.png',
			},
			['lighter'] = {
				['name'] = "Lighter",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 350,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'lighter.png',
			},
		}
	},

	['misc_market'] = {
		['page_name'] = "Miscellaneous",
		['page_desc'] = "Explore our variety of miscellaneous items and tools and experience products such as a portable outfit bag or bandages, at our supermarket",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['bandage'] = {
				['name'] = "Bandage",
				['price_to_customer'] = 75,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 75,
				['price_to_export'] = 0,
				['price_to_owner'] = 50,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'bandage.png',
			},
			['kq_outfitbag'] = {
				['name'] = "Outfit Bag",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'kq_outfitbag.png',
			},
			['contract'] = {
				['name'] = "Vehicle Contract",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'contract.png',
			},
			['skateboard'] = {
				['name'] = "Skateboard",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 3500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'skateboard.png',
			},
			-- ['finescale'] = {
			-- 	['name'] = "Fine Scale",
			-- 	['price_to_customer'] = 3500,
			-- 	['price_to_customer_min'] = 300,
			-- 	['price_to_customer_max'] = 3500,
			-- 	['price_to_export'] = 0,
			-- 	['price_to_owner'] = 2450,
			-- 	['amount_to_owner'] = 50,	
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'finescale.png',
			-- },
			['spray'] = {
				['name'] = "Spray Can",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 300,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 300,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'spray.png',
			},
			['spray_remover'] = {
				['name'] = "Spray Remover",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 200,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 200,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'spray_remover.png',
			},
		}
	},

	['food_market'] = {
		['page_name'] = "Food",
		['page_desc'] = "Explore a delicious selection of fresh and high-quality food options that will tantalize your taste buds and satisfy your cravings, all conveniently available at our supermarket",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['hotdog'] = {
				['name'] = "Hotdog",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 200,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'hotdog.png',
			},
			['hoagie'] = {
				['name'] = "Hoagie",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'hoagie.png',
			},
			['pocketz'] = {
				['name'] = "Pocketz",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'pocketz.png',
			},
			['chocolatebar'] = {
				['name'] = "Chocolate Bar",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'chocolatebar.png',
			},
			['gummyworms'] = {
				['name'] = "Gummy Worms",
				['price_to_customer'] = 250,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 250,
				['price_to_export'] = 0,
				['price_to_owner'] = 175,
				['amount_to_owner'] = 100,
				['amount_to_delivery'] = 200,
				['img'] = 'gummyworms.png',
			},
			-- ['bakingsoda'] = {
			-- 	['name'] = "Baking Soda",
			-- 	['price_to_customer'] = 50,
			-- 	['price_to_customer_min'] = 1,
			-- 	['price_to_customer_max'] = 50,
			-- 	['price_to_export'] = 0,
			-- 	['price_to_owner'] = 35,
			-- 	['amount_to_owner'] = 250,
			-- 	['amount_to_delivery'] = 400,
			-- 	['img'] = 'bakingsoda.png',
			-- },
		}
	},

	['electronics_market'] = {
		['page_name'] = "Electronics",
		['page_desc'] = "Experience the latest in technology with our wide range of cutting-edge electronics, from smartphones to home entertainment systems, available only at DigitalDen",
		['page_icon'] = '<img src="img/categories/electronics-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/electronics.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['blank_usb'] = {
				['name'] = "Blank USB",
				['price_to_customer'] = 3000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 3000,
				['price_to_export'] = 0,
				['price_to_owner'] = 2100,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'blank_usb.png',
			},
			['blank_card'] = {
				['name'] = "Blank Card",
				['price_to_customer'] = 3000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 3000,
				['price_to_export'] = 0,
				['price_to_owner'] = 2100,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'blank_card.png',
			},
			['laptop'] = {
				['name'] = "Laptop",
				['price_to_customer'] = 4000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 4000,
				['price_to_export'] = 0,
				['price_to_owner'] = 2800,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'laptop.png',
			},
			['cryptotablet'] = {
				['name'] = "Crypto Tablet",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 3500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'cryptotablet.png',
			},
			['radio'] = {
				['name'] = "Radio",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'radio.png',
			},
			['phone'] = {
				['name'] = "Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone.png',
			},
			['phone_black'] = {
				['name'] = "Black Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_black.png',
			},
			['phone_white'] = {
				['name'] = "White Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_white.png',
			},
			['phone_grey'] = {
				['name'] = "Grey Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_grey.png',
			},
			['phone_red'] = {
				['name'] = "Red Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_red.png',
			},
			['phone_orange'] = {
				['name'] = "Orange Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_orange.png',
			},
			['phone_yellow'] = {
				['name'] = "Yellow Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_yellow.png',
			},
			['phone_blue'] = {
				['name'] = "Blue Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_blue.png',
			},
			['phone_lime'] = {
				['name'] = "Lime Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_lime.png',
			},
			['phone_pink'] = {
				['name'] = "Pink Phone",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'phone_pink.png',
			},
			['drone'] = {
				['name'] = "Drone",
				['price_to_customer'] = 7500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 7500,
				['price_to_export'] = 0,
				['price_to_owner'] = 5250,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'drone.png',
			},
			['bodycam'] = {
				['name'] = "Bodycam",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1050,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'bodycam.png',
			},
			['fitbit'] = {
				['name'] = "Fitbit",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1050,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'fitbit.png',
			},
			['printer'] = {
				['name'] = "Printer",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 3500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'printer.png',
			},
			['printerpaper'] = {
				['name'] = "Printer Paper",
				['price_to_customer'] = 100,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 100,
				['price_to_export'] = 0,
				['price_to_owner'] = 70,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'printerpaper.png',
			},
			['printerink'] = {
				['name'] = "Printer Ink",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1050,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'printerink.png',
			},
		}
	},

	-- ['utilities_market'] = {
	-- 	['page_name'] = "Utilities",
	-- 	['page_desc'] = "Quality tools and equipment for any project, from hand tools to power tools, designed to help you achieve precision and efficiency, available at our supermarket",
	-- 	['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/utilities.png',
	-- 	['category_buy_price'] = 3000,
	-- 	['category_sell_price'] = 1500,
	-- 	['items'] = {
	-- 		['repairkit'] = {
	-- 			['name'] = "Repairkit",
	-- 			['price_to_customer'] = 250,
	-- 			['price_to_customer_min'] = 125,
	-- 			['price_to_customer_max'] = 500,
	-- 			['price_to_export'] = 225,
	-- 			['price_to_owner'] = 200,
	-- 			['amount_to_owner'] = 2,
	-- 			['amount_to_delivery'] = 2,
	-- 			['img'] = 'repairkit.png',
	-- 		},
	-- 		['cleaning_kit'] = {
	-- 			['name'] = "Cleaning Kit",
	-- 			['price_to_customer'] = 150,
	-- 			['price_to_customer_min'] = 75,
	-- 			['price_to_customer_max'] = 300,
	-- 			['price_to_export'] = 135,
	-- 			['price_to_owner'] = 125,
	-- 			['amount_to_owner'] = 2,
	-- 			['amount_to_delivery'] = 2,
	-- 			['img'] = 'cleaning_kit.png',
	-- 		},
	-- 		['screwdriverset'] = {
	-- 			['name'] = "Toolkit",
	-- 			['price_to_customer'] = 350,
	-- 			['price_to_customer_min'] = 175,
	-- 			['price_to_customer_max'] = 700,
	-- 			['price_to_export'] = 315,
	-- 			['price_to_owner'] = 300,
	-- 			['amount_to_owner'] = 2,
	-- 			['amount_to_delivery'] = 2,
	-- 			['img'] = 'screwdriverset.png',
	-- 		},
	-- 	}
	-- },

	['melee_weapons'] = {
		['page_name'] = "Melee Weapons",
		['page_desc'] = "Get up close and personal with our selection of high-quality melee weapons, including knives, swords, and clubs, perfect for any self-defense scenario",
		['page_icon'] = '<img src="img/categories/weapons-melee-icon.png" style="padding:14px">',
		['page_img'] = 'img/categories/weapons-melee.png',
		['category_buy_price'] = 10000,
		['category_sell_price'] = 5000,
		['items'] = {
			['weapon_knife'] = {
				['name'] = "Knife",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,					-- Set this to true if the item is a weapon (if you're having problems receiving weapons, try set this to false)
				['requires_license'] = false,			-- Set to true if it requires a weapon license to purchase
				['max_amount_to_purchase'] = 1,			-- This is the max amount the customer can purchase that item at once
				['img'] = 'weapon_knife.png',
				['metadata'] = {

				}
			},
			['weapon_bat'] = {
				['name'] = "Baseball Bat",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_bat.png',
				['metadata'] = {
					
				}
			},
			['weapon_crowbar'] = {
				['name'] = "Crowbar",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_crowbar.png',
				['metadata'] = {
					
				}
			},
			['weapon_hammer'] = {
				['name'] = "Hammer",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_hammer.png',
				['metadata'] = {
					
				}
			},
			['weapon_machete'] = {
				['name'] = "Machete",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_machete.png',
				['metadata'] = {
					
				}
			},
			['weapon_knuckle'] = {
				['name'] = "Knuckle",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_knuckle.png',
				['metadata'] = {
					
				}
			},
			['weapon_wrench'] = {
				['name'] = "Wrench",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_wrench.png',
				['metadata'] = {
					
				}
			},
		}
	},

	['pistol_weapons'] = {
		['page_name'] = "Pistol Weapons",
		['page_desc'] = "Protect yourself with our collection of reliable and powerful pistol weapons, designed to provide accuracy and stopping power in any situation",
		['page_icon'] = '<img src="img/categories/weapons-pistol-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/weapons-pistol.png',
		['category_buy_price'] = 25000,
		['category_sell_price'] = 12500,
		['items'] = {
			['WEAPON_PXS9'] = {
				['name'] = "BLUE XTREME S9",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 3500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = true,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_PXS9.png',
				['metadata'] = {
					
				}
			},
			['WEAPON_PHW45'] = {
				['name'] = "PINK HAWK 45",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 3500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = true,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_PHW45.png',
				['metadata'] = {
					
				}
			},
			['WEAPON_PT19'] = {
				['name'] = "PURPLE TITAN 19",
				['price_to_customer'] = 7500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 7500,
				['price_to_export'] = 0,
				['price_to_owner'] = 5250,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = true,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_PT19.png',
				['metadata'] = {
					
				}
			},
			['WEAPON_M320A'] = {
				['name'] = "M320",
				['price_to_customer'] = 8000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 8000,
				['price_to_export'] = 0,
				['price_to_owner'] = 5600,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = true,
				['max_amount_to_purchase'] = 1,
				['img'] = 'weapon_M320A.png',
				['metadata'] = {
					
				}
			},
			['WEAPON_TARANTULA'] = {
				['name'] = "Paintball Gun",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['is_weapon'] = true,
				['requires_license'] = false,
				['max_amount_to_purchase'] = 1,
				['img'] = 'WEAPON_TARANTULA.png',
				['metadata'] = {
					
				}
			},
		}
	},

	-- ['rifle_weapons'] = {
	-- 	['page_name'] = "Rifle Weapons",
	-- 	['page_desc'] = "Dominate the battlefield with our high-performance assault rifles, built to provide accuracy, range, and stopping power in any combat situation",
	-- 	['page_icon'] = '<img src="img/categories/weapons-rifle-icon.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/weapons-rifle.png',
	-- 	['category_buy_price'] = 60000,
	-- 	['category_sell_price'] = 30000,
	-- 	['items'] = {
	-- 		['weapon_assaultrifle'] = {
	-- 			['name'] = "Assault Rifle",
	-- 			['price_to_customer'] = 25000,
	-- 			['price_to_customer_min'] = 12500,
	-- 			['price_to_customer_max'] = 50000,
	-- 			['price_to_export'] = 25000,
	-- 			['price_to_owner'] = 18750,
	-- 			['amount_to_owner'] = 1,
	-- 			['amount_to_delivery'] = 1,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_assaultrifle.png',
	-- 		},
	-- 		['weapon_carbinerifle'] = {
	-- 			['name'] = "Carbine Rifle",
	-- 			['price_to_customer'] = 40000,
	-- 			['price_to_customer_min'] = 20000,
	-- 			['price_to_customer_max'] = 80000,
	-- 			['price_to_export'] = 36000,
	-- 			['price_to_owner'] = 30000,
	-- 			['amount_to_owner'] = 1,
	-- 			['amount_to_delivery'] = 1,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_carbinerifle.png',
	-- 		},
	-- 	}
	-- },

	-- ['shotgun_weapons'] = {
	-- 	['page_name'] = "Shotgun Weapons",
	-- 	['page_desc'] = "Get up close and personal with our devastating assault shotguns, designed for maximum impact and stopping power at close range combat",
	-- 	['page_icon'] = '<img src="img/categories/weapons-shotgun-icon.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/weapons-shotgun.png',
	-- 	['category_buy_price'] = 60000,
	-- 	['category_sell_price'] = 30000,
	-- 	['items'] = {
	-- 		['weapon_pumpshotgun'] = {
	-- 			['name'] = "Pump Shotgun",
	-- 			['price_to_customer'] = 25000,
	-- 			['price_to_customer_min'] = 12500,
	-- 			['price_to_customer_max'] = 50000,
	-- 			['price_to_export'] = 25000,
	-- 			['price_to_owner'] = 18750,
	-- 			['amount_to_owner'] = 1,
	-- 			['amount_to_delivery'] = 1,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_pumpshotgun.png',
	-- 		},
	-- 	}
	-- },

	-- ['smg_weapons'] = {
	-- 	['page_name'] = "SMG Weapons",
	-- 	['page_desc'] = "Experience the perfect blend of power and mobility with our versatile and reliable SMG weapons, ideal for a variety of combat scenarios",
	-- 	['page_icon'] = '<img src="img/categories/weapons-smg-icon.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/weapons-smg.png',
	-- 	['category_buy_price'] = 50000,
	-- 	['category_sell_price'] = 25000,
	-- 	['items'] = {
	-- 		['weapon_microsmg'] = {
	-- 			['name'] = "Micro SMG",
	-- 			['price_to_customer'] = 15000,
	-- 			['price_to_customer_min'] = 7500,
	-- 			['price_to_customer_max'] = 30000,
	-- 			['price_to_export'] = 12000,
	-- 			['price_to_owner'] = 11250,
	-- 			['amount_to_owner'] = 1,
	-- 			['amount_to_delivery'] = 1,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_microsmg.png',
	-- 		},
	-- 		['weapon_smg'] = {
	-- 			['name'] = "SMG",
	-- 			['price_to_customer'] = 17000,
	-- 			['price_to_customer_min'] = 8500,
	-- 			['price_to_customer_max'] = 34000,
	-- 			['price_to_export'] = 14000,
	-- 			['price_to_owner'] = 12750,
	-- 			['amount_to_owner'] = 1,
	-- 			['amount_to_delivery'] = 1,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_smg.png',
	-- 		},
	-- 	}
	-- },

	-- ['throwable_weapons'] = {
	-- 	['page_name'] = "Throwable Weapons",
	-- 	['page_desc'] = "Expand your tactical options with our collection of throwable weapons, perfect for gaining an edge in any combat scenario",
	-- 	['page_icon'] = '<img src="img/categories/weapons-throwable-icon.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/weapons-throwable.png',
	-- 	['category_buy_price'] = 40000,
	-- 	['category_sell_price'] = 20000,
	-- 	['items'] = {
	-- 		['weapon_molotov'] = {
	-- 			['name'] = "Molotov",
	-- 			['price_to_customer'] = 1600,
	-- 			['price_to_customer_min'] = 800,
	-- 			['price_to_customer_max'] = 3200,
	-- 			['price_to_export'] = 1325,
	-- 			['price_to_owner'] = 1200,
	-- 			['amount_to_owner'] = 100,	
	-- 			['amount_to_delivery'] = 200,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_molotov.png',
	-- 		},
	-- 		['weapon_flare'] = {
	-- 			['name'] = "Flare",
	-- 			['price_to_customer'] = 700,
	-- 			['price_to_customer_min'] = 350,
	-- 			['price_to_customer_max'] = 1400,
	-- 			['price_to_export'] = 550,
	-- 			['price_to_owner'] = 475,
	-- 			['amount_to_owner'] = 100,	
	-- 			['amount_to_delivery'] = 200,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = true,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_flare.png',
	-- 		},
	-- 	}
	-- },

	['ammo_weapons'] = {
		['page_name'] = "Ammo & More",
		['page_desc'] = "Stay locked and loaded with our extensive range of high-quality ammunition, designed to deliver maximum power and accuracy to your weapon",
		['page_icon'] = '<img src="img/categories/weapons-ammo-icon.png" style="padding:16px">',
		['page_img'] = 'img/categories/weapons-ammo.png',
		['category_buy_price'] = 35000,
		['category_sell_price'] = 17500,
		['items'] = {
			['pistol_case'] = {
				['name'] = "Pistol Ammo Case (12)",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 350,	
				['amount_to_delivery'] = 200,
				['requires_license'] = true,
				['img'] = 'pistol_case.png',
			},
			['paint_case'] = {
				['name'] = "Paintball Package (100)",
				['price_to_customer'] = 5000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 5000,
				['price_to_export'] = 0,
				['price_to_owner'] = 20,
				['amount_to_owner'] = 350,	
				['amount_to_delivery'] = 200,
				['requires_license'] = false,
				['img'] = 'paint_case.png',
			},
			['kevlar'] = {
				['name'] = "Kevlar",
				['price_to_customer'] = 200,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 200,
				['price_to_export'] = 0,
				['price_to_owner'] = 100,
				['amount_to_owner'] = 350,	
				['amount_to_delivery'] = 200,
				['requires_license'] = false,
				['img'] = 'kevlar.png',
			},
		}
	},

	-- ['others_weapons'] = {
	-- 	['page_name'] = "Miscellaneous",
	-- 	['page_desc'] = "Be prepared for any outdoor adventure with our range of essential gear, including parachutes, flares, and other survival tools, available at our store",
	-- 	['page_icon'] = '<img src="img/categories/weapons-other-icon.png" style="padding:17px">',
	-- 	['page_img'] = 'img/categories/weapons-other.png',
	-- 	['category_buy_price'] = 5000,
	-- 	['category_sell_price'] = 2500,
	-- 	['items'] = {
	-- 		['weapon_flaregun'] = {
	-- 			['name'] = "Flare Gun",
	-- 			['price_to_customer'] = 1000,
	-- 			['price_to_customer_min'] = 500,
	-- 			['price_to_customer_max'] = 2000,
	-- 			['price_to_export'] = 750,
	-- 			['price_to_owner'] = 675,
	-- 			['amount_to_owner'] = 5,
	-- 			['amount_to_delivery'] = 5,
	-- 			['is_weapon'] = true,
	-- 			['requires_license'] = false,
	-- 			['max_amount_to_purchase'] = 1,
	-- 			['img'] = 'weapon_flaregun.png',
	-- 			['metadata'] = {

	-- 			}
	-- 		},
	-- 		['parachute'] = {
	-- 			['name'] = "Parachute",
	-- 			['price_to_customer'] = 2500,
	-- 			['price_to_customer_min'] = 1250,
	-- 			['price_to_customer_max'] = 5000,
	-- 			['price_to_export'] = 2500,
	-- 			['price_to_owner'] = 1875,
	-- 			['amount_to_owner'] = 5,
	-- 			['amount_to_delivery'] = 5,
	-- 			['img'] = 'parachute.png',
	-- 		},
	-- 		['armor'] = {
	-- 			['name'] = "Armor",
	-- 			['price_to_customer'] = 5500,
	-- 			['price_to_customer_min'] = 2750,
	-- 			['price_to_customer_max'] = 11000,
	-- 			['price_to_export'] = 4500,
	-- 			['price_to_owner'] = 4125,
	-- 			['amount_to_owner'] = 2,
	-- 			['amount_to_delivery'] = 2,
	-- 			['img'] = 'armor.png',
	-- 		},
	-- 	}
	-- },

	['tools'] = {
		['page_name'] = "Utilities",
		['page_desc'] = "Quality tools and equipment for any project, from hand tools to power tools, designed to help you achieve precision and efficiency, available at our supermarket",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			["lockpick"] = {
				-- The item ID
				["name"] = "Lockpick", -- The item display name
				["price_to_customer"] = 1000,
				["price_to_customer_min"] = 1,				 	-- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1000,				-- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 700, 						-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				["img"] = "lockpick.png", 						-- Image file name of this item inside nui/img
			},
			["pliers"] = {
				-- The item ID
				["name"] = "Pliers", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,				 	-- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,				-- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, 						-- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "pliers.png", 						-- Image file name of this item inside nui/img
			},
			-- ["advancedlockpick"] = {
			-- 	-- The item ID
			-- 	["name"] = "Advanced Lockpick", -- The item display name
			-- 	["price_to_customer"] = 2500,
			-- 	["price_to_customer_min"] = 2500,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2500,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1250, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 100,	
			-- 	['amount_to_delivery'] = 200,
			-- 	["img"] = "advancedlockpick.png", -- Image file name of this item inside nui/img
			-- },
			["drill"] = {
				-- The item ID
				["name"] = "Drill", -- The item display name
				["price_to_customer"] = 10000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 10000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 7000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "drill.png", -- Image file name of this item inside nui/img
			},
			["goldpan"] = {
				-- The item ID
				["name"] = "Goldpan", -- The item display name
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 3500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "goldpan.png", -- Image file name of this item inside nui/img
			},
			["firework1"] = {
				-- The item ID
				["name"] = "Fireworks", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				["img"] = "firework1.png", -- Image file name of this item inside nui/img
			},
			["firework2"] = {
				-- The item ID
				["name"] = "Fireworks", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "firework2.png", -- Image file name of this item inside nui/img
			},
			["firework3"] = {
				-- The item ID
				["name"] = "Fireworks", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "firework3.png", -- Image file name of this item inside nui/img
			},
			["firework4"] = {
				-- The item ID
				["name"] = "Fireworks", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "firework4.png", -- Image file name of this item inside nui/img
			},
			["large_usa_sparkler"] = {
				-- The item ID
				["name"] = "Large USA Sparkler", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_usa_sparkler.png", -- Image file name of this item inside nui/img
			},
			["large_blue_sparkler"] = {
				-- The item ID
				["name"] = "Large Blue Sparkler", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_blue_sparkler.png", -- Image file name of this item inside nui/img
			},
			["large_green_sparkler"] = {
				-- The item ID
				["name"] = "Large Green Sparkler", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_green_sparkler.png", -- Image file name of this item inside nui/img
			},
			["large_pink_sparkler"] = {
				-- The item ID
				["name"] = "Large Pink Sparkler", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_pink_sparkler.png", -- Image file name of this item inside nui/img
			},
			["large_sparkler"] = {
				-- The item ID
				["name"] = "Large Sparkler", -- The item display name
				["price_to_customer"] = 3000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 3000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_sparkler.png", -- Image file name of this item inside nui/img
			},
			["blue_sparkler"] = {
				-- The item ID
				["name"] = "Blue Sparkler", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "blue_sparkler.png", -- Image file name of this item inside nui/img
			},
			["pink_sparkler"] = {
				-- The item ID
				["name"] = "Pink Sparkler", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "pink_sparkler.png", -- Image file name of this item inside nui/img
			},
			["green_sparkler"] = {
				-- The item ID
				["name"] = "Green Sparkler", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "green_sparkler.png", -- Image file name of this item inside nui/img
			},
			["american_sparkler"] = {
				-- The item ID
				["name"] = "USA Sparkler", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "large_sparkler.png", -- Image file name of this item inside nui/img
			},
			["sparkler"] = {
				-- The item ID
				["name"] = "Sparkler", -- The item display name
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1750, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "sparkler.png", -- Image file name of this item inside nui/img
			},
			["parachute"] = {
				-- The item ID
				["name"] = "Parachute", -- The item display name
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 3500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				["img"] = "parachute.png", -- Image file name of this item inside nui/img
			},
			['weapon_flashlight'] = {
				['name'] = "Flashlight",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'weapon_flashlight.png',
				['metadata'] = {

				}
			},
			['pickaxe'] = {
				['name'] = "Pickaxe",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1275,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'pickaxe.png',
			},			
			['miningdrill'] = {
				['name'] = "Mining Drill",
				['price_to_customer'] = 25000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 25000,
				['price_to_export'] = 0,
				['price_to_owner'] = 20000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'miningdrill.png',
			},			
			['mininglaser'] = {
				['name'] = "Mining Laser",
				['price_to_customer'] = 80000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 80000,
				['price_to_export'] = 0,
				['price_to_owner'] = 75000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'mininglaser.png',
			},			
			['drillbit'] = {
				['name'] = "Drill Bits",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 425,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'drillbit.png',
			},	
			['diving_gear'] = {
				['name'] = "Diving Gear",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'diving_gear.png',
			},	
			['diving_fill'] = {
				['name'] = "Diving Fill",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1275,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'diving_tube.png',
			},	
			['binoculars'] = {
				['name'] = "Binoculars",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'binoculars.png',
			},
			['blowtorch'] = {
				['name'] = "Blowtorch",
				['price_to_customer'] = 3500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 3500,
				['price_to_export'] = 0,
				['price_to_owner'] = 2450,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'blowtorch.png',
			},
			['cutters'] = {
				['name'] = "Snips",
				['price_to_customer'] = 7500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 7500,
				['price_to_export'] = 0,
				['price_to_owner'] = 5250,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'cutters.png',
			},
			['nylonrope'] = {
				['name'] = "Nylon Rope",
				['price_to_customer'] = 1000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1000,
				['price_to_export'] = 0,
				['price_to_owner'] = 700,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'nylonrope.png',
			},
		}
	},
	['sporting_goods'] = {
		['page_name'] = "Sporting Goods",
		['page_desc'] = "Have you ever seen Mountain Men the show? Now you can hunt your own Bigfoot.",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['binoculars'] = {
				['name'] = "Binoculars",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'binoculars.png',
			},
            ['hunting_case'] = {
                ["name"] = "Hunting Ammo Case (10)", -- The item display name
                ["price_to_customer"] = 250,
                ["price_to_customer_min"] = 1,
                ["price_to_customer_max"] = 250,
                ["price_to_export"] = 0,
                ["price_to_owner"] = 175, -- Price the store owner must pay when importing goods to your store
                ['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
                ["img"] = "hunting_case.png", -- Image file name of this item inside nui/img
            },
            ['weapon_huntingrifle'] = {
                ["name"] = "Hunting Rifle", -- The item display name
                ["price_to_customer"] = 5000,
                ["price_to_customer_min"] = 1,
                ["price_to_customer_max"] = 5000,
                ["price_to_export"] = 0,
                ["price_to_owner"] = 3500, -- Price the store owner must pay when importing goods to your store
                ['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
                ["img"] = "huntingrifle.png", -- Image file name of this item inside nui/img
				['metadata'] = {

				}
            },
			['diving_gear'] = {
				['name'] = "Diving Gear",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'diving_gear.png',
			},	
			['diving_fill'] = {
				['name'] = "Diving Fill",
				['price_to_customer'] = 1500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1275,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'diving_tube.png',
			},	
			['weapon_flashlight'] = {
				['name'] = "Flashlight",
				['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'weapon_flashlight.png',
				['metadata'] = {

				}
			},
			["weapon_knife"] = {
                ["name"] = "Knife", -- The item display name
                ['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
                ['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
                ["img"] = "weapon_knife.png", -- Image file name of this item inside nui/img
				['metadata'] = {

				}
            },
			["WEAPON_SWITCHBLADE"] = {
                ["name"] = "Switchblade", -- The item display name
                ['price_to_customer'] = 2500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 2500,
				['price_to_export'] = 0,
				['price_to_owner'] = 1750,
               	['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
                ["img"] = "weapon_switchblade.png", -- Image file name of this item inside nui/img
				['metadata'] = {

				}
            },
			["WEAPON_HATCHET"] = {
                ["name"] = "Hatchet", -- The item display name
                ["price_to_customer"] = 5000,
                ["price_to_customer_min"] = 0,
                ["price_to_customer_max"] = 5000,
                ["price_to_export"] = 1,
                ["price_to_owner"] = 3500, -- Price the store owner must pay when importing goods to your store
                ['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
                ["img"] = "weapon_hatchet.png", -- Image file name of this item inside nui/img
				['metadata'] = {

				}
            },
			["WEAPON_BATTLEAXE"] = {
                ["name"] = "Battle Axe", -- The item display name
                ["price_to_customer"] = 7500,
                ["price_to_customer_min"] = 0,
                ["price_to_customer_max"] = 7500,
                ["price_to_export"] = 1,
                ["price_to_owner"] = 5250, -- Price the store owner must pay when importing goods to your store
                ['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
                ["img"] = "weapon_battleaxe.png", -- Image file name of this item inside nui/img
				['metadata'] = {

				}
            },
			['deer_horn'] = {
				['name'] = "Deer Horn",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 350,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'deer_horn.png',
			},
			['bee-house'] = {
				['name'] = "Bee House",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'bee-house.png',
			},	
			['bee-hive'] = {
				['name'] = "Bee Hive",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'bee-hive.png',
			},
			['thymol'] = {
				['name'] = "Thymol",
				['price_to_customer'] = 1000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1000,
				['price_to_export'] = 0,
				['price_to_owner'] = 700,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'thymol.png',
			},	
			-- ['water_can'] = {
			-- 	['name'] = "Watering Can",
			-- 	['price_to_customer'] = 50,
			-- 	['price_to_customer_min'] = 1,
			-- 	['price_to_customer_max'] = 50,
			-- 	['price_to_export'] = 0,
			-- 	['price_to_owner'] = 25,
			-- 	['amount_to_owner'] = 100,	
			-- 	['amount_to_delivery'] = 200,
			-- 	['img'] = 'water_can.png',
			-- },		
			-- ['fertilizer'] = {
			-- 	['name'] = "Fertilizer",
			-- 	['price_to_customer'] = 150,
			-- 	['price_to_customer_min'] = 1,
			-- 	['price_to_customer_max'] = 150,
			-- 	['price_to_export'] = 0,
			-- 	['price_to_owner'] = 75,
			-- 	['amount_to_owner'] = 100,	
			-- 	['amount_to_delivery'] = 200,
			-- 	['img'] = 'fertilizer.png',
			-- },	
			['trowel'] = {
				['name'] = "Trowel",
				['price_to_customer'] = 1000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1000,
				['price_to_export'] = 0,
				['price_to_owner'] = 700,
				['amount_to_owner'] = 100,	
				['amount_to_delivery'] = 200,
				['img'] = 'trowel.png',
			},
			['backpack'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack.png',
			},
			['backpack2'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack2.png',
			},
			['backpack3'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack3.png',
			},
			['backpack4'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack4.png',
			},
			['backpack5'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack5.png',
			},
			['backpack6'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack6.png',
			},
			['backpack7'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack7.png',
			},
			['backpack8'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack8.png',
			},
			['backpack9'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 10000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 10000,
				['price_to_export'] = 0,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack9.png',
			},
			['backpack10'] = {
				['name'] = "Bagpack",
				['price_to_customer'] = 15000,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 15000,
				['price_to_export'] = 0,
				['price_to_owner'] = 8500,
				['amount_to_owner'] = 50,	
				['amount_to_delivery'] = 100,
				['img'] = 'backpack10.png',
			},
			-- ["WEAPON_HACKINGDEVICE"] = {
            --     ["name"] = "Plant Scanner", -- The item display name
            --     ["price_to_customer"] = 5000,
            --     ["price_to_customer_min"] = 0,
            --     ["price_to_customer_max"] = 5000,
            --     ["price_to_export"] = 1,
            --     ["price_to_owner"] = 3500, -- Price the store owner must pay when importing goods to your store
            --     ['amount_to_owner'] = 50,	
			-- 	['amount_to_delivery'] = 100,
            --     ["img"] = "WEAPON_HACKINGDEVICE.png", -- Image file name of this item inside nui/img
			-- 	['metadata'] = {

			-- 	}
            -- },
			-- ['plasticwrap'] = {
			-- 	['name'] = "Plastic Wrap",
			-- 	['price_to_customer'] = 150,
			-- 	['price_to_customer_min'] = 1,
			-- 	['price_to_customer_max'] = 150,
			-- 	['price_to_export'] = 0,
			-- 	['price_to_owner'] = 75,
			-- 	['amount_to_owner'] = 100,	
			-- 	['amount_to_delivery'] = 200,
			-- 	['img'] = 'plasticwrap.png',
			-- },	
		}
	},
	['stance'] = {
		['page_name'] = "Stance",
		['page_desc'] = "Stance will make her dance.",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			["mechplastic"] = {                -- The item ID
                ["name"] = "Mechanic Plastic", -- The item display name
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,                   	 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,                   	 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				["img"] = "plastic.png", -- Image file name of this item inside nui/img
            },
			["mechiron"] = {                -- The item ID
				["name"] = "Mechanic Iron", -- The item display name
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,                   	 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,                   	 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				["img"] = "iron.png", -- Image file name of this item inside nui/img
			},
			['mechsteel'] = {
				['name'] = "Mechanic Steel",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,                   	 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,                   	 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'steel.png',
				['page'] = 0
			},
			['mechrubber'] = {
				['name'] = "Mechanic Rubber",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,                   	 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,                   	 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rubber.png',
				['page'] = 0
			},
			['mechaluminum'] = {
				['name'] = "Mechanic Aluminum",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,                   	 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,                   	 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'aluminum.png',
				['page'] = 0
			},
			['mechanic_tablet'] = {
				['name'] = "Mechanic Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'mechanic_tablet.png',
				['page'] = 0
			},
			['performance_part'] = {
				['name'] = "Performance Parts",
				["price_to_customer"] = 12000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 12000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 12000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'performance_part.png',
				['page'] = 0
			},
			['stancehousevoucher'] = {
				['name'] = "Stance House Voucher",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 10, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'stancehousevoucher.png',
				['page'] = 0
			},
		}
	},
	['weedshop'] = {
		['page_name'] = "Paraphernalia",
		['page_desc'] = "Needed Materials.",
		['page_icon'] = '<img src="img/categories/weed.png" style="padding:15px">',
		['page_img'] = 'img/categories/weed.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['drug_shears'] = {
				['name'] = "Drug Shears",
				["price_to_customer"] = 1000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'drug_shears.png',
				['page'] = 0
			},
			['drug_grinder'] = {
				['name'] = "Drug Grinder",
				["price_to_customer"] = 1000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'drug_grinder.png',
				['page'] = 0
			},
			['rollingpapers'] = {
				['name'] = "Rollingpapers",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rollingpapers.png',
				['page'] = 0
			},
			['gummymould'] = {
				['name'] = "Gummy Mould",
				["price_to_customer"] = 1000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'gummybearmould.png',
				['page'] = 0
			},
			['gelatine'] = {
				['name'] = "Gelatine",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'gelatine.png',
				['page'] = 0
			},
			['rawhoney'] = {
				['name'] = "Raw Honey",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rawhoney.png',
				['page'] = 0
			},
			['sugar'] = {
				['name'] = "Sugar",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
			},
			['flour'] = {
				['name'] = "Flour",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'flour.png',
			},
			['lighter'] = {
				['name'] = "Lighter",
				['price_to_customer'] = 500,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 500,
				['price_to_export'] = 0,
				['price_to_owner'] = 500,
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'lighter.png',
			},
			['emptybaggy'] = {
				['name'] = "Empty Baggy",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'emptybaggy.png',
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['smoking'] = {
		['page_name'] = "Paraphernalia",
		['page_desc'] = "Needed Materials.",
		['page_icon'] = '<img src="img/categories/weed.png" style="padding:15px">',
		['page_img'] = 'img/categories/weed.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['nicotine'] = {
				['name'] = "Nicotine",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'nicotine.png',
				['page'] = 0
			},
			['glycerine'] = {
				['name'] = "Glycerine",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'glycerine.png',
				['page'] = 0
			},
			['emptybaggy'] = {
				['name'] = "Empty Baggy",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'emptybaggy.png',
			},
			['vape_battery'] = {
				['name'] = "Vape Battery",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 80,
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'vape_battery.png',
			},
			['vape_coil'] = {
				['name'] = "Vape Coil",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 80,
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'vape_coil.png',
			},
			['vape_casing'] = {
				['name'] = "Vape Casing",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 80,
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'vape_casing.png',
			},
			['sugar'] = {
				['name'] = "Sugar",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 400,
				['amount_to_delivery'] = 200,
				['img'] = 'sugar.png',
			},
			['flour'] = {
				['name'] = "Flour",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'flour.png',
			},
			['cakepopstick'] = {
				['name'] = "Cake Pop Stick",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cakepopstick.png',
			},
			['skintbackdrop'] = {
				['name'] = "Skintback Drop",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'skintbackdrop.png',
			},
			['candybombdrop'] = {
				['name'] = "Candy Bomb Drop",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'candybombdrop.png',
			},
			['sweettitsdrop'] = {
				['name'] = "Sweet Tits Drop",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sweettitsdrop.png',
			},
			['blueberrydreamdrop'] = {
				['name'] = "Blueberry Dream Drop",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'blueberrydreamdrop.png',
			},
			['tripsittersdrop'] = {
				['name'] = "Trip Sitters Drop",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tripsittersdrop.png',
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['mechanic'] = {
		['page_name'] = "Mechanic Materials",
		['page_desc'] = "Mechanic Materials.",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['mechanic_tablet'] = {
				['name'] = "Mechanic Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'mechanic_tablet.png',
				['page'] = 0
			},
			['performance_part'] = {
				['name'] = "Performance Parts",
				["price_to_customer"] = 12000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 12000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 12000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'performance_part.png',
				['page'] = 0
			},
			['mech_toolkit'] = {
				['name'] = "Harness Remover",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'mech_toolkit.png',
				['page'] = 0
			},
			['nitrous_bottle'] = {
				['name'] = "Nitrous Bottle",
				["price_to_customer"] = 10000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 10000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 10000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'nitrous_bottle.png',
				['page'] = 0
			},
			['manual_gearbox'] = {
				['name'] = "Manual Gearbox",
				["price_to_customer"] = 7500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 7500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 7500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'manual_gearbox.png',
				['page'] = 0
			},
			['cleaning_kit'] = {
				['name'] = "Cleaning Kit",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,
				['amount_to_delivery'] = 200,
				['img'] = 'cleaning_kit.png',
				['page'] = 0
			},
			['mechiron'] = {
				['name'] = "Mechanic Iron",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'iron.png',
				['page'] = 0
			},
			['mechplastic'] = {
				['name'] = "Mechanic Plastic",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'plastic.png',
				['page'] = 0
			},
			['mechaluminum'] = {
				['name'] = "Mechanic Aluminum",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'aluminum.png',
				['page'] = 0
			},
			['mechrubber'] = {
				['name'] = "Mechanic Rubber",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rubber.png',
				['page'] = 0
			},
			['mechmetalscrap'] = {
				['name'] = "Mechanic Metal Scrap",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'metalscrap.png',
				['page'] = 0
			},
			['mechsteel'] = {
				['name'] = "Mechanic Steel",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 100, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'steel.png',
				['page'] = 0
			},
			['brakespart'] = {
				['name'] = "Brake Parts",
				["price_to_customer"] = 4000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 4000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 4000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'brakespart.png',
				['page'] = 1
			},
			['basic_harness'] = {
				['name'] = "Basic Harness",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'harness.png',
				['page'] = 1
			},
			['race_harness'] = {
				['name'] = "Race Harness",
				["price_to_customer"] = 10000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 10000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 10000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'race_harness.png',
				['page'] = 1
			},
			-- ['engine_oil'] = {
			-- 	['name'] = "Engine Oil",
			-- 	["price_to_customer"] = 2000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'engine_oil.png',
			-- 	['page'] = 1
			-- },
			-- ['tyre_replacement'] = {
			-- 	['name'] = "Tire Replacement",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 100,
			-- 	['amount_to_delivery'] = 200,
			-- 	['img'] = 'tyre_replacement.png',
			-- 	['page'] = 1
			-- },
			-- ['clutch_replacement'] = {
			-- 	['name'] = "Clutch Replacement",
			-- 	["price_to_customer"] = 2000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'clutch_replacement.png',
			-- 	['page'] = 1
			-- },
			-- ['air_filter'] = {
			-- 	['name'] = "Air Filter",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'air_filter.png',
			-- 	['page'] = 1
			-- },
			-- ['spark_plug'] = {
			-- 	['name'] = "Spark Plug",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'spark_plug.png',
			-- 	['page'] = 1
			-- },
			-- ['brakepad_replacement'] = {
			-- 	['name'] = "Brakepad Replacement",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'brakepad_replacement.png',
			-- 	['page'] = 1
			-- },
			-- ['suspension_parts'] = {
			-- 	['name'] = "Suspension Parts",
			-- 	["price_to_customer"] = 2000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'suspension_parts.png',
			-- 	['page'] = 1
			-- },
			['i4_engine'] = {
				['name'] = "i4 Engine",
				["price_to_customer"] = 15000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 15000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 15000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'i4_engine.png',
				['page'] = 1
			},
			['v6_engine'] = {
				['name'] = "V6 Engine",
				["price_to_customer"] = 20000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 20000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 20000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'v6_engine.png',
				['page'] = 1
			},
			['v8_engine'] = {
				['name'] = "V8 Engine",
				["price_to_customer"] = 30000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 30000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 30000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'v8_engine.png',
				['page'] = 1
			},
			['turbopart'] = {
				['name'] = "Turbo Parts",
				["price_to_customer"] = 8000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 8000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 8000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'turbopart.png',
				['page'] = 1
			},
		}
	},
	['seaton'] = {
		['page_name'] = "Mechanic Materials",
		['page_desc'] = "Mechanic Materials.",
		['page_icon'] = '<img src="img/categories/utilities-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/utilities.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['mechanic_tablet'] = {
				['name'] = "Mechanic Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'mechanic_tablet.png',
				['page'] = 0
			},
			['performance_part'] = {
				['name'] = "Performance Parts",
				["price_to_customer"] = 12000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 12000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 12000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'performance_part.png',
				['page'] = 0
			},
			['mech_toolkit'] = {
				['name'] = "Harness Remover",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'mech_toolkit.png',
				['page'] = 0
			},
			['nitrous_bottle'] = {
				['name'] = "Nitrous Bottle",
				["price_to_customer"] = 10000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 10000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 10000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'nitrous_bottle.png',
				['page'] = 0
			},
			['manual_gearbox'] = {
				['name'] = "Manual Gearbox",
				["price_to_customer"] = 7500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 7500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 7500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'manual_gearbox.png',
				['page'] = 0
			},
			['cleaning_kit'] = {
				['name'] = "Cleaning Kit",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 100,
				['amount_to_delivery'] = 200,
				['img'] = 'cleaning_kit.png',
				['page'] = 0
			},
			['mechiron'] = {
				['name'] = "Mechanic Iron",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'iron.png',
				['page'] = 0
			},
			['mechplastic'] = {
				['name'] = "Mechanic Plastic",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'plastic.png',
				['page'] = 0
			},
			['mechaluminum'] = {
				['name'] = "Mechanic Aluminum",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'aluminum.png',
				['page'] = 0
			},
			['mechrubber'] = {
				['name'] = "Mechanic Rubber",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rubber.png',
				['page'] = 0
			},
			['mechmetalscrap'] = {
				['name'] = "Mechanic Metal Scrap",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'metalscrap.png',
				['page'] = 0
			},
			['mechsteel'] = {
				['name'] = "Mechanic Steel",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 75, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'steel.png',
				['page'] = 0
			},
			['brakespart'] = {
				['name'] = "Brake Parts",
				["price_to_customer"] = 4000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 4000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 4000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'brakespart.png',
				['page'] = 1
			},
			['basic_harness'] = {
				['name'] = "Basic Harness",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'harness.png',
				['page'] = 1
			},
			['race_harness'] = {
				['name'] = "Race Harness",
				["price_to_customer"] = 10000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 10000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 10000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'race_harness.png',
				['page'] = 1
			},
			-- ['engine_oil'] = {
			-- 	['name'] = "Engine Oil",
			-- 	["price_to_customer"] = 2000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'engine_oil.png',
			-- 	['page'] = 1
			-- },
			-- ['tyre_replacement'] = {
			-- 	['name'] = "Tire Replacement",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 100,
			-- 	['amount_to_delivery'] = 200,
			-- 	['img'] = 'tyre_replacement.png',
			-- 	['page'] = 1
			-- },
			-- ['clutch_replacement'] = {
			-- 	['name'] = "Clutch Replacement",
			-- 	["price_to_customer"] = 2000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'clutch_replacement.png',
			-- 	['page'] = 1
			-- },
			-- ['air_filter'] = {
			-- 	['name'] = "Air Filter",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'air_filter.png',
			-- 	['page'] = 1
			-- },
			-- ['spark_plug'] = {
			-- 	['name'] = "Spark Plug",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'spark_plug.png',
			-- 	['page'] = 1
			-- },
			-- ['brakepad_replacement'] = {
			-- 	['name'] = "Brakepad Replacement",
			-- 	["price_to_customer"] = 1000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 1000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 1000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'brakepad_replacement.png',
			-- 	['page'] = 1
			-- },
			['suspension_parts'] = {
				['name'] = "Suspension Parts",
				["price_to_customer"] = 2000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'suspension_parts.png',
				['page'] = 1
			},
			['i4_engine'] = {
				['name'] = "i4 Engine",
				["price_to_customer"] = 15000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 15000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 15000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'i4_engine.png',
				['page'] = 1
			},
			['v6_engine'] = {
				['name'] = "V6 Engine",
				["price_to_customer"] = 20000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 20000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 20000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'v6_engine.png',
				['page'] = 1
			},
			['v8_engine'] = {
				['name'] = "V8 Engine",
				["price_to_customer"] = 30000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 30000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 30000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'v8_engine.png',
				['page'] = 1
			},
			['turbopart'] = {
				['name'] = "Turbo Parts",
				["price_to_customer"] = 8000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 8000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 8000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'turbopart.png',
				['page'] = 1
			},
		}
	},
	['moo'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['sugar'] = {
				['name'] = "Sugar",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
				['page'] = 0
			},
			['flour'] = {
				['name'] = "Flour",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'flour.png',
				['page'] = 0
			},
			['milk'] = {
				['name'] = "Milk",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'milk.png',
				['page'] = 0
			},
			['mixedfruits'] = {
				['name'] = "Mixed Fruits",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedfruits.png',
				['page'] = 0
			},
			['bread'] = {
				['name'] = "Bread",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'bread.png',
				['page'] = 0
			},
			['mixedgreens'] = {
				['name'] = "Mixed Greens",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedgreens.png',
				['page'] = 0
			},
			['cheese'] = {
				['name'] = "Cheese",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cheese.png',
				['page'] = 0
			},
			['cocoa'] = {
				['name'] = "Cocoa",
				["price_to_customer"] = 65,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 65,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cocoa.png',
				['page'] = 0
			},
			['tealeaf'] = {
				['name'] = "Tea Leaf",
				["price_to_customer"] = 65,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 65,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tealeaf.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['bahama'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['mixedfruits'] = {
				['name'] = "Mixed Fruits",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedfruits.png',
				['page'] = 0
			},
			['sugar'] = {
				['name'] = "Sugar",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
				['page'] = 0
			},
			['milk'] = {
				['name'] = "Milk",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'milk.png',
				['page'] = 0
			},
			['meat'] = {
				['name'] = "Meat",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'meat.png',
				['page'] = 0
			},
			['onion'] = {
				['name'] = "Onion",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'onion.png',
				['page'] = 0
			},
			['fish'] = {
				['name'] = "Fish",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'fish.png',
				['page'] = 0
			},
			['lemon'] = {
				['name'] = "Lemon",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lemon.png',
				['page'] = 0
			},
			['chips'] = {
				['name'] = "Chips",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'chips.png',
				['page'] = 0
			},
			['cheese'] = {
				['name'] = "Cheese",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cheese.png',
				['page'] = 0
			},
			['tealeaf'] = {
				['name'] = "Tea Leaf",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tealeaf.png',
				['page'] = 0
			},
			['gin'] = {
				['name'] = "Gin",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'gin.png',
				['page'] = 0
			},
			['vodka'] = {
				['name'] = "Vodka",
				['price_to_customer'] = 1,
				['price_to_customer_min'] = 1,
				['price_to_customer_max'] = 1,
				['price_to_export'] = 0,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'vodka.png',
			},
			['rum'] = {
				['name'] = "Rum",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'rum.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},

	['pitapan'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['sugar'] = {
				['name'] = "Sugar",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
				['page'] = 0
			},
			['milk'] = {
				['name'] = "Milk",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'milk.png',
				['page'] = 0
			},
			['flour'] = {
				['name'] = "Flour",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'flour.png',
				['page'] = 0
			},
			['meat'] = {
				['name'] = "Meat",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'meat.png',
				['page'] = 0
			},
			['lettuce'] = {
				['name'] = "Lettuce",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lettuce.png',
				['page'] = 0
			},
			['bread'] = {
				['name'] = "Bread",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'bread.png',
				['page'] = 0
			},
			['cheese'] = {
				['name'] = "Cheese",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cheese.png',
				['page'] = 0
			},
			['cucumber'] = {
				['name'] = "Cucumber",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cucumber.png',
				['page'] = 0
			},
			['onion'] = {
				['name'] = "Onion",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'onion.png',
				['page'] = 0
			},
			['mixedgreens'] = {
				['name'] = "Mixed Greens",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedgreens.png',
				['page'] = 0
			},
			['lemon'] = {
				['name'] = "Lemon",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lemon.png',
				['page'] = 0
			},
			['water'] = {
				['name'] = "Water",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'water.png',
				['page'] = 0
			},
			['pomegranate'] = {
				['name'] = "Pomegranate",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'pomegranate.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['lilypad'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['sugar'] = {
				['name'] = "Sugar",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
				['page'] = 0
			},
			['milk'] = {
				['name'] = "Milk",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'milk.png',
				['page'] = 0
			},
			['flour'] = {
				['name'] = "Flour",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'flour.png',
				['page'] = 0
			},
			['meat'] = {
				['name'] = "Meat",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'meat.png',
				['page'] = 0
			},
			['lettuce'] = {
				['name'] = "Lettuce",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lettuce.png',
				['page'] = 0
			},
			['cheese'] = {
				['name'] = "Cheese",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cheese.png',
				['page'] = 0
			},
			['onion'] = {
				['name'] = "Onion",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'onion.png',
				['page'] = 0
			},
			['water'] = {
				['name'] = "Water",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'water.png',
				['page'] = 0
			},
			['potato'] = {
				['name'] = "Potato",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'potato.png',
				['page'] = 0
			},
			['tealeaf'] = {
				['name'] = "Tea Leaf",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tealeaf.png',
				['page'] = 0
			},
			['mixedfruits'] = {
				['name'] = "Mixed Fruits",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedfruits.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['boathouse'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['fish'] = {
				['name'] = "Fish",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'fish.png',
				['page'] = 0
			},
			['lemon'] = {
				['name'] = "Lemon",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lemon.png',
				['page'] = 0
			},
			['mixedgreens'] = {
				['name'] = "Mixed Greens",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedgreens.png',
				['page'] = 0
			},
			['lobster'] = {
				['name'] = "Lobster",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'lobster.png',
				['page'] = 0
			},
			['bread'] = {
				['name'] = "Bread",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'bread.png',
				['page'] = 0
			},
			['onion'] = {
				['name'] = "Onion",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'onion.png',
				['page'] = 0
			},
			['cucumber'] = {
				['name'] = "Cucumber",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'cucumber.png',
				['page'] = 0
			},
			['tealeaf'] = {
				['name'] = "Tea Leaf",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tealeaf.png',
				['page'] = 0
			},
			['water'] = {
				['name'] = "Water",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'water.png',
				['page'] = 0
			},
			['potato'] = {
				['name'] = "Potato",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'potato.png',
				['page'] = 0
			},
			['mixedfruits'] = {
				['name'] = "Mixed Fruits",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedfruits.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['saltlab'] = {
		['page_name'] = "Restaurant Ingredients",
		['page_desc'] = "Restaurant Ingredients",
		['page_icon'] = '<img src="img/categories/food-icon.png" style="padding:15px">',
		['page_img'] = 'img/categories/food.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['sugar'] = {
				['name'] = "Sugar",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'sugar.png',
				['page'] = 0
			},
			['milk'] = {
				['name'] = "Milk",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'milk.png',
				['page'] = 0
			},
			['water'] = {
				['name'] = "Water",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'water.png',
				['page'] = 0
			},
			['tealeaf'] = {
				['name'] = "Tea Leaf",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'tealeaf.png',
				['page'] = 0
			},
			['mixedfruits'] = {
				['name'] = "Mixed Fruits",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedfruits.png',
				['page'] = 0
			},
			['mixedgreens'] = {
				['name'] = "Mixed Greens",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'mixedgreens.png',
				['page'] = 0
			},
			['proteinpowder'] = {
				['name'] = "Protein Powder",
				["price_to_customer"] = 1,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 25, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 250,
				['amount_to_delivery'] = 400,
				['img'] = 'proteinpowder.png',
				['page'] = 0
			},
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
		}
	},
	['lights'] = {
		['page_name'] = "Photography Tools",
		['page_desc'] = "Lights and Scenes",
		['page_icon'] = '<img src="img/categories/camera.png" style="padding:15px">',
		['page_img'] = 'img/categories/camera.png',
		['category_buy_price'] = 5000,
		['category_sell_price'] = 2500,
		['items'] = {
			['billingtablet'] = {
				['name'] = "Billing Tablet",
				["price_to_customer"] = 1500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 1500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 1500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'billingtablet.png',
				['page'] = 0
			},
			['photography_lightcase'] = {
				['name'] = "Photography Light Case",
				["price_to_customer"] = 2500,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 2500,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 2500, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photography_lightcase.png',
				['page'] = 0
			},
			-- ['photolights'] = {
			-- 	['name'] = "Studio Lamp",
			-- 	["price_to_customer"] = 2500,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2500,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2500, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'white_light.png',
			-- 	['page'] = 0
			-- },
			-- ['tripodlight'] = {
			-- 	['name'] = "Tripod Light",
			-- 	["price_to_customer"] = 2500,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 2500,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 2500, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'white_light.png',
			-- 	['page'] = 0
			-- },
			-- ['blue_light'] = {
			-- 	['name'] = "Blue Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'blue_light.png',
			-- 	['page'] = 0
			-- },
			-- ['green_light'] = {
			-- 	['name'] = "Green Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'green_light.png',
			-- 	['page'] = 0
			-- },
			-- ['orange_light'] = {
			-- 	['name'] = "Orange Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'orange_light.png',
			-- 	['page'] = 0
			-- },
			-- ['purple_light'] = {
			-- 	['name'] = "Purple Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'purple_light.png',
			-- 	['page'] = 0
			-- },
			-- ['pink_light'] = {
			-- 	['name'] = "Pink Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'pink_light.png',
			-- 	['page'] = 0
			-- },
			-- ['red_light'] = {
			-- 	['name'] = "Red Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'red_light.png',
			-- 	['page'] = 0
			-- },
			-- ['white_light'] = {
			-- 	['name'] = "White Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'white_light.png',
			-- 	['page'] = 0
			-- },
			-- ['yellow_light'] = {
			-- 	['name'] = "Yellow Light",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'yellow_light.png',
			-- 	['page'] = 0
			-- },
			-- ['blue_lamp'] = {
			-- 	['name'] = "Blue Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'blue_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['green_lamp'] = {
			-- 	['name'] = "Green Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'green_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['orange_lamp'] = {
			-- 	['name'] = "Orange Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'orange_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['purple_lamp'] = {
			-- 	['name'] = "Purple Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'purple_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['pink_lamp'] = {
			-- 	['name'] = "Pink Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'pink_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['red_lamp'] = {
			-- 	['name'] = "Red Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'red_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['white_lamp'] = {
			-- 	['name'] = "White Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'white_lamp.png',
			-- 	['page'] = 0
			-- },
			-- ['yellow_lamp'] = {
			-- 	['name'] = "Yellow Lamp",
			-- 	["price_to_customer"] = 5000,
			-- 	["price_to_customer_min"] = 1,
			-- 	 -- Min price that the owner will be able to set on this product
			-- 	["price_to_customer_max"] = 5000,
			-- 	 -- Max price that the owner will be able to set on this product
			-- 	["price_to_export"] = 0,
			-- 	["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
			-- 	['amount_to_owner'] = 50,
			-- 	['amount_to_delivery'] = 100,
			-- 	['img'] = 'yellow_lamp.png',
			-- 	['page'] = 0
			-- },
			['photobox_1'] = {
				['name'] = "Photo Box 1",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_1.png',
				['page'] = 0
			},
			['photobox_2'] = {
				['name'] = "Photo Box 2",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_2.png',
				['page'] = 0
			},
			['photobox_3'] = {
				['name'] = "Photo Box 3",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_3.png',
				['page'] = 0
			},
			['photobox_4'] = {
				['name'] = "Photo Box 4",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_4.png',
				['page'] = 0
			},
			['photobox_5'] = {
				['name'] = "Photo Box 5",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_5.png',
				['page'] = 0
			},
			['photobox_6'] = {
				['name'] = "Photo Box 6",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_6.png',
				['page'] = 0
			},
			['photobox_7'] = {
				['name'] = "Photo Box 7",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_7.png',
				['page'] = 0
			},
			['photobox_8'] = {
				['name'] = "Photo Box 8",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_8.png',
				['page'] = 0
			},
			['photobox_9'] = {
				['name'] = "Photo Box 9",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_9.png',
				['page'] = 0
			},
			['photobox_10'] = {
				['name'] = "Photo Box 10",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_10.png',
				['page'] = 0
			},
			['photobox_10'] = {
				['name'] = "Photo Box 10",
				["price_to_customer"] = 5000,
				["price_to_customer_min"] = 1,
				 -- Min price that the owner will be able to set on this product
				["price_to_customer_max"] = 5000,
				 -- Max price that the owner will be able to set on this product
				["price_to_export"] = 0,
				["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
				['amount_to_owner'] = 50,
				['amount_to_delivery'] = 100,
				['img'] = 'photobox_10.png',
				['page'] = 0
			},

		}
	},
	-- 	['cards'] = {
	-- 	['page_name'] = "Card Shop Inventory",
	-- 	['page_desc'] = "Booster Packs and Albums",
	-- 	['page_icon'] = '<img src="img/categories/trading.png" style="padding:15px">',
	-- 	['page_img'] = 'img/categories/trading.png',
	-- 	['category_buy_price'] = 5000,
	-- 	['category_sell_price'] = 2500,
	-- 	['items'] = {
	-- 			['boosterpack1'] = {
	-- 			['name'] = "Booster Pack",
	-- 			["price_to_customer"] = 10000,
	-- 			["price_to_customer_min"] = 10000,
	-- 			 -- Min price that the owner will be able to set on this product
	-- 			["price_to_customer_max"] = 10000,
	-- 			 -- Max price that the owner will be able to set on this product
	-- 			["price_to_export"] = 0,
	-- 			["price_to_owner"] = 10000, -- Price the store owner must pay when importing goods to your store
	-- 			['amount_to_owner'] = 50,
	-- 			['amount_to_delivery'] = 100,
	-- 			['img'] = '.png',
	-- 			['page'] = 0,
	-- 			['metadata'] = {
	-- 				pack = "",
	-- 				image = ""
	-- 			}
	-- 		},
	-- 			['album1'] = {
	-- 			['name'] = "Album",
	-- 			["price_to_customer"] = 5000,
	-- 			["price_to_customer_min"] = 5000,
	-- 			 -- Min price that the owner will be able to set on this product
	-- 			["price_to_customer_max"] = 5000,
	-- 			 -- Max price that the owner will be able to set on this product
	-- 			["price_to_export"] = 0,
	-- 			["price_to_owner"] = 5000, -- Price the store owner must pay when importing goods to your store
	-- 			['amount_to_owner'] = 50,
	-- 			['amount_to_delivery'] = 100,
	-- 			['img'] = '.png',
	-- 			['page'] = 0,
	-- 			['metadata'] = {
	-- 				pack = "",
	-- 				image = ""
	-- 			}
	-- 		},
	-- 	}
	-- },
}
	
	
-- Here you can configure the permissions for each employee role
-- 1 = Basic Access
-- 2 = Advanced Access
-- 3 = Full Access
-- When setting a permission to 1, any employee will be able to access that function/page
-- When setting a permission to 2, only the employees with the advanced access and full access will be able to access that function/page
-- When setting a permission to 3, only the employees with the full access will be able to access that function/page
-- When setting a permission to 4, only the owner will be able to access that function/page
Config.roles_permissions = {
	['functions'] = {				-- These are the actions (when a button is clicked)
		['createJob'] = 2,
		['deleteJob'] = 2,
		['renameMarket'] = 3,
		['setPrice'] = 2,
		['buyUpgrade'] = 2,
		['hideBalance'] = 2,
		['showBalance'] = 2,
		['withdrawMoney'] = 3,
		['depositMoney'] = 3,
		['sellMarket'] = 4,
		['storeProductFromInventory'] = 1,
		['hirePlayer'] = 3,
		['firePlayer'] = 3,
		['changeRole'] = 3,
		['giveComission'] = 3,
		['startImportJob'] = 1,
		['startExportJob'] = 1,
		['buyCategory'] = 3,
		['sellCategory'] = 3,
	},
	['ui_pages'] = {				-- These are the UI pages
		['main'] = 1,
		['goods'] = 1,
		['hire'] = 2,
		['employee'] = 3,
		['upgrades'] = 2,
		['bank'] = 3
	}
}
-- Setting to remove inactive stores
Config.clear_stores = {
	['active'] = true,				-- Set to false to disable this function
	['min_stock_amount'] = 25,		-- Minimum percentage of stock to consider an inactive store. Stores that have been inactive for a long time will be removed
	['min_stock_variety'] = 50,		-- Minimum percentage of variety of products in stock to consider an inactive store. Stores that have been inactive for a long time will be removed
	['cooldown'] = 120				-- Time (in hours) that the store needs to be below the minimum amount of stock to be removed
}

Config.route_blip = {				-- The blip style that will appear when doing the store jobs
	['id'] = 478,					-- Blip id
	['color'] = 5					-- Blip color
}

-- Cargo delivery locations (vector3)
Config.delivery_locations = {
	{ -952.31, -1077.87, 2.48 },
	{ -978.23, -1108.09, 2.16 },
	{ -1024.49, -1139.6, 2.75 },
	{ -1063.76, -1159.88, 2.56 },
	{ -1001.68, -1218.78, 5.75 },
	{ -1171.54, -1575.61, 4.51 },
	{ -1097.94, -1673.36, 8.4 },
	{ -1286.17, -1267.12, 4.52 },
	{ -1335.75, -1146.55, 6.74 },
	{ -1750.47, -697.09, 10.18 },
	{ -1876.84, -584.39, 11.86 },
	{ -1772.23, -378.12, 46.49 },
	{ -1821.38, -404.97, 46.65 },
	{ -1965.33, -296.96, 41.1 },
	{ -3089.24, 221.49, 14.07 },
	{ -3088.62, 392.3, 11.45 },
	{ -3077.98, 658.9, 11.67 },
	{ -3243.07, 931.84, 17.23 },
	{ 1230.8, -1590.97, 53.77 },
	{ 1286.53, -1604.26, 54.83 },
	{ 1379.38, -1515.23, 58.24 },
	{ 1379.38, -1515.23, 58.24 },
	{ 1437.37, -1492.53, 63.63 },
	{ 450.04, -1863.49, 27.77 },
	{ 403.75, -1929.72, 24.75 },
	{ 430.16, -1559.31, 32.8 },
	{ 446.06, -1242.17, 30.29 },
	{ 322.39, -1284.7, 30.57 },
	{ 369.65, -1194.79, 31.34 },
	{ 474.27, -635.05, 25.65 },
	{ 158.87, -1215.65, 29.3 },
	{ 154.68, -1335.62, 29.21 },
	{ 215.54, -1461.67, 29.19 },
	{ 167.46, -1709.3, 29.3 },
	{ -444.47, 287.68, 83.3 },
	{ -179.56, 314.25, 97.88 },
	{ -16.07, 216.7, 106.75 },
	{ 164.02, 151.87, 105.18 },
	{ 840.2, -181.93, 74.19 },
	{ 952.27, -252.17, 67.77 },
	{ 1105.27, -778.84, 58.27 },
	{ 1099.59, -345.68, 67.19 },
	{ -1211.12, -401.56, 38.1 },
	{ -1302.69, -271.32, 40.0 },
	{ -1468.65, -197.3, 48.84 },
	{ -1583.18, -265.78, 48.28 },
	{ -603.96, -774.54, 25.02 },
	{ -805.14, -959.54, 18.13 },
	{ -325.07, -1356.35, 31.3 },
	{ -321.82, -1545.88, 27.75 },
	{ -428.95, -1728.13, 19.79 },
	{ -582.38, -1743.65, 22.44 },
	{ -670.43, -889.09, 24.5 },
	{ 1691.4, 3866.21, 34.91 },
	{ 1837.93, 3907.12, 33.26 },
	{ 1937.08, 3890.89, 32.47},
	{ 2439.7, 4068.45, 38.07 },
	{ 2592.26, 4668.98, 34.08 },
	{ 1961.53, 5184.91, 47.98 },
	{ 2258.59, 5165.84, 59.12 },
	{ 1652.7, 4746.1, 42.03 },
	{ -359.09, 6062.05, 31.51 },
	{ -160.13, 6432.2, 31.92 },
	{ 33.33, 6673.27, 32.19 },
	{ 175.03, 6643.14, 31.57 },
	{ 22.8, 6488.44, 31.43 },
	{ 64.39, 6309.17, 31.38 },
	{ 122.42, 6406.02, 31.37 },
	{ 1681.2, 6429.11, 32.18 },
	{ 2928.01, 4474.74, 48.04 },
	{ 2709.92, 3454.83, 56.32 },
	{ -688.75, 5788.9, 17.34 },
	{ -436.13, 6154.93, 31.48 },
	{ -291.09, 6185.0, 31.49 },
	{ 405.31, 6526.38, 27.69 },
	{ -20.38, 6567.13, 31.88 },
	{ -368.06, 6341.4, 29.85 },
	{ 1842.89, 3777.72, 33.16 },
	{ 1417.52, 3676.46, 34.81 },
	{ 996.54, 3575.55, 34.62 },
	{ 1697.52, 3596.14, 35.56 },
	{ 2415.05, 5005.35, 46.68 },
	{ 2336.21, 4859.41, 41.81},
	{ 1800.9, 4616.07, 37.23 },
	{ -453.3, 6336.9, 13.11 },
	{ -425.4, 6356.43, 13.33 },
	{ -481.9, 6276.47, 13.42 },
	{ -693.92, 5761.95, 17.52 },
	{ -682.03, 5770.96, 17.52 },
	{ -379.44, 6062.07, 31.51 },
	{ -105.68, 6528.7, 30.17 },
	{ 35.02, 6662.61, 32.2 },
	{ 126.41, 6353.64, 31.38 },
	{ 48.15, 6305.99, 31.37 },
	{ 1417.68, 6343.83, 24.01 },
	{ 1510.21, 6326.28, 24.61 },
	{ 1698.22, 6425.66, 32.77 },
	{ 2434.69, 5011.7, 46.84 },
	{ 1718.88, 4677.32, 43.66 },
	{ 1673.21, 4958.09, 42.35 },
	{ 1364.33, 4315.43, 37.67 },
	{ -1043.6, 5326.84, 44.58 },
	{ -329.63, 6150.58, 32.32 },
	{ -374.41, 6191.04, 31.73 },
	{ -356.63, 6207.34, 31.85 },
	{ -347.15, 6224.69, 31.7 },
	{ -315.61, 6194.0, 31.57 },
	{ -33.3, 6455.87, 31.48 },
	{ 405.52, 6526.59, 27.7 },
	{ 1470.41, 6513.71, 21.23 },
	{ 1593.73, 6460.56, 25.32 },
	{ 1741.31, 6420.19, 35.05 },
	{ 2905.6804, 4348.5957, 50.2966 },
	{ 2685.4587, 3515.3735, 53.3039 },
	{ 2549.0991, 2581.4639, 37.9589 },
	{ 2461.5247, 1589.3773, 33.0036 },
	{ 2546.2715, 382.0616, 108.6183 },
	{ 1725.0695, -1470.0247, 113.9422 },
	{ 904.9115, -1905.2180, 30.6485 },
	{ 866.8612, -1997.0223, 30.2650 },
	{ 722.1874, -2016.4744, 29.2920 },
	{ 191.5787, -2226.5605, 6.9716 },
	{ 96.5557, -2216.3743, 6.1712 },
	{ -130.0217, -2240.3464, 7.9969 },
	{ -514.1631, -2201.8193, 6.3940 },
	{ -664.4872, -2380.2310, 13.9376 },
	{ -691.6822, -2449.4158, 15.1293 },
	{ -689.6242, -2506.1838, 13.9458 },
	{ -760.0089, -2583.0071, 13.8893 },
	{ -772.4279, -2605.5166, 13.8798 },
	{ -701.3683, -2238.9856, 5.1232 },
	{ -758.6694, -2229.6677, 5.7860 },
	{ -1148.4100, -1999.6710, 13.1802 },
	{ -632.3595, -1779.3925, 23.9974 },
	{ -545.9357, -1802.8668, 21.7111 },
	{ -440.3562, -1693.8481, 19.2030 },
	{ -320.9533, -1400.8784, 31.7688 },
	{ -1157.5129, -1451.9967, 4.4642 },
	{ -1168.7755, -1388.7322, 4.9373 },
	{ -1212.5765, -1314.1041, 4.6875 },
	{ -1278.1624, -1357.2375, 4.3053 },
	{ -1329.3483, -1150.3873, 4.3808 },
	{ -1469.4209, -928.6046, 10.1676 },
	{ -1490.0778, -901.5520, 9.9896 },
	{ -1606.8612, -829.9454, 10.0772 },
	{ -2035.1506, -275.1514, 23.3784 },
	{ -2027.8793, -263.9936, 23.3860 },
	{ -1557.7700, -470.1045, 35.8144 },
	{ -1529.4478, -581.2191, 33.5841 },
	{ -1423.3447, -664.5439, 28.6735 },
	{ -1361.0570, -758.2101, 22.3045 },
	{ -1315.6495, -761.7683, 20.3887 },
	{ -503.9980, -737.2335, 32.6487 },
	{ -619.3033, -1111.8799, 22.1787 },
	{ -192.4564, -1290.1357, 31.2965 },
	{ -350.4909, -77.7428, 45.6666 },
	{ -26.1795, -190.5609, 52.3585 },
	{ 466.4366, -575.9634, 28.4998 },
	{ 759.6418, -899.4376, 25.2119 },
	{ 759.4395, -1262.3988, 26.3350 },
	{ 733.1051, -1284.2948, 26.2949 },
	{ 823.8093, -1374.1012, 26.1246 },
	{ 735.7256, -1362.3192, 26.5307 },
	{ 906.3779, -1514.8666, 30.3986 },
	{ 855.3293, -1831.4390, 29.1091 },
	{ 821.5495, -3194.1443, 5.9008 },
	{ 764.2071, -3202.8215, 6.1081 },
	{ 963.1552, -3102.0076, 5.9007 },
	{ 1219.4155, -3201.4651, 5.5281 },
	{ 1218.4073, -3234.7175, 5.5274 },
	{ 1190.5135, -3326.5386, 5.5287 },
	{ 118.3658, -3056.6572, 6.0200 },
	{ 144.2452, -3324.1670, 6.0219 },
	{ 125.3088, -2862.8684, 5.9992 },
	{ -334.5549, -2439.5820, 6.0001 },
	{ -416.7508, -2797.2610, 6.0002 },
	{ -521.6317, -2896.6116, 6.0004 },
	{ -464.0199, -2879.8831, 6.0004 },
	{ 134.4960, -2475.9846, 6.0004 },
	{ -376.5844, -1877.5217, 20.5278 },
	{ -742.6045, -1507.3889, 5.0005 },
	{ -758.3834, -423.1584, 35.6972 },
	{ -1390.2855, -338.7593, 39.6086 },
	{ -1411.7375, -274.9786, 46.3646 },
	{ -802.8870, 353.5919, 87.8783 },
	{ -68.0212, 214.1873, 97.2290 },
}

-- Product export locations (vector3)
Config.export_locations = {
    {-758.14, 5540.96, 33.49},
    {-3046.19, 143.27, 11.6},
    {-1153.01, 2672.99, 18.1},
    {622.67, 110.27, 92.59},
    {-574.62, -1147.27, 22.18},
    {376.31, 2638.97, 44.5},
    {1738.32, 3283.89, 41.13},
    {1419.98, 3618.63, 34.91},
    {1452.67, 6552.02, 14.89},
    {3472.4, 3681.97, 33.79},
    {2485.73, 4116.13, 38.07},
    {65.02, 6345.89, 31.22},
    {-303.28, 6118.17, 31.5},
    {-63.41, -2015.25, 18.02},
    {-46.35, -2112.38, 16.71},
    {-746.6, -1496.67, 5.01},
    {369.54, 272.07, 103.11},
    {907.61, -44.12, 78.77},
    {-1517.31, -428.29, 35.45},
    {235.04, -1520.18, 29.15},
    {34.8, -1730.13, 29.31},
    {350.4, -2466.9, 6.4},
    {1213.97, -1229.01, 35.35},
    {1395.7, -2061.38, 52.0},
    {729.09, -2023.63, 29.31},
    {840.72, -1952.59, 28.85},
    {551.76, -1840.26, 25.34},
    {723.78, -1372.08, 26.29},
    {-339.92, -1284.25, 31.32},
    {1137.23, -1285.05, 34.6},
    {466.93, -1231.55, 29.95},
    {442.28, -584.28, 28.5},
    {1560.52, 888.69, 77.46},
    {2561.78, 426.67, 108.46},
    {569.21, 2730.83, 42.07},
    {2665.4, 1700.63, 24.49},
    {1120.1, 2652.5, 38.0},
    {2004.23, 3071.87, 47.06},
    {2038.78, 3175.7, 45.09},
    {1635.54, 3562.84, 35.23},
    {2744.55, 3412.43, 56.57},
    {1972.17, 3839.16, 32.0},
    {1980.59, 3754.65, 32.18},
    {1716.0, 4706.41, 42.69},
    {1691.36, 4918.42, 42.08},
    {1971.07, 5165.12, 47.64},
    {1908.78, 4932.06, 48.97},
    {140.79, -1077.85, 29.2},
    {-323.98, -1522.86, 27.55},
    {-1060.53, -221.7, 37.84},
    {2471.47, 4463.07, 35.3},
    {2699.47, 3444.81, 55.8},
    {-1060.53, -221.7, 37.84},
    {2655.38, 3281.01, 55.24},
    {2730.39, 2778.2, 36.01},
    {-2966.68, 363.37, 14.77},
    {2788.89, 2816.49, 41.72},
    {-604.45, -1212.24, 14.95},
    {2534.83, 2589.08, 37.95},
    {-143.31, 205.88, 92.12},
    {2347.04, 2633.25, 46.67},
    {860.47, -896.87, 25.53},
    {973.34, -1038.19, 40.84},
    {-409.04, 1200.44, 325.65},
    {-1617.77, 3068.17, 32.27},
    {-71.8, -1089.98, 26.56},
    {-409.04, 1200.44, 325.65},
    {-1617.77, 3068.17, 32.27},
    {1246.34, 1860.78, 79.47},
    {-1777.63, 3082.36, 32.81},
    {-1775.87, 3088.13, 32.81},
    {-1827.5, 2934.11, 32.82},
    {-2123.69, 3270.14, 32.82},
    {-2444.59, 2981.63, 32.82},
    {-2448.59, 2962.8, 32.82},
    {-2277.86, 3176.57, 32.81},
    {-2969.0, 366.46, 14.77},
    {-1637.61, -814.53, 10.17},
    {-1494.72, -891.67, 10.11},
    {-902.27, -1528.42, 5.03},
    {-1173.93, -1749.87, 3.97},
    {-1087.8, -2047.55, 13.23},
    {-1133.74, -2035.99, 13.21},
    {-1234.4, -2092.3, 13.93},
    {-1025.97, -2223.62, 8.99},
    {850.42, 2197.69, 51.93},
    {42.61, 2803.45, 57.88},
    {-1193.54, -2155.4, 13.2},
    {-1184.37, -2185.67, 13.2},
    {2041.76, 3172.26, 44.98},
    {-465.48, -2169.09, 10.01},
    {-3150.77, 1086.55, 20.7},
    {-433.69, -2277.29, 7.61},
    {-395.18, -2182.97, 10.29},
    {-3029.7, 591.68, 7.79},
    {-3029.7, 591.68, 7.79},
    {-1007.29, -3021.72, 13.95},
    {-61.32, -1832.75, 26.8},
    {822.72, -2134.28, 29.29},
    {942.22, -2487.76, 28.34},
    {729.29, -2086.53, 29.3},
    {783.08, -2523.98, 20.51},
    {717.8, -2111.18, 29.22},
    {787.05, -1612.38, 31.17},
    {913.52, -1556.87, 30.74},
    {777.64, -2529.46, 20.13},
    {846.71, -2496.12, 28.34},
    {711.79, -1395.19, 26.35},
    {723.38, -1286.3, 26.3},
    {983.0, -1230.77, 25.38},
    {818.01, -2422.85, 23.6},
    {885.53, -1166.38, 24.99},
    {700.85, -1106.93, 22.47},
    {882.26, -2384.1, 28.0},
    {977.83, -1821.21, 31.17},
    {-1138.73, -759.77, 18.87},
    {938.71, -1154.36, 25.38},
    {973.0, -1156.18, 25.43},
    {689.41, -963.48, 23.49},
    {140.72, -375.29, 43.26},
    {-497.09, -62.13, 39.96},
    {-606.34, 187.43, 70.01},
    {117.12, -356.15, 42.59},
    {53.91, -1571.07, 29.47},
    {1528.1, 1719.32, 109.97},
    {1411.29, 1060.33, 114.34},
    {1145.76, -287.73, 68.96},
    {1117.71, -488.25, 65.25},
    {874.28, -949.16, 26.29},
    {829.28, -874.08, 25.26},
    {725.37, -874.53, 24.67},
    {693.66, -1090.43, 22.45},
    {977.51, -1013.67, 41.32},
    {901.89, -1129.9, 24.08},
    {911.7, -1258.04, 25.58},
    {847.06, -1397.72, 26.14},
    {830.67, -1409.13, 26.16},
    {130.47, -1066.12, 29.2},
    {-52.79, -1078.65, 26.93},
    {-131.74, -1097.38, 21.69},
    {-621.47, -1106.05, 22.18},
    {-668.65, -1182.07, 10.62},
    {-111.84, -956.71, 27.27},
    {-1323.51, -1165.11, 4.73},
    {-1314.65, -1254.96, 4.58},
    {-1169.18, -1768.78, 3.87},
    {-1343.38, -744.02, 22.28},
    {-1532.84, -578.16, 33.63},
    {-1461.4, -362.39, 43.89},
    {-1457.25, -384.15, 38.51},
    {-1544.42, -411.45, 41.99},
    {-1432.72, -250.32, 46.37},
    {-1040.24, -499.88, 36.07},
    {346.43, -1107.19, 29.41},
    {523.99, -2112.7, 5.99},
    {977.19, -2539.34, 28.31},
    {1101.01, -2405.39, 30.76},
    {1591.9, -1714.0, 88.16},
    {1693.41, -1497.45, 113.05},
    {1029.44, -2501.31, 28.43},
    {2492.55, -320.89, 93.0},
    {2846.31, 1463.1, 24.56},
    {3631.05, 3768.61, 28.52},
    {3572.5, 3665.53, 33.9},
    {2919.03, 4337.85, 50.31},
    {2521.47, 4203.47, 39.95},
    {2926.2, 4627.28, 48.55},
    {3808.59, 4463.22, 4.37},
    {3323.71, 5161.1, 18.4},
    {2133.06, 4789.57, 40.98},
    {1900.83, 4913.82, 48.87},
    {381.06, 3591.37, 33.3},
    {642.8, 3502.47, 34.09},
    {277.33, 2884.71, 43.61},
    {-60.3, 1961.45, 190.19},
    {225.63, 1244.33, 225.46},
    {-1136.15, 4925.14, 220.01},
    {-519.96, 5243.84, 79.95},
    {-602.87, 5326.63, 70.46},
    {-797.95, 5400.61, 34.24},
    {-776.0, 5579.11, 33.49},
    {-704.2, 5772.55, 17.34},
    {-299.24, 6300.27, 31.5},
    {402.52, 6619.61, 28.26},
    {-247.72, 6205.46, 31.49},
    {-267.5, 6043.45, 31.78},
    {-16.29, 6452.44, 31.4},
    {2204.73, 5574.04, 53.74},
    {1638.98, 4840.41, 42.03},
    {1961.26, 4640.93, 40.71},
    {1776.61, 4584.67, 37.65},
    {137.29, 281.73, 109.98},
    {588.37, 127.87, 98.05},
    {199.8, 2788.78, 45.66},
    {708.58, -295.1, 59.19},
    {581.28, 2799.43, 42.1},
    {1296.73, 1424.35, 100.45},
    {955.85, -22.89, 78.77}
}

-- Config for npcs that will stand in the stores
Config.NPCs = {
	-- {
	-- 	['model'] = 'mp_m_shopkeep_01',				-- Ped model (https://docs.fivem.net/docs/game-references/ped-models/)
	-- 	['emote'] = 'WORLD_HUMAN_STAND_MOBILE',		-- Ped emote (https://wiki.rage.mp/index.php?title=Scenarios)
	-- 	['pos'] = {									-- Ped locations (vector4)
	-- 		{24.47, -1346.62, 29.5, 271.66},
	-- 		{-3039.54, 584.38, 7.91, 17.27},
	-- 		{-3242.97, 1000.01, 12.83, 357.57},
	-- 		{1959.82, 3740.48, 32.34, 301.57},
	-- 		{549.13, 2670.85, 42.16, 99.39},
	-- 		{2677.47, 3279.76, 55.24, 335.08},
	-- 		{2556.66, 380.84, 108.62, 356.67},
	-- 		{372.66, 326.98, 103.57, 253.73},
	-- 		{-47.02, -1758.23, 29.42, 45.05},
	-- 		{-706.06, -913.97, 19.22, 88.04},
	-- 		{-1820.02, 794.03, 138.09, 135.45},
	-- 		{1164.71, -322.94, 69.21, 101.72},
	-- 		{1697.87, 4922.96, 42.06, 324.71},
	-- 		{-1221.58, -908.15, 12.33, 35.49},
	-- 		{-1486.59, -377.68, 40.16, 139.51},
	-- 		{-2966.39, 391.42, 15.04, 87.48},
	-- 		{1165.17, 2710.88, 38.16, 179.43},
	-- 		{1134.2, -982.91, 46.42, 277.24}
	-- 	}
	-- },
	{
		['model'] = 's_m_y_ammucity_01',		--Ammunition--
		['emote'] = 'WORLD_HUMAN_COP_IDLES',
		['pos'] = {
			{-1306.3726, -396.0908, 36.6958, 340.8833},
			{23.9555, -1107.4919, 29.7970, 73.7356},
			{251.4401, -51.7869, 69.9410, 339.6125},
			{840.4468, -1033.2804, 28.1948, 271.6895},
			{-660.1636, -935.3929, 21.8292, 79.5470},
			{1694.9696, 3761.1731, 34.7053, 132.9832},
			{-328.8727, 6085.1860, 31.4548, 130.5580},
			{-3171.0286, 1089.4323, 20.8387, 158.5614},
			{808.2572, -2158.2307, 29.6190, 283.7916}
		}
	},
	{
		['model'] = 's_m_m_trucker_01',			--SPORTING GOODS--
		['emote'] = 'WORLD_HUMAN_COP_IDLES',
		['pos'] = {
			{-1510.26, 1519.28, 115.3, 172.59}

		}
	},
}

Config.create_table = true