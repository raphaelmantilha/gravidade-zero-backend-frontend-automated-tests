from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'),bcrypt.gensalt(8))
    return hashed

def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'wrong_email':{
            'name': 'Pedro',
            'lastname': 'De Lara',
            'email': 'pedro_dl*hotmail.com',
            'password': 'abc123'
        },
        'login':{
            'name': 'Raphael',
            'lastname': 'Mantilha',
            'email': 'raphael.mantilha@gmail.com',
            'password': 'pwd123'
        },
        'be_geek':{
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Formato seu computador, instalo o sistema operacional (Linux e Windows) e todos as ferramentas que você gosta de usar',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'attempt_be_geek':{
            'name': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Esta descrição deve ter mais que 255 caracteres. Por este motivo, estou escrevendo sem parar porque preciso atingir esta quantidade de caracteres. Este é um teste do curso "Gravidade Zero" da QA Ninja e eu estou testando o formulário de cadastro de Geeks. 123456789',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        },
       
    }

    return data[target]