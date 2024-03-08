Return-Path: <linux-omap+bounces-841-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E11AF875DA1
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 06:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5631C21478
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 05:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36A532C96;
	Fri,  8 Mar 2024 05:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v2uqPTcp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC031A81
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 05:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709876202; cv=none; b=rhSTeVxeVYUAREaqNUbOx5xOTtvX5GHJui0P3CZLdMFZSrVI/c3BaCMLSxmoom1b+hiMRQvsHUlv8Dhj0TLHgy5gxkYdFTfM8kEGkIRjPjXykXmPKCiHR8S76fvbP/Z80yyUo4c9bywvecGyNUpzE3MomP4flLGqyXftvaI1l/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709876202; c=relaxed/simple;
	bh=CGWk1k+osmUSnjHGpIloUEL/BTJMGKlT7uAEdzjuHTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P13rGIc5SBnqSEs5td5WcbnKxMEVHtoMqnSw16yX5sy/7RLNKFORWKIXH/F2U3MNtiMdZp0/QFAVYtjw6+8eiuPoGsJV6eFMjZX5YsubJv5Zcsx0aczmOdU1XSZ/vbwX6L8XqyQyUUXgI0IY5I8LRPRm+tmbxmOqsFbJnJxPKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v2uqPTcp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c1ec2c07ffso792730b6e.3
        for <linux-omap@vger.kernel.org>; Thu, 07 Mar 2024 21:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876199; x=1710480999; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5usu+wIHjrQwBdpY/kUT6MzVOdZTbW6PSQFUQqDoaA=;
        b=v2uqPTcp9dXDlK0NKL8G06wXWA8y+J92Wgr2fdtbBzlkkTV68eBfAIzqkoNazWBmFa
         2xStiKbKeOfsVjGwAQIfo1RmtTGZxVAOdm7b3pQfzIVcRiUFurk0KuMBWwOFbRsSAwBQ
         cTGnhyYzzAF6nlloUocuPaTXQhvtm3YYW/yb5oMov6E+W/noaEp34V8klUbP+hl80eeJ
         nJz3ggToUPMxNNeQjAT3VeFqABKworqBIMvBBvynLKqxFOwXw8yKl0u61oQxbWQ9Kkl5
         K+Ht9XClxupt6drl8FUTMDecIVZrPgbApfkWALWsVmJL5pXN8ORsPbD7bla+F0ydK4e6
         X4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876199; x=1710480999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5usu+wIHjrQwBdpY/kUT6MzVOdZTbW6PSQFUQqDoaA=;
        b=pR1wuk3re4hcVCc5lvYnD9V3SObccvK0jNc8qoGtCXfvEPN0l3R2T/FOPzvF3Bt5AT
         F7bp5OX7Agpl37KELGN6hblPWMwyPLSePP1hmBr9myR3zhldSnXrBm0OnKVcZFD5EJEu
         hmD9dKOu7EOU6tNRZdNarvzL+XbwYiJ7RKbqYX8GmSFeR2Z8kRRZiLrJXp5aNVj9ZLrc
         7/SebY5pq9hU/o7cV5TtQ6cybCRDlib5lHuBNgCOTBkvw8bvM3EWSSRAApNKGnBK+4w+
         DnkPGOKb9myJRvn2lPnBo8/IvBPTLLR5pgEzyzInSl5hx/EAPiWwcS73LKq+RlwLwusL
         TeIg==
X-Forwarded-Encrypted: i=1; AJvYcCX+I0YeUF+d7Y6iO4IWnwcGlmsr6lSR7jp8pBvKVtWUNAfuFHHYCGK9sHOzp6eMQvZBbTcszSYb93zZXKqtDF3Wvhdgk7f+N60vvw==
X-Gm-Message-State: AOJu0Yw2eT76RVwRzjuvUsez3n4eC+BtUMNxgxLftmsfoL8dytY/ryaP
	s8f+5Mi/2oroW5zOdnxlfvstmSO8mNL70fyd2qcZoqmKgeEiZ5k+ik64YixSeA==
X-Google-Smtp-Source: AGHT+IHj0s/MgXdETk1px2mifakT3T/ik8rZsoVSs9rmOK2GEfO1NijLKPOfSrYwO+VEWrCBP34KEg==
X-Received: by 2002:aca:2b17:0:b0:3c1:f32e:8acd with SMTP id i23-20020aca2b17000000b003c1f32e8acdmr9318128oik.59.1709876198985;
        Thu, 07 Mar 2024 21:36:38 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id u20-20020a62d454000000b006e468cd0a5asm14446363pfl.178.2024.03.07.21.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:36:38 -0800 (PST)
Date: Fri, 8 Mar 2024 11:06:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com
Subject: Re: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240308053624.GB3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
 <ZeolaEIRYmKZjnvT@ryzen>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeolaEIRYmKZjnvT@ryzen>

On Thu, Mar 07, 2024 at 09:36:56PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:18PM +0530, Manivannan Sadhasivam wrote:
> > Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> > drivers requiring active refclk from host. But for the other drivers, it is
> > getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> > that this API initializes DWC EP specific registers and that requires an
> > active refclk (either from host or generated locally by endpoint itsef).
> > 
> > But, this causes a discrepancy among the glue drivers. So to avoid this
> > confusion, let's call this API directly from all glue drivers irrespective
> > of refclk dependency. Only difference here is that the drivers requiring
> > refclk from host will call this API only after the refclk is received and
> > other drivers without refclk dependency will call this API right after
> > dw_pcie_ep_init().
> > 
> > With this change, the check for 'core_init_notifier' flag can now be
> > dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> > 'core_init_notifier' flag completely in the later commits.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> >  drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> >  10 files changed, 90 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > index 0e406677060d..395042b29ffc 100644
> > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
> >  		return ret;
> >  	}
> >  
> > +	ret = dw_pcie_ep_init_registers(ep);
> > +	if (ret) {
> 
> Here you are using if (ret) to error check the return from
> dw_pcie_ep_init_registers().
> 
> 
> > index c0c62533a3f1..8392894ed286 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
> >  		ret = dw_pcie_ep_init(&pci->ep);
> >  		if (ret < 0)
> >  			goto err_get_sync;
> > +
> > +		ret = dw_pcie_ep_init_registers(&pci->ep);
> > +		if (ret < 0) {
> 
> Here you are using if (ret < 0) to error check the return from
> dw_pcie_ep_init_registers(). Please be consistent.
> 

I maintained the consistency w.r.t individual drivers. Please check them
individually.

If I maintain consistency w.r.t this patch, then the style will change within
the drivers.

- Mani

> 
> > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > index 9ed0a9ba7619..0edd9ab3f139 100644
> > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > @@ -441,7 +441,18 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
> >  
> >  		pci->ep.ops = &pcie_ep_ops;
> >  
> > -		return dw_pcie_ep_init(&pci->ep);
> > +		ret = dw_pcie_ep_init(&pci->ep);
> > +		if (ret < 0)
> 
> Here you are using if (ret < 0) to error check the return from
> dw_pcie_ep_init().
> 
> 
> > index 778588b4be70..ca9b22e654cd 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > @@ -145,6 +145,15 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
> >  
> >  		pci->ep.ops = &pcie_ep_ops;
> >  		ret = dw_pcie_ep_init(&pci->ep);
> > +		if (ret)
> 
> Here you are using if (ret) to error check the return from
> dw_pcie_ep_init(). Please be consistent.

-- 
மணிவண்ணன் சதாசிவம்

