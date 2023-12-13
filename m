Return-Path: <linux-omap+bounces-156-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88F810B9B
	for <lists+linux-omap@lfdr.de>; Wed, 13 Dec 2023 08:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A18282735
	for <lists+linux-omap@lfdr.de>; Wed, 13 Dec 2023 07:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AEE199B8;
	Wed, 13 Dec 2023 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="hWZ47rdx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3627BB7;
	Tue, 12 Dec 2023 23:37:01 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 2274E60402;
	Wed, 13 Dec 2023 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1702453019;
	bh=ySuNDXt7/qREolS5muvDf1EPyM3JYE99pT4IeNacUio=;
	h=From:To:Cc:Subject:Date:From;
	b=hWZ47rdxUD7y+RK1w1/FOqgtD7RW2mGkRi2B8/hqbjteh2nWSLl7DFXPmpH3nu0fJ
	 6NDz8gdpKQHv+ZLUzQbrlk/oGA/0Ibc05HqcY335PlLNIdWcj/vqRHvZSiIk+W6lr6
	 nshFdCEmb0KVfxZzOn/Hrl++dwllv/x94ROujsQcBrPnzV3w0dc+vZvAEstUt6gyl8
	 UdRr2GHDsX2+Z92NKoQaKQMKqk71zVu429hVfg8b+r0iyi2aL9yC7bXDxASICqcpt4
	 dNlR4wDo831A2BnsQAUW4TxeqnldACftMwmNAtbkQY6D/x62dj2jVBMH4Y7NQW2aJf
	 XaLjr4228SGxw==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: Fix occasional boot hang for am3 usb
Date: Wed, 13 Dec 2023 09:36:37 +0200
Message-ID: <20231213073637.58778-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With subtle timings changes, we can now sometimes get an external abort on
non-linefetch error booting am3 devices at sysc_reset(). This is because
of a missing reset delay needed for the usb target module.

Looks like we never enabled the delay earlier for am3, although a similar
issue was seen earlier with a similar usb setup for dm814x as described in
commit ebf244148092 ("ARM: OMAP2+: Use srst_udelay for USB on dm814x").

Cc: stable@vger.kernel.org
Fixes: 0782e8572ce4 ("ARM: dts: Probe am335x musb with ti-sysc")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/am33xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx.dtsi b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
--- a/arch/arm/boot/dts/ti/omap/am33xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx.dtsi
@@ -359,6 +359,7 @@ usb: target-module@47400000 {
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
+			ti,sysc-delay-us = <2>;
 			clocks = <&l3s_clkctrl AM3_L3S_USB_OTG_HS_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
-- 
2.43.0

