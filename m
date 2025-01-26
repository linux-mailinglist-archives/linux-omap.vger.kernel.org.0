Return-Path: <linux-omap+bounces-3226-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674EA1CD23
	for <lists+linux-omap@lfdr.de>; Sun, 26 Jan 2025 17:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2F41885C3D
	for <lists+linux-omap@lfdr.de>; Sun, 26 Jan 2025 16:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCD81990D8;
	Sun, 26 Jan 2025 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ9bkL0+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EAF1946B8;
	Sun, 26 Jan 2025 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909957; cv=none; b=TuAIbJzGZZDsyyCzthbjTOQXANAJHXqaa9PhZDcXIL2WlmPft7aviHK/D0e/1ZQxBM+ndgDWQWZ9MOkB6jcN3wAxHvaWi6BJfcTZzRZgE96GEfq6DDiN42TKf4St9MNm8fhN4AnI/4seWy3obFIZpxM60nlCBhlnTg5FskQ817E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909957; c=relaxed/simple;
	bh=MEe2oo2YjYf2lKVsyVv7MzPAyJxoyZAgPw92+aRPQfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n0mWuOLHsqluqeC469b5rFmJqRTgph2X/6v6LEhSNapCflzLX0c+DArp6a/Is/ZbD3EXO/G4aqHQkFKpOFMgSjxZUHGHjADQG7wxk9oNS4W8EUdhVhAOXE26OKDBd2kNLe+eslf+ngcggOiuuNVhgcUx3bu/Lt083plJG8pVqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ9bkL0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315DAC4CEE3;
	Sun, 26 Jan 2025 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909957;
	bh=MEe2oo2YjYf2lKVsyVv7MzPAyJxoyZAgPw92+aRPQfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZ9bkL0+zA7NYnyi3yvVADIeNcMi6o3J5HF5acBPqdQReu7gJD3WKjMiv5pK+hbv6
	 lzCmXHcDFGcybt+Yo5bUeeHvOrQsgObFc2s+8xVPBEJ6ZqK5EWMDZw4Ent3kG7JTM6
	 NYTa1yQ3y74hsAiA2XJUIMK65nkRQJxTqhKu9K7uehIQajV11u8Jw9VLqgx/ruCSJD
	 hEwhqPnYRPuwRZy43sws93mPcllbGjof6plRsZSQpBdmFIC7EqjuJ4zOhr/rSK7Bp+
	 tmAcAF4IdFUJf4C2Y4QGVolEH2iMIQxsdyaMvE6LUAzft3G+SpPMSweh0tRVKPfiQR
	 ILR5ZFKMwJDPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linus Walleij <linus.walleij@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 4/7] fbdev: omap: use threaded IRQ for LCD DMA
Date: Sun, 26 Jan 2025 11:45:46 -0500
Message-Id: <20250126164549.964058-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164549.964058-1-sashal@kernel.org>
References: <20250126164549.964058-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Aaro Koskinen <aaro.koskinen@iki.fi>

[ Upstream commit e4b6b665df815b4841e71b72f06446884e8aad40 ]

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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap/lcd_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index f85817635a8c2..0da23c57e4757 100644
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
2.39.5


