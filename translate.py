import boto3

s3 = boto3.client('s3')
translate = boto3.client('translate')

def translate_text(text, source_lang, target_lang):
    response = translate.translate_text(
        Text=text,
        SourceLanguageCode=source_lang,
        TargetLanguageCode=target_lang
    )
    return response['TranslatedText']

def lambda_handler(event, context):
    
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    source_key = event['Records'][0]['s3']['object']['key']
    target_bucket = 'outputs3translate'  #output bucket name
    target_key = f"translated_{source_key}"  

    
    response = s3.get_object(Bucket=source_bucket, Key=source_key)
    text = response['Body'].read().decode('utf-8')

    # Translate the text
    translated_text = translate_text(text, 'auto', 'de')  
    print({translated_text})
    
    s3.put_object(Body=translated_text.encode('utf-8'), Bucket=target_bucket, Key=target_key)

    print(f"Translated file '{source_key}' uploaded to '{target_bucket}' as '{target_key}'")

    return {
        'statusCode': 200,
        'body': 'Translation successful'
    }