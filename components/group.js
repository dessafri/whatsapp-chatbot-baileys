// FILE: components/group.js
// ============================================
const router = require("express").Router();

router.get("/list", async (req, res) => {
  try {
    if (!global.sock || !global.authed) {
      return res.status(400).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    const groups = [];
    
    if (global.store && global.store.chats) {
      // Jika menggunakan Map
      if (global.store.chats instanceof Map) {
        for (const [id, chat] of global.store.chats) {
          if (id.includes('@g.us')) {
            groups.push({
              id: id,
              name: chat.name || 'Unknown Group',
              participantsCount: chat.participants?.length || 0
            });
          }
        }
      } else {
        // Jika menggunakan object biasa
        const chats = global.store.chats.all ? global.store.chats.all() : [];
        for (const chat of chats) {
          if (chat.id.includes('@g.us')) {
            groups.push({
              id: chat.id,
              name: chat.name || 'Unknown Group',
              participantsCount: chat.participants?.length || 0
            });
          }
        }
      }
    }
    
    res.json({
      success: true,
      count: groups.length,
      groups: groups
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router.post("/send", async (req, res) => {
  try {
    const { groupId, message } = req.body;
    
    if (!groupId || !message) {
      return res.status(400).json({
        success: false,
        message: "Parameter 'groupId' dan 'message' harus diisi"
      });
    }

    if (!global.sock || !global.authed) {
      return res.status(400).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    await global.sock.sendMessage(groupId, { text: message });
    
    res.json({
      success: true,
      message: "Pesan berhasil dikirim ke group",
      groupId: groupId
    });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

module.exports = router;
