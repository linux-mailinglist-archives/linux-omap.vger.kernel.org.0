Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E42534F54
	for <lists+linux-omap@lfdr.de>; Thu, 26 May 2022 14:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237394AbiEZMiI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 May 2022 08:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiEZMiH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 May 2022 08:38:07 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B2A15FCA;
        Thu, 26 May 2022 05:38:06 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3003cb4e064so13792067b3.3;
        Thu, 26 May 2022 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IPhcmMGrDmqz68ElM8PH2pAWE1VUpwJtm/jAj5a35M=;
        b=gGayeH81IsTayP7BQBCodWcrNR9zVdhxgKZiS6L3vdF9gzYopP1IVAAwYkTSt2/uud
         xAp+yxbFQMWuBX+yPvfhQugfW3CiK+PWI0cbSeNNQUesHVvWJcofsRq/YwK4gs0wP3Pp
         2NLd86vgfTu5pl5UZV4wWFy/lqOPG5WQd79rqgHvIDD0FLV/URcEPDQPnVXgU6y8VMhP
         Z08TFMxlOjW9+p6fGWLk1te2Fr8VgGOU40eaM6YqX+omvzMqbRdadI4vO9cLCp6puwma
         L9zdmA7jK4mUadL0BFq5IFoCmqNK2g455bCylcD5Z7SoxYOSDFitw91PkEqaSvZPC5DS
         7wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9IPhcmMGrDmqz68ElM8PH2pAWE1VUpwJtm/jAj5a35M=;
        b=XEXBYEL9O8U4wHqXmQCoXUdy6lxWWfEMZ7Arj+tXIZTsLCdc06cyfrrGyaBYxqUN9d
         1qSccZGTO9C0i7iVXsNIEF7GqFn7X+7cKyikZ5iHAsR7aZZVGYk95anWgkb0FxUj6qX2
         ul6gMjLZIOoyRoK0JtS0lBMkQJEIry8jWB2//M4CgRJtYkxwORLAFsGvWZKtM/pEE4YA
         VHa5DfdCV9uRc/If3RHNSEqWvmK4zF/MjuKkQX4gYdeb+UYDPXinh2Acm/IhADkfi/Ir
         tyfvObnzv457fL0L66YH9U2sXgFoUinrzRz8tLx2g03c0JGgxfeDH0leFJlofcxhaW3M
         hoBQ==
X-Gm-Message-State: AOAM530tafVHvJSDEGgDpKIYBcFVfZYnkcqPQCwOetwMBn5vWj4UPepJ
        tNmbdmMUjDkuZX+OED8XGU5OubEFPAQ0SKKhpi0=
X-Google-Smtp-Source: ABdhPJyXiLkZovCl8sv28FDSct+tUa+OHbvd6/3Mq4sjU8gdVF0dJdI3TvdfiiModeAqOa+zx+K9pO2k7Ggpa4uKGNc=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr1991131ywa.495.1653568686083; Thu, 26
 May 2022 05:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
In-Reply-To: <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 26 May 2022 14:37:55 +0200
Message-ID: <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ard,

On Thu, May 26, 2022 at 10:19 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > > better or worse :)
> > >
> > > PIO is always the last resort :-) And now it proves it again. With
> > > PIO_ONLY the system doesn't stall.
> >
> > OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> > with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> > is. Or maybe there's something using stack for buffers being passed to
> > dma again that breaks with vmap stack.
> >
>
> In order to confirm this theory, could you please try rebuilding your
> kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
> before?

I have disabled the CONFIG_VMAP_STACK option:

# zcat /proc/config.gz | grep VMAP_STACK
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set

The system stalls.
