#!/usr/bin/env python3

from flask import Flask,render_template,redirect,session,abort,request,flash
import os,pickle
import subprocess,csv,glob

pathprefix = "/home/canopy/college/sem-6/lab/dwdm-lab/project"

files = glob.glob(pathprefix+"/dwdm-dataset/transpose/*.csv")

metrics = ["Female Population(%)","Agricultural Land(%)","Male Population(%)",
        "Femaile Population","Total Population","Acces to Electricity(%)",
        "Male Population","Agricultural Land Area","Infant Mortality Rate",
        "National Income","GDP","Agricultural value(% of GDP)","Population Density",
        "Population age 15-64(%)","CO2 Emission"]

metric_file_map = dict (zip (metrics,files))

app = Flask (__name__)
app.secret_key = os.urandom (12)
country =' '
metric = ' '

@app.route ('/')
def home ():
    #subprocess.call (['./shell/plot'])
    if not os.path.isfile ("../dwdm-dataset/transpose/gdp-transpose.csv"):
        print ("error")
    f = open ("../dwdm-dataset/transpose/gdp-transpose.csv","r")
    reader = csv.reader (f,delimiter=',')
    cols = next (reader)
    f.close ()
    return render_template ("index.html",countries = cols, m = metrics)

@app.route('/show', methods=['GET','POST'])
def showdata():
    selected_c = request.form.get('country')
    selected_m = request.form.get('metric')
    years_list = [] 
    values_list = []
    infile = metric_file_map[selected_m]
    f = open (infile,'r')
    readr = csv.DictReader (f,delimiter=',')
    for row in readr:
        values_list.append (row[str(selected_c)])
        years_list.append (row[' Name'])
    print (values_list)
    finaldata = []
    for x,y in zip (years_list,values_list):
        finaldata.append ([x,y])

    return render_template("showdata.html", data=finaldata,metric=selected_m)
 
if __name__ == "__main__":
    app.run (debug=True)
