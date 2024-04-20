
function cadastrar(){
    var razao = inputRazao.value;
    var cnpj = inputCNPJ.value;
    var nomeRepresentante = inputRepresentante.value;
    var emailEmpresa = inputEmail.value;
    var telefoneEmpresa = inputTelefone.value;
    var senhaEmpresa = inputSenha.value;
    var confirmEmpresa = inputConfirmarSenha.value;
    var indice_arroba = email.indexOf('@')
   
    if(indice_arroba < 0){
        document.getElementById("spanEmail").style.display = "block";
        spanEmail.innerHTML=`Insira um email valido`
    } else {
        document.getElementById("spanEmail").style.display = "none"; 
    }

    if(senhaEmpresa.length < 8){
        document.getElementById("spanSenha").style.display = "block";
        spanSenha.innerHTML=`Senha fraca, insira no minímo de 8 digitos`
    } else {
        document.getElementById("spanSenha").style.display = "none"; 
    }

    if(confirmEmpresa != senhaEmpresa){
        document.getElementById("spanConfirmarSenha").style.display = "block";
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } else {
        document.getElementById("spanConfirmarSenha").style.display = "none"; 
    }

    if(indice_arroba > 0 && senhaEmpresa.length >= 8 && confirmEmpresa == senhaEmpresa){
        document.getElementById("spanRealizado").style.color = "#00FF00"
        spanRealizado.innerHTML= `Cadastro Realizado com sucesso`
    }
}

function spanEntrar(){
    var email = inputEmail.value;
    var senha = inputSenha.value;

    if(email == '@empresa' && senha == 'empresa123' || (email == '@func' && senha == 'func123')){
        document.getElementById("spanEntrar").style.color = "#00FF00";
        spanEntrar.innerHTML=`Login realizado com sucesso`
    } else {
        document.getElementById("spanEntrar").style.color = "#FF0000";
        spanEntrar.innerHTML=`Email ou Senha incorretos`
    }


}

function cadastrarfunc(){

    var nomeFunc = inputNomeFunc.value;
    var emailFunc = inputEmailFunc.value;
    var senhaFunc = inputSenhaFunc.value;
    var confirmFunc = inputConfirmFunc.value;
    var indice_arroba = emailFunc.indexOf('@');

     if(indice_arroba < 0){
        document.getElementById("spanEmail").style.display = "block";
        spanEmail.innerHTML=`Insira um email valido`
    } else {
        document.getElementById("spanEmail").style.display = "none"; 
    }

    if(senhaFunc.length < 8){
        document.getElementById("spanSenha").style.display = "block";
        spanSenha.innerHTML=`Senha fraca, insira no minímo de 8 digitos`
    } else {
        document.getElementById("spanSenha").style.display = "none"; 
    }

    if(confirmFunc != senhaFunc){
        document.getElementById("spanConfirmarSenha").style.display = "block";
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } else {
        document.getElementById("spanConfirmarSenha").style.display = "none"; 
    }

    if(indice_arroba > 0 && senhaFunc.length >= 8 && confirmFunc == senhaFunc){
        document.getElementById("spanRealizado").style.color = "#00FF00"
        spanRealizado.innerHTML= `Cadastro Realizado com sucesso`
    }
    
}
