Return-Path: <linux-omap+bounces-1508-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C59900300
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 14:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2698A1C22B3C
	for <lists+linux-omap@lfdr.de>; Fri,  7 Jun 2024 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C489B18FC63;
	Fri,  7 Jun 2024 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/0Xpx48"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3281862AB
	for <linux-omap@vger.kernel.org>; Fri,  7 Jun 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762009; cv=none; b=MKx0k4zyxCxd6wZbj13Cy08AIilmRZYZLl94dRGyi6cgzAfHRIyQMeztFdH66VE2WjiwCeTJZvcS9V+ZWlaG8GWEXB4KXKLqAGdeKyxLmh7YQsEq3FGR8iLJvpt7XcEGwOfm375Vjx/GbHTt/e2GPm9Y5aix+Xf/wx/vXYFky0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762009; c=relaxed/simple;
	bh=Vjv8WjEHAUBLg+R73TC4iHSeKZUV9RKb7PxJ5B8Y/WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrKtXwfQqxesl4FzUGvSAAmAHYvdFgPpWbkwjU0h6YAdju/X+0UBwP0gCjkJwBJFj3vcvJ7F2VpB8p4ux4FOQsCsri8eeZCPTZ7v3qpJZa5tdHNkzE+sOOXyGWLrSby+p2mZcMmVqXAaGbkmhj2/HMO9bQs/AjN6YSgSSlq6wmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/0Xpx48; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f612d7b0f5so13354445ad.0
        for <linux-omap@vger.kernel.org>; Fri, 07 Jun 2024 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717762007; x=1718366807; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=W/0Xpx48QPdOA6lzHNq6eJAcLVw/XqaO4t7XYOO80CfHRoZIXaELHlcA0X62XiRMj4
         JfiTYGsPJcvlKzVp/GzS4j7WzGsBq2rG9qGf55HnDnMov2cr91mVmowaoKkSs+0/n5aP
         nTbD6Bd0G2BbFCgGSnli2pwGZj/AMwH55b2y0S243jMnKMIZCX1pXUlWAXz0iya+C73L
         IWjb9Cw0EoHqMlKqHBDmee5tHtQGXNzXb4HdCcuu4IdKGGV5ar9klygD6yFGrwkQU0pC
         I38dE/v/ita5bq3ffMCF/mLmdR5IZRWHlSCK6iW42aQX2ZbWnIJrk367U1GSmpsT/OVZ
         bvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717762007; x=1718366807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=lZGcn/vX7NkzkiSBXIJ37eMOghU3q2Vpdb9Judq+m2zR4PVVmCndKIIrmfJCiwc0Bj
         4T78PopER9gILdzHeIaKFvODD+DhaTzkZcRwDUC6e2RRxiyNpPjV6X2gTa23yMvfDSux
         JD0QhNaG+0B4p979xmBHedo/j2RhgH8oqNwnE99VIPHza7epPxSZZHCtueGd9H6Z1LSn
         RDskuio/Ev5xAbcvYLKfitpDnNSD6AVpnyxuLAy2ew902naCj2gx5XAeT5XKl0qupA5N
         NJ05bg2Q6t5HgLJF/nd0uC6MUMSVA0kR3qqWbdr0XM7wkYzQP2th8Hnfe69dzq7NQDX7
         RlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwpwRaIXjWu6QmNDGlUnRbcPXBvN5WENZJQm8LBP9FOo0MNilzuXGoohkgbgj8MosgfjKP+FHqVFjBt4b/LT2L4DEyNYeuPxtVsQ==
X-Gm-Message-State: AOJu0YxdeEAuiQhoIeWEwByOhEhDuDXUZ1Pk2F5xHwY3rYCWZtuoSGsG
	R4KMKuywPGCn5nLbIufq8Jc4M9/Ltea6Ez5Bgfinz4cuFXGyUEdyU5ksdJXpAA==
X-Google-Smtp-Source: AGHT+IHZn1FxYEr2n48jlTtRBDfIAQDg5hiBd+j5q8YaNLn1ULoVlYRkUzjPoDR891koRVR82SXEYA==
X-Received: by 2002:a17:902:e84e:b0:1f6:7f8f:65ac with SMTP id d9443c01a7336-1f6b8f075b0mr80949715ad.26.1717762006991;
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Received: from thinkpad ([120.56.207.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd761ac8sm32756425ad.54.2024.06.07.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Date: Fri, 7 Jun 2024 17:36:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	mhi@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Message-ID: <20240607120636.GA4122@thinkpad>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <ZmLTcNz0FxAWRYcd@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmLTcNz0FxAWRYcd@ryzen.lan>

On Fri, Jun 07, 2024 at 11:31:28AM +0200, Niklas Cassel wrote:
> On Thu, Jun 06, 2024 at 12:56:33PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series includes patches that were left over from previous series [1] for
> > making the host reboot handling robust in endpoint framework.
> > 
> > When the above mentioned series got merged to pci/endpoint, we got a bug report
> > from LKP bot [2] and due to that the offending patches were dropped.
> > 
> > This series addressed the issue reported by the bot by adding the stub APIs in
> > include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
> > [3].
> > 
> > Testing
> > =======
> > 
> > This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
> > connected over PCIe.
> > 
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
> > [2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
> > [3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > Manivannan Sadhasivam (5):
> >       PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
> >       PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
> >       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> > 
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
> >  drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
> >  drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
> >  drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
> >  drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
> >  include/linux/pci-epc.h                           |  13 +++
> >  include/linux/pci-epf.h                           |   2 +
> >  18 files changed, 162 insertions(+), 68 deletions(-)
> > ---
> > base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
> > change-id: 20240606-pci-deinit-2e6cdf1bd69f
> > 
> > Best regards,
> > -- 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> 
> Considering certain dependency patches have been merged to
> pci/endpoint and other dependency patches have been merged to
> pci/controller/dwc, perhaps it is best if you split this series:
> 
> Series 1 based on pci/endpoint: with patch 1/5 and 2/5.
> Series 2 based on pci/controller/dwc: with patch 5/5.
> 

Thanks Niklas! I didn't check the 'dwc' branch, so ended up posting patches 3/5
and 4/5 again.

Bjorn, if you are OK with this series, I can go ahead and apply patches 1/5 and
2/5 to 'pci/endpoint' and bank on Krzysztof to handle 5/5.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

