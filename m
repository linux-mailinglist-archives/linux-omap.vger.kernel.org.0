Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82222413D38
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 00:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235769AbhIUWCk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 18:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbhIUWCk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 18:02:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E026EC061574;
        Tue, 21 Sep 2021 15:01:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r5so1819630edi.10;
        Tue, 21 Sep 2021 15:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZRlJKVUEaKoiATTeMhFAUP9e2IswQR8T2RRZ+vhS3Y=;
        b=oZxf3681MFqhPBu+V5CFmtxCB8e3TgZG815ynPuhsInkw5lkg3mhuc9DvPPsuLiQIa
         N9fTOVJOhq5852+P6f/y0Aojsl33hV313KFXj6+rf65rzFoAe3nACGjpT9lSvlVqbYaE
         zmIj2dVP0AZpaUy834Fe80J7JmuxtemJaAF6jFw6ivzNrpr0hIt2jfu1ENdJblY9pg0d
         acuy8qCAsiOciGFpWU2w8FnxoUuqHqJasj0/+PlULvYgjtzwN4KgjTnv7LeaSfiDrZB1
         yMEcYji19URkwZFuE5cjvfAJILMly4B7JnZw8pukGlDYlTe2tT2oCRx7z4Q9UX3kXlHj
         p7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZRlJKVUEaKoiATTeMhFAUP9e2IswQR8T2RRZ+vhS3Y=;
        b=aOZGa860MMZnxDTP7i82+owO5dgLS/kl9omgp088OTcPJfsUipOgTA41GNx0x5xcsZ
         5ZbG+USzLu2cpk1BLdvSWtOuaZqcFL7vlYUHoXmFU8GYnqI7qgni6gZO/I+HNWIEiB9H
         UgQlVSSYAfuUMLMf20SB/4IAeYHrvdHcDtyDCfRA+BgLno47XtHpFROYSOOtvdMwCc6p
         5zLgBDQ39TF7uW6sW69LJ9voH/wfw8QsOoEjjx4vO3tQv8NhPafICK6rYUMszkQ3ez/1
         5vhdjx0HUBBHPJTMrbAjuLbq0vW4IHg1c/HHeXvDYwD7k6wjXRSBxdsHjO9FVyX0n3Sd
         IZ6Q==
X-Gm-Message-State: AOAM532Mw0nzTZU6RPuQ5yiQI1BbvsNAv00EIQ87tjsGGVCPQKVj4nOg
        D5WNIP0wgdWZyvaAEygUtcmlOkn+WymrkxmlFhIRn1Hza724Lw==
X-Google-Smtp-Source: ABdhPJwoRuFtRJyvlmjEy8j1ySn6114OTo0xvMrZBWDLpKe5qdhHtY4Vt7IFBT5SaohKJwQhSePdI4eoTHN9aI9j9rQ=
X-Received: by 2002:a17:906:608e:: with SMTP id t14mr38091512ejj.441.1632261669195;
 Tue, 21 Sep 2021 15:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com> <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com> <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com> <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com> <YUmOGFUFONR/ynfW@atomide.com>
 <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com> <CAEf4M_B1vam_ykRZmQ5++QArC-=+yooRg25BrQXKE5nk8AtqbA@mail.gmail.com>
 <40077cea-1f5e-de67-58dd-7fae0f63678d@ti.com>
In-Reply-To: <40077cea-1f5e-de67-58dd-7fae0f63678d@ti.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Tue, 21 Sep 2021 17:00:43 -0500
Message-ID: <CAOCHtYjMO1XjLRGxP1GMFudXh3meNQB2F44z_NRaFUnX=Fb+Mw@mail.gmail.com>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     Suman Anna <s-anna@ti.com>
Cc:     Drew Fustini <pdp7pdp7@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 21, 2021 at 4:54 PM Suman Anna <s-anna@ti.com> wrote:
>
> On 9/21/21 3:29 PM, Drew Fustini wrote:
> > On Tue, Sep 21, 2021 at 9:09 AM Suman Anna <s-anna@ti.com> wrote:
> >>
> >> Hi Matti, Tony,
> >>
> >> On 9/21/21 2:47 AM, Tony Lindgren wrote:
> >>> * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
> >>>> Finally, adding the udelay(100); (as Tony suggested) at the end of the
> >>>> omap_reset_deassert() did make the oops go away even when pruss_tm was
> >>>> enabled. I don't know what would be a proper fix though.
> >>
> >> I have been able to boot v5.15-rc1 just fine on my BBB without any additional
> >> changes [1].
> >>
> >> May I ask what is your BBB board version? My board is rev.A5C.
> >
> > That rev is quite old [1].  Would you be able to try a Rev C?  It has
> > been in production since around 2014 with the move from 2GB to 4GB
> > eMMC.
>
> I don't have any rev.C boards handy to try.
>
> I am curious to see if there is some correlation between failures and board
> versions. I see that there is a minor processor change to AM3358 from rev.B
> onwards compared to the AM3359 that I would have on my board. PRU-ICSS IP would
> be present and supported on both though.

Rev B vs Rev C shouldn't matter..  I don't think I even have a Rev
"B".. A6A, B, to C* was done very quickly at CIrcuitCo at that time..

https://elinux.org/Beagleboard:BeagleBoneBlack#Revision_B

"This version moves to the AM3358BZCZ100 processor as we are no longer
able to get the limited production version of the AM3359AZCZ100."

I'm assuming the AM3358 had the pru enabled..

Regards,
--
Robert Nelson
https://rcn-ee.com/
