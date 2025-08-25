Return-Path: <linux-omap+bounces-4321-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B4BB34068
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 15:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E853D3B043E
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EBF2163B2;
	Mon, 25 Aug 2025 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="MXR0oMyA";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="g0nmcpwN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FA720E029;
	Mon, 25 Aug 2025 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127490; cv=none; b=nWYbE5ScEVKD7Iebo5xaDKyqFvlkVvZCUzViotLTMi8I3YoCh72ARi1bsbYKNHMNdV1+kD1Qvx3AQHKjFMWIBT9pSrVjn2uFDpuKD14V88D9hgBPzwuMBnBDDclkHeEcmpH4TlR517sRcU/sZ+f6vvZiqY31q3Wp8W70vW7mztE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127490; c=relaxed/simple;
	bh=MM1JnVWkeAYSsDB0Gh3/fNFZmz+G4xdCiXO+uXhZVC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ebjv6fxlz6lw7CuwHVsNsIr3Hy/DKaxcRapYZMPgBQ6UXxEX8lGSmOErupFTlMxMazNCcwixVhH7Rwrdi0P6Bnmgd+dc489sO/ELoHtEaykgYEJzKidd66X+H1dw67MoR2a7yiAwCwGnwsHeD/6ONfRyOSFzW4M5Mq7lKyVsQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=MXR0oMyA; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=g0nmcpwN reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756127487; x=1787663487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wPl2PlyGF6CGzO/DK9jF01v09C47cYWQgvtMEYesVkE=;
  b=MXR0oMyAnKUWhru5GQQe77jl6GOUR5ZV8+//Kfyh+auaUnODw7nD592C
   MPh7ORmGgTeZjuN8YBTQZ72g0vN3n+7PVnVGj+TnJii5PU4l0PqIDxcIN
   +sdMqGr+OhvOOBGIJULsmdLsLAnnaM2C3ZBYKUV4yBw80lZoL9Y0CXPE2
   QRi5RuLi9mbN5rrGy8E/YuF15Jin/p+AM2hVlnyD7MJIwcUgoFRyAjSyY
   K32Y3eymu+p8ueG24eYjntUWGxkYqI5zMXO6zQhd/fmqo9gUtWsZQiGwG
   dEtgPGZ5uZ79Q9r/EE8/BjGpXaxab9c4glbKAfllaoDb9vYuac3PchHWk
   Q==;
X-CSE-ConnectionGUID: 2i17XNIEQL2vZHCEM4qByA==
X-CSE-MsgGUID: T2N28/4NTV63Y+buHhtd0w==
X-IronPort-AV: E=Sophos;i="6.18,213,1751234400"; 
   d="scan'208";a="45894532"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 15:11:22 +0200
X-CheckPoint: {68AC60FA-20-9821D066-F5C64F68}
X-MAIL-CPID: CC474E99CD0CC204DE606FF1EF5818BE_2
X-Control-Analysis: str=0001.0A00210E.68AC604D.0039,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B96816730A;
	Mon, 25 Aug 2025 15:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756127478; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wPl2PlyGF6CGzO/DK9jF01v09C47cYWQgvtMEYesVkE=;
	b=g0nmcpwN6fFgU1k3zDCH9miatIV235tMDgZavUXdryFs1xeJXHfi+XOmp+LyHji50K+mE3
	d1bScs32q+1VZHuDdYIjv4E95Yo72zrodu9f1PIMZonWvNJOFHJM5gd0VQ1PDxvuk70Jrz
	faTjvy75Eo/7jqgpsWusspk0PFqTeb2sQPoagP6YQl74ARrDaid3at7dNasI6P3C1O+Hvh
	bCrlv232Qc2r9XzhINMPY0mBgcZXrUran7defP7fjPvLAkPNRY99rvZsIyYj+RSJlZO9jj
	ttU2WzzKIZzDRdyX6qh/kEq+OWDKfO+aGpxJ3ddzvDy7vya4jaxUroUr6/46vA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/1] ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
Date: Mon, 25 Aug 2025 15:11:13 +0200
Message-ID: <20250825131114.2206804-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

am33xx.dtsi has the same clock setup as am35xx.dtsi, setting
ti,no-reset-on-init and ti,no-idle on timer1_target and timer2_target,
so AM33 needs the same workaround as AM35 to avoid ti-sysc probe
failing on certain target modules.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/bus/ti-sysc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 5566ad11399e7..610354ce7f8f0 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -48,6 +48,7 @@ enum sysc_soc {
 	SOC_UNKNOWN,
 	SOC_2420,
 	SOC_2430,
+	SOC_AM33,
 	SOC_3430,
 	SOC_AM35,
 	SOC_3630,
@@ -2912,6 +2913,7 @@ static void ti_sysc_idle(struct work_struct *work)
 static const struct soc_device_attribute sysc_soc_match[] = {
 	SOC_FLAG("OMAP242*", SOC_2420),
 	SOC_FLAG("OMAP243*", SOC_2430),
+	SOC_FLAG("AM33*", SOC_AM33),
 	SOC_FLAG("AM35*", SOC_AM35),
 	SOC_FLAG("OMAP3[45]*", SOC_3430),
 	SOC_FLAG("OMAP3[67]*", SOC_3630),
@@ -3117,10 +3119,15 @@ static int sysc_check_active_timer(struct sysc *ddata)
 	 * can be dropped if we stop supporting old beagleboard revisions
 	 * A to B4 at some point.
 	 */
-	if (sysc_soc->soc == SOC_3430 || sysc_soc->soc == SOC_AM35)
+	switch (sysc_soc->soc) {
+	case SOC_AM33:
+	case SOC_3430:
+	case SOC_AM35:
 		error = -ENXIO;
-	else
+		break;
+	default:
 		error = -EBUSY;
+	}
 
 	if ((ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT) &&
 	    (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE))
-- 
2.43.0


