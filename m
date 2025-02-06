Return-Path: <linux-omap+bounces-3277-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A778A2AF10
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 18:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 513DE7A30E6
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 17:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2C518DF86;
	Thu,  6 Feb 2025 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hk2IKZN6"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FE18C03D;
	Thu,  6 Feb 2025 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863484; cv=none; b=Dx/xZS+lZtvGEbqu6BJjYvcaPGTfC8TBQ6+IbF5IwlItcrF9jfygG/dJLR3JwSul22SG2Vt4AgqyHafsruJlzNKoXZL/dbXE2S2y1Jh9Q4BpJQebvyDHqn8Z1GfQ+ZaVMWJRmTxFj9GuXO/ujB5lDva94Gty/E0dj1Z2gpc7Smg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863484; c=relaxed/simple;
	bh=tPfSmrDpunQu3eiZmacptJEJWHn0VJK/OxlF68AoqXo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=esQNdLl52pk3j8uJNEnt7SL0wZGKe78PGUqhHkg4aFd4DxI97kYYkqwlBW8g9SnfnWI/hrZ1pHppN3om2UCClfwhgdGd8S8tixXWoy2/7GqdxEMCr4y3+1ojmF6xGJjrOl3PpgAG0EkFk4X8b2EZQg5f/2OxRi396tjnWrO0IKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hk2IKZN6; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516HbQ5V3669272
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 11:37:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738863446;
	bh=x15m93AblVbz0xCdBhH0P7Wxy7u1wg8ByFlIodaKRVA=;
	h=From:To:CC:Subject:Date;
	b=hk2IKZN6GXSpLupszh6NWLN/r9szHN0zZgr7nGQ97z/CUiNcWsHHjuVLgR4G1mv6W
	 HgBiGj6j3qu6WoLcq+1eG0AHM5so9thQTa1BFyV6FBVxLV09UAEndkcWRTXuycGn+l
	 ly4LwgDxcGl5Fd/3OaA4WmylrxokVEWIL6WRUo0s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516HbQie015513;
	Thu, 6 Feb 2025 11:37:26 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 11:37:25 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 11:37:25 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516HbPCD015728;
	Thu, 6 Feb 2025 11:37:25 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v5 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver Support
Date: Thu, 6 Feb 2025 11:37:20 -0600
Message-ID: <20250206173725.386720-1-s-ramamoorthy@ti.com>
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
Shree Ramamoorthy (5):
  regulator: dt-bindings: Add TI TPS65215 PMIC bindings
  regulator: dt-bindings: Add TI TPS65214 PMIC bindings
  mfd: tps65219: Remove regmap_read check
  mfd: tps65219: Add support for TI TPS65215 PMIC
  mfd: tps65219: Add support for TI TPS65214 PMIC

 .../bindings/regulator/ti,tps65219.yaml       |  27 +-
 drivers/mfd/tps65219.c                        | 279 +++++++++++++++++-
 include/linux/mfd/tps65219.h                  | 136 ++++++++-
 3 files changed, 417 insertions(+), 25 deletions(-)

-- 
2.43.0


