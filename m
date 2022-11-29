Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC33563C4B8
	for <lists+linux-omap@lfdr.de>; Tue, 29 Nov 2022 17:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbiK2QJj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Nov 2022 11:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiK2QJh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Nov 2022 11:09:37 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D50391FA
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:36 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id f18so792278wrj.5
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=h97xq4jpFYXMqZLHjJDp3HY5QwPTQTpe47hCbHyRcmUmLj6DR+mDDs66iu+LLkQLyU
         uUzPfNErHJtes8gK4Ve6c98MRy/dR7VsBGh3UiwjbijWl9fuPpHg+uc3ef8G3JgGAxGm
         7oiezeTqhjN9q1VkahpUUFpKVz86XXLROnoRXjz9lC13HZhKOpeKFPROkQe9/rfmg2am
         AaSTMPKGweYXRzYFH/eS/t+bPsoncS9L7Pv8SHP1goaG3/bok71wWK8WIJhiZqIUlL0b
         zgeZTQPDAiaH+YrOA33ZIvuL+e0X1EEQ4iYxuq9cZ8uuSDBDAdNKtG62SH2enNPrfMxz
         zovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=GfVmTACSLa56Y2VbstHpeH5YFLpP1+I4PUkUONqDC7jZ6/AtzjscTxHYsuNH1EvfDy
         WwJlGT5LYQfj4Msj+0jGDUDijPVPC9WYUiXlve7DHfCngtBkh0+eHKrTgObr6SywpzTl
         SgT0uUmPLKLchgyjKjnATNLRwKMsH/RPG47T1DJpYBjhJJkL8PW88Pe5W7/QnJXYdjeU
         R3srfL92ODYiewuPMOgKU8uWyG0DRR0iWw/kda+rLR4EabeJHAz6auC7fM+nrHMaH/F9
         RF53PTBPJnr6ghp/OtSD7iNmBglP7SKo6jpvqGjM48uI2Yx2Q6l83H14X3vWEusahW9s
         ll8w==
X-Gm-Message-State: ANoB5plSsqsXg0DFqkkEr05HKdN59tO//Omz64APCldbiWd0Png1h76c
        FoKVnu/L56OdO6W7JyZPGNtLjw==
X-Google-Smtp-Source: AA0mqf5lPPvOQpJyW4bMuhcW8gCMG5F4uApp+F8DYwjDoEYMVXFetf425iOchxDT1jYjeBgBJWVKvA==
X-Received: by 2002:a5d:408f:0:b0:242:263e:3ba7 with SMTP id o15-20020a5d408f000000b00242263e3ba7mr1459483wrp.561.1669738175210;
        Tue, 29 Nov 2022 08:09:35 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id y18-20020a05600c365200b003c6c5a5a651sm2477572wmq.28.2022.11.29.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 08:09:34 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
Date:   Tue, 29 Nov 2022 16:08:15 +0000
Message-Id: <20221129160818.276696-3-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129160818.276696-1-mpfj@newflow.co.uk>
References: <20221129160818.276696-1-mpfj@newflow.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

UART3 & 4 are both RS485 ports.
So we need to configure and enable this by default.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 arch/arm/boot/dts/am335x-nano.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 05cbfe24f778..cecc2afaeff4 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -187,12 +187,22 @@ &uart2 {
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
+	rts-gpio = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 	status = "okay";
 };
 
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins>;
+	rts-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 	status = "okay";
 };
 
-- 
2.34.1

