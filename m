Return-Path: <linux-omap+bounces-2604-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF19C0392
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 12:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050C91C203E0
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4D71F4FDD;
	Thu,  7 Nov 2024 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQz74mmN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910261F4FD2;
	Thu,  7 Nov 2024 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977986; cv=none; b=ugfRsm9n29RxIsgQMxnDVO6ny8gDwN2OA5m5a/e4uKqb/ZKh6GVSvxwrp8O2+uuPuTYDPWlsdZmNIS54U0bNipx4jGGtLvj6C4pPaU9oGs+RdDLmkvrW0+nlPuypHgl0p2DCYGFMoSLdiN51GEKt4xlfiTrz09/WMvp6ek+niLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977986; c=relaxed/simple;
	bh=iFoNarvDdiadnoI1lhGb2zv86EDtHM4tPbOJmB8VV3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkAr4poqHq0N0Bm+gWztZo8CQlWmoTx1aA2U1Ohwjm/oRyBHMcbBecgK70KMfC55dtyqBOBQxRb8h4fkLDPLkKnItetHFAMGeE73+ITvW0Hr+TeLDGNN5BgGmRVSkzKX4YyMDx/1HBrkjITEz0EkDwMw5aJT42vjp82fMte4Lr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQz74mmN; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-851d2a36e6dso1554689241.0;
        Thu, 07 Nov 2024 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730977983; x=1731582783; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vdZPXQt9PZfbMd2ngGnM2stRUWSjzk7Qs9v0lITHsIs=;
        b=YQz74mmN62DjNIcQu6iZ44bIB6baPjsMUMqJJZs1uNRZNy3IS6A+wJGsqjEi/vkk13
         /9OkW4XQ7epCAyz/SZTSyb95kQ94blMltvu/QKVFVZ13FCHwpGi1GGcYrz2IrLQUq3LK
         gflrE/GnvXWDPboB4CzJs0+U7Qv162HVONStPn9olQit4gS+VngEeq5lDbdp4tu5Skws
         3VOguCnvFGdb79g5r088w5APec2uUk9v3MAdp0zOlgrAOS6Ciu214Jcr//j+lv+By5QC
         MdcM974Y9B/CcJjglga5cloOd8KTVfJAhgd+n6x49AdgFRQoIrwkt8LYcmbT374UA2S9
         srvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977983; x=1731582783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdZPXQt9PZfbMd2ngGnM2stRUWSjzk7Qs9v0lITHsIs=;
        b=GCnLEJHMh+rjxS/JXG1nYQXAmpdYoe+kGK7ocIFDocY8i7XNUA1iL/alylctBIe4ND
         CmH4e2Uj7TuraYnXZoQboHcUlc2E05LRVcCBSh97GWYtAkcDU5LLFTaK0K1Df6/5xnok
         QaGNar7qmYtxCU4uS5SIAqfBwXgNLcIW3xDIgNp7iI1PDYDIg/60AbAmXVgijpSFyZCO
         zQi30phb9ilhCpYY3OgXsVtZm77i1dFC4rumQP/RmJtnHN8rIEr0ffB9TMijxENtO4cn
         wY8RZCBYueM6TEGJirGI4UVp5AuAM3BUP64y7pLPjq5+wRtGwcx9kO8x2QBnFkY6E27y
         0Avw==
X-Forwarded-Encrypted: i=1; AJvYcCVfeIR0TKxERWlOv67HcJAYeMsStOnuxvXeHwc/VzBEVqdgj7P5XxUDoowq+ukyZMVGxQSQu4nHGUHWRw==@vger.kernel.org, AJvYcCWrhn4zqbCoRqfyZvjKVhhDFqA/U4GZKHrG0JpNN3pT6aUx4yxWVEfAKKMW2nTeC1tquof9kMvcA2HyAQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqaBUxO2JBQiD/KmYYobiwt/rDqSE5r5hQldiLLMxU5Gye3L99
	N0QZDgqR9MdpBBkWF3xTryfZ7/3QXfknu+R7ZgoLwgYsnlvfPBIQfoSs2hHq4Xi22Fqfzzr6fuA
	R5W1FQDNM+tef4Zxt0Bf+2aklLQ4=
X-Google-Smtp-Source: AGHT+IH4z3/L8LVoVMcgStVVf/WSLnGXsZQTbap3G912K0Ejo0Bvh1drw569JpW5PEPMIdXxzv17s9E2ldFUxRsJZNA=
X-Received: by 2002:a05:6102:3f0c:b0:4a9:15c:f02 with SMTP id
 ada2fe7eead31-4aada826feemr260552137.11.1730977983353; Thu, 07 Nov 2024
 03:13:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106223324.479341-1-karprzy7@gmail.com> <20241107001507.5a304718@akair>
In-Reply-To: <20241107001507.5a304718@akair>
From: Karol P <karprzy7@gmail.com>
Date: Thu, 7 Nov 2024 12:12:52 +0100
Message-ID: <CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in usbtll_omap_probe
To: Andreas Kemnade <andreas@kemnade.info>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org, 
	tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2024 at 00:15, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Am Wed,  6 Nov 2024 23:33:24 +0100
> schrieb Karol Przybylski <karprzy7@gmail.com>:
>
> > clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > Return code is not checked, leaving possible error condition unhandled.
> >
> > Added variable to hold return value from clk_prepare() and return statement
> > when it's not successful.
> >
> > Found in coverity scan, CID 1594680
> >
> > Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > ---
> >  drivers/mfd/omap-usb-tll.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > index 0f7fdb99c809..28446b082c85 100644
> > --- a/drivers/mfd/omap-usb-tll.c
> > +++ b/drivers/mfd/omap-usb-tll.c
> > @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >       struct device                           *dev =  &pdev->dev;
> >       struct usbtll_omap                      *tll;
> >       void __iomem                            *base;
> > -     int                                     i, nch, ver;
> > +     int                                     i, nch, ver, err;
> >
> >       dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> >
> > @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> >               if (IS_ERR(tll->ch_clk[i]))
> >                       dev_dbg(dev, "can't get clock : %s\n", clkname);
>
> if you add more intensive error checking, then why is this error
> ignored and not returned?

Thank you for the feedback. It does seem that elevated error checking
is not the way
to go in this case. Do you think it would be good to add a similar
statement instead of
my initial changes? It would look something like this:

+               else {
                        err = clk_prepare(tll->ch_clk[i]);
+                       if (err)
+                               dev_dbg(dev, "clock prepare error for:
%s\n", clkname);
+               }

>
> >               else
> > -                     clk_prepare(tll->ch_clk[i]);
> > +                     err = clk_prepare(tll->ch_clk[i]);
> > +                     if (err) {
> unnatural braces, if (err) is not in the else branch ?!
> > +                             dev_err(dev, "Unable to prepare clock\n");
> > +                             return err;
> > +     }
> >       }
> >
> >       pm_runtime_put_sync(dev);
> and this one is not called if you return early.
>
> Regards,
> Andreas

