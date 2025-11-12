const router = require("express").Router();
const fs = require("fs");

router.get("/qr", async (req, res) => {
  try {
    const qrPath = "./components/last.qr";
    
    if (fs.existsSync(qrPath)) {
      const qr = fs.readFileSync(qrPath, "utf8");
      res.json({
        success: true,
        qr: qr,
        message: "Scan QR Code dengan WhatsApp Anda"
      });
    } else {
      res.json({
        success: false,
        message: "QR Code belum tersedia. Tunggu beberapa saat atau restart aplikasi..."
      });
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router.post("/logout", async (req, res) => {
  try {
    if (!global.sock) {
      return res.status(400).json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    await global.sock.logout();
    
    // Hapus folder auth
    const authFolder = './baileys_auth_info';
    if (fs.existsSync(authFolder)) {
      fs.rmSync(authFolder, { recursive: true, force: true });
    }
    
    res.json({
      success: true,
      message: "Logout berhasil. Restart aplikasi untuk login kembali."
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

router.get("/info", async (req, res) => {
  try {
    if (!global.sock || !global.authed) {
      return res.json({
        success: false,
        message: "WhatsApp belum terkoneksi"
      });
    }

    res.json({
      success: true,
      user: {
        id: global.sock.user.id,
        name: global.sock.user.name,
        phoneNumber: global.sock.user.id.split(':')[0]
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

module.exports = router;