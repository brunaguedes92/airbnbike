import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

document.addEventListener('turbolinks:load', ()=>{
  initSweetalert('#sweet-alert-bike-success', {
    title: "Success!",
    text: "Your bike has been successfully published.",
    icon: "success"
  });
})

export { initSweetalert };