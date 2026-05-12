Config = Config or {}

Config.PoliceGarages = {
    --[[ [1] = {
        garage = vector3(-613.72, -106.13, 33.75),
        spawn = vector4(-614.33, -115.34, 33.75, 201.03),
        job = "police"
    }, ]]-- courthouse pd
--[[     
    [1] = { -- VPD LSPD
        garage = vector3(592.75, -19.13, 73.99),
        spawn = vector4(598.84, 11.71, 73.92, 72.00),
        job = "police"
    },
 ]]    
    [1] = { -- MRPD LSPD
        garage = vector3(441.27, -1011.96, 24.45),
        spawn = vector4(445.54, -1014.14, 24.45, 271.63),
        job = "police"
    },
    [2] = { -- Sand Shores PD BCSO
        garage = vector3(1861.02, 3709.53, 33.74),
        spawn = vector4(1857.29, 3704.89, 33.75, 120.00),
        job = "sheriff"
    },
    [3] = { -- VPD BCSO
        garage = vector3(592.75, -19.13, 73.99),
        spawn = vector4(598.84, 11.71, 73.92, 72.00),
        job = "sheriff"
    },
    [4] = { -- Sand Shores PD LSPD
        garage = vector3(1861.02, 3709.53, 33.74),
        spawn = vector4(1857.29, 3704.89, 33.75, 120.00),
        job = "police"
    },
    [5] = { -- Davis BCSO
        garage = vector3(354.86, -1614.02, 29.27),
        spawn = vector4(351.09, -1606.04, 29.27, 320.00),
        job = "sheriff"
    },
    [6] = { -- Davis PD LSPD
        garage = vector3(354.86, -1614.02, 29.27),
        spawn = vector4(351.09, -1606.04, 29.27, 320.00),
        job = "police"
    },
    [7] = { -- BSMC Bike Shop
        garage = vector3(-229.41, 6176.63, 31.92),
        spawn = vector4(-231.13, 6184.23, 31.49, 16.41),
        gang = "bsmc"
    }, 
    [8] = { -- EMS
        garage = vector3(328.21, -656.39, 22.54),
        spawn = vector4(324.83, -645.63, 22.54, 69.52),
        job = "ambulance"
    }
--[[ -- No longer with city
    [8] = { -- PRMC Bike Shop
    garage = vector3(-439.71, 6141.66, 31.48),
    spawn = vector4(-434.38, 6136.76, 31.48, 225.61),
    gang = "prmc"
},
    [9] = { -- FSMC Bike Shop
    garage = vector3(-439.71, 6141.66, 31.48),
    spawn = vector4(-434.38, 6136.76, 31.48, 225.61),
    gang = "fsmc"
}, ]]
}

Config.AmbulanceVehicles = {
    ['asapambo'] = {
        name = 'Crocodile',
        price = 75000,
        grades = {5, 6, 7},
    },
    ['killer_ems4'] = {
        name = 'EMS Raiden',
        price = 75000,
        grades = {5, 6, 7},
    },
    ['killer_ems3'] = {
        name = 'EMS Sentinel',
        price = 75000,
        grades = {4, 5, 6, 7},
    },
    ['killer_ems2'] = {
        name = 'EMS SUV',
        price = 50000,
        grades = {3, 4, 5, 6, 7},
    },
    ['sandmark'] = {
        name = 'EMS Caracara',
        price = 50000,
        grades = {2, 3, 4, 5, 6, 7},
    },
    ['peaceambo'] = {
        name = 'EMS SAR Jeep',
        price = 50000,
        grades = {2, 3, 4, 5, 6, 7},
    },
    ['killer_ems6'] = {
        name = 'EMS Van',
        price = 30000,
        grades = {1, 2, 3, 4, 5, 6, 7},
    }
}

Config.PoliceVehicles = {
    ['pbike'] = {
        name = 'Police Bicycle',
        price = 500,
    },
    ['bpunrumporb'] = { -- spawn name
        name = 'Police Transport Van', -- label name
        price = 15000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['pbus'] = { -- spawn name
        name = 'Police Prision Bus', -- label name
        price = 50000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polscout'] = { -- spawn name
        name = 'Police Vapid Scout', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_poltavros'] = { -- spawn name
        name = 'Police Tavros', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},        
    },
    ['onx_poltulip'] = { -- spawn name
        name = 'Police Tulip M-100', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polbuff'] = { -- spawn name
        name = 'Police Bravado Buffalo', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polmonar'] = { -- spawn name
        name = 'Police Vapid Monarch PI', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polregent'] = { -- spawn name
        name = 'Police Regent SSV', -- label name
        price = 35000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polbison4'] = { -- spawn name
        name = 'Police Bravado Bison Transport', -- label name
        price = 40000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polbison3'] = { -- spawn name
        name = 'Police Bravado Bison', -- label name
        price = 40000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polterm'] = { -- spawn name
        name = 'Police Canis Terminus', -- label name
        price = 55000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polbuffhf'] = { -- spawn name
        name = 'Police Bravado Buffalo Hellfire', -- label name
        price = 55000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polsandxl'] = { -- spawn name
        name = 'Police Vapid Sandstorm XL', -- label name
        price = 55000, -- price
        grades = {10, 11, 12, 13, 14, 15, 16},
    },
    ['bcat'] = { -- spawn name
        name = 'Police Vapid SRU Tarv', -- label name
        price = 150000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['204sLEOSentinelCoupe'] = { -- spawn name
        name = 'Police Sentinel Coupe', -- label name
        price = 90000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['2vd_outlaw'] = { -- spawn name
        name = 'Police Nagasaki Outlaw', -- label name
        price = 45000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['umkomodarb'] = { -- spawn name
        name = 'Police Komoda', -- label name
        price = 55000, -- price
        grades = {10, 11, 12, 13, 14, 15, 16},
    },
    ['umhellfire1bb'] = { -- spawn name
        name = 'Police Hellfire', -- label name
        price = 55000, -- price
        grades = {10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polvigero'] = { -- spawn name
        name = 'Police Vigero', -- label name
        price = 95000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['spnsbjv'] = { -- spawn name
        name = 'Police Nagasaki Shinobi', -- label name
        price = 85000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['sidecarh'] = { -- spawn name
        name = 'Police Glyde Sidecar', -- label name
        price = 45000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['pdbf400rb'] = {
        name = 'Police Nagasaki BF400',
        price = 45000,
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polcara'] = { -- spawn name
        name = 'Police Swat Caracara', -- label name
        price = 150000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['swatvanr2'] = {
        name = 'Police SRU Jogger',
        price = 45000,
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['apoliceu15'] = { -- spawn name
        name = 'CID Benefactor Schafter', -- label name
        price = 25000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['apoliceub'] = { -- spawn name
        name = 'CID Gallivanter Baller', -- label name
        price = 30000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['gtfminivan'] = {
        name = 'CID Vapid Minivan',
        price = 40000,
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_poldorado2'] = {
        name = 'Police Bravado Dorado',
        price = 55000,
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polscout2'] = { -- spawn name
        name = 'Police Vapid Scout Classic', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polgaunt'] = { -- spawn name
        name = 'Police Bravado Gauntlet', -- label name
        price = 95000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polbison2'] = { -- spawn name
        name = 'Police Bravado Bison XL', -- label name
        price = 40000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polterm2'] = { -- spawn name
        name = 'Police Canis Terminus Overland', -- label name
        price = 55000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polcava'] = { -- spawn name
        name = 'Police Calvacade DLX XL', -- label name
        price = 45000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polinvict'] = { -- spawn name
        name = 'Police Canis Invictius', -- label name
        price = 55000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_poldorado'] = { -- spawn name
        name = 'Police Bravado Dorado Classic', -- label name
        price = 25000, -- price
        grades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    ['onx_polvstr'] = { -- spawn name
        name = 'Police VSTR', -- label name
        price = 95000, -- price
        grades = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
    },
    --['pdverusrb'] = {
    --    name = 'SAST Western Verus',
    --    price = 40000,
    --    grades = {4, 5, 6, 7, 8, 9, 10},
    --},
    --['2vd_outlaw'] = {
    --    name = 'SAST Nagasaki Outlaw',
    --    price = 40000,
    --    grades = {4, 5, 6, 7, 8, 9, 10},
    --},
}

Config.Commissioner = {
    ['pbike'] = {
        name = 'Police Bicycle',
        price = 500,
    },
    ['bll1rb'] = { -- spawn name
        name = 'Police Vapid Torence STX', -- label name
        price = 25000, -- price
    },
    ['bll2rb'] = { -- spawn name
        name = 'Police Vapid Stainer LE', -- label name
        price = 15000, -- price
    },
    ['labsvapidleo'] = { -- spawn name
        name = 'Police Vapid Brunki', -- label name
        price = 60000, -- price
    },
    ['204sLEOSentinelCoupe'] = { -- spawn name
        name = 'Police Sentinel Coupe', -- label name
        price = 60000, -- price
    },
    ['pdpantoj'] = { -- spawn name
        name = 'Police Panto', -- label name
        price = 25000, -- price
    },
    ['bll3rb'] = { -- spawn name
        name = 'Police Bravado Buffalo STX', -- label name
        price = 60000, -- price
    },
    ['bll4rb'] = { -- spawn name
        name = 'Police Declasse Alamo LE', -- label name
        price = 50000, -- price
    },
    ['bll5rb'] = { -- spawn name
        name = 'Police Vapid Scout', -- label name
        price = 50000, -- price
    },
    ['bll6rb'] = { -- spawn name
        name = 'Police Canis Terminus', -- label name
        price = 55000, -- price
    },
    ['bll7rb'] = { -- spawn name
        name = 'Police Vapid Sandstorm', -- label name
        price = 40000, -- price
    },
    ['ll3bb'] = { -- spawn name
        name = 'Police Bravado Buffalo STX Slicktop', -- label name
        price = 60000, -- price
    },
    ['ll4bb'] = { -- spawn name
        name = 'Police Declasse Alamo LE Slicktop', -- label name
        price = 50000, -- price
    },
    ['ll5bb'] = { -- spawn name
        name = 'Police Vapid Scout Slicktop', -- label name
        price = 50000, -- price
    },
    ['ll6bb'] = { -- spawn name
        name = 'Police Canis Terminus Slicktop', -- label name
        price = 55000, -- price
    },
    ['ll7bb'] = { -- spawn name
        name = 'Police Vapid Sandstorm Slicktop', -- label name
        price = 40000, -- price
    },
    ['markedvigerorb'] = { -- spawn name
        name = 'Police Declasse Vigero ZX Interceptor', -- label name
        price = 95000, -- price
    },
    ['markedgauntletrb'] = { -- spawn name
        name = 'Police Bravado Gauntlet Interceptor', -- label name
        price = 95000, -- price
    },
    ['spnsbjv'] = { -- spawn name
        name = 'Police Nagasaki Shinobi', -- label name
        price = 85000, -- price
    },
    ['sidecarh'] = { -- spawn name
        name = 'Police Glyde Sidecar', -- label name
        price = 65000, -- price
    },
    ['pdbf400rb'] = {
        name = 'Police Nagasaki BF400',
        price = 65000,
    },
    ['bcat'] = { -- spawn name
        name = 'Vapid SRU Tarv', -- label name
        price = 150000, -- price
    },
    ['bpunrumporb'] ={
        name = 'Police Transport Van',
        price = 45000,
    },
    ['pbus'] = { -- spawn name
        name = 'Vapid Prison Bus', -- label name
        price = 50000, -- price
    },
    ['apoliceu9'] = { -- spawn name
        name = 'CID Übermacht Oracle', -- label name
        price = 25000, -- price
    },
    ['apoliceu15'] = { -- spawn name
        name = 'CID Benefactor Schafter', -- label name
        price = 25000, -- price
    },
    ['apoliceub'] = { -- spawn name
        name = 'CID Gallivanter Baller', -- label name
        price = 30000, -- price
    },
    ['apoliceu7'] = { -- spawn name
        name = 'CID Dundreary Shrink', -- label name
        price = 25000, -- price
    },
    ['apoliceu6'] = { -- spawn name
        name = 'CID Vapid Scout', -- label name
        price = 30000, -- price
    },
    ['umkomodarb'] = { -- spawn name
        name = 'Lampadati Komoda', -- label name
        price = 50000, -- price
    },
    ['2vd_ahelion'] = {
        name = 'Game Warden Annis Hellion',
        price = 45000,
    },
    ['2vd_hakuchou'] = {
        name = 'Police Shitzu Hakuchou',
        price = 75000,
    },
    ['2vd_vcaracara3'] = {
        name = 'Game Warden Vapid Caracara',
        price = 65000,
    },
    ['umhellfire1bb'] = {
        name = 'Police Bravado Hellfire',
        price = 50000,
    },
    ['gtfminivan'] = {
        name = 'CID Vapid Minivan',
        price = 40000,
    },
    ['swatvanr2'] = {
        name = 'SRU Benefactor Jogger Van',
        price = 65000,
    },
}

Config.BSMCVehicles = {
    ['bloodshedrg22'] = { -- spawn name
        name = 'Blood Shredder', -- label name
        price = 50000, -- price
        grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
    ['streetblazer'] = { -- spawn name
        name = 'Street Blazer', -- label name
        price = 50000, -- price
        grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
}

--[[ -- No longer with city
Config.PRMCVehicles = {
    ['PRMC_EZRedSkull'] = { -- spawn name
        name = 'Skully', -- label name
        price = 50000, -- price
        grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
    ['PRMC_FlagBike'] = { -- spawn name
    name = 'Pale Glyde', -- label name
    price = 50000, -- price
    grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
    ['PRMC_Stiletto'] = { -- spawn name
    name = 'Stiletto', -- label name
    price = 50000, -- price
    grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
}

Config.FSMCVehicles = {
    ['FSMC_RHIN'] = { -- spawn name
        name = 'Rhine', -- label name
        price = 50000, -- price
        grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
    ['FSMC_THUGGA'] = { -- spawn name
    name = 'Thugga', -- label name
    price = 50000, -- price
    grades = {1,2,3,4,5,6,7,8,9,10,11,12},
    },
} ]]