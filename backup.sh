#! /bin/bash

# This is just a multi line comment
<< readme
 
 This is a backup script with 5 days rotation

 Usage: ./backup.sh <path to your source> <path to backup folder>

readme

source_dir=$2
timestemp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$1

# Logging
LOG_FILE="$backup_dir/back.log"
log() {
	msg="$timestemp - $1"
	echo "$msg" | tee -a "$LOG_FILE"
}

# A function to create backups
function create_backups {
	
<<description

1. -czf means create zip file 
2. Backup directory with timestemp
3. -C source_dir . this means to avoid storing absolute paths.
After that output should look like this:
./file1.txt
./file2.txt
./backup.sh

else if you dont add -C source_dir . just only source_dir then output look like:
./home/kali/project/file1.txt
./home/kali/project/file2.txt
./home/kali/project/backup.sh

when your extracting tar -xzf hello.tar.gz it will create /home/kali/projects
that can overwrite files, create unwanted directories

description
	log "Backup started"
 
	echo "Generating backups please wait..."
	echo "This is backup directory: $backup_dir"
       
        if [ ! -d "$backup_dir" ]; then
		echo "Backup directory does not exist. Creating it..."
		mkdir -p $backup_dir
		log "Created backup directory: $backup_dir"
	fi	

 	tar -czf "${backup_dir}/backup_${timestemp}.tar.gz" -C "${source_dir}" .

	if [ $? -eq 0 ]; then
		echo "Backups has been created Succssfully..."
		log "Backup created successfully: backup_${timestemp}.tar.gz"
	else
		print_usage
		log "ERROR: Backup failed!"
	fi	
}

# A function to print usage of this bash file
function print_usage {
	echo "Usage: $0 ./backup.sh <backup_dir> <source_dir>"
	echo "Example: $0 /home/kali/backup /home/kali/projects"
}

# If argument equal to zero then print_usage else create_backups
log "Script execution started!"
if [ $# -eq 0 ]; then
	
	print_usage

else
	create_backups

fi


# Function for performing rotation
# If the directory has more then 5 files then delete them
echo "Entering the rotation..."
function performing_rotation {
	log "Started rotation (more than 5 files will be deleted)"

	backup_lists=($(ls -t "${backup_dir}/backup_"*.tar.gz 2>/dev/null))
	# echo "${backup_lists[@]}"
	if [ ${#backup_lists[@]} -gt 5 ]; then
		echo "Perform rotation for 5 days"
		for ((i=5; i<"${#backup_lists[@]}"; i++));
		do
			log "Deleting old backup files: ${backup_lists[$i]}"
			rm -f "${backup_lists[$i]}"
		done
	fi
	
	log "Rotation completed"

}

# Rotation function call
performing_rotation

log "Script execution finished!"
