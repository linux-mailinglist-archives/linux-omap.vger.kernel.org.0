Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737F570F1E6
	for <lists+linux-omap@lfdr.de>; Wed, 24 May 2023 11:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240581AbjEXJMo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 May 2023 05:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240563AbjEXJMg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 May 2023 05:12:36 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9073890;
        Wed, 24 May 2023 02:12:34 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso604138e87.0;
        Wed, 24 May 2023 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684919552; x=1687511552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U42ZMi69LkuMmwlkT8gzfK1DF8x9wNWEQyXj1QE5qjo=;
        b=R+9Kz34RIWEqxJU3Hp5c3BV0GT31D2xh7FVa9hzi2DJddpVabxv7NMkMzTd7gR78Wo
         /zqnLn5ZhaO1hL62hPmRjhD2Z10I8/Y+DdUQEyZrp6tRcehd9Db9jmghdGrdSK5xhgoR
         /sRjRMlznWlgH5zvC85wMTPV82f487exvm7LRffEgtITfUUlE0q54qzz6bOOcjirO/CO
         h82uTHBVO9X507JXZ2nONKCG8c6uxAmrZYsOjT6pivmq1YPGLdbhce4rDfmNLadgefbk
         SN6Yw9r8Ee0eMq96gdYj6SxZjfeojZt+aNShH+r54rAOUQwJWzp78GCwBZxV7pkPlJKR
         0bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684919552; x=1687511552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U42ZMi69LkuMmwlkT8gzfK1DF8x9wNWEQyXj1QE5qjo=;
        b=VQ2C1aiBhvQKmpWXZjdJ5slNHPBmHvIRfEGyRr+ScwBYvHLcAw0VZQ2Few9Xscfpsm
         TU8qUJpJCMngDrdRshk+cbOfmXJRRKzCZaElmzURgH4KZI7evzOYfpwHW7dizzQiXDC/
         Uyl6njqFMNqHNkQ85NyB9i0kyw1FNj1JSx7kibIGXzjS/u04FFvaSsGz+FJ739284Dz3
         ZBHtCVJoG+3ZPY4cbQlfM5848/n6BpcyyVPRzuDQO37q1TYcqXLAt2W6k+cpBl6WlpQq
         7j6yZelJ4iDFyGfdiM+zIiBmKXY4CZBm0nogfVDyi2njTfOuKdn/GvwPoeYlcf3CrH0H
         4KHw==
X-Gm-Message-State: AC+VfDwCrSImIOBQhmM5q122j3mErYiMFKxw9sKN7stNvqjCnjtL/p7+
        qYoh84+d/+xq47OrabS0U3mCZQ0zR/w=
X-Google-Smtp-Source: ACHHUZ4JMBlNjvv04AxefQ8Kl/fjXpsNkLjLiTTWtVuyOU7QArtRgGLipstyojlA3XCdoTSUSedzcQ==
X-Received: by 2002:a05:6512:208:b0:4f3:7a59:d19 with SMTP id a8-20020a056512020800b004f37a590d19mr4657335lfo.59.1684919552023;
        Wed, 24 May 2023 02:12:32 -0700 (PDT)
Received: from localhost.localdomain ([188.243.217.78])
        by smtp.gmail.com with ESMTPSA id o17-20020a056512051100b004f3789c8bd5sm1640453lfb.132.2023.05.24.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 02:12:31 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] ARM: dts: am335x-myirtech: Add missing NAND wait pin definition
Date:   Wed, 24 May 2023 12:11:56 +0300
Message-Id: <20230524091157.775960-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The NAND wait pin is connected to the GPMC, but this is not mentioned
in the DT bindings. Let's fix this.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
index 6eea18b29355..38bc7d41baa7 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
+++ b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
@@ -127,6 +127,7 @@ nand0: nand@0,0 {
 		gpmc,bus-turnaround-ns = <0>;
 		gpmc,cycle2cycle-delay-ns = <0>;
 		gpmc,clk-activation-ns = <0>;
+		gpmc,wait-pin = <0>;
 		gpmc,wr-access-ns = <40>;
 		gpmc,wr-data-mux-bus-ns = <0>;
 		ti,elm-id = <&elm>;
-- 
2.39.1

