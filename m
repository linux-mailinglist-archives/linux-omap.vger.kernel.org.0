Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD1E63D793
	for <lists+linux-omap@lfdr.de>; Wed, 30 Nov 2022 15:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiK3OGb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Nov 2022 09:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiK3OGS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Nov 2022 09:06:18 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481C27722C
        for <linux-omap@vger.kernel.org>; Wed, 30 Nov 2022 06:06:17 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so1496287wms.0
        for <linux-omap@vger.kernel.org>; Wed, 30 Nov 2022 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=nm+YD4lwlJczqUoucPAREX3wJ1l5vxvd15NAhW1krXPZ45EaIkJZujRWYYdH0/MI8q
         772V7WkYr98nBWiw4n+93RnMt1P9wX4rdLcDiL9s/GypC1551L3RhS6I3v4fj/a1O6Nc
         WzCbReKSuk9bwVQhyc7bQ8KD2VvI5S2sjLI7+wbZNMdplEcQrXHyCEH1J1Zj1sSNqmoD
         LmOSSfjut2yj5pCJDMS6i8MILacyrMx3LJdfNUljrzby7osr01Lt+UJAvno8ypI7lixV
         AkUKYWxXPyjQ/0p4/j5WGYjU1ZhhaK4gatUON+anEc2Y3DUf95zpJcWMNfGc4z4gyxGo
         2WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9lRrQgwNdzcRvhC7oNoTPa3Q44tE4Nwzh6uHCLmick=;
        b=qMFHvhmjyMI1q53KtlsxQQrqdYTvtw0YcJDqvqYBjtLEAtK5YSWtfa9c4T0n27bkLD
         nfteuVzSGlsI+Uo6iQtCciWVUAcaFbNn+sQgUSJbfp/t8gl5ww7ClwjA9wsbyzUmmS13
         bXMsd19zkYNZrd5turqdVCeS1XpoSB8ZKnu58c0IY93b4Jh2FYqm1mA6iAq5OXJODLf0
         AiX97LZ+GYue4P51ZXFsdxO7IF+2xx0rd4qwApn03gaF425EbDj1FOEBHm/819tYdjUk
         dCswv1Czcrws3j7UfxVMw+3GoMYfO4ZS88q1VyxBPha9w8y6ib0TvzsuvgFmfohMNRt9
         E0bA==
X-Gm-Message-State: ANoB5pntXA8tqCPFNcAS+ImNbtqpM2Eq75sPNndK15MGQPyadq8//Xdi
        yWa5ENdbaLVTQcpmf26trM+lDA==
X-Google-Smtp-Source: AA0mqf5uJOnXVO1u+u0fMY/XejbRIQJKjFofWlTxgUiUKAWg9oEPlLuWsRD0qwBG/QDwDXm1CHgCwg==
X-Received: by 2002:a1c:6a0a:0:b0:3cf:d64e:1cea with SMTP id f10-20020a1c6a0a000000b003cfd64e1ceamr31184977wmc.183.1669817175869;
        Wed, 30 Nov 2022 06:06:15 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id v128-20020a1cac86000000b003cfa80443a0sm2062542wme.35.2022.11.30.06.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:06:15 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 2/5] ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
Date:   Wed, 30 Nov 2022 14:05:44 +0000
Message-Id: <20221130140547.295859-3-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130140547.295859-1-mpfj@newflow.co.uk>
References: <20221130140547.295859-1-mpfj@newflow.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

