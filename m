Return-Path: <linux-omap+bounces-2780-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF59E6045
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 22:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F57284E19
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 21:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D3D1CBE8C;
	Thu,  5 Dec 2024 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxzyS2gb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B8819DF66;
	Thu,  5 Dec 2024 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435658; cv=none; b=QjLdljK/XDTkA6EP/pI8XNNDDsaCfjn185KM37tJtVab4GQg+3h33unW2dMWmtQOZB8JAak9kEPUNL9G+JGmsbGlf6BtiQUtepUCkJV6IZTJjqS/Sg6RFeqfdmLHdL9fSm94Mjpe4gLLWOdlSsMF1RBjYAYlE2akfYpJR4ETQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435658; c=relaxed/simple;
	bh=nqJuzIrwMW5efGJQY+rjr3zhGCylhDL02Nxt5lOUV9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qME5qX0SwGT8NpFvAC3XsGXdaxXk74lXzSu0MjajICCaUSOwDrRvfn2QOxz5cLci4gW+T0udgZlsvEEvZBu68Mp/YE6wlIYOK+q062Q6r9ZNDr9BGrHP3YcRhZkTUHtsOQg1CjlciLPP9jlfxxQUeFzyhLjtu4sxHwkdgZF9GTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxzyS2gb; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afa53874beso408328137.3;
        Thu, 05 Dec 2024 13:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733435656; x=1734040456; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDiiTJmCz6vEI9PMP7OwaS997HsKHRlfObbXCwvBhbg=;
        b=RxzyS2gbWL3nP7+LfMaCP5j2LTJXSnetwbOlNYblNZLYyo3sBZd3hkXKBKxNL+2YVl
         LOhMcqa2MEh6lx8HyImKEVxXBntPoj/7KISnEHL1PZpFUNMIg30dorYaR4pZmTIh3RQl
         Zr/fyONUqyZOjJ3ULv9aqMuz+R8Z+F6WbaE2qCBLPAecZhwRrKeku6ZeRDV07c6hR7gc
         YJoUPrKdiGBsSbrLm5BV+nO+4dlcpdePfn+6G7WNkGoFqzzqQRou+348cpfSDm0MtRnx
         hA+9cIj7B5QQ5cNZk8iN8vSBNMhGDPHu8QmRWaOyvxNlxavdO4Az5PCnrEKkLfTtLmux
         ByXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733435656; x=1734040456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDiiTJmCz6vEI9PMP7OwaS997HsKHRlfObbXCwvBhbg=;
        b=V8tj7GPVshrecDCr+w0tDpg390UWyom24rhPck6v2ENwgjRC8EVAe+SICZiaUFaNIX
         IoOFPfS+HAiIkl67pZ6LMaRU54am0LafGpfXMAIp0DDRPkkkPliyy4WGHQ/iz0QmyY4P
         Rz251HGhCzs/fYjTMtF2TVCVj9PTTY/BSE8/L0deG9ykbTIMCV8HZ+9MJ5bpUGX5vD8t
         CO+FC4wegHDVh+Mi8Q504XAusSjM6JxfGiCIyoYuh5ZVe7DVsgPXSdO2bjDVCoTitv5v
         v8z4RywVsOGV/Yvte5drPPOEzs9KewXGqIIOCqENs+VCkmfsM7CKR8l5ftV5kPvRMl4D
         Hqcg==
X-Forwarded-Encrypted: i=1; AJvYcCW3AsbjSOc+BpVlLZ2V7n25qji2ACV2vIDpjMmv7U+qYea9RsvH/IJdtKJCaQjoKjhtQ1IvKfbfTpW3Ejw=@vger.kernel.org, AJvYcCX/Q+omsTWaVfqC1az5WHATGRVGmjMJlyErTaYsTkBxSgeR5SHoTu+9EKcBV0gQL3exdWGyqk4DcFOpSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW15cK03toIoYzDugPOPRZSrP9Xgj+9vvvNwM3c37L/JXWo6Dg
	TkcXDdw8fn4iQxLF76iIIonk6pqvTyuYjVvNk3uVXuPBvuPNiJ4E4Ay+HpeL4lB0weTwephegNP
	cbW5s4tjzKxSt95+STQIPHPg+8w0=
X-Gm-Gg: ASbGnctps6shBk94uJ6dlfHB8yqIFFoH0ATKjTa5kxqYvqlLpLlKf/uCil3tuYC4xIR
	uByZk5STtdzPjYfrA+TbxnuPqRKFvBwo=
X-Google-Smtp-Source: AGHT+IEL529gtlN+1pRDS7o3I7j8QO6j12BV7TXdg7JFlhhJIA8ROCknDCKBwmLo1FVr21QYijUlItg9XxCJsIPWrS0=
X-Received: by 2002:a05:6102:2ad4:b0:4af:48a5:1ac1 with SMTP id
 ada2fe7eead31-4afca7438d0mr1604472137.0.1733435656148; Thu, 05 Dec 2024
 13:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113211614.518439-1-karprzy7@gmail.com> <486d5734-aa02-4a5e-b2ee-fdbba65179a3@kernel.org>
 <20241119145622.2f1f0342@akair> <5d6ccb9f-a8f1-45eb-b54a-cd66e637a2cc@kernel.org>
 <20241126230647.68b20fcf@akair>
In-Reply-To: <20241126230647.68b20fcf@akair>
From: Karol P <karprzy7@gmail.com>
Date: Thu, 5 Dec 2024 22:54:05 +0100
Message-ID: <CAKwoAfrvqUxPat9a+4LjRKYx2LZ=n6Q2H+ir3KYkBBj+Rv_HWQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: omap-usb-tll: check clk_prepare return code
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Roger Quadros <rogerq@kernel.org>, aaro.koskinen@iki.fi, khilman@baylibre.com, 
	tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2024 at 23:06, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Am Tue, 19 Nov 2024 16:16:42 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
>
> > On 19/11/2024 15:56, Andreas Kemnade wrote:
> > > Am Tue, 19 Nov 2024 15:10:23 +0200
> > > schrieb Roger Quadros <rogerq@kernel.org>:
> > >
> > >> Hi,
> > >>
> > >> On 13/11/2024 23:16, Karol Przybylski wrote:
> > >>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > >>> Return code is not checked, leaving possible error condition unhandled.
> > >>>
> > >>> Added variable to hold return value from clk_prepare() and dev_dbg statement
> > >>> when it's not successful.
> > >>>
> > >>> Found in coverity scan, CID 1594680
> > >>>
> > >>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > >>> ---
> > >>>  drivers/mfd/omap-usb-tll.c | 11 +++++++----
> > >>>  1 file changed, 7 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > >>> index 0f7fdb99c809..2e9319ee1b74 100644
> > >>> --- a/drivers/mfd/omap-usb-tll.c
> > >>> +++ b/drivers/mfd/omap-usb-tll.c
> > >>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >>>   struct device                           *dev =  &pdev->dev;
> > >>>   struct usbtll_omap                      *tll;
> > >>>   void __iomem                            *base;
> > >>> - int                                     i, nch, ver;
> > >>> + int                                     i, nch, ver, err;
> > >>>
> > >>>   dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> > >>>
> > >>> @@ -248,10 +248,13 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >>>                                   "usb_tll_hs_usb_ch%d_clk", i);
> > >>>           tll->ch_clk[i] = clk_get(dev, clkname);
> > >>>
> > >>> -         if (IS_ERR(tll->ch_clk[i]))
> > >>> +         if (IS_ERR(tll->ch_clk[i])) {
> > >>>                   dev_dbg(dev, "can't get clock : %s\n", clkname);
> > >
> > > if you want dev_err() later, then why not here?
> >
> > Because clk is optional. If it is not there then we should not complain.
> > But if it is there then it needs to be enabled successfully.
> >
> I guess you mean *prepared*, the clock is enabled later (with error
> checking). But your reasoning makes sense.
>
> > >
> > >>> -         else
> > >>> -                 clk_prepare(tll->ch_clk[i]);
> > >>> +         } else {
> > >>> +                 err = clk_prepare(tll->ch_clk[i]);
> > >>> +                 if (err)
> > >>> +                         dev_dbg(dev, "clock prepare error for: %s\n", clkname);
> > >>
> > >> dev_err()?
> > >>
> > > So why do you want a different return handling here? (I doubt there is
> > > any clock having a real prepare() involved here)
> > >
> > > As said in an earlier incarnation of this patch, the real question is
> > > whether having partial clocks available is a valid operating scenario.
> > > If yes, then the error should be ignored. If no, then bailing out early
> > > is a good idea.
> >
> > In the DT binding, clocks is optional. So if it doesn't exist it is not
> > an error condition.
> >
> > >
> > > clk_prepare() errors are catched by failing clk_enable() later,
> > > ch_clk[i] is checked later, too.
> > >
> > >> I think we should return the error in this case.
> > >> (after unpreparing the prepared clocks and clk_put())
> > >>
> > > and pm_runtime_put_sync(dev)
>
> which can probably be done before dealing with the clocks. It is only
> needed for the register access.

I'm fairly new to this subsystem and I'm trying to understand the
conclusion. In the end, we should add dev_err() here after
clk_prepare() with appropriate handling?

>
> Regards,
> Andreas

Best regards,
Karol

