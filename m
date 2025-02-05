Return-Path: <linux-omap+bounces-3264-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E5A289F0
	for <lists+linux-omap@lfdr.de>; Wed,  5 Feb 2025 13:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242EC1885804
	for <lists+linux-omap@lfdr.de>; Wed,  5 Feb 2025 12:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A31822B8BF;
	Wed,  5 Feb 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4nPwlC7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE721C19F;
	Wed,  5 Feb 2025 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757528; cv=none; b=NlrV9HYsSZnoNHgFfNlNBZbBlc46b+cdPk4oHuilmnudS9LYK+pipxV2d9RLpX/Ay7HQcIL3S0a93gTcfbxNUDz/vcJwxE2nT8ZGMmEvPzda4y2I3elPophXpusb7BTrPnfPzKA3bzFxb1tKzk+4h4+UophycixCzxg31AxROso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757528; c=relaxed/simple;
	bh=GpkwFNg5/6LmBREM3eLpvMeWoLhkjuVeBNbukdiwObk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cxnCdesxTaZwNgGeKUW7e50aCxwmtGS2O7v3JQeI6STjeIGUqbiXuxQezCksLFwqgdBTTO2mtqzqwxxGMjGdtYabx2Z/LW8EJEmuJlaK/HkzHTzJ0DJSxfjxwxeR36OxaBXwHRAzdALJjXfa07aq25EjG/DF4FaeucyykHVw+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4nPwlC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BBCC4CEE2;
	Wed,  5 Feb 2025 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738757527;
	bh=GpkwFNg5/6LmBREM3eLpvMeWoLhkjuVeBNbukdiwObk=;
	h=From:To:Cc:Subject:Date:From;
	b=H4nPwlC78ZmZC/hg/2dSZhmENcfZPzyV6fz4Q3YouKEfT4I36us1ZOI2pXR1vE6sr
	 fZwqWui2BGUTOjktM3/Z72PvUM/3Xjk7mfbxyqhSRQrmGyUA5P8xJD1ef90SiK97NV
	 h9O7jkRoaZXDA2a3/xDX6YczbmmmDj7CLvCEjEsQdFaFDhLIaHuWJZ62aV5nPDaHKo
	 0REebMyWjgnWHXW8Rl1nvcEsPUJuGZqJ9N9+NEJ0begucrwIlgQOBBfwmvXh7cnpHK
	 nYuMs99efG+xOx+rLQvOvec/67IgJctV0MVyMEwqeQreu6x0EFS6MBH6LH4bChAcom
	 uENutqOQ990CQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tony Lindgren <tony@atomide.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Date: Wed,  5 Feb 2025 13:11:33 +0100
Message-Id: <20250205121151.289535-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:

arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'

This has apparently been the case for many years, but I never caught it
in randconfig builds until now, as there are dozens of other drivers
that also 'select GENERIC_IRQ_CHIP' and statistically there is almost
always one of them enabled.

Fixes: 55b447744389 ("ARM: OMAP1: Switch to use generic irqchip in preparation for sparse IRQ")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index a643b71e30a3..08ec6bd84ada 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -8,6 +8,7 @@ menuconfig ARCH_OMAP1
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD
+	select GENERIC_IRQ_CHIP
 	select GPIOLIB
 	help
 	  Support for older TI OMAP1 (omap7xx, omap15xx or omap16xx)
-- 
2.39.5


