Return-Path: <linux-omap+bounces-840-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0490875D9B
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 06:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCD11C21ACC
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 05:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530003613C;
	Fri,  8 Mar 2024 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3GX42bP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3484736132
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709876077; cv=none; b=k73Jrk4scycWxi1Shtegl65AVWAKfM5+09rw6Mn+UhKJ5NNnBhDMIwqs/Ig0iFdoyrStRCJzv7kCQ+MZ6KmVgxdo81XkmKp8jrha5szkKcCO45fIFPLnfv520qFjAInvMcsJAg7+1X/v2lglhFH54or5Tf5HgJ4SNW1X1xlNoVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709876077; c=relaxed/simple;
	bh=gGtIE1GlzpRb/hpJLgPmmPxL9CGVUSEwETlUVk1FdHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dtzlx2CXlO7aQ/GbFNBL2AE/m9IDUXmweQPrUWp/LkHEXafwgVDfZbWiAxIKQ+mqqSMH7TXEHCtsf4joP9edbzttbMln0EC7q9L4LqERghkei8TuBcSGlEnO/590CaeX7R/LPTIK6XPu00lVuP0Oj5Sd5U7dTTQsHNXaozmXY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3GX42bP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so12649805ad.1
        for <linux-omap@vger.kernel.org>; Thu, 07 Mar 2024 21:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876073; x=1710480873; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLlyiqWF0upHn9Y3ngiUh0k7hhFX2gsYsEhwvlh6VfE=;
        b=q3GX42bPh6RLUmwtyUxh8JzjX3TdwCOrAXsz2C2JBw974pRaXievziREUbTgkql+cQ
         1M/aQ9IYpz93t7nZRW7FKZgt+itJN6kkfZ773prMPlBe/aNUNahDATv2hW5gdh9L7sbp
         O95LBw8N45duLtED5MMBQKRK0YD14HXB6goUOD3IiCzQaNzpzSQIh/O3+oPE/OOjX2+K
         EfhS08fZWNwXsbgnnDwHkz5FBah8N3rQRkUw1PgqN1s8e7xTBVRDvq/utvpgxqT/oB1V
         T+NSfuMupm2+pzYq7TWeXBVAUeXg4aL15nVWqVh/Qp0o9D4GAYMOHGAsp/mOpH6E5zQ/
         23tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876073; x=1710480873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLlyiqWF0upHn9Y3ngiUh0k7hhFX2gsYsEhwvlh6VfE=;
        b=C1tyP7D8L2CJp3x8fCSxipvKXjpRAeiuQnv0Rjw9bjGSiomX6G6Yue2Remg12Sqm4A
         6cjjmWZ/E9snYeLoKDCeMaj2TCn+vBXMiHr+tuCoM0O3X6mZNGGI3+qjTl2z7snBKitv
         XqM3obHw9BRklqe61LX+AJEb3jn/9GWtkkUoHDsnuxKPOSKk3T4u06sTEJbRUrtOONyT
         +CA5h5Yjqba4S/aPoKY3l1fMx2n4aQ0e6k0cHktJq+In9BZ0eC644w1Lo7G08hEE6P3P
         OqAaB+28+s2ISiMf3rMmTL04/vrHmElDhA8wMdTZY3sVwsAfY/UeLAuPI2+c4Hw0ribS
         jxoA==
X-Forwarded-Encrypted: i=1; AJvYcCWJIK9hDjEJ+FvSMsiGbR14Uj08uZ93Cyk6msrtWdPuoLpCXEyh7Y1flbaq35DauAdy7gA/HnoSs6CKn1ZcrLV5eQFMIrch4RhoMg==
X-Gm-Message-State: AOJu0YxTh4gdazWstVl++c9/ClX7JWhusmQsXj3y430GEy2cWs0MGEZy
	hWfs2xPaBgkXtPyXk5DcAnrUlqEr46GiCtnSYeHAb0N4YwGJZWumrAMZUGgitw==
X-Google-Smtp-Source: AGHT+IG89iAmJ8LV9BCChv81LryPxWwamgWvwEd6QxuWM+joRnlgHY+wIW3y+qsIhhLN4Fb6hLrFWg==
X-Received: by 2002:a17:903:2d1:b0:1dd:65bc:c056 with SMTP id s17-20020a17090302d100b001dd65bcc056mr1956887plk.40.1709876073327;
        Thu, 07 Mar 2024 21:34:33 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id z4-20020a170903018400b001dd66e6ec91sm578427plg.140.2024.03.07.21.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:34:32 -0800 (PST)
Date: Fri, 8 Mar 2024 11:04:17 +0530
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
	linux-arm-kernel@axis.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v9 04/10] PCI: dwc: ep: Fix DBI access failure for
 drivers requiring refclk from host
Message-ID: <20240308053417.GA3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-4-29d433d99cda@linaro.org>
 <ZeokEJstpRSUPDTL@ryzen>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeokEJstpRSUPDTL@ryzen>

On Thu, Mar 07, 2024 at 09:31:12PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:16PM +0530, Manivannan Sadhasivam wrote:
> > The DWC glue drivers requiring an active reference clock from the PCIe host
> > for initializing their PCIe EP core, set a flag called 'core_init_notifier'
> > to let DWC driver know that these drivers need a special attention during
> > initialization. In these drivers, access to the hw registers (like DBI)
> > before receiving the active refclk from host will result in access failure
> > and also could cause a whole system hang.
> > 
> > But the current DWC EP driver doesn't honor the requirements of the drivers
> > setting 'core_init_notifier' flag and tries to access the DBI registers
> > during dw_pcie_ep_init(). This causes the system hang for glue drivers such
> > as Tegra194 and Qcom EP as they depend on refclk from host and have set the
> > above mentioned flag.
> > 
> > To workaround this issue, users of the affected platforms have to maintain
> > the dependency with the PCIe host by booting the PCIe EP after host boot.
> > But this won't provide a good user experience, since PCIe EP is _one_ of
> > the features of those platforms and it doesn't make sense to delay the
> > whole platform booting due to PCIe requiring active refclk.
> > 
> > So to fix this issue, let's move all the DBI access from
> > dw_pcie_ep_init() in the DWC EP driver to the dw_pcie_ep_init_complete()
> > API. This API will only be called by the drivers setting
> > 'core_init_notifier' flag once refclk is received from host. For the rest
> > of the drivers that gets the refclk locally, this API will be called
> > within dw_pcie_ep_init().
> > 
> > Fixes: e966f7390da9 ("PCI: dwc: Refactor core initialization code for EP mode")
> > Co-developed-by: Vidya Sagar <vidyas@nvidia.com>
> > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> I'm not sure if the Fixes tag is stictly correct, since there is
> nothing wrong with the commit that the Fixes-tag is referencing.
> 

No. The commit was intented to move all the DBI accesses to
dw_pcie_ep_init_complete(), but it left few things like ep_init() callback that
could access the DBI registers. One may argue that the none of the drivers at
that time were accessing DBI registers in that callback etc... but I used that
commit as a fixes tag for the sake of backporting. Otherwise, I don't see how we
can easily backport this patch.

> What this patch addresses is an additional use-case/feature,
> which allows you to start the EP-side before the RC-side.
> 
> However, I'm guessing that you kept the Fixes-tag such that this
> patch will get backported. However, this patch is number 4/10 in
> the patch series. If this is a strict fix that you want backported,
> and it does not depend on any of the previous patches (it doesn't
> seem that way), then I think that you should have put it as patch
> 1/10 in the series.
> 

Not strictly required. Usually the fixes are added first for the ease of merging
as you said, but here I intend to merge this series as it is and it is not
fixing anything in the ongoing release. But, if I happen to respin, I may
reorder so that this can get merged early in next release cycle (this series is
going to miss 6.9 anyway).

> Patch ordering aside:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

