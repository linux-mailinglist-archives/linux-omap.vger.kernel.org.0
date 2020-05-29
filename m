Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725601E8980
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 23:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgE2VIP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 17:08:15 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57479 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgE2VIP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 May 2020 17:08:15 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVJZv-1jXFrW3PGx-00SLe8; Fri, 29 May 2020 23:08:14 +0200
Received: by mail-qk1-f169.google.com with SMTP id b27so3591274qka.4;
        Fri, 29 May 2020 14:08:13 -0700 (PDT)
X-Gm-Message-State: AOAM533kBVfry7515nw2FO58fm0VolVGsNRuOtb6xc2gloWNRXeSNSpy
        zpkQCoXOu7yUiPurq0t98A79nmpxzbJgxx5XM6g=
X-Google-Smtp-Source: ABdhPJxFupHVYDFPcSPJtjXx99USrcroXAFD74vBC5FcXjhRJGsY5C7kBGxXdMK4b3eB6rTHBHYuQksgQPiI9mEtCKA=
X-Received: by 2002:a37:bc7:: with SMTP id 190mr9595426qkl.286.1590786492475;
 Fri, 29 May 2020 14:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200529201701.521933-1-arnd@arndb.de> <20200529204404.GW37466@atomide.com>
In-Reply-To: <20200529204404.GW37466@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 29 May 2020 23:07:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com>
Message-ID: <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap2: fix omap5_realtime_timer_init definition
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Stefan Agner <stefan@agner.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nSMhIjnJmn3utHGvlBagwTTgYI8VwYRbTTI2LIKIcZCgI4ioHWN
 F43P6i+hcZ2oXwDgOWcAdylmybtXQjvuy8JXmLGSXJpQguc1uHtY7l5gJ2Spf35U0qnJWPj
 KZcSmwmLY+fqh3Lfzvd9Pzv6Hi4g2yGztdxREobJm/XVZwl6STd8/gnOtQSWcCuzP6wOBzg
 drF7Nk+dyNhYb7GJeOB0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K732w3kZ7m4=:3IaMUbrRsH1jMcBImc1vcP
 fbV+eO4znTDeQFQswbLr4HBdwNrl8HHfKsQJVupxtNz3Ppmwevv8AzsfdKUdBkqMIuOXlYZQs
 TijOpYc1houwcFzxVeiajJpGJGJAtlMQ2gowtghEYT66QlccQC3M5lK0nV/o7i8hY+0epqeOh
 cTITLm06iewz6UiTq6sh7ck6IxruDaxy/Ir3X001reymydCgksBw7l7s3eZf05MJpKo+Wr/0F
 GXnVZZd5EZqhK3Tfuc21GYiFdPOxcRM6lg5NFZzKAJpQrDza02MxRC2EhDHnkOBTqnmJ6zc7K
 t/26BAiM3S1QvbPpdkYZMWYKGX/QmAowoZ2spLvdlekUl5uB8oEyI/AM5le4EOR7nqMwwv31x
 HEUMtbJxqa8Xr5qQDpXhcjZuVVsQFr/Em+/xDM17R+Ot/f+jK2OC+hWncp4xrC+85Fh0G+xYb
 Upe73CqlYzQoNvsFhAmbQCIBMRdBzIAFSjU91QacxtF7HkY+BckY/SOKQtScvYNfCiaE37G+n
 r8tK+MWv7p4qGXftlkPpti6oEOuZLUxuMyckar7tHd4euemSXLrb0DJMxyTQeGV7/o6asPu09
 E0bnfBYrFlDvUj18bhq2p0Zf+S7JRNLYMHYfWGUkW/BK2MGPkyiDifdMuzcq1uAaU0X4cTIIe
 XsFzuiLxnAxJPDM0VxhuhWBs82W8NQ7QukjX2FuJz9cRhlvTTMf6Z9Mw4bWhDMveScjoo55g9
 QQz1A4hmsdIduVmRXuL2YPVeLH3AJ9E4c9rO+zehN4HUDIYUlpNuT9P8INNvkK68uIZvUVhnk
 IkghLXU6lUb+GeF3VzqrE5P0zeQzJutCQMoalYQXqVGL3fbrYc=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 29, 2020 at 10:44 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Arnd Bergmann <arnd@arndb.de> [200529 20:18]:
> > There is one more regression introduced by the last build fix:
>
> Argh.. I did run make randconfig for like 10 builds
> after the last fix.
>
> > Address this by removing the now obsolete #ifdefs in that file and
> > just building the entire file based on the flag that controls the
> > omap5_realtime_timer_init function declaration.
>
> I think this will introduce other randconfig build failures
> as SOC_HAS_REALTIME_COUNTER is bool in Kconfig.

I did a few hundred randconfig builds with the patch and have
not yet seen any further problems.

> We still need to call omap5_realtime_timer_init() even if
> SOC_HAS_REALTIME_COUNTER is not set.

This is what's in the header file:

#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
extern void omap5_realtime_timer_init(void);
#else
static inline void omap5_realtime_timer_init(void)
{
}
#endif

In fact, the inline stub is what that caused the regression,
so I think it's ok with my patch.

      Arnd
