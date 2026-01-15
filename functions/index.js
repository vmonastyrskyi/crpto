const { onRequest } = require("firebase-functions/https");

exports.proxy = onRequest(
  { secrets: ["CMC_PRO_API_KEY"] },
  async (req, res) => {
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    res.set("Access-Control-Allow-Headers", "Content-Type");

    if (req.method === "OPTIONS") {
      res.status(204).send("");
      return;
    }

    const targetUrl = req.query.url;
    if (!targetUrl) {
      res.status(400).send({ error: "Missing url parameter" });
      return;
    }

    try {
      const apiKey = process.env.CMC_PRO_API_KEY;

      const response = await fetch(targetUrl, {
        headers: {
          "X-CMC_PRO_API_KEY": apiKey,
        },
      });
      const data = await response.json();
      res.json(data);
    } catch (err) {
      res.status(500).json({ error: err.toString() });
    }
  }
);