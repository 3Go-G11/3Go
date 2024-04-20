
function cadastrarempresa(){
    var razao = inputRazao.value;
    var cnpj = inputCNPJ.value;
    var nomeRepresentante = inputRepresentante.value;
    var emailEmpresa = inputEmail.value;
    var telefoneEmpresa = inputTelefone.value;
    var senhaEmpresa = inputSenha.value;
    var confirmEmpresa = inputConfirmarSenha.value;
    var indice_arroba = emailEmpresa.indexOf('@')
   
    if(indice_arroba >= 0 && senhaEmpresa.length >= 8 && confirmEmpresa == senhaEmpresa){
        spanEmail.innerHTML = ``;
        spanSenha.innerHTML = ``;
        spanConfirmarSenha.innerHTML = ``;
        spanRealizado.innerHTML = `Cadastro Realizado`
    } if(indice_arroba < 0){
        spanEmail.innerHTML=`Insira um email valido`
    } if(senhaEmpresa.length < 8){
        spanSenha.innerHTML=`Senha fraca, insira no minímo de 8 digitos`
    } if(confirmEmpresa != senhaEmpresa){
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
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

function cadastrarfunc(){

    var nomeFunc = inputNomeFunc.value;
    var emailFunc = inputEmailFunc.value;
    var senhaFunc = inputSenhaFunc.value;
    var confirmFunc = inputConfirmFunc.value;
    var indice_arroba = emailFunc.indexOf('@');


    if(indice_arroba >= 0 && senhaFunc.length >= 8 && confirmFunc == senhaFunc){
        spanEmail.innerHTML = ``;
        spanSenha.innerHTML = ``;
        spanConfirmarSenha.innerHTML = ``;
        spanRealizado.innerHTML = `Cadastro Realizado`
    } if(indice_arroba < 0){
        spanEmail.innerHTML=`Insira um email valido`
    } if(senhaFunc.length < 8){
        spanSenha.innerHTML=`Senha fraca, insira no minímo de 8 digitos`
    } if(confirmFunc != senhaFunc){
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } 
}
