function validator() {
	let name = frmClient.name.value
	let personType = frmClient.personType.value
	let address = frmClient.address.value
	let registration = frmClient.registration.value
	let enrollmentModality = frmClient.enrollmentModality.value
	if (name === "") {
		alert('Preencha o campo Nome')
		frmClient.name.focus()
		return false
	} else if (personType === "" || personType === "Selecione uma opção") {
		alert('Preencha o campo Tipo pessoa')
		frmClient.name.focus()
		return false
	}else if (address === "") {
		alert('Preencha o campo Endereço')
		frmClient.name.focus()
		return false
	}else if (registration === "") {
		alert('Preencha o campo Matricula')
		frmClient.name.focus()
		return false
	}else if (enrollmentModality === "") {
		alert('Preencha o campo Tipo da matricula')
		frmClient.name.focus()
		return false
	}
	else {
		document.forms["frmClient"].submit()
	}
}