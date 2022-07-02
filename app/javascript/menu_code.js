function makeScrollable() {
  const body = document.querySelector('body');
  body.classList.remove('makeNotScrollable');
  body.classList.add('makeScrollable');
}

function makeNotScrollable() {
  const body = document.querySelector('body');
  body.classList.remove('makeScrollable');
  body.classList.add('makeNotScrollable');
}

function closeMenu() {
  const menu = document.querySelector('.menu-container');
  menu.classList.remove('visible');
  menu.classList.add('invisible');
  makeScrollable();
}

document.querySelector('.hamburger-button').addEventListener('click', () => {
  const menu = document.querySelector('.menu-container');
  menu.classList.remove('invisible');
  menu.classList.add('visible');
  makeNotScrollable();
});

document.querySelector('#close-btn').addEventListener('click', () => {
  closeMenu();
});
