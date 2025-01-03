Return-Path: <linux-omap+bounces-2963-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5CA010A4
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51FF188512E
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C09F1C4A36;
	Fri,  3 Jan 2025 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q9MU4D6t"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FC1C1F2C;
	Fri,  3 Jan 2025 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945502; cv=none; b=emZqHyfuPdvziFFEVPTJOZHxcnexg7HTqkUpun5AWk1tWb4EuFiB5u02TLbTJYCsPHN8ErhtDz94ui7po6BFOv1QyalPmZnGtyKcrwRR3hi0O4FjyiNcg7C4VSlqsa6UgP+lipWGR5IIGXGE67mld1whqpei6LNbxoLXh/VjHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945502; c=relaxed/simple;
	bh=crk9YSD6JLgW8DWqdn1agc3CIrtDrSEQsWJqg2CwvXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fd90siLW3Ec6VJID/QOQbhN5EW6op3c+eq9VYMmUkk/NIW4o/yEv3k73MPjysMTw7QugMKfbgGgWu3k9I5BruS0a10jc4aig2Bha2rPLopyitCZOAjL+UmSKbb5I6btfNcoLapp/Nf35qfgnfSB5IKRFURdK/MhIyOJUC7N415Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q9MU4D6t; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kDF2151768
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 17:04:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945487;
	bh=tyVaq5FW+yE9cNTa2GL68Z/lhulLCmxsZ+WGlM2wlBg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q9MU4D6th+XBeetofwKXIqCsHCV9kzRAcjF8jueA5GQD5T1R0SI/dR5FbFm6BmMtQ
	 30WNvtxmPuv8D/z9umkMxEtXnlCOfUtYJ+Upq5L3hkdD/HVFInQd9TKFKQtJ0JYxTH
	 fF7DIyAsh8xngNh1JgJt5rOeJslugHPUNxGP4Qnc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kq2014647
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0N121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 5/7] regulator: tps65215: Update platform_device_id table
Date: Fri, 3 Jan 2025 17:04:44 -0600
Message-ID: <20250103230446.197597-6-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103230446.197597-1-s-ramamoorthy@ti.com>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add TI TPS65215 PMIC to the existing platform_device_id struct, so the
regulator probe() can match which PMIC chip_data information.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 30928f1f216f..6dc0829cf29a 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -404,7 +404,8 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65219_regulator_id_table[] = {
-	{ "tps65219-regulator", },
+	{ "tps65215-regulator", TPS65215 },
+	{ "tps65219-regulator", TPS65219 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
-- 
2.34.1


