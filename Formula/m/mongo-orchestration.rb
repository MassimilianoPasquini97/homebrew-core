class MongoOrchestration < Formula
  include Language::Python::Virtualenv

  desc "REST API to manage MongoDB configurations on a single host"
  homepage "https://github.com/10gen/mongo-orchestration"
  url "https://files.pythonhosted.org/packages/f1/c6/3ccc6baa1693168052dff0a96450ac64ea738249c96d890c12c48e4b76a6/mongo_orchestration-0.9.0.tar.gz"
  sha256 "fcf3b644d946794218672f94ea63cea4de1d7a3c29c60bacae507bb64c147134"
  license "Apache-2.0"
  head "https://github.com/10gen/mongo-orchestration.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "e358b3e7f365dc1adb3bc901de810add3fab891fff4d4f13c237c8d95f2ec2ab"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "d3715f1ab8558933a0aa4c62d3b919bc3fb0563d435d2f124c8e3a4753ad9900"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "007bf8a86adea963ef4c7c15e9e01febb484bc6a628b3521de372d55cc0cce5a"
    sha256 cellar: :any_skip_relocation, sonoma:         "314f9c0583213cd6fc484cfa2843ccf2859cdcca6e1de80003bb69163fa5afb2"
    sha256 cellar: :any_skip_relocation, ventura:        "9dedc2f46bcae5a161d6a3df8dba479dbe473202866ba7200cd7b31dcfb27070"
    sha256 cellar: :any_skip_relocation, monterey:       "b942a701bdd1caf744b055319cadec6e533d1c350da844417d1564ded14ce7c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3f89299f147390c285a174eeb0f6f1fe31c0a60313d387edfc71aacd7d2f42ef"
  end

  depends_on "certifi"
  depends_on "python@3.12"

  resource "bottle" do
    url "https://files.pythonhosted.org/packages/fd/04/1c09ab851a52fe6bc063fd0df758504edede5cc741bd2e807bf434a09215/bottle-0.12.25.tar.gz"
    sha256 "e1a9c94970ae6d710b3fb4526294dfeb86f2cb4a81eff3a4b98dc40fb0e5e021"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "cheroot" do
    url "https://files.pythonhosted.org/packages/63/e2/f85981a51281bd30525bf664309332faa7c81782bb49e331af603421dbd1/cheroot-10.0.1.tar.gz"
    sha256 "e0b82f797658d26b8613ec8eb563c3b08e6bd6a7921e9d5089bd1175ad1b1740"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/37/7d/c871f55054e403fdfd6b8f65fd6d1c4e147ed100d3e9f9ba1fe695403939/dnspython-2.6.1.tar.gz"
    sha256 "e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a/idna-3.8.tar.gz"
    sha256 "d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603"
  end

  resource "jaraco-functools" do
    url "https://files.pythonhosted.org/packages/03/b1/6ca3c2052e584e9908a2c146f00378939b3c51b839304ab8ef4de067f042/jaraco_functools-4.0.2.tar.gz"
    sha256 "3460c74cd0d32bf82b9576bbb3527c4364d5b27a21f5158a62aed6c4b42e23f5"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/92/0d/ad6a82320cb8eba710fd0dceb0f678d5a1b58d67d03ae5be14874baa39e0/more-itertools-10.4.0.tar.gz"
    sha256 "fe0e63c4ab068eac62410ab05cccca2dc71ec44ba8ef29916a0090df061cf923"
  end

  resource "pymongo" do
    url "https://files.pythonhosted.org/packages/05/2c/ad0896cb94668c3cad1eb702ab60ae17036b051f54cfe547f11a0322f1d3/pymongo-4.8.0.tar.gz"
    sha256 "454f2295875744dc70f1881e4b2eb99cdad008a33574bc8aaf120530f66c0cde"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6/urllib3-2.2.2.tar.gz"
    sha256 "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run [opt_bin/"mongo-orchestration", "-b", "127.0.0.1", "-p", "8889", "--no-fork", "start"]
    require_root true
  end

  test do
    system bin/"mongo-orchestration", "-h"
  end
end
