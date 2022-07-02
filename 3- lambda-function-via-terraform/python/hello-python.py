def lambda_handler(event , context):
message = 'Hello ShunyEka Systems This is lambda Example via terraform {} !'.format(event['key1'])
return {
    'message' : message
}