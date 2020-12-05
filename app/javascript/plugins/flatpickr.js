import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

flatpickr("#start-date", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#end-date"})]
});