Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C597AEDED
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 15:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbjIZNZs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 09:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbjIZNZr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 09:25:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A3BF3
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-504427aae4fso7906917e87.1
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734739; x=1696339539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hr5amuTNg43g84vy8vdnricessR4/d7Wx6XjZcS7tVE=;
        b=IU2+sSheFDmaHqtfzz4eiQBOZH+Je7jF83gMwSxvtD81GsYgv4YlP20JSs3+SptnGG
         tAMRYitizY1tOoaWfWDJRV1wrukcA8pfNiHfAiLP8TSiszOtpmmHgBrU++Kp3f8+Kp5x
         Hb/cIO3RNXOBFZr0ivNDay8kjZrvOOK4Du5158FSFNkFFWqzovPG60XaXSG9DINp8Av8
         Zl3v2DTB8uBbMaXofWK234uqIksMBTC18n45uGL5mkrvRU+SGjsNOu+wskCtyH+nF8IY
         nBtCr3vdgwNTUdoKKE26+B5BpL3Bpi0As8RIpUdDAUcxFJf73TSuAeE64MeNu9asomih
         eeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734739; x=1696339539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr5amuTNg43g84vy8vdnricessR4/d7Wx6XjZcS7tVE=;
        b=BbcEWDiwYAfy+u19VIRJyPMRUnfC+TbE4zVl/75hfwh9aF3ffc+uBseU7XXs8MrRxC
         j8Har00wqB9GTqX/E6bh88GQpV6Bi8aSOj0UBAq7HDab51AGV8isSZzEKj6r+sl60PqK
         O1KLd9OQa6rtv1Aqhs9we7mC5Px7SSt/J/bxz6nksZPw4RZrHTs6dXO9uRZ3LN4pE/KZ
         rlobiCu4Pp0cmoU3xFPRgUzk50g6DD6rwg/uZaZDKs/8KogIwgAcjXn2giV9sdy4bmvQ
         hyZT8dIqKjBykUJd0ldZgNseeqF6gSML7cX2gUngro9xvMx38VmlYQCmHyznVWggb/uP
         tYig==
X-Gm-Message-State: AOJu0YxWyw6bFQ4ThUiiTIkc7dlaSp++OntBC8lvMEVrBam2kv4opva5
        x2nK56WSzxN2onGxwiDLFBTsoA==
X-Google-Smtp-Source: AGHT+IGhCkADecUplAXbs0IyJ40nh2sd47gAxE7FjpqNC2VQj9VPtPn0k3sCnuX/N/x/fkycKRNmpg==
X-Received: by 2002:a05:6512:114d:b0:501:bf37:262a with SMTP id m13-20020a056512114d00b00501bf37262amr1239953lfg.32.1695734739514;
        Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 15:25:33 +0200
Subject: [PATCH 5/5] ASoC: ti: osk5912: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-5-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This driver includes the legacy header <linux/gpio.h> but doesn't
use it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/ti/osk5912.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 2790c8915f55..12f0c3a15201 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -14,7 +14,6 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 

-- 
2.34.1

