Return-Path: <linux-omap+bounces-1904-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200C94FE6D
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 09:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA84D1F24150
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 07:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9CD44C97;
	Tue, 13 Aug 2024 07:11:31 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813EC433DF
	for <linux-omap@vger.kernel.org>; Tue, 13 Aug 2024 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533091; cv=none; b=U029DOrPKkfNqCimRWueCoVWOC1alcQIC7ue+ZnAILCRWdM+PvyhYQiKr6xB+wTteD+xsjZWKpw5wT7aLDLkyqmfbiCd51Z0vOgUA/1t2T7Sf1V8TC9wMibIB1bZ7WhGBQKutcLowLmpWMPCOHTNeGGKl4jdslD8B0colyPAN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533091; c=relaxed/simple;
	bh=0uRYMNC7WBoC60CqAU5zHC4tIgow+Pv4pn0A8YIM8EQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=opVLd5QJCopzH/w2p+vu3th+2kDLI9xds9u4RWP/pTJ+HLRzw56yL3o3i2mA2Oy7WGh7bmX5f8L/iJq6Sw6D7paI8VZ/FK3W0JRTbHvajomYuBEzh7xfDSFFCN7QW3UbZ3uLJ3tX0QbsK/5TOUtA5+9ZWHKOf5+M93sgbDpJfKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WjjFW1nMCzpTVG;
	Tue, 13 Aug 2024 15:10:07 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E7B11400DC;
	Tue, 13 Aug 2024 15:11:26 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 15:11:25 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <khilman@kernel.org>, <aaro.koskinen@iki.fi>, <jmkrzyszt@gmail.com>,
	<tony@atomide.com>, <linux@armlinux.org.uk>, <cuigaosheng1@huawei.com>
CC: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h
Date: Tue, 13 Aug 2024 15:11:25 +0800
Message-ID: <20240813071125.1044697-1-cuigaosheng1@huawei.com>
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

The omap1510_idle_loop_suspend/_sz() and omap1610_idle_loop_suspend/_sz()
has been removed since commit feb72f3b313e ("ARM: OMAP1: Remove
omap_sram_idle()"), so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap1/pm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-omap1/pm.h b/arch/arm/mach-omap1/pm.h
index d4373a5c4697..b2763fb097ea 100644
--- a/arch/arm/mach-omap1/pm.h
+++ b/arch/arm/mach-omap1/pm.h
@@ -114,13 +114,9 @@ extern void omap1_pm_suspend(void);
 
 extern void omap1510_cpu_suspend(unsigned long, unsigned long);
 extern void omap1610_cpu_suspend(unsigned long, unsigned long);
-extern void omap1510_idle_loop_suspend(void);
-extern void omap1610_idle_loop_suspend(void);
 
 extern unsigned int omap1510_cpu_suspend_sz;
 extern unsigned int omap1610_cpu_suspend_sz;
-extern unsigned int omap1510_idle_loop_suspend_sz;
-extern unsigned int omap1610_idle_loop_suspend_sz;
 
 #ifdef CONFIG_OMAP_SERIAL_WAKE
 extern void omap_serial_wake_trigger(int enable);
-- 
2.25.1


