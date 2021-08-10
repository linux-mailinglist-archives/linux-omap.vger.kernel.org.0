Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656FA3DEA7F
	for <lists+linux-omap@lfdr.de>; Tue,  3 Aug 2021 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbhHCKJI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Aug 2021 06:09:08 -0400
Received: from foss.arm.com ([217.140.110.172]:46428 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235216AbhHCKJD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Aug 2021 06:09:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C6331516;
        Tue,  3 Aug 2021 03:08:52 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058B83F40C;
        Tue,  3 Aug 2021 03:08:50 -0700 (PDT)
Date:   Tue, 3 Aug 2021 11:08:48 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Joseph <tjoseph@cadence.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, nadeem@cadence.com
Subject: Re: [PATCH v2 2/6] PCI: cadence: Add quirk flag to set minimum delay
 in LTSSM Detect.Quiet state
Message-ID: <20210803100848.GB11252@lpieralisi>
References: <20210803074932.19820-1-kishon@ti.com>
 <20210803074932.19820-3-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803074932.19820-3-kishon@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 03, 2021 at 01:19:28PM +0530, Kishon Vijay Abraham I wrote:
> From: Nadeem Athani <nadeem@cadence.com>
> 
> PCIe fails to link up if SERDES lanes not used by PCIe are assigned to
> another protocol. For example, link training fails if lanes 2 and 3 are
> assigned to another protocol while lanes 0 and 1 are used for PCIe to
> form a two lane link. This failure is due to an incorrect tie-off on an
> internal status signal indicating electrical idle.
> 
> Status signals going from SERDES to PCIe Controller are tied-off when a
> lane is not assigned to PCIe. Signal indicating electrical idle is
> incorrectly tied-off to a state that indicates non-idle. As a result,
> PCIe sees unused lanes to be out of electrical idle and this causes
> LTSSM to exit Detect.Quiet state without waiting for 12ms timeout to
> occur. If a receiver is not detected on the first receiver detection
> attempt in Detect.Active state, LTSSM goes back to Detect.Quiet and
> again moves forward to Detect.Active state without waiting for 12ms as
> required by PCIe base specification. Since wait time in Detect.Quiet is
> skipped, multiple receiver detect operations are performed back-to-back
> without allowing time for capacitance on the transmit lines to
> discharge. This causes subsequent receiver detection to always fail even
> if a receiver gets connected eventually.
> 
> Add a quirk flag "quirk_detect_quiet_flag" to program the minimum
> time the LTSSM should wait on entering Detect.Quiet state here.
> This has to be set for J7200 as it has an incorrect tie-off on unused
> lanes.
> 
> Signed-off-by: Nadeem Athani <nadeem@cadence.com>
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  .../pci/controller/cadence/pcie-cadence-ep.c    |  4 ++++
>  .../pci/controller/cadence/pcie-cadence-host.c  |  3 +++
>  drivers/pci/controller/cadence/pcie-cadence.c   | 17 +++++++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h   | 15 +++++++++++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index 791915054ff4..e05c157afef0 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -804,6 +804,10 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
>  	ep->irq_pci_addr = CDNS_PCIE_EP_IRQ_PCI_ADDR_NONE;
>  	/* Reserve region 0 for IRQs */
>  	set_bit(0, &ep->ob_region_map);
> +
> +	if (ep->quirk_detect_quiet_flag)
> +		cdns_pcie_detect_quiet_min_delay_set(&ep->pcie);
> +
>  	spin_lock_init(&ep->lock);
>  
>  	return 0;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index ae1c55503513..fb96d37a135c 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -498,6 +498,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  		return PTR_ERR(rc->cfg_base);
>  	rc->cfg_res = res;
>  
> +	if (rc->quirk_detect_quiet_flag)
> +		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> +
>  	ret = cdns_pcie_start_link(pcie);
>  	if (ret) {
>  		dev_err(dev, "Failed to start link\n");
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
> index 3c3646502d05..65b6c8bed0d4 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence.c
> @@ -7,6 +7,23 @@
>  
>  #include "pcie-cadence.h"
>  
> +void cdns_pcie_detect_quiet_min_delay_set(struct cdns_pcie *pcie)
> +{
> +	u32 delay = 0x3;
> +	u32 ltssm_control_cap;
> +
> +	/*
> +	 * Set the LTSSM Detect Quiet state min. delay to 2ms.
> +	 */
> +

Nit: empty line not needed

> +	ltssm_control_cap = cdns_pcie_readl(pcie, CDNS_PCIE_LTSSM_CONTROL_CAP);
> +	ltssm_control_cap = ((ltssm_control_cap &
> +			    ~CDNS_PCIE_DETECT_QUIET_MIN_DELAY_MASK) |
> +			    CDNS_PCIE_DETECT_QUIET_MIN_DELAY(delay));
> +
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LTSSM_CONTROL_CAP, ltssm_control_cap);
> +}
> +
>  void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
>  				   u32 r, bool is_io,
>  				   u64 cpu_addr, u64 pci_addr, size_t size)
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index a978a2eeedad..cda430d0f6e4 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -194,6 +194,14 @@
>  /* AXI link down register */
>  #define CDNS_PCIE_AT_LINKDOWN (CDNS_PCIE_AT_BASE + 0x0824)
>  
> +/* LTSSM Capabilities register */
> +#define CDNS_PCIE_LTSSM_CONTROL_CAP             (CDNS_PCIE_LM_BASE + 0x0054)
> +#define  CDNS_PCIE_DETECT_QUIET_MIN_DELAY_MASK  GENMASK(2, 1)
> +#define  CDNS_PCIE_DETECT_QUIET_MIN_DELAY_SHIFT 1
> +#define  CDNS_PCIE_DETECT_QUIET_MIN_DELAY(delay) \
> +	 (((delay) << CDNS_PCIE_DETECT_QUIET_MIN_DELAY_SHIFT) & \
> +	 CDNS_PCIE_DETECT_QUIET_MIN_DELAY_MASK)
> +
>  enum cdns_pcie_rp_bar {
>  	RP_BAR_UNDEFINED = -1,
>  	RP_BAR0,
> @@ -300,6 +308,7 @@ struct cdns_pcie {
>   * @avail_ib_bar: Satus of RP_BAR0, RP_BAR1 and	RP_NO_BAR if it's free or
>   *                available
>   * @quirk_retrain_flag: Retrain link as quirk for PCIe Gen2
> + * @quirk_detect_quiet_flag: LTSSM Detect Quiet min delay set as quirk
>   */
>  struct cdns_pcie_rc {
>  	struct cdns_pcie	pcie;
> @@ -309,6 +318,7 @@ struct cdns_pcie_rc {
>  	u32			device_id;
>  	bool			avail_ib_bar[CDNS_PCIE_RP_MAX_IB];
>  	unsigned int		quirk_retrain_flag:1;
> +	unsigned int		quirk_detect_quiet_flag:1;
>  };
>  
>  /**
> @@ -341,6 +351,7 @@ struct cdns_pcie_epf {
>   *        registers fields (RMW) accessible by both remote RC and EP to
>   *        minimize time between read and write
>   * @epf: Structure to hold info about endpoint function
> + * @quirk_detect_quiet_flag: LTSSM Detect Quiet min delay set as quirk
>   */
>  struct cdns_pcie_ep {
>  	struct cdns_pcie	pcie;
> @@ -355,6 +366,7 @@ struct cdns_pcie_ep {
>  	/* protect writing to PCI_STATUS while raising legacy interrupts */
>  	spinlock_t		lock;
>  	struct cdns_pcie_epf	*epf;
> +	unsigned int		quirk_detect_quiet_flag:1;
>  };
>  
>  
> @@ -515,6 +527,9 @@ static inline int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
>  	return 0;
>  }
>  #endif
> +
> +void cdns_pcie_detect_quiet_min_delay_set(struct cdns_pcie *pcie);
> +
>  void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
>  				   u32 r, bool is_io,
>  				   u64 cpu_addr, u64 pci_addr, size_t size);
> -- 
> 2.17.1
> 
