Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2635EBD83
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 10:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiI0Ig7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 04:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiI0IgK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 04:36:10 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD2B20F7D
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 01:35:51 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bk15so6080105wrb.13
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=UkqqOpPVPVDImx9bgWxR6E7nSNp47HRYWNmcrb0PR+agi8lTeA4L0ONGurjzu3Mdzj
         V5Jr5TvP9HiR3noHMtbRxN00k1hZ/LyDTuvh31Hd1hgFZm2Iwe21AoaQfx3NXWndUrjA
         mVI26+PZI6jBdxjodzaKIVkzPUCRA0P5Sa6tlgFGofcbOsqC/lPyMILG+R4953kwfg5j
         PpDvO2gFH8RVP+z6RDyiAipux/OjAL7PZ0ybu1HqPfbaDVZlCFuohQ4D+nzaloW6qyt9
         McgQGbvnuDEYUOnFEnXlogHwjqSZIt7IyUyLOWzf6XkqtlqVzGc5rtkr4ZT0cY7HtsMp
         8sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=Mw1Q/wNb0+QeegvBcwaiVnCifMGtJK0Ri1/Mp8lXRuVf3V+Xui1UxQsRXhorZqI7ey
         byJU8C8dOz60AODe8TF/Xwy54YK4Wi8VxNoyvdpu5xRelzvFJJeMmqareGnfat/s0Ccq
         pzwgePPdkXGwzDfmU/fmvPCFVvpo76GWj76rr2KXVmGjNoKf35xMxTkawERh//t7Harw
         eUUL0dH+IIkyEN31jbvSDV3Ho6cs81sM2+SdFlVjb4UXdqMGJ78K0q2l5+EGbsLPxQJh
         IGeHpmtgFTt5Ws0UeICNS++a6WSIfQH1eBXyI3CCLJp/0CSX3/WLMZ6PwJY5zqHrVOuU
         Z1/A==
X-Gm-Message-State: ACrzQf3L7B4/M4UfV1kG0gmy1lmlZmfRm+A0p+YWpYdZuHF6i3YYJz5F
        IgDWKFnlJ+FpUXmafBodU3LOwQ==
X-Google-Smtp-Source: AMsMyM6ODLNqJ9ymtQdYGh+Rm894BS+CNfsgKvcSY19/1pxMn2NEmnOG/8CEslYfiE98vqP7au7bjw==
X-Received: by 2002:a5d:47c1:0:b0:22a:5858:993b with SMTP id o1-20020a5d47c1000000b0022a5858993bmr15649108wrc.99.1664267749510;
        Tue, 27 Sep 2022 01:35:49 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b003b492b30822sm1122120wmr.2.2022.09.27.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 01:35:49 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Tue, 27 Sep 2022 10:35:20 +0200
Message-Id: <20220927083520.15766-7-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927083520.15766-1-jneanne@baylibre.com>
References: <20220927083520.15766-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds defconfig option to support TPS65219 PMIC, MFD, Regulators
and power-button.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd4904..d64e00355fcd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -406,6 +406,7 @@ CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_PM8941_PWRKEY=y
+CONFIG_INPUT_TPS65219_PWRBUTTON=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
@@ -639,6 +640,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_SL28CPLD=y
+CONFIG_MFD_TPS65219=m
 CONFIG_MFD_ROHM_BD718XX=y
 CONFIG_MFD_WCD934X=m
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -666,6 +668,7 @@ CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_TPS65132=m
+CONFIG_REGULATOR_TPS65219=m
 CONFIG_REGULATOR_VCTRL=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
-- 
2.17.1

