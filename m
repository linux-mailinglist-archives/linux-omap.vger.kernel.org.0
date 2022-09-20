Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC75BE695
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 15:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiITNBS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 09:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiITNBP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 09:01:15 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6169C63F04
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 06:01:14 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MX1lk6Yt3z14QvN;
        Tue, 20 Sep 2022 20:57:06 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 21:01:12 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <paul@pwsan.com>, <tony@atomide.com>, <linux@armlinux.org.uk>,
        <khilman@kernel.org>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
        <cuigaosheng1@huawei.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] ARM: pxa: remove orphan colibri_pxa3xx_init_mmc from arch/arm/mach-pxa/colibri.h
Date:   Tue, 20 Sep 2022 21:01:10 +0800
Message-ID: <20220920130110.1104272-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
References: <20220920130110.1104272-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All uses of colibri_pxa3xx_init_mmc() have been removed by
commit 9b6956f45132 ("ARM: pxa: Push Colibri evalboard MFP
into module files").

So remove the orphan declaration and the unused inline function.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-pxa/colibri.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-pxa/colibri.h b/arch/arm/mach-pxa/colibri.h
index 01a46f36cc1f..f44046f87983 100644
--- a/arch/arm/mach-pxa/colibri.h
+++ b/arch/arm/mach-pxa/colibri.h
@@ -30,12 +30,6 @@ static inline void colibri_pxa270_income_boardinit(void) {}
  * common settings for all modules
  */
 
-#if defined(CONFIG_MMC_PXA) || defined(CONFIG_MMC_PXA_MODULE)
-extern void colibri_pxa3xx_init_mmc(mfp_cfg_t *pins, int len, int detect_pin);
-#else
-static inline void colibri_pxa3xx_init_mmc(mfp_cfg_t *pins, int len, int detect_pin) {}
-#endif
-
 #if defined(CONFIG_FB_PXA) || defined(CONFIG_FB_PXA_MODULE)
 extern void colibri_pxa3xx_init_lcd(int bl_pin);
 #else
-- 
2.25.1

