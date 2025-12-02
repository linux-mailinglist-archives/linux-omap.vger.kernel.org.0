Return-Path: <linux-omap+bounces-5108-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8BC9C1A8
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 17:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6180E3AA4DC
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 16:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D5288522;
	Tue,  2 Dec 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KQIFYGTn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E72857C1
	for <linux-omap@vger.kernel.org>; Tue,  2 Dec 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691551; cv=none; b=vGeRcTzgg1lo7U0Wys6+C/syej5CHhoQ8k4ADsox44bB09Dj0Bl5GIvsr3VkFrnQPRMOzjlXMcSldHXOtOTr6zx28dmKRyU+n2MDtHdodEo9iqw7HHfBWQKG8uezSDrxcGPuUjw3oPhqiFnuSUU5edjebi+O30iWomRg7q4I114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691551; c=relaxed/simple;
	bh=oBlUbm/4rajTOLUrUnf2zsSWelXrOsMnnCt8Bhe3JzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5N5HCZKtCrgN/pJKG5Mmao+rdjfySqUX2lwJ1B8veiYOjZOPE9oZCXuxB5ofpjjcY1a+X25FErKynyn+ycJjfUxSWfEPoOud2kjKqtDPSus6BszMcqW4kOCz9I5J61Pw/+0TIVnfSsq6J9jUTQs6hv6KX9BWAQcN6aBimSFtvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KQIFYGTn; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso66721601cf.0
        for <linux-omap@vger.kernel.org>; Tue, 02 Dec 2025 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764691548; x=1765296348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEziSNrQQn4I05oBYvzUjY2FjKsIMByhRBoiclkMFIc=;
        b=KQIFYGTnevjXpDUnDqt0jkUGh3z3F1Kw6qrgMY1NfxkuQGbUg8Kadewp5NTy9x0DO3
         ClzkpaWxuLj6F5xwEZ5KhulRc+9qJNWx/ESMUFkxDM/+26czInQ7uCn1UvqhiZDxtN0T
         8TIDQVOXUqHurcr+Uf6dU831Ya5Dr5kE95upkJPD9iC2wePhb6VHoxVraK3RzW/gOV42
         Z62OJh0SqC6RFs8eCk1NISLZrxZVOVscI/gT5KjttOpmouhB9jRNpfX1w5Z2/hj1bZXR
         jWy89pjPSf6byeId4N+nOnPSCJUKKGMAAFUP/pYlXvOyyrtpSslyWERJZj3F/MvgfT0u
         NvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691548; x=1765296348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEziSNrQQn4I05oBYvzUjY2FjKsIMByhRBoiclkMFIc=;
        b=P5phLijA/3l5BFcKF5oJE6rVD/jjWpZNyULGgGxTuao2yMM48ENZG5cCatF0EvOayJ
         g9m77yQLhzh1ny0OPNLTEDtR1AYMCw9yBqYi8w5uOgPYx9DtWxzAHs38vG9Jl0WfEpQS
         eeGJlqxehHir5nRzn1YN1zq5Nr4DUplrn8sPr3w/OY4rP1JmN0YT0XfDCdrJQ+MYPsDL
         FrG9RBXLp4XDXOTn3MWudXTM6oqkNZSr0gRuinue3Ze4bFzrP6/BP39yeIVwNQyRmP/f
         lX0QwJgqLrFpUtsHnKdJKAmELYaYPZBGKDxbIys6RRdBmo+5ui223WB/gYZNXykBQiRS
         E3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXRttiVbsvKcVi8/Hw1AE5TdPangiBDEXiD+wLQ6LKJWTMoJWyynoFH6DqzU62ybSFjT1DfB9cWeBVh@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnyPX4ugGIir+8KxYvGg+kZCQNxDsP9PsuwAfzSXGKj3KXdKE
	ooKw7pcwGxdhH9MYLHOON5IGdpsvhrhFfG7Nx/hCT5X8A39poFCo4hxvvKKYEPc3zQ==
X-Gm-Gg: ASbGncvhAR9whXfXEJ4L4F0hCCJI6CpGRSsDgvHFL4oOtU1m7GHsl02zVfrMCpvtoaS
	DDsR4eRJS6Y9LgB4GWj/4BU25z1/7l0r1vn/c7mSSXwn2SesYfGRlmY1cgggB7PqheLIWjfSEyc
	C+O0owJYOVhAx9h/2BuDmZmB1UwGeI5e5LpQTkOLA3/UvOqqq94Az8qc9HohFeXzN6unVlzPNV7
	/gNnakYBabScGzYnTqI/tsqZXRCN990lW67SYKnFu1TFCPYzpfnQ2ZN/0ETTFAwqcNhxSXxwqt2
	pbkY+TxHz82x5c4TlD2rrFP3nZF05QV5gyHk/QeaAz0uPVoB+sewKx5IJcQOeOKIhJ04/4r8VmC
	Jv0kBZ64bQqEvILwADt0ZLmkWl1JaJnNNpo2U+9CJczynpLB0ob3WOwoijAxxx33L52A896MaO+
	S9v5hqXG94HOiA
X-Google-Smtp-Source: AGHT+IHjgMbcY+byTZV1x8KfhonySSDxlQ5+BhItSw06ag+f4H5XsHVZFjDTTcOrdWE4HzLgPcTA0g==
X-Received: by 2002:a05:622a:4c8:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4efbda58b15mr409662561cf.36.1764691548001;
        Tue, 02 Dec 2025 08:05:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm96901011cf.3.2025.12.02.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:05:47 -0800 (PST)
Date: Tue, 2 Dec 2025 11:05:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ehci-omap: Fix missing usb_phy_init() error handling
Message-ID: <7c6ed1af-46c8-425b-83a5-4692095144a6@rowland.harvard.edu>
References: <20251202080027.1124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202080027.1124-1-vulab@iscas.ac.cn>

On Tue, Dec 02, 2025 at 04:00:27PM +0800, Haotian Zhang wrote:
> usb_phy_init() may fail if the PHY clock or regulator setup fails,
> but ehci_hcd_omap_probe() does not check its return value,
> potentially causing later operations to act on an uninitialized PHY.
> 
> Add proper error checking for usb_phy_init() calls. Add a new
> error label to properly remove the hcd.
> 
> Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
> Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/host/ehci-omap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
> index db4a1acb27da..30b3586fd696 100644
> --- a/drivers/usb/host/ehci-omap.c
> +++ b/drivers/usb/host/ehci-omap.c
> @@ -166,7 +166,11 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
>  		omap->phy[i] = phy;
>  
>  		if (pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY) {
> -			usb_phy_init(omap->phy[i]);
> +			ret = usb_phy_init(omap->phy[i]);
> +			if (ret) {
> +				dev_err(dev, "Failed to init PHY %d\n", i);
> +				goto err_phy;
> +			}
>  			/* bring PHY out of suspend */
>  			usb_phy_set_suspend(omap->phy[i], 0);
>  		}
> @@ -205,13 +209,19 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
>  		     pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY)
>  			continue;
>  
> -		usb_phy_init(omap->phy[i]);
> +		ret = usb_phy_init(omap->phy[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to init PHY %d\n", i);
> +			goto err_remove_hcd;
> +		}
>  		/* bring PHY out of suspend */
>  		usb_phy_set_suspend(omap->phy[i], 0);
>  	}
>  
>  	return 0;
>  
> +err_remove_hcd:
> +	usb_remove_hcd(hcd);
>  err_pm_runtime:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);

This basically looks okay.  But...

I don't know much about the usb-phy code.  Is it really okay to call 
usb_phy_shutdown() for something that hasn't gone through 
usb_phy_init()?  (Yes, the original code already does this -- maybe 
the original code is also wrong.)

Alan Stern

