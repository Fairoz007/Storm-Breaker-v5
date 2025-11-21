#!/bin/bash

# Storm Breaker - Virtual Environment Installation Script
# This script creates a virtual environment to avoid pip externally-managed-environment errors

GRY='\033[1;30m'
RED='\033[0;31m'
BLU='\033[0;34m'
GRN='\033[0;32m'
PUL='\033[0;35m'
YLW='\033[1;33m'
RST='\033[0m'

echo -e "${GRN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║          Storm Breaker - Venv Installation            ║
║            Virtual Environment Setup                  ║
╚═══════════════════════════════════════════════════════╝
EOF
echo -e "${RST}"

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Python 3 is not installed!${RST}"
    echo -e "${YLW}Please install Python 3 first:${RST}"
    echo -e "  Debian/Ubuntu/Kali: ${GRN}sudo apt install python3 python3-venv python3-pip${RST}"
    echo -e "  Arch/Manjaro: ${GRN}sudo pacman -S python python-pip${RST}"
    echo -e "  Fedora/RHEL: ${GRN}sudo dnf install python3 python3-pip${RST}"
    exit 1
fi

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo -e "${RED}PHP is not installed!${RST}"
    echo -e "${YLW}Please install PHP first:${RST}"
    echo -e "  Debian/Ubuntu/Kali: ${GRN}sudo apt install php${RST}"
    echo -e "  Arch/Manjaro: ${GRN}sudo pacman -S php${RST}"
    echo -e "  Fedora/RHEL: ${GRN}sudo dnf install php${RST}"
    exit 1
fi

echo -e "${BLU}Creating virtual environment...${RST}"

# Check if python3-venv is available
if ! python3 -m venv --help &> /dev/null; then
    echo -e "${YLW}python3-venv module not found. Installing...${RST}"
    if command -v apt &> /dev/null; then
        sudo apt install python3-venv -y
    elif command -v pacman &> /dev/null; then
        sudo pacman -S python -y
    elif command -v dnf &> /dev/null; then
        sudo dnf install python3 -y
    else
        echo -e "${RED}Could not install python3-venv automatically.${RST}"
        echo -e "${YLW}Please install it manually and run this script again.${RST}"
        exit 1
    fi
fi

# Create virtual environment
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to create virtual environment!${RST}"
    exit 1
fi

echo -e "${GRN}Virtual environment created successfully!${RST}"

# Activate virtual environment
echo -e "${BLU}Activating virtual environment...${RST}"
source venv/bin/activate

# Upgrade pip
echo -e "${BLU}Upgrading pip...${RST}"
pip install --upgrade pip

# Install requirements
echo -e "${BLU}Installing Python dependencies...${RST}"
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install dependencies!${RST}"
    deactivate
    exit 1
fi

echo -e "${GRN}Dependencies installed successfully!${RST}"

# Create activation script
echo -e "${BLU}Creating activation script...${RST}"
cat > run.sh << 'RUNSCRIPT'
#!/bin/bash

# Storm Breaker - Run Script (with Virtual Environment)

GRN='\033[0;32m'
BLU='\033[0;34m'
RST='\033[0m'

echo -e "${BLU}Activating virtual environment...${RST}"
source venv/bin/activate

echo -e "${GRN}Starting Storm Breaker...${RST}"
python3 st.py "$@"

deactivate
RUNSCRIPT

chmod +x run.sh

# Deactivate virtual environment
deactivate

echo -e "${GRN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║          Installation Complete!                       ║
╚═══════════════════════════════════════════════════════╝
EOF
echo -e "${RST}"

echo -e "${YLW}To run Storm Breaker, use one of these methods:${RST}"
echo ""
echo -e "${GRN}Method 1 (Recommended):${RST}"
echo -e "  ${BLU}./run.sh${RST}"
echo ""
echo -e "${GRN}Method 2 (Manual):${RST}"
echo -e "  ${BLU}source venv/bin/activate${RST}"
echo -e "  ${BLU}python3 st.py${RST}"
echo -e "  ${BLU}deactivate${RST}  (when done)"
echo ""

exit 0
