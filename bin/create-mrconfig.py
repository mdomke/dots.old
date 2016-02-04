#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import argparse
from getpass import getpass, getuser


BASE_URL = "https://stash.collins.kg/rest/api/1.0"
CREDENTIALS = {"name": None, "passwd": None}


def get(path):
    response = requests.get(
        BASE_URL + path, auth=(CREDENTIALS["name"], CREDENTIALS["passwd"]))
    response.raise_for_status()
    return response.json()


def get_clone_urls(project, url_type="ssh"):
    result = []
    repos = get("/projects/{}/repos".format(project))["values"]
    for repo in repos:
        url = [link["href"] for link in repo["links"]["clone"]
               if link["name"] == url_type][0]
        result.append((repo["name"], url))
    return result


def write_mrconfig(clone_urls, init_git_flow=True, upload=True):
    template = "[{name}]\ncheckout =\n    git clone {url}\n"
    if init_git_flow:
        template += "    cd {name}\n"
        template += "    git checkout master\n"
        template += "    git flow init -d\n"
        template += "    git checkout develop\n"
    if upload:
        template += "upload =\n"
        template += "    python setup.py bdist_wheel\n"
        template += "    devpi upload dist/*.whl\n"
    with open(".mrconfig", "w") as config:
        for name, url in clone_urls:
            config.write(template.format(**locals()) + "\n")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Create .mrconfig file for a project")
    parser.add_argument("-p", "--passwd")
    parser.add_argument("-u", "--user")
    parser.add_argument("--no-git-flow", action="store_true")
    parser.add_argument("--no-upload", action="store_true")
    parser.add_argument("project", help="The project slug")

    args = parser.parse_args()
    CREDENTIALS["name"] = args.user or getuser()
    CREDENTIALS["passwd"] = args.passwd or getpass()

    write_mrconfig(get_clone_urls(args.project),
                   not args.no_git_flow,
                   not args.no_upload)
