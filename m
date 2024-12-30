Return-Path: <linux-omap+bounces-2926-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B78359FEA7E
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 20:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C85816160F
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2024 19:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E99199EBB;
	Mon, 30 Dec 2024 19:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ob+lgZuU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D022339;
	Mon, 30 Dec 2024 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735588571; cv=none; b=KV6DYmOYLntzB3leggz8EsKKtD9Oj9luA/Ry+xeMk0CTidccfRnCxXYd0Uhva7Ks+DYEQL1vIcNT3vvePXgLJxJ3UMkwm2yj0h6CcXBkxSQlVXji40xGoBrq9hqOk1toss10ObJqUtrfVwk+Z6d6yU/lhgRY8w8wUSgyR/vwuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735588571; c=relaxed/simple;
	bh=uO2aa0tQIBQRKR3ImjZVQPDD9b4U91QJskYFzhlyofo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7EK7eDt5jXGQ9mdJTq3A4D9gtS0SVkXWfNYX4cB0+dWiz/2Npij/m/wpHI4OjIyatE8pAOjbxkNgStw/CCY3P2YYesW6+ZtO56HECEfnG+IOY7onF5RNOmYBhKvCnWWWTvrvwT8sfwYftHH1u8FeRuGzSNATeuyB5EPjXn2fd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ob+lgZuU; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=09G9jccS9HpCbj9A7amcjX/o85Xk3P2r275JkM5xxqY=; b=ob+lgZuU6j45NlIpY4NJMppH7T
	WXlg0NfHtOBpknKeTd/jKmM9fxsXOQWM+APt0e8ikIA/kmZGZBzJ9QJLNio+97KZHPlqwep9Mf5zh
	E+JVMdJinev67GJ9ancMQ6kAThaKEbyftySq2t0ARhjWjIYNp9DZl44NRtSMNbA7AUC/m2krKokLF
	CQjUXJxk3DVZi3ASlUdUbb01RGJViYN/DYGLRZ+tZqzGbO2SS7+bc7SlkWhyiwUHw1vd6h6JDieAy
	hQ/FjmSfK2AiqAIxLt6Fi2Ol/wWFGI+W5vMEGbMHWCnAsosPNcZaFuGC2j008CM1dAhL4TeBgkaau
	Cz89jUXA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	rogerq@kernel.org,
	aaro.koskinen@iki.fi
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
Date: Mon, 30 Dec 2024 20:55:56 +0100
Message-Id: <20241230195556.112118-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually interrupts are overwritten in the board file to specify a
mux-dependent dedicated wakeup irq, so there is interrupts and
interrupts-extended property which is not allowed. That has generated a
lot of noise during dts changes if just a phandle involved has randomly
changed.

Avoid that mess by specifying interrupts-extended in the dtsi file.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/
---
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 3fcef3080eae..150dd84c9e0f 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -1414,7 +1414,7 @@ SYSC_OMAP2_SOFTRESET |
 			uart3: serial@0 {
 				compatible = "ti,omap4-uart";
 				reg = <0x0 0x100>;
-				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
 			};
 		};
@@ -1765,7 +1765,7 @@ SYSC_OMAP2_SOFTRESET |
 			uart1: serial@0 {
 				compatible = "ti,omap4-uart";
 				reg = <0x0 0x100>;
-				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&wakeupgen GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
 			};
 		};
@@ -1794,7 +1794,7 @@ SYSC_OMAP2_SOFTRESET |
 			uart2: serial@0 {
 				compatible = "ti,omap4-uart";
 				reg = <0x0 0x100>;
-				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
 			};
 		};
@@ -1823,7 +1823,7 @@ SYSC_OMAP2_SOFTRESET |
 			uart4: serial@0 {
 				compatible = "ti,omap4-uart";
 				reg = <0x0 0x100>;
-				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&wakeupgen GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <48000000>;
 			};
 		};
-- 
2.39.5


