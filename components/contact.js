const router2 = require("express").Router();

router2.get("/list", async (req, res) => {
  try {
    if (!global.sock || !global.authed) {
      return res.status(400).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    const contacts = [];
    
    if (global.store && global.store.contacts) {
      for (const [jid, contact] of Object.entries(global.store.contacts)) {
        if (jid.includes('@s.whatsapp.net')) {
          contacts.push({
            jid: jid,
            name: contact.name || contact.notify || contact.verifiedName || 'Unknown',
            number: jid.split('@')[0]
          });
        }
      }
    }
    
    res.json({
      success: true,
      count: contacts.length,
      contacts: contacts
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router2.get("/check/:number", async (req, res) => {
  try {
    if (!global.sock || !global.authed) {
      return res.status(400).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    let number = req.params.number.replace(/\D/g, '');
    if (number.startsWith('0')) {
      number = '62' + number.substring(1);
    }

    const [result] = await global.sock.onWhatsApp(number);
    
    res.json({
      success: true,
      exists: result ? true : false,
      jid: result?.jid || null
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

module.exports = router2;