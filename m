Return-Path: <linux-omap+bounces-2779-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A928F9E5FA2
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 21:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A1F16BD78
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 20:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D161CB51F;
	Thu,  5 Dec 2024 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bptk8xbH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8774C1ADFF8;
	Thu,  5 Dec 2024 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431469; cv=none; b=oyK1rES9TT08p3D0OCA25KXmTtbqd/f9tbyBT+qDkzh+xpIM5qOdOT9Mg4heOOUkvBDMcrH75N6kVCWvTDacbirh59aBJ+h6+nE+CVWorjo6SdCfhh2C4IECyKgfXCa+wAT9fAbGRDnkRbG+GazAapqc8OInJDBT9jHTMq/tp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431469; c=relaxed/simple;
	bh=VTCkfD//HfKP7m04eXdsIEE8RDZvSDa2bD1b2QvnC3I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URx9L/SjrOOgwxhWtvD9Fy+7VELlE60gs9c0ggKIiT1BE86/ijX+W24vlXuqynrt4U4kB1mdleq/4EBDZwDYxJ6QsyEuVVhC3IAMxs/91tQcvp+uVfbfA+Ym9vd0F0ijooNOL/AIar3r+9fQZsSy+1f8DdLm7OnPsBQb+tWmKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bptk8xbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AACC4CED1;
	Thu,  5 Dec 2024 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733431469;
	bh=VTCkfD//HfKP7m04eXdsIEE8RDZvSDa2bD1b2QvnC3I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bptk8xbHDIUrogcTrKTTu4w/1rnkodQU6HBiGGQHB8w7R+J7vRp3c0h4bvYU+IovP
	 6C//FMaYkASidu0GEOa9KnJ9a7Emc1Rpplx+5cyTXJuwXonHfgaejKUkYMwZgo65gW
	 De94XeCXBr99jR9GQvNQv76T6a4BiH4RNLvHGLDlNKloMXw1kcTYPUztDKZzYCi46r
	 CYJxKn5cEH42IfFm5ZdUyVYEf8qdDPRvDA6FApvTB/Aj2sngb2lEFrkzfgnKGvx9bu
	 YWUcx/xFCROu2aNsAvrtcNxHvnvgXRWz8Bx7V6Q0XA0tMZRbuU3PykxSuQMiaWirFT
	 vnv9QnyNLfcRw==
From: akemnade@kernel.org
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	khilman@baylibre.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties
Date: Thu,  5 Dec 2024 21:44:13 +0100
Message-Id: <20241205204413.2466775-3-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241205204413.2466775-1-akemnade@kernel.org>
References: <20241205204413.2466775-1-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

Specify the dimensions of the touchscreen propertly so that
no userspace configuration is needed for it.
Tested with x11 and weston on Debian bookworm.

What is in now is some debris from earlier tries to handle
scaling in kernel:

https://lore.kernel.org/linux-input/cover.1482936802.git.hns@goldelico.com/

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 2ee3ddd640209..ed728661e1895 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -591,8 +591,10 @@ tsc2007@48 {
 		interrupts = <0 IRQ_TYPE_EDGE_FALLING>; /* GPIO_160 */
 		gpios = <&gpio6 0 GPIO_ACTIVE_LOW>;	/* GPIO_160 */
 		ti,x-plate-ohms = <600>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <640>;
+		touchscreen-size-x = <0xf00>;
+		touchscreen-size-y = <0xf00>;
+		touchscreen-min-x = <0x100>;
+		touchscreen-min-y = <0x100>;
 		touchscreen-max-pressure = <1000>;
 		touchscreen-fuzz-x = <3>;
 		touchscreen-fuzz-y = <8>;
-- 
2.39.2


