import cv2
import pytesseract
import pyodbc
import sys 
import numpy as np
from asyncio.windows_events import NULL
from datetime import datetime


def Conecta():
        try:
                user='Sofia';
                password='abc';
                host='SOFIA';
                database='lili';
                con1= pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+ host + ';DATABASE='+database + ';UID='+user + ';PWD='+password)
                
                cursor = con1.cursor()
                now= datetime.now()  #Variable que contiene la fecha del dia de hoy
                
                # Se cargan los datos indicados de la tabla
                query= "SELECT * FROM Problema"
                cursor.execute(query)
                result = cursor.fetchall() 
                
                print("Sofia conecta")
                                
                print("query " + query)
                for i in result:
                        print(str(i[0]))
                        print(str(i[1]))
                        print(str(i[2]))
                        print(str(i[3]))
                        print(str(i[4]))
                        print(str(i[6]))
                        print(str(i[7]))
                        print(str(i[8]))
                        print(str(i[9]))
                        print(str(i[10]))
                        print(str(i[11]))
                      
                        
                con1.commit()
                
        except Exception as e:
                print ("Ocurrio un error al conectar a SQL server: ", e)
                con1.close()
        finally: 
                cursor.close()
                con1.close()
                print("OK...Sql Connection is closed")
            
        

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract'

image = cv2.imread('placa.png')

text = pytesseract.image_to_string(image,lang='spa')
print('Texto: ',text)
      
cv2.imshow('Image',image)
cv2.waitKey(0)
cv2.destroyAllWindows()
Conecta()