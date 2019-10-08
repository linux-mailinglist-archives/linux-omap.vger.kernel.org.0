Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E34CF8A5
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 13:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbfJHLja (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 07:39:30 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50905 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbfJHLja (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 07:39:30 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iHnpw-0005f2-Tq; Tue, 08 Oct 2019 13:39:28 +0200
Message-ID: <1570534767.18914.1.camel@pengutronix.de>
Subject: Re: [PATCHv7 2/9] soc: ti: add initial PRM driver with reset
 control support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        ssantosh@kernel.org
Cc:     tony@atomide.com, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date:   Tue, 08 Oct 2019 13:39:27 +0200
In-Reply-To: <20191008071913.28740-3-t-kristo@ti.com>
References: <20191008071913.28740-1-t-kristo@ti.com>
         <20191008071913.28740-3-t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 2019-10-08 at 10:19 +0300, Tero Kristo wrote:
> Add initial PRM (Power and Reset Management) driver for TI OMAP class
> SoCs. Initially this driver only supports reset control, but can be
> extended to support rest of the functionality, like powerdomain
> control, PRCM irq support etc.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/mach-omap2/Kconfig |   1 +
>  drivers/soc/ti/Makefile     |   1 +
>  drivers/soc/ti/omap_prm.c   | 259 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 261 insertions(+)
>  create mode 100644 drivers/soc/ti/omap_prm.c
> 
> diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
> index fdb6743760a2..ad08d470a2ca 100644
> --- a/arch/arm/mach-omap2/Kconfig
> +++ b/arch/arm/mach-omap2/Kconfig
> @@ -109,6 +109,7 @@ config ARCH_OMAP2PLUS
>  	select TI_SYSC
>  	select OMAP_IRQCHIP
>  	select CLKSRC_TI_32K
> +	select ARCH_HAS_RESET_CONTROLLER
>  	help
>  	  Systems based on OMAP2, OMAP3, OMAP4 or OMAP5
>  
> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
> index b3868d392d4f..788b5cd1e180 100644
> --- a/drivers/soc/ti/Makefile
> +++ b/drivers/soc/ti/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_QMSS)	+= knav_qmss.o
>  knav_qmss-y := knav_qmss_queue.o knav_qmss_acc.o
>  obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)	+= knav_dma.o
>  obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
> +obj-$(CONFIG_ARCH_OMAP2PLUS)		+= omap_prm.o
>  obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
>  obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
>  obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> new file mode 100644
> index 000000000000..ab0b66ad715d
> --- /dev/null
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OMAP2+ PRM driver
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *	Tero Kristo <t-kristo@ti.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/delay.h>
> +
> +struct omap_rst_map {
> +	s8 rst;
> +	s8 st;
> +};
> +
> +struct omap_prm_data {
> +	u32 base;
> +	const char *name;
> +	u16 rstctrl;
> +	u16 rstst;
> +	const struct omap_rst_map *rstmap;
> +	u8 flags;
> +};
> +
> +struct omap_prm {
> +	const struct omap_prm_data *data;
> +	void __iomem *base;
> +};
> +
> +struct omap_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct omap_prm *prm;
> +	u32 mask;
> +	spinlock_t lock;
> +};
> +
> +#define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
> +
> +#define OMAP_MAX_RESETS		8
> +#define OMAP_RESET_MAX_WAIT	10000
> +
> +#define OMAP_PRM_HAS_RSTCTRL	BIT(0)
> +#define OMAP_PRM_HAS_RSTST	BIT(1)
> +
> +#define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
> +
> +static const struct of_device_id omap_prm_id_table[] = {
> +	{ },
> +};
> +
> +static bool _is_valid_reset(struct omap_reset_data *reset, unsigned long id)
> +{
> +	if (reset->mask & BIT(id))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int omap_reset_get_st_bit(struct omap_reset_data *reset,
> +				 unsigned long id)
> +{
> +	const struct omap_rst_map *map = reset->prm->data->rstmap;
> +
> +	while (map->rst >= 0) {
> +		if (map->rst == id)
> +			return map->st;
> +
> +		map++;
> +	}
> +
> +	return id;
> +}
> +
> +static int omap_reset_status(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +	int st_bit = omap_reset_get_st_bit(reset, id);
> +	bool has_rstst = reset->prm->data->rstst ||
> +		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
> +
> +	/* Check if we have rstst */
> +	if (!has_rstst)
> +		return -ENOTSUPP;
> +
> +	/* Check if hw reset line is asserted */
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
> +	if (v & BIT(id))
> +		return 1;
> +
> +	/*
> +	 * Check reset status, high value means reset sequence has been
> +	 * completed successfully so we can return 0 here (reset deasserted)
> +	 */
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> +	v >>= st_bit;
> +	v &= 1;
> +
> +	return !v;
> +}
> +
> +static int omap_reset_assert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +	unsigned long flags;
> +
> +	/* assert the reset control line */
> +	spin_lock_irqsave(&reset->lock, flags);
> +	v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
> +	v |= 1 << id;
> +	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
> +	spin_unlock_irqrestore(&reset->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int omap_reset_deassert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct omap_reset_data *reset = to_omap_reset_data(rcdev);
> +	u32 v;
> +	int st_bit;
> +	bool has_rstst;
> +	unsigned long flags;
> +
> +	has_rstst = reset->prm->data->rstst ||
> +		(reset->prm->data->flags & OMAP_PRM_HAS_RSTST);
> +
> +	if (has_rstst) {
> +		st_bit = omap_reset_get_st_bit(reset, id);
> +
> +		/* Clear the reset status by writing 1 to the status bit */
> +		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
> +		v |= 1 << st_bit;
> +		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);

Could this accidentally clear the bits of other already completed
resets? If this is a "write 1 to clear" register, and writing zero bits
has no effect, I'd expect this to be just:

		v = 1 << st_bit;
		writel_relaxed(v, reset->prm->base + reset->prm->data->rstst);

With this fixed (or, if I am mistaken, clarified):
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
