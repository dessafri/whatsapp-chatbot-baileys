const router = require("express").Router();
const { normalizeNumber } = require("../helpers/jid");

router.post("/send", async (req, res) => {
  try {
    const { to, message } = req.body;
    
    if (!to || !message) {
      return res.status(400).json({
        success: false,
        message: "Parameter 'to' dan 'message' harus diisi"
      });
    }

    if (!global.sock) {
      return res.status(500).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    const normalizedNumber = normalizeNumber(to);
    await global.sock.sendMessage(normalizedNumber, { text: message });
    
    res.json({
      success: true,
      message: "Pesan berhasil dikirim",
      to: normalizedNumber
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router.post("/send-media", async (req, res) => {
  try {
    const { to, imageUrl, caption } = req.body;
    
    if (!to || !imageUrl) {
      return res.status(400).json({
        success: false,
        message: "Parameter 'to' dan 'imageUrl' harus diisi"
      });
    }

    if (!global.sock) {
      return res.status(500).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    const normalizedNumber = normalizeNumber(to);
    
    // Download image
    const axios = require('axios');
    const response = await axios.get(imageUrl, { responseType: 'arraybuffer' });
    const buffer = Buffer.from(response.data, 'binary');
    
    await global.sock.sendMessage(normalizedNumber, {
      image: buffer,
      caption: caption || ''
    });
    
    res.json({
      success: true,
      message: "Media berhasil dikirim",
      to: normalizedNumber
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router.get("/status", (req, res) => {
  res.json({
    success: true,
    authenticated: global.authed,
    ready: global.sock ? true : false,
    phoneNumber: global.sock?.user?.id || null
  });
});

module.exports = router;
