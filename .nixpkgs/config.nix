{
	allowUnfree = true;
	packageOverrides = pkgs_: with pkgs_; {
		all = with pkgs; buildEnv {
			name = "all";
			paths = [
				ledger
				curl
				emacs
				git
			];
		};
	};
}
