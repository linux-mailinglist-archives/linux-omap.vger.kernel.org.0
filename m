Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803104F014E
	for <lists+linux-omap@lfdr.de>; Sat,  2 Apr 2022 14:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbiDBMD1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 08:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiDBMD0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 08:03:26 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F79141FDA
        for <linux-omap@vger.kernel.org>; Sat,  2 Apr 2022 05:01:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bx37so3330371ljb.4
        for <linux-omap@vger.kernel.org>; Sat, 02 Apr 2022 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjfIXBTTvGAOCiQ27r2H9evLgRv0+TvRaITRPKY6pwo=;
        b=Pv058XN5Iozx5bqSBy6Ou9cjVc77Rvdp82w5q100fxamtfRZxs2SQbCSjEcTXzpPi+
         bH+wHMbkIDnXPbawpV7lUMO0T20KnrB1r4oZWZVKaV16h+Dxj8hZ9iQRkNywzuzQ4wDG
         SrFsNUpTkBqjuLqE8ccfbeypzCSOVkZaz91QkPIOz1J1/guS6UURV51sK42ZsiE9AU9q
         ECYDTWsyGOzGnYLh8jBJzZDWotoTjdeUcom7PABBogbnZisMUI75bHO1eOr+7Lf323aI
         6QLo5B3elp3NfFmmqx1Y4ZcsIShNooeUd1vsw0gL/Tszb7HbYm49HEC6+gdN6zhUelhj
         AjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjfIXBTTvGAOCiQ27r2H9evLgRv0+TvRaITRPKY6pwo=;
        b=fKu0bJ6KFUSvqw3vRQRudBqeFJFDFmKR5RIZrSRwTQqTL6iaokKP9KAf6J8xU/147t
         EncQwigem6w4arIOyRn1AQkNgJwPC/QtpGjF6dXvHUMzuYCmI9Gk+ZUlrFsG10N76b/i
         ZAtrW3LcQS9S5+elh/128bqChDRjHdUcFlEdwuwKP8gdk5aHgB3CYcNkyInSvcDIe0w4
         hjov/azJdu3i9X5/QQPh8m5dA8zH/fvHK/AJr6Or3USycjB/xqDZLzQPp2FXRtC3EhEY
         YGyfa0Fa/N5VeZMFdtiIKOhuP5zmZAek1F78p9MqVJpCqKhA9RrVPPs6riDV4BjDLUqu
         DB+g==
X-Gm-Message-State: AOAM533sFRmRM/uWqxLR/BTpcBxPng3r3Vu+UEEtlkZUbFHlhPAtqfQC
        btyUMpYlX/fsNpAAglBDpFw=
X-Google-Smtp-Source: ABdhPJx07OsbhYu/s537+TkEcgHtFIjG440h4+L/7oy4/a2kG/GkQTmNcLnCBbVIe50Llxhi170dlQ==
X-Received: by 2002:a2e:7c14:0:b0:24a:fefe:bba7 with SMTP id x20-20020a2e7c14000000b0024afefebba7mr5483770ljc.272.1648900891161;
        Sat, 02 Apr 2022 05:01:31 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id h16-20020a19ca50000000b0044a25081cf9sm506233lfj.133.2022.04.02.05.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 05:01:29 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Date:   Sat,  2 Apr 2022 14:01:06 +0200
Message-Id: <20220402120106.131118-1-jmkrzyszt@gmail.com>
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

The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
supported by OMAP1 custom implementation of clock API.  However, non-CCF
stubs of those functions exist for use on such platforms until converted
to CCF.

Update the driver to be compatible with CCF implementation of clock API.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/osk5912.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 40e29dda7e7a..22da3b335e81 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
 		goto err2;
 	}
 
+	err = clk_prepare(tlv320aic23_mclk);
+	if (err)
+		goto err3;
+
 	/*
 	 * Configure 12 MHz output on MCLK.
 	 */
@@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
 		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
 			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
 			err = -ECANCELED;
-			goto err3;
+			goto err4;
 		}
 	}
 
@@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
 
 	return 0;
 
+err4:
+	clk_unprepare(tlv320aic23_mclk);
 err3:
 	clk_put(tlv320aic23_mclk);
 err2:
@@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
 
 static void __exit osk_soc_exit(void)
 {
+	clk_unprepare(tlv320aic23_mclk);
 	clk_put(tlv320aic23_mclk);
 	platform_device_unregister(osk_snd_device);
 }
-- 
2.35.1

