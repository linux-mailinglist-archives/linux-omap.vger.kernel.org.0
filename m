Return-Path: <linux-omap+bounces-3608-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D9A9D39C
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 22:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6961BC383C
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 20:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548DF216E2B;
	Fri, 25 Apr 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FvwKJhDg"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C97122332B;
	Fri, 25 Apr 2025 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614677; cv=none; b=uQPIeO4s6ZnMAiq1O6kWrc9XUlrmm5VKbj5OA1siGb9Y4gZOXKgI0s52TjDGtA+6ZnJFS6ETlx+IIVBGiG43sRUySjTEFB5VCuijGAXZcp112kHDMhsWiTBTOEaLuMMudkflH1mRtfqLKj1lo53jS3LyQ07a4uYqJnTuAzOnrt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614677; c=relaxed/simple;
	bh=7YdCjmZzTK1ePXQex1Lq91xIumBUVkfwQPrg+J7xiB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SwMo5/mc9L9bSU2LopTOk25gjqZFnIVolOwFK5/REuA8dsmPTYXyHP26WgYvCzsQMRsSLq+cSyKp1YpCuf2ug8O3XQwWPcIeu5+TAlyI+GNumbOwEI3+DScWBBHVRbwLd6/K4ncsscOdVB8+2ncyOPa2+WfrEfI+b5cOFZnEk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FvwKJhDg; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvbT92272945
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745614657;
	bh=ZdV4EQHcUtI6VgU4H+9WjA2nwXCkPIw4KWofrqNZb/c=;
	h=From:To:CC:Subject:Date;
	b=FvwKJhDgEkLirgeaz675eRoBXbK+yrtW0omsa/o50GNtGH2RwPlydSq19mX0Yn8lR
	 9RN2SiLdEMB7LgQFj9l/sAcGnuzu2Q+U43Sf8PIGU1zk/276M8hUS03XcPL//DnUfu
	 JL1FtTS+TQ6tMyELO4dWvuHcuUVblwIX58Bxkb28=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvbrH065704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:57:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:57:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:57:36 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKvabJ078933;
	Fri, 25 Apr 2025 15:57:36 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v7 0/4] Add TI TPS65214 & TPS65215 Regulator Support
Date: Fri, 25 Apr 2025 15:57:32 -0500
Message-ID: <20250425205736.76433-1-s-ramamoorthy@ti.com>
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

Rebase patch series for 6.16 cycle. The related MFD series was integrated 
in mainline during 6.15 cycle [0].

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
v6 -> v7:
- Rebase series for 6.16 cycle
- Revert changes made in v5 and v6 to combine MFD & regulator driver series
v5 -> v6:
- Combine MFD & regulator series to help with dependencies when 
  maintainers take this series
v4 -> v5:
- TPS65214 dt-binding patch: Remove duplicated "then:", combine "if:" 
  statements with enum.
v3 -> v4:
- Update commit header to be "regulator: tps65219" since the driver name 
  has not been changed from TPS65219.
- Combined TPS65214 & TPS65215 regulator patches into 1 series, since the 
  series' share a dependency & these patches have overlapping changes
- Drop tps65215_regulator_irq_types empty array and instead: set irq_types 
  to NULL and dev_irq_size to 0
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
[0]: https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-ty@kernel.org/

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


