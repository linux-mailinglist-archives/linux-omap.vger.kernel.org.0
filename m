Return-Path: <linux-omap+bounces-4707-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E882BEDEB2
	for <lists+linux-omap@lfdr.de>; Sun, 19 Oct 2025 08:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E2804E44CA
	for <lists+linux-omap@lfdr.de>; Sun, 19 Oct 2025 06:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D85621CC4D;
	Sun, 19 Oct 2025 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyx8jvE7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1F78F3A
	for <linux-omap@vger.kernel.org>; Sun, 19 Oct 2025 06:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760853641; cv=none; b=CM/gT+6UjLqG1ap1srHISU0fHFX/MdJze59rm1OC6BcErGiNLeawCQHtvl5D/9m+ZuvfysN/tB/jlZ43Q+fD6Mx2J2Q8aULCuMokc8maMPB+7wXMh/JMQOnDs9Fj0mCaLpa18ata3Ye1s5TKeDoj+iuOudTSd3mKiBo+4q0d728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760853641; c=relaxed/simple;
	bh=+FmVBSQvGYziWTCd8nap5gWQD+747UUq/SV2tX+pf9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6hCqTa+4QvT/JkYT9472N854DdOCCTt1iCOA8Wj2q79pBZIS6N7Kzt7vl16hi8J+JNz9AWyDhl/+pprEWU/UySBMkJoosjb1fOxrKfMszgl9pBOdvbfSpMtqpkte0t0Bh/bgQQun0mZ/KLAdqkyWFCVTHPByG0NPLNvVsP4yJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyx8jvE7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b4aed12cea3so562170866b.1
        for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760853638; x=1761458438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDRUSkhiE/XFv7OW4RSw91eps1PHNhul5pJctkyAuh0=;
        b=kyx8jvE7CcO5RDTXwF1VKzxZpj89umkgHdcyS5IgRPRQj7UFOv+tB/Yo73VBvPzRkL
         n8ya5dhgFmIhttynbU1uYG57WZYlzFgb9Q0WPmDl+zlkX4oN1GxnF/q3J13mFvfEYYfv
         z1RU4EQODW5V5DholblzezLonqs8GwsFOz8wpbwvtkfQ+klQ45LI7OUcCwLDP4uzFMFW
         JV3Dvo/ScYIHsdoffpYobiUbWXAD3Yu2uYtyibE/mQB4dxSb7PRddKLfuKmBWcJ23GxI
         ooeOQ9p3Qobmz5Zjml3mTcWj4GCVy/Q/NV2HMT//XF64tAQdSivifSTtJ4WXCAHCWTkZ
         fYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760853638; x=1761458438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDRUSkhiE/XFv7OW4RSw91eps1PHNhul5pJctkyAuh0=;
        b=pGu3FCzGuxgiycwFNIXlHxtWFaZHSTO1jY4JTcwfATjD8qHszCzKDCBFgGjM5J0W4l
         RhDhBTE9rLpU7TV2SkxEQhROh1Vpxen9e92qkh6OnyjN39mzi5jBlXBBgqjf6DWJLD2K
         c+HLJDYR6UMfoj1PiRPElnKA4zMr68063Nls6S+FyjUas23IyXx8T5ysUUCV9Sfg6sXf
         z8CLnvvtS0caKZ6b2EHFcyZuolTZ2YnvAHqgWa3RMBqKvVSswaJE9IrP+biKb/x9f9HX
         am7t+HEbp90HDkpO/9OzVNDk5UrZG5ZiOEShx8gpPc3ipMD4Xz9QSDb9Qk3ZGhleqH6F
         emmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbLFU0I6CWCFcPXP3v7oLvsZr0IsZxR/tXClKLw8CRn/8g5PfkGcvkmJd1zBP9DCEfRMvZhwJyZRL4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKn0wMsU0H7MSanuwoWu+Nsr7u2OT5x7Xn0+kntYbKHUbqFEIi
	aTODWzFTLUQ3Iu8wxwAxfLOt8VV4lLRfhg085r+gCAN3kACjhoZdYLjk8Djv7LeuhT3EPE320dh
	pu976hNK+6qx9oNUOLP9SwE4UmAslZ+0=
X-Gm-Gg: ASbGnctfxxNQxQcWfc79+Ix678ZAqnyPFL4EA4vRmEAOlozVPGNUABq2dsO9i/M/dQz
	VRCk9L1zAGvSANZgA3+LUC0SyRJg/BL9FkBuawtyCkN7bcDTYwsEM1BopOSankDMWaMIWhZhEE5
	aOWJPOl0sgZYROQnE2RU+6acZhP/j/tePDufY1IyequTJJ13XfLmLmVPYH0nxgARTgYlOKhiAN5
	1c6GE0mkPtEJSYtqWuMvNGU+3yn1ZXl/RafO4kMGFwSMzje0AZEJH3cVcZryww5O4asvg==
X-Google-Smtp-Source: AGHT+IFouXM66dWGoME6chpnuaQA5AhGJ3XBtWEQPmJjkQDMbd8DEH4sRrB+vsmFy93A7mrCfiSnE5e4aC5FUlXjYmc=
X-Received: by 2002:a17:907:7b8c:b0:b04:b446:355 with SMTP id
 a640c23a62f3a-b6475706d77mr890751766b.59.1760853637425; Sat, 18 Oct 2025
 23:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014113234.44418-1-linux.amoon@gmail.com> <20251014113234.44418-2-linux.amoon@gmail.com>
 <aPNiW8QzsLv4R0E6@stanley.mountain>
In-Reply-To: <aPNiW8QzsLv4R0E6@stanley.mountain>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 19 Oct 2025 11:30:22 +0530
X-Gm-Features: AS18NWDuyNsNiWxQmtkRHjc2M2PlmVH_Wd0KhK-4VAGV-r5GP86AOOEs_7Ea5Qw
Message-ID: <CANAwSgRchOvNPShUZOsUzdS0jaBOtFmpPLpJZEv7NNqOohWo3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Sat, 18 Oct 2025 at 15:18, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Oct 14, 2025 at 05:02:27PM +0530, Anand Moon wrote:
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to ret in all error paths within j721e_pcie_probe(). This ensures
> > the original error code are propagation for debugging.
> >
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: new patch in this series
> > ---
> >  drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..9c7bfa77a66e 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -569,20 +569,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
> >       pm_runtime_enable(dev);
> >       ret = pm_runtime_get_sync(dev);
> >       if (ret < 0) {
> > -             dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> > +             ret = dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> >               goto err_get_sync;
>
> Wait, no, this doesn't make sense.  It's just assigning ret to itself.
> That's just confusing and pointless.
>
Ok, Thanks for clarifying.
> regards,
> dan carpenter
>
Thanks
-Anand

