#!/usr/bin/python2

import json
import subprocess
import argparse
import os
import inspect

contracts_dir = "../"
currentdir = os.path.dirname(
    os.path.abspath(inspect.getfile(inspect.currentframe()))
)
os.sys.path.insert(0, os.path.dirname(currentdir))
from tests.utils import determine_binary, edit_dao_source, rm_file, to_wei


class TestDeployContext():
    def __init__(self, args):
        self.args = args
        self.args.solc = determine_binary(args.solc, 'solc', True)

    def compile_contract(self, contract_name):
        if self.args.no_limits and contract_name == "DAO.sol":
            contract_path = edit_dao_source(
                self.args.contracts_dir,
                False,  # keep limits
                self.args.min_proposal_debate,
                self.args.min_split_debate,
                True,  # halve min quorum test, remove year limit
                self.args.split_execution_period,
                True,  # Normal pricing
                True,  # Don't edit creationGracePeriod
            )
        else:
            contract_path = os.path.join(
                self.args.contracts_dir,
                contract_name
            )
        print("    Compiling {}...".format(contract_path))
        data = subprocess.check_output([
            self.args.solc,
            contract_path,
            "--optimize",
            "--combined-json",
            "abi,bin"
        ])
