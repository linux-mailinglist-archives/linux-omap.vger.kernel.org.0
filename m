Return-Path: <linux-omap+bounces-2967-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CDA010B4
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF63318853F2
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B991C5F11;
	Fri,  3 Jan 2025 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aCVTkTjd"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF41C5F12;
	Fri,  3 Jan 2025 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945507; cv=none; b=fBW7u33L4E+TyxcGFbVdq5Sphza69vvvcH9c9lX7e/o4FGyjZv1aZuKpsS0fNa9FDulwuyn8ufnNpLqRnwm+eYqagfI2uePjb9KDNsB4nMEGQ2Vs8xPv6jxF9CFKeFVyoPgULGSuCEmNTXg+Zr7HdyxOaZSowl/SH3b4TudUZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945507; c=relaxed/simple;
	bh=mVQs1YzK0SRp9VHl45m6ablCfmeva18pyz1lbLqkV70=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oNf4Vlkb3pVPq1HXqfpFY4Dwnef+nJ5FFN5Ml6aW9L0rPWkxHXeN1Pg83RUDcSKdWmt+OAF1+e9TOO2+mzOvplcrESVGJvLciGRveC5L0OanQZiF9ub5rMRTXna5IL71xa02zHOliq3SOH/CwWKLR5MrN6uaxYtb4xjf+MarJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aCVTkTjd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4klg2151760
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=HlYrUtUN3z0IhosBIz3qhP3d7Yeiopq4YskGURaFbjM=;
	h=From:To:CC:Subject:Date;
	b=aCVTkTjdBcc2kfk3txM4845KpD5aMwRPalIioTTVcdDY+PRLe9dTbiAd+5dJemaxX
	 1e7kWQk6o8y3wtaDWEH0QSz1T62HjQeS40PdUN3bzd5d5znjbFUSJAaNlpergdcXjH
	 HMIIHgnggvSxDyLWGkNtoSLqisE+Ph65M7XSPBuE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kRR037209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0I121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/7] Add TI TPS65215 PMIC Regulator Support
Date: Fri, 3 Jan 2025 17:04:39 -0600
Message-ID: <20250103230446.197597-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

This follow-up series is dependent on the TPS65215 MFD Driver Series:
Commit c3cc37e8d23d ("mfd: tps65215: Add support for TI TPS65215 PMIC")
Commit 5f0f36835b90 ("mfd: tps65215: Remove regmap_read check")

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- Both TPS65215 and TPS65219 have 3 Buck regulators.
- TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
- TPS65215 and TPS65219's LDO1 are the same.
- TPS65215's LDO2 maps to TPS65219's LDO3.
- TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
- The remaining features are the same.

TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

---
Change Log:
v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- Add driver prefix to chip_data struct
- Have probe() helper functions use dev_err_probe instead of dev_err() to 
  log the error code in a human readable format & combined with return, it 
  saves a few LoC since { } can be removed.
- Add error handling of 'irq_data' in probe() as previously done.
---

Shree Ramamoorthy (7):
  regulator: dt-bindings: Add TI TPS65215 PMIC bindings
  regulator: tps65215: Update function & struct names
  regulator: tps65215: Update IRQ structs to include TPS65215
  regulator: tps65215: Add chip_data struct for multi-PMIC support
  regulator: tps65215: Update platform_device_id table
  regulator: tps65215: Define probe() helper functions
  regulator: tps65215: Restructure probe() for multi-PMIC support

 .../bindings/regulator/ti,tps65219.yaml       |   9 +-
 drivers/regulator/Kconfig                     |   7 +-
 drivers/regulator/tps65219-regulator.c        | 217 +++++++++++++-----
 3 files changed, 177 insertions(+), 56 deletions(-)

-- 
2.34.1


