save_function termux_step_make termux_step_make_bk

termux_step_make() {
	termux_step_make_bk || \
		cd "$GOPATH"/src/github.com/asciimoo/wuzz \
		&& GO111MODULE=auto go mod tidy \
		&& GO111MODULE=auto go get github.com/BurntSushi/toml \
		&& GO111MODULE=auto go get github.com/PuerkitoBio/goquery \
		&& GO111MODULE=auto go get github.com/alessio/shellescape \
		&& GO111MODULE=auto go get github.com/jroimartin/gocui \
		&& GO111MODULE=auto go get github.com/mattn/go-runewidth \
		&& GO111MODULE=auto go get github.com/mitchellh/go-homedir \
		&& GO111MODULE=auto go get github.com/nsf/termbox-go \
		&& GO111MODULE=auto go get github.com/nwidger/jsoncolor \
		&& GO111MODULE=auto go get github.com/tidwall/gjson \
		&& GO111MODULE=auto go get github.com/x86kernel/htmlcolor \
		&& GO111MODULE=auto go get golang.org/x/net/proxy \
		&& GO111MODULE=auto go build
}
