Return-Path: <linux-omap+bounces-1786-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B593C3FB
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 16:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04058B21C2C
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2024 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBD819D067;
	Thu, 25 Jul 2024 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="GfvsxX1u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB819D064
	for <linux-omap@vger.kernel.org>; Thu, 25 Jul 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917209; cv=none; b=Iya0ymyPN9UmVJLYNH1EQfgiDXkaGFBWBLImgbZbSzL26xXPS2LyEqkupAy8wNybdwgPK6pWg0lssjaIQD6zZ7jKysZgoJ+vGlLVcmuBCRDBGnHwFmdcjFm6FwLR7YYbjEvcwBC3xn2t+SLPi7+trkLr1Tm9NIT0d5rYYo/nCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917209; c=relaxed/simple;
	bh=Lxqj4gA6MMHbTc9nlE8oy8mc9Cdkbg7+JGmmQnKsstY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EY+mIGhO6DiO6YvK/xMO+L5/u+HdgnjMjvYtmR0/M0YvJZFfrf7Cl/JwZ7rTTpkmKUnr/edjKXl9qakDMlhv2kh6y4Xl5cFolRLfdAlNDskAIHn4wWDtitteRdiV18D79SJ3ULBVNqA4PZcf8EaO7YWwvR/KMWiXbshb8LivQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=GfvsxX1u; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1721917203; x=1724509203;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lxqj4gA6MMHbTc9nlE8oy8mc9Cdkbg7+JGmmQnKsstY=;
	b=GfvsxX1uKTjfeApekLX8inboN2Oo6W6T/Z/e4pX6toKkY69G1rUazgdQPTgI0pZy
	aUTnGdASNeejnLLZWTlG36TxN8TmZU8PaHggC/2TmkWATK05fVdUY5spnLXAHCFz
	q4RBURcQUNTXicL2/wKSPynBZ8iZ8AKVC/wrMSiEi0Q=;
X-AuditID: ac14000a-03e52700000021bc-f3-66a25f13bfb7
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id CB.5E.08636.31F52A66; Thu, 25 Jul 2024 16:20:03 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 25 Jul
 2024 16:20:03 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <khilman@baylibre.com>, <tony@atomide.com>, <s.hemer@phytec.de>,
	<linux-omap@vger.kernel.org>
CC: <upstream@phytec.de>, <d.haller@phytec.de>
Subject: [PATCH 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
Date: Thu, 25 Jul 2024 16:19:51 +0200
Message-ID: <20240725141952.81213-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWyRpKBR1c4flGaQcdveYuf7VuYLGYv6Wex
	2H/Fy6L7nboDi8e3r5NYPN7faGX36O9uYfX4vEkugCWKyyYlNSezLLVI3y6BK+P+pVlsBe28
	FXs/d7I2MDZwdzFyckgImEisXnyApYuRi0NIYAmTxLunu6GcJ4wSx9bOYgGpYhPQlJg+aSsj
	iC0ikCzRvHISM4jNLKAn8aFzKVhcWMBT4vGUbiYQm0VAVeLXvS6wOK+AucS+Y49YIbbJS8y8
	9J0dIi4ocXLmExaIOfISzVtnQ82UkDj44gWYLQRSv6YbrnfaudfMEHaoxNYv25kmMArMQjJq
	FpJRs5CMWsDIvIpRKDczOTu1KDNbryCjsiQ1WS8ldRMjKGhFGLh2MPbN8TjEyMTBeIhRgoNZ
	SYR32f2FaUK8KYmVValF+fFFpTmpxYcYpTlYlMR5V3cEpwoJpCeWpGanphakFsFkmTg4pRoY
	2UMEDRZrTEz/uyVQwlBBhiv7mFOH3ESruHx54/6vHd9mu32OqPPZ+Vnr/Jl/2gIHmUIqnQsF
	Hi8R+JLE8uDgeZbu8xfW8twq2vdJSaP89EM+TdbfpZUMt1VTP/2PfF9tcqKgN2RGbfpuBgZx
	1u6G6Vtn5CeGh8y+GZvCeGuO3yFJ24SqrmVKLMUZiYZazEXFiQCXJgnVSAIAAA==

From: Steffen Hemer <s.hemer@phytec.de>

RTS pin seems to have inverted behavior on am335x, other than expected
with default "rs485-rts-active-high" (instead of low on idle, high on send,
it is the opposite). Transceiver datasheet also suggests a pulldown.
Add includes to pin definitions that are used.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/ti/omap/am335x-regor.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-regor.dtsi b/arch/arm/boot/dts/ti/omap/am335x-regor.dtsi
index 625db3bcd365..287d209a0ea9 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-regor.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-regor.dtsi
@@ -5,6 +5,9 @@
  *
  */
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/am33xx.h>
+
 / {
 	model = "Phytec AM335x phyBOARD-REGOR";
 	compatible = "phytec,am335x-regor", "phytec,am335x-phycore-som", "ti,am33xx";
@@ -188,7 +191,7 @@ uart1_rs485_pins: pinmux-uart1-rs485-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
 			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 };
@@ -198,4 +201,9 @@ &uart1 {
 	pinctrl-0 = <&uart1_rs485_pins>;
 	status = "okay";
 	linux,rs485-enabled-at-boot-time;
+	/*
+	 * un-intuitively, yet with the default (active-high),
+	 * am335x RTS is high on idle and gets low on active !
+	 */
+	rs485-rts-active-low;
 };
-- 
2.25.1


