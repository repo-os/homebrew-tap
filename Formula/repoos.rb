class Repoos < Formula
  desc "Repo-native task tracking for AI-assisted engineering"
  homepage "https://repoos.org"
  url "https://registry.npmjs.org/@repo-os/repoos/-/repoos-0.5.58.tgz"
  sha256 "e86dea1f319c610c5406c8074c354fec9dc2f74bd2f030545be95758ba51e819"
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
