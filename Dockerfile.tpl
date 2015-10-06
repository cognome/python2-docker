FROM {{ BASE_IMAGE }}

RUN apt-get update && apt-get install locales-all && apt-get clean
