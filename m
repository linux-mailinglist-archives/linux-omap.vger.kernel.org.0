Return-Path: <linux-omap+bounces-3327-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF60A50CF5
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 22:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050C1170FDE
	for <lists+linux-omap@lfdr.de>; Wed,  5 Mar 2025 21:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE0D257AD5;
	Wed,  5 Mar 2025 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HZgMT3aK"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47635253357;
	Wed,  5 Mar 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208655; cv=none; b=Uqtu9CBN1eTXV5SUPVXrJa7zQZKSVnSIifxnTqykV+9K1DmjsG2mw9FeEfDmjApgb6ZCv3KsMaG1d3t3TNcNF1hlr59UNtPcC4gYUMj5ji3P5pDKM2LFc9x1wouEog5SqfKQATgyVgNFp3rggDaYwlkCEmK2dTFqraqPAb+9p74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208655; c=relaxed/simple;
	bh=BgTRncNgU7ZijFN6Z1yBs4krCRMbvuUJ25+xTTrMsN8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hfUa3aVcIboSU9k26LiYdiqoL6VVxDU9QFEu9fsvdqOYLQubaJhGHLvvzpFDFMWoCS4c2l7Ch5RClp9QeK7g6YUzgNZl2LVkdOr4OXAgj+Rfk2pQwGXP+zpbgk+oslPZuOsP88d3z1hjxhpCFmWWwwVmzRfNVed+8pXEB5hjs98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HZgMT3aK; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525L3qpV4072765
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 15:03:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741208632;
	bh=CyMz+mWJADLjyDONWkGPLNYK+BDuXD8MYvfYz7ML8tY=;
	h=From:To:CC:Subject:Date;
	b=HZgMT3aKax/6mx3DSdO1kORg6rKDFljXDf0StEBRC9850RuaZnDvoRRNmjJTAfmq1
	 V1hCYuBNWblUT0F0c485erkmZv5jeaS1lzaV9UBc4wOs7ltISLxJ3s+Sda6QlO7jgp
	 I+Hfhr3JC4OUn/xFLd6jE9KxDuzjDmSwSs9wuPNY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525L3q4B034777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Mar 2025 15:03:52 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 15:03:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 15:03:52 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525L3peA125160;
	Wed, 5 Mar 2025 15:03:51 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v6 0/9] Add TI TPS65214 & TPS65215 MFD & Regulator Support
Date: Wed, 5 Mar 2025 15:03:42 -0600
Message-ID: <20250305210351.249811-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65214 and TPS65215 are Power Management Integrated Circuits (PMICs) that
have significant register map overlap with TPS65219 and each other. The 
series introduces the 2 new PMICs and restructures the existing driver to 
support multiple devices.

- TPS65214, TPS65215, and TPS65219 each have 3 Buck regulators
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
- TPS65215's LDO2 maps to TPS65219's LDO3.
- TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9
AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

---
Change Log:
v5 -> v6:
- Combine MFD & regulator series to help with dependencies when 
  maintainers take this series
v4 -> v5:
- TPS65214 dt-binding patch: Remove duplicated "then:", combine "if:" 
  statements with enum.
v3 -> v4:
- Update commit header to be "mfd: tps65219" since the driver name has not 
  been changed from TPS65219.
- Added dt-bindings patches to mfd series.
- Combined TPS65214 & TPS65215 dt-binding and mfd patches into 1 series, 
  since the series' share a dependency & these patches add more device support
- Elimate the need for TPS65214 gpio patches by registering TPS65214 as 
  "tps65215-gpio" from the MFD driver, since both have the same GPIO module
- "Remove regmap_read" patch: Drop chip_id variable
- move enum pmic_id struct from "remove regmap_read" patch to "Add support 
  for TPS65215" patch.
v2 -> v3:
- Remove duplicated of_device_id table entries
- Re-order mfd patches to clean up diff displayed
v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- Add driver prefix to chip_data struct
---
Shree Ramamoorthy (9):
  regulator: dt-bindings: Add TI TPS65215 PMIC bindings
  regulator: dt-bindings: Add TI TPS65214 PMIC bindings
  mfd: tps65219: Remove regmap_read check
  mfd: tps65219: Add support for TI TPS65215 PMIC
  mfd: tps65219: Add support for TI TPS65214 PMIC
  regulator: tps65219: Update struct names
  regulator: tps65219: Add support for TPS65215 regulator resources
  regulator: tps65219: Add support for TPS65215 Regulator IRQs
  regulator: tps65219: Add TI TPS65214 Regulator Support

 .../bindings/regulator/ti,tps65219.yaml       |  27 +-
 drivers/mfd/tps65219.c                        | 279 +++++++++++++++++-
 drivers/regulator/Kconfig                     |  12 +-
 drivers/regulator/tps65219-regulator.c        | 242 ++++++++++++---
 include/linux/mfd/tps65219.h                  | 136 ++++++++-
 5 files changed, 619 insertions(+), 77 deletions(-)

-- 
2.43.0


