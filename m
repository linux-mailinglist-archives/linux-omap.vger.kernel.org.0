Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292FE566E6D
	for <lists+linux-omap@lfdr.de>; Tue,  5 Jul 2022 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236909AbiGEMf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Jul 2022 08:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238666AbiGEMdU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Jul 2022 08:33:20 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92111EAD8;
        Tue,  5 Jul 2022 05:24:06 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id g26so21328034ejb.5;
        Tue, 05 Jul 2022 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=rKchyti3CNHmlNsUeUfWTOGTB3qG+Z5MF1w+7GPUMjU=;
        b=YqW7Rt9C7Lbg2yHHCnnMqBMzjYQ8c9WZ0u04b7W2FdtdlP4DdrX+GRuqgh3dFY6Wkt
         fiXTAwYFNwEEh9gH/SFeJ4WK5dJK2hDHDczbv7q9WjC424EycaD6quRWTFmzGyNLXT95
         maN+GsXIUUqW+qMAePyvLIxFe49AdHsrjKxdamMxAtccREnJjSCn3fHi+AJKGFJtrbMB
         ezZHkvEcLQldTi2GD3NtbTBIJtHuBZpEFWe960SCDOHgDsIwyzCmCqQ3qGDwytTk3hea
         6YONL47VUDvg2Yw/r6G5r9g74iHTu2SjY0drA+OCoOlseVF5dcPllV8fA1Jjg3uDGDAP
         BmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rKchyti3CNHmlNsUeUfWTOGTB3qG+Z5MF1w+7GPUMjU=;
        b=oH29WisTtKREof0lImxuWlGBksXjRfqV4PL5gpbKkOYTtT+gqzGIwSL8EkEYVJCcB+
         OchxTz7bOAiuem8gQ1IeMa1Mb6ZXiOv9izBV6lw+8fDQxQd9Jaq1pS5HBV7BIKtb6Mwg
         6ELnFQWZTh2k1BrFCDWbnDOgsprEALhn03OqJy0tiFYc2KjyWWh7dOZYxENgvOWTNT54
         TFXHWjL8afSSDn1TXM0KbNb5oZv+MhDfVSfQbFbeBCqq+Cg+BC/kbme0mCaeOPp/Fewi
         gbVwhdVQtF3D/SW5IQVN9TUwof7MPr7wsI97NdKFjNwRD7Pv4V+dVqhLFHvaDm+GBtOQ
         wklw==
X-Gm-Message-State: AJIora8FO5woUHPPcPKEVKHO4c3L2TnkWyggcqoumOeKlCilhTK1RZg4
        3QFeRYmyPqtMMLrtm1o38vbO4BXonAF0Rg==
X-Google-Smtp-Source: AGRyM1tKL1YH/MeSytQXHPhC+33kwREENs1XwlCeymzKhwiseRyxIpDzHMUmgZKp00WIgQyVNZLYZg==
X-Received: by 2002:a17:906:5d0b:b0:726:a043:fcb4 with SMTP id g11-20020a1709065d0b00b00726a043fcb4mr34305213ejt.508.1657023845235;
        Tue, 05 Jul 2022 05:24:05 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090637d300b006ff0b457cdasm15861585ejc.53.2022.07.05.05.24.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jul 2022 05:24:04 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     rogerq@kernel.org, tony@atomide.com, devicetree@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-baltos: change nand-xfer-type
Date:   Tue,  5 Jul 2022 14:23:55 +0200
Message-Id: <20220705122355.14854-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Use "prefetch-dma" instead of "polled".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index d3eafee79a23..6161c8929a78 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -197,7 +197,7 @@
 		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
 		nand-bus-width = <8>;
 		ti,nand-ecc-opt = "bch8";
-		ti,nand-xfer-type = "polled";
+		ti,nand-xfer-type = "prefetch-dma";
 
 		gpmc,device-nand = "true";
 		gpmc,device-width = <1>;
-- 
2.17.0

