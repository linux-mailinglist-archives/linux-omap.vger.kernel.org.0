Return-Path: <linux-omap+bounces-1802-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29631940D4F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 11:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8E51F22868
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2024 09:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FF2194C74;
	Tue, 30 Jul 2024 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="qXsls5WC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E3194C71
	for <linux-omap@vger.kernel.org>; Tue, 30 Jul 2024 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331468; cv=none; b=pw/aqRWIqgw+tqkJsO4GpzbNQPgjHGvCkSP7xaQf0/BIIuV2Pgss2oVH3O0hglebx9gUsdnfVJjcI+MmZ/y6zhmURdNKAmIsRImSH6JXuclZiCeF/9s11nfktBRajwKalxEy4Ymt4Au48ChTnITnjwdiUh/05cCCSNUL0PiJr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331468; c=relaxed/simple;
	bh=j5c/VGD7hioG3aDYqkhrRXCzxUIHpIz8Nhd+ls1Gaq0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qhvW2jbaom5PXXcApkmTrpQd5B/jdjTXrkkJ031PMgj+NO9ph3qexVI66yfWEctf10/V3J9HEJyO3Qu0wFi626XAwnOArTCNtK8RZN98uO/8lvgXYxIz7eIU1wDXwPyEyyGn2uxga3/CtVqNSTS9iephwS/gbH2rF4PJA3mafJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=qXsls5WC; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1722331460; x=1724923460;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j5c/VGD7hioG3aDYqkhrRXCzxUIHpIz8Nhd+ls1Gaq0=;
	b=qXsls5WCWAk8/FarLTBgGkkysvaMEHUz12ZuWdXYY6NmBbfuHo1hSjray4EVMcvX
	SaLKCiDKaXsF0kgb4KSvfBicSHKw5LlXEqtPHlvn18Jo29EA9yTKKoCjpVlqVola
	ehfYIHq/orblblqUMHdsC21ngbHTlEK5tseVWJ45HE0=;
X-AuditID: ac14000a-03e52700000021bc-f5-66a8b1449db2
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id CF.0E.08636.441B8A66; Tue, 30 Jul 2024 11:24:20 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 30 Jul
 2024 11:24:20 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <khilman@baylibre.com>, <tony@atomide.com>, <s.hemer@phytec.de>,
	<linux-omap@vger.kernel.org>
CC: <upstream@phytec.de>, <d.haller@phytec.de>
Subject: [PATCH v2 1/2] ARM: dts: ti: omap: am335x-regor: Fix RS485 settings
Date: Tue, 30 Jul 2024 11:23:52 +0200
Message-ID: <20240730092353.10209-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWyRpKBR9dl44o0g4fzlC1+tm9hspi9pJ/F
	Yv8VL4vud+oOLB7fvk5i8Xh/o5Xdo7+7hdXj8ya5AJYoLpuU1JzMstQifbsEroz/H+YzFZzg
	q3j16zdTA+NCni5GTg4JAROJJ8e6WboYuTiEBJYwSRxt/s0G4TxhlPj2cRcjSBWbgKbE9Elb
	wWwRgWSJ5pWTmEFsZgE9iQ+dS8HiwgI+Ehs2dIDFWQRUJe5sW8ACYvMKmEvceH2MBWKbvMTM
	S9/ZIeKCEidnPmGBmCMv0bx1NtRMCYmDL16A2UIg9Wu6WWF6p517zQxhh0oc2bSaaQKjwCwk
	o2YhGTULyagFjMyrGIVyM5OzU4sys/UKMipLUpP1UlI3MYKCVoSBawdj3xyPQ4xMHIyHGCU4
	mJVEeOOvLE0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzru6IzhVSCA9sSQ1OzW1ILUIJsvEwSnV
	wMieEm89dwIH262e2dUfd1t8U/287ezeqhuTdwc1GJn6CBbOLjXdnN3Hqjdpgt31Sr6QmiAV
	O4ulQZG+c6bmJEbt+LgtKmC77qMrdoF7MretcBVljOZ5v+WbYIjrsafT65/OWLd3reH28yaH
	TQSMuyZUfeSptxO5cb77qq/h462Cx7eZrXp7nEuJpTgj0VCLuag4EQAOUQOgSAIAAA==

From: Steffen Hemer <s.hemer@phytec.de>

RTS pin seems to have inverted behavior on am335x, other than expected
with default "rs485-rts-active-high" (instead of low on idle, high on send,
it is the opposite). Transceiver datasheet also suggests a pulldown.
Add includes to pin definitions that are used.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    v1->v2: Added my signed-off to patch 1
    Link to v1: https://lore.kernel.org/linux-omap/7hbk2g3qhe.fsf@baylibre.com/T/#t

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


