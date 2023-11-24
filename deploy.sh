./build.sh
#docker run --name flask_dev -it -v /Users/ajit.dubey/projects/flask/data:/home/ajitdubey/data --rm flask_dev_env
#docker run --name flask_dev --privileged -it -v /Users/ajit.dubey/projects/flask/data:/home/ajitdubey/data --rm flask_dev_env
docker run --name flask_dev --privileged -it -p 5000:5000 -v /Users/ajit.dubey/projects/flask/data:/home/ajitdubey/data --rm flask_dev_env