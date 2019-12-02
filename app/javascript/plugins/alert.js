import Swal from 'sweetalert2';

const initAlert = () => {

  const shareButton = document.getElementById('share-plan');

  if (shareButton) {
    shareButton.addEventListener('click', (event) => {
      swal("Noice!", "Your invitation has been sent!", "success");
    });
  }
};


export { initAlert };
