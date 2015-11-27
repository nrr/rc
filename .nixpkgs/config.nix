{
	allowUnfree = true;
	packageOverrides = pkgs_: with pkgs_; {
		all = with pkgs; buildEnv {
			name = "all";
			paths = [
				ledger
				curl
				git
				subversion
				s6
				polipo
				privoxy
				offlineimap
			];
		};
	};
}
