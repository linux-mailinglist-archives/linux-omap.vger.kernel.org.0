Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CEB4F87BE
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 21:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiDGTOS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 15:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbiDGTOR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 15:14:17 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2152335E3
        for <linux-omap@vger.kernel.org>; Thu,  7 Apr 2022 12:12:16 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so9220655wrg.12
        for <linux-omap@vger.kernel.org>; Thu, 07 Apr 2022 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wo9oqpOrlL09wrHzLGCPMOoNjd0NRRV4WyHm6QSjcXw=;
        b=A+CStoVmBS8zw62LuBlsUrhX2I1YUxgwfb+f5/O7FRMnJd6b9nnEikrHsg7/PRxtRH
         Lck0K0k8ZG68XgeWmn2r/CFr4jpWB/lq1dzu0crZKHE00y77I33GIGOqkApwQl9c0AiK
         s1Pz8B4aaV4ZfBBX1HM0XsbxC7l55sxVPNulxJAPnzMxR+65H0wzjKc4uic7Lq2bmKpW
         U2IrSpa7vCB+5FY0uCqynAcE7IrFsYa8b59GgBNZFfH0SvGngyK+i8B86qoLiT/24hG7
         nxUvFCE01mGAcM9+vr781OG15rXJd6+AH7kne3SpiDJDHNHNcooD1T3ABX/algYOV5B+
         2BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wo9oqpOrlL09wrHzLGCPMOoNjd0NRRV4WyHm6QSjcXw=;
        b=pEjvyaNeO4m/GXuNuMfmexj2kUQlyRPntaMTVB1bYkvVd2z5joz8W8GsabvO8OpH99
         sCOjpEwPBeuUFrTez7z9RF3lLxLk2XEHXm9uQN9qvIGhI/Upd2OFgLdiQnOZRlNcc+36
         rcJ2EUq4rTowaZ3Riu2n5EBCe355HFdsUu+ZlaTAvsg2KZ6bk+ErF24KhldKn3WPQ5uC
         MCIVwqCXlfZ/Xdmt+EfeaUNShnoHdZsiNb20j1kC+n6lR+Gg7UIBgVIxYJBpPClqFEMK
         XpNoZCdJdFBglSH6hWqrWkHUIgFKcMVnjdnhFCybEeqI5x1k/G3tmdZPkdYFZC14ZIIh
         Fxow==
X-Gm-Message-State: AOAM530vUSzCoeJq5W8p0PwgKMqMkJi8t524whOiX3O3aAtnM/sB1D9A
        XVTWRopxTyoXm69snboKd8lqzwVOgQY=
X-Google-Smtp-Source: ABdhPJyjlLtutGu4Av6RCcJJ6lRpbII9jThxDgGtmFzfmmqcqo512nfOMQ15hrj5GS2FA0m25zeM6Q==
X-Received: by 2002:a05:6000:118f:b0:206:81d:c030 with SMTP id g15-20020a056000118f00b00206081dc030mr11807807wrx.169.1649358734884;
        Thu, 07 Apr 2022 12:12:14 -0700 (PDT)
Received: from dell.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c2506000000b0038e6fe8e8d8sm11770610wml.5.2022.04.07.12.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:12:14 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2] ASoC: ti: osk5912: Make it CCF clk API compatible
Date:   Thu,  7 Apr 2022 21:12:02 +0200
Message-Id: <20220407191202.46206-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
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

v2: use clk_prepare_enable/clk_disable_unprepare() (Peter)

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/osk5912.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 40e29dda7e7a..2790c8915f55 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -27,12 +27,12 @@ static struct clk *tlv320aic23_mclk;
 
 static int osk_startup(struct snd_pcm_substream *substream)
 {
-	return clk_enable(tlv320aic23_mclk);
+	return clk_prepare_enable(tlv320aic23_mclk);
 }
 
 static void osk_shutdown(struct snd_pcm_substream *substream)
 {
-	clk_disable(tlv320aic23_mclk);
+	clk_disable_unprepare(tlv320aic23_mclk);
 }
 
 static int osk_hw_params(struct snd_pcm_substream *substream,
-- 
2.35.1

