import boto3
import json

# Initialize the DynamoDB client
dynamodb = boto3.resource('dynamodb')
table_name = 'registration-table'  # Replace with your table name
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    """
    Lambda function to retrieve all user data from DynamoDB.
    """
        # Fetch all data from the DynamoDB table
    response = table.scan()

        # Extract items
    items = response.get('Items', [])

        # Return a success response with the data
    return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*' , # For CORS
            },
            'body': json.dumps(items)
    }

