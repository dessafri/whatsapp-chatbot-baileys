const fs = require('fs');
const path = require('path');

const CACHE_FILE = path.join(__dirname, '..', 'data', 'jid-cache.json');

let jidCache = new Map();
let saveTimer = null;

function ensureCacheDir() {
  const dir = path.dirname(CACHE_FILE);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function serializeCache() {
  const obj = Object.fromEntries(jidCache);
  return JSON.stringify(obj, null, 2);
}

function normalizePhoneDigits(value) {
  if (!value && value !== 0) return '';
  let digits = String(value).replace(/\D/g, '');
  if (!digits) return '';
  if (digits.startsWith('0')) {
    digits = '62' + digits.substring(1);
  }
  return digits;
}

function scheduleCacheSave() {
  if (saveTimer) {
    clearTimeout(saveTimer);
  }
  saveTimer = setTimeout(() => {
    try {
      ensureCacheDir();
      fs.writeFileSync(CACHE_FILE, serializeCache(), 'utf8');
    } catch (error) {
      console.error('Failed to write JID cache file:', error);
    }
  }, 500);
}

function loadJidCache() {
  try {
    const data = fs.readFileSync(CACHE_FILE, 'utf8');
    const parsed = JSON.parse(data);
    jidCache = new Map(Object.entries(parsed));
  } catch (error) {
    if (error.code !== 'ENOENT') {
      console.error('Failed to load JID cache file:', error);
    }
  }
}

function rememberJid(phone, jid) {
  if (!phone || !jid) return;
  const normalizedPhone = normalizePhoneDigits(phone);
  if (!normalizedPhone) return;
  if (!jid.includes('@')) return;

  const current = jidCache.get(normalizedPhone);
  if (current === jid) return;

  jidCache.set(normalizedPhone, jid);
  scheduleCacheSave();
}

function getCachedJid(phone) {
  const normalizedPhone = normalizePhoneDigits(phone);
  if (!normalizedPhone) return null;
  return jidCache.get(normalizedPhone) || null;
}

function normalizeNumber(id) {
  if (!id) return '';
  
  if (typeof id === 'string' && id.includes('@')) {
    return id;
  }

  const normalizedPhone = normalizePhoneDigits(id);
  if (!normalizedPhone) return '';

  const cachedJid = jidCache.get(normalizedPhone);
  if (cachedJid) {
    return cachedJid;
  }

  return normalizedPhone + '@s.whatsapp.net';
}

function getPhoneNumber(jid) {
  if (!jid) return '';

  if (jid.includes('@lid')) {
    const match = jid.match(/(\d+):/);
    const raw = match ? match[1] : jid.split('@')[0];
    const normalized = normalizePhoneDigits(raw);
    return normalized || raw || '';
  }

  const raw = jid.split('@')[0].split(':')[0];
  const normalized = normalizePhoneDigits(raw);
  return normalized || raw || '';
}

module.exports = {
  normalizeNumber,
  getPhoneNumber,
  rememberJid,
  getCachedJid,
  loadJidCache
};
