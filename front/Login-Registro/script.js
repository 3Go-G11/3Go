var upperValidate = false
var lowerValidate = false
var numberValidate = false

function cadastrarempresa(){
    var razao = inputRazao.value;
    var cnpj = inputCNPJ.value;
    var nomeRepresentante = inputRepresentante.value;
    var emailEmpresa = inputEmail.value;
    var telefoneEmpresa = inputTelefone.value;
    var senhaEmpresa = inputSenha.value;
    var confirmEmpresa = inputConfirmarSenha.value;
    var indice_arroba = emailEmpresa.indexOf('@')

    var validate;
   

    for (var i = 0; i < senhaEmpresa.length && upperValidate == false; i++) {
        if (senhaEmpresa[i] == senhaEmpresa[i].toUpperCase()) {
            upperValidate = true;
        }
    }
    
    for (var i = 0; i < senhaEmpresa.length && lowerValidate == false ; i++) {
        if (senhaEmpresa[i] == senhaEmpresa[i].toLowerCase()) {
            lowerValidate = true;
        }
    }

    var validNumbers = '0123456789'
    for (var i = 0; i < senhaEmpresa.length && numberValidate == false ; i++) {
        if (validNumbers.indexOf(senhaEmpresa[i]) >= 0) {
            numberValidate = true;
        }
    }

    if(indice_arroba < 0){
        validate = false
        spanEmail.innerHTML=`Insira um email valido`
    } else{
        spanEmail.innerHTML=``
    }
    if(senhaEmpresa.length < 8 || upperValidate == false || lowerValidate == false || numberValidate == false){
        validate = false
        spanSenha.innerHTML=`Senha fraca, sua senha deve conter no minímo 8 digitos, 1 letra maiúscula, 1 letra minúscula e 1 número`
    } else{
        spanSenha.innerHTML=``
    } 
    if(confirmEmpresa != senhaEmpresa){
        validate = false
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } else {
        spanConfirmarSenha.innerHTML=``
    } 
    
    if (indice_arroba >= 0 && senhaEmpresa.length >=8 && confirmEmpresa == senhaEmpresa && upperValidate == true && lowerValidate == true && numberValidate == true){
        validate = true;
        spanRealizado.innerHTML = `Cadastro Realizado`
        window.location.href = "./Login.html"
    }


    



    console.log(`Numero valido${numberValidate}`)
    console.log(`Maior${upperValidate}`)
    console.log(`Menor${lowerValidate}`)
}

function cadastrarfunc(){

    var nomeFunc = inputNomeFunc.value;
    var emailFunc = inputEmailFunc.value;
    var senhaFunc = inputSenhaFunc.value;
    var confirmFunc = inputConfirmFunc.value;
    var indice_arroba = emailFunc.indexOf('@');


    var validate;
   

    for (var i = 0; i < senhaFunc.length && upperValidate == false; i++) {
        if (senhaFunc[i] == senhaFunc[i].toUpperCase()) {
            upperValidate = true;
        }
    }
    
    for (var i = 0; i < senhaFunc.length && lowerValidate == false ; i++) {
        if (senhaFunc[i] == senhaFunc[i].toLowerCase()) {
            lowerValidate = true;
        }
    }

    var validNumbers = '0123456789'
    for (var i = 0; i < senhaFunc.length && numberValidate == false ; i++) {
        if (validNumbers.indexOf(senhaFunc[i]) >= 0) {
            numberValidate = true;
        }
    }

    if(indice_arroba < 0){
        validate = false
        spanEmail.innerHTML=`Insira um email valido`
    } else{
        spanEmail.innerHTML=``
    }
    if(senhaFunc.length < 8 || upperValidate == false || lowerValidate == false || numberValidate == false){
        validate = false
        spanSenha.innerHTML=`Senha fraca, sua senha deve conter no minímo 8 digitos, 1 letra maiúscula, 1 letra minúscula e 1 número`
    } else{
        spanSenha.innerHTML=``
    } 
    if(confirmFunc != senhaFunc){
        validate = false
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } else {
        spanConfirmarSenha.innerHTML=``
    } 
    
    if (indice_arroba >= 0 && senhaFunc.length >=8 && confirmFunc == senhaFunc && upperValidate == true && lowerValidate == true && numberValidate == true){
        validate = true;
        spanRealizado.innerHTML = `Cadastro Realizado`
        window.location.href = "./Login.html"
    }
}

function entrar(){
    var email = inputEmail.value;
    var senha = inputSenha.value;

    if(email == '@empresa' && senha == 'empresa123' || (email == '@func' && senha == 'func123')){
        spanEntrar.style.color = "#00FF00";
        spanEntrar.innerHTML=`Login realizado com sucesso`

    } else {
        document.getElementById("spanEntrar").style.color = "#FF0000";
        spanEntrar.innerHTML=`Email ou Senha incorretos`
    }


}