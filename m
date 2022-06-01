Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372DF539D5C
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 08:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349901AbiFAGpx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 02:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349898AbiFAGpp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 02:45:45 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418CF97298;
        Tue, 31 May 2022 23:45:44 -0700 (PDT)
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mq2rM-1nR8A00ao6-00n5yQ; Wed, 01 Jun 2022 08:45:42 +0200
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-30c2f288f13so7981187b3.7;
        Tue, 31 May 2022 23:45:41 -0700 (PDT)
X-Gm-Message-State: AOAM531Ockax7QFc2a3Q5qinwSYu1zDIjuRbcTFYov4J+ulcWOQG+i4o
        ZvxrbP2tbkH2/CTqP28E8PCu4ASMNlQ4Wl6LFQI=
X-Google-Smtp-Source: ABdhPJxq9InuUIrimfB3hr7dW///DRy+5BhspFyMzdFTqUL2RwXpKSW+k/VUx3CUHz+Op8OoRjPlxOTXQCqKN2AESqo=
X-Received: by 2002:a0d:cfc7:0:b0:300:26d2:30eb with SMTP id
 r190-20020a0dcfc7000000b0030026d230ebmr42935803ywd.320.1654065940773; Tue, 31
 May 2022 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
 <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com> <CAGm1_kuYGMAbO0aB52hRwZp6qALALQ4LvMkNuC=F9Pk4P5BdXg@mail.gmail.com>
In-Reply-To: <CAGm1_kuYGMAbO0aB52hRwZp6qALALQ4LvMkNuC=F9Pk4P5BdXg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 1 Jun 2022 08:45:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2kEWU+rS55QXwOq04pRv2oEQAdqcGsDj1or04DQ4Uqag@mail.gmail.com>
Message-ID: <CAK8P3a2kEWU+rS55QXwOq04pRv2oEQAdqcGsDj1or04DQ4Uqag@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:73Pm1s8KlS1x07jUfJyeHvP2H+5esKuvZWQZ55NDLOdSO9QspLz
 Xxmd1g74Pc3Wzy7c230DTpOdW3kosYKic2COiDPTXJx/td2rKA6P4//oVTyk5Q0gkr7d39s
 u+fSbvq9b7F63qWluq/dvsbpvvKSU17mESb/g0DEmh/aJDptWXFgiJEsd+8yuIoeIjq6S9k
 gTJZUlqVunP1lDIIsURrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4/vqMEyctsw=:3ATQxm3it+ZPqRv2tg/+uN
 qVZm3kLrnEQeuafb0IaetL7broVZrWmdbKZcib+LsbdV/iQfRaDhUHxo78/2TdumPxx4HD6sq
 32pzlJaRGaEMYg+ccO61NagTt04p9JZZw6Rc2Jwu4liU8ekaPIuchI0EIFfS9oQNWAlIqHv0F
 iVC80NPlUqW0J1E2rb1SXdwjt/VZA/gZL4+51NGasHnjZssMxJbwYlIkIbcDG73H/8M3m7iaU
 fi/tsOJAQrMKlmeJ67gt0orSQLya91IQUYCtcKg0i4fqWRh0O1cBuFdhkUwuxvUQBOB0CedAX
 snxF6bvkffNcVEbHlL4xycXJFImvXzI7c/7WgfGIvgsZy1pNB8izuTrJjue/zCn9E6ABI13XA
 1r96nGx06a8ECyJJwKYqc0olxFLDl0+T1bejoHsGba1JHmMNFpGvCtkqPPYP690EkKVePNbdI
 WlHwsyq6tnytOjO0/3fAk/pqE9u6A4k5CTyhWkhv/sANhMqlaFckm7XeMc3BDBQ0C+KKqHIHz
 sdDgDJ9J0h6qYwnsc/22ZLoP/RgycdHf6auj93A8PuzAoAvpgD1XAGPuKvR0R1dNTUh5/GmVU
 G0tX9cBijYmXpJqooiWzmLfvKudFIjOozNvGdrb7QuIeHowWYSOYVVlEjqJaePljQgzzIWgGH
 XUVdMjBXauHcoB0IwZqVM6xxVbcIocqxl5r3WSCqz3FfjMCcpd7Jv7CYI9nqh+RyeGx7tEJEA
 FkycQB6wX3xHkSEq76/S6/EGocJw3dUtqhZ+vw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 1, 2022 at 8:08 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, May 31, 2022 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, May 31, 2022 at 10:28 AM Yegor Yefremov
> >
> > +       WARN_ON_ONCE(memory_intersects(_stext, _etext, buf, size));
> > +       WARN_ON_ONCE(memory_intersects(__start_rodata, __end_rodata,
> > buf, size));
> > +       WARN_ON_ONCE(object_is_on_stack(buf));
> > +       WARN_ON_ONCE(is_vmalloc_or_module_addr(buf));
> > +
> >         /* Do the bulk of the transfer using block mode (if supported). */
> >         if (func->card->cccr.multi_block && (size > sdio_max_byte_size(func))) {
> >                 /* Blocks per command is limited by host count, host transfer
> >
> >  Does that show something new?
> >
> > If this is a block device, the change won't help, but I can't find a good place
> > to hook into that at the moment. mmc_mq_queue_rq() might work, but
> > I think that is still called asynchronously.
>
> No, the patch provides the same output.

Can you say what devices are attached to the mmc controller? Is it
an eMMC block device, an SDIO device, or both?

         Arnd
