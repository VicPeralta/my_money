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



// Open menu
document.getElementById('hamburger-button').addEventListener('click', () => {
  document.getElementById('menu').classList.toggle('hidden');
});

// Click outside close the menu
document.getElementById('menu').addEventListener('click', (e) => {
  const menuOptions = document.getElementById('menu-options')
  if(menuOptions.contains(e.target)) {
    console.log(e.target)
  } else {
    console.log('outside close the menu');
    const menu = document.getElementById('menu')
    if(!menu.classList.contains('hidden'))
      document.getElementById('menu').classList.toggle('hidden');
  }
});
