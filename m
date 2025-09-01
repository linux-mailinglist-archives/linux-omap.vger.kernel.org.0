Return-Path: <linux-omap+bounces-4434-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C1B3DFE6
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 12:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80E6440B58
	for <lists+linux-omap@lfdr.de>; Mon,  1 Sep 2025 10:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8BC30FC1F;
	Mon,  1 Sep 2025 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D89SC8OH"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3899130AD02;
	Mon,  1 Sep 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756721755; cv=none; b=pZg5owsokNQTN8iKn91sjYGpilu+zi9ZwzkP+hIwYHPzvz7hbfvF3XrjGdC+9AiqErlsPv2g4I4QwoS054cY4lUE7Zf4FX2/8tye/BF6Fqszn9x3ewz7ffVjItou4eDn3aIPMwB07v62gJGVwQGzRkFhHhnx28jVkEXHni5H4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756721755; c=relaxed/simple;
	bh=zIcrzw6TL6zyle5IVpzx7t1ozRLs4iTla+xQD7hMd8U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3AoTxoEmVkrAjfYrKa/5+chdI+Opz2yo7qisGjFCx2zkLkaq79IUPww42Jrg3MZJGVqOw5Rq3693E8wjnIMugXWiQuU1WA0LUTtWCq9wMF+7EJrnf5K1619Pc3RtSkYR1iiaO1F1DsmEIu8MlhAlIVhYt6JMSz66RVKLuYuqn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D89SC8OH; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581AFWuo2350247;
	Mon, 1 Sep 2025 05:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756721732;
	bh=FGm2vmsIh7BDsFYc7DX3BbZlQOoHSUGuJH2eHrg5Nd8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=D89SC8OH/z4uxUV/Gxmer9f+0V8qaQ9kE0V3WMx4xpCXyLTnOuatZ2cjpk4jME5OE
	 VcU8Rfvivaw+mJ653kFixSZFqhVzsubr/g2apAdoXZ5kgtN01y8e05h4BGgHA/+xUO
	 4yTYDcPV+IdR1fsikvPiNXMchtG22ywMlB8hSmas=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581AFWDu1475714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 05:15:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:15:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:15:32 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581AFPrZ2047319;
	Mon, 1 Sep 2025 05:15:29 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v2 1/2] bus: ti-sysc: Add DRA7 SoC matching
Date: Mon, 1 Sep 2025 15:45:24 +0530
Message-ID: <20250901101525.1090334-2-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901101525.1090334-1-a-dutta@ti.com>
References: <20250901101525.1090334-1-a-dutta@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Sinthu Raja <sinthu.raja@ti.com>

Kernel Commit 25de4ce5ed02 ("clocksource/drivers/timer-ti-dm: Handle
dra7 timer wrap errata i940") states that "There is a timer wrap issue
on dra7 and as a work around, we need to use timer-ti-dm percpu timers
instead. So, configure dmtimer3 and 4 as percpu timers by default." In
this commit, the author has used ti,no-reset-on-init and ti,no-idle quirks.

The sysc_check_active_timer() checks for these quirks and accordingly,
returns EBUSY error if the quirks match. Because of this, the timer
modules fail to probe as can be observed during bootup :"ti-sysc
4882c000.target-module: probe with driver ti-sysc failed with error -16"

Return 'ENXIO' instead of 'EBUSY' for DRA7 SoC, so that the error is set
to ENXIO. This tags the system timer as reserved and probes it without
probing any interconnected target child devices.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 5566ad11399e..90766f804706 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3117,7 +3117,8 @@ static int sysc_check_active_timer(struct sysc *ddata)
 	 * can be dropped if we stop supporting old beagleboard revisions
 	 * A to B4 at some point.
 	 */
-	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35)
+	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35 ||
+					 sysc_soc->soc == SOC_DRA7)
 		error = -ENXIO;
 	else
 		error = -EBUSY;
-- 
2.34.1


