Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5BEF113F17
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2019 11:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbfLEKMj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Dec 2019 05:12:39 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:52734 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbfLEKMj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Dec 2019 05:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oUeG7N4oJopLP7m1GryeaTh9X+CXOGZaiqQ4gNe4Dhc=; b=x9UpGHDK2CnAdNiphpty0fSIF
        CoJgfHxvf9JffGfTdTPzT3h04gfCdO0ucqp/fphOllYNWsWTeLknM6R6jTSeBoofImWFAh6/b1Ccu
        wuLDdDIMbN2AEBsCarZhXuKAyDDyECdh64u6VuzL46fX+bgcjW2NztyCD/bMvLlFm9AsEHbRFcTAS
        nEMrBu9GaE0G6/qqqPKmDdZjyefd7dQwJTZl4F9zBtJtCmQf/uo5I9kAq2ex6JvjOnBeIoJ2h6gzQ
        lrs+JRbtvJl7/Yr8UR00CPq04rCtaaxtKlRgH8iGTmdd870R57mU1ENtU862samVMi04zU/88zEze
        bKbjXQI2g==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:37162)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ico7R-0002Go-8y; Thu, 05 Dec 2019 10:12:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ico7M-0007zL-Fz; Thu, 05 Dec 2019 10:12:16 +0000
Date:   Thu, 5 Dec 2019 10:12:16 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Macpaul Lin <macpaul.lin@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org,
        Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: musb: replace all unsigned data type to unsigned int
Message-ID: <20191205101216.GC1337@shell.armlinux.org.uk>
References: <1575525677-20760-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575525677-20760-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Dec 05, 2019 at 02:01:17PM +0800, Macpaul Lin wrote:
> Simply replace all 'unsigned' data type in musb driver to
> 'unsigned int' because it has been complained by gerrit
> checkpatch service.

"unsigned" is perfectly legal standard C.  The policy for net related
code is to abhor it, but there is nothing in the kernel style
guidelines that prevents its use in the rest of the kernel.

AFAICS there is no need for this churn.

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/musb/cppi_dma.c        | 24 ++++++++--------
>  drivers/usb/musb/musb_core.c       | 24 ++++++++--------
>  drivers/usb/musb/musb_core.h       | 44 +++++++++++++++---------------
>  drivers/usb/musb/musb_cppi41.c     | 16 +++++------
>  drivers/usb/musb/musb_debugfs.c    |  8 +++---
>  drivers/usb/musb/musb_dsps.c       | 18 ++++++------
>  drivers/usb/musb/musb_gadget.c     | 16 +++++------
>  drivers/usb/musb/musb_gadget_ep0.c |  4 +--
>  drivers/usb/musb/musb_host.c       |  6 ++--
>  drivers/usb/musb/musb_host.h       |  6 ++--
>  drivers/usb/musb/musb_io.h         | 12 ++++----
>  drivers/usb/musb/sunxi.c           |  8 +++---
>  drivers/usb/musb/tusb6010.c        |  8 +++---
>  drivers/usb/musb/tusb6010_omap.c   |  2 +-
>  14 files changed, 99 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/usb/musb/cppi_dma.c b/drivers/usb/musb/cppi_dma.c
> index b4d6d9bb3239..3231b616bef4 100644
> --- a/drivers/usb/musb/cppi_dma.c
> +++ b/drivers/usb/musb/cppi_dma.c
> @@ -260,12 +260,12 @@ static void cppi_controller_stop(struct cppi *controller)
>   *
>   * REVISIT same issue applies to pure PIO usage too, and non-cppi dma...
>   */
> -static inline void core_rxirq_disable(void __iomem *tibase, unsigned epnum)
> +static inline void core_rxirq_disable(void __iomem *tibase, unsigned int epnum)
>  {
>  	musb_writel(tibase, DAVINCI_USB_INT_MASK_CLR_REG, 1 << (epnum + 8));
>  }
>  
> -static inline void core_rxirq_enable(void __iomem *tibase, unsigned epnum)
> +static inline void core_rxirq_enable(void __iomem *tibase, unsigned int epnum)
>  {
>  	musb_writel(tibase, DAVINCI_USB_INT_MASK_SET_REG, 1 << (epnum + 8));
>  }
> @@ -451,7 +451,7 @@ static void cppi_dump_rxq(int level, const char *tag, struct cppi_channel *rx)
>   * so we won't ever use it (see "CPPI RX Woes" below).
>   */
>  static inline int cppi_autoreq_update(struct cppi_channel *rx,
> -		void __iomem *tibase, int onepacket, unsigned n_bds)
> +		void __iomem *tibase, int onepacket, unsigned int n_bds)
>  {
>  	u32	val;
>  
> @@ -560,12 +560,12 @@ static inline int cppi_autoreq_update(struct cppi_channel *rx,
>  static void
>  cppi_next_tx_segment(struct musb *musb, struct cppi_channel *tx)
>  {
> -	unsigned		maxpacket = tx->maxpacket;
> +	unsigned int		maxpacket = tx->maxpacket;
>  	dma_addr_t		addr = tx->buf_dma + tx->offset;
>  	size_t			length = tx->buf_len - tx->offset;
>  	struct cppi_descriptor	*bd;
> -	unsigned		n_bds;
> -	unsigned		i;
> +	unsigned int		n_bds;
> +	unsigned int		i;
>  	struct cppi_tx_stateram	__iomem *tx_ram = tx->state_ram;
>  	int			rndis;
>  
> @@ -587,7 +587,7 @@ cppi_next_tx_segment(struct musb *musb, struct cppi_channel *tx)
>  			n_bds = DIV_ROUND_UP(length, maxpacket);
>  		else
>  			n_bds = 1;
> -		n_bds = min(n_bds, (unsigned) NUM_TXCHAN_BD);
> +		n_bds = min(n_bds, (unsigned int) NUM_TXCHAN_BD);
>  		length = min(n_bds * maxpacket, length);
>  	}
>  
> @@ -761,12 +761,12 @@ MODULE_PARM_DESC(cppi_rx_rndis, "enable/disable RX RNDIS heuristic");
>  static void
>  cppi_next_rx_segment(struct musb *musb, struct cppi_channel *rx, int onepacket)
>  {
> -	unsigned		maxpacket = rx->maxpacket;
> +	unsigned int		maxpacket = rx->maxpacket;
>  	dma_addr_t		addr = rx->buf_dma + rx->offset;
>  	size_t			length = rx->buf_len - rx->offset;
>  	struct cppi_descriptor	*bd, *tail;
> -	unsigned		n_bds;
> -	unsigned		i;
> +	unsigned int		n_bds;
> +	unsigned int		i;
>  	void __iomem		*tibase = musb->ctrl_base;
>  	int			is_rndis = 0;
>  	struct cppi_rx_stateram	__iomem *rx_ram = rx->state_ram;
> @@ -797,7 +797,7 @@ cppi_next_rx_segment(struct musb *musb, struct cppi_channel *rx, int onepacket)
>  		if (n_bds == 1)
>  			onepacket = 1;
>  		else
> -			n_bds = min(n_bds, (unsigned) NUM_RXCHAN_BD);
> +			n_bds = min(n_bds, (unsigned int) NUM_RXCHAN_BD);
>  	}
>  
>  	/* In host mode, autorequest logic can generate some IN tokens; it's
> @@ -998,7 +998,7 @@ static int cppi_channel_program(struct dma_channel *ch,
>  	return true;
>  }
>  
> -static bool cppi_rx_scan(struct cppi *cppi, unsigned ch)
> +static bool cppi_rx_scan(struct cppi *cppi, unsigned int ch)
>  {
>  	struct cppi_channel		*rx = &cppi->rx[ch];
>  	struct cppi_rx_stateram __iomem	*state = rx->state_ram;
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index bd63450af76a..735d7a7d504b 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -246,7 +246,7 @@ static u32 musb_default_busctl_offset(u8 epnum, u16 offset)
>  	return 0x80 + (0x08 * epnum) + offset;
>  }
>  
> -static u8 musb_default_readb(const void __iomem *addr, unsigned offset)
> +static u8 musb_default_readb(const void __iomem *addr, unsigned int offset)
>  {
>  	u8 data =  __raw_readb(addr + offset);
>  
> @@ -254,13 +254,14 @@ static u8 musb_default_readb(const void __iomem *addr, unsigned offset)
>  	return data;
>  }
>  
> -static void musb_default_writeb(void __iomem *addr, unsigned offset, u8 data)
> +static void musb_default_writeb(void __iomem *addr, unsigned int offset,
> +				u8 data)
>  {
>  	trace_musb_writeb(__builtin_return_address(0), addr, offset, data);
>  	__raw_writeb(data, addr + offset);
>  }
>  
> -static u16 musb_default_readw(const void __iomem *addr, unsigned offset)
> +static u16 musb_default_readw(const void __iomem *addr, unsigned int offset)
>  {
>  	u16 data = __raw_readw(addr + offset);
>  
> @@ -268,7 +269,8 @@ static u16 musb_default_readw(const void __iomem *addr, unsigned offset)
>  	return data;
>  }
>  
> -static void musb_default_writew(void __iomem *addr, unsigned offset, u16 data)
> +static void musb_default_writew(void __iomem *addr, unsigned int offset,
> +				u16 data)
>  {
>  	trace_musb_writew(__builtin_return_address(0), addr, offset, data);
>  	__raw_writew(data, addr + offset);
> @@ -364,19 +366,19 @@ static void musb_default_read_fifo(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
>  /*
>   * Old style IO functions
>   */
> -u8 (*musb_readb)(const void __iomem *addr, unsigned offset);
> +u8 (*musb_readb)(const void __iomem *addr, unsigned int offset);
>  EXPORT_SYMBOL_GPL(musb_readb);
>  
> -void (*musb_writeb)(void __iomem *addr, unsigned offset, u8 data);
> +void (*musb_writeb)(void __iomem *addr, unsigned int offset, u8 data);
>  EXPORT_SYMBOL_GPL(musb_writeb);
>  
> -u16 (*musb_readw)(const void __iomem *addr, unsigned offset);
> +u16 (*musb_readw)(const void __iomem *addr, unsigned int offset);
>  EXPORT_SYMBOL_GPL(musb_readw);
>  
> -void (*musb_writew)(void __iomem *addr, unsigned offset, u16 data);
> +void (*musb_writew)(void __iomem *addr, unsigned int offset, u16 data);
>  EXPORT_SYMBOL_GPL(musb_writew);
>  
> -u32 musb_readl(const void __iomem *addr, unsigned offset)
> +u32 musb_readl(const void __iomem *addr, unsigned int offset)
>  {
>  	u32 data = __raw_readl(addr + offset);
>  
> @@ -385,7 +387,7 @@ u32 musb_readl(const void __iomem *addr, unsigned offset)
>  }
>  EXPORT_SYMBOL_GPL(musb_readl);
>  
> -void musb_writel(void __iomem *addr, unsigned offset, u32 data)
> +void musb_writel(void __iomem *addr, unsigned int offset, u32 data)
>  {
>  	trace_musb_writel(__builtin_return_address(0), addr, offset, data);
>  	__raw_writel(data, addr + offset);
> @@ -1319,7 +1321,7 @@ static struct musb_fifo_cfg ep0_cfg = {
>  static int ep_config_from_table(struct musb *musb)
>  {
>  	const struct musb_fifo_cfg	*cfg;
> -	unsigned		i, n;
> +	unsigned int		i, n;
>  	int			offset;
>  	struct musb_hw_ep	*hw_ep = musb->endpoints;
>  
> diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
> index 04203b7126d5..7c7b78eb0f31 100644
> --- a/drivers/usb/musb/musb_core.h
> +++ b/drivers/usb/musb/musb_core.h
> @@ -161,10 +161,10 @@ struct musb_platform_ops {
>  	u16	fifo_mode;
>  	u32	(*fifo_offset)(u8 epnum);
>  	u32	(*busctl_offset)(u8 epnum, u16 offset);
> -	u8	(*readb)(const void __iomem *addr, unsigned offset);
> -	void	(*writeb)(void __iomem *addr, unsigned offset, u8 data);
> -	u16	(*readw)(const void __iomem *addr, unsigned offset);
> -	void	(*writew)(void __iomem *addr, unsigned offset, u16 data);
> +	u8	(*readb)(const void __iomem *addr, unsigned int offset);
> +	void	(*writeb)(void __iomem *addr, unsigned int offset, u8 data);
> +	u16	(*readw)(const void __iomem *addr, unsigned int offset);
> +	void	(*writew)(void __iomem *addr, unsigned int offset, u16 data);
>  	void	(*read_fifo)(struct musb_hw_ep *hw_ep, u16 len, u8 *buf);
>  	void	(*write_fifo)(struct musb_hw_ep *hw_ep, u16 len, const u8 *buf);
>  	struct dma_controller *
> @@ -331,7 +331,7 @@ struct musb {
>  	struct phy		*phy;
>  
>  	int nIrq;
> -	unsigned		irq_wake:1;
> +	unsigned int		irq_wake:1;
>  
>  	struct musb_hw_ep	 endpoints[MUSB_C_NUM_EPS];
>  #define control_ep		endpoints
> @@ -353,44 +353,44 @@ struct musb {
>  	int			a_wait_bcon;	/* VBUS timeout in msecs */
>  	unsigned long		idle_timeout;	/* Next timeout in jiffies */
>  
> -	unsigned		is_initialized:1;
> -	unsigned		is_runtime_suspended:1;
> +	unsigned int		is_initialized:1;
> +	unsigned int		is_runtime_suspended:1;
>  
>  	/* active means connected and not suspended */
> -	unsigned		is_active:1;
> +	unsigned int		is_active:1;
>  
> -	unsigned is_multipoint:1;
> +	unsigned int is_multipoint:1;
>  
> -	unsigned		hb_iso_rx:1;	/* high bandwidth iso rx? */
> -	unsigned		hb_iso_tx:1;	/* high bandwidth iso tx? */
> -	unsigned		dyn_fifo:1;	/* dynamic FIFO supported? */
> +	unsigned int		hb_iso_rx:1;	/* high bandwidth iso rx? */
> +	unsigned int		hb_iso_tx:1;	/* high bandwidth iso tx? */
> +	unsigned int		dyn_fifo:1;	/* dynamic FIFO supported? */
>  
> -	unsigned		bulk_split:1;
> +	unsigned int		bulk_split:1;
>  #define	can_bulk_split(musb,type) \
>  	(((type) == USB_ENDPOINT_XFER_BULK) && (musb)->bulk_split)
>  
> -	unsigned		bulk_combine:1;
> +	unsigned int		bulk_combine:1;
>  #define	can_bulk_combine(musb,type) \
>  	(((type) == USB_ENDPOINT_XFER_BULK) && (musb)->bulk_combine)
>  
>  	/* is_suspended means USB B_PERIPHERAL suspend */
> -	unsigned		is_suspended:1;
> +	unsigned int		is_suspended:1;
>  
>  	/* may_wakeup means remote wakeup is enabled */
> -	unsigned		may_wakeup:1;
> +	unsigned int		may_wakeup:1;
>  
>  	/* is_self_powered is reported in device status and the
>  	 * config descriptor.  is_bus_powered means B_PERIPHERAL
>  	 * draws some VBUS current; both can be true.
>  	 */
> -	unsigned		is_self_powered:1;
> -	unsigned		is_bus_powered:1;
> +	unsigned int		is_self_powered:1;
> +	unsigned int		is_bus_powered:1;
>  
> -	unsigned		set_address:1;
> -	unsigned		test_mode:1;
> -	unsigned		softconnect:1;
> +	unsigned int		set_address:1;
> +	unsigned int		test_mode:1;
> +	unsigned int		softconnect:1;
>  
> -	unsigned		flush_irq_work:1;
> +	unsigned int		flush_irq_work:1;
>  
>  	u8			address;
>  	u8			test_mode_nr;
> diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
> index 7fbb8a307145..54328371afee 100644
> --- a/drivers/usb/musb/musb_cppi41.c
> +++ b/drivers/usb/musb/musb_cppi41.c
> @@ -297,7 +297,7 @@ static void cppi41_dma_callback(void *private_data,
>  			is_hs = 1;
>  	}
>  	if (is_hs) {
> -		unsigned wait = 25;
> +		unsigned int wait = 25;
>  
>  		do {
>  			empty = musb_is_tx_fifo_empty(hw_ep);
> @@ -326,9 +326,9 @@ static void cppi41_dma_callback(void *private_data,
>  	spin_unlock_irqrestore(&musb->lock, flags);
>  }
>  
> -static u32 update_ep_mode(unsigned ep, unsigned mode, u32 old)
> +static u32 update_ep_mode(unsigned int ep, unsigned int mode, u32 old)
>  {
> -	unsigned shift;
> +	unsigned int shift;
>  
>  	shift = (ep - 1) * 2;
>  	old &= ~(3 << shift);
> @@ -337,7 +337,7 @@ static u32 update_ep_mode(unsigned ep, unsigned mode, u32 old)
>  }
>  
>  static void cppi41_set_dma_mode(struct cppi41_dma_channel *cppi41_channel,
> -		unsigned mode)
> +		unsigned int mode)
>  {
>  	struct cppi41_dma_controller *controller = cppi41_channel->controller;
>  	struct musb *musb = controller->controller.musb;
> @@ -390,7 +390,7 @@ static void da8xx_set_dma_mode(struct cppi41_dma_channel *cppi41_channel,
>  
>  
>  static void cppi41_set_autoreq_mode(struct cppi41_dma_channel *cppi41_channel,
> -		unsigned mode)
> +		unsigned int mode)
>  {
>  	struct cppi41_dma_controller *controller = cppi41_channel->controller;
>  	u32 port;
> @@ -418,7 +418,7 @@ static bool cppi41_configure_channel(struct dma_channel *channel,
>  	struct dma_async_tx_descriptor *dma_desc;
>  	enum dma_transfer_direction direction;
>  	struct musb *musb = cppi41_channel->controller->controller.musb;
> -	unsigned use_gen_rndis = 0;
> +	unsigned int use_gen_rndis = 0;
>  
>  	cppi41_channel->buf_addr = dma_addr;
>  	cppi41_channel->total_len = len;
> @@ -578,7 +578,7 @@ static int cppi41_dma_channel_abort(struct dma_channel *channel)
>  	void __iomem *epio = cppi41_channel->hw_ep->regs;
>  	int tdbit;
>  	int ret;
> -	unsigned is_tx;
> +	unsigned int is_tx;
>  	u16 csr;
>  
>  	is_tx = cppi41_channel->is_tx;
> @@ -680,7 +680,7 @@ static int cppi41_dma_controller_start(struct cppi41_dma_controller *controller)
>  		struct dma_chan *dc;
>  		struct dma_channel *musb_dma;
>  		const char *str;
> -		unsigned is_tx;
> +		unsigned int is_tx;
>  		unsigned int port;
>  
>  		ret = of_property_read_string_index(np, "dma-names", i, &str);
> diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
> index f42858e2b54c..b9763d94456d 100644
> --- a/drivers/usb/musb/musb_debugfs.c
> +++ b/drivers/usb/musb/musb_debugfs.c
> @@ -19,8 +19,8 @@
>  
>  struct musb_register_map {
>  	char			*name;
> -	unsigned		offset;
> -	unsigned		size;
> +	unsigned int		offset;
> +	unsigned int		size;
>  };
>  
>  static const struct musb_register_map musb_regmap[] = {
> @@ -84,7 +84,7 @@ static const struct musb_register_map musb_regmap[] = {
>  static int musb_regdump_show(struct seq_file *s, void *unused)
>  {
>  	struct musb		*musb = s->private;
> -	unsigned		i;
> +	unsigned int		i;
>  
>  	seq_printf(s, "MUSB (M)HDRC Register Dump\n");
>  	pm_runtime_get_sync(musb->controller);
> @@ -115,7 +115,7 @@ DEFINE_SHOW_ATTRIBUTE(musb_regdump);
>  static int musb_test_mode_show(struct seq_file *s, void *unused)
>  {
>  	struct musb		*musb = s->private;
> -	unsigned		test;
> +	unsigned int		test;
>  
>  	pm_runtime_get_sync(musb->controller);
>  	test = musb_readb(musb->mregs, MUSB_TESTMODE);
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index 327d4f7baaf7..e5d58cc90311 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -57,30 +57,30 @@ struct dsps_musb_wrapper {
>  	u16	rx_mode;
>  
>  	/* bit positions for control */
> -	unsigned	reset:5;
> +	unsigned int	reset:5;
>  
>  	/* bit positions for interrupt */
> -	unsigned	usb_shift:5;
> +	unsigned int	usb_shift:5;
>  	u32		usb_mask;
>  	u32		usb_bitmap;
> -	unsigned	drvvbus:5;
> +	unsigned int	drvvbus:5;
>  
> -	unsigned	txep_shift:5;
> +	unsigned int	txep_shift:5;
>  	u32		txep_mask;
>  	u32		txep_bitmap;
>  
> -	unsigned	rxep_shift:5;
> +	unsigned int	rxep_shift:5;
>  	u32		rxep_mask;
>  	u32		rxep_bitmap;
>  
>  	/* bit positions for phy_utmi */
> -	unsigned	otg_disable:5;
> +	unsigned int	otg_disable:5;
>  
>  	/* bit positions for mode */
> -	unsigned	iddig:5;
> -	unsigned	iddig_mux:5;
> +	unsigned int	iddig:5;
> +	unsigned int	iddig_mux:5;
>  	/* miscellaneous stuff */
> -	unsigned	poll_timeout;
> +	unsigned int	poll_timeout;
>  };
>  
>  /*
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
> index ffe462a657b1..5a025de84073 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -521,7 +521,7 @@ static void rxstate(struct musb *musb, struct musb_request *req)
>  	struct usb_request	*request = &req->request;
>  	struct musb_ep		*musb_ep;
>  	void __iomem		*epio = musb->endpoints[epnum].regs;
> -	unsigned		len = 0;
> +	unsigned int		len = 0;
>  	u16			fifo_count;
>  	u16			csr = musb_readw(epio, MUSB_RXCSR);
>  	struct musb_hw_ep	*hw_ep = &musb->endpoints[epnum];
> @@ -657,7 +657,7 @@ static void rxstate(struct musb *musb, struct musb_request *req)
>  					musb_writew(epio, MUSB_RXCSR, csr);
>  
>  					transfer_size = min(request->length - request->actual,
> -							(unsigned)fifo_count);
> +							(unsigned int)fifo_count);
>  					musb_ep->dma->desired_mode = 0;
>  				}
>  
> @@ -695,7 +695,7 @@ static void rxstate(struct musb *musb, struct musb_request *req)
>  					transfer_size = min_t(unsigned int,
>  							request->length -
>  							request->actual,
> -							(unsigned)fifo_count);
> +							(unsigned int)fifo_count);
>  
>  				csr &= ~MUSB_RXCSR_DMAMODE;
>  				csr |= (MUSB_RXCSR_DMAENAB |
> @@ -728,7 +728,7 @@ static void rxstate(struct musb *musb, struct musb_request *req)
>  					fifo_count, len,
>  					musb_ep->packet_sz);
>  
> -			fifo_count = min_t(unsigned, len, fifo_count);
> +			fifo_count = min_t(unsigned int, len, fifo_count);
>  
>  			if (tusb_dma_omap(musb)) {
>  				struct dma_controller *c = musb->dma_controller;
> @@ -913,7 +913,7 @@ static int musb_gadget_enable(struct usb_ep *ep,
>  	void __iomem	*mbase;
>  	u8		epnum;
>  	u16		csr;
> -	unsigned	tmp;
> +	unsigned int	tmp;
>  	int		status = -EINVAL;
>  
>  	if (!ep || !desc)
> @@ -1159,7 +1159,7 @@ static LIST_HEAD(buffers);
>  struct free_record {
>  	struct list_head	list;
>  	struct device		*dev;
> -	unsigned		bytes;
> +	unsigned int		bytes;
>  	dma_addr_t		dma;
>  };
>  
> @@ -1620,7 +1620,7 @@ static int musb_gadget_vbus_session(struct usb_gadget *gadget, int is_active)
>  }
>  #endif
>  
> -static int musb_gadget_vbus_draw(struct usb_gadget *gadget, unsigned mA)
> +static int musb_gadget_vbus_draw(struct usb_gadget *gadget, unsigned int mA)
>  {
>  	struct musb	*musb = gadget_to_musb(gadget);
>  
> @@ -1740,7 +1740,7 @@ static inline void musb_g_init_endpoints(struct musb *musb)
>  {
>  	u8			epnum;
>  	struct musb_hw_ep	*hw_ep;
> -	unsigned		count = 0;
> +	unsigned int		count = 0;
>  
>  	/* initialize endpoint list just once */
>  	INIT_LIST_HEAD(&(musb->g.ep_list));
> diff --git a/drivers/usb/musb/musb_gadget_ep0.c b/drivers/usb/musb/musb_gadget_ep0.c
> index 91a5027b5c1f..ea5ece9761ef 100644
> --- a/drivers/usb/musb/musb_gadget_ep0.c
> +++ b/drivers/usb/musb/musb_gadget_ep0.c
> @@ -476,7 +476,7 @@ static void ep0_rxstate(struct musb *musb)
>  	 */
>  	if (req) {
>  		void		*buf = req->buf + req->actual;
> -		unsigned	len = req->length - req->actual;
> +		unsigned int	len = req->length - req->actual;
>  
>  		/* read the buffer */
>  		count = musb_readb(regs, MUSB_COUNT0);
> @@ -537,7 +537,7 @@ static void ep0_txstate(struct musb *musb)
>  
>  	/* load the data */
>  	fifo_src = (u8 *) request->buf + request->actual;
> -	fifo_count = min((unsigned) MUSB_EP0_FIFOSIZE,
> +	fifo_count = min((unsigned int) MUSB_EP0_FIFOSIZE,
>  		request->length - request->actual);
>  	musb_write_fifo(&musb->endpoints[0], fifo_count, fifo_src);
>  	request->actual += fifo_count;
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 5a44b70372d9..508f1801e52b 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -2148,8 +2148,8 @@ static int musb_urb_enqueue(
>  	struct musb_qh			*qh;
>  	struct usb_endpoint_descriptor	*epd = &hep->desc;
>  	int				ret;
> -	unsigned			type_reg;
> -	unsigned			interval;
> +	unsigned int			type_reg;
> +	unsigned int			interval;
>  
>  	/* host role must be active */
>  	if (!is_host_active(musb) || !musb->is_active)
> @@ -2337,7 +2337,7 @@ static int musb_cleanup_urb(struct urb *urb, struct musb_qh *qh)
>  	struct musb_hw_ep	*ep = qh->hw_ep;
>  	struct musb		*musb = ep->musb;
>  	void __iomem		*epio = ep->regs;
> -	unsigned		hw_end = ep->epnum;
> +	unsigned int		hw_end = ep->epnum;
>  	void __iomem		*regs = ep->musb->mregs;
>  	int			is_in = usb_pipein(urb->pipe);
>  	int			status = 0;
> diff --git a/drivers/usb/musb/musb_host.h b/drivers/usb/musb/musb_host.h
> index 2999845632ce..47e2177b871d 100644
> --- a/drivers/usb/musb/musb_host.h
> +++ b/drivers/usb/musb/musb_host.h
> @@ -22,8 +22,8 @@ struct musb_qh {
>  	/* struct musb_qh		*next; */	/* for periodic tree */
>  	u8			mux;		/* qh multiplexed to hw_ep */
>  
> -	unsigned		offset;		/* in urb->transfer_buffer */
> -	unsigned		segsize;	/* current xfer fragment */
> +	unsigned int		offset;		/* in urb->transfer_buffer */
> +	unsigned int		segsize;	/* current xfer fragment */
>  
>  	u8			type_reg;	/* {rx,tx} type register */
>  	u8			intv_reg;	/* {rx,tx} interval register */
> @@ -37,7 +37,7 @@ struct musb_qh {
>  	u8			hb_mult;	/* high bandwidth pkts per uf */
>  	u16			maxpacket;
>  	u16			frame;		/* for periodic schedule */
> -	unsigned		iso_idx;	/* in urb->iso_frame_desc[] */
> +	unsigned int		iso_idx;	/* in urb->iso_frame_desc[] */
>  	struct sg_mapping_iter sg_miter;	/* for highmem in PIO mode */
>  	bool			use_sg;		/* to track urb using sglist */
>  };
> diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
> index 8058a58092cf..3cdb9e3c67ae 100644
> --- a/drivers/usb/musb/musb_io.h
> +++ b/drivers/usb/musb/musb_io.h
> @@ -33,11 +33,11 @@ struct musb_io {
>  };
>  
>  /* Do not add new entries here, add them the struct musb_io instead */
> -extern u8 (*musb_readb)(const void __iomem *addr, unsigned offset);
> -extern void (*musb_writeb)(void __iomem *addr, unsigned offset, u8 data);
> -extern u16 (*musb_readw)(const void __iomem *addr, unsigned offset);
> -extern void (*musb_writew)(void __iomem *addr, unsigned offset, u16 data);
> -extern u32 musb_readl(const void __iomem *addr, unsigned offset);
> -extern void musb_writel(void __iomem *addr, unsigned offset, u32 data);
> +extern u8 (*musb_readb)(const void __iomem *addr, unsigned int offset);
> +extern void (*musb_writeb)(void __iomem *addr, unsigned int offset, u8 data);
> +extern u16 (*musb_readw)(const void __iomem *addr, unsigned int offset);
> +extern void (*musb_writew)(void __iomem *addr, unsigned int offset, u16 data);
> +extern u32 musb_readl(const void __iomem *addr, unsigned int offset);
> +extern void musb_writel(void __iomem *addr, unsigned int offset, u32 data);
>  
>  #endif
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index 832a41f9ee7d..4c83890d9d08 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -407,7 +407,7 @@ static u32 sunxi_musb_busctl_offset(u8 epnum, u16 offset)
>  	return SUNXI_MUSB_TXFUNCADDR + offset;
>  }
>  
> -static u8 sunxi_musb_readb(const void __iomem *addr, unsigned offset)
> +static u8 sunxi_musb_readb(const void __iomem *addr, unsigned int offset)
>  {
>  	struct sunxi_glue *glue;
>  
> @@ -468,7 +468,7 @@ static u8 sunxi_musb_readb(const void __iomem *addr, unsigned offset)
>  	return 0;
>  }
>  
> -static void sunxi_musb_writeb(void __iomem *addr, unsigned offset, u8 data)
> +static void sunxi_musb_writeb(void __iomem *addr, unsigned int offset, u8 data)
>  {
>  	if (addr == sunxi_musb->mregs) {
>  		/* generic control or fifo control reg access */
> @@ -520,7 +520,7 @@ static void sunxi_musb_writeb(void __iomem *addr, unsigned offset, u8 data)
>  		(int)(addr - sunxi_musb->mregs));
>  }
>  
> -static u16 sunxi_musb_readw(const void __iomem *addr, unsigned offset)
> +static u16 sunxi_musb_readw(const void __iomem *addr, unsigned int offset)
>  {
>  	if (addr == sunxi_musb->mregs) {
>  		/* generic control or fifo control reg access */
> @@ -557,7 +557,7 @@ static u16 sunxi_musb_readw(const void __iomem *addr, unsigned offset)
>  	return 0;
>  }
>  
> -static void sunxi_musb_writew(void __iomem *addr, unsigned offset, u16 data)
> +static void sunxi_musb_writew(void __iomem *addr, unsigned int offset, u16 data)
>  {
>  	if (addr == sunxi_musb->mregs) {
>  		/* generic control or fifo control reg access */
> diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
> index 39453287b5c3..9179a6e068b8 100644
> --- a/drivers/usb/musb/tusb6010.c
> +++ b/drivers/usb/musb/tusb6010.c
> @@ -142,7 +142,7 @@ static void tusb_ep_select(void __iomem *mbase, u8 epnum)
>  /*
>   * TUSB6010 doesn't allow 8-bit access; 16-bit access is the minimum.
>   */
> -static u8 tusb_readb(const void __iomem *addr, unsigned offset)
> +static u8 tusb_readb(const void __iomem *addr, unsigned int offset)
>  {
>  	u16 tmp;
>  	u8 val;
> @@ -156,7 +156,7 @@ static u8 tusb_readb(const void __iomem *addr, unsigned offset)
>  	return val;
>  }
>  
> -static void tusb_writeb(void __iomem *addr, unsigned offset, u8 data)
> +static void tusb_writeb(void __iomem *addr, unsigned int offset, u8 data)
>  {
>  	u16 tmp;
>  
> @@ -321,7 +321,7 @@ static struct musb *the_musb;
>   * mode), or low power Default-B sessions, something else supplies power.
>   * Caller must take care of locking.
>   */
> -static int tusb_draw_power(struct usb_phy *x, unsigned mA)
> +static int tusb_draw_power(struct usb_phy *x, unsigned int mA)
>  {
>  	struct musb	*musb = the_musb;
>  	void __iomem	*tbase = musb->ctrl_base;
> @@ -358,7 +358,7 @@ static int tusb_draw_power(struct usb_phy *x, unsigned mA)
>   * (to be fixed in rev3 silicon) ... symptoms include disconnect
>   * or looping suspend/resume cycles
>   */
> -static void tusb_set_clock_source(struct musb *musb, unsigned mode)
> +static void tusb_set_clock_source(struct musb *musb, unsigned int mode)
>  {
>  	void __iomem	*tbase = musb->ctrl_base;
>  	u32		reg;
> diff --git a/drivers/usb/musb/tusb6010_omap.c b/drivers/usb/musb/tusb6010_omap.c
> index 60a93b8bbe3c..d82ca36fa202 100644
> --- a/drivers/usb/musb/tusb6010_omap.c
> +++ b/drivers/usb/musb/tusb6010_omap.c
> @@ -52,7 +52,7 @@ struct tusb_omap_dma {
>  	void __iomem			*tbase;
>  
>  	struct tusb_dma_data		dma_pool[MAX_DMAREQ];
> -	unsigned			multichannel:1;
> +	unsigned int			multichannel:1;
>  };
>  
>  /*
> -- 
> 2.18.0
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
