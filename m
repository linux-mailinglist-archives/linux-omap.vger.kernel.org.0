Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964F572F949
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jun 2023 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243998AbjFNJbQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jun 2023 05:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244085AbjFNJah (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Jun 2023 05:30:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B381981
        for <linux-omap@vger.kernel.org>; Wed, 14 Jun 2023 02:30:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f642a24568so8233714e87.2
        for <linux-omap@vger.kernel.org>; Wed, 14 Jun 2023 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686735034; x=1689327034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NnDKiVIldkiJjNFT7PeoXvw1pLaqHuGRdQcXTyZlUI=;
        b=dnlnewlhj1+jt2qUOVrjxboXWltpogQrgI7YSmQH7O0OI9uTMlM7PofkZg6Nsie/F1
         2PKPunv247jvLnsybZipthH1wi7xSVCRLL/wlZ4kv1b9oQCk6TeyA+eT8p+0nRR3f/3R
         J2lJ4JJZsSxC0I0XHZzjKeD6knx9bRTnxuXOGL2hUnz7vt13kltHXkodBRLo8cxTyaZI
         CZomQIsUw+SK6/WKhwg8X0sb16b7ONYCjYCVfIpC0+ISFYDDExQtnEWgMmRooYnAC8Np
         0Dc20e5qTBZR/7JCMNg/ZXc1yBMzxHm67IaNKi+OlN2ze/4VqaNGhVEGwYiWimgbAspA
         hI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735034; x=1689327034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NnDKiVIldkiJjNFT7PeoXvw1pLaqHuGRdQcXTyZlUI=;
        b=HgtRQEqsEUXRK/xgm5WM5W2wsPm3BN4WU7dWTf+en8QJDebsIhtcqYM8yzLaMrKt2t
         0sXZ1zeuZfacFoFvTgw8R6bLH5e38b8E+m+9Qqy29rZU4au6tITorpvE9L0tDaaK5qyZ
         0TcGqhC2jmjugd091BACsr+XIJNuOpzcUlMHejIPuQcWKKk7dro3gMcZN7JK8K4w+MzW
         v3Re17CYmlxIcqF7rDaqMh6UGKwxt9OoMtVhdjH6zob2ogP48N0YHq1nGw/+vKMAdXtX
         BKyeZb0crSbG5VZHZ0cl9fDXPKJ5DbgvHyMj3kP3azHlHsbnWxHQCvB15Yvq97jWluLL
         /2Ww==
X-Gm-Message-State: AC+VfDxG5yEHdWC9Grfg7hQ4YGMRAvYP2YhgWMkyaQ5YMD6T0RPbG4Fv
        qV3Unl0mFuUBsaJLl98kl5ndBA==
X-Google-Smtp-Source: ACHHUZ6QNNFH5t2Xp5eAVasQd4OWmpm2Yn32BVxETsoWTcqk4DQnmgNU0iZZ0Rx8AMWsXDJBcCGP4Q==
X-Received: by 2002:a19:ca12:0:b0:4f7:61c9:79f with SMTP id a18-20020a19ca12000000b004f761c9079fmr1303242lfg.20.1686735034563;
        Wed, 14 Jun 2023 02:30:34 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512024a00b004f382f34f05sm2053186lfo.254.2023.06.14.02.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:30:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     soc@kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Vasil <petervasil@gmail.com>
Subject: [PATCH] ARM: omap2: Fix copy/paste bug
Date:   Wed, 14 Jun 2023 11:30:32 +0200
Message-Id: <20230614093032.403982-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I mistyped one of the SD/MMC GPIO lines on the Nokia n810 which
was supposed to be "vio" as "vsd".

Fix it up.

Reported-by: Peter Vasil <petervasil@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this directly where the rest of the
OMAP clean-ups are.
---
 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 564bf80a2621..8e3b5068d4ab 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -158,7 +158,7 @@ static struct gpiod_lookup_table nokia810_mmc_gpio_table = {
 				"vsd", 1, GPIO_ACTIVE_HIGH),
 		/* Slot index 1, VIO power, GPIO 9 */
 		GPIO_LOOKUP_IDX("gpio-0-15", 9,
-				"vsd", 1, GPIO_ACTIVE_HIGH),
+				"vio", 1, GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
-- 
2.34.1

