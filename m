Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76AC1FF26A
	for <lists+linux-omap@lfdr.de>; Thu, 18 Jun 2020 14:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbgFRMvx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Jun 2020 08:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730047AbgFRMvv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Jun 2020 08:51:51 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0FAC0613EF
        for <linux-omap@vger.kernel.org>; Thu, 18 Jun 2020 05:51:50 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t13so3503013wrs.2
        for <linux-omap@vger.kernel.org>; Thu, 18 Jun 2020 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EF3uQr3RQED1YKYkNKEVE2Xoq5JyRRd7hiTR6pRsTG4=;
        b=OMeUBDJHDfZzZVviBggQhXIHuiwJmDOMy0CPdLEzndgfIdnbwbIia7/VkAQm+c3TxQ
         OiAMSw+fc04yJwyx0S1da8QV881RvWFzWywcwlloVnhl8JQWdo4iypxayB6QLQKJdJ4O
         Pzgh5z4k0b3PE7HPSb1Mp+VVxMHCP0zgbSonNqufOsk7XaxdcCFu8fj/0m2WXk1OVZAV
         klAT3/qRRzQz/DBZ9cCBkctkcDxryrzlD2Es4ZIzjGFHPLxE3pN4wsDJV9WP6Wg0yzLh
         r2HKh3mmp93uHIm/60MuEj5oaXfDVOh8KX864DhgR1IZsCdWw2lzIwMSaCGs6ip7UUea
         E2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EF3uQr3RQED1YKYkNKEVE2Xoq5JyRRd7hiTR6pRsTG4=;
        b=m/21cazttH3tnfXmbGUsAqct7GHBWNoquUs2PNs5OWOHmxN3my/KsrVxccmsiPWg0z
         NoUXAR/1HtGlP0FiIiRJrFtyiQ8ZNSeWgfzRMHJdtpuLkUDq3d++GHEJUXsMnN8AY8fs
         pBzar4QJfdyW1ZcK/jZ/c8rekZPVyuYDvy6OM9HmXuqKd4Pnhy5KfWQ3WobrI6lpUznz
         Qlc8JnD4/rwQ+JSgnrPoXaOpEHrw7VnZoRHHP5myA6hU1eRPXdNbGyIt60OBjGGjBj4+
         aMu4K06a4Tuu5Ha7bhZBRxOTOswZwmUYPM4hl2y77GfQVdd+eXUJ9K0MupmWpy2ARrZL
         IutA==
X-Gm-Message-State: AOAM531nCfinqrbV6yV97dNKEQmdPY1f1qJgPeicTsSvrWL5yVPam1xz
        ZC07C/RM/pRnweXhA5ubOJyVN+NsNkVpMHr3
X-Google-Smtp-Source: ABdhPJzzzLWwoDV3nLbm6Ab2sMpnqVmB2wmFgALKaTLgflrv17b82hlrx/jr+hAILSCqeDm4B/VMmA==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr4597420wrh.308.1592484709011;
        Thu, 18 Jun 2020 05:51:49 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v27sm3714151wrv.81.2020.06.18.05.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 05:51:48 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH 2/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Thu, 18 Jun 2020 14:50:56 +0200
Message-Id: <20200618125057.41252-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618125057.41252-1-drew@beagleboard.org>
References: <20200618125057.41252-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This requires AM33XX_PADCONF macro in omap.h to be modified to keep pin
conf and pin mux values separate.

pinctrl-single.c must also be changed to support "pinctrl-single,pins"
with 3 arguments (offset, conf, mux).

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 340ea331e54d..f9b99cfa93b6 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -290,7 +290,7 @@ scm: scm@0 {
 				am33xx_pinmux: pinmux@800 {
 					compatible = "pinctrl-single";
 					reg = <0x800 0x238>;
-					#pinctrl-cells = <1>;
+					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
 					pinctrl-single,function-mask = <0x7f>;
 				};
-- 
2.25.1

