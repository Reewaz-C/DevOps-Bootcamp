const express = require("express");

const app = express();
const PORT = 3000;

// Read app version from environment variable
const APP_VERSION = process.env.APP_VERSION || "unknown";

// Log version in terminal
console.log(`🚀 Application started - Version: ${APP_VERSION}`);

// Root route serves dynamic HTML
app.get("/", (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
    <head>
      <title>Node.js Web App</title>
      <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; text-align: center; padding-top: 80px; }
        h1 { color: #222; }
        p { font-size: 18px; color: #444; }
        button { padding: 12px 22px; border: none; background: #0052cc; color: white; border-radius: 6px; font-size: 16px; cursor: pointer; margin-top: 20px; }
        button:hover { background: #003f99; }
      </style>
    </head>
    <body>
      <h1>Welcome to My Node.js Web App</h1>
      <p>App Version: ${APP_VERSION}</p>
      <button onclick="alert('Hello from Node.js Web App!')">Click Me</button>
    </body>
    </html>
  `);
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

