function suma(a, b) {
    alert(a + b);
}
function mostrarvalor() {
    alert(campo_text.value);
}
var memo = 'r';
function moverBoton() {
    if(memo=='r'){
        boton.className = "ui button left floated";
        memo='l';
    }else{
        if(memo=='l'){
            boton.className = "ui button right floated";
            memo='k';
        }else{
            if(memo=='k'){
                boton.className = "ui button center floated";
                memo='r';
            }
        }
    }
    
}