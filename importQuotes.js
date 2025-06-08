const admin = require("firebase-admin");
const fs = require("fs");

const serviceAccount = require("./serviceAccountKey.json"); // المفتاح الذي حمّلتيه من Firebase Console

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

const data = JSON.parse(fs.readFileSync("dailyQuotes.json", "utf8"));
const quotes = data.dailyQuotes;

(async () => {
  for (const [date, content] of Object.entries(quotes)) {
    await db.collection("dailyQuotes").doc(date).set(content);
    console.log(`✅ Added quote for ${date}`);
  }
})();
