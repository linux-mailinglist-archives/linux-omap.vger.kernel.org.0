Return-Path: <linux-omap+bounces-1902-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6594FE24
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 08:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D0428496B
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2024 06:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A744393;
	Tue, 13 Aug 2024 06:56:58 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7D42A93
	for <linux-omap@vger.kernel.org>; Tue, 13 Aug 2024 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723532217; cv=none; b=MCkg/QcOeE/93ECV9exXvkPGwRb9HYKzOw/D32oQ7QIzeOmxVmsIpGVrlIsYgrLkTM4D2+PhYjaIKg9HPGmQ9sNylQMXqIS/6KDn5ZTF0XAfQU8LiPzL067QiDFtNRwTGftZqvaOIfUW3oG7/OBfZnRivvPeOsVQSg04PHct/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723532217; c=relaxed/simple;
	bh=Cd/fOl0a5KGV2VLC/88jBttTw8pCfwMtRlXMahDIdRE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tnfd4V8nrZeJdI3nzsX9P2cW/ZnN0la3B2ws8F7GX7yKsg+Yhb/CPIwSDwNmR7MoC7MawnCv9qfL+RZmQQy5hKSXQ/Ep7L492NjL5V6FLgW2dj1iKsf64AakEIGYlqRy/xCBAMVC2/6A+vZ5wApcvKxz3pZ/OOZMGca7lVcgzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WjhwZ6mhJzpTVZ;
	Tue, 13 Aug 2024 14:55:26 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id E590118006C;
	Tue, 13 Aug 2024 14:56:45 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 13 Aug 2024 14:56:45 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <aaro.koskinen@iki.fi>, <jmkrzyszt@gmail.com>, <tony@atomide.com>,
	<linux@armlinux.org.uk>, <cuigaosheng1@huawei.com>
CC: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] omap: mux: Remove unused omap2_mux_init() declaration
Date: Tue, 13 Aug 2024 14:56:44 +0800
Message-ID: <20240813065644.1037593-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The omap2_mux_init() has been removed since
commit c9d8230e316a ("omap: mux: Remove old mux code"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap1/mux.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap1/mux.h b/arch/arm/mach-omap1/mux.h
index 3e7ed3348a55..3f040e0cece2 100644
--- a/arch/arm/mach-omap1/mux.h
+++ b/arch/arm/mach-omap1/mux.h
@@ -139,6 +139,4 @@ extern int omap_mux_register(struct omap_mux_cfg *);
 static inline int omap1_mux_init(void) { return 0; }
 #endif
 
-extern int omap2_mux_init(void);
-
 #endif
-- 
2.25.1


