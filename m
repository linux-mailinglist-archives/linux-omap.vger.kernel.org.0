Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E53455B6CE9
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 14:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbiIMMOl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 08:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiIMMOi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 08:14:38 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FCF7658
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:34 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so13261640wmk.3
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=TEgAz8TyTEUxFcTpNCv4lGZ7t5+w4UkFWYn6r6UPn6c=;
        b=YQciprlspECMqMacKKL+UoZsYMvy+wwP5FIdzqTDnrp7KrCIxkAGKWgRypAgcImwdq
         2zAHE6pnAIJvNJOiOJExV9H37yto1L25hZl6aAJFVJl9vlQeKUyGEKzArmLmwWW5jj/v
         AhCC7+agmScn3zm8awnWHu5nE5IAdOrTOUhCBr3C2JCk56DzVokAZGv74dxwFlNnhR5H
         9VsgBtyWTCyosDk6H+8d1I73pRXkZtKZwuY9PgMEr8hOs0kI7h+ZmBoBYG4hBiqSAUAS
         tcPPusQ2dd6hRGQiyibNPwYciz6yQQvLB0c2Y3ASHzsVQK8U/S+ZpUXj/r2V2mLMk1l0
         0gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TEgAz8TyTEUxFcTpNCv4lGZ7t5+w4UkFWYn6r6UPn6c=;
        b=N7/zsc0nTrlvaNQeEAPKgdFRrs10IvqhI9KqPBlI5EE4/GSaIwchRekYf4zZ+5Ld5B
         xqAnm0OHbxrti8f2CQZqFIa3dufZkM2KEVAck/4gukpZ9O16MEHsaejhBpBB1rWLoa9C
         LgN9CuBLFSbbWo9YJWs5S3TpRNTumLB5wA6UNe3ty0sQTpX/0mFqoxOggC6mBgVn5cQ4
         AGJVzUKgbkwjoxsAcIf7/hffJDYNhWoTASp5RkMh+95jjMiZ87hVbULyFfAQM/n9JbVs
         3sEUmVHuxVgHNmh2YqRHQs++dDk6x//Y3HomuV7scAo++E/vV6Qaz9FQgJJCwITCq0sR
         edMg==
X-Gm-Message-State: ACgBeo2EeNYVuEgFhW9gcEYI+gazDrXI1Iw32D88qa22WVadauQsB6LE
        dV8scSbfzaEHbKZZXNjUfxzsVQ==
X-Google-Smtp-Source: AA6agR4CVpKz1Ub948TsXfSmQ+yeimOI33JVqs/kaXCDqOGwh4T3ZgWHyePnglOogaXVI0HW/ZYMMA==
X-Received: by 2002:a05:600c:384f:b0:3a6:603c:4338 with SMTP id s15-20020a05600c384f00b003a6603c4338mr2212671wmr.192.1663071272948;
        Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id p10-20020adf9d8a000000b00228634628f1sm10512230wre.110.2022.09.13.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
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
Subject: [PATCH v5 3/6] DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable tps65219 power-button
Date:   Tue, 13 Sep 2022 14:14:16 +0200
Message-Id: <20220913121419.15420-4-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913121419.15420-1-jneanne@baylibre.com>
References: <20220913121419.15420-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This board uses the pin as a power-button, enable it.

Needed for driver testing but official board support pending.
TI commitment is required before board upstream kick-off.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index 1f7ce60ecb57..238798ea6a79 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -362,6 +362,7 @@
 		pinctrl-0 = <&pmic_irq_pins_default>;
 		interrupt-parent = <&gic500>;
 		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		ti,power-button;
 
 		buck1-supply = <&vcc_3v3_sys>;
 		buck2-supply = <&vcc_3v3_sys>;
-- 
2.17.1

