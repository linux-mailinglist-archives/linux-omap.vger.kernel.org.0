Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063D05B6CF8
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 14:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiIMMO7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 08:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbiIMMOx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 08:14:53 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C231613F1D
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:41 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso9386714wmq.1
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=j0JF+O7uPaA+JnRhBKIMwuJ5ooU6YHNL/R8DhQde0iprBWt1yj7jWqORlO8wMd1QEc
         26zCxUz+AFX4z1Ad+Dhpc59pF5d+5zGRcncXPbCUqWKerl6KJuOsqNKkQjcmdphn1owm
         zRmC6FBUqOT/mfwYeNmBdk5SGV7Ue+2cglTo4CeANaTpratVB73UEbRvCTuX6DX1mdvA
         tkYMezvMyi9ASe7Ja9mwWcE6d4tojZe2HEb0cC8s50CS/aC9SEGU7gH9JllrZj/EHmG2
         SJOskzmMz5pgGORrPmJce/dRMfrKdabnYji7C8aW6RqiCfd0YoXrnG7gvwJvZOr9lroT
         79HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wxovnf5KPHC5iL/G2DCCvsq9cB2n/hhE49OVBFVzwkI=;
        b=trly42Xw0nLMP+nX0j+4ZRu261Kg5HtDHtoBhjER8VSRUvYu9c83c6cvvdp0riHtlM
         iebltFXoLVliWReJIDWsegfjE+i/tuMsC1j+xOveQcEmIi4g801ekxjcOmC8GcK0UYys
         WUQm83P+X0ZvOYYj46Ogofe1DIRIqhpFNXEM7D2c/o2c1DnW35ZRklHlMPl3HRxrIliB
         7nRcUl0T5wF5vtwbj0U+UMZpGid4v1pk71aQ3W07gUKntsUoGwl6EWw1LdT2o9iWNyR+
         RCBmWtmxAGuWTA3HlMY4lYQmnWRCXIud77vITjsMkmJ1q8Oeer3sN5i5ezMD5fwnaD+O
         aEUQ==
X-Gm-Message-State: ACgBeo2eB83xEObdArvy1mVd6KNLxavlGFLdGcWJv6wrk1v3yqcxNutw
        18Lg7gasNbfPWyzRpUhPE3ZKzQ==
X-Google-Smtp-Source: AA6agR7SiDkWxKdfJzrm3HmHEf8BW18cVicEGQlN6cAvn87iHO12H7OBmwTmFq0IsB9p97cG2wx+3A==
X-Received: by 2002:a05:600c:434c:b0:3b4:82fb:5f78 with SMTP id r12-20020a05600c434c00b003b482fb5f78mr2200829wme.157.1663071279414;
        Tue, 13 Sep 2022 05:14:39 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id p10-20020adf9d8a000000b00228634628f1sm10512230wre.110.2022.09.13.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:14:38 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: defconfig: Add tps65219 as modules
Date:   Tue, 13 Sep 2022 14:14:19 +0200
Message-Id: <20220913121419.15420-7-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913121419.15420-1-jneanne@baylibre.com>
References: <20220913121419.15420-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

