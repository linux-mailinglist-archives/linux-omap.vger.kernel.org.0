Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F71511FD8
	for <lists+linux-omap@lfdr.de>; Wed, 27 Apr 2022 20:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242465AbiD0QRa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Apr 2022 12:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242548AbiD0QRI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Apr 2022 12:17:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498CA71A1A
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 09:13:33 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id g6so4435872ejw.1
        for <linux-omap@vger.kernel.org>; Wed, 27 Apr 2022 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ILgIEY7wMcCopOsdlDifUioNzWZT1dVF0DliY6j2xA=;
        b=aIRUrWNUAkLkKyCC66gt5pLcQDgoAUTdfKXeiO38cltao7py5UUmLVpJW2tNRpUE0D
         J+dVbGxVwviCWKm1GP7hRS2MRdonCbEEzgwnz9GMEGxkvLPTigFDmvsjIzjMca5wcRT7
         Ft9SFx6/iVm/fzNy1woKLM9uTpF289KptlTwC07P5LaG1hYm/hUDOXWcObH0JluHcchH
         hZ289HYXtnwop32bGsjH7SXdKfNpPb6Dv2er5BnTAFIGRqxTQ3edKlMSLb/vzsybWv3I
         Zji4X2nzxdA2T6ygP/7XYyHiGLcBoquC2t5a3U4wWYIojsZ2GZnXbO9Y4GE4g4/c0h+a
         QBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ILgIEY7wMcCopOsdlDifUioNzWZT1dVF0DliY6j2xA=;
        b=QbCMyzwPSlZxHDYtjW8vl5uD8TR5FXayPibxMKaf7mp819wYSuWnPDGvVm7MRUFSPI
         OOaZa2sb0LpZ3n1Da4kpinwL25bTu2eL230QP+YhYduO0qGV40qfIL6ZLPme/rS4TxFp
         mmI4/xbmjmbfc4HZHmSQyYCrag+jnEuz+5fUh3OdDYXFRBHGapLODKUvucLKo6b4zE6I
         zff1xHBcwLqeTw/6oohBjuHyMlfPw09lqoBfc+w4N0i2G+troUFaqJ/xuCCl27u1gOxd
         QRMz5i7793fERZ8Z9Z8jzybAL0pI7y7utKfBMldFSQO1ZtXjro8mKwXGYOi98/6M4IHi
         lttg==
X-Gm-Message-State: AOAM5314k/SOeqi+hXW4IdsA2eQVEWnMiCnbZqALCKGEltncZCbgSYgC
        fvoTekTXze6kU6VKveNutoglow==
X-Google-Smtp-Source: ABdhPJxyYdTqOLTvKkm/hVt8i19D/M2C638flWnCVKtx8surt5LeV7HAhzrc1Ww5KjpHznVXTZKHWg==
X-Received: by 2002:a17:906:5d11:b0:6f3:722a:1fee with SMTP id g17-20020a1709065d1100b006f3722a1feemr21315677ejt.9.1651076006737;
        Wed, 27 Apr 2022 09:13:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n5-20020a170906378500b006efb4ab6f59sm6991197ejc.86.2022.04.27.09.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:13:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/6] ARM: dts: dm81xx: use new 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 18:13:19 +0200
Message-Id: <20220427161319.647342-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
References: <20220427161126.647073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The '#dma-channels' and '#dma-requests' properties were deprecated in
favor of these defined by generic dma-common DT bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/dm814x.dtsi | 4 ++--
 arch/arm/boot/dts/dm816x.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
index 7702e048e110..ab2572482ba9 100644
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -167,8 +167,8 @@ cppi41dma: dma-controller@47402000 {
 				interrupts = <17>;
 				interrupt-names = "glue";
 				#dma-cells = <2>;
-				#dma-channels = <30>;
-				#dma-requests = <256>;
+				dma-channels = <30>;
+				dma-requests = <256>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
index a9e7274806f4..317b7c74e32c 100644
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -655,8 +655,8 @@ cppi41dma: dma-controller@47402000 {
 				interrupts = <17>;
 				interrupt-names = "glue";
 				#dma-cells = <2>;
-				#dma-channels = <30>;
-				#dma-requests = <256>;
+				dma-channels = <30>;
+				dma-requests = <256>;
 			};
 		};
 
-- 
2.32.0

