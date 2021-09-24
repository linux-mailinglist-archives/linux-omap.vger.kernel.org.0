Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1214B417B34
	for <lists+linux-omap@lfdr.de>; Fri, 24 Sep 2021 20:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345615AbhIXSmh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Sep 2021 14:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbhIXSmg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Sep 2021 14:42:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2274DC061571;
        Fri, 24 Sep 2021 11:41:03 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id dj4so39650294edb.5;
        Fri, 24 Sep 2021 11:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZdpXNyxjoguw4SpG2ToQxddz4vS+H2dKBr6zzskz8BY=;
        b=QlA7TV3BczZSC4oZ/+haPZxDqtjl2zAjUXwQSXTdywWWnnvAyYdIesW5m1HQWsi3jD
         jMk9N5hDS9bgdW58Mbo5NISkKLIiBSxKE/1/fjjGjeOqqX30OK59YOuUitwrJbfnVjk4
         gM7+xVc5SiMEjiXkHq2MdDDTyl1SOvBEVHvAwFZAcqxk+J1uTlnYYmz3OwWzQUH+cGcU
         XwRNojpmhCXWAVKIuWZZ4NBsN/TR9Py3Pt/6Mq/M+/nirA4jEfJtmYcXq2Pq2vkD8O+X
         kQXphIBE3n8e0VOlvlWhW4hR+BkZkJ8tATcRL5fCQP6AiIwh3YUITadKRXdWK9u1umBm
         UIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZdpXNyxjoguw4SpG2ToQxddz4vS+H2dKBr6zzskz8BY=;
        b=2Is+LXuuPrSyF2J1+9OqJduXo9/nZEMSEkSXlWinpAJ6Ur/symM9tx+ofMnNTMufsk
         pDK1YCZnFhlp9GT23oFKXyI0tAdA30MQM+GDvqkJJsNKxZeG/fdGlDsvdZIi3BR3hzlq
         L7IqhLxaZrNBF9fMOhqfeuRMiK7/jyVRgl+eJEcOHCEY82DMwwx4dKq0JH9Rtx4JYiDH
         UOFvS67HSb5u6+VNJvz2wlU3hZro5CKqkVnMWz+hKlBjyPqkbXC9UEjcl0PeTNdeR/o0
         K/ME3oKG5sKoWvk7JjFcFG6kpgMRYmIJYD1HYXwChKFDR6V9qnGz1tUUXQOWvNbPkBqy
         RopQ==
X-Gm-Message-State: AOAM532uEVG3t0l/1A+mniH5Vr+ntRl+MNMZlIi7kE/D62J+4d7ZoylV
        qfCuxeefIWAqIEyp4lArWxrV7zDZAyc67rGkdxs=
X-Google-Smtp-Source: ABdhPJwABf/T3PdSYk0saA/5ZkQz8dyRLJ5s8cOMK4m7Z1EkeupEm1vNk62mM/QBkPsvGB276XnLipls40B0gQZNNxk=
X-Received: by 2002:a17:906:608e:: with SMTP id t14mr13157211ejj.441.1632508861453;
 Fri, 24 Sep 2021 11:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com> <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com> <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com> <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com> <YUmOGFUFONR/ynfW@atomide.com>
 <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com> <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
 <9c80c7af-daf5-c521-fe59-1f0c222a23e1@fi.rohmeurope.com>
In-Reply-To: <9c80c7af-daf5-c521-fe59-1f0c222a23e1@fi.rohmeurope.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Fri, 24 Sep 2021 13:40:35 -0500
Message-ID: <CAOCHtYhC7f43wz+G-mxwutzoJDm8rhZWxf4Jd9+VHAbxPfPjTw@mail.gmail.com>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 22, 2021 at 4:28 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> On 9/21/21 19:40, H. Nikolaus Schaller wrote:
> > Hi Matti, Tony,
> >
> >> Am 21.09.2021 um 18:07 schrieb Suman Anna <s-anna@ti.com>:
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
> >
> > Same for me with a v5.15-rc1 based kernel.
> >
> >> May I ask what is your BBB board version? My board is rev.A5C.
> >
> > I have an Rev B6 with EXP41 display attached. I think Matti reported a Rev C board?
>
> Oops. Yes I did. I _thought_ I have Rev-C (3?) boards. Not exactly sure
> why I think so - perhaps that was what I ordered... And I really think
> the ones connected to automated test setup at the office are Rev-C.
>
> Now that I tried to verify this - The one which I used to reproduce this
> issue (and now verify the patch from Tony) at home, seems to have say
> "PCB Rev6B" on PCB. However the u-boot says:
>
> =>  printenv board_rev
> board_rev=00C0
> =>
>
> but I have no idea where the environment variable comes from...
>
> Maybe a stupid question - how to find out the exact revision?

Run:

hexdump -e '8/1 "%c"' /sys/bus/i2c/devices/0-0050/eeprom -n 28 | cut -b 5-28

Then lookup:

https://github.com/beagleboard/image-builder/blob/master/readme.md

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
