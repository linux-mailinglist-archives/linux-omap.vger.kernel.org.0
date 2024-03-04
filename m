Return-Path: <linux-omap+bounces-791-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFD786FB95
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 09:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2DB1B20A04
	for <lists+linux-omap@lfdr.de>; Mon,  4 Mar 2024 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5283A17541;
	Mon,  4 Mar 2024 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iye9FMvY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BD168BC
	for <linux-omap@vger.kernel.org>; Mon,  4 Mar 2024 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540356; cv=none; b=dJi3sSt1Mb71mvgKHsE8u/01Kj9gjR9EvYL63BOGi65ahuNokgVXi39tWu7Soqxs45Wd5BU0Qd/5R1Such7yjuADNL047zc+j25nuX0ddg3zWBYDdlZ2kSGq+wsVRHF7DzUNlgshkR9aY17jRaHL6DQjk7B2rQ+MS1jwwIqlqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540356; c=relaxed/simple;
	bh=H5uERWY03PMmpXHmr9VmP2Q+Yn+vktnT7Eljnh8Qo9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFUFJqVPHbkjlJDZsNiTjwSGV9mBuPQMjIeokSx4b+fiuunt5uJzsteGA5WpUoq035TngaZJ+0TTMNba7b5Jshb6+XhQ/mViypA1DW5z6u4qitHrFU2P6vTrnTm7OQT8ufHdCSU26SB1DoTfQXxkZQZkPUBAtbJSKrlLHljioG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iye9FMvY; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so4405619276.0
        for <linux-omap@vger.kernel.org>; Mon, 04 Mar 2024 00:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540353; x=1710145153; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGaxan9MS5xxwpnuhzQOq+gU3MPaqevKCopu0R9YM7I=;
        b=Iye9FMvY1Mxl9ba1DIM6exZqxv2w3tmhNabwkzOPFQzyHWkk3ww/BUx20ZE0Mu8osc
         VKIZ+KTYku6OZM7RP9UMjbysJJwdct9OYF5b1wOhW38kp9OYhn6bJNz991NkYt2c0Hlr
         7v2+g0ycRxxXmq+r0ossgxFsbbkgsxXzYsm4kPEfFFh00o2/4sRt3VMOsmwsQFKi5Rtm
         J8w4x4+5bRrV8O8aJgGhB3o4sTmKCBVPgbX0naIbmibJV01s5p1pDRfYr5gsJevO2GAY
         BSG2yxYsA2fhSkc+HFkbK/cq61znvWC5QhlsPhFA+rG6ljvDujssljeJs6E39J9AO6Fs
         hgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540353; x=1710145153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGaxan9MS5xxwpnuhzQOq+gU3MPaqevKCopu0R9YM7I=;
        b=U2LEQ+NY8ClKHyOdinBc3UM0BCMOuxm2SwMq+aDOINgmNSdbp/RVmuvRNGcTrWVTzN
         hnxFKUTuYeI6OsT58BtHeaNS9MbvX09BDv+trv/gMuy5v4A7A05ipTaYnQVuzsLD+byR
         WBM3n/+gr+6DXejDbkQY89wUmwyUfefZJIzv46ED39UWSKupfu48uSI68m2BOEDZ0SLF
         iy8Ya3deSqspm8vn5XGjmPHqToLyP7glIlrhkQE5kN/M54R94jsAT7PLFZh0hbl1g1kz
         rMdaoPoDxz1Zg8/sm7SG49DE6RDnhilL/KvdHMzxrg2re0A6P2D62wWLY+Pyu/VtcMYy
         PuQw==
X-Forwarded-Encrypted: i=1; AJvYcCVvyE2uPyJWabBbvuRWRJMU1CYKpi2yeBaj06hztnh2X4VtDCjNwP0cdcUFoPQz0hhgG4Mz6sgEbR1CveXixscpMZGPTj9agSZSfA==
X-Gm-Message-State: AOJu0YxnMAX2OxYqd03P0q4hgt34iP2sB6yThmMUVNDlgIOmbODgkT2w
	3OtIZnOTyOXjhVMwjZFFaqYD6JG9qN1yx+WF/ML/oGJ8MzT7uhn4SqgBM4BhEg==
X-Google-Smtp-Source: AGHT+IHL1WHL+wc2Bkuxv4RuAVn4VY861FeJv8fqtZvJsgPjzKqwuQFKnCSzgHkDfczowkgJ09KEpA==
X-Received: by 2002:a25:7412:0:b0:dcc:79ab:e51a with SMTP id p18-20020a257412000000b00dcc79abe51amr6318413ybc.57.1709540353345;
        Mon, 04 Mar 2024 00:19:13 -0800 (PST)
Received: from thinkpad ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id ks17-20020ac86211000000b0042ed81f5297sm2298830qtb.35.2024.03.04.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:19:13 -0800 (PST)
Date: Mon, 4 Mar 2024 13:48:59 +0530
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
Subject: Re: [PATCH v8 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <20240304081859.GI2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
 <ZeB-93jiX31cLJyP@fedora>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeB-93jiX31cLJyP@fedora>

On Thu, Feb 29, 2024 at 01:56:23PM +0100, Niklas Cassel wrote:
> Hello Mani,
> 
> On Sat, Feb 24, 2024 at 12:24:16PM +0530, Manivannan Sadhasivam wrote:
> > All of the APIs are missing the Kernel-doc comments. Hence, add them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-ep.c | 92 +++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index fed4c2936c78..cdcb33a279db 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> 
> (snip)
> 
> > @@ -556,6 +606,12 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * dw_pcie_ep_cleanup - Cleanup DWC EP resources
> > + * @ep: DWC EP device
> > + *
> > + * Cleans up the DWC EP specific resources like eDMA etc...
> 
> I think that you should mention that this is only for glue drivers that
> use PERST# handling, so that other glue drivers do no start using it :)
> 

You are right. Will add the wording.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

