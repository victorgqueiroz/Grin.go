// Obtém a referência para a imagem clicada
var imagem = document.querySelector('.imagem');
var imagensModal = document.querySelectorAll('.imagem-modal');

// Obtém a referência para o modal e a imagem ampliada
var modal = document.getElementById('modal');
var modalImagem = document.querySelector('.modal-imagem');

// Adiciona o evento de clique na imagem para abrir o modal
imagem.addEventListener('click', function() {
  modal.style.display = 'block';
  imagensModal.src = this.src;
});

// Adiciona o evento de clique no botão de fechar do modal
document.querySelector('.fechar').addEventListener('click', function() {
  modal.style.display = 'none';
});
