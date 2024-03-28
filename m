Return-Path: <linux-omap+bounces-951-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024D88A8DF
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 17:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA7E02E0797
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 16:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2238513AD08;
	Mon, 25 Mar 2024 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X62YTIbH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5633A8D0
	for <linux-omap@vger.kernel.org>; Mon, 25 Mar 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376253; cv=none; b=e3moYiEfJtqk0Clp5uCNln0dh1EPLbbaYoQJgRJkE3LfrV58BFA+HzZ8/a5SRESn1FX/aA4bv4B9qHZ/VsLSBJFl+gvzvEf0u0P6nZN9WWRA/TvJnPv2e9z9ovRFiVY1j99FIC+R3rOb3w+sj5RzzxHxFzmFIxT6RBsMLf2dcxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376253; c=relaxed/simple;
	bh=AmZfqyfeQ8Y5M3qzBDAU3FZwTYWje8PwHZJoFRwwp+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8t0vbGYwV4ckbWULcsc9Y3f4QpA0SkzvS7NqnyNjb5IMckKkwgcBpjs1U19SNqZKthR4azWJjqUo9nDmujS+1VC0MlSy4avCIFGCJV3lxp/Fi50mSg5eGW1xaCLjbe5eKoDssFTY6BJGKfE3+8Szg0J6A+xn4Avz99kegZPaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X62YTIbH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6b5432439so3321855b3a.1
        for <linux-omap@vger.kernel.org>; Mon, 25 Mar 2024 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711376251; x=1711981051; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0j0+WJEClcsY1ZLRLTNOl6KxnRBJYlHp2TmN77gstlg=;
        b=X62YTIbHKiAzOcSTne3x3j5N1YqE/6HsNRg8YWuBffDLP/gQ5LoJ/bvJrRI+kIOSq+
         IU+eYKqafaRcZXStolpTt5X3+fzfi4DfSp1J6Rr+3hDKv3so7+r7XKLb4DWTYEzLxpIw
         VxTcyEtJrKtckMzJ24dkWTuEKiFBv3RX27B62igpzFQ810r/TS55b5gssUBKbgI1JlXa
         RfoarqF/4op/VhAE+CYgvOk9QxipajrP93jK3KHKn6urFEcvU9lXbygfrLeMpXWwGJu8
         mPCeHCZ10YVCP/PC7MN1oAPMr9o4kmSPvNfhckvzOlCEP54et9RzXUlXsfk2dp04WyLH
         euNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376251; x=1711981051;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j0+WJEClcsY1ZLRLTNOl6KxnRBJYlHp2TmN77gstlg=;
        b=TN7JmzZ04CkUvOSIVC2WPS4uw55EjEsqIYOKMJLHc6IuE/otwDBDF/o0cdhyOmmVBe
         qjhxuNevdOZ41nUkyOKPThahom4sQiQemeOJusdZkZpN0CZy/RDTpAtTwnOmw10WrlGM
         P7TZr0JvTbcCuMaEppvR0/65A7u56NF3U3ofULExiOGL/MT+LTf9yu2qVN1SdSlk14dt
         jsd7KdQQNYLiyD9rx4hmNzwrvEOc7zeMKQ4bZGD7ECYMlcMPI6KCOAPF0gx8BsD4Sx+2
         4+ORZq9ySSy15jZG9p0+zIfNCdjJHSEVC7K4bYn2JJKn2aE0//dnfd3p6AWrYbNNNKnU
         IfuA==
X-Forwarded-Encrypted: i=1; AJvYcCVbSy2gk5HsLeV7larVW/gkzt3/JI646MgXaBIhV4bUwfW0HXdtvLScCNyWLuowNWlg3KAhDWBjMQN1enVfU0pFi55ilywslrk+Qw==
X-Gm-Message-State: AOJu0Yyl3kuql53k83OOl4M3exMJ2dhzSNGxgQNnxzMXR1JgK9DUH7EZ
	knBG6bpkKStROtsttqp7p81gTyoA3NLLhG0H01Wn2NzYgwWpRtS7NVPrt/6qvA==
X-Google-Smtp-Source: AGHT+IGt81Wd5PNUHb9reJZgU/GFYtwbIn5716OPRltJ4cQey21mzq5YUv6LXvmRDnnlFilp9pVUoA==
X-Received: by 2002:a05:6a00:2345:b0:6e6:bb2b:882c with SMTP id j5-20020a056a00234500b006e6bb2b882cmr7821317pfj.13.1711376251041;
        Mon, 25 Mar 2024 07:17:31 -0700 (PDT)
Received: from thinkpad ([117.207.29.15])
        by smtp.gmail.com with ESMTPSA id x25-20020a056a00271900b006e24991dd5bsm4217943pfv.98.2024.03.25.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:17:30 -0700 (PDT)
Date: Mon, 25 Mar 2024 19:47:06 +0530
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
Subject: Re: [PATCH v10 8/8] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240325141706.GD2938@thinkpad>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
 <20240314-pci-dbi-rework-v10-8-14a45c5a938e@linaro.org>
 <Zf1xTkuK8yBZXmQ0@ryzen>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf1xTkuK8yBZXmQ0@ryzen>

On Fri, Mar 22, 2024 at 12:53:50PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 01:18:06PM +0530, Manivannan Sadhasivam wrote:
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
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
> >  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
> >  include/linux/pci-epc.h                           |  7 ++++---
> >  15 files changed, 58 insertions(+), 18 deletions(-)
> 
> FWIW:
> Tested-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> 
> However, when looking at this, I was surprised that you never call something
> that will set:
> init_complete = false;
> from e.g. dw_pcie_ep_deinit() or dw_pcie_ep_cleanup().
> 
> I saw that you do seem to set
> init_complete = false;
> in your other follow up series that is based on this one.
> 
> What will happen if you run with only this series merged (without your
> follow up series), on a platform that used to have .core_init_notifier?
> 
> If you do remove and recreate the symlink on a platform with external
> refclk, since you never set init_complete to false, you could trigger
> EPF core_init callback, e.g. pci_epf_test_core_init() to be called,
> which will do DBI writes even when there is no refclk.
> 
> E.g. (on a platform with external refclk):
> 1) Create symlink to pci-epf-test in configfs.
> 2) Start RC, your EPC driver will call ep_init_notifiy() when perst
> deasserts.
> 3) Run pci-epf-test.
> 4) Remove the pci-epf-test symlink
> 5) Shutdown RC
> 6) Create symlink to pci-epf-test in configfs.
>    This will see that init_complete is true, and will do DBI writes
>    which will crash your system, since you don't have a refclk.
> 
> Perhaps you should move the patch that calls a function that sets
> init_complete = false;
> to this series, so that this crash is not possible?
> 

Good catch! But moving that patch to this series requires moving some other
patches as well. So in the meantime, I'll set this flag to false in
dw_pcie_ep_cleanup().

[...]

> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 18c80002d3bd..fc0282b0d626 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c

[...]

> > -	if (!core_init_notifier) {
> > -		ret = pci_epf_test_core_init(epf);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> 
> While you did fix up all DWC based drivers, the non-DWC EPC drivers that
> did not have epc_features->core_init_notifier before this patch:
> 
> drivers/pci/controller/cadence/pcie-cadence-ep.c:#include <linux/pci-epc.h>
> drivers/pci/controller/pcie-rcar-ep.c:#include <linux/pci-epc.h>
> drivers/pci/controller/pcie-rockchip-ep.c:#include <linux/pci-epc.h>
> 
> I don't think that they will work with pci-epf-test anymore, since AFAICT,
> you did not add a call to: pci_epc_init_notify() or similar in these EPC drivers.
> (Like this patch does to all the DWC-based drivers without a core_init_notifier.)
> 

Doh, yeah I completely missed these. Thanks for pointing out. Will add the
notify_init call in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

