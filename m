Return-Path: <linux-omap+bounces-3285-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDAA32F40
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2025 20:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC553A79E7
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2025 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246A261579;
	Wed, 12 Feb 2025 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mvul/+15"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689C260A4E;
	Wed, 12 Feb 2025 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387510; cv=none; b=OdtBhZa3mqKABXjB5BlRyeYBXS9bvbLZpvEyV2UAkvM4M8l8iXCBgxshkoIYtfWarwTpFWCnKpwPGRwBT6irBrxbiE7aI06pkxxr8mfpZ4C9m8mfP9iXF8Qe3Xd2sHoe7kmWaaw4IY22zjs1MrYPraTWJkzFXD3xz3tTHQnUTRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387510; c=relaxed/simple;
	bh=eWCfUJWCL3bgCUfdMNvjAiXfNzsUUUtb3s+Qt1Vf1eU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lfVcmGkvo9RRZJB7bV0Fgcg/Q/8PcMikoSQ/hovyJ+4fu3qky2/nT7Ysre5nWZ52pZzAzmREeMGSmVUkyjGykm34Fc2dRbqPWv3ntuN6cXQXs0Mc3bxn8wJzeyGTdOyb7BXuVtb6f1ptKbgeGXm7aDzl2GyTAF273edlmGRcQ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mvul/+15; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJBUq83860049
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 13:11:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739387490;
	bh=QGHH7UlGVMkaOY7DBbS8GvxoQBLmUX54+zNR+/ztCDM=;
	h=From:To:CC:Subject:Date;
	b=Mvul/+157rkXdygk+oE52ViC7ZXIiq932D0G7Z13ZuP+zPzNhU6TE8NebjLO7zDTB
	 uTGfcD95UMrC5NE4hXfe2DbZpvVWqPp4hFuKuM8n5azbQxWmR+pMFc6NCixyNtVQxT
	 FE+vgPrDaAkYHE3ZGzo7XqdC4UfzKRcoYz+TdIWM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJBUpW086442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 13:11:30 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 13:11:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 13:11:29 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CJBTMp089207;
	Wed, 12 Feb 2025 13:11:29 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 0/4] Add TI TPS65214 & TPS65215 Regulator Support
Date: Wed, 12 Feb 2025 13:11:25 -0600
Message-ID: <20250212191129.467728-1-s-ramamoorthy@ti.com>
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

Dependencies:
- Patches 2 & 3 depend on https://lore.kernel.org/all/20250206173725.386720-5-s-ramamoorthy@ti.com/
- Patch 4 depends on https://lore.kernel.org/all/20250206173725.386720-6-s-ramamoorthy@ti.com/

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9
AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

---
Change Log:
v3 -> v4:
- Update commit header to be "regulator: tps65219" since the driver name has not 
  been changed from TPS65219.
- Combined TPS65214 & TPS65215 regulator patches into 1 series, 
  since the series' share a dependency & these patches have overlapping changes
- Drop tps65215_regulator_irq_types empty array and instead: set irq_types to NULL and dev_irq_size to 0

v2 -> v3:
dt-bindings: 
- Alphanumeric order for PMIC list
- add allOf:if:then: which will disallow :false two LDOs and their supplies

regulator.c:
- Revert addition of 2 probe helper functions
- Add empty tps65215_regulator_irq_types struct to minimize loops in probe
- Consolidate patches to define and use func/structs in the same patches to
  prevent build error due to no users of the defined functions
- Apply reverse xmas tree style to variable defintions in functions
- Remove unnecessary new lines & add new line after declarations

v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- Add driver prefix to chip_data struct
- Have probe() helper functions use dev_err_probe instead of dev_err() to 
  log the error code in a human readable format & combined with return, it 
  saves a few LoC since { } can be removed.
- Add error handling of 'irq_data' in probe() as previously done.
---
Shree Ramamoorthy (4):
  regulator: tps65219: Update struct names
  regulator: tps65219: Add support for TPS65215 regulator resources
  regulator: tps65219: Add support for TPS65215 Regulator IRQs
  regulator: tps65219: Add TI TPS65214 Regulator Support

 drivers/regulator/Kconfig              |  12 +-
 drivers/regulator/tps65219-regulator.c | 242 ++++++++++++++++++++-----
 2 files changed, 202 insertions(+), 52 deletions(-)

-- 
2.43.0


