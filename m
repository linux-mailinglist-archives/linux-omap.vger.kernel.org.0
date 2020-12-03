Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA42CDD42
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 19:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgLCSWS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 13:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLCSWR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 13:22:17 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F0AC061A51
        for <linux-omap@vger.kernel.org>; Thu,  3 Dec 2020 10:21:37 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id 4so1609577plk.5
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 10:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=otIoGHbn7Rfd0rLmiLwNWK05LwSDv/Nt905fdvrdyCY=;
        b=JPbifgGxS9YNfGJwnEa8CQ3vEC02+iZI76KpYuNCogGRbfgqdJELn+erdmQdp1bbyS
         Ugjyw9li4ziVFRGt8m7dz7pDrw+KDn8sqdhHCtMHPrAc73Fw5u/q6OXBzZl2nnVA7xMp
         uaFwO1ZoKIISebNcYBuvnei+8T6VUrkcSxsoD6UrrHAOfT25eq7Pfvo39wCCp3hRke4W
         7eLiGVYdnFJ9FGTRQrg7WCRNHI6gRWcvgZbNNMwewSwDvoHVx9RJ1AEPkHlRwL7df+OI
         hs5VoZyQW7oUZdDNmwRpe5ajSf3ZzxQQ9DwiWdeM1GPSKhTrnyZ3MQ0iyKjWtOuHeoKT
         gawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=otIoGHbn7Rfd0rLmiLwNWK05LwSDv/Nt905fdvrdyCY=;
        b=Hxtqkk0C27AZV8ZaAWde1SakYHxguypx7yJyPpK9Gf90vrx+aazywViww/+DmHz+dW
         GF4nxyZT92GaWQHXzsjYwwP8buv6OUJO3VbRDs7McR6Pl6iAkiVKXNk8mb/G2N9KcIvk
         lKMX4PYbNAMIC1bCK2t3BmCaX+Ma2A/laXEjV/3YY0Z46ou7C1YtIUlteInAhgzSpFW/
         RecqAoB90ni2EvGkB9Lx/cdCSZZ4GQ9Z7dWJ5IDYyphWQcD7WdResWn+r3+llp1c/IGi
         HBQcs8b+xuQzoBWLbvpdPH0/31dQhcPHJKNUs8piKPhM6RlJ39ZyxAQ5NWd+Efw6KVba
         KGuA==
X-Gm-Message-State: AOAM531nMqsIGJALboFtoqPq/Wt2zcZ8BLbHPbu/zpNlaWapJjUYTyD+
        zziCJ8bWAfm9sUU0deSWbprKqw==
X-Google-Smtp-Source: ABdhPJxA9AkPm7uiLpJrdgk/TT/Jy/1MSGD8uAMEULK6xKuTtcTuwGXxIB3fH8D4ReKx5qHxCd8jIA==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr335462pjb.143.1607019696793;
        Thu, 03 Dec 2020 10:21:36 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 85sm2516873pfy.179.2020.12.03.10.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 10:21:36 -0800 (PST)
Date:   Thu, 3 Dec 2020 11:21:34 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: Re: [PATCH v2 4/6] remoteproc/pru: Add pru-specific debugfs support
Message-ID: <20201203182134.GA1392978@xps15>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-5-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119140850.12268-5-grzegorz.jaszczyk@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 19, 2020 at 03:08:48PM +0100, Grzegorz Jaszczyk wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> The remoteproc core creates certain standard debugfs entries,
> that does not give a whole lot of useful information for the
> PRUs. The PRU remoteproc driver is enhanced to add additional
> debugfs entries for PRU. These will be auto-cleaned up when
> the parent rproc debug directory is removed.
> 
> The enhanced debugfs support adds two new entries: 'regs' and
> 'single_step'. The 'regs' dumps out the useful CTRL sub-module
> registers as well as each of the 32 GPREGs and CT_REGs registers.
> The GPREGs and CT_REGs though are printed only when the PRU is
> halted and accessible as per the IP design.
> 
> The 'single_step' utilizes the single-step execution of the PRU
> cores. Writing a non-zero value performs a single step, and a
> zero value restores the PRU to execute in the same mode as the
> mode before the first single step. (note: if the PRU is halted
> because of a halt instruction, then no change occurs).
> 
> Logic for setting the PC and jumping over a halt instruction shall
> be added in the future.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> ---
>  drivers/remoteproc/pru_rproc.c | 137 +++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index c68c3d6bfddd..d5f04d77ad54 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/debugfs.h>
>  #include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -25,6 +26,13 @@
>  /* PRU_ICSS_PRU_CTRL registers */
>  #define PRU_CTRL_CTRL		0x0000
>  #define PRU_CTRL_STS		0x0004
> +#define PRU_CTRL_WAKEUP_EN	0x0008
> +#define PRU_CTRL_CYCLE		0x000C
> +#define PRU_CTRL_STALL		0x0010
> +#define PRU_CTRL_CTBIR0		0x0020
> +#define PRU_CTRL_CTBIR1		0x0024
> +#define PRU_CTRL_CTPPR0		0x0028
> +#define PRU_CTRL_CTPPR1		0x002C
>  
>  /* CTRL register bit-fields */
>  #define CTRL_CTRL_SOFT_RST_N	BIT(0)
> @@ -34,6 +42,10 @@
>  #define CTRL_CTRL_SINGLE_STEP	BIT(8)
>  #define CTRL_CTRL_RUNSTATE	BIT(15)
>  
> +/* PRU_ICSS_PRU_DEBUG registers */
> +#define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
> +#define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
> +
>  /* PRU Core IRAM address masks */
>  #define PRU_IRAM_ADDR_MASK	0x3ffff
>  #define PRU0_IRAM_ADDR_MASK	0x34000
> @@ -73,6 +85,8 @@ enum pru_iomem {
>   * @mapped_irq: virtual interrupt numbers of created fw specific mapping
>   * @pru_interrupt_map: pointer to interrupt mapping description (firmware)
>   * @pru_interrupt_map_sz: pru_interrupt_map size
> + * @dbg_single_step: debug state variable to set PRU into single step mode
> + * @dbg_continuous: debug state variable to restore PRU execution mode
>   * @evt_count: number of mapped events
>   */
>  struct pru_rproc {
> @@ -85,6 +99,8 @@ struct pru_rproc {
>  	int *mapped_irq;
>  	struct pru_irq_rsc *pru_interrupt_map;
>  	size_t pru_interrupt_map_sz;
> +	u32 dbg_single_step;
> +	u32 dbg_continuous;
>  	u8 evt_count;
>  };
>  
> @@ -99,6 +115,125 @@ void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
>  	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
>  }
>  
> +static inline u32 pru_debug_read_reg(struct pru_rproc *pru, unsigned int reg)
> +{
> +	return readl_relaxed(pru->mem_regions[PRU_IOMEM_DEBUG].va + reg);
> +}
> +
> +static int regs_show(struct seq_file *s, void *data)
> +{
> +	struct rproc *rproc = s->private;
> +	struct pru_rproc *pru = rproc->priv;
> +	int i, nregs = 32;
> +	u32 pru_sts;
> +	int pru_is_running;
> +
> +	seq_puts(s, "============== Control Registers ==============\n");
> +	seq_printf(s, "CTRL      := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CTRL));
> +	pru_sts = pru_control_read_reg(pru, PRU_CTRL_STS);
> +	seq_printf(s, "STS (PC)  := 0x%08x (0x%08x)\n", pru_sts, pru_sts << 2);
> +	seq_printf(s, "WAKEUP_EN := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_WAKEUP_EN));
> +	seq_printf(s, "CYCLE     := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CYCLE));
> +	seq_printf(s, "STALL     := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_STALL));
> +	seq_printf(s, "CTBIR0    := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CTBIR0));
> +	seq_printf(s, "CTBIR1    := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CTBIR1));
> +	seq_printf(s, "CTPPR0    := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CTPPR0));
> +	seq_printf(s, "CTPPR1    := 0x%08x\n",
> +		   pru_control_read_reg(pru, PRU_CTRL_CTPPR1));
> +
> +	seq_puts(s, "=============== Debug Registers ===============\n");
> +	pru_is_running = pru_control_read_reg(pru, PRU_CTRL_CTRL) &
> +				CTRL_CTRL_RUNSTATE;
> +	if (pru_is_running) {
> +		seq_puts(s, "PRU is executing, cannot print/access debug registers.\n");
> +		return 0;
> +	}
> +
> +	for (i = 0; i < nregs; i++) {
> +		seq_printf(s, "GPREG%-2d := 0x%08x\tCT_REG%-2d := 0x%08x\n",
> +			   i, pru_debug_read_reg(pru, PRU_DEBUG_GPREG(i)),
> +			   i, pru_debug_read_reg(pru, PRU_DEBUG_CT_REG(i)));
> +	}
> +
> +	return 0;
> +}
> +

Here there is an extra line but below for DEFINE_SIMPLE_ATTRIBUTE() there isn't.
Please pick a heuristic and stick with it.

With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> +DEFINE_SHOW_ATTRIBUTE(regs);
> +
> +/*
> + * Control PRU single-step mode
> + *
> + * This is a debug helper function used for controlling the single-step
> + * mode of the PRU. The PRU Debug registers are not accessible when the
> + * PRU is in RUNNING state.
> + *
> + * Writing a non-zero value sets the PRU into single-step mode irrespective
> + * of its previous state. The PRU mode is saved only on the first set into
> + * a single-step mode. Writing a zero value will restore the PRU into its
> + * original mode.
> + */
> +static int pru_rproc_debug_ss_set(void *data, u64 val)
> +{
> +	struct rproc *rproc = data;
> +	struct pru_rproc *pru = rproc->priv;
> +	u32 reg_val;
> +
> +	val = val ? 1 : 0;
> +	if (!val && !pru->dbg_single_step)
> +		return 0;
> +
> +	reg_val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
> +
> +	if (val && !pru->dbg_single_step)
> +		pru->dbg_continuous = reg_val;
> +
> +	if (val)
> +		reg_val |= CTRL_CTRL_SINGLE_STEP | CTRL_CTRL_EN;
> +	else
> +		reg_val = pru->dbg_continuous;
> +
> +	pru->dbg_single_step = val;
> +	pru_control_write_reg(pru, PRU_CTRL_CTRL, reg_val);
> +
> +	return 0;
> +}
> +
> +static int pru_rproc_debug_ss_get(void *data, u64 *val)
> +{
> +	struct rproc *rproc = data;
> +	struct pru_rproc *pru = rproc->priv;
> +
> +	*val = pru->dbg_single_step;
> +
> +	return 0;
> +}
> +DEFINE_SIMPLE_ATTRIBUTE(pru_rproc_debug_ss_fops, pru_rproc_debug_ss_get,
> +			pru_rproc_debug_ss_set, "%llu\n");
> +
> +/*
> + * Create PRU-specific debugfs entries
> + *
> + * The entries are created only if the parent remoteproc debugfs directory
> + * exists, and will be cleaned up by the remoteproc core.
> + */
> +static void pru_rproc_create_debug_entries(struct rproc *rproc)
> +{
> +	if (!rproc->dbg_dir)
> +		return;
> +
> +	debugfs_create_file("regs", 0400, rproc->dbg_dir,
> +			    rproc, &regs_fops);
> +	debugfs_create_file("single_step", 0600, rproc->dbg_dir,
> +			    rproc, &pru_rproc_debug_ss_fops);
> +}
> +
>  static void pru_dispose_irq_mapping(struct pru_rproc *pru)
>  {
>  	while (pru->evt_count--) {
> @@ -573,6 +708,8 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	pru_rproc_create_debug_entries(rproc);
> +
>  	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
>  
>  	return 0;
> -- 
> 2.29.0
> 
