Return-Path: <linux-omap+bounces-1295-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A48B449B
	for <lists+linux-omap@lfdr.de>; Sat, 27 Apr 2024 08:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B0E9B217E0
	for <lists+linux-omap@lfdr.de>; Sat, 27 Apr 2024 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AF74205F;
	Sat, 27 Apr 2024 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhlE4v8u"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BA04175A
	for <linux-omap@vger.kernel.org>; Sat, 27 Apr 2024 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714200225; cv=none; b=shghNOhWY1tNSVJJOGMDubOMmFia35Fnr57RTK19I5oONLVDn6ldITTA+pSZO4voKxkkjKx0Y9K0YvdejCrAdsOr+zE9V9mOlv0tqpMIZmheB6m9xOSCnCvCJBwJLo6DrHbPhBe2t2TRdtNFaWfqx8YDqfzCxmnaGoRUXC5nus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714200225; c=relaxed/simple;
	bh=LPalAcWzxJ0yMmzch32JrWfIS3osx/TskoGrevHHB+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJmzIyMy6QFvIzmUWjJu78ODVjIKBCui3ODDrx5h0PNv0JkbRWDZ4tnZwNBLSTojukvGaNhtSEf10WVZZP1wtnjWpjjxXfxIbIziHd/FLIXoBmg2wynt8+l34uqFtGrBO9q2fUrtW916j4iGWMS7phKePGM9vCAo51gYZp2rels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhlE4v8u; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e3c9300c65so25863715ad.0
        for <linux-omap@vger.kernel.org>; Fri, 26 Apr 2024 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714200222; x=1714805022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eTGnh4hJsxF2w2JcjcnIEUBbWbOx1xRb7gasYjxARjc=;
        b=nhlE4v8uXrRITTAz2S2QDw3PeQ4pWeCsq/RImGuBIbekxAa1CzHLpt88wd8YkSCnzj
         m/p25FWigh70lcWUBjikG1sBpak8ZEEjCpUx45P2DtaLkE3RqSTvHmyiE40IwMO0hT5J
         IfDIXU0LWqRe1K47KTRMZ/YKKOynz3XA7CsU/aHuOIfHQJFyKW5E9gk36mTVKhu/2kc9
         FgpkIC823duU/jDf2ZHIHPKQPLk1G634V1aV2JVXUzFXNxAZdlu5pNiLMts83SCbxrsw
         82pci51rxM7GSNGzuCN3SR32YdzvoHCEJbKpDm+73/iqeDZjuvkqCHQ5CSfVHHUEIxnL
         gpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714200222; x=1714805022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTGnh4hJsxF2w2JcjcnIEUBbWbOx1xRb7gasYjxARjc=;
        b=t0VP9pLtDKEo18AK/YOIn1wOT0VfVhrjFYjEYnBi4tPDwqD3UZaloXfjzjGBAS5sY2
         wbbGCXqu2v+AbMd+p4kQEZvztqrL327Rz29l20DhmjX/sa9qdjONlGBdltS6DClTg4LE
         4FOrzHY2MUSRu/xywfUHntAhhaTvkkf/RxGSEzKzFDM93R+IZdpfGvbo0n0myXVvyIUF
         DdurNI+MJAmHk8whKvPdZz129rk5/HtupzyNnoLBWJjGrMaUBzUc1A6GI4r3mk4AFVL3
         KfeYHB2HM5Pd11i4j92g4hCMiFeztWfuDLZkAR43Cb8P5I1m2Z0nNIJZSKI1TQFdcESL
         O0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5qTGQPXlAflLCcIjF6cOfkBTDzux4nJNZqV6KgsfafSjZmjJUgsy4iuz80YNcPDS1sdicUMy7VnWv8Pr1b32aj/XXECAHhMKWwg==
X-Gm-Message-State: AOJu0YziIj5u7guSOns1o8KxulbwpLIUeflPZXFMJ5SeFjGON2erTEV2
	JifQVwHrv2dxmzSsu5WJubGS+45PQobX8DlGjjxT8tUbcWg9whBy/qJ1Of7fZA==
X-Google-Smtp-Source: AGHT+IHUmT02EuAP4GA34txQXaVB3I9YqYCabXLgvXGRga6DshOVeDQbPJbpV0gl5wTwZcs3Pq2Smg==
X-Received: by 2002:a17:903:240a:b0:1e9:6609:37d4 with SMTP id e10-20020a170903240a00b001e9660937d4mr6065899plo.9.1714200222300;
        Fri, 26 Apr 2024 23:43:42 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d89500b001e44578dccasm16507119plz.254.2024.04.26.23.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 23:43:41 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:13:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240427064329.GB1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>

On Tue, Apr 23, 2024 at 08:19:06PM +0300, Andy Shevchenko wrote:
> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 37 ++++++++++-----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 917c69edee1d..d620f1e1a43c 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -11,14 +11,13 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
>  #include <linux/mfd/syscon/imx7-iomuxc-gpr.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_address.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -107,7 +106,7 @@ struct imx6_pcie_drvdata {
>  
>  struct imx6_pcie {
>  	struct dw_pcie		*pci;
> -	int			reset_gpio;
> +	struct gpio_desc	*reset_gpiod;
>  	bool			gpio_active_high;
>  	bool			link_is_up;
>  	struct clk_bulk_data	clks[IMX6_PCIE_MAX_CLKS];
> @@ -721,9 +720,8 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
>  	}
>  
>  	/* Some boards don't have PCIe reset GPIO. */
> -	if (gpio_is_valid(imx6_pcie->reset_gpio))
> -		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
> -					imx6_pcie->gpio_active_high);
> +	gpiod_set_raw_value_cansleep(imx6_pcie->reset_gpiod,
> +				     imx6_pcie->gpio_active_high);
>  }
>  
>  static int imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
> @@ -771,10 +769,10 @@ static int imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
>  	}
>  
>  	/* Some boards don't have PCIe reset GPIO. */
> -	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
> +	if (imx6_pcie->reset_gpiod) {
>  		msleep(100);
> -		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
> -					!imx6_pcie->gpio_active_high);
> +		gpiod_set_raw_value_cansleep(imx6_pcie->reset_gpiod,
> +					     !imx6_pcie->gpio_active_high);
>  		/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
>  		msleep(100);
>  	}
> @@ -1285,22 +1283,15 @@ static int imx6_pcie_probe(struct platform_device *pdev)
>  		return PTR_ERR(pci->dbi_base);
>  
>  	/* Fetch GPIOs */
> -	imx6_pcie->reset_gpio = of_get_named_gpio(node, "reset-gpio", 0);
>  	imx6_pcie->gpio_active_high = of_property_read_bool(node,
>  						"reset-gpio-active-high");
> -	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
> -		ret = devm_gpio_request_one(dev, imx6_pcie->reset_gpio,
> -				imx6_pcie->gpio_active_high ?
> -					GPIOF_OUT_INIT_HIGH :
> -					GPIOF_OUT_INIT_LOW,
> -				"PCIe reset");
> -		if (ret) {
> -			dev_err(dev, "unable to get reset gpio\n");
> -			return ret;
> -		}
> -	} else if (imx6_pcie->reset_gpio == -EPROBE_DEFER) {
> -		return imx6_pcie->reset_gpio;
> -	}
> +	imx6_pcie->reset_gpiod =
> +		devm_gpiod_get_optional(dev, "reset",
> +			imx6_pcie->gpio_active_high ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
> +	if (IS_ERR(imx6_pcie->reset_gpiod))
> +		return dev_err_probe(dev, PTR_ERR(imx6_pcie->reset_gpiod),
> +				     "unable to get reset gpio\n");
> +	gpiod_set_consumer_name(imx6_pcie->reset_gpiod, "PCIe reset");
>  
>  	if (imx6_pcie->drvdata->clks_cnt >= IMX6_PCIE_MAX_CLKS)
>  		return dev_err_probe(dev, -ENOMEM, "clks_cnt is too big\n");
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

