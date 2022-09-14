Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459325B7F9D
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 05:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiINDqX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 23:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiINDqV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 23:46:21 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F536AA1A;
        Tue, 13 Sep 2022 20:46:19 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS5kc66dfzcjdB;
        Wed, 14 Sep 2022 11:42:32 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 11:46:17 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <rostedt@goodmis.org>, <mingo@redhat.com>, <linux@armlinux.org.uk>,
        <tony@atomide.com>, <bcousson@baylibre.com>, <paul@pwsan.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <stefan@agner.ch>, <rmk+kernel@armlinux.org.uk>,
        <linus.walleij@linaro.org>, <broonie@kernel.org>,
        <sebastian.reichel@collabora.co.uk>, <cuigaosheng1@huawei.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 2/3] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
Date:   Wed, 14 Sep 2022 11:46:14 +0800
Message-ID: <20220914034615.1240860-3-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
References: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

s3c64xx_device_spi1 and s3c64xx_device_spi2 were removed by
commit f1ba938e4f98 ("spi: s3c64xx: Delete unused boardfile
helpers"), so remove the declaration, too.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-s3c/devs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 02b0c5750572..991b9b2006a1 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -33,8 +33,6 @@ extern struct platform_device s3c64xx_device_onenand1;
 extern struct platform_device s3c64xx_device_pcm0;
 extern struct platform_device s3c64xx_device_pcm1;
 extern struct platform_device s3c64xx_device_spi0;
-extern struct platform_device s3c64xx_device_spi1;
-extern struct platform_device s3c64xx_device_spi2;
 
 extern struct platform_device s3c_device_adc;
 extern struct platform_device s3c_device_cfcon;
-- 
2.25.1

