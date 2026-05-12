Cfg = {}

---------------------------------------------------------------------
-- AUTO-DETECT
-- 'auto_detect' will scan running resources and pick the best match.
-- Only change values if you want to FORCE a specific system.
---------------------------------------------------------------------

---------------------------------------------------------------------
Cfg.Framework = 'auto_detect'
-- auto_detect | esx | qbcore | qbox | vrp | standalone | other

Cfg.Database = 'auto_detect'
-- auto_detect | ghmattimysql | oxmysql | none

Cfg.Language = 'EN'
-- EN | ES | FR | DE | IT | PT | PT-BR | NL | PL | RU | TR | ZH | JA | AR | UA | CZ | DK | SE | NO | KR | HI
---------------------------------------------------------------------

---------------------------------------------------------------------
Cfg.BridgeDebugSQL = false -- Print SQL queries
Cfg.BridgeDebug = false -- Print debug information
Cfg.DisableDuty = false -- Disable the built-in framework duty system. Set this to true if you want police to be on duty at all times.
---------------------------------------------------------------------

---------------------------------------------------------------------
Cfg.Banking = 'okokBanking'
-- auto_detect | none | other |>
-- esx | esx_banking | fd_banking | okokBanking | okokBankingV2 | omes_banking | p_banking | ps-banking | qb-banking |>
-- qbcore | Renewed-Banking | RxBanking | tgg-banking | tgiann-bank |

Cfg.Billing = 'okokBilling'
-- auto_detect | none | other |>
-- codem_billing | esx_billing | okokBilling |

Cfg.Dispatch = 'cd_dispatch'
-- auto_detect | none | other |>
-- cd_dispatch | cd_dispatch3d | codem-dispatch | core_dispatch | emergencydispatch | lb-tablet |>
-- origen_police | ps-dispatch | qs-dispatch | rcore_dispatch | tk_dispatch

Cfg.DrawTextUI = 'ox_lib'
-- auto_detect | none | other |>
-- cd_drawtextui | jg-textui | ox_lib | okokTextUI | ps-ui | qb-core | tgiann-core | vms_notifyv2 | ZSX_UIV2 |

Cfg.Duty = 'auto_detect'
-- auto_detect | none | other |>
-- jobs_creator | origen_police |

Cfg.Gang = 'auto_detect'
-- auto_detect | none | other |>
-- av_gangs | rcore_gangs |

Cfg.Hud = 'jg-hud'
-- auto_detect | none | other |>
-- cd_playerhud | Codem-BlackHUDV2 | esx_hud | izzy-hudv5 | izzy-hudv6 | izzy-hudv7 | jg-hud | mHud | tgiann-lumihud |>
-- vms_hud | wais-hudv6 | 0r-hud-v3 | 17mov_Hud |

Cfg.Inventory = 'ox_inventory'
-- auto_detect | none | other |>
-- ak47_inventory | ak47_qb_inventory | chezza-inventory | codem-inventory | core_inventory | esx_inventory | jaksam_inventory |> 
-- origen_inventory | ox_inventory | qb-inventory | qs-inventory | tgiann-inventory |

Cfg.Mechanic = 'jg-mechanic'
-- auto_detect | none | other |>
-- cd_mechanic | jg-mechanic |

Cfg.Notification = 'ox_lib'
-- auto_detect | other | chat |>
-- cd_notification | codem-notification | codem-supreme-notification | esx | mythic_notify | okokNotify | origen_notify |>
-- ox_lib | pNotify | ps-ui | qbcore | qbox | rtx_notify | tgiann-lumihud | vms_notifyv2 | ZSX_UI | ZSX_UIV2 | 17mov_Hud |

Cfg.PersistentVehicles = 'AdvancedParking'
-- auto_detect | none | other |>
-- cd_garage | AdvancedParking |

Cfg.Phone = 'lb-phone'
-- auto_detect | none | other |>
-- esx_phone | gcphone | gksphone | high-phone | lb-phone | npwd | okokPhone | qb-phone | qbx_npwd | qs-smartphone |>
-- qs-smartphone-pro | roadphone | yseries | 17mov_Phone |

Cfg.Society = 'auto_detect'
-- auto_detect | none | other |>
-- esx_society | fd_banking | okokBankingV2 | p_banking | qb-banking | Renewed-Banking | RxBanking | tgg-banking | tgiann-bank |

Cfg.Target = 'ox_target'
-- auto_detect | none |>
-- ox_target | qb-target |

Cfg.TimeWeather = 'auto_detect'
-- auto_detect | none | other |>
-- cd_easytime | qb-weathersync | vSync |

Cfg.VehicleFuel = 'auto_detect'
-- auto_detect | none | other |>
-- BigDaddy-Fuel | cdn-fuel | esx-sna-fuel | FRFuel | lc_fuel | LegacyFuel | lj-fuel | lyre_fuel | mnr_fuel | myFuel |>
-- ND_Fuel | okokGasStation | ox_fuel | ps-fuel | qb-fuel | qb-sna-fuel | qs-fuelstations | rcore_fuel | Renewed-Fuel |>
-- ti_fuel | x-fuel |

Cfg.VehicleKeys = 'Renewed-Vehiclekeys'
-- auto_detect | none | other |>
-- ak47_qb_vehiclekeys | ak47_vehiclekeys | cd_garage | fast-vehiclekeys | fivecode_carkeys | F_RealCarKeysSystem | is_vehiclekeys |>
-- jc_vehiclekeys | loaf_keysystem | mk_vehiclekeys | mm_carkeys | MrNewbVehicleKeys | mx_carkeys | qb-vehiclekeys | qbx_vehiclekeys |>
-- qs-vehiclekeys | Renewed-Vehiclekeys stasiek_vehiclekeys | t1ger_keys | tgiann-hotwire | ti_vehicleKeys | vehicles_keys |>
-- xd_locksystem | qb-vehiclekeys | qbx_vehiclekeys |

Cfg.VehicleShop = 'jg-dealerships'
-- auto_detect | none | other |>
-- cd_vehicleshop | esx_vehicleshop | jg-dealerships | okokVehicleShop | qb-vehicleshop | qbx-vehicleshop |>
-- qs-vehicleshop | vms_vehicleshopv2 |
---------------------------------------------------------------------

---------------------------------------------------------------------
ESXVehiclesTables = { 'vehicles',  }
-- Add additional vehicle tables here if needed (used for storing vehicle data in ESX).

CodesignDiscordWebhook = 'DISCORD_WEBHOOK_HERE'
-- Discord webhook URL for remote error and debug reporting. Set this to the Discord webhook URL provided by Codesign if requested. Leave empty to disable.

Cfg.Keys={['ESC']=322,['F1']=288,['F2']=289,['F3']=170,['F5']=166,['F6']=167,['F7']=168,['F8']=169,['F9']=56,['F10']=57,['~']=243,['1']=157,['2']=158,['3']=160,['4']=164,['5']=165,['6']=159,['7']=161,['8']=162,['9']=163,['-']=84,['=']=83,['BACKSPACE']=177,['TAB']=37,['Q']=44,['W']=32,['E']=38,['R']=45,['T']=245,['Y']=246,['U']=303,['P']=199,['[']=39,[']']=40,['ENTER']=18,['CAPS']=137,['A']=34,['S']=8,['D']=9,['F']=23,['G']=47,['H']=74,['K']=311,['L']=182,['LEFTSHIFT']=21,['Z']=20,['X']=73,['C']=26,['V']=0,['B']=29,['N']=249,['M']=244,[',']=82,['.']=81,['LEFTCTRL']=36,['LEFTALT']=19,['SPACE']=22,['RIGHTCTRL']=70,['HOME']=213,['PAGEUP']=10,['PAGEDOWN']=11,['DELETE']=178,['LEFTARROW']=174,['RIGHTARROW']=175,['TOP']=27,['DOWNARROW']=173,['NENTER']=201,['N4']=108,['N5']=60,['N6']=107,['N+']=96,['N-']=97,['N7']=117,['N8']=61,['N9']=118,['UPARROW']=172,['INSERT']=121}
-- Key mapping table. Used for converting key names to their corresponding key codes.
---------------------------------------------------------------------