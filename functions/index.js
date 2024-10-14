// const functions = require("firebase-functions");
// const sgMail = require('@sendgrid/mail');

// // حط الـ API Key اللي جبتها من SendGrid هنا
// sgMail.setApiKey('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');

// exports.sendEmail = functions.https.onCall((data, context) => {
//   const msg = {
//     to: data.email, // الإيميل اللي هتبعت له
//     from: 'your-email@example.com', // الإيميل اللي هتبعت منه
//     subject: 'Your OTP Code',
//     text: `Your verification code is ${data.code}`, // الرسالة النصية
//     html: `<strong>Your verification code is ${data.code}</strong>`, // الرسالة كـ HTML
//   };

//   return sgMail
//     .send(msg)
//     .then(() => {
//       return { success: true };
//     })
//     .catch((error) => {
//       return { success: false, error: error.toString() };
//     });
// });
