Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF6A5B89EC
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 16:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiINOIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 10:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiINOIO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 10:08:14 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9492DAB
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:08:12 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r66-20020a1c4445000000b003b494ffc00bso3090797wma.0
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=TEgAz8TyTEUxFcTpNCv4lGZ7t5+w4UkFWYn6r6UPn6c=;
        b=GNGymchFy/ZGy7tceP41sf4pSM1/GErPhfigrizwRiVYFbvLthpRQ3o3uoy/jcR0Iv
         51OKimpOhC9QyD7Rrr4fMffnWGiC9tkHtRg9d9HsEWTz3qYJJBPdAXW7KnaOrtQQr4Kw
         6waUWdXeQqdxgJ7thLHAqcxVD6RgS0VfxytOeIPwomprGYfHdCGyOGCyf2UhdvOJ3xcP
         PZZFroLBcZQkAgLD4IHC+7PQekdvubvFK9LnAqX8qCn7pbB0FwK6gKlJHb67sck8zavi
         yrYyke8vEfajD5UsuHF0gJlRU1Zgldit/BpRaJ/GlLDMVEYTeHBNrChF/ymdewt4/UWv
         eaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TEgAz8TyTEUxFcTpNCv4lGZ7t5+w4UkFWYn6r6UPn6c=;
        b=B4+VnStRFW5c35V46ZSbxXeK00ikzhhPLDOCusMZxe6fU7Zjq3FKrf0TrqsYAYuEsX
         C+0nqa2CPUsg+xuPdroIRzfeOgiQ9LyJ/eXU1XC604T75/Hn2CCnZMlm1e0ZZPZKVcDA
         r6AT+lSyRAMU+qefrZPFUaHB8vcACzJkRcncKnenYjDWoCh+ryPKGFlVBBJAce36gK0T
         MO4oC14mTucPEO3taEfldWiwhNByEj7NygftvMt0LPwCu2VQL2bk1ApGzW2WTCQipRYL
         4fZzsCe1JRo1nnHFWuKJ+ttT7zkj34xN7NJW3vmNviPfiPbDSGVTN4hlc/wL8mYMyFwa
         vglQ==
X-Gm-Message-State: ACgBeo0/Z8VbqlMVjisriIGv49NNzE/+tLXIRRi3WAP2YWogDmAgSA3i
        6AxoKU6QMH1aJo9Jjuv2ZI9mTQ==
X-Google-Smtp-Source: AA6agR4ulQAjhQu/qx9p66NcIqaI+Og9cGsmyNjvCDz8sUuTbo3som03+vduA1Li0h8LSSw4A2B+OA==
X-Received: by 2002:a05:600c:198f:b0:3b2:b5a4:8d38 with SMTP id t15-20020a05600c198f00b003b2b5a48d38mr3292041wmq.79.1663164491177;
        Wed, 14 Sep 2022 07:08:11 -0700 (PDT)
Received: from jerome-BL.theccd.local ([89.101.193.66])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b00228e1e90822sm13303767wrv.112.2022.09.14.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:08:10 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com,
        vigneshr@ti.com, bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 3/6] DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable tps65219 power-button
Date:   Wed, 14 Sep 2022 16:07:55 +0200
Message-Id: <20220914140758.7582-4-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220914140758.7582-1-jneanne@baylibre.com>
References: <20220914140758.7582-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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

