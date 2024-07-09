Return-Path: <linux-omap+bounces-1752-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A533492BC7F
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 16:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EC15B24A30
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 14:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BDA1822F2;
	Tue,  9 Jul 2024 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="UBbYqTrS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07762257D
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534206; cv=none; b=rtXY+nrf8ohEWrQeqVzo00zoBy7D8RMGfoaK55MRLQBmv6fgfF+BwPUKgxDC4X3y0ZCbPHlWnSxzbSly8sgHbrgHBsQJrA7Y5RjqIbGpxRTXvhWHKtTaq+xRBDuxxD+sXx89evt9Ta9HYgLXIbG2IcAxN4A01rc4LrEgMTXvsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534206; c=relaxed/simple;
	bh=KCgnSqXdFf0AXdQMJbwh+XOq6LDmbodcNEw7rVeKYXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUlRKPGddLTgnJdLv2KaQEdPgy/CDHsbSRKOvydPAahf6m2MUPBUAYnhmA8vhmbfIMre/VbbDrZ31sHsdXrKask2kJ/U/DW5YR4kueNU0J2ULmHPHuIKqjvrHQj3uqz0knEuedcpszAezyojXd3xkTL+AsYGZXJBEj8zJSg/gvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=UBbYqTrS; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id B154660498;
	Tue,  9 Jul 2024 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1720533634;
	bh=KCgnSqXdFf0AXdQMJbwh+XOq6LDmbodcNEw7rVeKYXs=;
	h=From:To:Cc:Subject:Date:From;
	b=UBbYqTrS+Ei9TN/GHnehYZzhV1sV2fHOTOA8xI1EwFUKQY3noQojP8ZGPGXXnQNm7
	 rTMo7sPxWEZFc9KGI/LHn6IIo9n43M/SFFp4M/H7ClKgXpn1HgE4QDayw08Q//g17h
	 9Jq09Onicovf1DJtoEPtMdv5VaOsHxxxYopGOyherIjO4yaU8sjbVvfiRA+XsyNcGW
	 SBGj61RAwsDWoTA/TGS4Q5YwiBDB9m5UYd857GBJABQCisNmTT5duFNGTDQSicOmWe
	 bI+H6GOSNwJXnbpmjLCFPTAhDX0HACTSOZH8Oa1RJeKnhtyr4ZIEUnIgRv3dThvlHm
	 4EW9sk6ckmBQA==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>,
	Russell King <linux@armlinux.org.uk>,
	Vignesh R <vigneshr@ti.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH] MAINTAINERS: Add more maintainers for omaps
Date: Tue,  9 Jul 2024 16:59:29 +0300
Message-ID: <20240709135930.3405-1-tony@atomide.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many generations of omaps to maintain, and I will be only active
as a hobbyist with time permitting. Let's add more maintainers to ensure
continued Linux support.

TI is interested in maintaining the active SoCs such as am3, am4 and
dra7. And the hobbyists are interested in maintaining some of the older
devices, mainly based on omap3 and 4 SoCs.

Kevin and Roger have agreed to maintain the active TI parts. Both Kevin
and Roger have been working on the omap variants for a long time, and
have a good understanding of the hardware.

Aaro and Andreas have agreed to maintain the community devices. Both Aaro
and Andreas have long experience on working with the earlier TI SoCs.

While at it, let's also change me to be a reviewer for the omap1, and
drop the link to my old omap web page.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16445,7 +16445,7 @@ F:	arch/arm/boot/dts/ti/omap/am335x-nano.dts
 OMAP1 SUPPORT
 M:	Aaro Koskinen <aaro.koskinen@iki.fi>
 M:	Janusz Krzysztofik <jmkrzyszt@gmail.com>
-M:	Tony Lindgren <tony@atomide.com>
+R:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-omap/list/
@@ -16457,10 +16457,13 @@ F:	include/linux/platform_data/ams-delta-fiq.h
 F:	include/linux/platform_data/i2c-omap.h
 
 OMAP2+ SUPPORT
+M:	Aaro Koskinen <aaro.koskinen@iki.fi>
+M:	Andreas Kemnade <andreas@kemnade.info>
+M:	Kevin Hilman <khilman@baylibre.com>
+M:	Roger Quadros <rogerq@kernel.org>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-W:	http://www.muru.com/linux/omap/
 W:	http://linux.omap.com/
 Q:	http://patchwork.kernel.org/project/linux-omap/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
-- 
2.45.2

