Return-Path: <linux-omap+bounces-3510-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D6A75A85
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 17:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A35D3A9FCF
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 15:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856D01D514B;
	Sun, 30 Mar 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qhCPUQOG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92527EEAA;
	Sun, 30 Mar 2025 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743347660; cv=none; b=eatAo6kkFr0DKaGyv6eOf6pjJ20HgLiS0tnxG6ARIMeyrJ6m7hzF5VpiWoyGoqthTonwCAzEU7a8k/fl46fG/XmXwUZKoSituGx6bjH8pnS5epT8e+yER2Jm+c4Bv4IhLY0zXsN2aVNt8hC0WIBop2Rw8C4Shurq8sRb5KLTi4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743347660; c=relaxed/simple;
	bh=yeJKwrt9vrcPI3mzjTYdcKlmxtTQ72iJEWTX8ZNBTvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JdHWBur58F+hgJ2m7f92k8UGV1KqKhm9OACkvmMLEJ80rb4B4Kf4Ue5hIgr6OGyI+fojCcGJot3u2NGa4OKVFwLj14obJ7yWp2fFzPyZ1Le3SG2TAOnQD9jLFPIOgnns2vZJrE+AgF9fifzeH74dkL6caEoSVx46VZzz7Z5T58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qhCPUQOG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TR5+fLXi7IOwdIvLEzgdp2rQbubqDgd+JsvxWrBPQCw=; b=qhCPUQOG25BR/SLX5Z+6kTDeef
	hNdqI+UBAmk9tucSHg+uipZIlzCRs5MGX/03ut2vhpgTM0uz4oQr6cQldIbgjQqrS5YKFCuFSrSzZ
	fCEBxOSRbRYBThE7/VZSA3fvB20Spa1pPUR1M4ym1mefidJV1ZSWcVrZeB5MXUW5A+kIC/cME9Lp9
	TEFppqCuH6xPKMV0mivDkWtEbSKBvDw83edY4fz8nMahC1EAaUv+Rqo0iHIwSQZ9VkrE/CkdiqVYJ
	z54+vmCUvWnO3viRe52JfDoMQRJtNrDisWgHq6fLhr0E677y5pqIWHZ0GDYZbA9mz1uur9i0ognvF
	97C2UFhw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	devicetree@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/2] ARM: dts: omap4: panda: fix resources needed for Panda
Date: Sun, 30 Mar 2025 17:14:00 +0200
Message-Id: <20250330151401.444956-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250330151401.444956-1-andreas@kemnade.info>
References: <20250330151401.444956-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pandaboard needs a 32k clock in the TWL6030 to be enabled
to work. With some luck, it is enabled by some U-Boot fork.
Do not rely on it and properly specify the requirement.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index 97706d6296a6..c860b590142a 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -130,6 +130,12 @@ hsusb1_phy: hsusb1_phy {
 		clock-frequency = <19200000>;
 	};
 
+	wl12xx_pwrseq: wl12xx-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&twl 0>;
+		clock-names = "ext_clock";
+	};
+
 	/* regulator for wl12xx on sdio5 */
 	wl12xx_vmmc: wl12xx_vmmc {
 		pinctrl-names = "default";
@@ -408,6 +414,7 @@ twl: twl@48 {
 		reg = <0x48>;
 		/* IRQ# = 7 */
 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
+		#clock-cells = <1>;
 		system-power-controller;
 	};
 
@@ -488,6 +495,7 @@ &mmc5 {
 	non-removable;
 	bus-width = <4>;
 	cap-power-off-card;
+	mmc-pwrseq = <&wl12xx_pwrseq>;
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.39.5


