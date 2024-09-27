from flask import Flask, jsonify
# from constants.connection import connection
import psycopg2


connection = psycopg2.connect(
    host="bboxxkenyapostgreserver.postgres.database.azure.com",
    database="bboxxkenya",
    user="DavidRobert",
    password="B3ncars0n"
)

app = Flask(__name__)

@app.route('/get-data', methods=['GET'])
def get_data():
    cursor = connection.cursor()
    
    # SQL Query
    query = """
    SELECT 
        activity_date,
        "Randomizer",
        unique_account_id,
        customer_name,
        sales_person,
        customer_phone_1,
        customer_phone_2,
        payer_identifier,
        nearest_landmark,
        home_address_2,
        home_address_3,
        home_address_4,
        home_address_5,
        daily_rate,
        shop,
        consecutive_late_days,
        par_bucket,
        daysinnormalconsecdays,
        daysactive,
        last_6_month_ur,
        "isBlocked",
        "SC Shops",
        "Previous Assignee",
        "Current Assignee"
    FROM 
        kenya_portfolio.test 
    LIMIT 200
    """
    
    cursor.execute(query)
    records = cursor.fetchall()

    # Define the column names as they will appear in the JSON response
    column_names = [
        "activity_date", "Randomizer", "unique_account_id", "customer_name", 
        "sales_person", "customer_phone_1", "customer_phone_2", "payer_identifier", 
        "nearest_landmark", "home_address_2", "home_address_3", "home_address_4", 
        "home_address_5", "daily_rate", "shop", "consecutive_late_days", "par_bucket", 
        "daysinnormalconsecdays", "daysactive", "last_6_month_ur", "isBlocked", 
        "SC_Shops", "Previous_Assignee", "Current_Assignee"
    ]

    # Convert records into a list of dictionaries
    data = [dict(zip(column_names, row)) for row in records]
    
    # Return the data as JSON
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
