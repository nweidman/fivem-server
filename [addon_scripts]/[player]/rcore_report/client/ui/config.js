const CONFIG = {
	QUICK_REPORT_BUTTONS: [
		{buttonLabel: 'Found a bug', reportTitle: 'Found a bug'},
		{buttonLabel: 'Rules breaker', reportTitle: 'Rules breaker'},
	],

    REPORT_DATE_FORMAT: 'DD.MM.YYYY HH:mm',
    CHAT_MESSAGE_FORMAT: 'HH:mm',

	// true/false - allow players to see history of their reports
	SHOW_HISTORY_FOR_PLAYERS: true,

	// null - unlimited reports
	// number - maximum active reports for player
	MAX_ACTIVE_REPORTS: undefined,

	// number - define height of main logo in header
	// max-height is 80px
	LOGO_HEIGHT: 56,

	LOCALE: 'ENGLISH',

	// you could set custom colors for admin name and background of message
	// for messages sent by admins
	// null - default colors are used
	// color - you could use RGB/RGBA/HEX colors. We recommend to pick your color in https://g.co/kgs/xdDh7t
	ADMIN_MESSAGE_NAME_COLOR: null,
	ADMIN_MESSAGE_BACKGROUND_COLOR: null,

	// defines font-size for chat messages in report chat in px
	REPORT_CHAT_MESSAGE_FONT_SIZE: 12,

	// defines font-size for timeline elements in px
	TIMELINE_TITLE_FONT_SIZE: 12,
	TIMELINE_DATE_FONT_SIZE: 12,
	TIMELINE_MESSAGE_FONT_SIZE: 12,

	// IF set to `true` add column into reports table with information about how old report is
	SHOW_HOW_OLD_REPORT_IS_IN_REPORTS_OVERVIEW: false,

	// If set to false all admins will be shown as 'ADMIN' for players
	SHOW_ADMIN_NAMES: false,

	// If set to `true` image preview will be shown in fullscreen
	// If set to `false` image preview will have same size as report UI
	REPORT_CHAT_IMAGE_PREVIEW_FULLSCREEN: true,

	// timeout before updating admin in report
	ADMIN_IN_REPORT_TIMEOUT_BEFORE_CHANGE: 2000, // miliseconds

	// timeout before player is allowed to create next report
	TIMEOUT_BEFORE_NEXT_REPORT_CREATION: 5000, // miliseconds

	// set to `true` only if you handle admin duty toggle by yourself
	HIDE_ADMIN_DUTY_TOGGLE: false,

	// if set to `true` admins won't be able to set god mode to anyone
	DISABLE_GOD_MODE_ACTION: false,

	// if set to `true` admin will see only reports which are untouched
	// and no admin is currently in the report
	// this affects only admins
	SHOW_ONLY_REPORTS_WITHOUT_ADMINS: false,

	// defines minimal text length for report title
	REPORT_TITLE_MINIMAL_LENGTH: 1,

	// defines words that are not allowed to be used in report title
	TITLE_BLACKLISTED_WORDS: [],

	AUTOMATED_FIRST_REPORT_MESSAGE: {
		enabled: false,
		name: 'System',
		messageText: 'Automated first message',
	},

	// defines if screenshots will be visible only to admins
	HIDE_SCREENSHOTS_FOR_PLAYERS: false,

	// true/false - if set to 'false' .jpg background will be used instead
	USE_PNG_BACKGROUND: true,
}

// to create new translation copy all entries from `ENGLISH` and paste them under new language
const TRANSLATIONS = {
	ENGLISH: {
		TIMELINE: {
			CREATE_REPORT: 'Create Report',
			SET_IN_RESOLVE: 'Set in resolve',
			SET_TITLE: 'Set title',
			CLOSED_REPORT: 'Closed report',
			ADD_MESSAGE: 'Add message',
			HIDE_MESSAGE: 'Hide message',
			SHOW_MESSAGE: 'Show message',
			ADD_PLAYER_TO_REPORT: 'Add player to report',
			KICK_FROM_REPORT: 'Kick player from report',
			ADMIN_ENTERS_REPORT: 'Admin enters report',
			ADMIN_LEAVES_REPORT: 'Admin leaves report',
			SET_TAG: 'Set tag',
			CLEAR_TAG: 'Clear tag',
		},
		PAGES: {
			WELCOME_PAGE: 'REPORTS',
			HISTORY: 'HISTORY',
			STATISTICS: 'STATISTICS',
			SETTINGS: 'SETTINGS',
		},
		WELCOME_PAGE: {
			title: 'Reports',
			newReportPlaceholder: 'Report title',
			newReportButtonLabel: 'SEND',
			createReportsTitle: 'CREATE REPORT',
			quickReportsTitle: 'QUICK REPORTS',
			overviewButtonLabel: 'OVERVIEW',
			historyButtonLabel: 'HISTORY',
			noHistoryReportsTooltip: 'No reports available',
			statisticsButtonLabel: 'STATISTICS',
			closeButtonLabel: 'CLOSE',
			searchInputPlaceholder: 'Search by name, title, tag',
			reportTitle: 'Title',
			author: 'Author',
			tag: 'Tag',
			state: 'State',
			createdDate: 'Created Date',
			noReportsFound: 'NO REPORTS FOUND',
			quickReportsTooltipInfo: 'Create quick report with predefined title',
			reachedReportsLimit: 'Reached {{maxLimit}} reports limit',
			waitSomeTimeBeforeNextReport: 'You have to wait some time before you can create a new report',
			blacklistedWord: 'This message contains forbidden word and will not be sent',
		},
		HISTORY_PAGE: {
			title: 'Reports History',
			searchInputPlaceholder: 'Search by name, report title, tag',
			timeline: 'TIMELINE',
			chat: 'CHAT',
			author: 'Author',
			reportTitle: 'Title',
			tag: 'Tag',
			resolvedBy: 'Resolved By',
			createdDate: 'Created Date',
			noReportsFound: 'NO REPORTS FOUND',
		},
		SETTINGS_PAGE: {
			adminDuty: 'Admin Duty',
			adminDutyOn: 'On',
			adminDutyOff: 'Off',
			online: 'ONLINE',
			onDutyChat: 'YOU HAVE TO BE ON DUTY TO SEE MESSAGES',
		},
		STATISTICS_PAGE: {
			title: 'Statistics',
			name: 'Name',
			solvedReports: 'Solved Reports',
			unfinishedReports: 'Unfinished Reports',
			closedReports: 'Closed Reports',
			shortestReportTime: 'Shortest Report Time',
			averageReportTime: 'Average Report Time',
			longestReportTime: 'Longest Report Time',
			noData: 'No Data',
			allAdmins: 'All Admins',
		},
		REPORT_DETAIL: {
			backButtonLabel: 'Back',
			createdAtLabel: 'Created at',
			author: 'AUTHOR',
			admins: 'ADMINS',
			players: 'PLAYERS',
			playersInArea: 'PLAYERS IN AREA',
			invitePlayersButtonLabel: 'INVITE PLAYER',
			closeReportButtonLabel: 'CLOSE TICKET',
			lastMessage: 'Last Message',
			ago: 'ago',
			hideKeyHint: 'K to hide',
			sidebarId: 'Id',
			sidebarAuthor: 'Author',
			sidebarState: 'State',
			clickOnTitleToEdit: 'Click on title for editing',
			saveTitleButtonLabel: 'Save',
			cancelTitleButtonLabel: 'Cancel',
		},
		REPORT_STATE: {
			new: 'New',
			pending: 'Pending',
			solved: 'Solved',
		},
		REPORT_CHAT: {
			clickToZoomImageLabel: 'Click to zoom',
			hideLabel: 'HIDE',
			showLabel: 'SHOW',
			replyLabel: 'REPLY',
			respondingToLabel: 'Responding to',
			respondingToClearLabel: 'CLEAR',
			newMessageInputLabel: 'New Message',
			addTag: 'Add Tag',
			chat: 'CHAT',
			timeline: 'TIMELINE',
			noLogs: 'No Logs',
			noMessages: 'No Messages',
			noAdminsOnline: 'No Admins Online. Consider using discord instead.',
			screenshotHiddenForPlayers: 'Screenshots are hidden for players',
		},
		PLAYER_OVERLAY: {
			actions: 'PLAYER ACTIONS',
			adminActions: 'ADMIN ACTIONS',
			goToButtonLabel: 'GO TO',
			bringButtonLabel: 'BRING',
			freezeButtonLabel: 'FREEZE',
			unfreezeButtonLabel: 'UNFREEZE',
			invulnerableButtonLabel: 'INVULNERABLE',
			vulnerableButtonLabel: 'VULNERABLE',
			kickFromReportButtonLabel: 'KICK FROM REPORT',
			savePositionButtonLabel: 'SAVE POSITION',
			retrievePositionButtonLabel: 'RETRIEVE POSITION',
			offline: 'OFFLINE',
			healButtonLabel: 'HEAL',
			reviveButtonLabel: 'REVIVE',
		},
		PLAYERS_IN_AREA_OVERLAY: {
			health: 'Health',
			armor: 'Armor',
			discordId: 'Discord ID',
			steamId: 'Steam ID',
			rockstarLicense: 'Rockstar License',
			coords: 'Coords',
			inventory: 'Inventory',
			empty: 'Empty',
			clickToCopy: 'You could copy the values by clicking on them',
			copied: 'Copied',
			searchInInventoryPlaceholder: 'Search by name',
		},
		INVITE_OVERLAY: {
			searchInputPlaceholder: 'Search by name, id',
			youWantToInvite: 'You want to invite',
			toTheChat: 'to the chat',
			confirm: 'CONFIRM',
			back: 'BACK',
		},
		CLOSE_REPORT_OVERLAY: {
			youWantToClose: 'You want to close report',
		},
		OTHER: {
			copied: 'Copied',
		}
	},
}
