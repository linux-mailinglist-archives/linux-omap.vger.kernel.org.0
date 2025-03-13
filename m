Return-Path: <linux-omap+bounces-3387-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FE0A5FE7B
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 18:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B0C37ADF2C
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 17:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D71B1DDC2A;
	Thu, 13 Mar 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOhrg+Lu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB541DACA7
	for <linux-omap@vger.kernel.org>; Thu, 13 Mar 2025 17:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887867; cv=none; b=Eec/9A2G6BuLiQCox1EFTjzluMRxEKNU7biayYJv/t3LtqwQ+QdqafhjNUNHOb9+W69FktijyuUUHaXq9wdJot1ueMwFU8yrTV4TbPbeTaJqF/mbEaKxrluCtVjyYKSfG8j+k+IqZ8YIuL7dl3nKQxbftC4ymFO8PduGwrRWZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887867; c=relaxed/simple;
	bh=QV8C66sQqd3HvWMDCeN2JGXKbNAkGEFguMVZSlaWutk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIlTCj7msMaUnVbtWuvDMSEmyMfpEVhcUBaAZDui0PBQj9USeKlWTqfAb6CJQgvY7z3BhgprNgtDdX7dGY+NWJtiOgExu4GHXRu2O79IcefP1BwB+jBUxrM6JIOkiA31vJDfwdupsFGa1ypbANOlpSLd12LRZKsOVeCI3eOEBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOhrg+Lu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301302a328bso2675138a91.2
        for <linux-omap@vger.kernel.org>; Thu, 13 Mar 2025 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741887864; x=1742492664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NhFJsw8uawrCjQJevU/7j+bAkPgtLqvzMAQJU5JD9+8=;
        b=KOhrg+LuXx7d9C6KKulJtOIW47AXQK03Ii3Cdb1e4XkkFTDbh7Va+0TMluG+MCqfwi
         l+7euXp9RUPz0YFDNLbSfFz/lPSl8QveFsz1oay9BCjynTdYEL23qLaIBrqws0OXTyMk
         v9GnLz34MNflm1o1A4hkwzLh3Jnyow7897BmBLFbK0yLnJWTfrFOIpVCTN8ekNwh91CB
         Hnf2mEXr+a4EwpJO1tO2q7uVi6xWz/V3xm1unERXYKCPWTboYEkATbQELOqu3gnIvz3k
         blPWgp5c8StBhUIZ1RK9yaYEMT5Uix+EYVCRWru43Guhwsslkh/Lc80wZY52jqwBs4GL
         OnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887864; x=1742492664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhFJsw8uawrCjQJevU/7j+bAkPgtLqvzMAQJU5JD9+8=;
        b=IBw2Y4QSdHQV+4G8wC3zSNi0tg8hjjOm5CJQjmaqhgkJvQlEB6dZuylGL5ZMC6yzbI
         Aq9fWjtKDYB19RlWAlKO/kjRXwyqXQyu4aOL7zIdL7POYdbtA+cUZNoHae0hM/FhvPUU
         U+K6NRNo8XuBfS6dGwSDgcCI7QKYR6BGoBNVBkLa2zSD/cv4cxuv4a/FrVjk7qzcaAXJ
         eOwlD9rCiFLaMtBfJvMWirK5tvc4Pnk4oStMhRPUUHAxKcAWr3FjOt3SQQzR05aharZ7
         AF8yH7Q/2gpyjQ0ylFUAs8qHY+Ll8CgbboSJucog3kNuW3CJ1CmrqPJ3GE7ceyRZx1Nk
         3uyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6N/yvo1VujDHgmBcvsOm/8oFtPxa5J8ApObwqHbEBN8xGapDjwmOPDj63FYdu3Ez5mmw4Nlgp7T2w@vger.kernel.org
X-Gm-Message-State: AOJu0YwtC29jfnnbERTPMarEX+wn/MZPiJUBwhACtbakDPFJNbyJnPhh
	38xlA3hqKgvpwyGELRIPk0EMxjr/Q6NfguLpUf7853bShNF8mE1oZWHZJxAbIw==
X-Gm-Gg: ASbGncsgExAu6Dm1Trbx5hFcS9QkVKeKVTlb3AYFDCyh3B/lo/Wb8vs0IarUW3BudXn
	Kghy6TkdC3JIPBdX8RTWF0m/J9wmZlDY0I1OBdrUMiWyn+42YFgq/8wLSOi2II9OIAkpB7Ck8iD
	Rk3CxVqN2ATUZA+75qYBBysMmZw9IZBTQU2xbQc6OuaZ5Q6k4ZBm4K3lBOYV740by0BCjO6yl7V
	miDPrkOf37ffzWSnFTTVhyZFh9nXZv+WraFOqzvXQb9FsEH1bVL+thlQ1IkWu7OSW2QoFgmg1It
	QRNF3EGdX+MtXj6831jgfvbaVEnxhgp4x9zf7g427A2EsHfhisB1/g==
X-Google-Smtp-Source: AGHT+IEaq+Fi1cGt0rAKa6Fc1r8aIz7Paw4eI3nREquhMURMlKswOymRbr7ex68I++4IhbW37kjVlQ==
X-Received: by 2002:a17:90b:54c4:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-3014e8619f7mr487146a91.19.1741887864312;
        Thu, 13 Mar 2025 10:44:24 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30138b4751fsm1670259a91.12.2025.03.13.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:44:23 -0700 (PDT)
Date: Thu, 13 Mar 2025 23:14:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 1/4] PCI: cadence: Add support to build pcie-cadence
 library as a kernel module
Message-ID: <20250313174416.n3c4srf6hb2l3bvg@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-2-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-2-s-vadapalli@ti.com>

On Fri, Mar 07, 2025 at 04:01:25PM +0530, Siddharth Vadapalli wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
> 
> Currently, the Cadence PCIe controller driver can be built as a built-in
> module only. Since PCIe functionality is not a necessity for booting, add
> support to build the Cadence PCIe driver as a loadable module as well.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  drivers/pci/controller/cadence/Kconfig             |  6 +++---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c   |  6 ++++++
>  drivers/pci/controller/cadence/pcie-cadence-host.c |  9 +++++++++
>  drivers/pci/controller/cadence/pcie-cadence.c      | 12 ++++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h      |  4 ++--
>  5 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/Kconfig b/drivers/pci/controller/cadence/Kconfig
> index 8a0044bb3989..82b58096eea0 100644
> --- a/drivers/pci/controller/cadence/Kconfig
> +++ b/drivers/pci/controller/cadence/Kconfig
> @@ -4,16 +4,16 @@ menu "Cadence-based PCIe controllers"
>  	depends on PCI
>  
>  config PCIE_CADENCE
> -	bool
> +	tristate
>  
>  config PCIE_CADENCE_HOST
> -	bool
> +	tristate
>  	depends on OF
>  	select IRQ_DOMAIN

Even though this was added earlier, looks like not needed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

