function stringToArray(input){
  return JSON.parse(input);
}

function trim(input, unwantedChar){
	var cleanInput = input;
	if( cleanInput.charAt(0) === unwantedChar){
	    cleanInput = jsonText.slice(1);
	}
	if( cleanInput.charAt(cleanInput.length -1) === unwantedChar){
		cleanInput = jsonText.slice(-1);
	}
	return cleanInput;
}

function toJson(input){
  return JSON.parse(input);
}