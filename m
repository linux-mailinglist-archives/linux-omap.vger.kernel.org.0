Return-Path: <linux-omap+bounces-2073-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A249680CC
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 09:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B571F2167F
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 07:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA1A176FD2;
	Mon,  2 Sep 2024 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WasXQ86F"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450814900E
	for <linux-omap@vger.kernel.org>; Mon,  2 Sep 2024 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262859; cv=none; b=YpIYJu9SICWj73a1XaQdKIQYl/7ncsTIphHJqcd8cH/2CLH+25VRoZPEn2cg7kVUO1gt5NzU9wLa08b2WQEQmdD8kg1yKRWzP6g6sx7IyiI7uZPiYbKcySYO2MpjYVmqQ8LRdU87pZfnM3njFMRoUyInnlCOlaOpvp42qad8m4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262859; c=relaxed/simple;
	bh=WgJme7hGpv0hMY6eb8C4eG1bm+pLXb4XDsw7qdVWsGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aotSpHACz3PDgKQ/DWdLWSzVDgx+qG5ga9O1s6FcTWsTzOo3HweO23u8lEiJ2wqeLQTWbWMZoBW2JgFaHMGj9Bhqy9NLodxCrk8sayUbMV06vnD+Si74XLqjE3ItTM8KgUc23WOYkKDXny1eg+RJ6Ljf4j4+MAYWAwlPTPBXD64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WasXQ86F; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-204f52fe74dso34422725ad.1
        for <linux-omap@vger.kernel.org>; Mon, 02 Sep 2024 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725262858; x=1725867658; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yttwNUw7d3dDFgywga8u4jHUr7TP2Q6BQGVJkPnT8/Y=;
        b=WasXQ86FZcvvm+3Y+y3HG4gWgZ9z91MOTHNqsdXEkC5E9ecnDaqYSDWu/Tny7BdvTK
         fLQWbHvJpmwoAIFlrM6lsTv311Z2l/21TQy6Zc5jUCffTKaJm1p8T1xG1Qot5l703f47
         GeDgztLNa2I3UQy0jYaVdCll+6VN60JnEPvJRXiyIrj2FaHUrLAwmg/hUk666fJjl50c
         oT9EWczUrx3Y63zVKXdSFcrHw/hzFIUTCwplas9u7VmX98VSBXtk0HNwbRzBljoOQbgv
         WWR9iThq/w/zRHp8cbkEOpWJESp1N1mcyO5a/DFac3BxC74aEKe6unrl2mIxfVrb7F05
         qrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725262858; x=1725867658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yttwNUw7d3dDFgywga8u4jHUr7TP2Q6BQGVJkPnT8/Y=;
        b=wWSwJa5lUjC48lTxLNedI2HPO44v5HsOOFYWboPsRgRkXrKIpTEJkrz8E9//HKOD1z
         7hqT+1dL31s5XMs2lCg7fqqbJ+Y+OIM+w9TOsdep1kbeCC0qRWdXap+tT5KzoTfMNnm/
         JCBw/Hm+DsPuAMlqPulO/nhnxAMqr2xTphfTJL2/UNSwvBAyKfc7QPwISaMJSigy5MDF
         3UiCBKrjOnCFl+tmxcAgJm8dSFJiT9xiJbY25NgzFgY4Vpwc9BSkMPpF42Yykf5cWFxZ
         1slZZg4AF2HCLEpUEt79zHEKjbliNOfTrCbw+hz5dx3gt3QodymODYiqOF4o6M65rijE
         Tf8A==
X-Forwarded-Encrypted: i=1; AJvYcCWrBYKO6r2bnusZHNh5eSuSGqAkRr5w5VJvV1eU47o3zHsucQe3N07Z1Y7RLavM/AjtvBvHzlUoJ7+T@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEm2SQRBNQ0NNdVdMOgZ0Z46bbc/nDYm4EbVTfE3oVzE6d9VR
	wKoSLrIWhL17t9Ml4Rj+qN57bKZKUN3CGoQ2SWAzZmIF1HGHL6XrC+lXDM0SfQ==
X-Google-Smtp-Source: AGHT+IEQIMeGcVOrgzVo/cb19D0ZFZOM5enF/X/Dx2AucrfaI9oErKrbz2WEP3NOKD3AcRxNn08Tcg==
X-Received: by 2002:a17:903:2348:b0:202:3469:2c78 with SMTP id d9443c01a7336-2054660159amr69405725ad.28.1725262857758;
        Mon, 02 Sep 2024 00:40:57 -0700 (PDT)
Received: from thinkpad ([120.60.58.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155673a2sm61188095ad.303.2024.09.02.00.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:40:57 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:10:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, vigneshr@ti.com, kishon@kernel.org,
	j-keerthy@ti.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-kumar1@ti.com, srk@ti.com
Subject: Re: [PATCH 2/2] PCI: dra7xx: Fix error handling when IRQ request
 fails in probe
Message-ID: <20240902074051.h7miwo6gazhjrgri@thinkpad>
References: <20240827122422.985547-1-s-vadapalli@ti.com>
 <20240827122422.985547-3-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827122422.985547-3-s-vadapalli@ti.com>

On Tue, Aug 27, 2024 at 05:54:22PM +0530, Siddharth Vadapalli wrote:
> Commit d4c7d1a089d6 ("PCI: dwc: dra7xx: Push request_irq() call to the
> bottom of probe") moved the IRQ request for "dra7xx-pcie-main" towards
> the end of dra7xx_pcie_probe(). However, the error handling does not take
> into account the initialization performed by either dra7xx_add_pcie_port()
> or dra7xx_add_pcie_ep(), depending on the mode of operation. Fix the error
> handling to address this.
> 
> Fixes: d4c7d1a089d6 ("PCI: dwc: dra7xx: Push request_irq() call to the bottom of probe")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 20fb50741f3d..5c62e1a3ba52 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -854,11 +854,17 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  					"dra7xx-pcie-main", dra7xx);
>  	if (ret) {
>  		dev_err(dev, "failed to request irq\n");
> -		goto err_gpio;
> +		goto err_deinit;
>  	}
>  
>  	return 0;
>  
> +err_deinit:
> +	if (dra7xx->mode == DW_PCIE_RC_TYPE)
> +		dw_pcie_host_deinit(&dra7xx->pci->pp);
> +	else
> +		dw_pcie_ep_deinit(&dra7xx->pci->ep);
> +
>  err_gpio:
>  err_get_sync:
>  	pm_runtime_put(dev);
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

