Return-Path: <linux-omap+bounces-3560-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA0A81D22
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 08:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3607461D43
	for <lists+linux-omap@lfdr.de>; Wed,  9 Apr 2025 06:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173181DE3BE;
	Wed,  9 Apr 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xN78ymuA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14772171A1
	for <linux-omap@vger.kernel.org>; Wed,  9 Apr 2025 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180603; cv=none; b=LfjXe4XDPGn0mLHqYiMuQ3DqEOCUdkbgXGaGyI3j9SGdmvBWYEY+3iGYuAX2tauY2e3RJcmGOqRN9XjpJy/XrRtVAeXgZvo8kCqsD4HOV8etO5mncngiCWBKHrTEfHHTrcDcue+FGn+uBdEfD7Va/RJyJbREKOAxeZBNAS1SypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180603; c=relaxed/simple;
	bh=htJb0hi3i8Uumf4NXM2uKOYATRawaMO2ZOlca+fgrJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvURuGVur1ogqLGSd0S9yFJWUsZFuC7mhm+NBISSKDtQ1KMM0DM8+J8/zdM+OWjy1h4zrA5bjVSeNCxjxIGMJ0CrPrq30S865sKOgIIrZyd68+AES+ze0ZiHTpzVV3brP9fUTLTABaY6q1akDlHu6dKfTkoPQq5oNDq+g5TKHO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xN78ymuA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b00e3c87713so1624592a12.2
        for <linux-omap@vger.kernel.org>; Tue, 08 Apr 2025 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744180601; x=1744785401; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyLHBKKtBdcGeGPsMw3f6Qv4QssdQHR7Pid6EQwgQ8w=;
        b=xN78ymuAj77FKAMt+DD5OW2V6k9fRGCUP+uexXXWMI+QX8audVZ8rM2LhtvFA6TpwP
         0taWsSLOgCJW9/LKuwyW9PAWLfc2Lzkn3gwpqEbYYzmjJFfT5Gwhr8+fWQ5WNzY0sZZz
         OoXQ/NFPbEBeDRRMPLFH/kFEHjl6Nk2EotbmaD1qKS52biAtPeSw+2UYHVp0updP0toV
         dMnwkMkE0NtYpZWcbdBj4gaCZQVyDM1G+TctPLAVxouvLPai9Ylg9D92CXXeqHCdMwG0
         y2mPwolhvOyiyl5LIeP+RIrB313UTp0pY0SWSpodg/M369m2EIGHR/YQrz5/Dqs3HbvE
         X1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180601; x=1744785401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyLHBKKtBdcGeGPsMw3f6Qv4QssdQHR7Pid6EQwgQ8w=;
        b=P0k6E56iDjoM+/K3J66/ZHL0Qe4xtmcB3y6q/nJdPcIRTQPJGy+y4qOlbns4Gc3AOL
         GJi8xG12bWC0p9GVWUf9bfohFU7cEjORVWyePaorC1B4cRXb+1Gaoa8Sg+P/IUk/OFGX
         KSBhymKPiOK8QNcy+8u/64D2Rk4mQ/U8po+0ObaWWpT1gU6mmQs+QiMYwRP5SQT8xPtz
         XHV5ZLZglasRcRuRYFdhR+KZ0c3j42KGN+RgxmSp9mVC0CBySbo0XTP/uQc12rh4X+MY
         jDxFrUYHnm4A7KUcizTmmGAZ9vHaV78M9Gz7fGYKRxz0UXjesgoDN6VTUBwYQXx9G5bQ
         S6UA==
X-Forwarded-Encrypted: i=1; AJvYcCX98ZoyFb6WV5Ohw9TJqLrMpJENfBzsHrrH7bJ9C7T/8F6umJA7PA0tsaJP4wV/IkevG/imPmvww/88@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YPvWP73DiW/820WtxSq96fuP1vn+pElSjSqmP2+RnLzwbtKH
	l+YsQZ9JyX0ANiyRCym6/0a1JW0TdVOBKscBBN3l6nKERKbNJMfBPrlQys8uSg==
X-Gm-Gg: ASbGncs+2Z61W94KqwihUQYImF0vh8/3BWdxvMcd9QNCGPLNar82thtOICG87tDWuzp
	uRsD/zj555jyvRrdm+PM/fYeU1cVS92wNhmRwpX6A44s9X5V9lGkelrW9RoCpUbk4pA8OtGbVh+
	0qnCgxmOGWKxu/Vtfwnx4HRsmp6MxRSF1j4XIbs+VLdkiM7anCt7CiBNE+LIpq1S0XnjPuhf7g5
	HT+73/rIbXifDOf1KNOIDp7KCNPQ3hB5W9zEK8E60pLe1FFzJye3W9uV3zo7AqcRwxJFcB5Pnh6
	0sDpFHzxPbZfTqF8rUPeGGKjaTupJFZM4Q1Yt5zEfF/VxKTJlmw=
X-Google-Smtp-Source: AGHT+IHsJVrpDdInYLAhJaCNmHpq2veRp8h4bN1zX1HiVkJrECPermHzrundQFT6RfXaFpJfsW7aQw==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-201591580c4mr2941076637.8.1744180601350;
        Tue, 08 Apr 2025 23:36:41 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e382a4sm510787b3a.96.2025.04.08.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:36:40 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:06:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org, 18255117159@163.com, 
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 4/4] PCI: j721e: Add support to build as a loadable
 module
Message-ID: <zsxnx7biwogov5dw5yiafkgk6tsrtspac75bjbrca5uevweaim@ly67hwfyk7qh>
References: <20250330083914.529222-1-s-vadapalli@ti.com>
 <20250330083914.529222-5-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250330083914.529222-5-s-vadapalli@ti.com>

On Sun, Mar 30, 2025 at 02:09:14PM +0530, Siddharth Vadapalli wrote:
> The 'pci-j721e.c' driver is the application/glue/wrapper driver for the
> Cadence PCIe Controllers on TI SoCs. Implement support for building it as a
> loadable module.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v1:
> https://lore.kernel.org/r/20250307103128.3287497-5-s-vadapalli@ti.com/
> Changes since v1:
> - Based on feedback from Thomas at:
>   https://lore.kernel.org/r/88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com/
>   the "check" for a non-NULL "pcie-refclk" in j721e_pcie_remove() has been
>   dropped.
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/cadence/Kconfig     |  6 ++--
>  drivers/pci/controller/cadence/pci-j721e.c | 33 +++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 82b58096eea0..72d7d264d6c3 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -43,10 +43,10 @@ config PCIE_CADENCE_PLAT_EP
>  	  different vendors SoCs.
>  
>  config PCI_J721E
> -	bool
> +	tristate
>  
>  config PCI_J721E_HOST
> -	bool "TI J721E PCIe controller (host mode)"
> +	tristate "TI J721E PCIe controller (host mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	select PCIE_CADENCE_HOST
> @@ -57,7 +57,7 @@ config PCI_J721E_HOST
>  	  core.
>  
>  config PCI_J721E_EP
> -	bool "TI J721E PCIe controller (endpoint mode)"
> +	tristate "TI J721E PCIe controller (endpoint mode)"
>  	depends on ARCH_K3 || COMPILE_TEST
>  	depends on OF
>  	depends on PCI_ENDPOINT
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index ef1cfdae33bb..8bffcd31729c 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -15,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -27,6 +28,7 @@
>  #define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
>  
>  #define ENABLE_REG_SYS_2	0x108
> +#define ENABLE_CLR_REG_SYS_2	0x308
>  #define STATUS_REG_SYS_2	0x508
>  #define STATUS_CLR_REG_SYS_2	0x708
>  #define LINK_DOWN		BIT(1)
> @@ -116,6 +118,15 @@ static irqreturn_t j721e_pcie_link_irq_handler(int irq, void *priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static void j721e_pcie_disable_link_irq(struct j721e_pcie *pcie)
> +{
> +	u32 reg;
> +
> +	reg = j721e_pcie_intd_readl(pcie, ENABLE_CLR_REG_SYS_2);
> +	reg |= pcie->linkdown_irq_regfield;
> +	j721e_pcie_intd_writel(pcie, ENABLE_CLR_REG_SYS_2, reg);
> +}
> +
>  static void j721e_pcie_config_link_irq(struct j721e_pcie *pcie)
>  {
>  	u32 reg;
> @@ -633,9 +644,25 @@ static void j721e_pcie_remove(struct platform_device *pdev)
>  	struct j721e_pcie *pcie = platform_get_drvdata(pdev);
>  	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
>  	struct device *dev = &pdev->dev;
> +	struct cdns_pcie_ep *ep;
> +	struct cdns_pcie_rc *rc;
> +
> +	if (pcie->mode == PCI_MODE_RC) {
> +		rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
> +		cdns_pcie_host_disable(rc);
> +	} else {
> +		ep = container_of(cdns_pcie, struct cdns_pcie_ep, pcie);
> +		cdns_pcie_ep_disable(ep);
> +	}
> +
> +	if (pcie->reset_gpio) {
> +		msleep(PCIE_T_PVPERL_MS);

There is no point in adding a delay before PERST# assertion.

> +		gpiod_set_value_cansleep(pcie->reset_gpio, 1);

This is not PERST# assert, isn't it? Typo?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

