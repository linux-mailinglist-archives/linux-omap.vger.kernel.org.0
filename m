Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACDC75070CA
	for <lists+linux-omap@lfdr.de>; Tue, 19 Apr 2022 16:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbiDSOmU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Apr 2022 10:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241817AbiDSOmT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Apr 2022 10:42:19 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8592182F;
        Tue, 19 Apr 2022 07:39:36 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ks6so33423529ejb.1;
        Tue, 19 Apr 2022 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Vm7RTk/Mv1vHHQ4KaJPZgmLpXMl/IX6zUC3ItkEAIYE=;
        b=MlC8KGaSvLxyV+q+Ss4n6GqSwnHi+ZX2ahDuiSAthbR1WqYa3ys7fYouLQRM3y4TVi
         2GKLHLxemn8ibWX+JZKzQ/q1fRfUG0/liDasv7DEaLRZryRCGWKPJ/r60U/KPrKwYkbV
         Rs7WGLuHo3SSmE8sDQ8GY47g8fmBqAXfjtX3NZSGvmtn3jUZfjghVRQ/MpQQxsOxSJ/7
         YOIrVwDmlEN85G4cxjAqrNWXAAib2QaIfNFG0LB8DLKNEP5QOrxHmeNAR5cj5bCBoVPV
         GGcw75B1f+Ni09wfpL1w8Yb+axPgsdsmkiT5Ik4Qwi2XBKjHNkOZe8FAxDjfR5WbsX4d
         +lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Vm7RTk/Mv1vHHQ4KaJPZgmLpXMl/IX6zUC3ItkEAIYE=;
        b=TfZYPYkafVN8h8CGyrnZOvGDoSlf4ExyV1L4YGdbtff8J9y9mTDkXKxj3RHYRBHO95
         0TZLmMBviFguYGTyO0sVf/3PX4OtXRh31XKE7TpQHN1HQwF4Q9g1kz2brAfINiqOPiQr
         FI3kqjJdNy6xJa70X+DbGl0iWyhjvn+CVfW35GUopkj+/JpHGG8ObmGvdXbyeg3CUB38
         Yd7GE+KJ92BDKC2OTssNCTQTZgL3SnvlMU8Paj//PWFfs88DRmCfcc/irGOKP1qOQtwG
         LN9W/jVMW8Q+z+h5HZzRHUr9MrDlfai7hvoKuuV7mfxR1yEZNkUC4ebodIOOI67xsUTP
         5EQA==
X-Gm-Message-State: AOAM532PMR/EP9i1tTg7NNE0I4c8KNiJPxEG/3qOKdfeAwfwvq3tQmgE
        wZcIiHH+WNL9w+XgZgIBtlwgiqwHBgI=
X-Google-Smtp-Source: ABdhPJzCovK5Rvj39SqwGyrYzyY44VafeZnfHJA/W9CIZYHNC8H5KwFR5M2xP3zllZLGCvUOw2k0eg==
X-Received: by 2002:a17:907:9482:b0:6da:a24e:e767 with SMTP id dm2-20020a170907948200b006daa24ee767mr13967628ejc.479.1650379174943;
        Tue, 19 Apr 2022 07:39:34 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b006db075e5358sm5775043ejc.66.2022.04.19.07.39.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2022 07:39:34 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-baltos: update MPU regulator range
Date:   Tue, 19 Apr 2022 16:39:23 +0200
Message-Id: <20220419143923.25196-1-yegorslists@googlemail.com>
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

Update the max MPU voltage range to align with the maximum
possible value allowed in the operating-points table, which is max
target voltage of 132500 uV + 2%.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index 366702630290..d3eafee79a23 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -285,7 +285,7 @@
 			/* VDD_MPU voltage limits 0.95V - 1.26V with +/-4% tolerance */
 			regulator-name = "vdd_mpu";
 			regulator-min-microvolt = <912500>;
-			regulator-max-microvolt = <1312500>;
+			regulator-max-microvolt = <1351500>;
 			regulator-boot-on;
 			regulator-always-on;
 		};
-- 
2.17.0

