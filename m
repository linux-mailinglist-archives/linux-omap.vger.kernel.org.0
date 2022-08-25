Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9292B5A151B
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 17:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242509AbiHYPCq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 11:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242574AbiHYPCg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 11:02:36 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3038EB4EB3
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:35 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s11so26462389edd.13
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=eu2KFddXXnVdau+sv1grMBXuPuajMPRnsKMeyUd8rZI=;
        b=RF3TbIQJKsJwiHOEpZk3QrLSor8uvv32T0b7Y4ssrHvkaoorNYwvxolDc2cuBSmyhi
         hT2XVgyCTjGD8kTO5zztBUrkdyeeGe37I0yRHTlCyNFjgj71Iz9xIEB5uL42HseIWKK5
         88bvNQ8F5kkAJpHXf6YUjpZkQEa4OdRSAJOxJx5/ZDD0/LPG1TzvVloX2Msmd9xFkrXF
         JGGhWJS9Rh6bGfiqiHfCKojg1AlqO+zbGPEYT5sY26gYMPG0EE2BQJWE3mJKMJWUIF2R
         rzv5L0XqmYU4BcFGRjQM+Y6rNxOJkscZXbzV3+caH7g5QnovbTmKkiP4BCERukkOLEwk
         t6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=eu2KFddXXnVdau+sv1grMBXuPuajMPRnsKMeyUd8rZI=;
        b=L3/lT2M6Zod4d4r+6r2UY6pyyCj4vPYJ/yt3QIhhymQ3BSI3H/Lxe+7GtOH2QNp9mK
         /1O0rGZqxeaB/z+sQK6dInHadjCEnOfcXosU+v5V2/hJye1OGaNUTGVDTkK9BDafQcL2
         2S2ww1lbYiOMmQS53V7lzanKoy58j0NGENHMNvyVvnyqG5R2UmylcCis1LcJoZjm3wUq
         7GQ00zyZWwA/Iz/wp8uvqstbuTKv2Mj+SrGRhqsuA8t9IG3opCYETOPPzVx4OZrypxsF
         RqtwMGbvoE5BDjcy9rAz5Ri6sW2HPPD309RCnpOAKgRCotgO2HXu292TD9dtSJsYYmi0
         Pzsg==
X-Gm-Message-State: ACgBeo3jluei5KFm4At8AIvORZm17boDEdxfpdZgXrFKOdhopBbX+8n6
        eglGu2y5isUprOkiCaqq8N2nEA==
X-Google-Smtp-Source: AA6agR7lTRCv5izX5103uIiHYk3TgbBDIspZd1YcmHa7UyxUj1DRDkFSsFfbqt/4snK7fI8fBMpvvg==
X-Received: by 2002:a05:6402:2a06:b0:447:820a:1afe with SMTP id ey6-20020a0564022a0600b00447820a1afemr3633154edb.291.1661439753531;
        Thu, 25 Aug 2022 08:02:33 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00732e3d94f4fsm2548771eje.124.2022.08.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:02:32 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 3/6] DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable tps65219 power-button
Date:   Thu, 25 Aug 2022 17:02:21 +0200
Message-Id: <20220825150224.826258-4-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825150224.826258-1-msp@baylibre.com>
References: <20220825150224.826258-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jerome Neanne <jneanne@baylibre.com>

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
@@ -362,6 +362,7 @@ tps65219: pmic@30 {
 		pinctrl-0 = <&pmic_irq_pins_default>;
 		interrupt-parent = <&gic500>;
 		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		ti,power-button;
 
 		buck1-supply = <&vcc_3v3_sys>;
 		buck2-supply = <&vcc_3v3_sys>;
-- 
2.37.2

