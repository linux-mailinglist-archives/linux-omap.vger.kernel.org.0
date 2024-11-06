Return-Path: <linux-omap+bounces-2589-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA19BDA0F
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 01:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 726682847F0
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 00:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70BE1FC8;
	Wed,  6 Nov 2024 00:06:48 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C836D
	for <linux-omap@vger.kernel.org>; Wed,  6 Nov 2024 00:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730851608; cv=none; b=hEJi4yygX+qzpPvxqHGap9nUA9QmHb0EawwMz8vQYktIAO24dgBUM/pgRw4wfYvdNRfe+tO6AD2UYE/VZW1RW05BWg4ZK3tByoRVDzAJ/KSa/P0u/7tekuSQoD6tcGLP7d0STjZgW6B2J0M0elK8CcEjbXeITqbO2KLBQeo8gqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730851608; c=relaxed/simple;
	bh=+iJID/0K/KasOwTpLpR4XJKYN4rMSxO66SLic9HxW6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=On8ZF6+O0NtivW0UVNe7U/3JQyYfhLBe6jr76+/gtKz9h5STlzKkY73I/a2uHAVhNsSYA2hFHE5twzi+LX9GGAEc8VGYV98jh0ENDMOKIEpVVKLjdF3wfylG20Fy3Fh2eQu4G1UPpFGZWEuD5uTKnxflfAw3vJesQbdqcY2ljgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4596588a12.3
        for <linux-omap@vger.kernel.org>; Tue, 05 Nov 2024 16:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730851606; x=1731456406;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpxbqm68LJQ46p8jy6SSwPvqm4guZpDNWNtKHjTy7tU=;
        b=bE+2Urk3wzc+f3HrWsEMfd5bJwoUKph6ZBOuE3enjATkJ8Wo0MvwG5OCrEngFvljk2
         jlam1HLycgWaEfphkTj0GGTj5XmKgHmOHGoEEDKggYKqoEejcKyLUMJZM9T0q8fXMKa9
         XPJkY8Fa8KKzu4v5WKgWdZpQj9YIaQXkL5vjD4O2nRacsbmgEte4uwE4SxFI5L/JLxwy
         ixVqfDAo8WFp6ErImrWM8Sa5VW/lDM4h13qh382K/wa6btpbsfI8o4RokpnQIBCEKB/W
         bu72VVz3GEw77RH9bPsS5hYJ+44K6+ilSihuOh7+PwIPo763t1pDGGUyffSmO9Upa9IO
         NCMA==
X-Forwarded-Encrypted: i=1; AJvYcCUeH3fEE4MhzUnw8xNgK8krsFAlbvRyTdRzPJlRfBJbzEEluenAQJmY2YkYU7krhOvfSQM8/BCU5Ua8@vger.kernel.org
X-Gm-Message-State: AOJu0YxhU/6c3+TYTpC2AFGgwFG/a+x9rz7Axx1Gvsppid2qW92JaO48
	yapOU15BZlqFsP1wn7+gi9LqQOh64XsZbu/GJtGP1euNsLtpcS3cwEWM3ovaAr4=
X-Google-Smtp-Source: AGHT+IE9eRsulH8cpjXGO7rVfrMbZI2XkHJeWXdq3TUXvQidK4aPFSF5njxwl9FhW4xyLO1oH9euXw==
X-Received: by 2002:a17:90b:5448:b0:2e2:e8a9:a1f with SMTP id 98e67ed59e1d1-2e94c2c30famr26322573a91.13.1730851605690;
        Tue, 05 Nov 2024 16:06:45 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a584e68sm129403a91.32.2024.11.05.16.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 16:06:45 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bin Liu <b-liu@ti.com>, Judith Mendez <jm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
In-Reply-To: <20241105190005.cg6dpeedbirgflqm@iaqt7>
References: <20241031145652.342696-1-jm@ti.com>
 <7h5xp7owmy.fsf@baylibre.com>
 <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
 <20241105190005.cg6dpeedbirgflqm@iaqt7>
Date: Tue, 05 Nov 2024 16:06:44 -0800
Message-ID: <7hy11xjkdn.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bin Liu <b-liu@ti.com> writes:

> On Tue, Nov 05, 2024 at 12:47:58PM -0600, Judith Mendez wrote:
>> Hi Kevin,
>> 
>> On 11/1/24 9:29 AM, Kevin Hilman wrote:
>> > Hi Judith,
>> > 
>> > Judith Mendez <jm@ti.com> writes:
>> > 
>> > > From: Bin Liu <b-liu@ti.com>
>> > > 
>> > > Add omap_gpio_disable_irq and omap_gpio_enable_irq
>> > > calls in gpio-omap.
>> > > 
>> > > Currently, kernel cannot disable gpio interrupts in
>> > > case of a irq storm, so add omap_gpio_disable/enable_irq
>> > > so that interrupts can be disabled/enabled.
>> > > 
>> > > Signed-off-by: Bin Liu <b-liu@ti.com>
>> > > [Judith: Add commit message]
>> > > Signed-off-by: Judith Mendez <jm@ti.com>
>> > 
>> > Thanks for this patch.  Can you give a bit more context on the
>> > problem(s) this solves and on which SoCs/platforms it was
>> > developed/validated?
>> 
>> Sorry for the late response. Patch was tested/developed on am335x
>> device BBB, If you feed a PWM signal at 200KHz frequency to
>> GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
>> even after CTRL+C without these 2 functions in this patch. Once
>> this patch is applied, you can get console back after hitting
>> CTRL+C and then proceed to kill gpiomon.
>
> In addtion to Judith's explanation, when the PWM is applied to a GPIO
> pin, kernel detects the interrupt storm and disables the irq, however,
> without these callbacks, this gpio platform driver doesn't really
> disable the interrupt in the gpio controller, so the interrupt storm is
> still happening and handled by this gpio controller driver then causes
> Linux unresponsive.

Excellent! Thank you both for the detailed explanations.

Kevin

