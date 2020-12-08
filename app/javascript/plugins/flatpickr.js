import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

document.addEventListener('turbolinks:load', () => {
  const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)
  console.log(unvailableDates)
  flatpickr("#start_date", {
    minDate: 'today',
    disable: unvailableDates,
    altInput: true,
    plugins: [new rangePlugin({ input: "#end_date"})]
  });
});