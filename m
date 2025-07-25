Return-Path: <linux-omap+bounces-4151-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108EB11D05
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 13:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A61837A66AB
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 10:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431412E3378;
	Fri, 25 Jul 2025 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ecf4Nay+"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DD61BD4F7;
	Fri, 25 Jul 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441239; cv=none; b=ef6sg/N+HFcLTg4KC0mT//OLHVp4ss5NzB1R0B/xDQo8LoYFVhIesZryenIuP7uUZk/98YCSPT6R7xPhPcfzfwtVerYpOkZo6N0ilDyzQ+xEsK7pm3/prKtaziPk0d9NuYEEgNZHk7uGJ39RGnY/s7xRBDC7FE24mRiJLF1VD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441239; c=relaxed/simple;
	bh=IFbdLct/XlwhI0CCt9Krv57xH4aepmQc/wV8PhqxXlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5JNo6c4k1tw2MZpHfQg62SrVgW+UoV4HMzPqu2mNJLalwW0jgpIcqzyjOkpZUHMkq7nzguP7dBluova7a1Mx+TgTIx0AKxPcrbQ8RpBIKya+qqoBuxaURGvLCECsJ4E59YkD6FphjxpAVEIEqc2tlujLAour1a/utw6ythdS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ecf4Nay+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9947BC73;
	Fri, 25 Jul 2025 12:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753441189;
	bh=IFbdLct/XlwhI0CCt9Krv57xH4aepmQc/wV8PhqxXlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ecf4Nay+jvm7qaSw1pKsJS+aA6w9KPFinLg45do9/DXKm4NlftA89lY5GzdOMOxeY
	 GKJzNngxQCLk3Vt1WczN1ITLRq82QCbtwk5YTmmx+gn6uW6cqwScK8KMyOiV9PQHZM
	 485HO/935In6WJZlFtSUbJxi8HFkvY1CVEgSGGI4=
Date: Fri, 25 Jul 2025 14:00:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 00/72] media: i2c: Reduce cargo-cult
Message-ID: <20250725110024.GA30386@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250725093805.GY11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C2D2D0577D4DA82D6AF58B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829C2D2D0577D4DA82D6AF58B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Fri, Jul 25, 2025 at 10:35:28AM +0000, Tarang Raval wrote:
> > On Fri, Jul 25, 2025 at 07:00:40AM +0000, Tarang Raval wrote:
> > > > On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:
> > > > > > > > > 2. In the regulator code, you can reduce boilerplate by using
> > > > > > > > >    devm_regulator_bulk_get_enable().
> > > > > > > >
> > > > > > > > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. You
> > > > > > > > generally don't want to enable power everywhere unconditionally, and
> > > > > > > > sensors very often need a guaranteed power up sequence.
> > >
> > > -----(1)
> > >
> > > > > > >
> > > > > > > The regulators are optional, we supply power to the camera sensor directly
> > > > > > > through dedicated power rails and there is no strict enable sequence
> > > > > > > required in this case.
> > > > > >
> > > > > > What exactly do you mean by "this case" ? Are you talking about one
> > > > > > particular sensor ? One particular camera module ?
> > > > >
> > > > > Laurent, by “this case” I meant the common scenario where power to the
> > > > > camera sensor is supplied by a PMIC regulator that is always-on. In such
> > > > > setups, the regulator is fixed and cannot be enabled or disabled from the
> > > > > driver, the sensor is always powered.
> > > > >
> > > > > This is what I’ve seen in most platforms, where the CSI input connector
> > > > > provides fixed 3.3V/1.8V power rails directly to the camera module.
> > > > >
> > > > > Of course, if the camera supply comes from a dedicated regulator controlled
> > > > > via a GPIO, then the driver would need to handle enable/disable sequencing
> > > > > explicitly. But I’m specifically referring to the first case, where the power rails
> > > > > are always-on.
> > > >
> > > > How does the sensor driver know which of those two cases it is dealing
> > > > with ?
> > >
> > > The sensor driver typically determines this via the presence (or absence)
> > > of regulator supply entries in the Device Tree. If a supply is not defined,
> > > it's assumed to be always-on (e.g., provided by the board via fixed rails).
> > 
> > Do we have sensor drivers that check the presense of supply properties ?
> > Drivers generally shouldn't.
> > 
> > > When defined, the driver retrieves and manages the regulator. This approach
> > > allows a single driver to support both cases, by treating supplies as optional
> > > and only enabling them when explicitly defined.
> > 
> > I don't see what you're trying to do here. A sensor always needs
> > supplies, regardless of whether or not they're always on. Drivers should
> > get the supplies with regulator_get() (or possibly the bulk API), and
> > then implement the power enable/disable sequences that the sensor
> > requires. If all suplies are manually controllable, this will produce
> > the correct sequence. If the supplies are always on, it will be a no-op.
> > That's a single implementation in the driver, you don't need to care
> > about the nature of the supplies, or their presence in DT.
> > 
> > > At comment (1): you gave two reasons why we cannot use devm_regulator_bulk_get_enable.
> > >
> > > What I’m trying to say is:
> > >
> > > You mentioned "generally don't want to enable power everywhere unconditionally,"
> > > but on almost every platform, the power rails are always-on.
> > 
> > "almost every platform" doesn't sound right to me. It does happen though.
> > 
> > > And regarding the second point — "sensors very often need a guaranteed power-up sequence"
> > > I don’t understand why this would be an issue. Even if we use devm_regulator_bulk_get_enable,
> > > the power-up sequence remains the same. So how is it not a good option in this case?
> > 
> > Because the bulk API enables all regulators in parallel, it doesn't
> > guarantee sequencing.
> 
> Except for a few drivers, almost all camera drivers use the bulk API, which suggests
> that a guaranteed power-up sequence may not be strictly required in most cases.
>  
> > Don't use devm_regulator_bulk_get_enable() in sensor drivers, implement
> > power enable/disable functions that do the right thing. That's the code
> > pattern I want to see.
> 
> Perhaps I wasnt clear in my explanation. If you look at the patch below, you'll 
> see that we are not changing any sequencing behavior.

You end up getting regulators every time power is enabled, and you don't
turn the supplies off at power off time. How is that even supposed to
work ? It completely breaks power management.

> I am not suggesting we use this API everywhere, only where it's appropriate and 
> doesn't compromise sequencing requirements. 
> 
> Best Regards,
> Tarang
> 
> ------
> 
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index da618c8cbadc..4dbf7215cef4 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -1176,8 +1176,8 @@ static int imx283_power_on(struct device *dev)
>         struct imx283 *imx283 = to_imx283(sd);
>         int ret;
>  
> -       ret = regulator_bulk_enable(ARRAY_SIZE(imx283_supply_name),
> -                                   imx283->supplies);
> +       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(imx283_supply_name),
> +                                   imx283_supply_name);
>         if (ret) {
>                 dev_err(imx283->dev, "failed to enable regulators\n");
>                 return ret;
> @@ -1186,7 +1186,7 @@ static int imx283_power_on(struct device *dev)
>         ret = clk_prepare_enable(imx283->xclk);
>         if (ret) {
>                 dev_err(imx283->dev, "failed to enable clock\n");
> -               goto reg_off;
> +               return ret;
>         }
>  
>         gpiod_set_value_cansleep(imx283->reset_gpio, 0);
> @@ -1195,10 +1195,6 @@ static int imx283_power_on(struct device *dev)
>                      IMX283_XCLR_MIN_DELAY_US + IMX283_XCLR_DELAY_RANGE_US);
>  
>         return 0;
> -
> -reg_off:
> -       regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
> -       return ret;
>  }
>  
>  static int imx283_power_off(struct device *dev)
> @@ -1207,24 +1203,11 @@ static int imx283_power_off(struct device *dev)
>         struct imx283 *imx283 = to_imx283(sd);
>  
>         gpiod_set_value_cansleep(imx283->reset_gpio, 1);
> -       regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
>         clk_disable_unprepare(imx283->xclk);
>  
>         return 0;
>  }
>  
> -static int imx283_get_regulators(struct imx283 *imx283)
> -{
> -       unsigned int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(imx283_supply_name); i++)
> -               imx283->supplies[i].supply = imx283_supply_name[i];
> -
> -       return devm_regulator_bulk_get(imx283->dev,
> -                                      ARRAY_SIZE(imx283_supply_name),
> -                                      imx283->supplies);
> -}
> -
>  /* Verify chip ID */
>  static int imx283_identify_module(struct imx283 *imx283)
>  {
> @@ -1480,12 +1463,6 @@ static int imx283_probe(struct i2c_client *client)
>                 return -EINVAL;
>         }
>  
> -       ret = imx283_get_regulators(imx283);
> -       if (ret) {
> -               return dev_err_probe(imx283->dev, ret,
> -                               "failed to get regulators\n");
> -       }
> -
>         ret = imx283_parse_endpoint(imx283);
>         if (ret) {
>                 dev_err(imx283->dev, "failed to parse endpoint configuration\n");

-- 
Regards,

Laurent Pinchart

