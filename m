Return-Path: <linux-omap+bounces-3741-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA120AC5A60
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 21:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B39E616B8DE
	for <lists+linux-omap@lfdr.de>; Tue, 27 May 2025 19:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0049D2820B7;
	Tue, 27 May 2025 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oENNXdiS"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8E5280A5F;
	Tue, 27 May 2025 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372718; cv=none; b=B9+kNXmK2jfOGLWdDb9f7InelDk4VPEWJWk7L3KAcDNjSdfSvKgFj7CvMBSda/o8WHMK4LKE5k8g/bBcpO/B+HigWsuj5xNYgJyhQcPXrP1+vdduwfhKh8l2lmSA+pDGhdU2Tfk59sCnS1wiUMHK3Iv9GAGpXfFQBIq9Int4Mo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372718; c=relaxed/simple;
	bh=ckblmtnoGdjYWvgBzZSWCc3EJjTaUp2SFihxEwTFxCA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMIIuSzOGn861MFGWtiZOIg0RkC5A96sSwlE+Ssypa3PKiePrbbqOCAIJ27qEIrI6tFUVMzuIi3cwqLXISjPGr6egn5uwMDHdF1uEbFrLYBwFyrmDcFxY3bQ7lrpOAKDhwT00Wz0emblborTyHojMUc9EC/nwWp4XeHJaeS4qT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oENNXdiS; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54RJ4teq1848154;
	Tue, 27 May 2025 14:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748372695;
	bh=9stycSswd791X6qRlyUiAsWHNY4Daq7bq21hDEYk+Ts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oENNXdiSqgaqnztaFxZvw8izAnBnURisdWwzhnd6XBJFhQOB2QVpCyqL8GuyFBHKU
	 FLwffN9LeIbjXs7PhWSr/SP4BroVClMPIx4c5rVZknGq+yPGas824+Pztv7K1HOqQs
	 pXkZW0dkIOM646Mpj9lk976aEpKmj68oZBTcnb54=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54RJ4tqJ930899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 27 May 2025 14:04:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 May 2025 14:04:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 May 2025 14:04:55 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54RJ4tcR3540893;
	Tue, 27 May 2025 14:04:55 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>
Subject: [PATCH 2/2] mfd: tps65219: Update TPS65215's MFD cell GPIO compatible string
Date: Tue, 27 May 2025 14:04:55 -0500
Message-ID: <20250527190455.169772-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527190455.169772-1-s-ramamoorthy@ti.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch reflects the change made to move TPS65215 from 1 GPO and 1 GPIO
to 2 GPOs and 1 GPIO. TPS65215 and TPS65219 both have 2 GPOs and 1 GPIO.
TPS65214 has 1 GPO and 1 GPIO. TPS65215 will reuse the TPS65219 GPIO
compatible string.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

Fixes: 7f9ed27eead6 ("mfd: tps65219: Add support for TI TPS65215 PMIC")
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 297511025dd4..041a5b563951 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -195,7 +195,7 @@ static const struct mfd_cell tps65214_cells[] = {
 
 static const struct mfd_cell tps65215_cells[] = {
 	MFD_CELL_RES("tps65215-regulator", tps65215_regulator_resources),
-	MFD_CELL_NAME("tps65215-gpio"),
+	MFD_CELL_NAME("tps65219-gpio"),
 };
 
 static const struct mfd_cell tps65219_cells[] = {
-- 
2.43.0


