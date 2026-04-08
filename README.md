# 🚀 Backup and Log Analyzer

An automated backup system with log monitoring and error detection built using Bash and Python.

---

## 📌 Features

* 🔄 Automated backup creation using shell script
* 📦 Compressed backups (`.tar.gz`)
* ♻️ Backup rotation (keeps limited number of backups)
* 📝 Logging system for all operations
* 🔍 Python-based log analyzer (error detection only)

---

## 🛠️ Tech Stack

* **Bash** – for backup automation
* **Python** – for log analysis
* **Linux** – execution environment

---

## 📂 Project Structure

```
backup-practice/
│── backup.sh          # Backup automation script
│── analyze_logs.py    # Log analyzer (error detection)
│── back.log           # Log file (generated)
```

---

## ⚙️ How It Works

1. `backup.sh`:

   * Creates backups with timestamps
   * Compresses files
   * Logs all actions
   * Deletes old backups (rotation)

2. `analyze_logs.py`:

   * Reads `back.log`
   * Displays only error-related entries
   * Outputs "No errors found" if everything is fine

---

## ▶️ Usage

### Run Backup Script

```bash
bash backup.sh
```

### Analyze Logs

```bash
python3 analyze_logs.py
```

---

## 📊 Example Output

### No Errors

```
No errors found
```

### With Errors

```
2026-03-29-20-07-52 - Backup failed due to permission denied
```

---

## 🔧 Setup

1. Clone the repository:

```bash
git clone https://github.com/your-username/backup-automation.git
cd backup-automation
```

2. Give execution permission:

```bash
chmod +x backup.sh
```

---

## 💡 Future Improvements

* Add email alerts on failure
* Add real-time monitoring
* Store logs in structured format (JSON)
* Dashboard for backup status

