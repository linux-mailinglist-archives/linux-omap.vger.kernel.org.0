Return-Path: <linux-omap+bounces-2837-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6C9F57FC
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16E4188B259
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755681DB363;
	Tue, 17 Dec 2024 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wAvMk859"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403C38DFC;
	Tue, 17 Dec 2024 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468346; cv=none; b=a7PQBsHNsV9sA44BWb79ncEo2K9QOO3p5GssQ1e2RoxSIGxadJHz4x2QFjzoqBU/HQMJ/LpZLJWkvDoNeS9FQST6v+prn/CJvQvfXhNU4NkJBsDN71/y7BZhKwPkSSZFy4jV3yk+Zn24Yht9ekMc2mZG3oNx6XDkYLezb9rz//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468346; c=relaxed/simple;
	bh=cNXRFtyTRJf7SaLbQYiA/Y3vgc+vWLsRr65qFvH17Fo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMlWTzMha3YTJcLIonRskGdfejZFVRD/+RPp4Ggf/CPP6qFl7HZH9DWHlecKJNxB0tzHm3ly0fIuFvPoNeVFYEmoF+X8BmuaXaRToN/Pl60BY6MMM42uFmn9DENWKVOpUTSIHYFbo55GBW+0T98HiMSOLGEAV7ZRLtrplYi7ly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wAvMk859; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjRQe056652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Dec 2024 14:45:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468327;
	bh=n1ZMyHRLZgw0n68nTZPSThSj5mXsTB9oMwUSDIld2Q8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wAvMk859RFrGC3AGm+EmtC6bvm7llHmo7ojtJY3EjeHzc/R/Dzl1nQcwvQVXFKDq7
	 oVaPXLsE9qeQ7jp3q9ez2jF3gM+CgQVsx/HsG+QEySb7MCXAtQi5noKvGMpLGVKxVQ
	 BlRmI8HLdX2nix01+yiH1Lq1ZFMxqS8pBbhOWdVk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjRYm011336;
	Tue, 17 Dec 2024 14:45:27 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:45:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:45:26 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjQj3023682;
	Tue, 17 Dec 2024 14:45:26 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 3/4] regulator: tps65219: Remove MODULE_ALIAS
Date: Tue, 17 Dec 2024 14:45:25 -0600
Message-ID: <20241217204526.1010989-4-s-ramamoorthy@ti.com>
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

Remove MODULE_ALIAS because the same module alias is already generated by
MODULE_DEVICE_TABLE.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 5decf69f327a..f57a046f9dea 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -390,5 +390,4 @@ module_platform_driver(tps65219_regulator_driver);
 
 MODULE_AUTHOR("Jerome Neanne <j-neanne@baylibre.com>");
 MODULE_DESCRIPTION("TPS65219 voltage regulator driver");
-MODULE_ALIAS("platform:tps65219-pmic");
 MODULE_LICENSE("GPL");
-- 
2.34.1


