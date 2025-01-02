Return-Path: <linux-omap+bounces-2942-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3439FFDF0
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 19:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A9DE7A19C1
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 18:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCDD1B4259;
	Thu,  2 Jan 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Dhl6GopV"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8DB1917FB;
	Thu,  2 Jan 2025 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842013; cv=pass; b=IkbxwALRCbRl8vAqfwBktJ09zaeWyIsJzcRJAZeX9+E1FtNEJsf9wpYPEIAX68cIl4Ph1qGgAAnHND6kNf5Qjp2wVz1rHnOx1q5PknUZ9a6WIKy/6KroqMw2Xs6YMYG0r/EOgUkhGTmTCkJnKAMHus5r83EjaaXSk4yC0bQFgF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842013; c=relaxed/simple;
	bh=qv/VlLekQPhGRpk8vEhrhaQa+VvN3hOLRFgY/yQUbVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAxzGDYMYb0BRqO6vokbAWVCOPj5XQBxQRw4ezMPvrDf/XguzhwvEatUgYFWIKL3PkIYWo/wAxss9DMfHi63N/+ZSPa5Oo93boU2b+4mQo0bBwpPEFaxsd+gcCHUIlFbk2rMMUQcx9ZKe8GGxPXQn2UmLFsZMjWJ+T3dIH10WIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Dhl6GopV; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.. (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YPFNx75R0zyfh;
	Thu,  2 Jan 2025 20:20:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735842002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRbGXqYktUW/gFltGyPoMIh4JupBfrLim1rMCpE9DT0=;
	b=Dhl6GopVPYrVeXJtGlfuahsYwV+u3RDgFOO2+siYGz5Xs15/4X5OIsMMMyGz1TWKBABUOm
	qtUTIxboOhEoNjzjpVGj041DEX8ZaHr70IKKKkplf42t6ocW4XPoq5NCEp+4/9Wq67VDGJ
	09P0h0L+YH5zCBoX9cmGyGOp7ZXuMv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735842002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRbGXqYktUW/gFltGyPoMIh4JupBfrLim1rMCpE9DT0=;
	b=sysYI8rKe4LZOfyYVfMd3JFe/7/h136ZqduASkpgc77AADQYNJAQPiepAG7nIq326b8WU1
	SvY/WDGzMP7hqTWKwajJD1mtwvJZ6+W7gfK0Lvr6ieIVzq9cWo85BrOqAtI1+dBte++G3R
	+97z/XCM4hcP1w3KbPJ0HV47fBDqA5o=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735842002; a=rsa-sha256; cv=none;
	b=XBOw7wq7Z5YlMurVq+96wjH5fWcCV316RbaiQZjgMD9sFQKNPdyGJhDk3TYArbYxpub8g8
	YQsOvwHpigd4iBJLTBISZgzfQcVxf3UKY9H41vE4s2zNHw1rBoa548Nx21h+T0dJihYbzl
	9Y9ehSTl4gBsorKnF2DlVKV4LbhaiI0=
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 1/3] fbdev: omap: use threaded IRQ for LCD DMA
Date: Thu,  2 Jan 2025 20:19:51 +0200
Message-ID: <20250102181953.1020878-2-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using touchscreen and framebuffer, Nokia 770 crashes easily with:

    BUG: scheduling while atomic: irq/144-ads7846/82/0x00010000
    Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether libcomposite configfs omap_udc ohci_omap ohci_hcd
    CPU: 0 UID: 0 PID: 82 Comm: irq/144-ads7846 Not tainted 6.12.7-770 #2
    Hardware name: Nokia 770
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x54/0x5c
     dump_stack_lvl from __schedule_bug+0x50/0x70
     __schedule_bug from __schedule+0x4d4/0x5bc
     __schedule from schedule+0x34/0xa0
     schedule from schedule_preempt_disabled+0xc/0x10
     schedule_preempt_disabled from __mutex_lock.constprop.0+0x218/0x3b4
     __mutex_lock.constprop.0 from clk_prepare_lock+0x38/0xe4
     clk_prepare_lock from clk_set_rate+0x18/0x154
     clk_set_rate from sossi_read_data+0x4c/0x168
     sossi_read_data from hwa742_read_reg+0x5c/0x8c
     hwa742_read_reg from send_frame_handler+0xfc/0x300
     send_frame_handler from process_pending_requests+0x74/0xd0
     process_pending_requests from lcd_dma_irq_handler+0x50/0x74
     lcd_dma_irq_handler from __handle_irq_event_percpu+0x44/0x130
     __handle_irq_event_percpu from handle_irq_event+0x28/0x68
     handle_irq_event from handle_level_irq+0x9c/0x170
     handle_level_irq from generic_handle_domain_irq+0x2c/0x3c
     generic_handle_domain_irq from omap1_handle_irq+0x40/0x8c
     omap1_handle_irq from generic_handle_arch_irq+0x28/0x3c
     generic_handle_arch_irq from call_with_stack+0x1c/0x24
     call_with_stack from __irq_svc+0x94/0xa8
    Exception stack(0xc5255da0 to 0xc5255de8)
    5da0: 00000001 c22fc620 00000000 00000000 c08384a8 c106fc00 00000000 c240c248
    5dc0: c113a600 c3f6ec30 00000001 00000000 c22fc620 c5255df0 c22fc620 c0279a94
    5de0: 60000013 ffffffff
     __irq_svc from clk_prepare_lock+0x4c/0xe4
     clk_prepare_lock from clk_get_rate+0x10/0x74
     clk_get_rate from uwire_setup_transfer+0x40/0x180
     uwire_setup_transfer from spi_bitbang_transfer_one+0x2c/0x9c
     spi_bitbang_transfer_one from spi_transfer_one_message+0x2d0/0x664
     spi_transfer_one_message from __spi_pump_transfer_message+0x29c/0x498
     __spi_pump_transfer_message from __spi_sync+0x1f8/0x2e8
     __spi_sync from spi_sync+0x24/0x40
     spi_sync from ads7846_halfd_read_state+0x5c/0x1c0
     ads7846_halfd_read_state from ads7846_irq+0x58/0x348
     ads7846_irq from irq_thread_fn+0x1c/0x78
     irq_thread_fn from irq_thread+0x120/0x228
     irq_thread from kthread+0xc8/0xe8
     kthread from ret_from_fork+0x14/0x28

As a quick fix, switch to a threaded IRQ which provides a stable system.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 drivers/video/fbdev/omap/lcd_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index f85817635a8c..0da23c57e475 100644
--- a/drivers/video/fbdev/omap/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -432,8 +432,8 @@ static int __init omap_init_lcd_dma(void)
 
 	spin_lock_init(&lcd_dma.lock);
 
-	r = request_irq(INT_DMA_LCD, lcd_dma_irq_handler, 0,
-			"LCD DMA", NULL);
+	r = request_threaded_irq(INT_DMA_LCD, NULL, lcd_dma_irq_handler,
+				 IRQF_ONESHOT, "LCD DMA", NULL);
 	if (r != 0)
 		pr_err("unable to request IRQ for LCD DMA (error %d)\n", r);
 
-- 
2.39.2


