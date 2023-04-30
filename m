Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A256F2A16
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 19:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjD3R4n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 13:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjD3R4n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 13:56:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2B810E7
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 10:56:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so2130403e87.3
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682877400; x=1685469400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tH/fPIPAR93+kqzc2JH6LiFP6rsFGmQ1+/EiMIjFhpY=;
        b=gpY2T7MHyMaePK0YR6a1AiU0/6OAhOTQSdu+NZunFb1N1f5PJ8w6twvPkTBhiOSbzh
         pGEIkk7m8Dvq64Q9f5/8UmCkxkP303RxUQYy304CmkK9mkA4QhuzzovsLDpnQKbcGK3P
         HlNMYXdPt54Hc7wECYHADIx9x7+bEtVuo+FsvECsO6jmnrV55EC4HAd8Tb4GQ1nb7X1g
         vs87zi6ZvwKwMJ6U0FccEbYyWYJXZTsWGlB2uZv6GG1ddxCyrljhqSQhHcZMVpOuEL8d
         s7C41vLoPhLCwk0C5UfWOneEZdrBYcTcoi2MKApx2QqNKunVwQ4iYFFWGjQtxvJwGQJc
         ++jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682877400; x=1685469400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH/fPIPAR93+kqzc2JH6LiFP6rsFGmQ1+/EiMIjFhpY=;
        b=At105ED+WKrmxwPLQ5Yc0ekPQZhzQA0u/pOE7kvMBaHfLEh1zsAqCDrOZmGcsHJXaf
         JB85mOhckI/ILhDLGnhCygw+xGmBgPuxN5EfTEfPq39bpB7C4/lEZtC4eSSuYbeFtMX7
         mwYvDohjUh/J2eGK2Fj2Sfr9m1iwYEjUQX1TyaBZZt5+dttvQKHZcDNX6XegQt1vcKcU
         xzO2g5Np6UExlRuuw7h9+5EVhsC00p9MzlF+dfJYjvAHmp6bqawPBmgtnFlpv4lcn9dc
         YAzeRGS3BFxiLG5OM3JFC371ZjH7SGMjax+aOlw+4rVvusqLR4TB/x6i+2LOH5pBwvVL
         qKvA==
X-Gm-Message-State: AC+VfDxK8UmZHZhDP7leeLcNCmz1ygVwitVYzg7uZGVbHVG6Rl30TqWz
        GkIhhnoHuVcg+gliZY0K8x6kL2eOliFfyye1VQg=
X-Google-Smtp-Source: ACHHUZ7kSG5ZEfLZugUOQa2TLiLALzukxw+E7oEJrkpogIeSg8+Iykn50OuCrYIongm9zNtqwPjuTw==
X-Received: by 2002:a19:c213:0:b0:4eb:18d:91df with SMTP id l19-20020a19c213000000b004eb018d91dfmr3040988lfc.27.1682877399998;
        Sun, 30 Apr 2023 10:56:39 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9783000000b002a76b9e4058sm4284592lji.43.2023.04.30.10.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 10:56:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap1: Exorcise the legacy GPIO header
Date:   Sun, 30 Apr 2023 19:56:37 +0200
Message-Id: <20230430175637.575120-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After fixing all the offending users referencing the global GPIO
numberspace in OMAP1, a few sites still remain including the
legacy <linus/gpio.h> header for no reason.

Delete the last remaining users, and OMAP1 is free from legacy
GPIO dependencies.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tony et al: this concludes my OMAP1 legacy GPIO removal
series.

If/when people are happy with the patches I can make a
pull request to Tony or the ARM SoC tree to fix it all
once and for all.
---
 arch/arm/mach-omap1/devices.c  | 1 -
 arch/arm/mach-omap1/gpio15xx.c | 1 -
 arch/arm/mach-omap1/gpio16xx.c | 1 -
 arch/arm/mach-omap1/irq.c      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index 5304699c7a97..8b2c5f911e97 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/arch/arm/mach-omap1/gpio15xx.c b/arch/arm/mach-omap1/gpio15xx.c
index 61fa26efd865..6724af4925f2 100644
--- a/arch/arm/mach-omap1/gpio15xx.c
+++ b/arch/arm/mach-omap1/gpio15xx.c
@@ -8,7 +8,6 @@
  *	Charulatha V <charu@ti.com>
  */
 
-#include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/soc/ti/omap1-soc.h>
 #include <asm/irq.h>
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index cf052714b3f8..55acec22fef4 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -8,7 +8,6 @@
  *	Charulatha V <charu@ti.com>
  */
 
-#include <linux/gpio.h>
 #include <linux/platform_data/gpio-omap.h>
 #include <linux/soc/ti/omap1-io.h>
 
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index bfc7ab010ae2..af06a8753fdc 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -35,7 +35,6 @@
  * with this program; if not, write  to the Free Software Foundation, Inc.,
  * 675 Mass Ave, Cambridge, MA 02139, USA.
  */
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/sched.h>
-- 
2.34.1

