Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B0B309515
	for <lists+linux-omap@lfdr.de>; Sat, 30 Jan 2021 13:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhA3M2i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 30 Jan 2021 07:28:38 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:15399 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhA3M2h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 30 Jan 2021 07:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612009545;
        s=strato-dkim-0002; d=dawncrow.de;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
        From:Subject:Sender;
        bh=2m7ktwJ8CYa5D5Z216TGdiC9pI9oI1vM+K1aUTA4Sb0=;
        b=m09QDlMum+XKJgEuPk2vbwZL5m/14ntja2WPmVJiIwxwNURoHgwww0MNOe4R9f1Edh
        +Uk9rUk8/Z1jUN4N0AVuA8LWyBkTeB2qhMQ2O8wR9wX2+1cCQKfg1ulahAnfD/ApDzno
        y7TAkZt5ChjGALMBxplhVucSrDOqFj+3OfyhdWsCnPxvegYiGGIBe5GSTNRhjqDnIgZ8
        sB5IAPtfhIuqdSfIutHyzn13vGyxPOvLfm6AgvyggilmZzonfy5PwB9i7YT91rjSS9vr
        kEznUXY/4oLUM8btbXLckxTSfEpnsq/SzUalf0VlLKI4vGjugjTFsmVrvym7Mm5qeF74
        YP7w==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD/FrJVNw=="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 47.16.0 DYNA|AUTH)
        with ESMTPSA id h096ddx0UCPi828
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 30 Jan 2021 13:25:44 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     robh+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: omap3-echo: Add ath6kl node
Date:   Sat, 30 Jan 2021 13:25:14 +0100
Message-Id: <20210130122514.58375-2-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210130122514.58375-1-nerv@dawncrow.de>
References: <20210130122514.58375-1-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---

Attention, here I am not sure if this is supposed to work like that. The ath6kl driver needs to
be loaded as a module anyway and automatically find the right device. So this might be useful for
documentation purpose, but also might be wrong device-tree wise.

 arch/arm/boot/dts/omap3-echo.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-echo.dts b/arch/arm/boot/dts/omap3-echo.dts
index 3382480d5f19..8f02ff5e7da6 100644
--- a/arch/arm/boot/dts/omap3-echo.dts
+++ b/arch/arm/boot/dts/omap3-echo.dts
@@ -606,6 +606,8 @@ &mmc2 {
 };
 
 &mmc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 	bus-width = <4>;
 	pinctrl-names = "default";
@@ -615,6 +617,11 @@ &mmc3 {
 	mmc-pwrseq = <&sdio_pwrseq>;
 	vmmc-supply = <&vcc3v3>;
 	vqmmc-supply = <&vcc1v8>;
+	atheros@0 {
+		compatible = "atheros,ath6kl";
+		reg = <0>;
+		bus-width = <4>;
+	};
 };
 
 &tps {
-- 
2.25.1

