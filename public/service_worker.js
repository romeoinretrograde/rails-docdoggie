console.log("hi from the service worker");

self.addEventListener("push", (event) => {
  let title = (event.data && event.data.text()) || "Yay a message";
  let body = "Woof, woof! Go take your meds!";
  let tag = "push-simple-demo-notification-tag";
  let icon = "/assets/doggies/cream-docdoggie-09b8b4a5c0fb906ec7d7640446ab3e8379e0b191792392bd5f4621b092d295cf.png";
  console.log(event);

  event.waitUntil(
    self.registration.showNotification(title, { body, icon, tag })
  );
});
