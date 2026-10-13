class Repoos < Formula
  desc "Repo-native task tracking for AI-assisted engineering"
  homepage "https://repoos.org"
  url "https://registry.npmjs.org/@repo-os/repoos/-/repoos-0.5.70.tgz"
  sha256 "68144d4c99a0c1f05eae491c7d6d61f25c5d7bf1e75eb77256dd288d66ae05e3"
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
