Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AE694E07
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 21:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfHSTZs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 15:25:48 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41544 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbfHSTZs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 15:25:48 -0400
Received: by mail-io1-f65.google.com with SMTP id j5so6809029ioj.8;
        Mon, 19 Aug 2019 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IW2hNOgaGAhtVKVbFveM7e3CASK/u5xs4xw08BBQkjk=;
        b=kFa+nliwb0WiSrofl/PVnxn3vvbQ17mDaZ80crUjGr99YFnxh8QWSCq49gXtoD4foC
         u0nNHMiKr3qcwIkPfFyFJn9rP0NQp8vGY4RBzLLdKSdY7ugz0cYgW/qKfR3zUzidExEb
         VZkyNCo0jNcc2EhGsiutfizB2DAEu0UJcflAEdjEmAkrCwopH06k5nSmEZwMe7EHwdno
         9+WHd7KvaL+TrMlCRDLQholohr2QjdURZlHttU6YFdNI0gd05ncP4ypqGcdGwCpp7UxB
         3zFRvpj14Gddw2E8ccZwd+uoWo4Izww1mxJohUwAyZ0spGxEjATbdSfv1I2NjpERw1Gi
         PIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IW2hNOgaGAhtVKVbFveM7e3CASK/u5xs4xw08BBQkjk=;
        b=eJAYHUpyzymD+Gotou+91B27HaRwc9cj438XuNPtJhiY6fGoC53co5AQyR4ceZLEjv
         R/fTaGWFU4SE1cP2ZtJbFuTZeO6m29np6utdjYpuaJxPSgsg+vPwADKcjoCdqtu1Gara
         sn9o0EehUAV5EkGkfhjSBU9qSOS4k63VEgnoHw2aZ1Q+xd6B60ESOKHJflviP87YrMf1
         THj/wV7vux65kI/Q+MSWOTwmVsttH7RlZxclYO1en+Pm70dv3v3n5ErCiqUKc8Y6vxx+
         9KnXYgfD69zT1G9KDU9vPz71/UyQ6YtckqfBtfFkKY5GbS/NYf7+OwfFwdRw7Oh0dj5Y
         CRsQ==
X-Gm-Message-State: APjAAAWHg6wbygfL7SEO7oyOOvDNdiISk3aIRxyDmsymUjUvBvxIUVEs
        pMVakDg86fxLpBNeHzmdLJPbkJ0sjE2s3JIwkl0=
X-Google-Smtp-Source: APXvYqxEq5gf0BV7WQJCst5IFfE5iZ1TCosSe9jZ4wtQGCkfQmHLjWSsN04mMBJGjq4kc+y34BWNtBX2lQxF52Lmd6U=
X-Received: by 2002:a5d:824e:: with SMTP id n14mr3889053ioo.205.1566242746795;
 Mon, 19 Aug 2019 12:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <20190814094755.GC52127@atomide.com>
 <6A6394A6-9D50-4E43-A8E4-716888897AD6@goldelico.com> <20190814131607.GD52127@atomide.com>
 <CAHCN7xJ2kcr7dOFvxTB_PX_62sX_QV5EyeMPHMaPbZ9fXts9pg@mail.gmail.com> <20190817070307.GJ52127@atomide.com>
In-Reply-To: <20190817070307.GJ52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 19 Aug 2019 14:25:34 -0500
Message-ID: <CAHCN7xJH6ZjksNZ2cyb1rN_TiF-0GKAtW9KD1kv1-JE+gqLgEA@mail.gmail.com>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 17, 2019 at 2:03 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [190816 23:02]:
> > On Wed, Aug 14, 2019 at 8:16 AM Tony Lindgren <tony@atomide.com> wrote:
> > > Well I just posted some sgx interconnect target module patches. We might
> > > still have them in v5.4 assuming people manage to review and test them.
> >
> > Nikolaus,
> >
> > I tested Tony's change and I can confirm that I can read the value
> > when enabled.  Should I apply his patches to your branch before I
> > test, or is it go too to go as-is? I've got an AM3517, OMAP35 and a
> > DM3730.  I am not sure if the AM3517 is even on the radar, but it has
> > an sgx530 as well.
>
> My estimate is am3517 is wired the same way as omap34xx with a 60%
> chance, then 30% chance it's wired the same way as omap36xx, and then
> 10% chance for similar wiring to am335x.. So hopefully that leaves 0%
> chance for yet something different for it's wiring :)

Based on [1], I went under the assumption it was wired like the
omap34xx.  I applied your omap34 patches to the am3517.dtsi, and I was
able to get the same response as I did for the omap3530.  Do you want
me to post the patches to the mailing list, or do you want to do it?

adam

[1] - http://processors.wiki.ti.com/index.php/GSG:_AM35x_and_OMAP35x_Rebuilding_the_Software#How_to_check_for_SGX_core_revision

>
> If you have a chance please give it a try. Also check the TRM for the
> sgx sysconfig register bits to see which of the above matches, and if
> 3517 has a related rstctrl register like am335x has.
>
> Regards,
>
> Tony
