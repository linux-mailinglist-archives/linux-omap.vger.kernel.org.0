Return-Path: <linux-omap+bounces-3542-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0615A7D627
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 09:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603613B92EC
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 07:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7752C22E412;
	Mon,  7 Apr 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="dXTBA2R3"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA622D7A5;
	Mon,  7 Apr 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010555; cv=none; b=XCMWmwkd54F9wmrvlm9iJdHutj9vc125aPSqIDpL471ofYzSw0ix5XUsHy20Cq2OrrWy0hAh+Jiwj+utyqW1Dnc1wqsS3LLfpAzAe2+fOsVsGMG2yIQlbSJW95oyi71joPJw7dNgNpnPd+ZxQJYgAZ/vWgYyucjVhRj+9zSr0HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010555; c=relaxed/simple;
	bh=Ii/I5mddvCftJ9dMCVpRvN/4wWN2FqJdz6bxa+Yiuks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XoHx9ITC4nMb24PuDdZUeDo5bRQ4zburCHZ4vII+ZyEed/Nt62MUFlCS4jldf9zAeLVGF6eqMkB7Yb6EDyqQ345FJYLN68BEIgFEMmdEfA/cFufE1OkqgqYRFwcQJdyDqvEPOh3mjJbGfbJHTwpdXIXv84dZCH3dwAL8/B28KkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=dXTBA2R3; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2OcGMAvWHqgKEbFHHN2GoPmqUgUHadsxrmCUAdVfDWA=; b=dXTBA2R3FxdN4LNZVhS0Iyhfuk
	nCQfjajcz7NbqSdG/QctCuKEfryML0/V2xNynZJ7Ejx6ZKdQ0Nh2XDN/s8xZdiN/9uAKK7umpRXul
	SM7TBbbfOrx5QTaGCJjBWRgNB/bm+RPzDNaAVpM8AmIjRwrHl4ZAM7CH0FWKEk0OxwzvnMODvTexH
	xV1az0tcq4/vcBeqImeDfuDGn8tDmkkhyTIgJZFUbJ34bwz41FTlrzqCHuSaPURCq2UT3TuxZD/LQ
	e803zFhhCe1XJm6xoLCgzpEb4n8XqGoKmEuOjQdhVUOp5uLCNBbMBR7E7JyBdVwufLDg6SnKx+3oy
	ytTKOrhQ==;
Received: from [122.175.9.182] (port=46259 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1goQ-000000005lp-2fd4;
	Mon, 07 Apr 2025 12:52:31 +0530
From: Parvathi Pudi <parvathi@couthit.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nm@ti.com,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	danishanwar@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	afd@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com,
	parvathi@couthit.com,
	basharath@couthit.com
Subject: [PATCH v1 1/1] bus: ti-sysc: PRUSS OCP configuration
Date: Mon,  7 Apr 2025 12:51:34 +0530
Message-Id: <20250407072134.1044797-2-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407072134.1044797-1-parvathi@couthit.com>
References: <20250407072134.1044797-1-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Updates OCP master port configuration to enable memory access outside
of the PRU-ICSS subsystem.

This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit to enable
the OCP master ports during resume sequence and disables the OCP master
ports during suspend sequence (applicable only on SoCs using OCP
interconnect like the OMAP family).

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 drivers/bus/ti-sysc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index f67b927ae4ca..51caae611acf 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2036,6 +2036,19 @@ static void sysc_module_disable_quirk_pruss(struct sysc *ddata)
 	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
 }
 
+static void sysc_module_enable_quirk_pruss(struct sysc *ddata)
+{
+	u32 reg;
+
+	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
+	/* Clearing the SYSC_PRUSS_STANDBY_INIT bit - Updates OCP master
+	 * port configuration to enable memory access outside of the
+	 * PRU-ICSS subsystem.
+	 */
+	reg &= (~SYSC_PRUSS_STANDBY_INIT);
+	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+}
+
 static void sysc_init_module_quirks(struct sysc *ddata)
 {
 	if (ddata->legacy_mode || !ddata->name)
@@ -2088,8 +2101,10 @@ static void sysc_init_module_quirks(struct sysc *ddata)
 		ddata->module_disable_quirk = sysc_reset_done_quirk_wdt;
 	}
 
-	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_PRUSS)
+	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_PRUSS) {
+		ddata->module_enable_quirk = sysc_module_enable_quirk_pruss;
 		ddata->module_disable_quirk = sysc_module_disable_quirk_pruss;
+	}
 }
 
 static int sysc_clockdomain_init(struct sysc *ddata)
-- 
2.34.1


