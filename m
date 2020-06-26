Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128CF20B1D6
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 14:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFZM6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 08:58:20 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:52191 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFZM6T (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 08:58:19 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M2Nm2-1jqT9r3l1i-003rvu; Fri, 26 Jun 2020 14:58:18 +0200
Received: by mail-qt1-f172.google.com with SMTP id e12so7322510qtr.9;
        Fri, 26 Jun 2020 05:58:17 -0700 (PDT)
X-Gm-Message-State: AOAM530EXAI7OWRvPM40RZlk3O2VxwBDzQVN6TtATjBOGApDkrMC/1+I
        HQB3icuhtVREybxPz6mn4y68nkWA5wa9yxM2d1w=
X-Google-Smtp-Source: ABdhPJxikXjRDu/tLtw1jlXCdKxJwE+HFIHYYBl2h9Z5AkRSmUqjWKVB4ak/UxHdGDOYG0v3KEvo5BtLsdG+FP2EAgk=
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr2619841qtb.204.1593176296673;
 Fri, 26 Jun 2020 05:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl> <20200626115321.1898798-6-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200626115321.1898798-6-hverkuil-cisco@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 26 Jun 2020 14:58:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a048hsYw3iQ3+kiPQx9QqHDYJeh8hRuGgxN8NJSpKsOmg@mail.gmail.com>
Message-ID: <CAK8P3a048hsYw3iQ3+kiPQx9QqHDYJeh8hRuGgxN8NJSpKsOmg@mail.gmail.com>
Subject: Re: [PATCH 5/7] mach-pxa: palmz72/pcm990: remove soc_camera dependencies
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CArOanR3p5vgt0rLueM0LrZHN73mOcQjf9NZr3iQcyhSNjDZRr6
 HgDkoc7QVHQxot5Fp/0rQLEoPSAf2CR5P6LuA2GVJqIzWmiX5uXTfiCyenKRK0VdcMp8hu2
 jMUtSOesHenCe2aByTbzz66I/BD5bsI5Zb9UugDTA/qZQ77cOlhiabUAEEGZFzPczyQ4xfI
 GOa8cqSs3aSuJ/1MK/5kQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/q2ZxyCPS0=:juVomQfkhgeP94FQJYJz1Y
 MBel81eNlQDWdOhXwObaHFwMWjUiZH5GoUDWSs+7OrlnW/BgsBkfTJX8ZFzfWhRH0i7sa6Wnv
 DIZ84UJfsDRvUv2yCcN9qupuFkXP1mWa7Q6nfxnz6L/VV07X0uo6U4iFPodLmYMjconvJDWFh
 URy/F3j/VUfODeCrPNRSvjPKVTRnAXLX6h0bjksuq/bdxwF2voNHdDp21yzvBU+gQ5c0/5G6d
 SsSMOfScsQerSG3ZrCBtZA8c1xj3oDC563NLLN7RmS39Sh8mk0Su1UvIgHF6IH0EQYJ9OqBps
 tIB4BSkQGfxtbOFqrpWdircK8+55G3Ai6+ZvRniNWHEffMPit/AeDa9aix/q+3LbU6Br1smSU
 qRQFCDRcNTmcdBpV6tDjAE8sv2Yn4e7dHXJfk1nxGp8y+8CiSn3lUSWaOoo9QNUX+dwiY6RYt
 PxG6FaoViO+YmPUQ85UJCzwQIA/jACsk9abdV7vYhzICFkW6N7/j3f9uyBZ30fu11FwGktfIP
 jfjexFdsWbMMkOc3Y6o04aSUY3ZEua8dz9ychTtw5meQRjO22XFPQpbD3Mu+gQdhnJTPX29TC
 JHZ97Z9eN2k9vVx0H9snvehf+em4r8f+5ZlomD/cNOuqZlVgx7fbka8hKj2r9dWNOQ27xc8PB
 w3QY+X4Etfst1Okom5/pWlU24oamsT/CW3bCwOtJ8X5HTpE9cVsN0LrElfzgh+KZUqEPzqnGT
 KAr/sHmqT9q8FH6KDf2mKg1sA3KBl0CQW2VR0oXyQb6eE4igq2k8Eg4nzhtIrMeWIVq80rDeo
 X5vvPtIxJzoZsPdjbSiqK0k2zRh8mveKoaqwmVkKVVWGiyjx6I=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 26, 2020 at 1:53 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The soc_camera driver is about to be removed, so drop camera
> support from this board. Note that the soc_camera driver itself has
> long since been deprecated and can't be compiled anymore (it depends
> on BROKEN), so camera support on this board has been broken for a long
> time (at least since 4.9 when the pxa_camera.c was removed from soc_camera).
>
> Note that there is a new pxa_camera.c driver that replaced the old
> soc_camera based driver, but using that would require these boards to
> be converted to use the device tree.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  arch/arm/mach-pxa/palmz72.c          | 112 -------------------
>  arch/arm/mach-pxa/pcm990-baseboard.c | 157 ---------------------------
>  2 files changed, 269 deletions(-)

Acked-by: Arnd Bergmann <arnd@arndb.de>

Please merge this through the media tree if there are no objections.

      Arnd
