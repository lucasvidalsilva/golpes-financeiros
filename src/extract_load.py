import os
import gspread
import pandas as pd
from dotenv import load_dotenv
from google.oauth2.service_account import Credentials
from sqlalchemy import create_engine

load_dotenv()

DATABASE_URL = os.getenv('DATABASE_URL')

engine = create_engine(DATABASE_URL)

SERVICE_ACCOUNT_FILE = os.getenv("SERVICE_ACCOUNT_FILE")
SCOPES = ["https://www.googleapis.com/auth/spreadsheets"]
CREDENCIAIS = Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)

def extrair_sheets():
    client = gspread.authorize(CREDENCIAIS)
    SHEET_ID = os.getenv("SHEET_ID")
    spreadsheet = client.open_by_key(SHEET_ID)

    worksheet = spreadsheet.sheet1

    dados = worksheet.get_all_values()

    df = pd.DataFrame(dados[1:], columns=dados[0])
    df.columns = df.columns.str.strip()

    return df

def load_sheets_bd(df, schema='public'):
    df.to_sql("bronze_golpes_financeiros", engine, schema=schema, if_exists="replace", index=False)

if __name__ == "__main__":
    planilha = extrair_sheets()
    load_sheets_bd(planilha)