import pytest
from brownie import network, UniV2Terminal, convert, accounts, exceptions


class TestUniV2Terminal():

    @pytest.fixture()
    def contract(self):
        if network.show_active() not in ["development", "dev"] or "fork" in network.show_active():
            pytest.skip("Only for local testing")
        output = UniV2Terminal.deploy()
        assert output.totalSupply() == 0
        return output

    def test_hello(contract):
        assert 1==1

