Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D99517DD4
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 08:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiECG44 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 02:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiECG43 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 02:56:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996271A078
        for <linux-omap@vger.kernel.org>; Mon,  2 May 2022 23:52:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z99so18823177ede.5
        for <linux-omap@vger.kernel.org>; Mon, 02 May 2022 23:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u61yPu9p/YKGWVl2XMy7UEGngVuz5P2bHwgLF3BABl0=;
        b=ZRXcv6YSmEvRmCVFJwfEr6fleKYTm2R1OONnZYRwhEMLP9vNMY2nIhZlHZ2BA9SjE1
         MZ/TpYXpI8JWbhZTtk5qva6Y0jkaE1SdrLm/GEQTeEXu7n8rREQn5AZzavTJVWbvLhS7
         YP1bsdoJsKhsP75u33rDf+ZVr2pWtINPoe+1ooHVVfBO9OS4tWhP18A21hwKyUS+5t+P
         CT98xRBbgwK16T0RMVt1PDtB5xonMkdYyrJFbvg/fJedIfYvCvICWND/trR+I4ixdIQy
         l4sh7NbVOihryTMiY9qBhUFUnwBM6yQO9DPmQXaSEfq1gxkuDnHxyZ/TnhwPkFSPaMIJ
         Uv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u61yPu9p/YKGWVl2XMy7UEGngVuz5P2bHwgLF3BABl0=;
        b=LtgU+grpHF/zEesQruYkftgR0adducZmo/7KJVJS+8eqU7WyanlE4+4BKi4aNpb8zQ
         QbcSHxCstcNPgDpqP8TotZf2YT3iU8FOpYSADncWsHWRZFrWE0PnAmSEDXb5JxVr7HQM
         pdIkABWtT9lLtM9dlSTLmDYSpNzH3sUMmEqfKIKJZKwkEkCz23BR1vFysmaI6zULaiNy
         GODUzGWAT1P3JluYk3NZzFoiZF7+Olv94SKebi4nehypvy2DEro2YroYEwhYHJyA36pO
         BuqEPvTkNJNgidQZlllMXOU9vImuopQ1aM1BMjfxmHSg0kRDlVxXETOwdmE6Uo6yD850
         rivg==
X-Gm-Message-State: AOAM531QjujwaHUDi7rvTNNhk7plGVzxr3DWMYUcpxfzIzBhbUjDctvm
        +Ju7ONwQoOY99VfUL9EABkfPlQ==
X-Google-Smtp-Source: ABdhPJzr8EYgv5A8SheIp2cUb2kVt9iDDZlxcitkaL/fJe4IIiGKBPncMBgEN2y4lFu9VSbLHbqbiQ==
X-Received: by 2002:a05:6402:50a:b0:426:16c3:4283 with SMTP id m10-20020a056402050a00b0042616c34283mr16722700edv.371.1651560731133;
        Mon, 02 May 2022 23:52:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e2fsm4382915ejc.149.2022.05.02.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 23:52:10 -0700 (PDT)
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
Subject: [PATCH v3 4/6] ARM: dts: am33xx: use new 'dma-channels/requests' properties
Date:   Tue,  3 May 2022 08:51:59 +0200
Message-Id: <20220503065201.51818-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
References: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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

The '#dma-channels' and '#dma-requests' properties were deprecated in
favor of these defined by generic dma-common DT bindings.  Add new
properties while keeping old ones for backwards compatibility.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/am33xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index f6ec85d58dd1..9a8698bd2852 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -461,8 +461,11 @@ cppi41dma: dma-controller@2000 {
 				interrupts = <17>;
 				interrupt-names = "glue";
 				#dma-cells = <2>;
+				/* For backwards compatibility: */
 				#dma-channels = <30>;
+				dma-channels = <30>;
 				#dma-requests = <256>;
+				dma-requests = <256>;
 			};
 		};
 
-- 
2.32.0

