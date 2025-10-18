Return-Path: <linux-omap+bounces-4702-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ACBBECCCB
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 11:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D0D583261
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 09:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A025428642B;
	Sat, 18 Oct 2025 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gp/wSoqa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D5279DA6
	for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760780964; cv=none; b=eOqzFlssE2kj2IpYFJUimj1zfxw7lub8YmdbCmAqNg+t2ge+ItARuEnv5F4ry8HcS3tlhdrofMNUHh1onraKftSWu3fu75NTNVaGcvIWcUUvfyy4WpTdN2HZFUaKzZVrkYNTP1Ti8TihYCL/ujXV7j7ed4iryXUSEtp5wRWGyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760780964; c=relaxed/simple;
	bh=aBrzw1BnOAqm6Mv2zDnLYL50/v6f/umcO6E955ZpIuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjjrRDVyZKw3fh2BHBWWy0PD2fQQvD8a8qfGILunkQn9xeVi7fu9GbX1s6btIS7rtdkiFa0keWc1wOh5ghD3JagWFa8r6lGfothNjfspR81IwRKEMedt36vrJXqHOhEJaVa23T9RzjsKQUM30m/igOVU20BCHXMBeYQHVcbNeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gp/wSoqa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471b80b994bso3680395e9.3
        for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760780961; x=1761385761; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJ1k9LDoSOqmBSAsuY78K6WJBTUTLHwdE0LZYjE4bkk=;
        b=Gp/wSoqaX5yfOGvI0KHhZuqmHzwPmG3YHcTFh77Q/XbXU55R3vXwRcUYQzD5oTDZ0B
         Lvud5gtAjtHKuabXdph34CMQ16LX6H110RljqAddb0ZXkyEZqtq/FSVaewqbJ+K8zC8e
         gP3Sfno2q/IEzkuMstw5OmgNLTV+kKuAnax8R911IrnbjSTUm7tmY7tx951RSsLKVK4U
         7TLeyy9zBnKeKn9rHDMwR7j+G/Z69BzZFVCqvkx3cdF6MPxjf3A30LltcN4wbB1QVk4U
         AsKi+U75YcDCJGyh66Av0JhVabhT03YO/+kPGbfV8u15c7GfNuIeR+WWk52hr9Wg0Icv
         QrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760780961; x=1761385761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ1k9LDoSOqmBSAsuY78K6WJBTUTLHwdE0LZYjE4bkk=;
        b=csdNGqVQz92ptYP7w7BhIMXRqamje/YjYcRjLsf0WstQJJYnk/k9p/2fNJt1FNkL/A
         +dxTA7/sJFR0+Q3eecvw+Wh3qtWOzxHYI2MzEAqhUhmEnZJiMkX9J+FaGt0nqm3r5w4x
         iy3/dbiSz1VDmr8aXHyikVOMECHW2cN1ydXa5cpV6KJS2dyDwEcI8DqvMJjcasQVcgcj
         gDcjsxWAleUY0onoFFKbAxX4DbhgYEomrJCz38vBFSQSoJUfI1UP5EROYzIVmy5QYnvL
         SoBPHuzEJ/Ff2GP7ddOp9HPow5WeNQRjp3RMO/5hlL3Vb3q7eF7BoldglNBv26OdRIUl
         UvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZlEYVrFnuNYc83eaQU5aVuuqg8EuNh9TW68SPc2ArVjyPLSIvTWvWzOHza0j/QVBJVtls4ii/E/r@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLPX0eLJAE6EyVrplMQ3kP8exhDJTOOM743FfRA+dra2rtMc0
	Y08FXoGUEmux/hPNHxA86i9ydIdJCzRZorTRk1Q0H8levzVTFinHhB2E55+Yivak7nU=
X-Gm-Gg: ASbGncsMOeBmiAnQlvCF+ndZY5pR+BN0UXLHxFRbyz/Ht/N+AT5qEuQxfiKvquaTRWi
	cGe/jYPTRYIr4BCWqbsHp4w32G8/yy0KCyVCT3KUaAhx5wDBfP1AxGH72z9NHJvlx0oQoVXnmdP
	+uZsr14V4WQd1LwlBFb3w5lzLgmVwNu1p8BMU3DTocpfkslr2mRdh6Fb4vP7/6OU+tpzAQVgiMy
	WSGCey707bmCKHn2Hujtoz5didqKieVgR+YS3rUUaSu5cz2m13T6G9dhYoe/sNIuEu6YlD/M+64
	cPiqsP68+kpOBncYnp3XEkiwebojiaLzu1Acx+LLRCWCsDfirM5bqoX5CR66MDDoNTSXwWMmyyC
	PsH2gU5isFyValikGeORRM8cxlms2sxh7AGWPI/MC52WbWymfbwHD3ga5VwGPbvpEnd4+F//aS/
	xfzX7WAg==
X-Google-Smtp-Source: AGHT+IF4PmKFPPexasdAngpm6lCQGA4zlUjMCH/pf+rmfZzvnzRywedipAIMxVKthaY73oX1yJKtZQ==
X-Received: by 2002:a05:600c:190f:b0:470:feb2:e968 with SMTP id 5b1f17b1804b1-471178b125amr50060315e9.15.1760780960846;
        Sat, 18 Oct 2025 02:49:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3d4csm3936689f8f.19.2025.10.18.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:49:20 -0700 (PDT)
Date: Sat, 18 Oct 2025 12:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
Message-ID: <aPNineCsVgUyD6xW@stanley.mountain>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
 <20251014113234.44418-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014113234.44418-3-linux.amoon@gmail.com>

On Tue, Oct 14, 2025 at 05:02:28PM +0530, Anand Moon wrote:
> Use devm_clk_get_optional_enabled() helper instead of calling
> devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> the error handling and makes the code more compact. This changes removes
> the unnecessary clk variable and assigns the result of the
> devm_clk_get_optional_enabled() call directly to pcie->refclk.
> This makes the code more concise and readable without changing the
> behavior.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: Drop explicit clk_disable_unprepare — handled by devm_clk_get_optional_enabled
>     Since devm_clk_get_optional_enabled internally manages clk_prepare_enable and
>     clk_disable_unprepare as part of its lifecycle, the explicit call to
>     clk_disable_unprepare is redundant and can be safely removed.
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 9c7bfa77a66e..ed8e182f0772 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  	struct cdns_pcie_ep *ep = NULL;
>  	struct gpio_desc *gpiod;
>  	void __iomem *base;
> -	struct clk *clk;
>  	u32 num_lanes;
>  	u32 mode;
>  	int ret;
> @@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  			goto err_get_sync;
>  		}
>  
> -		clk = devm_clk_get_optional(dev, "pcie_refclk");
> -		if (IS_ERR(clk)) {
> -			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
> -			goto err_pcie_setup;
> -		}
> -
> -		ret = clk_prepare_enable(clk);
> -		if (ret) {
> +		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
> +		if (IS_ERR(pcie->refclk)) {
>  			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");

This isn't correct.  It's assigning ret to itself when it should be
assigning PTR_ERR(pcie->refclk) to ret.

regards,
dan carpenter


