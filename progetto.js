function gestoreEnter(){
    try {
       this.style.textDecoration = "underline";
    } catch (e){
        alert("gestoreEnter" + e);
    }
}

function gestoreOut(){
    try {
        this.style.textDecoration = "none";
    } catch (e){
        alert("gestoreOut" + e);
    }
}

function gestoreClickAvanti () {
    try{
        var nodoDesc;
        if(indiceFoto==0){
            nodoDesc = document.createTextNode("Retro");
        }
        else {
            nodoDesc = document.createTextNode("Fronte");
        }
        nodoDescImg.replaceChild(nodoDesc, nodoDescImg.firstChild)
        cambiaFoto(+1);
    }catch(e){
        alert("gestoreClickAvanti"+e);
    }
}

function gestoreClickIndietro () {
    try{
        var nodoDesc;
        if(indiceFoto==0){
            nodoDesc = document.createTextNode("Retro");
        }
        else {
            nodoDesc = document.createTextNode("Fronte");
        }
        nodoDescImg.replaceChild(nodoDesc, nodoDescImg.firstChild)
        cambiaFoto(-1);
    }catch(e){
        alert("gestoreClickIndietro"+e);
    }
}

function cambiaFoto (x) {
    indiceFoto += x;
    if (indiceFoto == NUMERO_FOTO){
        indiceFoto = 0;
    }
    if (indiceFoto < 0){
        indiceFoto = NUMERO_FOTO -1;
    }
    nodoFoto.setAttribute("src", galleria[indiceFoto]);
}

const NUMERO_FOTO = 2;
var nodoLink1;
var nodoLink2;
var galleria;
var indiceFoto;
var nodoAvanti;
var nodoIndietro;
var nodoStartStop;
var nodoFoto;
var nodoDescImg;

function gestoreLoad() {
    try{
        nodoLink1 = document.getElementById("link1");
        nodoLink2 = document.getElementById("link2");
        nodoAvanti = document.getElementById("avanti");
        nodoIndietro = document.getElementById("indietro");
        nodoFoto = document.getElementById("foto");
        nodoDescImg = document.getElementById("descImg");
        nodoLink1.onmouseenter = gestoreEnter;
        nodoLink1.onmouseout = gestoreOut;
        nodoLink2.onmouseenter = gestoreEnter;
        nodoLink2.onmouseout = gestoreOut;
        nodoAvanti.onclick = gestoreClickAvanti;
        nodoIndietro.onclick = gestoreClickIndietro;
        var nodoDesc = document.createTextNode("Fronte");
        nodoDescImg.appendChild(nodoDesc);
        galleria = [];
        for (var i = 0; i < NUMERO_FOTO; i++) {
            var nomeFoto = "foto" + i + ".jpg";
            galleria.push(nomeFoto);
        }
        indiceFoto = 0;
        cambiaFoto(0);
    } catch(e) {
        alert("gestoreLoad"+e);    
    }
}

window.onload=gestoreLoad;