Return-Path: <linux-omap+bounces-2208-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5797987C
	for <lists+linux-omap@lfdr.de>; Sun, 15 Sep 2024 21:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC761C21B1C
	for <lists+linux-omap@lfdr.de>; Sun, 15 Sep 2024 19:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C2D1CA685;
	Sun, 15 Sep 2024 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="4GfNyVVs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A63D551;
	Sun, 15 Sep 2024 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428951; cv=none; b=emVLVPQJd211FhKtJg++bDfb6hV8tmXZTrqltyqpY1wMsRHmuoQnLGTicyKekSF75Y2FSz5MjFZW8elLVHmFdEcNYV3U5zNVx+ppXurC89z/TZ80Kgatuq1l4KmdJzeqmLWavm1B0TcrayOCM+iwfL+qNIBJfdvVDvRnGXNHo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428951; c=relaxed/simple;
	bh=tuVA2WxlehopaUYYIhQg6h1R4SWk601XYWtIMU3ROH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=geylrb7TCElPH+3akeyOAzfQg7crGm+RdQ6xcskmMbGhba8HNUhkDsZXIo1LkBKSWGIQd4W3blEWrkhcYnlSRkvg76xOYug5T4LgIlVuV4aAJVwVCImDm3L2DVNSlKf/46kAZ9N6oYI5iM9nvUGoBzEB4e8jPrNkGQc9GR04Gbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=4GfNyVVs; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=45Z33l/RcutDajIr/YKmREB0obYUTwFgojxxwKicMXU=; b=4GfNyVVsrxdoIGrOJ0cXr9AlRB
	penG2KpgmIVe81/fQB9BpURffzqCXhBUWOqnBQgylPYgbY+qj9HImhis3oRzImPnWvutgAntvBxs/
	R7SkBa56djhDsvATwBiBhePM3lya9/O6yjLxO3u+D2h/ZaxzHlJ15+dgV5R+9SgldqGT+KOLV/reT
	EZsmKv9T6Hb4+RoVTLqER8MT9CW1n+pbNCadzv+vb6Zr8wDOQ/N0unCS9ai+nT3nsz5XMyLF7Fe+J
	NWP0+/ezePWwJuQ0toS67EmPFJJs5y+AdEur0a3r9OEuT2w/ESAjR1truIcYN4okPmdhtljWVOxqA
	FVhh0n8Q==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH] ARM: dts: omap4-kc1: fix twl6030 power node
Date: Sun, 15 Sep 2024 21:35:27 +0200
Message-Id: <20240915193527.1071792-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtbs_check was moaning about twl6030-power, use the standard property
instead.
Apparently that twl6030 power snippet slipped in without the
corresponding driver. Now it is handled by the standard property.

CC: Paul Kocialkowski <contact@paulk.fr>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/ti/omap/omap4-kc1.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-kc1.dts b/arch/arm/boot/dts/ti/omap/omap4-kc1.dts
index c6b79ba8bbc91..df874d5f5327f 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-kc1.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-kc1.dts
@@ -112,11 +112,7 @@ twl: twl@48 {
 		reg = <0x48>;
 		/* IRQ# = 7 */
 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
-
-		twl_power: power {
-			compatible = "ti,twl6030-power";
-			ti,system-power-controller;
-		};
+		system-power-controller;
 	};
 };
 
-- 
2.39.2


