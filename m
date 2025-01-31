Return-Path: <linux-omap+bounces-3249-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56894A2451A
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 23:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98B11665BC
	for <lists+linux-omap@lfdr.de>; Fri, 31 Jan 2025 22:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CD01F540D;
	Fri, 31 Jan 2025 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r8dSGxD6"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C80F1F3D5C;
	Fri, 31 Jan 2025 22:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738361524; cv=none; b=skRPx8uB2t4pUMkgMDJdxYa2GLHF0tOzGC/apogJxekDhpxRa67WMukEnR6h8sjIIG1LNCKmcwz465YAuwrvKIZrPC/y0afI4diMARRE0gB99z3QUOFo4ucH8WFOQsz/XrUy0coakylYFP4bNAxZxAI6uWbGKKIawKRVL0GEGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738361524; c=relaxed/simple;
	bh=nN267+Nl/v36HAT6pwJ61c8ntubrkXuZuCrbvxI2KVQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EnLqq4CikwvrImEgarCR9v6jSvBpGBouOpd/ontRJ+IgBm3+BE1gr9SJ9V4Og36ns0dZa8SxUaA9LNT1qavrECPJfngPmWfLV5dCJgne0vYND39V7y72vD9HiaGGRQ2yVE121XMUFiENwfjI83YMRhBPgcRxeSBe/AH9bl71UUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r8dSGxD6; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VMBeEe1737225
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:11:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738361500;
	bh=R0Qio1Qy7/x274RjkjjH1d0k8Vs44YIy7c1o8KieTqQ=;
	h=From:To:CC:Subject:Date;
	b=r8dSGxD6Gg7/AwRkwxeuG6eXfUsI9tJtDs+YjhJl3hSiTvB7VFcQsO1VqTW4RdaiV
	 vHMADqE59SYWATZYZu0NKzz/40+zDslZgcBI6/dBQO6XCVO+gRVRkWn8zou2BrwyLh
	 FCAM5EH3xKMQ0w9iuesXTVPnuRHw62Y6i5pwUSBg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50VMBdJ6042908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jan 2025 16:11:39 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 16:11:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 16:11:39 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VMBd1w111306;
	Fri, 31 Jan 2025 16:11:39 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <lee@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 0/5] Add TI TPS65214 & TPS65215 PMIC MFD Driver Support
Date: Fri, 31 Jan 2025 16:11:34 -0600
Message-ID: <20250131221139.342967-1-s-ramamoorthy@ti.com>
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

 .../bindings/regulator/ti,tps65219.yaml       |  35 ++-
 drivers/mfd/tps65219.c                        | 279 +++++++++++++++++-
 include/linux/mfd/tps65219.h                  | 136 ++++++++-
 3 files changed, 425 insertions(+), 25 deletions(-)

-- 
2.43.0


