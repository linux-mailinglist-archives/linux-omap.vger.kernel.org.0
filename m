Return-Path: <linux-omap+bounces-974-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99C88C8BB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Mar 2024 17:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26F73B22047
	for <lists+linux-omap@lfdr.de>; Tue, 26 Mar 2024 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD0513C9AA;
	Tue, 26 Mar 2024 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tA8AzJEU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D17C13C913
	for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469620; cv=none; b=E+c/JSx4JI/mIKdhTzxV5hqzIRL8SZqOoDErNQ9qYGNcl/TA7guafpCWYL9/JThiSc/gqvIujwqYfQia6U/rsgBMbP+NLdYmrGW8sKjmo/nbbaNW2m0NTY7ZzgwKXhL9WGPIwu5R6SK6GwHeaYguK8t4AFUBd8eqeExgfvbIdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469620; c=relaxed/simple;
	bh=eK+R0ABmPGj+plzVUUZwmM346UOQh8NwmmAsoudMd8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UczHT6OVu/K/TZmNnP+eQzO/58r89t1wGr0pV64xi4saQt5sFRfhM4ZExM3OgRnJPtIMvq3bkPeUjkRTbfDKEVlD6S1Ao7m4Fzu9kjtYPI1kLf7z+v9tmLAGov1NtzgdAf7A0A2SAncLrNRdbNmnk8CY6J4HVph8vDO67l9nhgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tA8AzJEU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4149258d97aso811635e9.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711469617; x=1712074417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4LiCt10IxAVvpC47LPV/rkaTjlk1NiUuFvMFGxx+OU=;
        b=tA8AzJEUBfZfbOxmEXQLa4fU1EZiyEAyhhe96be+6LVgsWj6PKS4xwmD+xF6ZQJbz0
         DoyEOhEtLyspx/FBLtCJ+w1N7gyKVSuaGsBhb5alk9/ZGPRL1EO4oENG2R9nmCjrZs3Y
         PyCf5t0lYgmImYgaNtduZbRTCiE6xGMORuqirC+Kyz1E1Jv5GGZlq/hex/4MY463ksDj
         Gsdli7inrFc9n7jlFTdS6ui5Z/WoR959XQG+nE+cXpNc09/lzh4O2ka+kbjzWkf+Duyc
         Qg9sKG3WOo2oWCZRDiwoXWbVa9ADXCFCcni72ykzdxllEQnAjINvV0SU5WcuznLIgQ/F
         LbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469617; x=1712074417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4LiCt10IxAVvpC47LPV/rkaTjlk1NiUuFvMFGxx+OU=;
        b=UZ/purmDs1B27/sQ+0fD20HzPbJybMpm058qMX7SXQgFd1uPRbY+q14+c61cMHcH/7
         fIyAoW0RPks384jSrw1Oh8HweoQUiaQVunnY8oaLU+WtTO3HFKoTsNydIL5fRM2JHysn
         8/C8hndhp/MXtCkqeE8G/4SL4GKvwo9nD5RYZDX2EheOTv0tO6jaRQzbxVz2C3F3e+5C
         sGYgZnvSWp5Ue7gnsxgtSgrZ9crySgMSXMBx9JiJN7SItt/Udjx+qCrqncm0eUMO1H0A
         N7/W7R8Wgo4QnzGhov32f/Dm8OPDJyL6a/C5oNXn4wQiB0uj8MJxSRCARJZNJ5hh/HBe
         2XJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdAnkuTu11Ez8egHBpcBeTgtpZluc632IoyVIwFsvphUxriyxGJjshliMaUu50C8tLZASr+vz9aPxs1b/4i5be9fm9ql/XNy53Iw==
X-Gm-Message-State: AOJu0Yw+4VCWSVWiKEWRLpPnrk370ngGg1cN7ZGlfoReaqgfjx6gtgmL
	PT1h7ERdsSSePy2CIE6BdYGIrLPnxaezmKHjInq+l7ZURfCmpMOQ18m8Vj5VHuNpndHgrrloBOw
	MCcI=
X-Google-Smtp-Source: AGHT+IFae3IpvTMwhmsZ1ahvm5eyBHH+iWrgwf59wOFSRYY+Mv6/7CtoeKIPxy/CsrVObCbGtWXjLQ==
X-Received: by 2002:a05:600c:3553:b0:414:8fa5:b9a1 with SMTP id i19-20020a05600c355300b004148fa5b9a1mr1703262wmq.5.1711469616510;
        Tue, 26 Mar 2024 09:13:36 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:821e:6f3b:6b50:4762:8343])
        by smtp.gmail.com with ESMTPSA id q13-20020adfcd8d000000b0033eab3520a9sm12484571wrj.43.2024.03.26.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:13:35 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:13:33 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Mirevik <markus.mirevik@dpsolutions.se>
Subject: Re: [PATCH] gpio: omap: Fix double trigger for level interrupts
Message-ID: <niruat6lxth4j7cmb7flo6pyipmnfym5evt6amszogkhtt5kkc@njhz7h7uciz2>
References: <20240326145439.1293412-1-msp@baylibre.com>
 <6ecd284a-e3f5-4b69-b6d7-129da6b385c1@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ecd284a-e3f5-4b69-b6d7-129da6b385c1@moroto.mountain>

Hi Dan,

On Tue, Mar 26, 2024 at 06:29:45PM +0300, Dan Carpenter wrote:
> In the bug report email thread Markus Mirevik said "The interrupt
> associated with the GPIO module still fires twice" so while this patch
> is an improvement, it might not be a complete solution?

Yes, that is possible. I actually only had the level interrupt
double trigger bug which is fixed by this change.

> 
> > This patch was originally proposed by Grygorii Strashko.
> 
> The way to give authorship credit is you make the first line of your
> patch:
> 
> From: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> When the patch is applied then git will assign authorship credit but
> remove that line from the git log.

Thanks, yes I am aware, though I didn't want to add that author tag
without someone agreeing with that. As it wasn't a formal patch, there
was no From: already present or a SoB by Grygorii. Also there was no
reaction on a ping from me on the original thread. That's why I opted
for the comment in the commit, the explanation and as I said in the
letter part I don't care about author, just that it gets upstream.

> 
> On Tue, Mar 26, 2024 at 03:50:14PM +0100, Markus Schneider-Pargmann wrote:
> > Set gpio trigger before clearing the irq status.
> > 
> 
> This commit message needs some work.  When you're reviewing on email,
> it's kind of common to read the commit message without reading the
> subject.  See how the patch looks like on lore:
> 
> https://lore.kernel.org/linux-gpio/20240326145439.1293412-1-msp@baylibre.com/T/#u
> 
> The subject is up on the first line, but it's mixed in with the headers
> so it's easy to skip.  Go ahead a restate the subject but in different
> words.
> 
> But also copy and paste more of the problem from the bug report.  To me
> if I were a user the important bit is that the bug ends up hogging the
> CPU.
> 
> "The problem is that the interrupt handler was is run twice for each
> frame.  It hogs a lot of CPU time.  Fix this by setting the GPIO trigger
> before clearing the IRQ status."

Yes, thanks, I will work on that commit message.

Best
Markus

