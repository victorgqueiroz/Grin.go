var container = document.getElementsByClassName('my-profile-button');
var element = document.getElementById('myElement');

container.addEventListener('mouseover', function() {
  element.style.display = 'block'; // Torna o elemento visível
  element.style.left = '200px'; // Move o elemento para o lado
});

container.addEventListener('mouseout', function() {
  element.style.left = '0'; // Move o elemento de volta para a posição inicial
  element.style.display = 'none'; // Oculta o elemento novamente
});
