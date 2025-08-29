Return-Path: <linux-omap+bounces-4407-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB21B3B782
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 11:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34C71CC0451
	for <lists+linux-omap@lfdr.de>; Fri, 29 Aug 2025 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74F6305045;
	Fri, 29 Aug 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZYXAHabK"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5472E54D7;
	Fri, 29 Aug 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459826; cv=none; b=U4KLLmZKtBDgfG9c0hKxWzoONiKTTI8sEHM+ZsJPinPussC2IaRLBMUUSqQGdgaSZi2kt5QEgdzkMpvkR9YMb/bOMIdZT1fQkROdahVTUO1eRyb9hSUD3ucoq1CuyZ4aqLZ7ub8dtiU+nVxIarZmaACjtnk8QDkv71JcEuyH92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459826; c=relaxed/simple;
	bh=RoBNXreDZ6pTrLjQsO3vOZ3KrVen9ONPBvH66SoF78I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WW/0KqOEr7uRfnRgYvXKe0SllsyovnyjSZm8LXrjzcTnwNJMoXJ/fcutc9eM2Ls6pYwiFjeIMIGOE8FvM4nrgDniMtEgFR/BaPwbFdxNQhjhGaUurD/Z4bG1Z5ypaRTavnJanHpoOqRfQGrGeZ+ZnjlNpnRJAHbXZIMGUnOtdmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZYXAHabK; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T9TtNu1775756;
	Fri, 29 Aug 2025 04:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756459795;
	bh=Q0MMljDmDK3QxLk1J9FQAb5zxayhQ3u81WbdXJkTp5U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZYXAHabKnPrGmYmSe0ORRiCrdKSVpJYDIDeAlby3tEPRvIx5Xc/0F5ZAN4iFT9qEu
	 sqaY8NblF8t8JZuMenB9cDrd4usb2eVjoe8hdX3yrxdEU5cmzOOOcWeP9w9mezhgdC
	 0pHcv7xchfqvEpXTZ4ewRKh4LqH8dRQOhQv81sk8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T9Ttvm3918837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 04:29:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 04:29:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 04:29:54 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.237])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T9Tmoi1850123;
	Fri, 29 Aug 2025 04:29:52 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 1/2] bus: ti-sysc: Add DRA7 SoC matching
Date: Fri, 29 Aug 2025 14:59:46 +0530
Message-ID: <20250829092947.855974-2-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829092947.855974-1-a-dutta@ti.com>
References: <20250829092947.855974-1-a-dutta@ti.com>
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
to ENXIO and the module gets probed under "certain conditions".

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


