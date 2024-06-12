import os
import sys
import logging


try:
    log_level = os.environ.get("LOG_LEVEL", "INFO")
    logging.basicConfig(stream=sys.stdout, level=log_level, format='time=\'%(asctime)s\'\tlevel=\'%(levelname)s\'\tname=\'%(name)s\'\tmsg=\'%(message)s\'')
    log = logging.getLogger(__name__)
except Exception as e:
    print(f"Bootstrap error {e}")
    exit(1)

def main():
    '''
    Main function
    Provides the entry point to the application
    '''
    try:
        log.info("Hello World")
    except Exception as e:
        log.error(f"Error in main {e}")
        exit(1)

if __name__ == "__main__":
    main()
