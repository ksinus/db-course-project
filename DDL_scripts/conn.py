import psycopg2

try:
	conn = psycopg2.connect(
	   database="postgres",
	   user='mipt',
	   password='mipt',
	   host='localhost',
	   port= '5050'
	)
	print("-----------------CONNECTION IS ESTABLISHED-----------------")
except:
	print("-----------------CONNECTION IS UNREACHABLE-----------------")

conn.autocommit = True
cursor = conn.cursor()

cursor.execute('''
INSERT INTO Users(user_nm, user_last_n, user_birth_dt, mobile_phone_no, card_no, email_no)
VALUES  ('Богатырёв', 'Ефим', '1985-07-11', '79775535957', '5368694461418566', 'efim1654@ya.ru'),
		('Степан', 'Феликсов', '1979-09-13', '79198389929', '4138335134907793','nastas81@yandex.ru'),
		('Игнатий', 'Максимов', '1989-02-06', '79191189929', '5463462965968461' ,'galina@gmail.com'),
		('Павел', 'Мащенко', '1999-01-18', '79198889129', '4181439027737174','lyu.zubok@yandex.ru'),
		('Захар', 'Лютенков', '2001-02-04', '791987689929', '5863723568633609','anto5036@outlook.com'),
		('Тимофей', 'Тучков', '1966-07-03', '79198876929', '5645600643081207','viktor974@gmail.com'),
		('Вероника', 'Кошкова', '1979-09-09', '79198889729', '4122218586582436','vero9043@outlook.com'),
		('Кирилл', 'Луков', '1970-07-17', '79198887729', '4715107076485772','alisa.cherna@mail.ru'),
		('Кузьма', 'Горяинов', '1966-04-09', '79198889629', '5257190538302219', 'marina88@outlook.com')
''')

print("-----------------DATA IS INSERTED-----------------")
print("-----------------DATA FROM USERS-----------------")

cursor.execute('''SELECT * FROM Users;''')

fetch = cursor.fetchall()
print(fetch)

conn.commit()
cursor.close()
conn.close()

print("-----------------CONNECTION IS CLOSED-----------------")
