Return-Path: <linux-omap+bounces-2072-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D19680A7
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 09:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93EA2813AE
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 07:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23961741DA;
	Mon,  2 Sep 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jm+wZYrN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266BD155A52
	for <linux-omap@vger.kernel.org>; Mon,  2 Sep 2024 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262425; cv=none; b=DHk5itLg9DT2Oj3/yCTl1DvHJvCp5iI+kOK5sQERpJTnhO1afhpsYSsNcsszYT/gu4fjPGvAapDIfvuhP75bg1e+8/QLWarpcn+6rbA4iR1wPOBOuZQr0V6drYAuDtvDIPPSfSAqN0GDMgqgu23ZwqomPDAtpNMUa0JEGAyAeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262425; c=relaxed/simple;
	bh=keakdINUGQQykwIW03n+sUlMVBu4gHUpnFRuqxOzes8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnz4Q7VugtaKElRy7PNmkAmeCmnoECcF5DZBLc7JXEh+ourO0cXinf/nBCKe/aP3wTaBfple9L/ehhXi7kMnyZUk06/6Zjn0IwZFlEQFmsGgt0vVF/3q6rXZkXUXYhcRhNzNC2PgIs8DYCzzTASbswrd9CxTaFJH3mlliatysoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jm+wZYrN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-715c160e231so3398785b3a.0
        for <linux-omap@vger.kernel.org>; Mon, 02 Sep 2024 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725262422; x=1725867222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K/HbDe/HSz6pkXiW0JkEGHwpwJAfk4nlDzkL2IIO73Y=;
        b=Jm+wZYrNDyp4ha/GwbJDLllPKL+7RKSeNNjKIG0ICQjbgaDpxjT3hVvjxzmnVps1Tk
         ar1rlHb4VlEom0S1pPMhX59BuQ9SpqgkME6RWt/g4SNLTk8Ykdj30gAOZb7Sd7sYNT/F
         kYPKojlaqGDq/kW+jPmpVJN3ubeGJkw9XBz+nOFLG/M325ZXVoCawSJjLOQJf5PQsHY9
         p9YQoJGrywTn+H/L3Gux1NkUC9QKBU+Ne78dblqUB/PR33RznbDsHP+6ApPIJULbMTzO
         BOhVVQEB8XITSn1MPLyZmDTWp3hMEFXkPlcuI3RZ4fNsh0iqHvl1SuYut461pAFL+3x0
         FEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725262422; x=1725867222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/HbDe/HSz6pkXiW0JkEGHwpwJAfk4nlDzkL2IIO73Y=;
        b=cMrWS41HqSNBvm+EOra1BnbYIKBnAIw0WrmrXGtYsu89XOYZwnyVvlZthiy7nJ27Vn
         lKtLRFGgpDXASoDyTNzHAZGHQh887Ly9GAsWXVBlcsXStfGXQeiHxE+TbLyv7Dwgvxh/
         v1tqgfvgo/Un9av4LnRCqhRPrDSfhjMpT+B3C19MuSp+AotCTA9lFcMdYvyw/7C5ckEp
         m1lCsfk4iq7rfCKw4cYD8ZEd9l7SjUBsPfbataHnZdqon2ANTdF2T74QuypFej1h56fp
         imhKDisPGJydR1Aeo/yjCTj6+XeCzoI1SvaHx+i/o0jsOPJeWLx9M0L/hch2e1PN60w4
         qcmw==
X-Forwarded-Encrypted: i=1; AJvYcCWVptUUTs63wDoCp6DvpwgLTozysIJ29Pv6+uIURGT7O40cumrq3KWqwCc2wkWSYluPxAO7bKBi4B5n@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhYLueQjRvufUIQitpaOpLvz0izj9+bLDjRIEVtMzcgmtNj1O
	Mryk5BNMDgWEo6s4yfg1sIxM1gaWXp06YF5FJtGk6o4YoAN1FyYSmn+5rfizEw==
X-Google-Smtp-Source: AGHT+IEQZNvphTM9Na+10ZEQH+EVEVCFHgFa3BpTs1lm8QBLXCV8lFWg/7nLZZbMHQm9nljqgMjFIA==
X-Received: by 2002:a05:6a20:ae86:b0:1cc:e41d:58f0 with SMTP id adf61e73a8af0-1cce41d59b5mr10376233637.13.1725262422332;
        Mon, 02 Sep 2024 00:33:42 -0700 (PDT)
Received: from thinkpad ([120.60.58.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152cd543sm60805665ad.76.2024.09.02.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:33:41 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:03:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, vigneshr@ti.com, kishon@kernel.org,
	j-keerthy@ti.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-kumar1@ti.com, srk@ti.com
Subject: Re: [PATCH 1/2] PCI: dra7xx: Fix threaded IRQ request for
 "dra7xx-pcie-main" IRQ
Message-ID: <20240902073336.fwyjm27ruvfb7gva@thinkpad>
References: <20240827122422.985547-1-s-vadapalli@ti.com>
 <20240827122422.985547-2-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827122422.985547-2-s-vadapalli@ti.com>

On Tue, Aug 27, 2024 at 05:54:21PM +0530, Siddharth Vadapalli wrote:
> Commit da87d35a6e51 ("PCI: dra7xx: Use threaded IRQ handler for
> "dra7xx-pcie-main" IRQ") switched from devm_request_irq() to
> devm_request_threaded_irq() for the "dra7xx-pcie-main" interrupt.
> Since the primary handler was set to NULL, the "IRQF_ONESHOT" flag
> should have also been set. Fix this.
> 
> Fixes: da87d35a6e51 ("PCI: dra7xx: Use threaded IRQ handler for "dra7xx-pcie-main" IRQ")
> Cc: <stable@vger.kernel.org>
> Reported-by: Udit Kumar <u-kumar1@ti.com>
> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 4fe3b0cb72ec..20fb50741f3d 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -850,7 +850,8 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  	dra7xx->mode = mode;
>  
>  	ret = devm_request_threaded_irq(dev, irq, NULL, dra7xx_pcie_irq_handler,
> -			       IRQF_SHARED, "dra7xx-pcie-main", dra7xx);
> +					IRQF_SHARED | IRQF_ONESHOT,
> +					"dra7xx-pcie-main", dra7xx);
>  	if (ret) {
>  		dev_err(dev, "failed to request irq\n");
>  		goto err_gpio;
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

