Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF863742701
	for <lists+linux-omap@lfdr.de>; Thu, 29 Jun 2023 15:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbjF2NKi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jun 2023 09:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjF2NKe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jun 2023 09:10:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5288D30EE
        for <linux-omap@vger.kernel.org>; Thu, 29 Jun 2023 06:10:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so6145015e9.2
        for <linux-omap@vger.kernel.org>; Thu, 29 Jun 2023 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688044232; x=1690636232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUtUi/Yoqz3agAUVfV1tjyIuOCv5KY9VMs6W5QBKGg8=;
        b=s6KWxkqROj9zdzjYcDrp7KI1+wORQsz4tzfoWeFM5i9wbR8esW35SGdD+opaC0624/
         EAYmGefjjcPBOEkQAFfmd0d9GNkguyfRWF3nbbMwGenNNNFIIOqp/pXgNfUY4IlFKbMX
         R418B3zZAHA0x2zafVxgguNLufoze66o4uIsfNLDjCKvksxBY9LW/B6NEb24hW54RTJg
         tqq/aywYQ9LUl/unLK5uXW5PStnmDjvoCoCTSWfOMDKx7L9+1zsDKK1Rso9IL7pnwhon
         KXZmbsDIsxfcVavyWiN6orWu8UN7AlL/mJbxspjUkQpD3GDC7Wi6LI8B+lwF8UsH+gXa
         pwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688044232; x=1690636232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUtUi/Yoqz3agAUVfV1tjyIuOCv5KY9VMs6W5QBKGg8=;
        b=h/WeyuGPF/u5f5E4FLqwVo88rZYKUMhvweHD1jnO+g3e2AB9qvvIY4bv+UkHNq0rTg
         NXo2mlJaRn+NyfNJ3ULSTbgtuejTBOiyQn00LounSVw7uXN9fJBJfg3uhjLc/TiPQ/Xa
         uJ/KSdotvHJeZmFRwIx1db23gGYTmBrT0/tebc04JaI4n7612NvPFrtCkNxsQ1qfus2S
         6UXeucE5yZ2OZtLYkPzipTUuMQIalISbCQyqHG3oqW+i1GRomS0IQxvi+JLbJdvEZKKM
         j5RRkLmIJ99g7GDwsOFwjp/8ug2wqTI2Jn8IK9NUHVOnwE/DBxNLC5QuzR6ExsKoEyMG
         vmAQ==
X-Gm-Message-State: AC+VfDzeX/O8x24Ep1Nc3IqwZfDVP+S437L+cuLgioJeAqI8yMdGCJwi
        Kg8l8QjkpJT4sgea6zIu9s0gYw==
X-Google-Smtp-Source: ACHHUZ67Q6XG0BjMI0Qd/UsaG7kEVeVG+DWuP8BggHdINcVFDf0A6+R4/vpbW9s0edHr4TU4DLxdwg==
X-Received: by 2002:a1c:6a18:0:b0:3fb:b287:b0ad with SMTP id f24-20020a1c6a18000000b003fbb287b0admr3871669wmc.13.1688044231900;
        Thu, 29 Jun 2023 06:10:31 -0700 (PDT)
Received: from [127.0.1.1] ([77.205.21.223])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c214400b003fa95890484sm11885899wml.20.2023.06.29.06.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:10:31 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
Date:   Thu, 29 Jun 2023 15:09:57 +0200
Subject: [PATCH 3/3] ARM: dts: am335x-icev2: Use usb0 as peripheral
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-usb0-as-peripheral-v1-3-167f78a11746@baylibre.com>
References: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
In-Reply-To: <20230629-usb0-as-peripheral-v1-0-167f78a11746@baylibre.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vigneshr@ti.com, nm@ti.com,
        Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688044226; l=592;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=f31ZJ4CrfK4QstO+c+WLiSCch8Xr0qSQn/ZWVMjUlpY=;
 b=yIQu64DKUqP0BKtXpzPqgjyaBwCZsOBUjsEU3H6RZ5n6mZzwSidOVxqSqFHvLEmz+HFBcIh3F
 dlqsLTfr6MMB8GszGUFK4bkvOsX/S3uVv0ghJjFs5GrfmZh+q17Q06j
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch configures usb0 dr_mode as peripheral.
This USB port is mainly used for RNDIS and DFU.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm/boot/dts/am335x-icev2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
index 5835c0cdda50..203e374676d3 100644
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -360,6 +360,10 @@ adc {
 	};
 };
 
+&usb0 {
+	dr_mode = "peripheral";
+};
+
 #include "tps65910.dtsi"
 
 &tps {

-- 
2.37.3

