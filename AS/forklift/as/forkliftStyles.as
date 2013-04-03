function setApplicationStyles() {
	//set label style
	//labelStyleObj = _global.styles.Label = new mx.styles.CSSStyleDeclaration;
	//labelStyleObj.styleName = "labelStyle";
	//labelStyleObj.fontFamily = "arial";
	//labelStyleObj.color = 0xFFFFFF;
	//labelStyleObj.fontSize = "11";
	_global.style.setStyle('themeColor','haloOrange');
	//set list style
	listStyleObj = _global.styles.ScrollSelectList = new mx.styles.CSSStyleDeclaration;
	listStyleObj.styleName = "listStyle";
	listStyleObj.fontFamily = "verdana";
	listStyleObj.color = 0x000000;
	listStyleObj.fontSize = "9";
	listStyleObj.fontWeight = "bold";
	listStyleObj.backgroundColor = 0xFFFFFF;
	listStyleObj.alternatingRowColors = [0xFFFFFF,0xF8EDC2];
	listStyleObj.rollOverColor = 0xF2DE93;
	listStyleObj.selectionColor = 0xFFCC00;
	listStyleObj.textRollOverColor = 0x000000;
	listStyleObj.textSelectedColor = 0x000000;
	
	//set textInput style
	textInputStyleObj = _global.styles.TextInput = new mx.styles.CSSStyleDeclaration;
	textInputStyleObj.styleName = "textInputStyle";
	textInputStyleObj.backgroundColor = 0xFFFFFF;
	textInputStyleObj.color = 0x000000;
	textInputStyleObj.fontFamily = "verdana";
	textInputStyleObj.fontSize = "9";
	textInputStyleObj.fontWeight = "bold";
	//textInputStyleObj.borderStyle = "none";
	
	//set textArea style
	textAreaStyleObj = _global.styles.TextArea = new mx.styles.CSSStyleDeclaration;
	textAreaStyleObj.styleName = "textAreaStyle";
	textAreaStyleObj.backgroundColor = 0xB5B5B5;
	textAreaStyleObj.color = 0xFFFFFF;
	textAreaStyleObj.fontFamily = "arial";
	textAreaStyleObj.fontSize = "14";
	textAreaStyleObj.fontWeight = "bold";
	
	//set ComboBox style
	comboBoxStyleObj = _global.styles.ComboBox = new mx.styles.CSSStyleDeclaration;
	comboBoxStyleObj.styleName = "comboBoxStyle";
	comboBoxStyleObj.fontFamily = "verdana";
	comboBoxStyleObj.color = 0x000000;
	comboBoxStyleObj.fontSize = "9";
	comboBoxStyleObj.fontWeight = "bold";
	comboBoxStyleObj.backgroundColor = 0xFFFFFF;
	comboBoxStyleObj.alternatingRowColors = [0xFFFFFF,0xECE9D8];
	comboBoxStyleObj.rollOverColor = 0x316AC5;
	comboBoxStyleObj.selectionColor = 0x316AC5;
	comboBoxStyleObj.textRollOverColor = 0xFFFFFF;
	comboBoxStyleObj.textSelectedColor = 0xFFFFFF;
	
	//set Button style
	buttonStyleObj = _global.styles.Button = new mx.styles.CSSStyleDeclaration;
	buttonStyleObj.styleName = "buttonStyle";
	buttonStyleObj.fontFamily = "verdana";
	//buttonStyleObj.color = 0xFFFFFF;
	buttonStyleObj.fontSize = "9";
	buttonStyleObj.fontWeight = "bold";
}