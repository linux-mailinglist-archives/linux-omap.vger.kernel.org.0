Return-Path: <linux-omap+bounces-1014-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0688D955
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 09:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552651F2CD10
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884693418B;
	Wed, 27 Mar 2024 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBUvIzC+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ECC37162
	for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528874; cv=none; b=Q8V7sJ93sC19vQH86NqWS2IFZSAItBmCkShpvM/qjFXBW+GJ0LTPFVBJOP0qeQGnqk9D/16e1nFN8OdJIFrd5DQBuCmHJY0dtthhkSlTM5Kfr4eTPufJUSAS/5dgoGa7LzgJzD1StOeQUi//s8vYPIR5sbuhrlWTwYgxp6jh/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528874; c=relaxed/simple;
	bh=Vxz59oGSPPXtkvKXl3CH0Bedz+fRY4D6DbBmcqa4Z5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9nsA2B1qEXiLUYx4NTNQMeFpXL7xaKPz3x14hwOGcIDa620sD0/QKmKCnjgScwsxEgANhKJ3ophsZlL2FLudkJ9yxDzNvcwaFVD1LYClN+E/Tx8UKoAYMgfvBFe2Q6JlMVpdRbn+7kylLYbSd2UIVyhNC6+7aLuLrt9YYpojxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBUvIzC+; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-220ee7342ddso2247804fac.3
        for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711528870; x=1712133670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=zBUvIzC+K0KhmWy6Tsxhve5/iQWSHh2Kmd1UybWCM24AAqwL0s6Ysxhdw9NxjCC21n
         LJgon4QclJceB0+HftwRUtV7i2zDBe/CWKf6kdbXbkwm4j3LTQQ1QiU/MU8/aCWHkFfo
         1lXucySU+MGX812f59+1YVnaQ9ZXsqwWF6sdpJIABxJSfkmCJjhpu6ardsxBL1tk47hl
         zF5pWuGH5oh1rFhZtR6xB7hzoGO3olLfN8HU+oMqdIX5Xv0asZMAPZLhobyzt0b5Cezv
         G6Q+n+Qr9JWefxvwmRg0uVSm/mw2sG935G4Gm7ZnwadZqHzxQJfLfbAYunxOCrYwbKFE
         77rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528870; x=1712133670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kBGo9rBQDVD8B/37mPPc4bOK2wXan+HIEhCfIghQeQ=;
        b=nwp55Dbu+pWe6CWaeOjpdV7Q46U/A1ocoKeBjZb/wAmB2zv+DZ2Rcilo/Dr5/gpI5I
         zPg7nA1bsouBnvEMncX8gzH5U5h9iotoa5KwXs/QcHa5V3mP+6NKk4Jm2oStUtegBAoI
         FAo3j6Ji1b+G8tXxlcOZ8Z/AuT6GNj1yquRJKEAyIwgbfZ0ILdSTtMkq4IdSqCS/uGDH
         uZOJ//bG97crGOXtkOURUjsZYnBpE1745W4HubYFRdhfrze3/zd6XiAqqDUGh0rXq2bm
         KvzjrU9quwbXVwIGvZ+wFIWrcRTSomJPjBF1w1mizZFkeSsAUjtfm3bG+7StBZ+YXfEH
         qIJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtjqjB2zBucP4TwoLtnQVPqVQhhynwCgg0Yh05w1QDqJcPQ22zP5TkkZM1TXXneD4J4N8eRGVAEqzc8Roix42458hcehQZxKLvtQ==
X-Gm-Message-State: AOJu0Yycbc/utWnVK9bUI5lKlL7v38zgGRqxAe9YOuzE+L/WLFTh/jQS
	ss40ot2MmgxGBUKAiYDxqfibQ1Npm+uGUQBtSa9b6rsh8EswBLaM8itS4CLCAw==
X-Google-Smtp-Source: AGHT+IH7Hg0Sm990ZknW0ZrRwtuXnVXRB36mHywm9jAemkPYppo81oiTIBfmm8SNo3JZTiDkMTN0Pg==
X-Received: by 2002:a05:6870:239d:b0:221:bd93:2940 with SMTP id e29-20020a056870239d00b00221bd932940mr2005103oap.27.1711528869823;
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Received: from thinkpad ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id m9-20020a62f209000000b006e6bf165a3asm7434651pfh.91.2024.03.27.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:41:09 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:10:56 +0530
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
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <20240327084056.GC2742@thinkpad>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
 <20240327-pci-dbi-rework-v11-8-6f5259f90673@linaro.org>
 <ZgPXpZgoMqVn8QHt@ryzen>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgPXpZgoMqVn8QHt@ryzen>

On Wed, Mar 27, 2024 at 09:24:05AM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Wed, Mar 27, 2024 at 12:05:54PM +0530, Manivannan Sadhasivam wrote:
> > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > the host to complete the DWC core initialization. Also, those drivers will
> > send a notification to the EPF drivers once the initialization is fully
> > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > will start functioning.
> > 
> > For the rest of the drivers generating refclk locally, EPF drivers will
> > start functioning post binding with them. EPF drivers rely on the
> > 'core_init_notifier' flag to differentiate between the drivers.
> > Unfortunately, this creates two different flows for the EPF drivers.
> > 
> > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > a single initialization flow for the EPF drivers. This is done by calling
> > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > send the notification to the EPF drivers once the initialization is fully
> > completed.
> > 
> > Only difference here is that, the drivers requiring refclk from host will
> > send the notification once refclk is received, while others will send it
> > during probe time itself.
> > 
> > But this also requires the EPC core driver to deliver the notification
> > after EPF driver bind. Because, the glue driver can send the notification
> > before the EPF drivers bind() and in those cases the EPF drivers will miss
> > the event. To accommodate this, EPC core is now caching the state of the
> > EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> > notification to EPF drivers based on that after each EPF driver bind.
> > 
> > Tested-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/cadence/pcie-cadence-ep.c  |  2 ++
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   |  1 +
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/controller/pcie-rcar-ep.c             |  2 ++
> >  drivers/pci/controller/pcie-rockchip-ep.c         |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
> >  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
> >  include/linux/pci-epc.h                           |  7 ++++---
> >  19 files changed, 65 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > index 2d0a8d78bffb..da67a06ee790 100644
> > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > @@ -734,6 +734,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
> >  
> >  	spin_lock_init(&ep->lock);
> >  
> > +	dw_pcie_ep_init_notify(&pci->ep);
> 
> This looks wrong (and I think that you have not build tested this).
> 

Ah, this is silly. Sorry, added the change in a rush :(

> dw_* prefix indicates DWC, so it is a DWC specific function.
> 
> I don't think that you can use this function for the 3 non-DWC EPC drivers.
> I think that you need to use call pci_epc_init_notify() directly.
> 
> 
> (Also perhaps rebase your series on v6.9-rc1, I got conflicts when trying
> to apply it to v6.9-rc1, because it looks like the series is still based
> on v6.8-rc1.)
> 

I rebased the epf rework series and didn't get any conflict. But will rebase
this one also and send next version.

Thanks for noticing my idiocy.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

