Return-Path: <linux-omap+bounces-3507-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DFA759F2
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 14:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DDA9188A223
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBBF1C5485;
	Sun, 30 Mar 2025 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PCNNhs+p"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A314F117
	for <linux-omap@vger.kernel.org>; Sun, 30 Mar 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743336860; cv=none; b=THuk8ra9Weypfv3PHOm3ACyx0SiYcmSvPPDfEKLs26ZKi56c9xccjUlAeqdiUHSgREPxxnGDAPHb871SAVntv7WdFTIKUSBJtmjBNvNiCyaM4qUOv0+1w+HFaqZyJez+I4bFZ36YoS9tziBxucUGdcx1/SRTz+5q+OPNdM+Y1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743336860; c=relaxed/simple;
	bh=ctuZ+NNnUO/ZMdUUYMIQYarAEHDOulCK90vRC8Ygtek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVUjBai+4Jpm8XLTZyyvxYLGoRNFSdR7bwj7ci+FMLdNuCJGG1hGh7iFHf4seyGyKgTgeEb2cNol39z3QHK+0RsfcSa/CcqMv3gH9DWNg+4FkAyWPVXrSca4C5+IanHIMe0wIOIoR9i859uT4vZM/tkaVzFXIbMSN0Z9eYQBcxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PCNNhs+p; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=akAZcCXApKmwr9
	fL0Nee5K8HyD7g2IZvIQTiXZJTi2A=; b=PCNNhs+pernjiTV4Rzfbu6uVHuFdqP
	K5HUKrHhpGf2jjok2afE8zgj2nFb2VNSJ7+uYsGQvXx5et+J+ecyFIpy13zmZ3d+
	+twwoqwFFD1kl4XJXgVzRRwGFlljf7HO/aWMS2d+PeWEvwbR7ogYYGv8cqrynwW9
	Ihmp5tT+kT/HIzFUqfbTNXO5cBe5IXR4qfkCD0tphtOt/J8ZDGdLCEOOG+42asfv
	gYJHUoor4EF4IGNdHUmfdMx0CC14tw2EjRkcqxlO9D7QMnTc4JABBT39WwxnKwT0
	10Md+hgP77Mh0hy3fcjlaRPZKnT0kgPIv25VK8PpQClp8VTKA6skeVnQ==
Received: (qmail 855621 invoked from network); 30 Mar 2025 14:14:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:09 +0200
X-UD-Smtp-Session: l3s3148p1@ouCSPY4xTjBtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 0/5] ARM: dts: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:23 +0200
Message-ID: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After I fixed this for the at91-boards I was interested in, I let the
scripts run for the other boards, too, of course. Here is the outcome.
49 less dtbs_check errors. Build bots were happy. No dependencies, I
suggest sub-trees apply them on their own. Thanks!

Happy hacking,

   Wolfram

Wolfram Sang (5):
  ARM: dts: marvell: fix faulty ohci/ehci node names
  ARM: dts: nxp: lpc: fix faulty ohci/ehci node names
  ARM: dts: st: fix faulty ohci/ehci node names
  ARM: dts: ti: omap: fix faulty ohci/ehci node names
  ARM: dts: vt8500: fix faulty ohci/ehci node names

 arch/arm/boot/dts/marvell/kirkwood-db.dtsi             | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood.dtsi                | 2 +-
 arch/arm/boot/dts/marvell/orion5x.dtsi                 | 4 ++--
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi                 | 2 +-
 arch/arm/boot/dts/st/spear1310-evb.dts                 | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts                 | 8 ++++----
 arch/arm/boot/dts/st/spear13xx.dtsi                    | 8 ++++----
 arch/arm/boot/dts/st/spear300-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear310-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear320-evb.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear320-hmi.dts                  | 6 +++---
 arch/arm/boot/dts/st/spear3xx.dtsi                     | 6 +++---
 arch/arm/boot/dts/st/spear600.dtsi                     | 8 ++++----
 arch/arm/boot/dts/ti/omap/omap3.dtsi                   | 4 ++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                | 4 ++--
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                | 4 ++--
 arch/arm/boot/dts/vt8500/vt8500.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi                   | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi                   | 2 +-
 23 files changed, 49 insertions(+), 49 deletions(-)

-- 
2.47.2


