Return-Path: <linux-omap+bounces-21-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B247F89A6
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3646B211A3
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB51C8D5;
	Sat, 25 Nov 2023 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF8710D8;
	Sat, 25 Nov 2023 01:29:53 -0800 (PST)
Received: from p200301077700a9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:a900:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oyw-006fp8-3a; Sat, 25 Nov 2023 10:29:46 +0100
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1r6oyv-0004JQ-2m;
	Sat, 25 Nov 2023 10:29:45 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	bcousson@baylibre.com,
	tony@atomide.com,
	andreas@kemnade.info,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 4/6] ARM: dts: omap4-panda-common: Enable powering off the device
Date: Sat, 25 Nov 2023 10:29:36 +0100
Message-Id: <20231125092938.16535-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231125092938.16535-1-andreas@kemnade.info>
References: <20231125092938.16535-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the TWL6030 chip is the main power controller here, declare
it as system-power-controller

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index f528511c2537b..97706d6296a68 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -408,6 +408,7 @@ twl: twl@48 {
 		reg = <0x48>;
 		/* IRQ# = 7 */
 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
+		system-power-controller;
 	};
 
 	twl6040: twl@4b {
-- 
2.39.2


