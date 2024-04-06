var razao = '' 
var cnpj = ''
var representante = ''
var email = ''
var telefone = ''
var senha = ''
var confimarSenha = ''
var indice_arroba = '' 

function cadastrar(){
    razao = inputRazao.value;
    cnpj = inputCNPJ.value;
    representante = inputRepresentante.value;
    email = inputEmail.value;
    telefone = inputTelefone.value;
    senha = inputSenha.value;
    confimarSenha = inputConfirmarSenha.value;
    indice_arroba = email.indexOf('@')
   
    if(indice_arroba < 0){
        document.getElementById("spanEmail").style.display = "block";
        spanEmail.innerHTML=`Insira um email valido`
    } else {
        document.getElementById("spanEmail").style.display = "none"; 
    }

    if(senha.length < 8){
        document.getElementById("spanSenha").style.display = "block";
        spanSenha.innerHTML=`Senha fraca, insira no minímo de 8 digitos`
    } else {
        document.getElementById("spanSenha").style.display = "none"; 
    }

    if(confimarSenha != senha){
        document.getElementById("spanConfirmarSenha").style.display = "block";
        spanConfirmarSenha.innerHTML=`A confirmação de senha não corresponde`
    } else {
        document.getElementById("spanConfirmarSenha").style.display = "none"; 
    }
}

function entrar(){
    email = inputEmail.value;
    senha = inputSenha.value;
    var emailteste = '@teste'
    var senhateste = 'Teste12345'

    if(email == emailteste && senha == senhateste){
        document.getElementById("spanEntrar").style.color = "#00FF00";
        spanEntrar.innerHTML=`Login realizado com sucesso`
    } else {
        spanEntrar.innerHTML=`Email ou Senha incorretos`
    }
}