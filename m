Return-Path: <linux-omap+bounces-5289-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC9CE8BCB
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 06:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E98B300BD8C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 05:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E64274643;
	Tue, 30 Dec 2025 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u8oajc+i"
X-Original-To: linux-omap@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B31A23A6
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 05:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767073964; cv=none; b=eyONbdaxk4n46Qp17xdwkkeGsM/86sDjIzQP+mbfXxybYtgcMoc4Azt1w+GnV7BOQWhkjuC8NeYPCfZM+XHrY1WIq6ROpQ4hstsucQHCYSzPOAIi4U0X2b0nFz53jdxzwk2vj9cruiilymxHoNQy/XdLRXUyS30nlqeTPoYcIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767073964; c=relaxed/simple;
	bh=PAv4tAJqy8XVBFI4rD8NsIb6pkb1uegME7zSbIMC0V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KhHcB+NCqGYwuMwnmrIK5ly00YBzb4zJfMxyOuPsD1bh1RFaG3PX8CH1Yee//fm1NaVQDoQ4rO/ycKfyL9aV6IoavcOl2AkDxIX/FQPnclCfnG0pdaDjcFnCBIpcwsRlbyIwcugI/2x4mHUdkti0sMR4Erz92gm2mh/RqcmeG9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=u8oajc+i; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FVwWeVuQuojBBIt0GbiNzCrl8hYjdxZkoliVMSaEEag=; b=u8oajc+iE+Vd/w4FTvoZ0Hl+6H
	t09eD/5WQeT2g2NK4wetqHHAbTzEJMCY5H8Tryu88W2lajtZOzgT6+DQSjilHZvssIEkQXDl+OdkI
	IM/w2vq0jTt7Zi+AW4UyR1zk5BdoGYTuVFcHKRwaC1x70jaeKGrqK+mNIxbBf+29sMoI3yS/gQ850
	qQH2x9kxJpOCU0x3aFIY/ddAyW+80zMeCV8cqVFJC1m4F6sUst6mbrWm0rXXsFfhLEBZ3cGVjJ+Fk
	LwSimhan23qfHvo90gJtGtl27hP2rR/TExvtVUkIpg4gK5gp04rBU7ng4icmxDZBrEACME98LCbSo
	NTMJByNw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaSel-00000004RKy-3Yoy;
	Tue, 30 Dec 2025 05:52:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	patches@armlinux.org.uk,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: omap1: drop unused Kconfig symbol
Date: Mon, 29 Dec 2025 21:52:30 -0800
Message-ID: <20251230055230.3212260-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
due to a botched rebase (says Arnd [1]).

Drop that line since that symbol is not used anywhere else in the
kernel source tree.

[1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
Fixes: 7036440eab3e ("ARM: omap1: enable multiplatform")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
KernelVersion: 6.19-rc1

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: patches@armlinux.org.uk
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>

 arch/arm/mach-omap1/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm/mach-omap1/Kconfig
+++ linux-next-20251219/arch/arm/mach-omap1/Kconfig
@@ -4,7 +4,6 @@ menuconfig ARCH_OMAP1
 	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
 	depends on ATAGS
-	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD

