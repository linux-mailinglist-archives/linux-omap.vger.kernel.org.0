Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C63524819
	for <lists+linux-omap@lfdr.de>; Thu, 12 May 2022 10:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351648AbiELInc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 May 2022 04:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351670AbiELInO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 May 2022 04:43:14 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1420424BE;
        Thu, 12 May 2022 01:43:08 -0700 (PDT)
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBE3k-1ndYMW3duQ-00Cgtd; Thu, 12 May 2022 10:43:07 +0200
Received: by mail-yb1-f173.google.com with SMTP id m128so8480210ybm.5;
        Thu, 12 May 2022 01:43:06 -0700 (PDT)
X-Gm-Message-State: AOAM532vlCUMivbweFHDj622IOVUFCHL7jduKXG3sHfCQ/5gyijsQdbj
        xv+4ejJl92wC/LAIwglx9Ydyzp/TEYSetrYnCqI=
X-Google-Smtp-Source: ABdhPJwQWU271A4uV7muFmZnyaNXspg1t2Fw2ue6eoaqYqg6nSa8idSoj/juf2P8ktidmam2uzcBkFwU8S0+zZdwFgM=
X-Received: by 2002:a25:cdc7:0:b0:648:f57d:c0ed with SMTP id
 d190-20020a25cdc7000000b00648f57dc0edmr26794225ybf.480.1652344985551; Thu, 12
 May 2022 01:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com>
In-Reply-To: <Ynyd9HeFNmGQiovY@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 12 May 2022 10:42:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
Message-ID: <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:X4IVjpj/Ln1A0LzUXXWFxvqrCAh6GrDdfuYNntcPuKH08AOvjly
 1QnC+ffaAqGgy+zfYSOdcEtwVqQA2jmPfv1otEQdzJRqVr6zUhtQQXJAJj2B8gK89GkPBcX
 /wEiNfP+T51kdCUTmTFyo0kWmRP1SNmHyJfxPHtA7vXdlorDZ9x1ffGpyUrp4e3yO/GVYRe
 kOIayi9AcM7tSxugXX8og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ujj9k/E2yck=:+mujHgvBmPSBanfqWmpifC
 Uzf//q2jg9V+tMwb+vun5mQtfLDBONjCgk7kUXHlhEt+0gwfBoqKFHyRaybFtVvtQONi4ZpKm
 8V5mDG80+GOZQy5MPilKr7jc6AbDrCkR50RY0m6yz+kBYuOjN9GRc3GEaz8FA1vPJogrlC89K
 49RXEslm/XpJKn81cuM+0CPyOyRSkAbG6vNtsk73d3Cce3BvpIPQeOpSiA6vCu8tvJy7Dw9uc
 6lDgZ7zm4jUHKtmwIcigzJMxj6el4Aq27cmhTo6haaevN0lojlv7l08tg4CJrj2M17a/Fl7Lq
 68es9Bda+9f+xE4ylH2teEgmr3C+HcVN11xZDKYy0xZG+L5GUKKeuQZ03jzCS8zhPa2OugT45
 JT/cWE6CS+PxWVfeJwVoLETXNDJlSTF6kjtcnbMLtJv3xk2KDB/5ZQShq6liFJlaaQ1LbOZC4
 3i1Z6fA3huEHh4ekcS8IvALwvknXrMyIw4TyfgW6aQEX2tOcckvlE9B/5G8xBiqQQXukGFlKz
 uXyKjLwfHvQpVreijxCtZkw/7q8tD7vwfJ4kyBBBpHQ4SWT9VFQB6zokKipKzL+tFW1xnATHN
 6mm8n8qdwbTR50+pEkJEQMmI1pwJhRN09UFZbIlBNw8wIxW/A2RHXEsN03vydY0rLe1NZ2rgI
 lsxxZbIhqTldM6H//FMy/U4VGXfqZHOlFiUV5zolAY+wphu8q/h5fBtypJgct3JtzqUMYRoyC
 v5dUZ4YeutgW6Apj9x69GdxOK+jX/ijY/g6yeUv219jWMBFglQ6A5Yb6eQkOr8rAWP0zzR0x6
 ETGR3IJ0k7airwE8/m2LUjDxUP+OfpgC/uv7AxcZqvk3x3/FL4=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > Hi Tony, all,
> > > >
> > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > stalls as soon as I invoke the following commands (initializing
> > > > USB-to-CAN converter):
> > > >
> > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > ip link set slcan0 up

Oh, I missed this part at first and only looked at the backtrace.
Which CAN driver
are you using? It's likely a problem in the kernel driver.

CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
just see it by looking at the right source file.

       Arnd
