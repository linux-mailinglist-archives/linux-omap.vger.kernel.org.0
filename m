Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E323C6CE8
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jul 2021 11:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhGMJNF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Jul 2021 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhGMJNF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Jul 2021 05:13:05 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0857CC0613DD;
        Tue, 13 Jul 2021 02:10:15 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id p9so11744610pjl.3;
        Tue, 13 Jul 2021 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znOV/vi9eupaYYKzAg5/oSFMUobnQTbVo1G/YBRYeGc=;
        b=okvcJU7pHFpcbNGOAD2B2892oIWTGePm7fS+Zf+ox8M/tfwoZM+wdTT0eWVVBzD5i4
         NOpXCvRQ4C4NAyHX5xATud4FzijBp/OH4AAD9j9EZpgS4CInP7WwiBnQGZMHqW20TZy7
         BrHT4zD670jJv+Dh42iZBahw7HTif8/V2KfKHcI/XrQOq+wM4CAZFraU/LbktB0rIh7z
         qZCIwAmfmzg19X3r8miEfASEBUgwSBHW0jIvznTgnJxvntGPPe+Q8YHiTUzakGIo7+a7
         axhJAlDlNPKjor0OKNzuaOgbjUVBfWm6fXGTuWCy/WTq/1ixrCc5+uGb65zqP+QmD3CA
         AYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znOV/vi9eupaYYKzAg5/oSFMUobnQTbVo1G/YBRYeGc=;
        b=da5nsvK84I4uYt1uYqUdaDjRrzVbL7YmnBruyCAUsqiqULCuAqdkJKS9Im4jPCBCvR
         jXOf/3QMMgBG7S1SnvUAvN405HqihpSn46z7d8G8nQrwGuZ+kUWURg3KGe0l4kPI3ZqA
         eC20j3aiQVaJCte0nrfdmkSlFeoqnCcSTck6R0PktMLDvUvNTTmF5qaJR1YSGD+pNDBE
         5JvTkKq+kFLHlew5TgtKNNFQv9lKUmO4t4I7ePGzMjHyeL4GMO6c61h9wOAfZDbp4QHL
         wBG1moUld9/uILA3Tq0FVtxAQs2ST+mtNi23I9BfCaJWu5018hzyURHqJkPAySzQBSVe
         zYdw==
X-Gm-Message-State: AOAM531QG7T6e3X6xs8ZZPHtwAzNhXa5ZHMp1bxRDhGK6dVvtoCAi5Nl
        pnGoULyjjbP4ju7YVfpNW63DMeXIaDZc/nchkZQ=
X-Google-Smtp-Source: ABdhPJwZ8s7TsiJF3OC1F/s88os4Z6rvC/akqejVoPje5nDmtQ3YFrQcqhaoQ+mlr2l069avPc/qKaC2u3VFPbFEimk=
X-Received: by 2002:a17:902:b08e:b029:129:a9a8:6dbb with SMTP id
 p14-20020a170902b08eb0290129a9a86dbbmr2759415plr.21.1626167414401; Tue, 13
 Jul 2021 02:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210511151955.28071-1-vigneshr@ti.com> <YJ008MjjewRUTn9Z@kroah.com>
 <YLCCJzkkB4N7LTQS@atomide.com> <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
 <0ad948ac-f669-3d6d-5eca-4ca48d47d6a3@siemens.com> <56c5d73f-741c-2643-1c79-6dc13ebb05c7@ti.com>
 <YOylnHudkwcHHEeZ@surfacebook.localdomain> <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
In-Reply-To: <0ae7e313-1ed7-f1be-e8a7-edd1286277a5@ti.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Jul 2021 12:09:35 +0300
Message-ID: <CAHp75VccHRAG+T9TLmaii1UokJAVTOTRRzQp+60d2std9nY9gA@mail.gmail.com>
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
> >> On 6/22/21 11:45 AM, Jan Kiszka wrote:
> >>>>> Vignesh, it seems this quirk needs some soc specific flag added to
> >>>>> it maybe? Or maybe UART_OMAP_RX_LVL register is not available for
> >>>>> all the SoCs?
> >>>>>
> >>>> Yes indeed :(
> >>>>
> >>>>> I think it's best to drop this patch until the issues are resolved,
> >>>>> also there are some open comments above that might be answered by
> >>>>> limiting this quirk to a specific range of SoCs :)
> >>>>>
> >>>> Oops, I did test patch AM33xx assuming its equivalent to OMAP3, but UART
> >>>> IP is quite different. I will respin the patch making sure, workaround
> >>>> applies only to AM65x and K3 SoCs.
> >>>>
> >>>> Regards
> >>>> Vignesh
> >>>>
> >>> What's the status here for AM65x? The issue remains present on that
> >>> platform, and I was hoping to see a quick follow up that limit the fix
> >>> to that target.
> >>
> >> Sorry for the delay, I am trying to find which other TI SoCs are
> >> affected by this issue. But that exercise will need a bit more time.
> >> Will send a fix to address K3 SoCs like AM65x today/tomo.
> >
> > This all reminds me the very similar issue one found on Intel integrated
> > (Synopsys DesignWare based) UARTs:
> >
>
> Hmm, yes, seems like common problem with some 8250 UARTs although not
> all TI SoCs show this behavior even though they all claim 8250 compatible.
>
> > https://lore.kernel.org/linux-serial/20170206233000.3021-1-dianders@chromium.org/
>
> I am not sure if reading UART_LSR is a good idea in the above patch.
> Some flags in LSR register are cleared on read (at least that's the case
> for UARTs on TI SoCs) and thus can result in loss of error/FIFO status
> information.
>
> > https://lore.kernel.org/linux-serial/1440015124-28393-1-git-send-email-california.l.sullivan@intel.com/
> >
>
> Looks like this never made it.
>
> Given the quirks associated with 8250 UARTs, workarounds would need to
> be tied to specific variants, so I don't know if its possible to
> implement the fix in 8250 core IRQ handler.

I believe they are all are derivatives from Synopsys DesignWare one or
another version of it.

> PS: v2 of $patch is already merged.

I noticed after sending that email.

-- 
With Best Regards,
Andy Shevchenko
