Return-Path: <linux-omap+bounces-3137-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F7A14497
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 23:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF701883BDF
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 22:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2909D236EAE;
	Thu, 16 Jan 2025 22:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TYfCsLim"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC222DF96;
	Thu, 16 Jan 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067181; cv=none; b=VtQ23xdIPlmDANMvjkAlnhQvWw1aPxrkr2rvyiqGtOAB7BX1iKA16nel5J8u+bk7TfTAxtbHPm/L2VPZZvZV4B9YUxjcTrXdGbZ1s6lrmZ1qKp4G6s/7rtUHBu75HnZ4WfS2mjYlQnT3T+GBUBtfcC5kJUdJURztDjnz+bHd05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067181; c=relaxed/simple;
	bh=5gNL1+joPFv+A8taufGpHzzsOasx7/mSVNI4zHAX2xE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GZdzdSSMh3OilXHINh6r7yOhBCkefPeGEifjoSGDs5PbL2ZUlM3Po6jldZF05XQJAZprpadahzWZ3GSEB6SnmxLjI3QhPBs3+J1Vf/ewUDGmYWNbo+cgf40EpSqKv+PhPaOxrYRzERSDUzY9C3t//2D6rMVFMc08bpLyjycTnMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TYfCsLim; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMdGax080063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:39:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067156;
	bh=eVOEhcbDt9yT3yG4Usb7aOTv5ilonnZtBSP58XbfVwM=;
	h=From:To:CC:Subject:Date;
	b=TYfCsLimUt4RJr/FJTIdZEvK8Rws7aCQUE73W3LiAonuYz4XMQON0YyXvsllYGLXz
	 wstvkSAEVbdWNzQuM0/WGoB9hPhyGbpfoeg1GgIB7cCW4z2SGq/K1HzNdVuX4ogv/3
	 SC4lp6Z5SvQiNtkfaZFypqebhxL0NBIpRfyhIVJI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMdGRj050641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:39:16 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:39:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:39:15 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMdFGU031266;
	Thu, 16 Jan 2025 16:39:15 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 0/1] Add TI TPS65214 PMIC MFD Support
Date: Thu, 16 Jan 2025 16:39:14 -0600
Message-ID: <20250116223915.430263-1-s-ramamoorthy@ti.com>
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

TPS65214 is a Power Management Integrated Circuit (PMIC) that has 
significant register map overlap with TPS65215 and TPS65219. The series 
introduces TPS65214 and adds the device to the multi-PMIC support driver.

This follow-up series is dependent on:
Commit d23b7176df4a ("regulator: dt-bindings: Add TI TPS65214 PMIC bindings")

TPS65215 Driver Series:
GPIO: https://lore.kernel.org/all/20250113225530.124213-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20250113230750.124843-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20250113231018.125426-1-s-ramamoorthy@ti.com/
Input: https://lore.kernel.org/all/20241226220049.398794-1-s-ramamoorthy@ti.com/

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9

Shree Ramamoorthy (1):
  mfd: tps65214: Add support for TI TPS65214 PMIC

 drivers/mfd/tps65219.c       | 126 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/tps65219.h |  65 ++++++++++++++++--
 2 files changed, 184 insertions(+), 7 deletions(-)

-- 
2.43.0


