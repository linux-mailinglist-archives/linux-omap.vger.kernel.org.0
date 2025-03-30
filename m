Return-Path: <linux-omap+bounces-3515-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 260ACA75BF4
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 21:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF23167B4D
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 19:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9719A1C5F1B;
	Sun, 30 Mar 2025 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WWG+PmK0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD864A8F
	for <linux-omap@vger.kernel.org>; Sun, 30 Mar 2025 19:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743363550; cv=none; b=kIwBuvDRhWY5UO9UO/OBzg3hyPa6JLz7XdeDGmqx1Eq8gwZXYUb7ZbLEavCJiUEyOnz1TV2n4eDBOXw098eoqvMxjqNBytmR1A2YwNW5vp60hSKgWlum9Shoi7HnsgFA4HSNuuxAxkGHDvZj3N/dTeovWJ3kRZcwa6C4S5jwnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743363550; c=relaxed/simple;
	bh=/snJvyd4/yQIBokWiOQfcurSjNgtZpglslYPilljpyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOdmbIlWQBti0xPel6y9I+RRT+6jAi4ANh5u33Zrr2/KNAugKSKL3b6hZLndT/LboBONOJFvqIK5tLZwdcKQmMDTSiXoYEsKiSgsoWhi9ln6Yr+R3l23DXslx+O9Gby9XxueqSHHbir4UYnMoc5+lvAb3w/VVEN9A0QKNMggjIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WWG+PmK0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bD31FNZcGehsFc
	rULq0RTCCuJXEwTu7ivCaIG64WknU=; b=WWG+PmK0iOXSLtFCDRz4RIMS1k+z80
	y8VV7gjpq9cfPO6931OU6l3n5ZBIdnkc5zwzuNF2R2J8I+7q1d8AL3Xr02h9Iykc
	HZ/0te5o726+MEypoBQaTEAC9BQ4bvHG7ojQCCTU2VEtLNf69Ape7ia1hIFjvqYV
	LRPCNOkh4fPf6iIxJG+MJR5p9Zq7pHrHec+OlRCFGUFACCiNuqXfpeKfdaLqUuhV
	uf8VS5aPV3he5tbOQnjgdd0g4G7hvxB1qcO+lXy9aSqdB9Ae0EahucmQ/3kO1LN8
	EQ21cqrHRwgpbEPaspFZhx74s+EEcDOiVgOum4kKzjWBSIl41gubwH+A==
Received: (qmail 964731 invoked from network); 30 Mar 2025 21:39:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:03 +0200
X-UD-Smtp-Session: l3s3148p1@AB6xdJQxRNlQ8qei
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
Subject: [PATCH v2 0/5] ARM: dts: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:31 +0200
Message-ID: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
* use not "fix" in commit message to avoid backporting
* added Krzysztof's tags

Thanks for the input, Krzysztof!

After I corrected this for the at91-boards I was interested in, I let
the scripts run for the other boards, too, of course. Here is the
outcome. 49 less dtbs_check errors. Build bots were happy. No
dependencies, I suggest sub-trees apply them on their own. Thanks!

Happy hacking,

   Wolfram

Wolfram Sang (5):
  ARM: dts: marvell: use correct ohci/ehci node names
  ARM: dts: nxp: lpc: use correct ohci/ehci node names
  ARM: dts: st: use correct ohci/ehci node names
  ARM: dts: ti: omap: use correct ohci/ehci node names
  ARM: dts: vt8500: use correct ohci/ehci node names

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


