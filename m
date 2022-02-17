Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EFE4BAA97
	for <lists+linux-omap@lfdr.de>; Thu, 17 Feb 2022 21:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbiBQUGl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Feb 2022 15:06:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245667AbiBQUGl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Feb 2022 15:06:41 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831FB1E7
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 12:06:25 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f37so1312967lfv.8
        for <linux-omap@vger.kernel.org>; Thu, 17 Feb 2022 12:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+U20TDiI9vrXWGSFRa4Lg+MjXVh4ORPUTxC5hPPoqRY=;
        b=fgBkzxdeJezeTziXMC8DxQUk4rtG9UDMNHF0gj23J3G/GQKrM5s39KjyWrrI+c6JxQ
         o5dsO8/c/qfC0VBmls61cbamyge4ml71R60CjasjS4zOOk7OUat5WZzOdiD7FDv8Ixvu
         GJMxbumsw8SYWUvvBPR89D2xVZQgg8ZhuKXXuLumMbxuD25OoQ21qUNF2lvK8cH8egZp
         ZBbMsrKMFiuQWAXKskg+lqEPywyMXMrzzwhqm/uD8ymDOymDselGagUq0T64tTDoLNdf
         lQiqkWz7Kx5LApJCxDAsJT0pxNUZ1OHqhKtPFRtoiY/ClGTnqoUZKrN4z514+jD/R+8v
         8R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+U20TDiI9vrXWGSFRa4Lg+MjXVh4ORPUTxC5hPPoqRY=;
        b=VFWhMh86FyhmjeNui/hMPrX23cMbGCGg8Jrkbl5jgOlKEyLu3l6uq610sOKfLwsHaZ
         T8uIHWYR42BevAE/ONvU+9qW0WpZW5FzcBtsY8BrhHehnWzcpjZccwv0UIeOkn43Hake
         1ZFmw7oKk/lHj1yF4Lw2y2FjkypPFbLo2zfFbTxAgpk9eKWUQ9QgQGZvq2AgT8jbcp1y
         AlCVMH8TSZZl4GKVLED9PFqwBropggtjP1J2Iyax3x/yoObCE5HUOblNNYoeTpMN3uc2
         pFI5/DwLDaTdu1dvEkx4TIK7y+Xw7oa0bMUlRPX90dAO8rfnHvzrBU2BdSO+1G6C0IQy
         v4lw==
X-Gm-Message-State: AOAM5326dkxonbaOFb5/MeiEttlAzUZ5d2CZD8knJli19ceb2EloDoH4
        LWPXIza+GvGPGQ23EQ9q1XQ=
X-Google-Smtp-Source: ABdhPJy68mgWekGRNL2Jy+ovOpm7OKzgfRnKLRLm5LUnja+UKV6dXx9crOg0qx6v1UgfnLWod7+OTw==
X-Received: by 2002:a05:6512:46f:b0:443:77fa:f857 with SMTP id x15-20020a056512046f00b0044377faf857mr3167285lfd.140.1645128383744;
        Thu, 17 Feb 2022 12:06:23 -0800 (PST)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id k9sm55768lfo.155.2022.02.17.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 12:06:23 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Paul Walmsley <paul@pwsan.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC RFT PATCH] ARM: OMAP1: clock: Fix early UART rate issues
Date:   Thu, 17 Feb 2022 21:06:06 +0100
Message-Id: <20220217200606.415391-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit ef772f2ee31e ("ARM: OMAP: Fix CONFIG_DEBUG_LL") was supposed to fix
low level debugging, most possibly by early enabling UART clocks.  The fix
actually introduced early reset of most bits of MOD_CONF_CTRL_0 register,
with the exception of UART1 and UART2 clock related bits which were set
high.  However, UART1 clock bit can play different roles on different
OMAP1 variants.  On OMAP1610 it enables the clock as intended, but on
OMAP1510 it switches the clock rate from 12 to 48 MHz.  Even worth, for
UART2 the bit changes its clock rate also on OMAP1610.  As a result, UART
rates set by a bootloader can be unintentionally changed early on kernel
boot and low level debugging broken, not fixed.  Besides, reset of all
other bits was not justified.

Don't touch register bits not related to UART clocks.  Also, don't touch
the bit of UART2 clock.  Make sure UART1 and UART3 are enabled early on
relevant OMAP1610 machine types while preserving bootloader UART clock
rates on others.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Tested only on OMAP1510 ams_delta.

 arch/arm/mach-omap1/clock_data.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 3ebcd96efbff..7a7951a63bc2 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -767,11 +767,11 @@ int __init omap1_clk_init(void)
 	u32 reg;
 
 #ifdef CONFIG_DEBUG_LL
-	/*
-	 * Resets some clocks that may be left on from bootloader,
-	 * but leaves serial clocks on.
-	 */
-	omap_writel(0x3 << 29, MOD_CONF_CTRL_0);
+	/* Make sure UART clocks are enabled early */
+	if (cpu_is_omap16xx())
+		omap_writel(omap_readl(MOD_CONF_CTRL_0) |
+			    CONF_MOD_UART1_CLK_MODE_R |
+			    CONF_MOD_UART3_CLK_MODE_R, MOD_CONF_CTRL_0);
 #endif
 
 	/* USB_REQ_EN will be disabled later if necessary (usb_dc_ck) */
-- 
2.35.1

