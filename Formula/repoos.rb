class Repoos < Formula
  desc "Repo-native task tracking for AI-assisted engineering"
  homepage "https://repoos.org"
  url "https://registry.npmjs.org/@repo-os/repoos/-/repoos-0.5.66.tgz"
  sha256 "341c66a75d8982531e043f9319570440ef0e4af12959750b88a6c2e549285739"
  license "FSL-1.1-MIT"

  depends_on "node"

  def install
    package_root = libexec/"node_modules/@repo-os/repoos"
    package_root.install Dir["*"]

    (bin/"repoos").write_env_script package_root/"dist/cli/index.js",
                                      PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    assert_match "repoos v#{version}", shell_output("#{bin}/repoos --version")
  end
end
