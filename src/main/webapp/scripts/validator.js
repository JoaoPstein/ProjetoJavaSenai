function validator() {
	let name = frmClient.name.value
	let personType = frmClient.personType.value
	if (name === "") {
		alert('Preencha o campo Nome')
		frmClient.name.focus()
		return false
	} else if (personType === "") {
		alert('Preencha o campo tipo pessoa')
		frmClient.personType.focus()
		return false
	} else {
		document.forms["frmClient"].submit()
	}
}