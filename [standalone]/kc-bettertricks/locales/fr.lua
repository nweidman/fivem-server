Locale                          = Locale or {}

Locale['fr'] = { -- 'fr' is the reference that will be used for 'Config.Language'

    -- SECTION DEBUG
    DebugName                               = "[DEBUG]",
    LoadingPlayerConfig                     = "Chargement de la config joueur...",
    GroundPreferencesLoaded                 = "Préférences au sol chargées",
    AirPreferencesLoaded                    = "Préférences en l'air chargées",
    ControlTypeLoaded                       = "Type de contrôle chargé",
    PlayerConfigLoaded                      = "Config joueur chargée !",
    NoStuntFound                            = "Aucune figure trouvée pour cette combinaison de touches",
    NoFirstInput                            = "Aucune première entrée",
    NoSecondInput                           = "Aucune deuxième entrée",
    PlayerNoLongerInAir                     = "Plus en l'air, figure annulé.",
    WaitingPlayerNextInput                  = "En attente du changement de direction du joueur depuis neutre.",
    WaitingPlayerFirstInput                 = "Le joueur a changé de direction depuis neutre. En attente maintenant de la première direction du joueur.",
    WaitingPlayerFirstInputLoop             = "En attente de la première direction du joueur.",
    WaitingPlayerSecondInput                = "Première direction détectée, en attente maintenant de la deuxième direction du joueur.",
    WaitingPlayerSecondInputLoop            = "En attente de la deuxième direction du joueur.",
    PlayerSecondInputProcess                = "Deuxième direction détectée, va maintenant réaliser la figure %s %s.",

    -- SECTION COMMANDE
    ChatHeader                              = "Système",

    TricksOrganizeCMDHeader                 = "Configurations actuelles des directions des touches :\n",
    TricksOrganizeCMDArgs1Missing           = "Direction '%s' introuvable !",
    TricksOrganizeCMDInvalidFormat          = "Format invalide ! Utilisez : /%s [directionPrimaire] [directionSecondaire] [nomDeLaFigure]",
    TricksOrganizeCMDStuntDontExist         = "Cette figure n'existe pas",
    TricksOrganizeCMDSetPreferences         = "%s + %s est défini à \"%s\"",
    TricksOrganizeSuggestionGenericFormat   = "/%s [directionPrimaire] [directionSecondaire] [nomDeLaFigure]",
    TricksOrganizeSuggestionExample         = "'/%s up down Nac-Nac (R)'",
    TricksOrganizeSuggestionListExample     = "'/%s list' (pour voir le tableau complet)",
    TricksOrganizeSuggestionListExample2    = "'/%s list [directionPrimaire]' ('up' par exemple, vous permet de voir la liste des figures 'up')",
    TricksOrganizeSuggestionHeader          = "Utilisez %s pour définir une figure. Par exemple: %s, %s ou %s. Total des figures disponibles : %d",
    TricksOrganizeSuggestionPrimary         = "Par exemple: up, down, left, right ou 'list' (pour voir le tableau). Si vous utilisez 'list', vous pouvez également spécifier une direction pour filtrer les résultats.",
    TricksOrganizeSuggestionSecond          = "Par exemple: up, down, left, right (différent de directionPrimaire)",
    TricksOrganizeSuggestionStuntName       = "Nom de la figure. Par exemple: %s",

    TricksToggleCommandInvalid              = "Nom de figure invalide !",
    TricksToggleCommandSetPreferences       = "%s est maintenant %s",
    TricksToggleSuggestionHeader            = "Utilisez /%s [nomDeLaFigure] pour activer ou désactiver une figure.\nFigures activées (%d) : %s\nFigures désactivées (%d) : %s",
    TricksToggleSuggestionPrimary           = "\nFigures activées (%d) : %s\nFigures désactivées (%d) : %s",
    TricksToggleEnabled                     = "activé",
    TricksToggleDisabled                    = "désactivé",

    TricksControlCMDSetType                 = "Contrôle maintenant défini sur : %s",
    TricksControlCMDInvalidFormat           = "Format invalide ! Utilisez : /%s [typeDeContrôle] \nLes types de contrôle disponibles sont 'Normal' et 'Inverse'",
    TricksControlSuggestionHeader           = "Utilisez /%s [typeDeContrôle] pour choisir comment contrôler le mode wheelie (Actuel : %s)\n'Normal' est plus facile pour les wheelies à grande vitesse, tandis que 'Inverse' est plus contrôlable à basses vitesses.",
    TricksControlSuggestionPrimary          = "\nLes types de contrôle disponibles sont 'Normal' et 'Inverse'",

    -- SECTION GÉNÉRALE
    ErrorPlayerNoGroundPreferences          = "Vous avez besoin d'au moins une figure. Faites %s pour en ajouter une !",

}