Return-Path: <linux-omap+bounces-5064-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379BC93F40
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C11303453A9
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 14:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F8330F92B;
	Sat, 29 Nov 2025 14:22:25 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88327380A;
	Sat, 29 Nov 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764426145; cv=none; b=VUKm4h4P0YMFcihalatePehZ9s/bnnhzxGtJUN1VKCZHAgI8/AcFxCd2cAa43lQ+/LUFgGwynYBKtT5hwyZrrKaTs8FlexhFHe3N1ySRWzaxK24fztLS84oRJ+SZ/FYEYPa8dyMmckFx72WLJKoRmXrlkmQiLz9iT/jwHd0RusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764426145; c=relaxed/simple;
	bh=b/QQxxH2kWTq5qzfiGqKl/BBg57sLbcUjOeM77aLgA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VP47e3+/EN09yG7lu1mk9kWVMeV7Bxq09BFRWihWijr+CE3fi/GLr3oXLLjg8BdviDDbpDc4TJ5Jzn30r+9nMpYuNtgd4xSZXnMONs8UMB5HP5Tjb6Cdh2TrgE2DK6yJMz6GwW3UoSgXhG9V2aCCQHAGrBbKHGQvnrW5FU3lEVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3808E2C14AA;
	Sat, 29 Nov 2025 15:22:15 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id TnmHBXwJ-tBL; Sat, 29 Nov 2025 15:22:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B9AE72C14AE;
	Sat, 29 Nov 2025 15:22:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3x3L1IUlenzk; Sat, 29 Nov 2025 15:22:14 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id EA0F82C14AA;
	Sat, 29 Nov 2025 15:22:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	lee@kernel.org,
	dakr@kernel.org,
	rafael@kernel.org,
	gregkh@linuxfoundation.org,
	broonie@kernel.org,
	tony@atomide.com,
	rogerq@kernel.org,
	khilman@baylibre.com,
	andreas@kemnade.info,
	aaro.koskinen@iki.fi,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/4] Add tooling to disable debugfs on OMAP based systems
Date: Sat, 29 Nov 2025 15:20:38 +0100
Message-ID: <20251129142042.344359-1-richard@nod.at>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It came to my attention that commands such as `grep -r / -e ...` can caus=
e
crashes on an AM572x based system.
An investigation found that reading from various files in /sys/kernel/deb=
ug/regmap
causes imprecise async data aborts.

One of these register maps is the CTRL_MODULE_CORE register map at 0x4A00=
2000.
It contains various registers marked as reserved, but the manual indicate=
s
that read access is still allowed.
On said system, reading from most registers seems to work, but for some
an async data abort happens. So it's not entirely clear what registers ar=
e safe
and which are not.

So, add tooling to allow disabling debugfs access to such dangerous regis=
ters.
Splitting the register map definitions in the device tree seemed less pra=
ctical to
me since it would unnecessarily make the device trees more complicated.

Richard Weinberger (4):
  dt-bindings: Document new common property: has-inaccessible-regs
  regmap: Allow disabling debugfs via regmap_config
  syscon: Wire up has-inaccessible-regs
  arm: dts: omap: Mark various register maps as dangerous

 .../devicetree/bindings/common-properties.txt        | 12 ++++++++++++
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi               |  4 ++++
 arch/arm/boot/dts/ti/omap/dra7.dtsi                  |  1 +
 arch/arm/boot/dts/ti/omap/dra74x.dtsi                |  1 +
 drivers/base/regmap/regmap.c                         |  2 ++
 drivers/mfd/syscon.c                                 | 10 ++++++++++
 include/linux/regmap.h                               |  3 +++
 7 files changed, 33 insertions(+)

--=20
2.51.0


