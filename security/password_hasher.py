from werkzeug.security import generate_password_hash
import csv

with open("users.csv", newline="") as infile, open("users_hashed.csv", "w", newline="") as outfile:
    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()
    for row in reader:
        row["password"] = generate_password_hash(row["password"])
        writer.writerow(row)