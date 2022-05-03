Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07E8517DB9
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 08:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbiECG4c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 02:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiECG4U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 02:56:20 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7DB19C24
        for <linux-omap@vger.kernel.org>; Mon,  2 May 2022 23:52:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id p18so18813949edr.7
        for <linux-omap@vger.kernel.org>; Mon, 02 May 2022 23:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/UG9U1ssyGyXBJOIuXlFbET9WoyyLZeeaMDTGwPECB8=;
        b=aFriaboHlOZNMvxzii9ge0kWiDCa70MwB6BRx0gmlfhd0zScqHSUTQur8tgWlmpB/C
         9aeAi9l0ji+ic+NNN3q7bK/Ua1Q2d2hobjuisqJkNHGNreohmI8x77hsxDFGu1X2lzKE
         jvPrhggSgQ8/grb4TeFHXAyFQD+r/EhTWrlmNMB4QGaFsFnxL5UceuPSuzS8L5IeiIZI
         qa6hu6DbU5M9GFzLg9DwZiajSCXBJDlllOWpxvIz1Q456xNdglVMJBfZiEAsK1/OiL8g
         fSwsyEUZDlbyJyrJzdKgje/8HiQDjo4tqjK6RXNUg/JRdp91IUyqmKItgLDoPLXKbK19
         JbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/UG9U1ssyGyXBJOIuXlFbET9WoyyLZeeaMDTGwPECB8=;
        b=FvzC7ggQB9LirNUFozVgFPGyxl6o1w1yVO35VlQl2ULNTQe9vsyDWUCRalNOTL8Dj3
         Pu6eXWAcl06eJzAQEpTtiwEJ8pcq9yJHcNcYEzNO/+p50g+bRJxNIiPTDmwwuHjB/ukE
         +JHIObsjxnETzM+HsTaPYjWJQMh2vInUEpgnWzbwXklsNveWkNbAv+T+dKdDVRhDQC4i
         T/YrQEw9odqj6gWt/aC9/UOHt+qt9Pas2Ex6UHalatBeeX4YjsyfhUbqVXqEryBSMFdF
         7cWtuAWH9XSc9cS/mCSm4WoSjzu7mFGTRmO7Ge16amvKlJX9K75cCQ8Za7b7duO0yZG7
         9xdg==
X-Gm-Message-State: AOAM531aP2EKGlsLz+yv9FiM5afao4RV6tCqLUwn5IoEX7JGB3RXwcTf
        myT3HjrHX9QBd14qGL6zSt6pHO6AoSP19Q==
X-Google-Smtp-Source: ABdhPJzJYQyFr1obXkX9xgodEsn4UhTcBKKv+htlYUnwu8n3fxxtBVxqleymuLD6Ot339IaRDc/bVQ==
X-Received: by 2002:a05:6402:5242:b0:427:cade:4737 with SMTP id t2-20020a056402524200b00427cade4737mr7908865edd.398.1651560728391;
        Mon, 02 May 2022 23:52:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e2fsm4382915ejc.149.2022.05.02.23.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 23:52:07 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: usb: da8xx-usb: deprecate '#dma-channels'
Date:   Tue,  3 May 2022 08:51:57 +0200
Message-Id: <20220503065201.51818-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
References: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The generic property, used in most of the drivers and defined in generic
dma-common DT bindings, is 'dma-channels'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/da8xx-usb.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index 9ce22551b2b3..fb2027a7d80d 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -36,7 +36,8 @@ DMA
 - #dma-cells: should be set to 2. The first number represents the
   channel number (0 … 3 for endpoints 1 … 4).
   The second number is 0 for RX and 1 for TX transfers.
-- #dma-channels: should be set to 4 representing the 4 endpoints.
+- dma-channels: should be set to 4 representing the 4 endpoints.
+- #dma-channels: deprecated
 
 Example:
 	usb_phy: usb-phy {
@@ -74,7 +75,7 @@ Example:
 			reg-names = "controller", "scheduler", "queuemgr";
 			interrupts = <58>;
 			#dma-cells = <2>;
-			#dma-channels = <4>;
+			dma-channels = <4>;
 		};
 
 	};
-- 
2.32.0

