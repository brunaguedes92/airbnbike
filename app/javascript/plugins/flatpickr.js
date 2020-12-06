import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

document.addEventListener('turbolinks:load', () => {
  flatpickr("#start_date", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#end_date"})]
  });
});