Return-Path: <linux-omap+bounces-2838-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD679F5801
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C20B47A595A
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C791F9F44;
	Tue, 17 Dec 2024 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mb+Z2Sk3"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36C1F9ECD;
	Tue, 17 Dec 2024 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468350; cv=none; b=MubU+YNjqRVA42Yx7sX24zCy6G8X2kvxpOIMzSQRGjdZixYpXHJZM1jkNGG9zDbK63f/BnIEIV6APnbSDCWbDBpa5AUWfl2kmxpkCKtaV6LprpKvm7W/2nFxkGyofUs/bgsaAKHEaugdX4Qp9k0tzSYEyKEmQmWt4dW4UCF6iUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468350; c=relaxed/simple;
	bh=wqwX2LRN7Cvfj7zvG/L0j1RWpgnPCfXnXiwPiXsIasA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSRY9TklKpaQd22QrdH0i1DVIPnpjpsBSmxQgv6B7GPSu7CbIwOcly5bKLMmT6KecuvtCsFckAXkTCGCAEOkPx7a0qMZ7UK55F7yYu1SMfhtyqmEpO5ZrUW3wer1pv5+FuBKpqp0CsQqN8IkSTR7j+IOY1MgaDTuafdWt4Hmpfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mb+Z2Sk3; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjR46056650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:45:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468327;
	bh=9y776ljyRYJrbtd+o/avgDnfB90ofxXiFoP5bQB6CTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mb+Z2Sk37sE7LTKVt10zY6Dm1h5eCQwAFYHxCyxDE3jjal6pWIDD1CExflFg7y6hV
	 Q1d7f4wgDYX7x8mn2GXaIySwLqxr/BSc929PZj0OkatiS2JxoC7udDpEkpvzZpmq34
	 VZjKZu8MtCoud6A70Pz9nVWh552UQ9fvmN655V0s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKjRHo128936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:45:27 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:45:26 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:45:26 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKjQj1023682;
	Tue, 17 Dec 2024 14:45:26 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 1/4] regulator: tps65219: Use dev_err_probe() instead of dev_err()
Date: Tue, 17 Dec 2024 14:45:23 -0600
Message-ID: <20241217204526.1010989-2-s-ramamoorthy@ti.com>
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

Make the error message format unified by switching from dev_err() to
dev_err_probe() where there is a chance of -EPROBE_DEFER returned. This
helps simplify the error code where possible.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b4065356392f..14d843a99d0f 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -322,11 +322,11 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 		dev_dbg(tps->dev, "%s regul i= %d START", __func__, i);
 		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(tps->dev, "failed to register %s regulator\n",
-				regulators[i].name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+					"Failed to register %s regulator\n",
+					regulators[i].name);
+
 		rdevtbl[i] = rdev;
 		dev_dbg(tps->dev, "%s regul i= %d COMPLETED", __func__, i);
 	}
-- 
2.34.1


