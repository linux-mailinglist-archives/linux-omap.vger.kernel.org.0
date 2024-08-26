Return-Path: <linux-omap+bounces-2011-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7595E77B
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 05:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4011C1C2111B
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 03:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA9A2C1AC;
	Mon, 26 Aug 2024 03:58:29 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10C25622
	for <linux-omap@vger.kernel.org>; Mon, 26 Aug 2024 03:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724644709; cv=none; b=PznDMb8rree3/IEp/Ko4bb217rx9eQEgUw/VZcd5sU3LidFGWosFL/1LKDzpDsXlM72yOOH4f6Bwqse2lZkpzdoZEVlGZIhq7sQMk8Df6Vu2S2iJQa4P3lDTXhPVYdXJx72TcLOW2WMU6JomyOezLMmdMVP1b0U3vJKvBxe1Xp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724644709; c=relaxed/simple;
	bh=rpFWbZ45gnsuIKknVW6SziZL92Ou7H7A70TbSIu8Aws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F2KqQB5rzYO1b3kbl1pcB0F2Sk2xvojtEHaxRaqy+aYI7KDYQwe2VGVd1a9lp6t5J8EXXm33UPHMJaEMzHbT0eewwHChhyAlgWpKM66Ii9ei5uMEGWVLBLS1AMhSV1JvjKZzbn7aocntjAMzkmtA/eGVC2DwFlceywnUkSGaRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WscGp1R3sz20mcy;
	Mon, 26 Aug 2024 11:53:38 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B1DE1A016C;
	Mon, 26 Aug 2024 11:58:25 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 26 Aug 2024 11:58:24 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <cuigaosheng1@huawei.com>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
	<khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH -next] ARM: OMAP2+: Remove obsoleted declaration for gpmc_onenand_init
Date: Mon, 26 Aug 2024 11:58:23 +0800
Message-ID: <20240826035823.4043171-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The gpmc_onenand_init() have been removed since
commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand"), and now
it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 include/linux/omap-gpmc.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
index 082841908fe7..c9e3843d2dd5 100644
--- a/include/linux/omap-gpmc.h
+++ b/include/linux/omap-gpmc.h
@@ -84,13 +84,3 @@ extern void gpmc_read_settings_dt(struct device_node *np,
 struct gpmc_timings;
 struct omap_nand_platform_data;
 struct omap_onenand_platform_data;
-
-#if IS_ENABLED(CONFIG_MTD_ONENAND_OMAP2)
-extern int gpmc_onenand_init(struct omap_onenand_platform_data *d);
-#else
-#define board_onenand_data	NULL
-static inline int gpmc_onenand_init(struct omap_onenand_platform_data *d)
-{
-	return 0;
-}
-#endif
-- 
2.25.1


