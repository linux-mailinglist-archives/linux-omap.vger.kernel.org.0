Return-Path: <linux-omap+bounces-751-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA9869F43
	for <lists+linux-omap@lfdr.de>; Tue, 27 Feb 2024 19:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094FEB223CD
	for <lists+linux-omap@lfdr.de>; Tue, 27 Feb 2024 18:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE2F4D5A2;
	Tue, 27 Feb 2024 18:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OD4KwaAW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35D4D107
	for <linux-omap@vger.kernel.org>; Tue, 27 Feb 2024 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709059354; cv=none; b=tyt6Gfe65qCMUy4iQv2mqGeFM7XQVTtfc5AqP76vudmyNi6NEUk8ZIxNl+rL1yTzK1niDYLabONshXhKl2anncua9AC2WBNAWYa666/9cVtGdNpCPsbDlonkfx/5tIC4U2d+Pk1L/tleAB/tLCJe9en6N1cvhC8GlLHboiZ1toA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709059354; c=relaxed/simple;
	bh=TeDNuU90ly9acziamBX1PT4TgShziEBCnefgqu8SzNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpfTs1CHO5QbohCo9iBfmWQKV8Fr5QTptL5WAroO2+Q7e4j7hwESKD1lvHgvZO9KOcu4kOHzvW1xw8fispacg3YUy+s6slPwGSBkcc/beTMu5tKCyoio54wKnzngm1WfhFE3ASLJCaMe05MxAYPaeJipd0iqwCATCtqfXwKUb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OD4KwaAW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cedfc32250so4288577a12.0
        for <linux-omap@vger.kernel.org>; Tue, 27 Feb 2024 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709059352; x=1709664152; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6rCPg+j8C1jvS9yOkEQeWpFYDNNuRJYfgnyrNY8KDs=;
        b=OD4KwaAW5YRbf3nRwotlMQFuGPEEQqHOJ7Grl8+wj/23FYaYlioTcxFCEPN63qpWKD
         hcYHUCyBIGz+FtHeflthN/eGvK1w69FWDyuHH/KTYHjvrUdSKiUwNz0ZotyZ5POM2g4v
         yDZM1uFw1HbGFn088iaXuQyCN5hxuOaglTMjSrJ2IZwxiEDaZ1w7eAfSr8otQ4UJ0UIm
         Ef1sK7HMi64X4tr86rsDgPzHi49PF4Z1ZGCsAeYOKvF2qjg+Jl5qQRjoKTKbNNLYHj9C
         41mq4i8R/qHdas64GsuSAmwzz/M/qED9491WlJtJW26KtBhCRSbuTKIiaDnE7IQkbIXV
         c8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059352; x=1709664152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6rCPg+j8C1jvS9yOkEQeWpFYDNNuRJYfgnyrNY8KDs=;
        b=V4absPsMuFlT+7pGfqYlB46tuUhNMeVA4L0ZOg5MRA8PQMuReFhVpcJY/J2IpW1u3t
         x8/2oQ6MhL31yBoQ/tlp3RXzXyDQ96NVRTBedr6oJKCOtKL0dpRoF2vf1kkKsgJb5IF5
         JhGuJYJKFIgDJE6eLRXjv9ABHvDH4BRlHFg7/wticUJX+BWequtUK+QeP64ElmOW9QVi
         CXj+7J2XZnxy3ue+1inLEAMdZQbZ4RGxTwUxUUfetHnGIAEeknZO8kWnRoCcuflrW7N2
         LAMd4WuO8hgJ1v9/rER+8Xb5wiaAYp88vZrW5Zt7bRgy/30xrHb2Y/oamWbHDZG7iB4X
         i6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWdrnYXMsi8BrWXaq493z6900MY0IjjHBzRq7DDIlyPdFITVwP5nM8+bKVMyJkNjOT9nECOtAHd6ZPzU/X1QNLifttZA1FzK49itg==
X-Gm-Message-State: AOJu0YzFSDXutkXBoYFftV3UtzaRsgXckjqij2U8Z6yIU9chMlRNxN2e
	j1OVOeiK4YhnjBRglJLW8B3isR3hBWXeVedSKEhnYj2xufjiFm+oGoauRmEE8Q==
X-Google-Smtp-Source: AGHT+IHGnijMDtvZJeDBn9BB121pNvr/sMLOiP6/y+CYwXPpfHEAryi1aO3yqqkJry/L7BDxwUlTZw==
X-Received: by 2002:a17:90a:4285:b0:299:6a7f:cc09 with SMTP id p5-20020a17090a428500b002996a7fcc09mr7865801pjg.33.1709059351862;
        Tue, 27 Feb 2024 10:42:31 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id nr14-20020a17090b240e00b00299332505d7sm3758838pjb.26.2024.02.27.10.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:42:31 -0800 (PST)
Date: Wed, 28 Feb 2024 00:12:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <20240227184218.GT2587@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-6-64c7fd0cfe64@linaro.org>
 <ZdzEoXwU42rFCF/W@lizhi-Precision-Tower-5810>
 <20240227122141.GN2587@thinkpad>
 <Zd4bybN0malf5uBe@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4bybN0malf5uBe@lizhi-Precision-Tower-5810>

On Tue, Feb 27, 2024 at 12:28:41PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 05:51:41PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 12:04:33PM -0500, Frank Li wrote:
> > > On Sat, Feb 24, 2024 at 12:24:12PM +0530, Manivannan Sadhasivam wrote:
> > > > Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> > > > drivers requiring active refclk from host. But for the other drivers, it is
> > > > getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> > > > that this API initializes DWC EP specific registers and that requires an
> > > > active refclk (either from host or generated locally by endpoint itsef).
> > > > 
> > > > But, this causes a discrepancy among the glue drivers. So to avoid this
> > > > confusion, let's call this API directly from all glue drivers irrespective
> > > > of refclk dependency. Only difference here is that the drivers requiring
> > > > refclk from host will call this API only after the refclk is received and
> > > > other drivers without refclk dependency will call this API right after
> > > > dw_pcie_ep_init().
> > > > 
> > > > This change will also allow us to remove the "core_init_notifier" flag in
> > > > the later commits.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
> > > >  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
> > > >  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
> > > >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
> > > >  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
> > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
> > > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
> > > >  8 files changed, 63 insertions(+), 24 deletions(-)
> > 
> > [...]
> > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > index ed1f2afd830a..278bdc9b2269 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > > > @@ -729,7 +729,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  	struct device *dev = pci->dev;
> > > >  	struct platform_device *pdev = to_platform_device(dev);
> > > >  	struct device_node *np = dev->of_node;
> > > > -	const struct pci_epc_features *epc_features;
> > > >  
> > > >  	INIT_LIST_HEAD(&ep->func_list);
> > > >  
> > > > @@ -775,29 +774,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
> > > >  		goto err_exit_epc_mem;
> > > >  	}
> > > >  
> > > > -	if (ep->ops->get_features) {
> > > > -		epc_features = ep->ops->get_features(ep);
> > > > -		if (epc_features->core_init_notifier)
> > > > -			return 0;
> > > > -	}
> > > 
> > > why remove this check?
> > > 
> > 
> > There is no point in keeping this check since we are removing the call to
> > dw_pcie_ep_init_registers() below. But I should've described this change in the
> > commit message.
> 
> Sperated patch will be helpful. This clean up does not related with other
> change.
> 

Well this is not a generic cleanup that could be moved to a separate patch. Due
to the changes in this patch, the use of the flag becomes redundant. So it has
to removed here itself.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

