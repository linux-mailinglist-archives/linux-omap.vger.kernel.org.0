Return-Path: <linux-omap+bounces-853-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EE876125
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 10:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587FB1C21FF0
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01121537E2;
	Fri,  8 Mar 2024 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scNnxe+e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD6535C1
	for <linux-omap@vger.kernel.org>; Fri,  8 Mar 2024 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891062; cv=none; b=r8D5JiMWds9I3Zkrx7FZ+xyFxdI9qPqd498V6L6mlkDkXMIkUV81N7QdEXf44hL8cAZCPtc7HTsgYaHwydwHFujXejYNo4SQOECaNIEmwTucOeaCGG0fyA5aXNa9tXaPE2bx9TtSLKcq0Z0U8FZGPPSKLFifTQ6rNMKafeskhLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891062; c=relaxed/simple;
	bh=0HEUZNyW463A0kgIICyd/mFsEgweSIiAp5zW9wvwQAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/oQDpFHWEHO7zFtFkbV5aPolJMdooMb3p3FRsSVsgnXobJWgLdAFlWcmCNf49c4PntntED2Lw/kYcQrjYu3Bp1udWf+lDJ2frrkEWL6jiPdePBOphEZAxgTRd3Kefqws4hwRlbw+/oo3DXXfIUGJx58OZK9Jf4sX0tkQZEKo6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scNnxe+e; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so499639b3a.1
        for <linux-omap@vger.kernel.org>; Fri, 08 Mar 2024 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709891060; x=1710495860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdMdoK0AVaUo9V+wul4fyguoktaqDabkYBWscL2ezsE=;
        b=scNnxe+eH0gJxpLD0BEvB7iGN2bbDV3x3kfx59zaTZPi8My/LQzAyQCdqZI3PhYc1J
         6lQEh9CPLTemfcQpPYXAqYpSOnV42pha+24/QSs8Rv5XyvF1Jl7Xy58mXLEN0lspq8mw
         nzB9N5d7NoGM92r2JY6lMAMKdXznKYIRMjkZZ9l5cWzw5ZiqRbp1awaJ+9FdScEP/MvU
         1x28YZpIxM8HZvGeyF42lUoRbJ2ZQUJrWQgYE8FvywAEZ3cSUuhhBo7oqziYapoD1FW3
         FSb0ut2COKfFVrLeAzgf2kuJAj0PWN0jL8IPwMagx/fET4usxx4CBS+LbPkoTFM9sJYJ
         FHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891060; x=1710495860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdMdoK0AVaUo9V+wul4fyguoktaqDabkYBWscL2ezsE=;
        b=jM5aeCqxzkaFZEm3psCimTOM3kHjxlZyWbfbS9/oz03xgRWZwHQdBUqXhf7YrmdVIp
         dmXdkqazJ/b8DR64wUJhrovl5d1JFtHRL3wj6EIvn6WHBZrZNCh3u6YTSvvb2mCWo1Jp
         AeOlGcc2CsG5CC6HtRxZ7ZxfQ3bJFTlU4247dcNwvmWN/kHpb6S+7YnCcGZK4wifNGok
         QBoPRqrT/zBMPsBH9rGoYzengGnikzsta/tGDa8gPoC4+QixqFBiKQfuZO2BT/FH9uMt
         F1P9H2zABzoZHhGWsbyQQkBVH/Jw75Ycxbavvi2IJlU9p6hvcLP8immn+Y5KjPWCu1Ut
         36fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNOmxEQSS3U5+rS7RX4al8DW4RCXpKCIB2jLmgp8UNF2zcwguRni4r7F6DEWDX0j8FwG3AvzAwDnNWqgnj3+7I0BKoqVph2A/A5w==
X-Gm-Message-State: AOJu0YxQ2dGSgnENsyf/RAbOYMvikUE8yqN4XVn/UC3Ew+pnIuXU0kwC
	ZPlHoAgUg7k8YSCeh85/4TOR8ABN51Ya2KUngjpQNfbnsbOnsF8XSSH3iS2ZnQ==
X-Google-Smtp-Source: AGHT+IFPbL54AXHQXB9MkS0qJtzg8o8q9yBGg3I5qPe5e95N0vMgv1+cPBqKR5EsKnzhBrhB5Hgmww==
X-Received: by 2002:a05:6a20:4284:b0:1a1:6b04:9f2e with SMTP id o4-20020a056a20428400b001a16b049f2emr7419660pzj.9.1709891060050;
        Fri, 08 Mar 2024 01:44:20 -0800 (PST)
Received: from thinkpad ([117.217.183.232])
        by smtp.gmail.com with ESMTPSA id b1-20020aa78101000000b006e6350986a8sm6625169pfi.215.2024.03.08.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:44:19 -0800 (PST)
Date: Fri, 8 Mar 2024 15:14:04 +0530
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
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240308094404.GF3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <Zeos8kVxgchH9veF@ryzen>
 <20240308053829.GC3789@thinkpad>
 <ZerQxxfUvFm2MjqV@ryzen>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZerQxxfUvFm2MjqV@ryzen>

On Fri, Mar 08, 2024 at 09:48:07AM +0100, Niklas Cassel wrote:
> On Fri, Mar 08, 2024 at 11:08:29AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 07, 2024 at 10:09:06PM +0100, Niklas Cassel wrote:
> > > On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
> > > > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > > > the host to complete the DWC core initialization. Also, those drivers will
> > > > send a notification to the EPF drivers once the initialization is fully
> > > > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > > > will start functioning.
> > > > 
> > > > For the rest of the drivers generating refclk locally, EPF drivers will
> > > > start functioning post binding with them. EPF drivers rely on the
> > > > 'core_init_notifier' flag to differentiate between the drivers.
> > > > Unfortunately, this creates two different flows for the EPF drivers.
> > > > 
> > > > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > > > a single initialization flow for the EPF drivers. This is done by calling
> > > > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > > > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > > > send the notification to the EPF drivers once the initialization is fully
> > > > completed.
> > > > 
> > > > Only difference here is that, the drivers requiring refclk from host will
> > > > send the notification once refclk is received, while others will send it
> > > > during probe time itself.
> > > > 
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > 
> > > You have removed the .core_init_notifier from EPC drivers,
> > > but the callback in EPF drivers is still called .core_init.
> > > 
> > > Yes, this was a confusing name even before this patch, but
> > > after this patch, it is probably even worse :)
> > > 
> > > The callback should be named from the perspective of EPF drivers IMO.
> > > .core_init sounds like a EPF driver should initialize the core.
> > > (But that is of course done by the EPC driver.)
> > > 
> > > The .link_up() callback name is better, the EPF driver is informed
> > > that the link is up.
> > > 
> > > Perhaps we could rename .core_init to .core_up ?
> > > 
> > > It tells the EPF drivers that the core is now up.
> > > (And the EPF driver can configure the BARs.)
> > > 
> > 
> > I don't disagree :) I thought about it but then decided to not extend the scope
> > of this series further. So saved that for next series.
> > 
> > But yeah, it is good to clean it up here itself.
> 
> If you intend to create a .core_deinit or .core_down (or whatever name
> you decide on), perhaps it is better to leave this cleanup to be part
> of that same series?
> 

I already added a patch. So let's do it here itself :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

