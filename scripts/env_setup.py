import argparse
import logging
from pathlib import Path

from scripts.classes.configuration import Configuration

# Set up logger
logger = logging.getLogger(Path(__file__).name)

# # Arguments
parser = argparse.ArgumentParser(description='Accept AWS parameters')
parser.add_argument('--branch', type=str, help='GitHub branch containing templates', required=True)
parser.add_argument('--github_env_var', type=str, help='Name of the variable to be set in the GitHub environment', required=True)
parser.add_argument('--config_file', type=str, help='Path to the config file in your GitHub repo', required=True)
args = vars(parser.parse_args())


def main(branch, var, config_path):
    logger.info("Setting environment variable: {}...".format(var))
    config = Configuration(branch, config_path)
    branch_type = config.branch_type
    if var == "branch_type":
        value = branch_type
    else:
        value = config.get_config_value(var)
    # Must use 'print' rather than 'return' to output value to GitHub Actions
    print(value)

if __name__ == "__main__":
    main(args['branch'], args['github_env_var'], args['config_file'])