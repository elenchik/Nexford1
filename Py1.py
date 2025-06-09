import random

# generating 400 workers dynamically
workers = []
genders = ['Male', 'Female']

for i in range(1, 401):
    worker = {
        'id': i,
        'name': f'Worker_{i}',
        'gender': random.choice(genders),
        'salary': random.randint(5000, 35000)
    }
    workers.append(worker)

# generating payment slips
for worker in workers:
    try:
        level = "N/A"
        # conditions
        if 10000 < worker['salary'] < 20000:
            level = "A1"
        if 7500 < worker['salary'] < 30000 and worker['gender'] == 'Female':
            level = "A5-F"

        print(f"Payment Slip: ID {worker['id']} | Name: {worker['name']} | "
              f"Gender: {worker['gender']} | Salary: ${worker['salary']} | Level: {level}")
# exception handling
    except KeyError as e:
        print(f"Missing field in worker data: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")
