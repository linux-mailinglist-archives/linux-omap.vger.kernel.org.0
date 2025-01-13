Return-Path: <linux-omap+bounces-3108-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E286CA0C52C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0991F165722
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 23:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218A61FA146;
	Mon, 13 Jan 2025 23:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="skte2Smb"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277901D5150;
	Mon, 13 Jan 2025 23:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809697; cv=none; b=WJnnYqsl5WAKXHV2xYdpLTJwctHFuXAQePXXCifyP+8+WhXfy4j6SbQe6BsSbNsuwY28ocDH4EoMu1MzmPij4fNoaBVu2SyyKNZVdkgaq8h4/dZenOL8KzamRNgw83BqtL8LlldDJ/4kY9M+avGFfiiyb2+PN/Hsg07L1qhMAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809697; c=relaxed/simple;
	bh=No08noYPlqdXYvokQP5GgrzWzwP1SSNua6m3qqUHdYE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXJ+BQLhBVI1D0iNjmQhxh34V53Yf7Cv98zYb5WWPMt89fyMdGP5Tz8DCCNr7xiiS/zq0lPNW7ugpOVO0cUeyV70tL5Iz+ajJuh2gILxoEn1xVJLuWo1tUOAZauPXAZzXTK1WVeyvjMZhz23ucsAke4H/wRwhHxhqDDcx6uvSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=skte2Smb; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7pM23587274
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:07:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736809671;
	bh=pu668xxPgZu+2ReRkczzzwwzVh9nQKBTCfcCYgSaPxo=;
	h=From:To:CC:Subject:Date;
	b=skte2SmbbltIbuT1KSXvgWfP2rgWPiRj3of6mTDpQI4qVx8qpiPZta6T5+z81G3Fk
	 +2n0/zm78/wzTNbboFEnnC4UDAWK3Sqsh3M/jxX4MjrJ0K5sAl+DiSkwVi4whFk+H7
	 7QscDjS4bEJN4dEYtzj+bMpGs75bZT7ZNti1GsE8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7pRD094119
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 17:07:51 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 17:07:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 17:07:50 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DN7oZP061254;
	Mon, 13 Jan 2025 17:07:50 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 0/2] Add TI TPS65215 PMIC MFD Support
Date: Mon, 13 Jan 2025 17:07:48 -0600
Message-ID: <20250113230750.124843-1-s-ramamoorthy@ti.com>
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

This follow-up series is dependent on:
Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")

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
- Remove duplicated of_device_id table entries
- Re-order patches to clean up diff displayed
- 
v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- Add driver prefix to chip_data struct
---

Shree Ramamoorthy (2):
  mfd: tps65215: Remove regmap_read check
  mfd: tps65215: Add support for TI TPS65215 PMIC

 drivers/mfd/tps65219.c       | 157 ++++++++++++++++++++++++++++++++---
 include/linux/mfd/tps65219.h |  71 ++++++++++++++--
 2 files changed, 209 insertions(+), 19 deletions(-)

-- 
2.43.0


