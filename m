Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD90351DBC
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhDASbs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 14:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236787AbhDASSd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 14:18:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC8BC02FEAD;
        Thu,  1 Apr 2021 09:20:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id b14so3656101lfv.8;
        Thu, 01 Apr 2021 09:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsIThPytQbw/FRN51LQr5onPfH3wKs5FFxL6HpmuigI=;
        b=Hw1BPIfiyZ7aUDBzT39/2jsbMvbTf8HPb2QUwf4hI0XKP192wn4EzGN+L3hQqgPanp
         sX0QFytMKOpSTZeYkoxOHx/HUjdFps6AWMPfj1t4EfwqJl5qUwEcW6IpDKTS28ip/wg/
         sc0fPXTQcsw75VnbeOx4HZeM08wymM5mH7cETSGlHqnXJzv9IpDiOgYK2TvH5dxY3SNM
         GibA/Vd79u+cdoFNSEMcxV1lkDlm2euUERmWrClfWVCePXf1R8leC14xY88tZCixYVXt
         hKlqKS2tDojiF8nzKh1NmPOT7u57Uv+m0HJe7ystjpQiwCoV63Fj2dzQcFcwJ5oytX+W
         Ox0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TsIThPytQbw/FRN51LQr5onPfH3wKs5FFxL6HpmuigI=;
        b=YKkf26N5TZ6jH/XycuwyvWAUvUvjOEXtQq1S+SfpZrhgz0tslbjvev6lGBMfB3GMtp
         +pfJWDeNA2Qk27cKHzMfJ+cpzMOOY34TgAvwPgsDDIIrI3vDuHEc0bRQBlaqeEsvov5m
         Jgd3Ct/aNDWF+dF+ZQuPqeyx1kIyTcL9vdbpKNJUUIL7saCrdaOj+vSVNgJSzrTOUNFc
         az0tJZmurvEaZXV5i1rwEFCMjn9eqTt85SFoC/vJqgG0UgUCfpEpaYR5wun9vaHclzzv
         swPXN3Io7BpgFb52TzIVY3hKCXznnLdrcsoWzlVeQ5/6ewpBqGBkllROQJJoImQKia41
         QLSQ==
X-Gm-Message-State: AOAM531md4X7sF6XM3S/NI29nUk2yJaxRteTDFxe/1LMUJXF+UbqRHvG
        hmF0SLaI8Qst41naujjcL/LOopjsyjQnFx++AV8=
X-Google-Smtp-Source: ABdhPJz6rLKvbNN33cNOyRe6Bkzr8oEKoNLyjT7Ra6rDxJqkBGZUxfyPim7i3mmJn0j4lNpaQNwB3Q==
X-Received: by 2002:a05:6512:4c4:: with SMTP id w4mr6080047lfq.91.1617294058343;
        Thu, 01 Apr 2021 09:20:58 -0700 (PDT)
Received: from 192.168.1.8 ([212.59.242.58])
        by smtp.gmail.com with ESMTPSA id n22sm660215ljc.23.2021.04.01.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:20:57 -0700 (PDT)
From:   Maciej Falkowski <maciej.falkowski9@gmail.com>
To:     aaro.koskinen@iki.fi, tony@atomide.com, linux@armlinux.org.uk
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        maciej.falkowski9@gmail.com
Subject: [PATCH] usb: isp1301-omap: Add missing gpiod_add_lookup_table function
Date:   Thu,  1 Apr 2021 18:20:32 +0200
Message-Id: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The gpiod table was added without any usage making it unused
as reported by Clang compilation from omap1_defconfig on linux-next:

arch/arm/mach-omap1/board-h2.c:347:34: warning: unused variable 'isp1301_gpiod_table' [-Wunused-variable]
static struct gpiod_lookup_table isp1301_gpiod_table = {
                                 ^
1 warning generated.

The patch adds the missing gpiod_add_lookup_table() function.

Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
Fixes: f3ef38160e3d ("usb: isp1301-omap: Convert to use GPIO descriptors")
Link: https://github.com/ClangBuiltLinux/linux/issues/1325
---
 arch/arm/mach-omap1/board-h2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index c40cf5ef8607..977b0b744c22 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -320,7 +320,7 @@ static int tps_setup(struct i2c_client *client, void *context)
 {
 	if (!IS_BUILTIN(CONFIG_TPS65010))
 		return -ENOSYS;
-	
+
 	tps65010_config_vregs1(TPS_LDO2_ENABLE | TPS_VLDO2_3_0V |
 				TPS_LDO1_ENABLE | TPS_VLDO1_3_0V);
 
@@ -394,6 +394,8 @@ static void __init h2_init(void)
 	BUG_ON(gpio_request(H2_NAND_RB_GPIO_PIN, "NAND ready") < 0);
 	gpio_direction_input(H2_NAND_RB_GPIO_PIN);
 
+	gpiod_add_lookup_table(&isp1301_gpiod_table);
+
 	omap_cfg_reg(L3_1610_FLASH_CS2B_OE);
 	omap_cfg_reg(M8_1610_FLASH_CS2B_WE);
 
-- 
2.26.3

