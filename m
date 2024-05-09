Return-Path: <linux-omap+bounces-1361-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E328C0A75
	for <lists+linux-omap@lfdr.de>; Thu,  9 May 2024 06:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52CD01C210C3
	for <lists+linux-omap@lfdr.de>; Thu,  9 May 2024 04:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745721487CD;
	Thu,  9 May 2024 04:25:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20421487C4
	for <linux-omap@vger.kernel.org>; Thu,  9 May 2024 04:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715228700; cv=none; b=mKx2S7dGwP+NpZ5HSKszqdduwwgMImsGx5Y1QuxeenGslnxpNMdhtb1YQ8p7/aWXR91Tcqa3/Z8Cnt8IaTunNaNQPc8X2yzxue6Qnw09ZebENj8oH3d18FtFe5QBeq6GX0gFsmyrE4G5Qf5d5WODGXz10rXwdYu7wYAfbUc79f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715228700; c=relaxed/simple;
	bh=wbluDtpkgkqI4b6uOnSnk0JaOqE8O/8A4tFQH+1zXWw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YODkIHMGmSa3N2fvj7/6KSk9tBUy083K4edVOBtd1kTsE3LPWxTsxKWf2GziU2yNI0HDAcygofTblfAPz56pCqniP6qWQrc1U/rTtyAKLp9vRJIjva9KAGaVQXYzZlevC8emW5iIy302IfeXr1xNUTwW64RRGyFbYIc5GYyP6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 14224eb4-0dbc-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 07:24:52 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 07:24:51 +0300
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <frank.li@nxp.com>,
	Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kwilczynski@kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZjxQE8h0-BABxybu@surfacebook.localdomain>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
 <AS8PR04MB867668870DD2DC029C8B98048CE62@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867668870DD2DC029C8B98048CE62@AS8PR04MB8676.eurprd04.prod.outlook.com>

Thu, May 09, 2024 at 01:24:45AM +0000, Hongxing Zhu kirjoitti:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 2024年5月6日 22:21

...

> > -	imx6_pcie->gpio_active_high = of_property_read_bool(node,
> > -						"reset-gpio-active-high");
> > -	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
> > -		ret = devm_gpio_request_one(dev, imx6_pcie->reset_gpio,
> > -				imx6_pcie->gpio_active_high ?
> > -					GPIOF_OUT_INIT_HIGH :
> > -					GPIOF_OUT_INIT_LOW,
> > -				"PCIe reset");
> > -		if (ret) {
> > -			dev_err(dev, "unable to get reset gpio\n");
> > -			return ret;
> > -		}
> > -	} else if (imx6_pcie->reset_gpio == -EPROBE_DEFER) {
> > -		return imx6_pcie->reset_gpio;
> > -	}

> Please correct me if my understand is wrong.
> The "reset-gpio-active-high" property is added for some buggy board designs.
> On these buggy boards, the reset gpio is active high.

This is my understanding too.

> In the other words, the PERST# is active and remote endpoint device would
> be in reset stat when this gpio is high on these buggy boards.

Yes.

> I'm afraid that the PCIe would be broken on these boards, If these codes
>  are removed totally,

No. Linus W. explained in the previous version review round how it's supposed
to work.

> and toggle the reset GPIO pin like below.
> ...
> gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0);
> msleep(100);
> gpio_set_value_cansleep(imx6_pcie->reset_gpio, 1);
> ...

It's not the code that this patch adds. I'm not sure if I understand starting
from here what you mean.

> By the way, this reset GPIO pin should be high at end in
> imx6_pcie_deassert_core_reset() if the imx6_pcie->gpio_active_high is zero. 

This seems a terminology mixup. You probably meant "inactive".
And this is exactly the case with this patch.

If you start thinking in terms of "active"/"inactive" you will see that there
is no contradiction and no behaviour change. The quirk itself is located in
gpiolib-of.c..

-- 
With Best Regards,
Andy Shevchenko



