Return-Path: <linux-omap+bounces-2841-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB039F580C
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BEE188DDBC
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACE91F9EB1;
	Tue, 17 Dec 2024 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rakZ/KAx"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA41F9AAD;
	Tue, 17 Dec 2024 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468363; cv=none; b=ne7eOR0O3WpDGzHN0fP03c2/Qy0TN9tUbU+K3kQ6yuYKVB7k1YOq2Vrg/qfXZAeDD3g3rWFHD1YkgQx/sogenVcUCV36DMfd+tNnllqMeaPyL3jxjZ2LaI+TW75H7U6kozQ9DxbhkujRhRPVYskNGe643AbxouhN3g2d6G3xaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468363; c=relaxed/simple;
	bh=YOI6h8XUIB/90wiMiXASh+OZXUQzf7Ce6dLej9RDjWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BwOF7eMlzr9Z2Yn7XPmSPBsfLO3pPxzxjIsIJlxF5Mizm9bJHU7PcxoRAVOBEhMT/8mw+fVBXxpZT02csEj40o+f+oHowan8m0hfleyd5QIDBCs4lnvUBkZg2j7TEYEVxmHQ6LuRz1cWzQ4yHja4eB2KQuP/KLuXG5k5f05+VLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rakZ/KAx; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjRJK038606;
	Tue, 17 Dec 2024 14:45:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468327;
	bh=CIZma+nxV4y+meHOQX9kEBGIzHgsRLLP2aNuGZUN7Zs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rakZ/KAxRJ2VJp9ROCGfJJpVW58vD7MUqL3szgHBVlbc9ya1+b6dBmjs2zV+Pt9Of
	 3gTEFQRBGelJcjW0kJZ5xAfTuGnCzpJjv9taVcrtQe2GXlJ8TKjb497GSMFmz4tL+V
	 bVLjUWAWzLMfcg2nbzxr+9QZQKe62PrCdqHb3FUE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjR49020477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:45:27 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:45:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:45:26 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjQj2023682;
	Tue, 17 Dec 2024 14:45:26 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 2/4] regulator: tps65219: Update driver name
Date: Tue, 17 Dec 2024 14:45:24 -0600
Message-ID: <20241217204526.1010989-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
References: <20241217204526.1010989-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Follow the same naming convention in tps6594-regulator.c with
tpsxxx-regulator instead of tpsxxx-pmic.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 14d843a99d0f..5decf69f327a 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -379,7 +379,7 @@ MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
 
 static struct platform_driver tps65219_regulator_driver = {
 	.driver = {
-		.name = "tps65219-pmic",
+		.name = "tps65219-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = tps65219_regulator_probe,
-- 
2.34.1


