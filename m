Return-Path: <linux-omap+bounces-2666-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096B9C572D
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 13:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404F4283929
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 12:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFB21CD1F2;
	Tue, 12 Nov 2024 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEUy/Mfn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D21CD1EA;
	Tue, 12 Nov 2024 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412769; cv=none; b=b/gwgT0rGVnnsvdHjbnBduL0KlUfqhfahjSGVzeS19klSPFP4lqYQfbvzmmXb6IMgYuINkZ5BR3XJ5Eyu6leXVkyI/swJc5PuDVGk6MQVAbhs1fwWReDaBiILvYhADDN0W/yGCU0aCxsRxGA8jZ2fmTFWDIDTsNm3T9jtTF5wRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412769; c=relaxed/simple;
	bh=PjEMPTHCak3XxATDMk+bKj7lc1dnyeFL/rDATmrine8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJLXJazP2avCxounkqk584HI+fiQ39icRZSMejcDfFEhXsxl/52bmzBydHMffs8EU8dsgBDcdlwu+Lf8oxh1IPIjgmQfF0r94wN4Awnm1J4Pzk33xnSzbSJ9c9MM6ObBr/QoQgiGBjWuo+CIYSK+QU/eaA1PGVl5s7MmVNqEY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEUy/Mfn; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84fe1bc5284so2198142241.0;
        Tue, 12 Nov 2024 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731412766; x=1732017566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ScaGh7birwqAzyg0xZkg9rIbDwZ00cVYU/HhgVJglE=;
        b=nEUy/MfnpyAug3Sd4khhBOI8o0Hx+zb5r7jPVkSu6bkomCFabythUi6mbuvmQ4pXu1
         AVtwmogKC5Ah9Bpqsr5a4FRX/xcP9JYX9j5RDKDdNwm2ZL0couJA5zVLCtiQwRWGvjSY
         cqgFR7+ZG3rNu8q1BldgCtbRiqjCjasNhznSutdCQyIVDolrK3fZeyfzqvn3tlB/nqSg
         CuBSkdEOVIWsVJw24gGMNLWhzV8qEFaNZbzCze+XkHKS78/+7C7aGaCcWgNRMPJ4vs8U
         PdLY0dsBOSUs+Evqkf77cpdVnyI3nPKNeWF2qpafq1MRQ/zBQq6Grgh6fCghVKt81erq
         87oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412766; x=1732017566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ScaGh7birwqAzyg0xZkg9rIbDwZ00cVYU/HhgVJglE=;
        b=k1BTNYVqbfCPy81XaVuZE1eqpwpvtQhyHbuBEoETpGAGA1w298DnTcXGFXy5Mr1n2y
         402KOCH34Mr7k+oUMfu/KF7Xcu4lgPc1mSTWiBfvmWSye64DVpEwyfdSGGClFGfvMhxN
         WG8I+p/3g7hiJBWKQrh7C5+QexL9RFQjI2KYvqSDNDKiXDKGfiVg7G6b2rr6QLTf5xga
         T61WedzOoF2PzOz6nNUVkUtJQaOVf57/Y+AmUidvlZMZyrg157kgdbjqfDT9uwmlUFqy
         MPyFHY5bob+1b2hfchq8bpJfC4n6ryoHl/G7RVlNo91HBvBmuGQ4rdYg9Oeg+mcFCzFB
         OMHw==
X-Forwarded-Encrypted: i=1; AJvYcCUhkLeD4zDhBvD9RyWuXEexTBHAzjEgdMVz+hEroRmL3qTRrL6aMWAGQhw5xfxNSP3nw8Kk9qhIuspkqQ==@vger.kernel.org, AJvYcCWeizStjh9Z6n6twHr8+uMzZJNKknGrDC5M3f3BJbMHgn6srsRD6SdlP8QsGCk9IfnM7yMg6fJGXvoulEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUxMMiHtkEI181vYBZR0HesHnfpbXYLxccIVnQsGb4+BqSYOD
	6rGCUozFkl4NVITCR3U7bQw9H6veArpaF2dwcgW7jRckccfLr0uGNolKZjLXMLhxMuPSgjlCxj9
	CyPBu7Oej3EwoMsCCPWhnXg4G4xk=
X-Google-Smtp-Source: AGHT+IGQS8XY7/QHzef3KBtvwXGEKi+eJTxHLVllj4K/SRPIkB0CYBtOwQVQWIQUVKSJ30wdTs5If9oKZJRC7thpST0=
X-Received: by 2002:a05:6102:5488:b0:4a3:ba8c:879 with SMTP id
 ada2fe7eead31-4aae134e961mr13494624137.2.1731412766368; Tue, 12 Nov 2024
 03:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106223324.479341-1-karprzy7@gmail.com> <20241107001507.5a304718@akair>
 <CAKwoAfp6iPN0F_kfNbF8xbpX7+Qh+BS55KgmZ5nis0u00vOFhw@mail.gmail.com>
 <20241110002954.1134398a@akair> <cd915c18-7230-4c38-a860-d2a777223147@kernel.org>
 <20241111205708.562abb1c@akair>
In-Reply-To: <20241111205708.562abb1c@akair>
From: Karol P <karprzy7@gmail.com>
Date: Tue, 12 Nov 2024 12:59:15 +0100
Message-ID: <CAKwoAfqFAXATjzSgKJu+pF=igs3dDJOWakOQ0jt9didArHkKXQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: omap-usb-tll: handle clk_prepare return code in usbtll_omap_probe
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Roger Quadros <rogerq@kernel.org>, aaro.koskinen@iki.fi, khilman@baylibre.com, 
	tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Nov 2024 at 20:57, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Am Mon, 11 Nov 2024 16:41:47 +0200
> schrieb Roger Quadros <rogerq@kernel.org>:
>
> > Hi,
> >
> > On 10/11/2024 01:29, Andreas Kemnade wrote:
> > > Am Thu, 7 Nov 2024 12:12:52 +0100
> > > schrieb Karol P <karprzy7@gmail.com>:
> > >
> > >> On Thu, 7 Nov 2024 at 00:15, Andreas Kemnade <andreas@kemnade.info> wrote:
> > >>>
> > >>> Am Wed,  6 Nov 2024 23:33:24 +0100
> > >>> schrieb Karol Przybylski <karprzy7@gmail.com>:
> > >>>
> > >>>> clk_prepare() is called in usbtll_omap_probe to fill clk array.
> > >>>> Return code is not checked, leaving possible error condition unhandled.
> > >>>>
> > >>>> Added variable to hold return value from clk_prepare() and return statement
> > >>>> when it's not successful.
> > >>>>
> > >>>> Found in coverity scan, CID 1594680
> > >>>>
> > >>>> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > >>>> ---
> > >>>>  drivers/mfd/omap-usb-tll.c | 8 ++++++--
> > >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
> > >>>> index 0f7fdb99c809..28446b082c85 100644
> > >>>> --- a/drivers/mfd/omap-usb-tll.c
> > >>>> +++ b/drivers/mfd/omap-usb-tll.c
> > >>>> @@ -202,7 +202,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >>>>       struct device                           *dev =  &pdev->dev;
> > >>>>       struct usbtll_omap                      *tll;
> > >>>>       void __iomem                            *base;
> > >>>> -     int                                     i, nch, ver;
> > >>>> +     int                                     i, nch, ver, err;
> > >>>>
> > >>>>       dev_dbg(dev, "starting TI HSUSB TLL Controller\n");
> > >>>>
> > >>>> @@ -251,7 +251,11 @@ static int usbtll_omap_probe(struct platform_device *pdev)
> > >>>>               if (IS_ERR(tll->ch_clk[i]))
> > >>>>                       dev_dbg(dev, "can't get clock : %s\n", clkname);
> > >>>
> > >>> if you add more intensive error checking, then why is this error
> > >>> ignored and not returned?
> > >>
> > >> Thank you for the feedback. It does seem that elevated error checking
> > >> is not the way
> > >> to go in this case.
> > >
> > > As far as I can see everything checks ch_clk[i] for validity before
> > > usage. Also clk_enable() called later is checked which would catch
> > > clk_prepare() failures, if there were even possible here.
> > >
> > > So the only question which I am not 100% sure about is whether having
> > > ch_clk sparsly populated is normal operation. If that is the case, then
> > > more error checking is not useful. If not, then it might let us better
> > > sleep. As said as far as I can see errors are catched later.
> > >
> > > @Roger: what is your opintion towards this?
> >
> > I don't see usb_tll_hs_usb_ch?_clk in any of the OMAP device trees.
> > Could it be that they are optional?
> > If so then we could convert it to devm_clk_get_optional()?
> >
> They live in drivers/clk/ti/clk-[54]4xx.c
> But nothing about omap3. So apparently we can have valid use cases
> where these clocks are not available. So no real need more anything
> more than dev_dbg output here.
>
> Regards,
> Andreas

Thanks, I will send in a new patch then. I can also take a look at
updating device tree binding.

Best regards,
Karol

