Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AA0351BBA
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhDASKz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 14:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbhDASFj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 14:05:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD69CC02FE9A;
        Thu,  1 Apr 2021 09:05:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s17so2827084ljc.5;
        Thu, 01 Apr 2021 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqynJVVZ2cB44xaw315Sqcrb3lwmjqvG2iG56aPW2jw=;
        b=jcg7fuvsYT6tVNiLrSOyZ7mifgwD1llEGtiG0RN040hAWbzxEOEXmNn/4OiUVLiyWR
         JH4dmS0b4jw4r7bo2Y9SBET5mZRZcQh5l2tRdal/Y/7wkcEp9d2tsVAdbiLe8+c5SxeV
         v9H1jb0XZynFnhoGWfXAuJw5mIoPY30lTBgTk60xyTo8CbyUdvTNY1ktwRx6kiIuyzqU
         4PWYa2PavsJfJ3I5j26svNrsrdG+zikOg0x1J8EO/BIE94cBmLlt65o8KtSvxNpgZlsr
         +9jyLTfd1XoUjay5tkK/2Rdhk5X7cyZlJyOMSdvZIv737VHXjgzRAZ9T8iZdiopAcrnq
         oo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqynJVVZ2cB44xaw315Sqcrb3lwmjqvG2iG56aPW2jw=;
        b=P7+OEkz/ruG6GXZvFtGm8EcqyfEyXNQGo6Uu9KQMnIQWLPsVbZkPV2arxUUZN/4EV7
         FJGeLtm9ku9KnBGpfcQWZ7a28J6/D8f3mZtunAz4grntkdyYlO9BDVqCZtQ6rWxLzefR
         7ymURRxsVlOiNb/F/I45F9jgFviAEMOWBF9FgA7zBeQ5Q8ngzuCo2FNhIc1zzrKFFemT
         EQoXiuTC7OinnI4nEpkCLCZ1JWknRltNjp9EOg/NHbtg1sGnkNDZD31DRxJISBWk0610
         N1122wEw92uWaeyzAFI/7clL1hMWjdBFVeKmBiaWi+MWKnF85USMZ26NDgRUn7GE56Bd
         il7g==
X-Gm-Message-State: AOAM5310H105Bb9v6N2WDgYP2RkvniOL8fPoczm1icXoLjWCqMTgN4Hs
        GB/SI4AkmM9C9eQ1/2hUqfg=
X-Google-Smtp-Source: ABdhPJwa2eL2K1ph5ihS0er9vHmhhI76wYmFRO0aiNfMCkFSPr17ZtnJt89Hf1uUPJ3gOrSwW4RF8A==
X-Received: by 2002:a2e:2a44:: with SMTP id q65mr6064094ljq.238.1617293118156;
        Thu, 01 Apr 2021 09:05:18 -0700 (PDT)
Received: from 192.168.1.8 ([212.59.242.58])
        by smtp.gmail.com with ESMTPSA id f23sm582226lfc.283.2021.04.01.09.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:05:17 -0700 (PDT)
From:   Maciej Falkowski <maciej.falkowski9@gmail.com>
To:     aaro.koskinen@iki.fi, tony@atomide.com, linux@armlinux.org.uk
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        maciej.falkowski9@gmail.com
Subject: [PATCH] ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power
Date:   Thu,  1 Apr 2021 18:04:34 +0200
Message-Id: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ams_delta_camera_power() function is unused as reports
Clang compilation with omap1_defconfig on linux-next:

arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: unused function 'ams_delta_camera_power' [-Wunused-function]
static int ams_delta_camera_power(struct device *dev, int power)
           ^
1 warning generated.

The soc_camera support was dropped without removing
ams_delta_camera_power() function, making it unused.

Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
Fixes: ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
Link: https://github.com/ClangBuiltLinux/linux/issues/1326
---
 arch/arm/mach-omap1/board-ams-delta.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 2ee527c00284..1026a816dcc0 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -458,20 +458,6 @@ static struct gpiod_lookup_table leds_gpio_table = {
 
 #ifdef CONFIG_LEDS_TRIGGERS
 DEFINE_LED_TRIGGER(ams_delta_camera_led_trigger);
-
-static int ams_delta_camera_power(struct device *dev, int power)
-{
-	/*
-	 * turn on camera LED
-	 */
-	if (power)
-		led_trigger_event(ams_delta_camera_led_trigger, LED_FULL);
-	else
-		led_trigger_event(ams_delta_camera_led_trigger, LED_OFF);
-	return 0;
-}
-#else
-#define ams_delta_camera_power	NULL
 #endif
 
 static struct platform_device ams_delta_audio_device = {
-- 
2.26.3

