Return-Path: <linux-omap+bounces-696-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B985E1BF
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 16:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09441B263A8
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3B080BE0;
	Wed, 21 Feb 2024 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="gjxJhHjJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592AE80BFE
	for <linux-omap@vger.kernel.org>; Wed, 21 Feb 2024 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530385; cv=none; b=CDBOApkCMr4RqVpKjjJml8UyZMp/f/eDuJMlH3bkXaY1NhhsrVz57MVfBM3DAlaPveq4nwM5o95qBF3YY8gJYYJHfeP9lxTwCOkOxcPBef9fZqHltmfGQl1+wc24pcB7g32VCuZt/Say7CQ7nfhFkWYa/tvyXKv6V3Lm8F/zV4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530385; c=relaxed/simple;
	bh=GpTxwtKajMQaSRqOreuWAm7Re7X2B93OkFr5c2ru2Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ec5G4gTdDHiwd9yfwybL51T6qRUy/q17ony/67clUU7GkM5piPpOchOMZXnaNrp/6mguxdduo0tA76JVKlL6NXb+fPCZQ1qZOMTzc7B221Q5PCJh+mX8kKNaWCeKIref0sEgcRBZLjV8QmjwJRrhrOtbsbt00p7M5ySjqFABf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=gjxJhHjJ; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240221154618d1129dc9cd6a68f42c
        for <linux-omap@vger.kernel.org>;
        Wed, 21 Feb 2024 16:46:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=J5Se4IlAntLxF9W2J1JJEFb+S1gXQPsA5HMQVz5Mt4s=;
 b=gjxJhHjJLaWuTG1jOsXVpqc7PIT1sGY1NGhviNe9TwLJcpduQOqBPOhiHohOKTyQP8+j4r
 Zx7O8J0pmoIHHFTnmxRiLGRL+AIyh4QVO7zIPmej9bvWvwexJd7HaD6H41211IBeabCH7Bqk
 1NHUw6K8vVwFMNS9220DZLN9kgBoM=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-omap@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Paul Walmsley <paul@pwsan.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: AM33xx: PRM: Remove redundand defines
Date: Wed, 21 Feb 2024 16:45:50 +0100
Message-ID: <20240221154614.3549951-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

AM33XX_PRM_RSTCTRL_OFFSET is already defined in prm33xx.h and
AM33XX_RST_GLOBAL_WARM_SW_MASK in prm-regbits-33xx.h.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm/mach-omap2/prm33xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-omap2/prm33xx.c b/arch/arm/mach-omap2/prm33xx.c
index 4b65a0f9cf7d9..4a462310a4b09 100644
--- a/arch/arm/mach-omap2/prm33xx.c
+++ b/arch/arm/mach-omap2/prm33xx.c
@@ -15,10 +15,6 @@
 #include "prm33xx.h"
 #include "prm-regbits-33xx.h"
 
-#define AM33XX_PRM_RSTCTRL_OFFSET		0x0000
-
-#define AM33XX_RST_GLOBAL_WARM_SW_MASK		(1 << 0)
-
 /* Read a register in a PRM instance */
 static u32 am33xx_prm_read_reg(s16 inst, u16 idx)
 {
-- 
2.43.0


