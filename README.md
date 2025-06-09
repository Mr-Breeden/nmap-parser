# Nmap Greppable Parser

A Bash script to extract and format open ports from **greppable Nmap scan results**.

## 📌 Features
- Parses Nmap greppable (`-oG`) output.
- Extracts **IP addresses** and their **open ports**.
- Formats the output as:  
  ```
  <IP_ADDRESS>    <PORT1>,<PORT2>,<PORT3>
  ```
- Efficient processing using `grep` and `awk`.

## 🌜 Usage
```bash
./parser.sh <nmap_results_file>
```

### Example:
#### **Input (Nmap Greppable Format)**
```
Host: 192.168.1.1 ()    Ports: 22/open/tcp//ssh///, 80/open/tcp//http///, 443/open/tcp//https///
Host: 192.168.1.2 ()    Ports: 3306/open/tcp//mysql///
```

#### **Output**
```
192.168.1.1    22,80,443
192.168.1.2    3306
```

## 🛠️ Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nmap-parser.git
   cd nmap-parser
   ```
2. Make the script executable:
   ```bash
   chmod +x parser.sh
   ```

## 🖥️ Generating Nmap Greppable Output
To use this script, ensure you scan with the `-oG` option:
```bash
nmap -p- -oG nmap_results.txt 192.168.1.0/24
```

## 🔍 How It Works
- Extracts lines containing `"Ports"` using `grep`.
- Uses `awk` to:
  - Print the **IP address** (second field).
  - Extract and format **open ports** in a comma-separated list.


## 🤝 Contributing
Feel free to submit **issues** or **pull requests** to improve this script.

---

💡 *Happy scanning! Stay ethical!* 🚀

