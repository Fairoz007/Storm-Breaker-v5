# Storm Breaker - Installation Guide

## 🔧 Installation Methods

### Method 1: Virtual Environment (Recommended for Kali/Modern Linux)

If you're getting `externally-managed-environment` error, use this method:

```bash
chmod +x install-venv.sh
./install-venv.sh
```

**Run Storm Breaker:**
```bash
./run.sh
```

---

### Method 2: Traditional Installation

For older systems or if you want system-wide installation:

```bash
chmod +x install.sh
sudo ./install.sh
```

**Run Storm Breaker:**
```bash
python3 st.py
```

---

### Method 3: Manual Installation

#### Step 1: Install Dependencies

**Debian/Ubuntu/Kali:**
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv php -y
```

**Arch/Manjaro:**
```bash
sudo pacman -S python python-pip php
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install python3 python3-pip php -y
```

#### Step 2: Create Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate
```

#### Step 3: Install Python Packages

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

#### Step 4: Run Storm Breaker

```bash
python3 st.py
```

**When done, deactivate virtual environment:**
```bash
deactivate
```

---

## 🐛 Troubleshooting

### Error: `externally-managed-environment`

**Solution 1 (Recommended):** Use virtual environment installation
```bash
./install-venv.sh
```

**Solution 2:** Use pipx (for Kali Linux)
```bash
sudo apt install pipx
pipx install -r requirements.txt
```

**Solution 3:** Force installation (Not Recommended)
```bash
pip install -r requirements.txt --break-system-packages
```

---

### Error: `python3-venv not found`

**Debian/Ubuntu/Kali:**
```bash
sudo apt install python3-venv
```

**Arch/Manjaro:**
```bash
sudo pacman -S python
```

---

### Error: `Permission denied`

Make scripts executable:
```bash
chmod +x install-venv.sh install.sh run.sh st.py
```

---

### Error: `PHP not found`

**Debian/Ubuntu/Kali:**
```bash
sudo apt install php php-cli
```

**Arch/Manjaro:**
```bash
sudo pacman -S php
```

**Fedora/RHEL:**
```bash
sudo dnf install php php-cli
```

---

## 📦 Dependencies

### System Requirements:
- Python 3.8 or higher
- PHP 7.4 or higher
- Internet connection (for tunneling)

### Python Packages:
- `requests` - HTTP requests
- `colorama` - Colored terminal output
- `psutil` - System monitoring

---

## 🚀 Quick Start Guide

### First Time Setup:

1. **Clone or extract Storm Breaker**
   ```bash
   cd Storm-Breaker
   ```

2. **Run installation (choose one):**
   
   Virtual environment (recommended):
   ```bash
   chmod +x install-venv.sh
   ./install-venv.sh
   ```
   
   OR traditional:
   ```bash
   chmod +x install.sh
   sudo ./install.sh
   ```

3. **Start Storm Breaker:**
   
   With virtual environment:
   ```bash
   ./run.sh
   ```
   
   OR traditional:
   ```bash
   python3 st.py
   ```

4. **Access admin panel:**
   - Open browser: `http://localhost:2525`
   - Login with default credentials (check Settings.json)

---

## 📋 Post-Installation

### Update Storm Breaker:
```bash
git pull origin main
source venv/bin/activate  # if using venv
pip install -r requirements.txt --upgrade
```

### Check Installation:
```bash
python3 --version  # Should be 3.8+
php --version      # Should be 7.4+
pip list           # Check installed packages
```

---

## 💡 Platform-Specific Notes

### Kali Linux:
- **Always use virtual environment** due to PEP 668 restrictions
- Install venv: `sudo apt install python3-venv`
- Use: `./install-venv.sh` and `./run.sh`

### Arch Linux:
- Virtual environment is optional but recommended
- Python venv included by default

### Ubuntu/Debian:
- Install venv package: `sudo apt install python3-venv`
- Both installation methods work

### Termux (Android):
```bash
pkg update
pkg install python php
pip install -r requirements.txt
python st.py
```

---

## 🔐 Security Notes

- Run as regular user (not root) when possible
- Virtual environment isolates packages from system
- Never use `--break-system-packages` unless necessary
- Keep Python and PHP updated

---

## 📞 Support

If you encounter issues:

1. Check this guide first
2. Read error messages carefully
3. Try virtual environment installation
4. Check Python/PHP versions
5. Verify all dependencies installed

---

## 🎯 Recommended Setup

```bash
# One-time setup
chmod +x install-venv.sh
./install-venv.sh

# Every time you want to run
./run.sh
```

This is the cleanest and safest method! ✨
