Return-Path: <linux-omap+bounces-4328-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5ADB365B0
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 15:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7118188D86A
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AB43469F4;
	Tue, 26 Aug 2025 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="P8X40FAp";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BYZ/TNGn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56E33437B;
	Tue, 26 Aug 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215811; cv=none; b=CkAe6UlXUpdj8se/0FAsWVt3mZfoIip2rdEmfG7UtNSpqnsHXLzxu4IHdgAgH5SPU0Qn6NzLsczgsP8/2zLKAEQq/fA6Z1/6HKgD1zj1fK0PVpONXS57QV5TSU66TXfyy0RGyctQ56rnX3CPkaFPgLZ0nJ7iubn4Pxk9dEntbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215811; c=relaxed/simple;
	bh=AiapV4JvL1mIwtco1hHkpafSmeNXbnu25/eatKwFGSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHmqbS998Lb86C7zJX71ofYgERav4DaqJ2FzsIViCuM5NFb/bfGAc4hblzYRjpjK9ZrQCCqizX4kK/FKgt0wBJyqA7XAiNMh5AwVU/sKknUKG1WGnx44LFE82vyBLjxp/JmW8y0VKvsX8eGDtIaWd2MV+bDubL6zAUDJi5x24Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=P8X40FAp; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BYZ/TNGn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756215808; x=1787751808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qaR/cIl5MrMFpC0M0Teab9KwQ7JYnRihMiOqD2KpIkE=;
  b=P8X40FApR+IGiZN2WHfqEHfxp0f5OqKeUJwCuHVzz0m1442ZvmTdPm7Q
   8iaC2tt5qMcmDFNKjimROwg3k2CUTEgVcZ8U5QUhPz7uFHc/nYPvNuGRs
   axEVcTHqtgZbw0PRNndcYzpv4HzBrwbqeFo22G6oFCb0M197wFSLc53Bs
   NfAJ3+zHYHYPRdGjg2KSuOX13DUpuz4xmKw9PL7ow/37W9ThEmWQwWPO1
   G/vGTFGkEDNXcoajgleoLqkl3xaKldN07VxRFnwSFKiqGlTEjuL6X5Rid
   YcZy40PEp6+DzoEZOkMdT3GgaFp8LhcnD4FJcmWHJQ95Qsirc7LX0CL3T
   A==;
X-CSE-ConnectionGUID: 59UM7oSwTyqXUXfS+EcQbg==
X-CSE-MsgGUID: pdQRCyk5Rby/Pirns6fm+w==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45916687"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 15:43:20 +0200
X-CheckPoint: {68ADB9F8-18-820F521C-C7779E56}
X-MAIL-CPID: F72572F28F6FCB243EDC10631541F80D_4
X-Control-Analysis: str=0001.0A00210B.68ADBB12.0034,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0286167EF5;
	Tue, 26 Aug 2025 15:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756215796; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qaR/cIl5MrMFpC0M0Teab9KwQ7JYnRihMiOqD2KpIkE=;
	b=BYZ/TNGngpOEHgvx9etViCexrRkTt3V6rVy/ChdQMfnlisuSjSuMYVdnQpV6jTUgN24Pmt
	tCUijika3gsHLIaZQgDgawUU4C3DO9v0sgfA+VbToQSb18O/A6wQJMMgeCjBhPrTY5+BZM
	ERLm37jVo7cD3ybs/I/tm3ab4T1xZJYkfoHmzupms/+UtNt8HTwx19h3K1buezaDx+1vJn
	vEVxrzWCpr6oW1gPxXSKH5R9e0qJWrgQ3azK7j6BME0VRv+vJ4HP4bkVCwc3NgG4bMTOIb
	w3UDiIvfEdvw+fhtf5fcUzyty4TWrXljqgTv1xHhhDFOqTU3eXIJOzFu3Dt1Ig==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: am33xx-l4: Drop ti,omap3-uart entry from UART nodes
Date: Tue, 26 Aug 2025 15:42:58 +0200
Message-ID: <20250826134259.2564191-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826134259.2564191-1-alexander.stein@ew.tq-group.com>
References: <20250826134259.2564191-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

ti,omap3-uart was kept around to work with legacy omap-serial driver.
Now that we have completed move to 8250-omap.c drop legacy compatible.
This follows along commit 40a95e2915e3f ("ARM: dts: am437x-l4: Drop
ti,omap2-uart entry from UART nodes")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index d6a143abae5f6..cef24aafed1a8 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x9000 0x1000>;
 
 			uart0: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <72>;
@@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x22000 0x1000>;
 
 			uart1: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <73>;
@@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x24000 0x1000>;
 
 			uart2: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <74>;
@@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa6000 0x1000>;
 
 			uart3: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <44>;
@@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa8000 0x1000>;
 
 			uart4: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <45>;
@@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xaa000 0x1000>;
 
 			uart5: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <46>;
-- 
2.43.0


