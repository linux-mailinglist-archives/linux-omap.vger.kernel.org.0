Return-Path: <linux-omap+bounces-1167-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884A8A41F2
	for <lists+linux-omap@lfdr.de>; Sun, 14 Apr 2024 12:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68D61F212F7
	for <lists+linux-omap@lfdr.de>; Sun, 14 Apr 2024 10:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611E733985;
	Sun, 14 Apr 2024 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWaP99Nr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89231E53F
	for <linux-omap@vger.kernel.org>; Sun, 14 Apr 2024 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713091922; cv=none; b=XgLuwlCdST7qJuXicix2g47FqNwJOqpDcc1B2daqFmz3SzXgJQZX64KrM1eQqTfKpKXWmU/FSAeJAYRmunZQTtuDIpx/iOkFOOZGX+vcSp6BVdxsT7rkuFvMKtElSi74MPLHQjVqT8hk+Fmmj7LqjrE5yQ+grE6AOQ+inffT+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713091922; c=relaxed/simple;
	bh=Fskwbnc4cdeRPyqLU32Z5qy2jXRijiOAUXtekazEu2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpvKcHkIcKo8QfrT5nuaKHPllJhqjWXeQFJcOHO1J04Nv9ydOHM+XQ8rwi7zvAZnVeGhY8rV34tkAC6cxVUXOGjHZpkzzO7ZZvjY4aOLY1dv1L6HahRYjYLuSKY46OhVg2ZatEfVPOORxc0wS7hA1iNWZf7o8KUmSdMLE6vj1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWaP99Nr; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5aa241232faso2079438eaf.0
        for <linux-omap@vger.kernel.org>; Sun, 14 Apr 2024 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713091920; x=1713696720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z86tADjA34jPDvp0sH69LSJjWH6CGCLDMrpq88/Jt4c=;
        b=CWaP99NrQRXk3iFK/wgoPbgyUyGNFKCr4YFHVgLI5kt74TfD3aPIvUhRxQY35Y72gr
         8US1fOCunZipK17hTN/LOMXEdlxau01EEf07VFTwJvlw3ts18vKMRyQ8LpQOU19oQYhD
         lOQcO/ev3XiUEttz4LZOXi8DicZ9/bpTUpAO3tM5HiY3kYzQLnhKkZGlTKPb3+axyWtb
         L7BbkVoyNfRPHCY+51XaJ4kWSuK5GRTPbpDr2N3drgzT7KO0mJ1PnbDSKJrQx04ySfmL
         hcuq/+Ncj6C+V+qaDlmdU1nfDW3po9kZiKu3LAl4VWu1iSZY+uiCsB8KPQgDFlMt0MT1
         1NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713091920; x=1713696720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z86tADjA34jPDvp0sH69LSJjWH6CGCLDMrpq88/Jt4c=;
        b=jwJhfLMIR+WorpIVt+EtyaKApiuVNrbqjkodxaO3DHjocGPC7l18Uxld7E2811pEgQ
         IFO+eVhUKJx1wOAP1El3Lc5PzsiY7wbzvweifLk3jJBxPsjRkeD3OPumOmDtdGwTiUzV
         RGAz6oLPGd/huLqbusjCGoSW7PeWYAZhnqbziKrurBnCYYXuMtOphVuhwGaPr+9Wzuid
         xDIgWd9HT9qx0YYu931BNNVclukrexTSM39mN3QNB0URs3qz8FRwaEDMrWDFawXt00DM
         IBPeIJYeRJ+JHcYRJ3d/ts1Rg5NH7NJLAuVqpi39cArHKZ+j6X+ZKq0/CS0xOdueB8ip
         hiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc7GeId5e+WzWp/DL0C0xXeUUaAl5kn6V/3PPtQVA94rVzNhWoKciMAB71gsfLi1XtSCK6sAVxLk0Af0mfa7wfFSPsecZup2+nmQ==
X-Gm-Message-State: AOJu0YzBFpbjFiDziXyMjMhXAXQVkq2XwzWenu0lCNzM31CS9poDDtDY
	rLzpXEX1ejOQAulL+juO/2Df/BnjqFrTnPxDf8GpZZ23YbD5WrZzwmFdhkGIVA==
X-Google-Smtp-Source: AGHT+IHG73jN0JyTXE5YMG9IYvVbYRtG5PEk5LWJ00N9WZxttyYSYCMKrPxspcM2aGpT1bTva1r7xA==
X-Received: by 2002:a05:6808:218c:b0:3c5:eddb:47c1 with SMTP id be12-20020a056808218c00b003c5eddb47c1mr9182957oib.5.1713091919486;
        Sun, 14 Apr 2024 03:51:59 -0700 (PDT)
Received: from thinkpad ([120.60.136.171])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001dcfaf4db22sm5944167plb.2.2024.04.14.03.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:51:59 -0700 (PDT)
Date: Sun, 14 Apr 2024 16:21:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
	linuxppc-dev@lists.ozlabs.org, Niklas Cassel <cassel@kernel.org>,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v12 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <20240414105148.GC2294@thinkpad>
References: <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
 <20240412202216.GA14590@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412202216.GA14590@bhelgaas>

On Fri, Apr 12, 2024 at 03:22:16PM -0500, Bjorn Helgaas wrote:
> On Wed, Mar 27, 2024 at 02:43:37PM +0530, Manivannan Sadhasivam wrote:
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
> 
> Thanks for doing this!  I think this is a significantly nicer
> solution than core_init_notifier was.
> 
> One question: both qcom and tegra194 call dw_pcie_ep_init_registers()
> from an interrupt handler, but they register that handler in a
> different order with respect to dw_pcie_ep_init().
> 
> I don't know what actually starts the process that leads to the
> interrupt, but if it's dw_pcie_ep_init(), then one of these (qcom, I
> think) must be racy:
> 

Your analysis is correct. But there is no race observed as of now since the IRQ
will only be enabled by configuring the endpoint using configfs interface and
right now I use an init script to do that. By that time, the driver would've
already probed completely.

But there is a slight chance that if the driver gets loaded as a module and the
userspace script starts configuring the endpoint interface using inotify watch
or something similar, then race could occur since the IRQ handler may not be
registered at that point.

>   qcom_pcie_ep_probe
>     dw_pcie_ep_init                                             <- A
>     qcom_pcie_ep_enable_irq_resources
>       devm_request_threaded_irq(qcom_pcie_ep_perst_irq_thread)  <- B
> 
>   qcom_pcie_ep_perst_irq_thread
>     qcom_pcie_perst_deassert
>       dw_pcie_ep_init_registers
> 
>   tegra_pcie_dw_probe
>     tegra_pcie_config_ep
>       devm_request_threaded_irq(tegra_pcie_ep_pex_rst_irq)      <- B
>       dw_pcie_ep_init                                           <- A
> 
>   tegra_pcie_ep_pex_rst_irq
>     pex_ep_event_pex_rst_deassert
>       dw_pcie_ep_init_registers
> 
> Whatever the right answer is, I think qcom and tegra194 should both
> order dw_pcie_ep_init() and the devm_request_threaded_irq() the same
> way.
> 

Agree. The right way is to register the IRQ handler first and then do
dw_pcie_ep_init(). I will fix it in the qcom driver.

Thanks for spotting!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

