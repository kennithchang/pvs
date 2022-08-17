import os

import configparser as configparser

path = os.path.dirname(__file__)
conf = configparser.ConfigParser()
conf.read(path + "/config.ini", encoding="utf-8-sig")

START_METHOD = conf.get('main', 'METHOD') if not os.environ.get('METHOD') else os.environ.get('METHOD')

PORT = int(conf.getint(START_METHOD, 'PORT'))


class Config(object):
    ACCOUNT = 'admin'
    PASSWORD = 'xunfeng321'


class ProductionConfig(Config):
    DB = str(conf.get(START_METHOD, 'MONGODB'))
    PORT = int(conf.getint(START_METHOD, 'MONGODB_PORT'))
    DBUSERNAME = str(conf.get(START_METHOD, 'DB_USERNAME'))
    DBPASSWORD = str(conf.get(START_METHOD, 'DB_PASSWORD'))
    DBNAME = str(conf.get(START_METHOD, 'DB_NAME'))
    HOST = str(conf.get(START_METHOD, 'MONGODB')) + ":" + str(conf.getint(START_METHOD, 'MONGODB_PORT')) + "/"