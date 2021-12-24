Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D6147F13F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240510AbhLXV5I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240336AbhLXV5I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:57:08 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0960AC061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:08 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id x15so37445366edv.1
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyvgihyUKnAkZZ9N6i7mgmHZa3IHB4liX5osoY6lCeQ=;
        b=Y6C6iEc5HdmsvJJI6MnL2itrQfEaEwHZNd82qLNXR81C5WUso1WPZ1Ae/vbaspcaVa
         e0K8SHvAmxjKKNXKKYLSaBkBGAvaryqgHPZhc+P+Y/wedrEAajsfd9+Pq2/WN5b+ykzS
         Lu50vtZFv9nKOzrr99iFXzQGLcfQ07H1P8xdvRZy+OAz1ZSmFYciel6Wb/RM979g+dL8
         +3iaP0AXB28/E+rnL6Mfq/YDxC8yU9nfpvkLbj4cLOISKROyRL0L7OhWAmbpNqbyWBR8
         c5TwV196QZaPPavxN7edd3Evwkj94Tt7UnA++HcH3i593DTA06Jw+DokVW+3lUaXAZHj
         yE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=OyvgihyUKnAkZZ9N6i7mgmHZa3IHB4liX5osoY6lCeQ=;
        b=vNSJukgZS+S2kjbY23HyUg43uZktwVfG71JozGGQq2CCwoXGNpfURI2rmGmf2I7v1f
         3dZeXraEyvKTHiQo2fZksOvhzn5+oreEHxbD2LAFqf1oRmMhsHB4joXISZ/aJQdidC8N
         aqNpmLxOzHKjHGwaSg0b4CpO1Ayi2Wo2NQqt+ldifckT+fqNuzlLLVwvn1mEPX3yK0Bj
         SuqRhw2ZsezNXQU/wcHeBa9zXVW3sffFJHfN7QFIqvccXv3kp2PdPdHwEcwft/P4MsiK
         kpA7Fdl2XA3B4uGpYurSpy81tDjIQSkstknAWYrPt2SNswwYqpyDchAZDI0lxyAuONVf
         uKPA==
X-Gm-Message-State: AOAM533i+SGs63Ajw0ytpeiMzyYKnlNKVBvRnbZcBKZlrGt6OyoTXgyU
        MyallKH7Cs1X/bj1LvJgrttJ5JXr0fA=
X-Google-Smtp-Source: ABdhPJxqYE2Ryv7GxMSII2owvomOT9QYy8K5P/ZcO9TCAJrpgIYEjTqwkCJM1MQWRzvNMaEx2PbakA==
X-Received: by 2002:a17:906:c08c:: with SMTP id f12mr6251860ejz.419.1640383026499;
        Fri, 24 Dec 2021 13:57:06 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id dn10sm3022476ejc.139.2021.12.24.13.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:57:06 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     linux-omap@vger.kernel.org
Cc:     peter.vasil@gmail.com
Subject: [PATCH 3/6] ARM: dts: omap2420-n810: Add Tahvo/Betty LEDPWM and Vcore bindings
Date:   Fri, 24 Dec 2021 22:56:32 +0100
Message-Id: <20211224215635.1585808-3-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Vasil <peter.vasil@gmail.com>

Nokia Tahvo/Betty ASIC provides PWM output for LED control and voltage
regulator for adjustable Vcore output.
These are both used on N8x0 devices for display control; LEDPWM for
backlight and Vcore for framebuffer IC power.
---
 arch/arm/boot/dts/omap2420-n810.dts         | 13 +++++++++++++
 arch/arm/boot/dts/omap2420-n8x0-common.dtsi |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap2420-n810.dts b/arch/arm/boot/dts/omap2420-n810.dts
index 09c1dbc0bb69..30f9f9e1a377 100644
--- a/arch/arm/boot/dts/omap2420-n810.dts
+++ b/arch/arm/boot/dts/omap2420-n810.dts
@@ -22,6 +22,19 @@ v28_aic: v28_aic {
 	};
 };
 
+&tahvo {
+	tahvo_ledpwm: tahvo_ledpwm {
+		compatible = "nokia,tahvo-ledpwm";
+	};
+	tahvo_vcore: tahvo_vcore {
+		compatible = "nokia,tahvo-vcore-regulator";
+		regulator-name = "tornado_vcore";
+		regulator-min-microvolt = <1005000>;
+		regulator-max-microvolt = <1475000>;
+		regulator-always-on;
+	};
+};
+
 &omap2420_pmx {
 	mcbsp2_pins: mcbsp2_pins {
 		pinctrl-single,pins = <
diff --git a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
index 63b0b4921e4e..88d44f5a5f63 100644
--- a/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
+++ b/arch/arm/boot/dts/omap2420-n8x0-common.dtsi
@@ -22,9 +22,15 @@ &gpio3 0 GPIO_ACTIVE_HIGH /* gpio64 sel */
 			#size-cells = <0>;
 			retu: retu@1 {
 				compatible = "nokia,retu";
+				reg = <0x1>;
 				interrupt-parent = <&gpio4>;
 				interrupts = <12 IRQ_TYPE_EDGE_RISING>;
-				reg = <0x1>;
+			};
+			tahvo: tahvo@2 {
+				compatible = "nokia,tahvo";
+				reg = <0x2>;
+				interrupt-parent = <&gpio4>;
+				interrupts = <15 IRQ_TYPE_EDGE_RISING>;
 			};
 		};
 	};
-- 
2.25.1

