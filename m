Return-Path: <linux-omap+bounces-3410-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 479ADA66D56
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 09:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 923F9189BA96
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960BF1EFF86;
	Tue, 18 Mar 2025 08:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYeZngaC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E11DE2CB
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284995; cv=none; b=BywrT4ZGWHsrLjxIMSlKM5RzJ94mz0+jVTs6WHTJKBwWa1myD1fQCXFaNQBWO0jRQNJNOs6/d37QvycXFtDX5fQzoeSXBUV+nd9oHPDOtAIvEQovphBWWcTaZ/gMSUcEjpSxLXa4TFtEGp0XTgfrD4CAS1bZNU8y75MNCRffR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284995; c=relaxed/simple;
	bh=oPq+d71Iufy56/UZaCHSTNp7Y6uM8EA9OXViFdwCyp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UO8bhRor4V/ZeY4+pmYloorhgMKfd2uLNSeDvQlg3qcWWVJxRPLvH1VFCu7Aemv5AEO0sZWKS3OfqoGTVgmLeb5+xs5FajW5Ul3DwA5lVbMXqS35l6gbb9wdOotZ6WDyVdM5evsTuueUao5BqDCHIb2W0jwpJa01jQaHNIJKsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYeZngaC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso70899485ad.0
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742284991; x=1742889791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zATNOB+RN3GRdRq8GAz0vH7sY1Yh90UPf+hvtUwtFk=;
        b=JYeZngaCrwqCXIUh9R+MuiHFdmMsx8A6+rRBrfTE+9f6E5LAEMfM110JoGbaJbvTx0
         0M64/ZLb+vlCBmA4VB2gSxtELDDfLaSbhCeEwRfZoNfapZ0kQ6c4SYl9PhgmcDWzCx7S
         +/5gvNWri+zOT8f7G3PkcDK10PIB+orJlfuPM0GFVSB/r3uxz9CehvayG6DjjLpeylNv
         MbFWrnSAqYZSClu7UpyCZIseq2+olRAblT5mD5B0Er8232PVRsuUU7q2vFeIlartOM8S
         l8AAjWkRVRyijhmYDRfca8ROU/2VFlMMcfew3Ebslh92JToNmRSbvJocqKaYBYAhjZKm
         giaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284991; x=1742889791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zATNOB+RN3GRdRq8GAz0vH7sY1Yh90UPf+hvtUwtFk=;
        b=w4BXBsW1RkkEC1L5p28FFvxDS59Yu0uybY3rzTH/hlqEV2VD1oSLcTEmezGjpPtZ0p
         AFLwvGcFL/0EY95kwck4fIv6ZeK99ou7mmwhbyOrHNGY5on2cd02GFIkLFmyZpSDFvUk
         lvmZU4GvuDxIySnNBUhmQT5Y3ntKMnlzSRaGkPmGndUoMvkX5qk7U+ti1FtgLSH7yNPM
         cu9JcRuer1QBFKt1M1j1Nf0DHhBz8fk7DmE4b5kS44mAnp9Req117Ki0gIS3lEwBkisR
         j9Uwh8QJWf/vaFDWYu0M+i2adfzC7Lj6X+DhBFKeJ9CyBsl3i/KkRQ+jMyIDOrnzhcCx
         1Bew==
X-Forwarded-Encrypted: i=1; AJvYcCWmvQKdorsyt7bIyoIJ1cs6+TcDVeS1GHIVHEAP82vZxmNeEXGcVFes2gcwb89hQxDz/4+yjv+Tph2D@vger.kernel.org
X-Gm-Message-State: AOJu0YxI2yDKRH52B01HrnClD05URVZmPs1WETdp9X/izrqUI8nG9T7U
	fmqFpNdMjUB7vIYZrouiGaiFB9u8a7c+nA27picFkPPbmH2E2YwMJUxpDbyYAg==
X-Gm-Gg: ASbGnct5H9AplHOs2t6K7SWGkfKgqUTuNfKMCq0TuEwEzm3kxIoU8SLBK2mS/YjDbzG
	lM/8NQSWkvgylYM+T/f7bNvWeK6WeEBcxJphsVdE6QobrtOU9bYB6fX0OqXJOfxVHudIGxT9xTu
	QtqvRChyAbEf/awD+o3vXlHae8emi3jqMyyCNkWNd9plTZbo+G0negbL09S1QzleGhlcJ3o5J+q
	CGgsfKyQRBId3Tde6yDhq/R25yJr+kdcgVSVckmkTvrEfqe9mJV0FYuI+qql8VKWw7zj+QBCmo6
	voyERmh2QR3YSBA04rsiBdWL64J77pmYB1gs2wq9MXGhMNQN9bJWpM7H
X-Google-Smtp-Source: AGHT+IFQI50pcGaomE3YOZGMmALp0D+8DIQDQoTe6NaI/OMfzJ9nJAe8ts6tZPm5ugXC7xjglM9V7A==
X-Received: by 2002:aa7:9902:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73757932a76mr2891234b3a.9.1742284991535;
        Tue, 18 Mar 2025 01:03:11 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm8934019b3a.167.2025.03.18.01.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 01:03:10 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:33:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <20250318080304.jsmrxqil6pn74nzh@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-4-s-vadapalli@ti.com>

On Fri, Mar 07, 2025 at 04:01:27PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_ep_disable() which will undo the
> configuration performed by cdns_pcie_ep_setup(). Also, export it for use
> by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
> to cleanup on their exit path.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c | 10 ++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index eeb2afdd223e..85bec57fa5d9 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -646,6 +646,16 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
>  	.get_features	= cdns_pcie_ep_get_features,
>  };
>  
> +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> +{
> +	struct device *dev = ep->pcie.dev;
> +	struct pci_epc *epc = to_pci_epc(dev);
> +

pci_epc_deinit_notify()

- Mani

-- 
மணிவண்ணன் சதாசிவம்

