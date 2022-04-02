Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EF24F05F5
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 21:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiDBTyE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 15:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiDBTyE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 15:54:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B66AD1124
        for <linux-omap@vger.kernel.org>; Sat,  2 Apr 2022 12:52:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z12so10494725lfu.10
        for <linux-omap@vger.kernel.org>; Sat, 02 Apr 2022 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fzoEK31DexWCIncO8BCp6nS9GlduAyvTu4PpNlc7FA=;
        b=qThg6nlptoCbwHk3yrqpwgRWQTpMpxD7GpKMoDkAgkjEyt7j5wm1iHytrJZU8rIoTJ
         YUnL3P2xUhmqbZ9foHlsYSlM+LHT2+lY0aR8EIO9iVUOs0X1SbetrNOVsEWNV6WiO5T/
         wsMLKOXHbWbGuXQv2RHyhnQsm6Qi4RkFfQ3VU1KP1SwS1tdlyQUmmOARKPA92IPxEPdp
         OwQbcNPClCos5aBk6Q90PpLLuMtAxfKdsGr8xXpTSUNI52j7kqHGOu8Ff4E1jMVDseZ5
         neogHG9u/C+SXQIvvfu3aBgTKqH6szMqg1gbxcXAhzj2dYKjgp2Bef9xvBqixTJfx/wX
         xbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fzoEK31DexWCIncO8BCp6nS9GlduAyvTu4PpNlc7FA=;
        b=6JO2Au0dUejiyIgQ2t3myeNwPLcpNcxJlF3YdExQMOuTmpvP/A/Mtq7Jsukys2qWEd
         DCpj7GdhTOasU3n4rC906BKAYsdWUezvyvSr6eoxcStqeIHW/lkNs1tzWnw/4s/WvRb1
         AiVxKnGHf28Xob+SvLipqCmJShtu7DWifSIoIXUePwwfIXIZPyiA3Kj8F7dFOcQ7/ABf
         4WaE6u9PQ9UropovfXmbiti1O2itFjoBvv3NROP+Jtwl5lO1mSuMatsCIvA8hc0l6fmO
         Wky8M0ZLOtmsctGkd8ACSEvMaNAU7GTN2ToputygzzC8p/JJKNCHOG3Es9WuUGxBNiFy
         qwYQ==
X-Gm-Message-State: AOAM532WskNqYQZbkovo2tp6ui9ZClqYQIxwL/JO60Byoh3QfbxiXhFU
        v1BCSC72/8EqlFkcUkuCF+k=
X-Google-Smtp-Source: ABdhPJzwEN7WYfdeAd/MfrZXfm+1RjrRb4kUGZ4BwQ3/fhp4Qopm/yCaeCQo08QRbl5Vom24HIbMfA==
X-Received: by 2002:a05:6512:10c8:b0:44a:d432:9e28 with SMTP id k8-20020a05651210c800b0044ad4329e28mr7853164lfg.496.1648929129384;
        Sat, 02 Apr 2022 12:52:09 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id g3-20020a2e9e43000000b00244c60deb14sm573522ljk.15.2022.04.02.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 12:52:08 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
Date:   Sat,  2 Apr 2022 21:51:55 +0200
Message-Id: <20220402195155.141364-1-jmkrzyszt@gmail.com>
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

In preparation for conversion of OMAP1 clocks to common clock framework,
identify arch/arm/mach-omap1 local users of those clocks and update them
to call clk_prepare_enable/clk_disable_unprepare() instead of just
clk_enable/disable(), as required by CCF implementation of clock API.

Users which reside under /drivers will be updated via separate patches,
split out from v2 and already submitted.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/mcbsp.c    | 8 ++++----
 arch/arm/mach-omap1/ocpi.c     | 4 ++--
 arch/arm/mach-omap1/serial.c   | 6 +++---
 arch/arm/mach-omap1/timer32k.c | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
index f36c34f47f11..3ec2badff6af 100644
--- a/arch/arm/mach-omap1/mcbsp.c
+++ b/arch/arm/mach-omap1/mcbsp.c
@@ -44,8 +44,8 @@ static void omap1_mcbsp_request(unsigned int id)
 			api_clk = clk_get(NULL, "api_ck");
 			dsp_clk = clk_get(NULL, "dsp_ck");
 			if (!IS_ERR(api_clk) && !IS_ERR(dsp_clk)) {
-				clk_enable(api_clk);
-				clk_enable(dsp_clk);
+				clk_prepare_enable(api_clk);
+				clk_prepare_enable(dsp_clk);
 
 				/*
 				 * DSP external peripheral reset
@@ -63,11 +63,11 @@ static void omap1_mcbsp_free(unsigned int id)
 	if (id == 0 || id == 2) {
 		if (--dsp_use == 0) {
 			if (!IS_ERR(api_clk)) {
-				clk_disable(api_clk);
+				clk_disable_unprepare(api_clk);
 				clk_put(api_clk);
 			}
 			if (!IS_ERR(dsp_clk)) {
-				clk_disable(dsp_clk);
+				clk_disable_unprepare(dsp_clk);
 				clk_put(dsp_clk);
 			}
 		}
diff --git a/arch/arm/mach-omap1/ocpi.c b/arch/arm/mach-omap1/ocpi.c
index 380ea2de58c1..03cc48024fd6 100644
--- a/arch/arm/mach-omap1/ocpi.c
+++ b/arch/arm/mach-omap1/ocpi.c
@@ -73,7 +73,7 @@ static int __init omap_ocpi_init(void)
 	if (IS_ERR(ocpi_ck))
 		return PTR_ERR(ocpi_ck);
 
-	clk_enable(ocpi_ck);
+	clk_prepare_enable(ocpi_ck);
 	ocpi_enable();
 	pr_info("OMAP OCPI interconnect driver loaded\n");
 
@@ -87,7 +87,7 @@ static void __exit omap_ocpi_exit(void)
 	if (!cpu_is_omap16xx())
 		return;
 
-	clk_disable(ocpi_ck);
+	clk_disable_unprepare(ocpi_ck);
 	clk_put(ocpi_ck);
 }
 
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 9eb591fbfd89..5f591a836ab5 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -141,7 +141,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart1_ck))
 				printk("Could not get uart1_ck\n");
 			else {
-				clk_enable(uart1_ck);
+				clk_prepare_enable(uart1_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart1_ck, 12000000);
 			}
@@ -151,7 +151,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart2_ck))
 				printk("Could not get uart2_ck\n");
 			else {
-				clk_enable(uart2_ck);
+				clk_prepare_enable(uart2_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart2_ck, 12000000);
 				else
@@ -163,7 +163,7 @@ void __init omap_serial_init(void)
 			if (IS_ERR(uart3_ck))
 				printk("Could not get uart3_ck\n");
 			else {
-				clk_enable(uart3_ck);
+				clk_prepare_enable(uart3_ck);
 				if (cpu_is_omap15xx())
 					clk_set_rate(uart3_ck, 12000000);
 			}
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 780fdf03c3ce..049c7b7f28c4 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -180,7 +180,7 @@ int __init omap_32k_timer_init(void)
 
 		sync32k_ick = clk_get(NULL, "omap_32ksync_ick");
 		if (!IS_ERR(sync32k_ick))
-			clk_enable(sync32k_ick);
+			clk_prepare_enable(sync32k_ick);
 
 		ret = omap_init_clocksource_32k(base);
 	}
-- 
2.35.1

