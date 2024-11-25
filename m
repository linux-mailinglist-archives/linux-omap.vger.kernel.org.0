Return-Path: <linux-omap+bounces-2728-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F89D7D63
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 09:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B98F162081
	for <lists+linux-omap@lfdr.de>; Mon, 25 Nov 2024 08:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C08D1991BA;
	Mon, 25 Nov 2024 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Zjt93dZq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75419ABC6
	for <linux-omap@vger.kernel.org>; Mon, 25 Nov 2024 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524355; cv=none; b=IKzrBXMUxQnS5NCKQi+Abh5kDBMDjZpg+SLpvwMP6/7DrEAcn9tnoFlEoZMHqOaUUv00gLWhskIKCQP/7KwQMfG8W3GtUetd5TygY73CHF7yiXC/MBLcSWs1SXGwuhaCPfza2/q9e/O67TCevxMJY5I+aSBDFWb4jXP4Ch693Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524355; c=relaxed/simple;
	bh=A7jjK4571ULQWsuUzRVqTOLAWKXzMMGDv/1J8nAJEbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbnMpKppaHhLVkI7B1XbRLiwTTxOfOOg5WsWzqn3FD/P45TVXXUO1rqJ7O+6eEejVQyWFL7T0wcrvbOUtUOMvX7sRLgdM1woAKsElUfCZiOYwKoWN5yjASxa9dxd9FArk6rY+E/vOVc+qhxpc8l6UtT8fMg2bkimTnoYdC6ob38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Zjt93dZq; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202411250805326357e29096984072e0
        for <linux-omap@vger.kernel.org>;
        Mon, 25 Nov 2024 09:05:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QtvmmKKnCZjY+drnBwcESe4cUSDKG7ZwbKlK60eekl0=;
 b=Zjt93dZqmYpvi3n3PkNPJ0j5748XHXDMaispvy+1SYUH+0KAyfqt/r6fkxtpUnolOmhTk6
 XeXCXHkjDICuAn0h/XPDHCOxAuwokGMSkoLpMLzxeBf9+nDicw6L3FyoXyKFolmDOpbzFCPl
 v+5CcIwtwyqxPYpoaXRKsEdCMedS1O0wEUbDbYr2HwLLzJ0NqQcciE/IumoK4AHpFoZp81rD
 LDm/fjAzscOaNopxFrkuOwfWllnEJhoa8A6b1OapF2zDYJjBT0iGZ2jnIQZiVDGnGWI+HV4S
 72nBjclSA5osDZdt/VVE3F6H2b/kox+Vj9nBwIky4MGelL9jNCayTErg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-omap@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
Date: Mon, 25 Nov 2024 09:05:24 +0100
Message-ID: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
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

The problem apparetly has been known since the conversion to
raw_spin_lock() (commit 4dbada2be460
("gpio: omap: use raw locks for locking")).

Symptom:

[ BUG: Invalid wait context ]
5.10.214
-----------------------------
swapper/1 is trying to lock:
(enable_lock){....}-{3:3}, at: clk_enable_lock
other info that might help us debug this:
context-{5:5}
2 locks held by swapper/1:
 #0: (&dev->mutex){....}-{4:4}, at: device_driver_attach
 #1: (&bank->lock){....}-{2:2}, at: omap_gpio_set_config
stack backtrace:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.214
Hardware name: Generic AM33XX (Flattened Device Tree)
unwind_backtrace
show_stack
__lock_acquire
lock_acquire.part.0
_raw_spin_lock_irqsave
clk_enable_lock
clk_enable
omap_gpio_set_config
gpio_keys_setup_key
gpio_keys_probe
platform_drv_probe
really_probe
driver_probe_device
device_driver_attach
__driver_attach
bus_for_each_dev
bus_add_driver
driver_register
do_one_initcall
do_initcalls
kernel_init_freeable
kernel_init

Problematic spin_lock_irqsave(&enable_lock, ...) is being called by
clk_enable()/clk_disable() in omap2_set_gpio_debounce() and
omap_clear_gpio_debounce().

For omap2_set_gpio_debounce() it's possible to move
raw_spin_lock_irqsave(&bank->lock, ...) inside omap2_set_gpio_debounce()
so that the locks nest as follows:

  clk_enable(bank->dbck)
  raw_spin_lock_irqsave(&bank->lock, ...)
  raw_spin_unlock_irqrestore()
  clk_disable()

Two call-sites of omap_clear_gpio_debounce() are more convoluted, but one
can take the advantage of the nesting nature of clk_enable()/clk_disable(),
so that the inner clk_disable() becomes lockless:

  clk_enable(bank->dbck)		<-- only to clk_enable_lock()
  raw_spin_lock_irqsave(&bank->lock, ...)
  omap_clear_gpio_debounce()
    clk_disable()			<-- becomes lockless
  raw_spin_unlock_irqrestore()
  clk_disable()

Cc: stable@vger.kernel.org
Fixes: 4dbada2be460 ("gpio: omap: use raw locks for locking")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/gpio/gpio-omap.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7ad4534054962..f9e502aa57753 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -181,6 +181,7 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
 static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 				   unsigned debounce)
 {
+	unsigned long		flags;
 	u32			val;
 	u32			l;
 	bool			enable = !!debounce;
@@ -196,13 +197,18 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 
 	l = BIT(offset);
 
+	/*
+	 * Ordering is important here: clk_enable() calls spin_lock_irqsave(),
+	 * therefore it must be outside of the following raw_spin_lock_irqsave()
+	 */
 	clk_enable(bank->dbck);
+	raw_spin_lock_irqsave(&bank->lock, flags);
+
 	writel_relaxed(debounce, bank->base + bank->regs->debounce);
 
 	val = omap_gpio_rmw(bank->base + bank->regs->debounce_en, l, enable);
 	bank->dbck_enable_mask = val;
 
-	clk_disable(bank->dbck);
 	/*
 	 * Enable debounce clock per module.
 	 * This call is mandatory because in omap_gpio_request() when
@@ -217,6 +223,9 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 		bank->context.debounce_en = val;
 	}
 
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+	clk_disable(bank->dbck);
+
 	return 0;
 }
 
@@ -647,6 +656,13 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 	unsigned long flags;
 	unsigned offset = d->hwirq;
 
+	/*
+	 * Enable the clock here so that the nested clk_disable() in the
+	 * following omap_clear_gpio_debounce() is lockless
+	 */
+	if (bank->dbck_flag)
+		clk_enable(bank->dbck);
+
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->irq_usage &= ~(BIT(offset));
 	omap_set_gpio_triggering(bank, offset, IRQ_TYPE_NONE);
@@ -656,6 +672,9 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 		omap_clear_gpio_debounce(bank, offset);
 	omap_disable_gpio_module(bank, offset);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	if (bank->dbck_flag)
+		clk_disable(bank->dbck);
 }
 
 static void omap_gpio_irq_bus_lock(struct irq_data *data)
@@ -827,6 +846,13 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
 
+	/*
+	 * Enable the clock here so that the nested clk_disable() in the
+	 * following omap_clear_gpio_debounce() is lockless
+	 */
+	if (bank->dbck_flag)
+		clk_enable(bank->dbck);
+
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->mod_usage &= ~(BIT(offset));
 	if (!LINE_USED(bank->irq_usage, offset)) {
@@ -836,6 +862,9 @@ static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 	omap_disable_gpio_module(bank, offset);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
+	if (bank->dbck_flag)
+		clk_disable(bank->dbck);
+
 	pm_runtime_put(chip->parent);
 }
 
@@ -913,15 +942,11 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 			      unsigned debounce)
 {
 	struct gpio_bank *bank;
-	unsigned long flags;
 	int ret;
 
 	bank = gpiochip_get_data(chip);
 
-	raw_spin_lock_irqsave(&bank->lock, flags);
 	ret = omap2_set_gpio_debounce(bank, offset, debounce);
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-
 	if (ret)
 		dev_info(chip->parent,
 			 "Could not set line %u debounce to %u microseconds (%d)",
-- 
2.47.0


