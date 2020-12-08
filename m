Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1953E2D2E1C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 16:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgLHPXO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 10:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgLHPXO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 10:23:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD68C061749
        for <linux-omap@vger.kernel.org>; Tue,  8 Dec 2020 07:22:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30E50DD;
        Tue,  8 Dec 2020 16:22:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607440951;
        bh=nbT5qf2ivJOHKtVANm3p4WJZonV9cfft6sSbZqq3iYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZ0+4Lo+kYNJqezgGZ2vTHfeb5Ih572FDf3FfGew5F8HWby92chgTPJxUNdnRzvR/
         DLISxMxkfqj7KaodmYK5reCBRN2QS7vR7NnRfc3S2JwISxhfGFiawJh0CRSzyY/6Ua
         rYPXr/m2VHkWS3k2hXiIfZKiEbRnT3ZJz8LRS/Fc=
Date:   Tue, 8 Dec 2020 17:22:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 10/29] drm/omap: dsi: rename 'channel' to 'vc'
Message-ID: <X8+aNAK75xuBVRO4@pendragon.ideasonboard.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-11-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208122855.254819-11-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Dec 08, 2020 at 02:28:36PM +0200, Tomi Valkeinen wrote:
> The "channel" usage in omap dsi driver is confusing. We have three
> different "channels":
> 
> 1) DSI virtual channel ID. This is a number from 0 to 3, included in the
> packet payload.
> 
> 2) VC. This is a register block in the DSI IP. There are four of those
> blocks. A VC is a DSI "pipeline", with defined fifo settings, data
> source (cpu or dispc), and some other settings. It has no relation to
> the 1).
> 
> 3) dispc channel. It's the "pipeline" number dispc uses to send pixel
> data.
> 
> The previous patch handled the third case.
> 
>  To start fixing 1) and 2), we first rename all uses of 'channel' to
> 'vc', as in most of the cases that is the correct thing to use.
> 
> However, in some places 1) and 2) have gotten mixed up (i.e. the code
> uses msg->channel when it should use vc), which will be fixed in the
> following patch.
> 
> Note that mixing 1) and 2) currently is "fine", as at the moment we only
> support DSI peripherals with DSI virtual channel 0, and we always use
> VC0 to send data. So both 1) and 2) are always 0.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 220 +++++++++++++++---------------
>  1 file changed, 110 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index cf0dc4872d14..273159e8f992 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,7 +214,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
>  static int dsi_display_init_dispc(struct dsi_data *dsi);
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi);
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc);
>  
>  static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>  				       const struct mipi_dsi_msg *msg);
> @@ -376,7 +376,7 @@ struct dsi_data {
>  	/* space for a copy used by the interrupt handler */
>  	struct dsi_isr_tables isr_tables_copy;
>  
> -	int update_channel;
> +	int update_vc;
>  #ifdef DSI_PERF_MEASURE
>  	unsigned int update_bytes;
>  #endif
> @@ -639,7 +639,7 @@ static void print_irq_status(u32 status)
>  #undef PIS
>  }
>  
> -static void print_irq_status_vc(int channel, u32 status)
> +static void print_irq_status_vc(int vc, u32 status)
>  {
>  	if (status == 0)
>  		return;
> @@ -650,7 +650,7 @@ static void print_irq_status_vc(int channel, u32 status)
>  #define PIS(x) (status & DSI_VC_IRQ_##x) ? (#x " ") : ""
>  
>  	pr_debug("DSI VC(%d) IRQ 0x%x: %s%s%s%s%s%s%s%s%s\n",
> -		channel,
> +		vc,
>  		status,
>  		PIS(CS),
>  		PIS(ECC_CORR),
> @@ -1031,7 +1031,7 @@ static int dsi_unregister_isr(struct dsi_data *dsi, omap_dsi_isr_t isr,
>  	return r;
>  }
>  
> -static int dsi_register_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_register_isr_vc(struct dsi_data *dsi, int vc,
>  			       omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1040,18 +1040,18 @@ static int dsi_register_isr_vc(struct dsi_data *dsi, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
>  
>  	r = _dsi_register_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
>  
>  	if (r == 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
>  
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
>  
>  	return r;
>  }
>  
> -static int dsi_unregister_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_unregister_isr_vc(struct dsi_data *dsi, int vc,
>  				 omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1060,11 +1060,11 @@ static int dsi_unregister_isr_vc(struct dsi_data *dsi, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
>  
>  	r = _dsi_unregister_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
>  
>  	if (r == 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
>  
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
>  
> @@ -2232,9 +2232,9 @@ static int dsi_force_tx_stop_mode_io(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static bool dsi_vc_is_enabled(struct dsi_data *dsi, int channel)
> +static bool dsi_vc_is_enabled(struct dsi_data *dsi, int vc)
>  {
> -	return REG_GET(dsi, DSI_VC_CTRL(channel), 0, 0);
> +	return REG_GET(dsi, DSI_VC_CTRL(vc), 0, 0);
>  }
>  
>  static void dsi_packet_sent_handler_vp(void *data, u32 mask)
> @@ -2242,14 +2242,14 @@ static void dsi_packet_sent_handler_vp(void *data, u32 mask)
>  	struct dsi_packet_sent_handler_data *vp_data =
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi = vp_data->dsi;
> -	const int channel = dsi->update_channel;
> +	const int vc = dsi->update_vc;
>  	u8 bit = dsi->te_enabled ? 30 : 31;
>  
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit) == 0)
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit) == 0)
>  		complete(vp_data->completion);
>  }
>  
> -static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_vp(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data vp_data = {
> @@ -2261,13 +2261,13 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
>  
>  	bit = dsi->te_enabled ? 30 : 31;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
>  
>  	/* Wait for completion only if TE_EN/TE_START is still set */
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit)) {
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) == 0) {
>  			DSSERR("Failed to complete previous frame transfer\n");
> @@ -2276,12 +2276,12 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
>  		}
>  	}
>  
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
> @@ -2292,13 +2292,13 @@ static void dsi_packet_sent_handler_l4(void *data, u32 mask)
>  	struct dsi_packet_sent_handler_data *l4_data =
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi = l4_data->dsi;
> -	const int channel = dsi->update_channel;
> +	const int vc = dsi->update_vc;
>  
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5) == 0)
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5) == 0)
>  		complete(l4_data->completion);
>  }
>  
> -static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_l4(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data l4_data = {
> @@ -2307,13 +2307,13 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
>  	};
>  	int r = 0;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
>  
>  	/* Wait for completion only if TX_FIFO_NOT_EMPTY is still set */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) == 0) {
>  			DSSERR("Failed to complete previous l4 transfer\n");
> @@ -2322,47 +2322,47 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
>  		}
>  	}
>  
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
>  }
>  
> -static int dsi_sync_vc(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc(struct dsi_data *dsi, int vc)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	WARN_ON(in_interrupt());
>  
> -	if (!dsi_vc_is_enabled(dsi, channel))
> +	if (!dsi_vc_is_enabled(dsi, vc))
>  		return 0;
>  
> -	switch (dsi->vc[channel].source) {
> +	switch (dsi->vc[vc].source) {
>  	case DSI_VC_SOURCE_VP:
> -		return dsi_sync_vc_vp(dsi, channel);
> +		return dsi_sync_vc_vp(dsi, vc);
>  	case DSI_VC_SOURCE_L4:
> -		return dsi_sync_vc_l4(dsi, channel);
> +		return dsi_sync_vc_l4(dsi, vc);
>  	default:
>  		BUG();
>  		return -EINVAL;
>  	}
>  }
>  
> -static int dsi_vc_enable(struct dsi_data *dsi, int channel, bool enable)
> +static int dsi_vc_enable(struct dsi_data *dsi, int vc, bool enable)
>  {
> -	DSSDBG("dsi_vc_enable channel %d, enable %d\n",
> -			channel, enable);
> +	DSSDBG("dsi_vc_enable vc %d, enable %d\n",
> +			vc, enable);
>  
>  	enable = enable ? 1 : 0;
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 0, 0);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 0, 0);
>  
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 0, enable)) {
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 0, enable)) {
>  		DSSERR("Failed to set dsi_vc_enable to %d\n", enable);
>  		return -EIO;
>  	}
> @@ -2370,17 +2370,17 @@ static int dsi_vc_enable(struct dsi_data *dsi, int channel, bool enable)
>  	return 0;
>  }
>  
> -static void dsi_vc_initial_config(struct dsi_data *dsi, int channel)
> +static void dsi_vc_initial_config(struct dsi_data *dsi, int vc)
>  {
>  	u32 r;
>  
> -	DSSDBG("Initial config of virtual channel %d", channel);
> +	DSSDBG("Initial config of VC %d", vc);
>  
> -	r = dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	r = dsi_read_reg(dsi, DSI_VC_CTRL(vc));
>  
>  	if (FLD_GET(r, 15, 15)) /* VC_BUSY */
>  		DSSERR("VC(%d) busy when trying to configure it!\n",
> -				channel);
> +				vc);
>  
>  	r = FLD_MOD(r, 0, 1, 1); /* SOURCE, 0 = L4 */
>  	r = FLD_MOD(r, 0, 2, 2); /* BTA_SHORT_EN  */
> @@ -2395,76 +2395,76 @@ static void dsi_vc_initial_config(struct dsi_data *dsi, int channel)
>  	r = FLD_MOD(r, 4, 29, 27); /* DMA_RX_REQ_NB = no dma */
>  	r = FLD_MOD(r, 4, 23, 21); /* DMA_TX_REQ_NB = no dma */
>  
> -	dsi_write_reg(dsi, DSI_VC_CTRL(channel), r);
> +	dsi_write_reg(dsi, DSI_VC_CTRL(vc), r);
>  
> -	dsi->vc[channel].source = DSI_VC_SOURCE_L4;
> +	dsi->vc[vc].source = DSI_VC_SOURCE_L4;
>  }
>  
> -static int dsi_vc_config_source(struct dsi_data *dsi, int channel,
> +static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
>  				enum dsi_vc_source source)
>  {
> -	if (dsi->vc[channel].source == source)
> +	if (dsi->vc[vc].source == source)
>  		return 0;
>  
> -	DSSDBG("Source config of virtual channel %d", channel);
> +	DSSDBG("Source config of VC %d", vc);
>  
> -	dsi_sync_vc(dsi, channel);
> +	dsi_sync_vc(dsi, vc);
>  
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
>  
>  	/* VC_BUSY */
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 15, 0)) {
> -		DSSERR("vc(%d) busy when trying to config for VP\n", channel);
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
> +		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
>  		return -EIO;
>  	}
>  
>  	/* SOURCE, 0 = L4, 1 = video port */
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), source, 1, 1);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
>  
>  	/* DCS_CMD_ENABLE */
>  	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
>  		bool enable = source == DSI_VC_SOURCE_VP;
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 30, 30);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
>  	}
>  
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
>  
> -	dsi->vc[channel].source = source;
> +	dsi->vc[vc].source = source;
>  
>  	return 0;
>  }
>  
> -static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int channel,
> +static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  		bool enable)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> -	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", channel, enable);
> +	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
>  	dsi_if_enable(dsi, 0);
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 9, 9);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 9, 9);
>  
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
>  	dsi_if_enable(dsi, 1);
>  
>  	dsi_force_tx_stop_mode_io(dsi);
>  
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, channel);
> +		dsi_vc_send_null(dsi, vc);
>  
>  	dsi->in_lp_mode = !enable;
>  }
>  
> -static void dsi_vc_flush_long_data(struct dsi_data *dsi, int channel)
> +static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
>  {
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
> -		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSDBG("\t\tb1 %#02x b2 %#02x b3 %#02x b4 %#02x\n",
>  				(val >> 0) & 0xff,
>  				(val >> 8) & 0xff,
> @@ -2510,13 +2510,13 @@ static void dsi_show_rx_ack_with_err(u16 err)
>  		DSSERR("\t\tDSI Protocol Violation\n");
>  }
>  
> -static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
> +static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int vc)
>  {
>  	/* RX_FIFO_NOT_EMPTY */
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
>  		u8 dt;
> -		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSERR("\trawval %#08x\n", val);
>  		dt = FLD_GET(val, 5, 0);
>  		if (dt == MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT) {
> @@ -2531,7 +2531,7 @@ static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
>  		} else if (dt == MIPI_DSI_RX_DCS_LONG_READ_RESPONSE) {
>  			DSSERR("\tDCS long response, len %d\n",
>  					FLD_GET(val, 23, 8));
> -			dsi_vc_flush_long_data(dsi, channel);
> +			dsi_vc_flush_long_data(dsi, vc);
>  		} else {
>  			DSSERR("\tunknown datatype 0x%02x\n", dt);
>  		}
> @@ -2539,35 +2539,35 @@ static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
>  	return 0;
>  }
>  
> -static int dsi_vc_send_bta(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_bta(struct dsi_data *dsi, int vc)
>  {
>  	if (dsi->debug_write || dsi->debug_read)
> -		DSSDBG("dsi_vc_send_bta %d\n", channel);
> +		DSSDBG("dsi_vc_send_bta %d\n", vc);
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		DSSERR("rx fifo not empty when sending BTA, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, channel);
> +		dsi_vc_flush_receive_data(dsi, vc);
>  	}
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 6, 6); /* BTA_EN */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 6, 6); /* BTA_EN */
>  
>  	/* flush posted write */
> -	dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	dsi_read_reg(dsi, DSI_VC_CTRL(vc));
>  
>  	return 0;
>  }
>  
> -static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
> +static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	int r = 0;
>  	u32 err;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_completion_handler,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  	if (r)
>  		goto err0;
> @@ -2577,7 +2577,7 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
>  	if (r)
>  		goto err1;
>  
> -	r = dsi_vc_send_bta(dsi, channel);
> +	r = dsi_vc_send_bta(dsi, vc);
>  	if (r)
>  		goto err2;
>  
> @@ -2598,13 +2598,13 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
>  	dsi_unregister_isr(dsi, dsi_completion_handler, &completion,
>  			DSI_IRQ_ERROR_MASK);
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_completion_handler,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  err0:
>  	return r;
>  }
>  
> -static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
> +static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
>  					    u8 data_type, u16 len, u8 ecc)
>  {
>  	u32 val;
> @@ -2612,15 +2612,15 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	data_id = data_type | channel << 6;
> +	data_id = data_type | vc << 6;
>  
>  	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
>  		FLD_VAL(ecc, 31, 24);
>  
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(vc), val);
>  }
>  
> -static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
> +static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int vc,
>  					     u8 b1, u8 b2, u8 b3, u8 b4)
>  {
>  	u32 val;
> @@ -2630,7 +2630,7 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
>  /*	DSSDBG("\twriting %02x, %02x, %02x, %02x (%#010x)\n",
>  			b1, b2, b3, b4, val); */
>  
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
>  }
>  
>  static int dsi_vc_send_long(struct dsi_data *dsi,
> @@ -2727,10 +2727,10 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  	return 0;
>  }
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc)
>  {
>  	const struct mipi_dsi_msg msg = {
> -		.channel = channel,
> +		.channel = vc,
>  		.type = MIPI_DSI_NULL_PACKET,
>  	};
>  
> @@ -2774,7 +2774,7 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  	return 0;
>  }
>  
> -static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
> +static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int vc, u8 *buf,
>  			       int buflen, enum dss_dsi_content_type type)
>  {
>  	u32 val;
> @@ -2782,13 +2782,13 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	int r;
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20) == 0) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20) == 0) {
>  		DSSERR("RX fifo empty when trying to read.\n");
>  		r = -EIO;
>  		goto err;
>  	}
>  
> -	val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +	val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  	if (dsi->debug_read)
>  		DSSDBG("\theader: %08x\n", val);
>  	dt = FLD_GET(val, 5, 0);
> @@ -2852,7 +2852,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  		for (w = 0; w < len + 2;) {
>  			int b;
>  			val = dsi_read_reg(dsi,
> -				DSI_VC_SHORT_PACKET_HEADER(channel));
> +				DSI_VC_SHORT_PACKET_HEADER(vc));
>  			if (dsi->debug_read)
>  				DSSDBG("\t\t%02x %02x %02x %02x\n",
>  						(val >> 0) & 0xff,
> @@ -2876,7 +2876,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	}
>  
>  err:
> -	DSSERR("dsi_vc_read_rx_fifo(ch %d type %s) failed\n", channel,
> +	DSSERR("dsi_vc_read_rx_fifo(vc %d type %s) failed\n", vc,
>  		type == DSS_DSI_CONTENT_GENERIC ? "GENERIC" : "DCS");
>  
>  	return r;
> @@ -3631,7 +3631,7 @@ static int dsi_configure_pins(struct dsi_data *dsi,
>  	return 0;
>  }
>  
> -static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> @@ -3665,17 +3665,17 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  		}
>  
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  
>  		/* MODE, 1 = video mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
>  
>  		word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
>  
> -		dsi_vc_write_long_header(dsi, channel, data_type,
> +		dsi_vc_write_long_header(dsi, vc, data_type,
>  				word_count, 0);
>  
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
>  
> @@ -3688,7 +3688,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  err_mgr_enable:
>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  	}
>  err_pix_fmt:
>  	dsi_display_uninit_dispc(dsi);
> @@ -3696,18 +3696,18 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  	return;
>  }
>  
> -static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel)
> +static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  
>  		/* MODE, 0 = command mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 0, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
>  
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
>  
> @@ -3740,14 +3740,14 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  	unsigned int packet_len;
>  	u32 l;
>  	int r;
> -	const unsigned channel = dsi->update_channel;
> +	const unsigned vc = dsi->update_vc;
>  	const unsigned int line_buf_size = dsi->line_buffer_size;
>  	u16 w = dsi->vm.hactive;
>  	u16 h = dsi->vm.vactive;
>  
>  	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
>  
> -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_VP);
> +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
>  
>  	bytespp	= mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
>  	bytespl = w * bytespp;
> @@ -3768,16 +3768,16 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  		total_len += (bytespf % packet_payload) + 1;
>  
>  	l = FLD_VAL(total_len, 23, 0); /* TE_SIZE */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
>  
> -	dsi_vc_write_long_header(dsi, channel, MIPI_DSI_DCS_LONG_WRITE,
> +	dsi_vc_write_long_header(dsi, vc, MIPI_DSI_DCS_LONG_WRITE,
>  		packet_len, 0);
>  
>  	if (dsi->te_enabled)
>  		l = FLD_MOD(l, 1, 30, 30); /* TE_EN */
>  	else
>  		l = FLD_MOD(l, 1, 31, 31); /* TE_START */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
>  
>  	/* We put SIDLEMODE to no-idle for the duration of the transfer,
>  	 * because DSS interrupts are not capable of waking up the CPU and the
> @@ -3800,7 +3800,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  		 * for TE is longer than the timer allows */
>  		REG_FLD_MOD(dsi, DSI_TIMING2, 0, 15, 15); /* LP_RX_TO */
>  
> -		dsi_vc_send_bta(dsi, channel);
> +		dsi_vc_send_bta(dsi, vc);
>  
>  #ifdef DSI_CATCH_MISSING_TE
>  		mod_timer(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
> @@ -3897,7 +3897,7 @@ static int _dsi_send_nop(struct dsi_data *dsi, int channel)
>  	return _omap_dsi_host_transfer(dsi, &msg);
>  }
>  
> -static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
> +static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
> @@ -3914,7 +3914,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  		goto err;
>  	}
>  
> -	DSSDBG("dsi_update_channel: %d", channel);
> +	DSSDBG("dsi_update_channel: %d", vc);
>  
>  	dsi_set_ulps_auto(dsi, false);
>  
> @@ -3923,13 +3923,13 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  	 * updates stop working. This is probably related to DSI spec stating
>  	 * that the DSI host should transition to LP at least once per frame.
>  	 */
> -	r = _dsi_send_nop(dsi, channel);
> +	r = _dsi_send_nop(dsi, vc);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
>  	}
>  
> -	dsi->update_channel = channel;
> +	dsi->update_vc = vc;
>  
>  	if (dsi->te_enabled && dsi->te_gpio) {
>  		schedule_delayed_work(&dsi->te_timeout_work,

-- 
Regards,

Laurent Pinchart
