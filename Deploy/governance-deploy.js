

personal.unlockAccount(eth.accounts[0]);
var SensusContract = web3.eth.contract(Sensus_abi);
var min_tokens_to_create = 1;
var closing_time = Math.floor(Date.now() / 1000) + seconds_from_now;

var creatorContract = web3.eth.contract(creator_abi);
console.log("Creating SensusCreator Contract");
var _daoCreatorContract = creatorContract.new(
    {
	    from: web3.eth.accounts[0],
	    data: creator_bin,
	    gas: 4000000
    }, function (e, contract){
	    if (e) {
            console.log(e+ " at SensusCreator creation!");
	    } else if (typeof contract.address != 'undefined') {
            console.log("Creating the actual Sensus");
            var dao = daoContract.new(
	            curator,
	            contract.address,
                web3.toWei(default_proposal_deposit, "ether"),
	            web3.toWei(min_tokens_to_create, "ether"),
                closing_time,
                0,
		        {
		            from: web3.eth.accounts[0],
		            data: dao_bin,
		            gas: 4000000
		        }, function (e, our_contract) {
		            // funny thing, without this geth hangs
		            console.log("At Sensus creation callback");
		            if (typeof our_contract.address != 'undefined') {
                        console.log("our new Sensus address is: " + our_contract.address);
		            }
		        });

	    }
    });
