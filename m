Return-Path: <linux-omap+bounces-3408-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C921CA66CF8
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 08:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D9E421DB4
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 07:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA081F4CBD;
	Tue, 18 Mar 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVdD3nER"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003881C3BE2
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284556; cv=none; b=HsxLhWGkmkwsXk54G9H5kwT3aUUEwSm4Ivca2mQlZkFfpbIp/+9tNZHiPkzZjnSBggTGCgOGIVe/5mUgOOEFYD1+ATzEQNoyg4Iu1tT2b9hgklxCVEOfdcAmw/U7RMMcSFZSgmUwa95FFVLUQ/jximAZD3O1J1tHfzVZczRDGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284556; c=relaxed/simple;
	bh=YH3mHZeFCrz61x72RYvPvOWF7hSMF80HmqsH/8t9aJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR4C44e8kIoy5T3GLkk3qPL4987xLzmWpsx9+NgfeWt1ow3bUhNVJHhvY8MnpeiZkWZqRpU6BczH4TNC/BMY35UHOMi4iQOMDE8P8lTJQyomG7ApTV+qKeiGVf5u6rjD6Ie/0zxlRaYQbM5k3IVLy+AUHZVVtA0Nftz1FkIzjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVdD3nER; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so104699755ad.1
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742284553; x=1742889353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9prR8mhxrRYeIRCTSHgJGVKbuPXqgXqBU6nCp2r82U=;
        b=jVdD3nERFYKsivbXIRY4aAksWoZtlSUL0Su/Huqoerv8JQO8muLeFO7QWvzGsiG9PQ
         t/D1I1EoerT/icntRFu/QjIRFEEVnBLzii9qXlUxE5k4rourU5K7NykodwmqrX0vfOgZ
         HdzJ5kba69YeVpVx0YG6qlMhbw70+VeQei50p6ufzOtsQnfpcGau+0mc6CIS80W98zNT
         MpRIVgzx1TpzqDQkI0tKVCnj+fgetlYF6nXEoO31SBQXbrlfmIF0MAbISx+A3B/D7osn
         sWvV2JyFs2UkKY/NITA9onYlNAjUuED7jguh5XgNCwA+qMwG0ZKn5GxrE87puSooTIdQ
         RsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284553; x=1742889353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9prR8mhxrRYeIRCTSHgJGVKbuPXqgXqBU6nCp2r82U=;
        b=vIgTcjX+HZ1ff4w/xYh/8kPX0aOwZKhYZv3TlTz0oioPCMN+fhZdmuLF4n22bMd55a
         j0IRcZzoMqdIB4p1XaDSy78nFZuf1UKavyuQBr54V4BZOjiM2tiwJF6cF+/KTKos7bdw
         yLt3jqN0LE6evJkGb84YcK5eb8n/aekYtB1PMdEQLpOvfFUXQIL/dLlf8tASm6LztQl3
         uF67yo3tgvO3slYcqpRmqu5mjfehq7j0b0UXracDlHpZyi8VpdmRKY5lLD3VG/PKXKFc
         lMUAkBVHRWMCTmd9KckPPQrXMKm74DqCXgTO/nQFeJxztrhZkURUqy6wFdIfuiDjbLVZ
         fvhA==
X-Forwarded-Encrypted: i=1; AJvYcCUa81Th2W4M/ZarPDUgtr5NMGChSc9n+vU8veFypMmC7KMWBakp6Cr01djvhqTq8LAUe9//x93SVQmE@vger.kernel.org
X-Gm-Message-State: AOJu0YylYw1VeGzzXa0702FmDyNgEGlPnol6wMpFp0nTHGpFLyMhRQed
	OmVS+0run1hYsL1oRXoHs1ZkvEhnrpMutBZ936J5M/N9R1vSBABAnFi1Vw0QXqFcssorfesvab8
	=
X-Gm-Gg: ASbGncsIBL008GLd9w6XIIKvfJnQpGtVgP2OdOU06cB3ps0/iMD3nQgNihwb1joJ775
	kAhxLVzRdnE8fCGj/syzWYswEMOA9eWC0sTSp7qzPik8IbHMxtn3e5d1SJas9Bnm1hqguQoles+
	oLuMHRTQqLzX/t+FpO64Fmx3PVZZWKwI7LW+Y2vDCNPmYxN3srHRsxT07MkqOrNa8nS7GmwgaCR
	JpQI7lm6rbiGfkXmNLB70falvd7naE3mVgGMAFS47fGniftVVE0VLA6WYVTqdPHsH2UkvMFTqBQ
	vMOZoelMTcxWJ7J5fLOZuSn8ABkJZF/FNMAE6cHGvjNaRm7npewF1sqz
X-Google-Smtp-Source: AGHT+IHvY4lPoL2TGzhuigZH+Kn+pFtPymew4CCPf5ZwyH3ja7q9rPR3A5fxW5YqDPXkRWgedvl1FQ==
X-Received: by 2002:a17:902:d542:b0:216:6283:5a8c with SMTP id d9443c01a7336-225e0af9e3emr209693445ad.39.1742284553275;
        Tue, 18 Mar 2025 00:55:53 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d2csm87942515ad.125.2025.03.18.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:55:52 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:25:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 2/4] PCI: cadence-host: Introduce cdns_pcie_host_disable
 helper for cleanup
Message-ID: <20250318075547.wyijae6pumogkl4e@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-3-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-3-s-vadapalli@ti.com>

On Fri, Mar 07, 2025 at 04:01:26PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_host_disable() which will undo
> the configuration performed by cdns_pcie_host_setup(). Also, export it
> for use by existing callers of cdns_pcie_host_setup(), thereby allowing
> them to cleanup on their exit path.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../controller/cadence/pcie-cadence-host.c    | 104 ++++++++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h |   5 +
>  2 files changed, 109 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 96055edeb099..741508738f88 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -152,6 +152,14 @@ static int cdns_pcie_retrain(struct cdns_pcie *pcie)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_disable_ptm_response(struct cdns_pcie *pcie)
> +{
> +	u32 val;
> +
> +	val = cdns_pcie_readl(pcie, CDNS_PCIE_LM_PTM_CTRL);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_PTM_CTRL, val & ~CDNS_PCIE_LM_TPM_CTRL_PTMRSEN);
> +}
> +
>  static void cdns_pcie_host_enable_ptm_response(struct cdns_pcie *pcie)
>  {
>  	u32 val;
> @@ -177,6 +185,26 @@ static int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc)
>  	return ret;
>  }
>  
> +static void cdns_pcie_host_deinit_root_port(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	u32 value, ctrl;
> +
> +	cdns_pcie_rp_writew(pcie, PCI_CLASS_DEVICE, 0xffff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_PROG, 0xff);
> +	cdns_pcie_rp_writeb(pcie, PCI_CLASS_REVISION, 0xff);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_ID, 0xffffffff);
> +	cdns_pcie_rp_writew(pcie, PCI_DEVICE_ID, 0xffff);
> +	ctrl = CDNS_PCIE_LM_BAR_CFG_CTRL_DISABLED;
> +	value = ~(CDNS_PCIE_LM_RC_BAR_CFG_BAR0_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_BAR1_CTRL(ctrl) |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_PREFETCH_MEM_64BITS |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_ENABLE |
> +		CDNS_PCIE_LM_RC_BAR_CFG_IO_32BITS);
> +	cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +}
> +
>  static int cdns_pcie_host_init_root_port(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -393,6 +421,32 @@ static int cdns_pcie_host_dma_ranges_cmp(void *priv, const struct list_head *a,
>          return resource_size(entry2->res) - resource_size(entry1->res);
>  }
>  
> +static void cdns_pcie_host_unmap_dma_ranges(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	enum cdns_pcie_rp_bar bar;
> +	u32 value;
> +
> +	/* Reset inbound configuration for all BARs which were being used */
> +	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++) {
> +		if (rc->avail_ib_bar[bar])
> +			continue;
> +
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR0(bar), 0);
> +		cdns_pcie_writel(pcie, CDNS_PCIE_AT_IB_RP_BAR_ADDR1(bar), 0);
> +
> +		if (bar == RP_NO_BAR)
> +			continue;
> +
> +		value = ~(LM_RC_BAR_CFG_CTRL_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_64BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_CTRL_PREF_MEM_32BITS(bar) |
> +			  LM_RC_BAR_CFG_APERTURE(bar, bar_aperture_mask[bar] + 2));
> +		cdns_pcie_writel(pcie, CDNS_PCIE_LM_RC_BAR_CFG, value);
> +	}
> +}
> +
>  static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -430,6 +484,29 @@ static int cdns_pcie_host_map_dma_ranges(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static void cdns_pcie_host_deinit_address_translation(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(rc);
> +	struct resource_entry *entry;
> +	int r;
> +
> +	cdns_pcie_host_unmap_dma_ranges(rc);
> +
> +	/*
> +	 * Reset outbound region 0 which was reserved for configuration space
> +	 * accesses.
> +	 */
> +	cdns_pcie_reset_outbound_region(pcie, 0);
> +
> +	/* Reset rest of the outbound regions */
> +	r = 1;
> +	resource_list_for_each_entry(entry, &bridge->windows) {
> +		cdns_pcie_reset_outbound_region(pcie, r);
> +		r++;
> +	}
> +}
> +
>  static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -487,6 +564,12 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  	return cdns_pcie_host_map_dma_ranges(rc);
>  }
>  
> +static void cdns_pcie_host_deinit(struct cdns_pcie_rc *rc)
> +{
> +	cdns_pcie_host_deinit_address_translation(rc);
> +	cdns_pcie_host_deinit_root_port(rc);
> +}
> +
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  {
>  	int err;
> @@ -499,6 +582,14 @@ int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_init);
>  
> +static void cdns_pcie_host_link_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +
> +	cdns_pcie_stop_link(pcie);
> +	cdns_pcie_host_disable_ptm_response(pcie);
> +}
> +
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct cdns_pcie *pcie = &rc->pcie;
> @@ -524,6 +615,19 @@ int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_link_setup);
>  
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +	struct pci_host_bridge *bridge;
> +
> +	bridge = pci_host_bridge_from_priv(rc);
> +	pci_stop_root_bus(bridge->bus);
> +	pci_remove_root_bus(bridge->bus);
> +
> +	cdns_pcie_host_deinit(rc);
> +	cdns_pcie_host_link_disable(rc);
> +}
> +EXPORT_SYMBOL_GPL(cdns_pcie_host_disable);
> +
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct device *dev = rc->pcie.dev;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index c671e25a481b..9068f140596a 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -523,6 +523,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
> +void cdns_pcie_host_disable(struct cdns_pcie_rc *rc);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
>  #else
> @@ -541,6 +542,10 @@ static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static inline void cdns_pcie_host_disable(struct cdns_pcie_rc *rc)
> +{
> +}
> +
>  static inline void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  					     int where)
>  {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

