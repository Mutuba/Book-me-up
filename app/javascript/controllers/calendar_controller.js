// app/javascript/controllers/calendar_controller.js

import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";

document.addEventListener("turbolinks:load", function () {
  var calendarEl = document.getElementById("calendar");

  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],
    defaultView: "dayGridWeek", // Display a week by default
    header: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,dayGridWeek,dayGridDay", // Add dayGridDay option
    },
    businessHours: {
      dow: [1, 2, 3, 4, 5], // Monday - Friday
      start: "12:00", // 12:00 PM
      end: "23:00", // 11:00 PM
    },
  });

  calendar.render();
});
