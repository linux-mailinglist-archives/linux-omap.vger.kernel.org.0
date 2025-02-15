Return-Path: <linux-omap+bounces-3293-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27517A36C62
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2025 07:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB0D3171EEF
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2025 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDE219007F;
	Sat, 15 Feb 2025 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdvkHOp4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86D1537AC;
	Sat, 15 Feb 2025 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739602656; cv=none; b=uaLG8bkZvqTDyGwqDBP5f83frAEm/ux2WR2vX9w8xwGZ6XtTqDRv47U7Z49O8vvAblwiDgt3ZlVzL0TINuFTmWwVXQ4ddTE29KgfVNaCCuecZwqbB+6kRWcuORDLuE1HiHcr3OydbAgNSFPP0ZO05lzuBEVUmbWhPVS4hMDWCII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739602656; c=relaxed/simple;
	bh=rIdKxCqzCmgcBJkHw+Ie5Ae9HYLdkSFC4U+5Q5OEoXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVjITa2HlzJhh51j+15OCCw9wfyu+sikR8TogN99jgPL5rqmEomqCI4klbhD9b36yqetImY9MSbndMfC5cyw1gqbhKFvWdUBwTSH1hacusnuHyk6O6/F9KSJsLq2tcrgUqxIJr8gh8uzjOW24OluKlCA3xh6vhMxYgw9UaBoBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdvkHOp4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4396424d173so25417465e9.0;
        Fri, 14 Feb 2025 22:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739602653; x=1740207453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b/74yZYlKWVL03d8QxZ+9D71zx2gtM8eY6+b6yqz9TE=;
        b=YdvkHOp4Iw4kiC2+C4ByljobkEyImTkJapY8CHorsng+1QUQxrJM2YjR0YW/ANVYrV
         q62mKPEPTgghHsWx5wHfkLgXFJdqVfa4DY9rww1DUOzsmnmNbAZvoBIqXQ/RbzZqmtLe
         LXuZTT3vYXSsD8Q6PPbDLIj7OZwdWhhIjhLDy9VjlFe4J+NbzpbD8j79Tu4Wy7GH8X/b
         19p4NjNEVlJcA7+lku3uC7+Xyw0eUDkIS6NxIdAuxIlSaZgEz93uUdP1hHKim9/Lbrh7
         hmwwHBYuElp/lx8PzNoUZVN/xgLBuBFu2mNRQLEdwD3ul6NmBYdBqpcZ1DKAxTY4ON37
         APAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739602653; x=1740207453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/74yZYlKWVL03d8QxZ+9D71zx2gtM8eY6+b6yqz9TE=;
        b=UaA4hjziWFMQC9XXec4oPKyrEHr29XT5WsPqHYjiAsmGR4f0yuJ8DuO7eqLHZ1wCl6
         +ZiebjL8UMOMNu7u29XpbwM16cEzR1uucEDEz2l1N8unhCoMaJFwk0f5u8q1DHEf0HI+
         g376G2qonzdBjoz3aix+qjxE/ZgSSACPg1+46y8QMqVHzh/Zyv0oEbMxqtJriEoZ4B0q
         bCtQrGnfnAyOdiBa8Ub5bf0fCbM1exYmJ1iV7QjeemmackrRiLsOLH8Bchcm4u/op/Ky
         nHJYTo1hItd7EbisxJSgViSu5UiTSwrCRJ7Cv20OHcZtF4346ZT4JTcWNoJRyyNpBE5u
         lC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCURwsYeoediNPcw9YzpUuYpyOcxk7fgzg5HSPOYVElFR70LNILUe+AV24+nwunReI3n57cMxDIzrILa4Q==@vger.kernel.org, AJvYcCUUrtmGX9KaStGH3idJFGKCrPevdG1yMFHiXtIxQExGYY40a+X76YEl7ySRSfVGRnqI4neRSJTZQVzY4e3ayTtxEg==@vger.kernel.org, AJvYcCVeRpTW5mWtRYailAKjU11xfI9Tyr5splrGkodgwt0UNtNjk6lC6PGtuuTshRhXa/8H/Y7Q4QM8Xnz6BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpMe1NAOoB+Ye0VLKuWP/ytt7zQkLZQN9lfaoKwfxy0Yiamf9
	83biHro2A2f90LH3ZPmS0deYAXT1+RmfbqYk0GO+gGqFpavJsKup
X-Gm-Gg: ASbGnct0NrdQErZlO+OtOVRIbgqE8h2LGwH8+1CZOzKmVHqy5c5jkibHM4CKBh/byZU
	dkLCfu3ghdMQnAYIO7r2vQ2wr9Kr11h8NI4e54wPUbWHjhD6PPmD1FySZ/roWcHTg4zfrgqduaK
	vchJ5gzyBfInd9q/tIXxen4KdrigKesRzhLqAEPIS1GaZS8xfmrTLuPKFKPITAb0pRzwpsPT21R
	eVgBZT501OavR1ATeJjy+uN6raneD2HgTCxpwhD3S//REpLkd4xT3nzMsj7f7mWlDUv4dMw+xkm
	xYbqxVmUhqQbpnWY0d4=
X-Google-Smtp-Source: AGHT+IFjxR9kB7o/X7jJm3qzTaeRczgFmTbgBjdGs7eBWawd+pTz+2SLwRWzP2UGPPBOmUSQ10hDtw==
X-Received: by 2002:a5d:59a7:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38f33f125d2mr2434940f8f.8.1739602652764;
        Fri, 14 Feb 2025 22:57:32 -0800 (PST)
Received: from tp440p.steeds.sam ([41.84.244.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm6401172f8f.1.2025.02.14.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 22:57:32 -0800 (PST)
Date: Sat, 15 Feb 2025 08:57:24 +0200
From: Sicelo <absicsz@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, hns@goldelico.com, b-padhi@ti.com,
	andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <Z7A61N13dZpu53xI@tp440p.steeds.sam>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>

Hi

On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> It's no longer practical for the OMAP IOMMU driver to trick
> arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> the arch code's dma_iommu_mapping out of the way to avoid problems.
> 
> Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 91101ba88ef0..b2210841a320 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
>  	struct dma_iommu_mapping *mapping;
>  	int ret;
>  
> +	/* We always want to replace any default mapping from the arch code */
> +	mapping = to_dma_iommu_mapping(isp->dev);
> +	if (mapping) {
> +		arm_iommu_detach_device(isp->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +
>  	/*
>  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
>  	 * VAs. This will allocate a corresponding IOMMU domain.
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

I have finally found time to test this patch on the Nokia N900 and can
confirm it is working fine.

I was wondering - is there a reason that it is not merged yet? I tested
on 6.14-rc2, which did not have it, and notice it is also not in
linux-next.

If it helps:

Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>


