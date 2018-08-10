import flatpickr from 'flatpickr';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import 'flatpickr/dist/flatpickr.min.css';
flatpickr("#search-start-date", {
  plugins: [new rangePlugin({ input: "#secondRangeInput"})]
});

flatpickr(".datepickr", {mode: 'range', minDate: "today",
  plugins: [new rangePlugin({ input: "#book-a-boat-end"})],
  enable: [
    function(date) {
      let status = true
      const dates_array = JSON.parse(document.getElementById('book-a-boat-start').dataset.bookingdates);
      console.log(dates_array);
      console.log(date);
      dates_array.forEach((dates) => {
       if (date > new Date(dates[0]) && date < new Date(dates[1])) {
          status = false
       }
       });
      console.log(status);
      return status;
    }
]});
