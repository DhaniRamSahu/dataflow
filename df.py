from google.cloud import dataflow_v1beta3
# from google.api_core.exceptions import GoogleAPICallError

project_id = "spheric-crowbar-406014"
region = "europe-west2"

def sample_list_jobs(project_id):
    client = dataflow_v1beta3.JobsV1Beta3Client()

        # Initialize request argument(s)
    request = client.list_jobs(request={"project_id":project_id,"location":region})

        # Make the request
    # page_result = client.list_jobs(request=request)

    print(request)
# Call the function to list jobs
#sample_list_jobs('spheric-crowbar-406014')  # Replace 'your-project-id' with your actual project ID
if __name__ == "__main__":
        sample_list_jobs('spheric-crowbar-406014')

#----

from google.cloud import dataflow_v1beta3
# from google.api_core.exceptions import GoogleAPICallError

project_id = "spheric-crowbar-406014"
region = "europe-west2"

def sample_list_jobs(project_id):
    client = dataflow_v1beta3.JobsV1Beta3Client()
    request = client.list_jobs(request={"project_id":project_id,"location":region})
    # print(request.jobs[0].id)
    for i in request:
        print(i.id)

sample_list_jobs('spheric-crowbar-406014')
