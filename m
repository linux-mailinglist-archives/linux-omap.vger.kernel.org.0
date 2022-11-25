Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80219638598
	for <lists+linux-omap@lfdr.de>; Fri, 25 Nov 2022 09:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiKYIzN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Nov 2022 03:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiKYIzM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Nov 2022 03:55:12 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0764931EFB;
        Fri, 25 Nov 2022 00:55:10 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 79BE780CD;
        Fri, 25 Nov 2022 08:55:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: musb: Drop old unused am35x glue layer
Date:   Fri, 25 Nov 2022 10:55:06 +0200
Message-Id: <20221125085506.38127-1-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The am35x glue layer is no longer in use and can be dropped. There are no
longer any SoCs passing platform data for it as they are booting using
devicetree.

In general, the am35x SoCs are similar to am335x and ti81xx and can
use the musb_dsps glue layer as long as there is a proper phy driver
available.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/Kconfig  |   5 -
 drivers/usb/musb/Makefile |   1 -
 drivers/usb/musb/am35x.c  | 610 --------------------------------------
 3 files changed, 616 deletions(-)
 delete mode 100644 drivers/usb/musb/am35x.c

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -94,11 +94,6 @@ config USB_MUSB_OMAP2PLUS
 	depends on OMAP_CONTROL_PHY || !OMAP_CONTROL_PHY
 	select GENERIC_PHY
 
-config USB_MUSB_AM35X
-	tristate "AM35x"
-	depends on ARCH_OMAP
-	depends on NOP_USB_XCEIV
-
 config USB_MUSB_DSPS
 	tristate "TI DSPS platforms"
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
--- a/drivers/usb/musb/Makefile
+++ b/drivers/usb/musb/Makefile
@@ -16,7 +16,6 @@ musb_hdrc-$(CONFIG_DEBUG_FS)			+= musb_debugfs.o
 
 # Hardware Glue Layer
 obj-$(CONFIG_USB_MUSB_OMAP2PLUS)		+= omap2430.o
-obj-$(CONFIG_USB_MUSB_AM35X)			+= am35x.o
 obj-$(CONFIG_USB_MUSB_DSPS)			+= musb_dsps.o
 obj-$(CONFIG_USB_MUSB_TUSB6010)			+= tusb6010.o
 obj-$(CONFIG_USB_MUSB_DAVINCI)			+= davinci.o
diff --git a/drivers/usb/musb/am35x.c b/drivers/usb/musb/am35x.c
deleted file mode 100644
--- a/drivers/usb/musb/am35x.c
+++ /dev/null
@@ -1,610 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/*
- * Texas Instruments AM35x "glue layer"
- *
- * Copyright (c) 2010, by Texas Instruments
- *
- * Based on the DA8xx "glue layer" code.
- * Copyright (c) 2008-2009, MontaVista Software, Inc. <source@mvista.com>
- *
- * This file is part of the Inventra Controller Driver for Linux.
- */
-
-#include <linux/module.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/dma-mapping.h>
-#include <linux/usb/usb_phy_generic.h>
-#include <linux/platform_data/usb-omap.h>
-
-#include "musb_core.h"
-
-/*
- * AM35x specific definitions
- */
-/* USB 2.0 OTG module registers */
-#define USB_REVISION_REG	0x00
-#define USB_CTRL_REG		0x04
-#define USB_STAT_REG		0x08
-#define USB_EMULATION_REG	0x0c
-/* 0x10 Reserved */
-#define USB_AUTOREQ_REG		0x14
-#define USB_SRP_FIX_TIME_REG	0x18
-#define USB_TEARDOWN_REG	0x1c
-#define EP_INTR_SRC_REG		0x20
-#define EP_INTR_SRC_SET_REG	0x24
-#define EP_INTR_SRC_CLEAR_REG	0x28
-#define EP_INTR_MASK_REG	0x2c
-#define EP_INTR_MASK_SET_REG	0x30
-#define EP_INTR_MASK_CLEAR_REG	0x34
-#define EP_INTR_SRC_MASKED_REG	0x38
-#define CORE_INTR_SRC_REG	0x40
-#define CORE_INTR_SRC_SET_REG	0x44
-#define CORE_INTR_SRC_CLEAR_REG	0x48
-#define CORE_INTR_MASK_REG	0x4c
-#define CORE_INTR_MASK_SET_REG	0x50
-#define CORE_INTR_MASK_CLEAR_REG 0x54
-#define CORE_INTR_SRC_MASKED_REG 0x58
-/* 0x5c Reserved */
-#define USB_END_OF_INTR_REG	0x60
-
-/* Control register bits */
-#define AM35X_SOFT_RESET_MASK	1
-
-/* USB interrupt register bits */
-#define AM35X_INTR_USB_SHIFT	16
-#define AM35X_INTR_USB_MASK	(0x1ff << AM35X_INTR_USB_SHIFT)
-#define AM35X_INTR_DRVVBUS	0x100
-#define AM35X_INTR_RX_SHIFT	16
-#define AM35X_INTR_TX_SHIFT	0
-#define AM35X_TX_EP_MASK	0xffff		/* EP0 + 15 Tx EPs */
-#define AM35X_RX_EP_MASK	0xfffe		/* 15 Rx EPs */
-#define AM35X_TX_INTR_MASK	(AM35X_TX_EP_MASK << AM35X_INTR_TX_SHIFT)
-#define AM35X_RX_INTR_MASK	(AM35X_RX_EP_MASK << AM35X_INTR_RX_SHIFT)
-
-#define USB_MENTOR_CORE_OFFSET	0x400
-
-struct am35x_glue {
-	struct device		*dev;
-	struct platform_device	*musb;
-	struct platform_device	*phy;
-	struct clk		*phy_clk;
-	struct clk		*clk;
-};
-
-/*
- * am35x_musb_enable - enable interrupts
- */
-static void am35x_musb_enable(struct musb *musb)
-{
-	void __iomem *reg_base = musb->ctrl_base;
-	u32 epmask;
-
-	/* Workaround: setup IRQs through both register sets. */
-	epmask = ((musb->epmask & AM35X_TX_EP_MASK) << AM35X_INTR_TX_SHIFT) |
-	       ((musb->epmask & AM35X_RX_EP_MASK) << AM35X_INTR_RX_SHIFT);
-
-	musb_writel(reg_base, EP_INTR_MASK_SET_REG, epmask);
-	musb_writel(reg_base, CORE_INTR_MASK_SET_REG, AM35X_INTR_USB_MASK);
-
-	/* Force the DRVVBUS IRQ so we can start polling for ID change. */
-	musb_writel(reg_base, CORE_INTR_SRC_SET_REG,
-			AM35X_INTR_DRVVBUS << AM35X_INTR_USB_SHIFT);
-}
-
-/*
- * am35x_musb_disable - disable HDRC and flush interrupts
- */
-static void am35x_musb_disable(struct musb *musb)
-{
-	void __iomem *reg_base = musb->ctrl_base;
-
-	musb_writel(reg_base, CORE_INTR_MASK_CLEAR_REG, AM35X_INTR_USB_MASK);
-	musb_writel(reg_base, EP_INTR_MASK_CLEAR_REG,
-			 AM35X_TX_INTR_MASK | AM35X_RX_INTR_MASK);
-	musb_writel(reg_base, USB_END_OF_INTR_REG, 0);
-}
-
-#define portstate(stmt)		stmt
-
-static void am35x_musb_set_vbus(struct musb *musb, int is_on)
-{
-	WARN_ON(is_on && is_peripheral_active(musb));
-}
-
-#define	POLL_SECONDS	2
-
-static void otg_timer(struct timer_list *t)
-{
-	struct musb		*musb = from_timer(musb, t, dev_timer);
-	void __iomem		*mregs = musb->mregs;
-	u8			devctl;
-	unsigned long		flags;
-
-	/*
-	 * We poll because AM35x's won't expose several OTG-critical
-	 * status change events (from the transceiver) otherwise.
-	 */
-	devctl = musb_readb(mregs, MUSB_DEVCTL);
-	dev_dbg(musb->controller, "Poll devctl %02x (%s)\n", devctl,
-		usb_otg_state_string(musb->xceiv->otg->state));
-
-	spin_lock_irqsave(&musb->lock, flags);
-	switch (musb->xceiv->otg->state) {
-	case OTG_STATE_A_WAIT_BCON:
-		devctl &= ~MUSB_DEVCTL_SESSION;
-		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
-
-		devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
-		if (devctl & MUSB_DEVCTL_BDEVICE) {
-			musb->xceiv->otg->state = OTG_STATE_B_IDLE;
-			MUSB_DEV_MODE(musb);
-		} else {
-			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
-			MUSB_HST_MODE(musb);
-		}
-		break;
-	case OTG_STATE_A_WAIT_VFALL:
-		musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-		musb_writel(musb->ctrl_base, CORE_INTR_SRC_SET_REG,
-			    MUSB_INTR_VBUSERROR << AM35X_INTR_USB_SHIFT);
-		break;
-	case OTG_STATE_B_IDLE:
-		devctl = musb_readb(mregs, MUSB_DEVCTL);
-		if (devctl & MUSB_DEVCTL_BDEVICE)
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
-		else
-			musb->xceiv->otg->state = OTG_STATE_A_IDLE;
-		break;
-	default:
-		break;
-	}
-	spin_unlock_irqrestore(&musb->lock, flags);
-}
-
-static void am35x_musb_try_idle(struct musb *musb, unsigned long timeout)
-{
-	static unsigned long last_timer;
-
-	if (timeout == 0)
-		timeout = jiffies + msecs_to_jiffies(3);
-
-	/* Never idle if active, or when VBUS timeout is not set as host */
-	if (musb->is_active || (musb->a_wait_bcon == 0 &&
-				musb->xceiv->otg->state == OTG_STATE_A_WAIT_BCON)) {
-		dev_dbg(musb->controller, "%s active, deleting timer\n",
-			usb_otg_state_string(musb->xceiv->otg->state));
-		del_timer(&musb->dev_timer);
-		last_timer = jiffies;
-		return;
-	}
-
-	if (time_after(last_timer, timeout) && timer_pending(&musb->dev_timer)) {
-		dev_dbg(musb->controller, "Longer idle timer already pending, ignoring...\n");
-		return;
-	}
-	last_timer = timeout;
-
-	dev_dbg(musb->controller, "%s inactive, starting idle timer for %u ms\n",
-		usb_otg_state_string(musb->xceiv->otg->state),
-		jiffies_to_msecs(timeout - jiffies));
-	mod_timer(&musb->dev_timer, timeout);
-}
-
-static irqreturn_t am35x_musb_interrupt(int irq, void *hci)
-{
-	struct musb  *musb = hci;
-	void __iomem *reg_base = musb->ctrl_base;
-	struct device *dev = musb->controller;
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-	unsigned long flags;
-	irqreturn_t ret = IRQ_NONE;
-	u32 epintr, usbintr;
-
-	spin_lock_irqsave(&musb->lock, flags);
-
-	/* Get endpoint interrupts */
-	epintr = musb_readl(reg_base, EP_INTR_SRC_MASKED_REG);
-
-	if (epintr) {
-		musb_writel(reg_base, EP_INTR_SRC_CLEAR_REG, epintr);
-
-		musb->int_rx =
-			(epintr & AM35X_RX_INTR_MASK) >> AM35X_INTR_RX_SHIFT;
-		musb->int_tx =
-			(epintr & AM35X_TX_INTR_MASK) >> AM35X_INTR_TX_SHIFT;
-	}
-
-	/* Get usb core interrupts */
-	usbintr = musb_readl(reg_base, CORE_INTR_SRC_MASKED_REG);
-	if (!usbintr && !epintr)
-		goto eoi;
-
-	if (usbintr) {
-		musb_writel(reg_base, CORE_INTR_SRC_CLEAR_REG, usbintr);
-
-		musb->int_usb =
-			(usbintr & AM35X_INTR_USB_MASK) >> AM35X_INTR_USB_SHIFT;
-	}
-	/*
-	 * DRVVBUS IRQs are the only proxy we have (a very poor one!) for
-	 * AM35x's missing ID change IRQ.  We need an ID change IRQ to
-	 * switch appropriately between halves of the OTG state machine.
-	 * Managing DEVCTL.SESSION per Mentor docs requires that we know its
-	 * value but DEVCTL.BDEVICE is invalid without DEVCTL.SESSION set.
-	 * Also, DRVVBUS pulses for SRP (but not at 5V) ...
-	 */
-	if (usbintr & (AM35X_INTR_DRVVBUS << AM35X_INTR_USB_SHIFT)) {
-		int drvvbus = musb_readl(reg_base, USB_STAT_REG);
-		void __iomem *mregs = musb->mregs;
-		u8 devctl = musb_readb(mregs, MUSB_DEVCTL);
-		int err;
-
-		err = musb->int_usb & MUSB_INTR_VBUSERROR;
-		if (err) {
-			/*
-			 * The Mentor core doesn't debounce VBUS as needed
-			 * to cope with device connect current spikes. This
-			 * means it's not uncommon for bus-powered devices
-			 * to get VBUS errors during enumeration.
-			 *
-			 * This is a workaround, but newer RTL from Mentor
-			 * seems to allow a better one: "re"-starting sessions
-			 * without waiting for VBUS to stop registering in
-			 * devctl.
-			 */
-			musb->int_usb &= ~MUSB_INTR_VBUSERROR;
-			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VFALL;
-			mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
-			WARNING("VBUS error workaround (delay coming)\n");
-		} else if (drvvbus) {
-			MUSB_HST_MODE(musb);
-			musb->xceiv->otg->state = OTG_STATE_A_WAIT_VRISE;
-			portstate(musb->port1_status |= USB_PORT_STAT_POWER);
-			del_timer(&musb->dev_timer);
-		} else {
-			musb->is_active = 0;
-			MUSB_DEV_MODE(musb);
-			musb->xceiv->otg->state = OTG_STATE_B_IDLE;
-			portstate(musb->port1_status &= ~USB_PORT_STAT_POWER);
-		}
-
-		/* NOTE: this must complete power-on within 100 ms. */
-		dev_dbg(musb->controller, "VBUS %s (%s)%s, devctl %02x\n",
-				drvvbus ? "on" : "off",
-				usb_otg_state_string(musb->xceiv->otg->state),
-				err ? " ERROR" : "",
-				devctl);
-		ret = IRQ_HANDLED;
-	}
-
-	/* Drop spurious RX and TX if device is disconnected */
-	if (musb->int_usb & MUSB_INTR_DISCONNECT) {
-		musb->int_tx = 0;
-		musb->int_rx = 0;
-	}
-
-	if (musb->int_tx || musb->int_rx || musb->int_usb)
-		ret |= musb_interrupt(musb);
-
-eoi:
-	/* EOI needs to be written for the IRQ to be re-asserted. */
-	if (ret == IRQ_HANDLED || epintr || usbintr) {
-		/* clear level interrupt */
-		if (data->clear_irq)
-			data->clear_irq();
-		/* write EOI */
-		musb_writel(reg_base, USB_END_OF_INTR_REG, 0);
-	}
-
-	/* Poll for ID change */
-	if (musb->xceiv->otg->state == OTG_STATE_B_IDLE)
-		mod_timer(&musb->dev_timer, jiffies + POLL_SECONDS * HZ);
-
-	spin_unlock_irqrestore(&musb->lock, flags);
-
-	return ret;
-}
-
-static int am35x_musb_set_mode(struct musb *musb, u8 musb_mode)
-{
-	struct device *dev = musb->controller;
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-	int     retval = 0;
-
-	if (data->set_mode)
-		data->set_mode(musb_mode);
-	else
-		retval = -EIO;
-
-	return retval;
-}
-
-static int am35x_musb_init(struct musb *musb)
-{
-	struct device *dev = musb->controller;
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-	void __iomem *reg_base = musb->ctrl_base;
-	u32 rev;
-
-	musb->mregs += USB_MENTOR_CORE_OFFSET;
-
-	/* Returns zero if e.g. not clocked */
-	rev = musb_readl(reg_base, USB_REVISION_REG);
-	if (!rev)
-		return -ENODEV;
-
-	musb->xceiv = usb_get_phy(USB_PHY_TYPE_USB2);
-	if (IS_ERR_OR_NULL(musb->xceiv))
-		return -EPROBE_DEFER;
-
-	timer_setup(&musb->dev_timer, otg_timer, 0);
-
-	/* Reset the musb */
-	if (data->reset)
-		data->reset();
-
-	/* Reset the controller */
-	musb_writel(reg_base, USB_CTRL_REG, AM35X_SOFT_RESET_MASK);
-
-	/* Start the on-chip PHY and its PLL. */
-	if (data->set_phy_power)
-		data->set_phy_power(1);
-
-	msleep(5);
-
-	musb->isr = am35x_musb_interrupt;
-
-	/* clear level interrupt */
-	if (data->clear_irq)
-		data->clear_irq();
-
-	return 0;
-}
-
-static int am35x_musb_exit(struct musb *musb)
-{
-	struct device *dev = musb->controller;
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-
-	del_timer_sync(&musb->dev_timer);
-
-	/* Shutdown the on-chip PHY and its PLL. */
-	if (data->set_phy_power)
-		data->set_phy_power(0);
-
-	usb_put_phy(musb->xceiv);
-
-	return 0;
-}
-
-/* AM35x supports only 32bit read operation */
-static void am35x_read_fifo(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
-{
-	void __iomem *fifo = hw_ep->fifo;
-	u32		val;
-	int		i;
-
-	/* Read for 32bit-aligned destination address */
-	if (likely((0x03 & (unsigned long) dst) == 0) && len >= 4) {
-		readsl(fifo, dst, len >> 2);
-		dst += len & ~0x03;
-		len &= 0x03;
-	}
-	/*
-	 * Now read the remaining 1 to 3 byte or complete length if
-	 * unaligned address.
-	 */
-	if (len > 4) {
-		for (i = 0; i < (len >> 2); i++) {
-			*(u32 *) dst = musb_readl(fifo, 0);
-			dst += 4;
-		}
-		len &= 0x03;
-	}
-	if (len > 0) {
-		val = musb_readl(fifo, 0);
-		memcpy(dst, &val, len);
-	}
-}
-
-static const struct musb_platform_ops am35x_ops = {
-	.quirks		= MUSB_DMA_INVENTRA | MUSB_INDEXED_EP,
-	.init		= am35x_musb_init,
-	.exit		= am35x_musb_exit,
-
-	.read_fifo	= am35x_read_fifo,
-#ifdef CONFIG_USB_INVENTRA_DMA
-	.dma_init	= musbhs_dma_controller_create,
-	.dma_exit	= musbhs_dma_controller_destroy,
-#endif
-	.enable		= am35x_musb_enable,
-	.disable	= am35x_musb_disable,
-
-	.set_mode	= am35x_musb_set_mode,
-	.try_idle	= am35x_musb_try_idle,
-
-	.set_vbus	= am35x_musb_set_vbus,
-};
-
-static const struct platform_device_info am35x_dev_info = {
-	.name		= "musb-hdrc",
-	.id		= PLATFORM_DEVID_AUTO,
-	.dma_mask	= DMA_BIT_MASK(32),
-};
-
-static int am35x_probe(struct platform_device *pdev)
-{
-	struct musb_hdrc_platform_data	*pdata = dev_get_platdata(&pdev->dev);
-	struct platform_device		*musb;
-	struct am35x_glue		*glue;
-	struct platform_device_info	pinfo;
-	struct clk			*phy_clk;
-	struct clk			*clk;
-
-	int				ret = -ENOMEM;
-
-	glue = kzalloc(sizeof(*glue), GFP_KERNEL);
-	if (!glue)
-		goto err0;
-
-	phy_clk = clk_get(&pdev->dev, "fck");
-	if (IS_ERR(phy_clk)) {
-		dev_err(&pdev->dev, "failed to get PHY clock\n");
-		ret = PTR_ERR(phy_clk);
-		goto err3;
-	}
-
-	clk = clk_get(&pdev->dev, "ick");
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
-		ret = PTR_ERR(clk);
-		goto err4;
-	}
-
-	ret = clk_enable(phy_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable PHY clock\n");
-		goto err5;
-	}
-
-	ret = clk_enable(clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto err6;
-	}
-
-	glue->dev			= &pdev->dev;
-	glue->phy_clk			= phy_clk;
-	glue->clk			= clk;
-
-	pdata->platform_ops		= &am35x_ops;
-
-	glue->phy = usb_phy_generic_register();
-	if (IS_ERR(glue->phy)) {
-		ret = PTR_ERR(glue->phy);
-		goto err7;
-	}
-	platform_set_drvdata(pdev, glue);
-
-	pinfo = am35x_dev_info;
-	pinfo.parent = &pdev->dev;
-	pinfo.res = pdev->resource;
-	pinfo.num_res = pdev->num_resources;
-	pinfo.data = pdata;
-	pinfo.size_data = sizeof(*pdata);
-	pinfo.fwnode = of_fwnode_handle(pdev->dev.of_node);
-	pinfo.of_node_reused = true;
-
-	glue->musb = musb = platform_device_register_full(&pinfo);
-	if (IS_ERR(musb)) {
-		ret = PTR_ERR(musb);
-		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
-		goto err8;
-	}
-
-	return 0;
-
-err8:
-	usb_phy_generic_unregister(glue->phy);
-
-err7:
-	clk_disable(clk);
-
-err6:
-	clk_disable(phy_clk);
-
-err5:
-	clk_put(clk);
-
-err4:
-	clk_put(phy_clk);
-
-err3:
-	kfree(glue);
-
-err0:
-	return ret;
-}
-
-static int am35x_remove(struct platform_device *pdev)
-{
-	struct am35x_glue	*glue = platform_get_drvdata(pdev);
-
-	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(glue->phy);
-	clk_disable(glue->clk);
-	clk_disable(glue->phy_clk);
-	clk_put(glue->clk);
-	clk_put(glue->phy_clk);
-	kfree(glue);
-
-	return 0;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int am35x_suspend(struct device *dev)
-{
-	struct am35x_glue	*glue = dev_get_drvdata(dev);
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-
-	/* Shutdown the on-chip PHY and its PLL. */
-	if (data->set_phy_power)
-		data->set_phy_power(0);
-
-	clk_disable(glue->phy_clk);
-	clk_disable(glue->clk);
-
-	return 0;
-}
-
-static int am35x_resume(struct device *dev)
-{
-	struct am35x_glue	*glue = dev_get_drvdata(dev);
-	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = plat->board_data;
-	int			ret;
-
-	/* Start the on-chip PHY and its PLL. */
-	if (data->set_phy_power)
-		data->set_phy_power(1);
-
-	ret = clk_enable(glue->phy_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable PHY clock\n");
-		return ret;
-	}
-
-	ret = clk_enable(glue->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable clock\n");
-		return ret;
-	}
-
-	return 0;
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(am35x_pm_ops, am35x_suspend, am35x_resume);
-
-static struct platform_driver am35x_driver = {
-	.probe		= am35x_probe,
-	.remove		= am35x_remove,
-	.driver		= {
-		.name	= "musb-am35x",
-		.pm	= &am35x_pm_ops,
-	},
-};
-
-MODULE_DESCRIPTION("AM35x MUSB Glue Layer");
-MODULE_AUTHOR("Ajay Kumar Gupta <ajay.gupta@ti.com>");
-MODULE_LICENSE("GPL v2");
-module_platform_driver(am35x_driver);
-- 
2.38.1
