Return-Path: <linux-omap+bounces-3110-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FEA0C545
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78C4D7A03E2
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 23:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF711FA150;
	Mon, 13 Jan 2025 23:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H2ncouGZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480591F9EDC;
	Mon, 13 Jan 2025 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809838; cv=none; b=NfZ0f3AKhxQ49rpW65wcWWB5qrJXo14kRptWWW4/V+sPBwn0qdWrwNcpJ5dKd6u7wvQj9UOu+gtyUTGfdIUPNQy4eitD6VtNvPpCUkpZL4qw9fz/gqZ4waHdRRk0UzK8jG/6DPtxBlY60uMBG9VbnjqPT6TENrac52KEX9XNTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809838; c=relaxed/simple;
	bh=hqxdz3xMnfqi6DswrpfL1Son2ONYGQE5KL/6wdxyTP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kcio0vJqgrpXWzEQamojEqJ5GhlonyvFR0p+wSuPbgHsS0hmjOSnDabBV2ZQmIZ4MHeEFErQjtd+bX/5m6IyxRIV6lQr0UWCvZABK/BBRDU7wM34YWe2FNVo7d8EAU3+BIf/q6z0n5F72S5CIfzZpB/gysq6budRZdPJbuPL5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H2ncouGZ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DNAJNr3762057
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:10:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736809819;
	bh=X2ibNLMuL9jD+RQ2YdfCDeZ0sh4YZKzO/lG3VEoyxeQ=;
	h=From:To:CC:Subject:Date;
	b=H2ncouGZ8WzkuNvOG+Iw9i20FpkLFDSeTR3i905sJlxXpemXv+nWa9TeECFOCmGk4
	 lCycjL2OJSEmuKBNoAdM7ZPSeJXT3VHOIEv53NCngzOMfBwcxZ82Iaazdk+InKL1F/
	 dCdCD/9/owvi0o0fEscUBtX+ae8PU1LYnhJerVHk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DNAID5046951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 17:10:18 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 17:10:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 17:10:18 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DNAILx067169;
	Mon, 13 Jan 2025 17:10:18 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 0/4] Add TI TPS65215 PMIC Regulator Support
Date: Mon, 13 Jan 2025 17:10:14 -0600
Message-ID: <20250113231018.125426-1-s-ramamoorthy@ti.com>
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

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

This follow-up series is dependent on the TPS65215 MFD Driver Series:
Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")

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
  regulator: tps65215: Update struct names
  regulator: dt-bindings: Add TI TPS65215 PMIC bindings
  regulator: tps65215: Add support for TPS65215 regulator resources
  regulator: tps65215: Add support for TPS65215 Regulator IRQs

 .../bindings/regulator/ti,tps65219.yaml       |  21 +-
 drivers/regulator/Kconfig                     |   7 +-
 drivers/regulator/tps65219-regulator.c        | 188 +++++++++++++-----
 3 files changed, 165 insertions(+), 51 deletions(-)

-- 
2.43.0


