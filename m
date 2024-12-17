Return-Path: <linux-omap+bounces-2844-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04029F5816
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 21:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7BAE7A36FA
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2024 20:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB241F8AE7;
	Tue, 17 Dec 2024 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v6fofImU"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C641DA10C;
	Tue, 17 Dec 2024 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468588; cv=none; b=U3/J+bvJgN9exru10xoelJZnvWudvENdZmKY+hJurB3/hjt2wXM4PLEU7MHd5GDJdIT9ePfOFB+fxHLFEgTeQY65wyt++gfEFuAdO5BvpovKXkw00v2PF4x1ESkhydSd7UFdm09cDZi/c2DjN32QdjH9IZ7eVqYCLhSNy2dPsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468588; c=relaxed/simple;
	bh=TBIAI0KbaZKKy12fWhjv4+5VlK7GSnTG6wl2N2kru0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtYWflPEtRpApaYHNNBJNBNWiMRAoH6SK3PmIF+T4zyFYJ7GU/L/6Y3tONW+g1pWYXl8a/VSYsRiLq8vj8/LdrOcWnmaqOeEbcbLv1e+h1etycBojFE7PRLvZYmUDjjqAOZP1ZF2LZgqAWGErXG1YHtn5AZAd7b+K7jbCxo6X20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v6fofImU; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKnZYS057062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:49:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468575;
	bh=6hr+nb0eMhjzs66rKOS0CfHiJ25UR5bzMYAS5I+4flw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=v6fofImU1P4xVPVr1YxGrrxTxm1ZMYThD79tbzH5zNTHPqBnX27XgUh/QQv2/7hCt
	 z5t6563jSIBnOb1igNJqrxiJ8OjSPDPmPSyHCJC5zNJxSyFOWIZ588fTA0m+7FZ59v
	 Upw6uFiy4nhO9BXiwFgDIG79p05CrO+ekxJBmJNA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKnZrN022531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:49:35 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:49:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:49:35 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKnZID097729;
	Tue, 17 Dec 2024 14:49:35 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 2/2] mfd: tps65219: Remove unused macros & add regmap.h
Date: Tue, 17 Dec 2024 14:49:35 -0600
Message-ID: <20241217204935.1012106-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
References: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

These macros are not used by the driver, and the structs are accounted
for with the addition of the linux/regmap.h file.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 include/linux/mfd/tps65219.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index e6826e34e2a6..546bceec7173 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -10,14 +10,9 @@
 
 #include <linux/bitops.h>
 #include <linux/notifier.h>
+#include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 
-struct regmap;
-struct regmap_irq_chip_data;
-
-#define TPS65219_1V35					1350000
-#define TPS65219_1V8					1800000
-
 /* TPS chip id list */
 #define TPS65219					0xF0
 
-- 
2.34.1


