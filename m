Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E5E3C6D06
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jul 2021 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhGMJQy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Jul 2021 05:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbhGMJQx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Jul 2021 05:16:53 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68879C0613DD;
        Tue, 13 Jul 2021 02:14:03 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso1513682pjx.1;
        Tue, 13 Jul 2021 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gCWRD2y3DyADZfLS/zLOnATOKrBaiuB9hRtzHViF/A=;
        b=qN6Bc0MZ/Rd2xInoheIiNxYMDMrV8qWyqcCOqY4ZI6TcYJX7yKyqntIQL4fmOSPWpY
         SBSvoPB8ySRpNVnZ2y0NdEXsyaQWtJyKiYa/lqgP2IUxNtPgX1IIKHdl/S/HXHCa/wFc
         CSzhUg8JJi4ty0UWwUx1/u7+dD41D6bqVvKF7NFvGz43Ki6GiOazhLiHhgfXUmP96irD
         ohvv/XYBuEZcnyAtBnrH7K3G+CsHzC512nWIBFM9/mkARzGm4ku+1Y6QkxkixrCG47Qr
         x4kycecbe4aJ08yxvb5Eypsq2Kjc3sjqilCscub/WBHNSsCtQy4+FEKe62TbElO8ziPh
         M7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gCWRD2y3DyADZfLS/zLOnATOKrBaiuB9hRtzHViF/A=;
        b=VJmfsD5xmExEApdeCapdHX7PF5UcLrlhYU2qpjM1HvwtyQMeYqtBOkmqk/AJQKoEa8
         d2edxkjZj6zeqh8vPZnGKI9BY8T4O8+rYOLWuJYQ/tfFKwRU3zgpzAYw7PqsRZZc7dTR
         QG3OZJF4STA16iILX2K5wfDEtCeFOt/saWpzFY5ksh99U8BD43tEl//E1DRaXUSFHUfn
         9MflnSZQjQQ0weFB2Mf3saKrOg+4nTk2s/Gx2KGVZ7zPN21v+jVGXMKHs7yTkDnA6fiy
         GkqqYHp1zfQiDSrw1yjDFui7BqQVn0C4AivBLDZEO8JugVOLyPDlVVHMFnZfkhCOilH+
         kZGA==
X-Gm-Message-State: AOAM532yrgMhzzqMmaMGjjpwimVN7BDjFRWqyyjhnv2/IkRseOe1Ze6K
        /1SxNsoRMm2ciawfi+uvMZsFrj4sScyVMcWmzvU=
X-Google-Smtp-Source: ABdhPJxziYQ7soXITlryHp6gHsVUwv770WRHhFT97OgxxMZDnIB9EoGppFWULfIA4EyOGksVucYO3r0qYbe26ZiTpO0=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr18585146pja.181.1626167642948;
 Tue, 13 Jul 2021 02:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210511151955.28071-1-vigneshr@ti.com> <YJ008MjjewRUTn9Z@kroah.com>
 <YLCCJzkkB4N7LTQS@atomide.com> <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com> <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
 <YOylnHudkwcHHEeZ@surfacebook.localdomain> <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
In-Reply-To: <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Jul 2021 12:13:23 +0300
Message-ID: <CAHp75Vcxtk0f2KRSL8gh2mz-AYE7Kav6co8N8XMbsvtyLohG5w@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 13, 2021 at 11:54 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> On 7/13/21 1:57 AM, andy@surfacebook.localdomain wrote:
> > Tue, Jun 22, 2021 at 11:53:38AM +0530, Vignesh Raghavendra kirjoitti:

...

> > https://lore.kernel.org/linux-serial/20170206233000.3021-1-dianders@chromium.org/
>
> I am not sure if reading UART_LSR is a good idea in the above patch.
> Some flags in LSR register are cleared on read (at least that's the case
> for UARTs on TI SoCs) and thus can result in loss of error/FIFO status
> information.
>
> > https://lore.kernel.org/linux-serial/1440015124-28393-1-git-send-email-california.l.sullivan@intel.com/
>
> Looks like this never made it.

Forgot to react to the above. Yes, they never made it because I
believe due to the exact reason you mentioned above. Also California
set up different experiments IIRC and it shows that the problem didn;t
fully disappear with his approach. But maybe yours will work better
(at least it's not the first time I have seen it on different hardware
according to people's contributions).

-- 
With Best Regards,
Andy Shevchenko
