Return-Path: <linux-omap+bounces-3558-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6909A81450
	for <lists+linux-omap@lfdr.de>; Tue,  8 Apr 2025 20:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B331B8863F
	for <lists+linux-omap@lfdr.de>; Tue,  8 Apr 2025 18:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71A323E227;
	Tue,  8 Apr 2025 18:13:23 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2823CF07
	for <linux-omap@vger.kernel.org>; Tue,  8 Apr 2025 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136003; cv=none; b=VomoNDL1TNKexB0WlTpNE5gJxR0kAM04Dj1m7kvcOa/NOM4BNaV3zA8BAeeMIDsHZfn2lfah8kUNtOr1tmVzLK5KdVhU1fsidh8912Mg0GkpS+jtzSJ4BTfc9KrF972HiWQaPE/kRRxPycimvwvuDUKmQXZxIuVwGv6OE6annt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136003; c=relaxed/simple;
	bh=zuLTOwLuHsYDzMbkf+aBznMLg7hEW/VvEFThYjA/tNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGHVzMHHjWZKnnHTEGh09T7V7jwAfQ66ZQoOEsafhLVYIVwMVDjBXd7Tx15ypTT8c5ajnWtokzsbQcso3Qs6+9u5c5n3TzX0/VfhaIMaCRd+fjieRs7EeUCEIwCbeZEZZWzCa8Uw9pV44PBfDc5UBMBiM7PaBpOmj0XfOEJio5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4ZXDYw2qXcz4x0WF
	for <linux-omap@vger.kernel.org>; Tue, 08 Apr 2025 20:07:16 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a74f:875e:25d1:823b])
	by albert.telenet-ops.be with cmsmtp
	id ai772E0090XRBii06i77zS; Tue, 08 Apr 2025 20:07:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2DLn-000000009xH-3KiT;
	Tue, 08 Apr 2025 20:07:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2DLn-00000002s7k-2ssL;
	Tue, 08 Apr 2025 20:07:07 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] genirq/generic-chip: Fix incorrect lock guard conversions
Date: Tue,  8 Apr 2025 20:07:02 +0200
Message-ID: <514f94c5891c61ac0a4a7fdad113e75db1eea367.1744135467.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When booting BeagleBone Black:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:4398 lockdep_hardirqs_on_prepare+0x23c/0x280
    DEBUG_LOCKS_WARN_ON(early_boot_irqs_disabled)
    CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc1-boneblack-00004-g195298c3b116 #209 NONE
    Hardware name: Generic AM33XX (Flattened Device Tree)
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x6c/0x90
     dump_stack_lvl from __warn+0x70/0x1b0
     __warn from warn_slowpath_fmt+0x1d4/0x1ec
     warn_slowpath_fmt from lockdep_hardirqs_on_prepare+0x23c/0x280
     lockdep_hardirqs_on_prepare from trace_hardirqs_on+0x68/0xb4
     trace_hardirqs_on from _raw_spin_unlock_irq+0x20/0x38
     _raw_spin_unlock_irq from irq_map_generic_chip+0x144/0x190
     irq_map_generic_chip from irq_domain_associate_locked+0x68/0x164
     irq_domain_associate_locked from irq_create_fwspec_mapping+0x34c/0x43c
     irq_create_fwspec_mapping from irq_create_of_mapping+0x64/0x8c
     irq_create_of_mapping from irq_of_parse_and_map+0x54/0x7c
     irq_of_parse_and_map from dmtimer_clkevt_init_common+0x54/0x15c
     dmtimer_clkevt_init_common from dmtimer_systimer_init+0x41c/0x5b8
     dmtimer_systimer_init from timer_probe+0x68/0xf0
     timer_probe from start_kernel+0x4a4/0x6bc
     start_kernel from 0x0
    irq event stamp: 0
    hardirqs last  enabled at (0): [<00000000>] 0x0
    hardirqs last disabled at (0): [<00000000>] 0x0
    softirqs last  enabled at (0): [<00000000>] 0x0
    softirqs last disabled at (0): [<00000000>] 0x0
    ---[ end trace 0000000000000000 ]---

and:

    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 0 at init/main.c:1022 start_kernel+0x4e8/0x6bc
    Interrupts were enabled early
    CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G        W           6.15.0-rc1-boneblack-00004-g195298c3b116 #209 NONE
    Tainted: [W]=WARN
    Hardware name: Generic AM33XX (Flattened Device Tree)
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x6c/0x90
     dump_stack_lvl from __warn+0x70/0x1b0
     __warn from warn_slowpath_fmt+0x1d4/0x1ec
     warn_slowpath_fmt from start_kernel+0x4e8/0x6bc
     start_kernel from 0x0
    irq event stamp: 0
    hardirqs last  enabled at (0): [<00000000>] 0x0
    hardirqs last disabled at (0): [<00000000>] 0x0
    softirqs last  enabled at (0): [<00000000>] 0x0
    softirqs last disabled at (0): [<00000000>] 0x0
    ---[ end trace 0000000000000000 ]---

Fix this by correcting two misconversions of
raw_spin_{,un}lock_irq{save,restore}() to lock guards.

Fixes: 195298c3b11628a6 ("genirq/generic-chip: Convert core code to lock guards")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 kernel/irq/generic-chip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index 8014bfecb948e862..bf59e37d650ad27e 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -330,7 +330,7 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
 				goto err;
 		}
 
-		scoped_guard (raw_spinlock, &gc_lock)
+		scoped_guard (raw_spinlock_irqsave, &gc_lock)
 			list_add_tail(&gc->list, &gc_list);
 		/* Calc pointer to the next generic chip */
 		tmp += gc_sz;
@@ -467,7 +467,7 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 
 	/* We only init the cache for the first mapping of a generic chip */
 	if (!gc->installed) {
-		guard(raw_spinlock_irq)(&gc->lock);
+		guard(raw_spinlock_irqsave)(&gc->lock);
 		irq_gc_init_mask_cache(gc, dgc->gc_flags);
 	}
 
-- 
2.43.0


