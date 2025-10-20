Return-Path: <linux-omap+bounces-4722-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91313BF13EF
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64D0E4F4E8A
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 12:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F40E320A01;
	Mon, 20 Oct 2025 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/zm8dTH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB931E115;
	Mon, 20 Oct 2025 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963539; cv=none; b=pHq2FZMT0mtyBr+DM6ycP2Rzd81JKmhmyfWSp2mYs5ojYObZCr5ufuDqc0ukLNXDSbCKQ5z4UjVflLPiCilAJUhZnKvyR2XLCYy+mnDCxlpBa4ghEcafDSFr/qqWp85M3jHqYSBVqcxTSshgTwKIGm8JdQU9wwiW/D94G5NmBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963539; c=relaxed/simple;
	bh=j8lu+nmW/wITIV09UcRP4+ZJGg/2q0lM1t5UBH3kUH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4V22LQl0ABZ5m0VEoXcRr0y3knrWynEYeCDrVOYt6+NjHE9qEsyMhcuN0VqWRkoY/kSnzvN3s43nMAQc0cwn5NhdjFugOURwRG04Ls87udVgTKoJIjV+qSJafB60mvnIZVcKR9ZIxRIK7HLa2hwchWVYYPUkUxm+bmFEdOkdM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/zm8dTH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA18CC4CEF9;
	Mon, 20 Oct 2025 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963539;
	bh=j8lu+nmW/wITIV09UcRP4+ZJGg/2q0lM1t5UBH3kUH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E/zm8dTHS6hi4HCqPP8At+mvMjdfTsmdGexJIVJpHt9WBoJUPAYJivriFFI+vkRFG
	 eCsMi1GftCKplDHmhiqbU3aSBMcnQ7Kq95Yi2CXJ2a5P4w0EPH94oQGRUbXMRMSqry
	 2hyOeVREJ0TSwT8KEgZ15QWJrW5fmuhK/kuNOk/qkAysuPhv3Ww4fA/0iM+VYI3W7u
	 EsTWJP9lDuO7PRI0Npr96MZRLi8AsZy8Dd3UO9vwZOb4rOedAeMTB/mCyb81hcG4Nz
	 r0OcfH9sPaixGc9EFJdHhTa1PbzhW+nhIy9fb502pNlwPKgpMxjOr8OuHvYNsyXhIe
	 DxuEXz6p2Q0BQ==
From: akemnade@kernel.org
Date: Mon, 20 Oct 2025 14:32:00 +0200
Subject: [PATCH 3/3] ARM: dts: ti/omap: omap4-epson-embt2ws: add
 powerbutton
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-twl6030-button-v1-3-93e4644ac974@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
In-Reply-To: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=k93Dkvm78+KyWfNASOn249sd0dH/r3H5Scsp5YCm0fo=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBnftI9XizFsS2bXnbXXsF7HJGxyvph4/dfA307qF37GR
 780nLS5o5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIk0yTMyrBLjKWhsP+Bw54T8
 ddOMyv0znx1IYOlh61zwMmC3VubESwx/JfO+ME962v1SqGLRr5x1jxyClgUeMGVzmzdZvTJou3Q
 VIwA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

There is a power button connected to the PMIC, so describe it to be able
to power off the device in a convenient manner.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index c90f43cc2fae9..673df1b693f28 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -229,6 +229,11 @@ rtc {
 			interrupts = <11>;
 		};
 
+		pwrbutton {
+			compatible = "ti,twl6030-pwrbutton";
+			interrupts = <0>;
+		};
+
 		ldo2: regulator-ldo2 {
 			compatible = "ti,twl6032-ldo2";
 			regulator-min-microvolt = <1000000>;

-- 
2.47.3


