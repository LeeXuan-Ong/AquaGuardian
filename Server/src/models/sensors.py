from flask_sqlalchemy import SQLAlchemy
from .base_model import BaseModel
from flask import jsonify

db = SQLAlchemy()

class SensorData(db.BaseModel):
    
      __tablename__ = "SensorData"
data_id = db.Column(db.Integer, primary_key=True)
name = db.Column(db.String(4096))
user_id = db.Column(db.String(4096))
ph_analog_in = db.Column(db.String(4096))
ph_voltage_in = db.Column(db.String(4096))
tds_analog_in = db.Column(db.String(4096))
tds_voltage_in = db.Column(db.String(4096))
turbidity_analog_in = db.Column(db.String(4096))
turbidity_voltage_in = db.Column(db.String(4096))
timestamp = db.Column(db.String(4096))

    
    
def __init__(self,  data_id=None, ph_analog_in=None,ph_voltage_in=None,tds_analog_in=None,tds_voltage_in=None,turbidity_analog_in=None,turbidity_voltage_in=None,timestamp=None):
        self.data_id = data_id
        self.ph_analog_in =ph_analog_in
        self.ph_voltage_in= ph_voltage_in
        self.tds_analog_in =tds_analog_in
        self.tds_voltage_in= tds_voltage_in
        self.turbidity_analog_in =turbidity_analog_in
        self.turbidity_voltage_in= turbidity_voltage_in
        self.timestamp = timestamp
        
def serialize(self):
        return jsonify({
            'data_id': self.data_id,
            ' ph_analog_in': self.ph_analog_in,
            ' ph_voltage_in': self.ph_voltage_in,
            ' tds_analog_in': self.tds_analog_in,
            ' tds_voltage_in': self.tds_voltage_in,
            ' turbidity_analog_in': self.turbidity_analog_in,
            ' tds_voltage_in': self.turbidity_voltage_in,
            'timestamp': self.timestamp
        })
        
        
def deserialize(self, data):

        if(type(data) is not dict):
        
         self.data_id = data[0]
        self.ph_analog_in = data[1]
        self.ph_voltage_in= data[2]
        self.tds_analog_in = data[3]
        self.tds_voltage_in= data[4]
        self.turbidity_analog_in = data[5]
        self.turbidity_voltage_in=  data[6]
        self.timestamp =  data[7]
        
            
        if(type(data) is dict):
            self.data_id = data[0]
        self.ph_analog_in = data[1]
        self.ph_voltage_in= data[2]
        self.tds_analog_in = data[3]
        self.tds_voltage_in= data[4]
        self.turbidity_analog_in = data[5]
        self.turbidity_voltage_in=  data[6]
        self.timestamp =  data[7]
            
def __eq__(self, other):
        if isinstance(other, SensorData):
            return self.data_id == other.data_id
        return False
    
def __dir__(self):
        return {'data_id':self.data_id,  ' ph_analog_in': self.ph_analog_in,
            ' ph_voltage_in': self.ph_voltage_in,
            ' tds_analog_in': self.tds_analog_in,
            ' tds_voltage_in': self.tds_voltage_in,
            ' turbidity_analog_in': self.turbidity_analog_in,
            ' tds_voltage_in': self.turbidity_voltage_in,
            'timestamp': self.timestamp}