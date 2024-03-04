Return-Path: <linux-omap+bounces-789-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C543286FA0D
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 07:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A6681F214A7
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 06:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB0CDDAB;
	Mon,  4 Mar 2024 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQXfRR3v"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913EFC8CE
	for <linux-omap@vger.kernel.org>; Mon,  4 Mar 2024 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533605; cv=none; b=ObFKlrnV42UBpxa8uIgSzlMfBnFj4U+1tGxQbJosBfqT1LViYKyV9a86d5KoSavBm3TgZJry2glZBbaz3IWaiIR72H2xL+wUhxxIrxIWmdtY6opMmxj9+Q/7cNG5k/7RwhNNZSWh3z99JhoOdnc8z72PDffXN+i675v/MeT+uNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533605; c=relaxed/simple;
	bh=xyQs9VtsBlLZ4Ylk//6q1rePA4Ild7tMp8ripotGz9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdmCI49bEyGMP0HSh1jB3xuzCs8sinFWxZdCcNeViWmirkayu+ew+b/5NUlVB1YViD+DSdRuziaf6CqQtac2PDMNjFoUJCOENVhKpXl/Dcn27rXdkTvtZl1G81sRMXuEADhKmt3LXwrywXdRCW/s4H8/EZ3pWwL1Z2itZVhfSzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQXfRR3v; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68ee2c0a237so31297936d6.1
        for <linux-omap@vger.kernel.org>; Sun, 03 Mar 2024 22:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533601; x=1710138401; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6SxR2LLsQ+g6a8hA+U1gdEFbl1WMiIH+9Qs8EKoBKQ=;
        b=lQXfRR3vwoCfhYH01W4GqhxsLu0h0/CC8JMTV7I0oR1PlbNngSfr/jbr7YiHy0MGhY
         P7fkBBwFxpgs5pm8PvL1WmnzSr2vEDpWmqZozS9LwoQYiB5DMcNmClldKb3KFzGIEYzX
         MZtFQ08YCyjift+H4yOZnP55S94WUJxgKcbTwgNlbmEZN7cEsOsAMcR3zWSRUhTp+6/+
         kAE4wWQL6Bdtm8SZ8KgnQXEhtcvT9D2nIcwRNGnx+OUZQh9YnbJoagR59jaDw/NINolG
         VGySz5htpOQp1U0ApMSQE4iKhi124Lt1iH2mj3M372fcY/mxv6mCoxLYlQ10lmbjRvy3
         85Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533601; x=1710138401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6SxR2LLsQ+g6a8hA+U1gdEFbl1WMiIH+9Qs8EKoBKQ=;
        b=G7W0dR7HJb6Ah7nvZOa+t4JElQaKnXAPoE7r7UR2FNf8oI6CcA2MLmLjSEwCUsoy7C
         rsR9B4Zw8BSZsIiVoEXBjVa6zp3zfQhm8SGru3osHUhyOxqI3BdkuUrGXgUfKeKSgxfk
         X/25jpTA1Y+lJDVkTs0VJufA2eh5GBfkeltwAN/UuN9UouAp+bban6AvTmIjKj3IcFzS
         K1HfHKio7T2WQk/ynSs2ZwY7CORxEe5pXkirLNTCwuabh+umlBHDk8l2Toigo1qnpaUe
         bQmKhHP+NRR5NX2HnKWjuVdWzhWEhyXu1iduX22WBlXRdLRxp8ZU8t19cP2iwo87zc4W
         Mudw==
X-Forwarded-Encrypted: i=1; AJvYcCUwst4yRtNbyJ84B9GKQtCND2bYnIto/NtJoHhVlNKxRnwQDgdxDkuNc1wlo03WK9Rs7IpNmX2mmy2mekk2QIG4ldlkjpvHLNNgPQ==
X-Gm-Message-State: AOJu0YzD2FrrEfLrRanEMwenk7ClP0hwg6EPkm84cDWnfsz4Xpq+Lnvn
	F6Zo5MidxWvsggpGNPGvjxjm5X5FjfHVN9wpSfd91pZAU7cFSv4gdvyBkjIyHw==
X-Google-Smtp-Source: AGHT+IGh16i8bKazRcKjIf+8mD1oHLxasc4gBXAtPUXGYbbq10g//g9iQu5psYwYR67+pyj7tPVbIg==
X-Received: by 2002:a05:6214:9aa:b0:690:6e8d:5f8f with SMTP id du10-20020a05621409aa00b006906e8d5f8fmr4779413qvb.7.1709533601528;
        Sun, 03 Mar 2024 22:26:41 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id mm9-20020a0562145e8900b00690732feaadsm939670qvb.125.2024.03.03.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:26:41 -0800 (PST)
Date: Mon, 4 Mar 2024 11:56:25 +0530
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
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240304062625.GG2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-7-64c7fd0cfe64@linaro.org>
 <ZeBpJL1K_vAdmr2M@fedora>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeBpJL1K_vAdmr2M@fedora>

On Thu, Feb 29, 2024 at 12:23:16PM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Sat, Feb 24, 2024 at 12:24:13PM +0530, Manivannan Sadhasivam wrote:
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
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
> >  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
> >  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
> >  include/linux/pci-epc.h                           |  3 ---
> 
> pcie-artpec6.c:static const struct dw_pcie_ep_ops pcie_ep_ops = {
> pcie-keembay.c:static const struct dw_pcie_ep_ops keembay_pcie_ep_ops = {
> 
> Where is the love for these drivers? ;)
> 

Ah, my grep skills got exposed :(

Will fix them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

