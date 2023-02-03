# Basic Flask App (Creating Docker Image and Orchestrating using Kubernetes)

### Pre-requisites: Python, Docker, Kubernetes Cluster (minikube, k3s), Kubectl utility

This small repo demonstrates a proper file structure for a Flask app. The folders named *static* and *templates* are required.

**Routes** and **static files** are handled correctly in all `src` and `href` attributes in the template files.

The template file `base.html` is used as a shell by the other three HTML templates. This means they insert content into `base.html` according to Jinja2 template rules.

After installing all dependencies, run the app by entering its folder and typing:

`$ python routes.py`

Generate Docker Image using `Dockerfile` available in the root directory using `docker build -t <image_name>:<image_tag> .`

Login to Docker using CLI to push the image to DockerHub using `docker login`

Create repository in DockerHub using UI (make sure to make it public for simplicity).

Rename the image using `docker tag <image_name>:<image_tag> <docker_hub_username>/<image_name>:<image_tag>`

Push the image to DockerHub using `docker push <docker_hub_username>/<image_name>:<image_tag>`

basic-flask-app can be orchestrated using Kubernetes Deployment as no database or no credentials are there.

`kubernetes-manifestfiles/deployment.yaml` creates Kubernetes deployment using the basic-flask-app image push on DockerHub.

`kubernetes-manifestfiles/service.yaml` creates Kubernetes NodePort service to expose basic-flask-app deployment to access outside the cluster, will be accessible on node `minikube`.

For minikube users, use `minikube service <service_name> -n <namespace_name>` to access the service from local machine.