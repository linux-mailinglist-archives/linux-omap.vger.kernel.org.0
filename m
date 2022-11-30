Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5792363D79E
	for <lists+linux-omap@lfdr.de>; Wed, 30 Nov 2022 15:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiK3OGf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Nov 2022 09:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiK3OGX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Nov 2022 09:06:23 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819D974AA2
        for <linux-omap@vger.kernel.org>; Wed, 30 Nov 2022 06:06:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n7so811607wms.3
        for <linux-omap@vger.kernel.org>; Wed, 30 Nov 2022 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZK+iipkHl/pJApvhUcvpWuoeG0v04wAY4UNOC37vzE=;
        b=04RThbWA/+v6wP1k/7fkx43V5YD+NUt+nFK9/NA7SGUJC4567NIQnKu8MXSDWU5/Ap
         bkfMUUT9XJ8apuyUDFRs4Dy1EgMI28NRXczg/bQ5YDLKFJ39FeN9xXOOFLIXuhNj/Gqx
         xF0tsfz4W8B0E4GQxytUH5h52ZIAjaNdK5mAJx7Zb8JpmQLHZSe57X1BXpOKkl2cHBP6
         P9Mq1JOgDb3+rJMY/dPizZveUcFf/K4euhPK0+JdT/dQ+Otdl2tdYH4skFdyY8uPeT7Q
         lvWOhrZflPIRZ9Fk4N9XnZs/uZM/RM24oMtkD6Lt8r75KpC76L/5zv8jUBiAHH/gKAV/
         SDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZK+iipkHl/pJApvhUcvpWuoeG0v04wAY4UNOC37vzE=;
        b=ShNVsZDz+B6WD4GWLtXVoe2gwXycUjm/bEaYQdZGgUT9xKOkePqC7r9Lvo4IV6ZuKI
         k7Vk1tIKVVSLaOkdwfocrxBmrMZxttcDQz5h8L4vG1EmnOb4bgZ7KPs8C6wp//MjJN5G
         /WVTciXCVh2XMGU4JR4hqcNjI90ZdJqbYw4V5pEqqw8LWSuIrzMO1wXaBVkQ2fymCD8e
         z07SSIBnpHYEwS1aYtp3IhKlRFR6PK7aVnPV78LoAGFCL+ezAgFqSgjpPLGnKFUxsyS8
         9iEQGodUQIzEU3XamLdnwBC3sSlPCmD1zwDNh0qcxJf1HYpsfAb+yZio8omAEzukdOI5
         v84Q==
X-Gm-Message-State: ANoB5pllRmzSuyuVLi2G7KrDhKD2gEBzNRMvrPTwuvf/c51Pf+rXwtUM
        q//x/24cKscr32gjJ+waD1D6qQ==
X-Google-Smtp-Source: AA0mqf7H+IP49fZG476zanx03QWDNwT6bptGYlMh93TqEzY53h9PL2Z9YTNfNwMRrEqM/ptA55LvPA==
X-Received: by 2002:a7b:cbcb:0:b0:3cf:a83b:cf25 with SMTP id n11-20020a7bcbcb000000b003cfa83bcf25mr33535477wmi.170.1669817179005;
        Wed, 30 Nov 2022 06:06:19 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id v128-20020a1cac86000000b003cfa80443a0sm2062542wme.35.2022.11.30.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:06:18 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 5/5] ARM: dts: am335x-nano: Enable USB host
Date:   Wed, 30 Nov 2022 14:05:47 +0000
Message-Id: <20221130140547.295859-6-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130140547.295859-1-mpfj@newflow.co.uk>
References: <20221130140547.295859-1-mpfj@newflow.co.uk>
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

Add missing entry to enable the USB host.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 arch/arm/boot/dts/am335x-nano.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 58062cec39c0..c447aebd8d86 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -423,6 +423,10 @@ &mmc1 {
 	wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
 };
 
+&usb0 {
+	dr_mode = "host";
+};
+
 #include "tps65217.dtsi"
 
 &tps {
-- 
2.34.1

