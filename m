Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0810ADCCC0
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 19:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391862AbfJRR1k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 13:27:40 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:46700 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505513AbfJRR1f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 13:27:35 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23993628AbfJRR1bkgOYe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org> + 2 others);
        Fri, 18 Oct 2019 19:27:31 +0200
Date:   Fri, 18 Oct 2019 19:27:28 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb: reduce stack usage
Message-ID: <20191018172728.GA11857@lenoch>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 18, 2019 at 05:30:04PM +0100, Sudip Mukherjee wrote:
> The build of xtensa allmodconfig is giving a warning of:
> In function 'dsi_dump_dsidev_irqs':
> warning: the frame size of 1120 bytes is larger than 1024 bytes
> 
> Allocate the memory for 'struct dsi_irq_stats' dynamically instead
> of assigning it in stack.

So now function can fail silently, executes longer, code is sligthly
bigger... And all that to silent warning about exceeding frame size.
Is it really worth "fixing"?

> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> index d620376216e1..43402467bf40 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -1536,22 +1536,25 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  {
>  	struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
>  	unsigned long flags;
> -	struct dsi_irq_stats stats;
> +	struct dsi_irq_stats *stats;
>  
> +	stats = kmalloc(sizeof(*stats), GFP_KERNEL);
> +	if (!stats)
> +		return;
>  	spin_lock_irqsave(&dsi->irq_stats_lock, flags);
>  
> -	stats = dsi->irq_stats;
> +	memcpy(stats, &dsi->irq_stats, sizeof(*stats));
>  	memset(&dsi->irq_stats, 0, sizeof(dsi->irq_stats));
>  	dsi->irq_stats.last_reset = jiffies;
>  
>  	spin_unlock_irqrestore(&dsi->irq_stats_lock, flags);
>  
>  	seq_printf(s, "period %u ms\n",
> -			jiffies_to_msecs(jiffies - stats.last_reset));
> +			jiffies_to_msecs(jiffies - stats->last_reset));
>  
> -	seq_printf(s, "irqs %d\n", stats.irq_count);
> +	seq_printf(s, "irqs %d\n", stats->irq_count);
>  #define PIS(x) \
> -	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
> +	seq_printf(s, "%-20s %10d\n", #x, stats->dsi_irqs[ffs(DSI_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
>  	PIS(VC0);
> @@ -1575,10 +1578,10 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  
>  #define PIS(x) \
>  	seq_printf(s, "%-20s %10d %10d %10d %10d\n", #x, \
> -			stats.vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> -			stats.vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
> +			stats->vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
> +			stats->vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- VC interrupts --\n");
>  	PIS(CS);
> @@ -1594,7 +1597,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  
>  #define PIS(x) \
>  	seq_printf(s, "%-20s %10d\n", #x, \
> -			stats.cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
> +			stats->cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
>  
>  	seq_printf(s, "-- CIO interrupts --\n");
>  	PIS(ERRSYNCESC1);
> @@ -1618,6 +1621,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
>  	PIS(ULPSACTIVENOT_ALL0);
>  	PIS(ULPSACTIVENOT_ALL1);
>  #undef PIS
> +	kfree(stats);
>  }
>  
>  static void dsi1_dump_irqs(struct seq_file *s)
> -- 
> 2.11.0
