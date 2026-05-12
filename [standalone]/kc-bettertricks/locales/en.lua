Locale                          = Locale or {}

Locale['en'] = { -- 'en' is the reference that will be used for 'Config.Language'

    -- DEBUG SECTION
    DebugName                               = "[DEBUG]",
    LoadingPlayerConfig                     = "Loading player config...",
    GroundPreferencesLoaded                 = "Ground preferences Loaded",
    AirPreferencesLoaded                    = "Air preferences loaded",
    ControlTypeLoaded                       = "Control type loaded",
    PlayerConfigLoaded                      = "Player config loaded!",
    NoStuntFound                            = "No stunt found for this combination of keys",
    NoFirstInput                            = "No first input",
    NoSecondInput                           = "No second input",
    PlayerNoLongerInAir                     = "No longer in the air, stunt aborted.",
    WaitingPlayerNextInput                  = "Waiting for player to change direction from neutral.",
    WaitingPlayerFirstInput                 = "Player has changed from neutral direction. Now will wait for player to input first direction.",
    WaitingPlayerFirstInputLoop             = "Waiting for player to input first direction.",
    WaitingPlayerSecondInput                = "First direction detected, will now wait for player to input second direction.",
    WaitingPlayerSecondInputLoop            = "Waiting for player to input second direction.",
    PlayerSecondInputProcess                = "Second direction detected, will now perform %s %s stunt.",

    -- COMMAND SECTION
    ChatHeader                              = "System",

    TricksOrganizeCMDHeader                 = "Current Key Direction Configurations:\n",
    TricksOrganizeCMDArgs1Missing           = "Direction '%s' not found!",
    TricksOrganizeCMDInvalidFormat          = "Invalid format! Use: /%s [primaryDirection] [secondaryDirection] [stuntName]",
    TricksOrganizeCMDStuntDontExist         = "This stunt does not exist",
    TricksOrganizeCMDSetPreferences         = "Set %s + %s to \"%s\"",
    TricksOrganizeSuggestionGenericFormat   = "/%s [primaryDirection] [secondaryDirection] [stuntName]",
    TricksOrganizeSuggestionExample         = "'/%s up down Nac-Nac (R)'",
    TricksOrganizeSuggestionListExample     = "'/%s list' (to view the full table)",
    TricksOrganizeSuggestionListExample2    = "'/%s list [primaryDirection]' ('up' for example, let's you see the 'up' tricks list)",
    TricksOrganizeSuggestionHeader          = "Use %s to set a trick. E.g., %s, %s or %s. Total stunts available: %d",
    TricksOrganizeSuggestionPrimary         = "E.g., up, down, left, right or 'list' (to view the table). If using 'list', you can also specify a direction to filter results.",
    TricksOrganizeSuggestionSecond          = "E.g., up, down, left, right (different from primaryDirection)",
    TricksOrganizeSuggestionStuntName       = "Name of the stunt. E.g., %s",

    TricksToggleCommandInvalid              = "Invalid trick name!",
    TricksToggleCommandSetPreferences       = "%s has been %s",
    TricksToggleSuggestionHeader            = "Use /%s [trickName] to enable or disable a trick.\nEnabled Tricks (%d): %s\nDisabled Tricks (%d): %s",
    TricksToggleSuggestionPrimary           = "\nEnabled Tricks (%d): %s\nDisabled Tricks (%d): %s",
    TricksToggleEnabled                     = "enabled",
    TricksToggleDisabled                    = "disabled",

    TricksControlCMDSetType                 = "Control now set to: %s",
    TricksControlCMDInvalidFormat           = "Invalid format! Use: /%s [controlType] \nAvailable Control types are 'Normal' and 'Inverse'",
    TricksControlSuggestionHeader           = "Use /%s [controlType] to choose how to control the wheelie mode (Current: %s)\n'Normal' is easier for high-speed wheelies, while 'Inverse' is more controllable at lower speeds.",
    TricksControlSuggestionPrimary          = "\nAvailable Control types are 'Normal' and 'Inverse'",

    -- GENERAL SECTION
    ErrorPlayerNoGroundPreferences          = "You need atleast 1 stunt. Do /%s to add one!",

}