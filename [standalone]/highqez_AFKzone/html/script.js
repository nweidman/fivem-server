window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'InSafezone':
			$(".safezoneimg").fadeIn(500);
			break
        case 'OutSafezone':
			$(".safezoneimg").fadeOut(500);
			break
        case 'InAFKzone':
			$(".afkzoneimg").fadeIn(500);
			break
        case 'OutAFKzone':
			$(".afkzoneimg").fadeOut(500);
			break
	}
});