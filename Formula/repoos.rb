class Repoos < Formula
  desc "Repo-native task tracking for AI-assisted engineering"
  homepage "https://repoos.org"
  url "https://registry.npmjs.org/@repo-os/repoos/-/repoos-0.5.80.tgz"
  sha256 "81668d8a339d7d6494722c0772fd86ef5591a836f3f440aa88e700a9075a73ad"
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
