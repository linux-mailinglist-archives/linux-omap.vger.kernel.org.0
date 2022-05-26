Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EA5534B98
	for <lists+linux-omap@lfdr.de>; Thu, 26 May 2022 10:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbiEZITp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 May 2022 04:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbiEZITo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 May 2022 04:19:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35069663CF;
        Thu, 26 May 2022 01:19:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF503B81ECC;
        Thu, 26 May 2022 08:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86389C34113;
        Thu, 26 May 2022 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653553181;
        bh=ZwmnwNW+ZrV5xS0G9MrfnlHCJv4ENLS1DbNYEam8XCA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WfPt3D4gVE1h+GVm1v4bJEp9wuNVMs0ZyCjHLc64auY5oiaNe91bvJfVNUWjnaOiD
         UkwgZElwiDKvYuDbvq9OofQWBifUXIVrdVEFXEtlEP5oKwPT0kPiCCSohl6LT1PiaF
         hXoaJpabB3LsPb5cLO2YB2stiL2Jvr9/CDHwUrHjwBrM8Dbaa6YyVkLEEW5m07/X5h
         iuahFv1AJ1gREFWbC5vImGxJ+K89s8E8BA2fSpySjwJoDS7coW4Rj0uS2DweSNdLJm
         X/fhYEJwUsSYfnqR1UTcUwBttaKeaXu1rTjl1k1iZbooZyfzXlAQAAfV6WnD83En6i
         1U9tA+HpQuyMQ==
Received: by mail-ot1-f54.google.com with SMTP id l9-20020a056830268900b006054381dd35so541543otu.4;
        Thu, 26 May 2022 01:19:41 -0700 (PDT)
X-Gm-Message-State: AOAM532nlEzsKyqj+SKb4RWe9htu5V7SNay+8NwUTLr/X/WRV7UdsoQa
        lYjkFqtF7TkaWWNhGh+v2cMU5x+VslQwFQ+WlgQ=
X-Google-Smtp-Source: ABdhPJwipZoDhxiRgs7RvsnsCdYNuTKKPK79u0HoDv3k4BrOqK8zoM6DbxncwB/UumoYM2QbhOuqNgWY6T7SxtVhhAM=
X-Received: by 2002:a05:6830:9c2:b0:606:1e0a:cc8d with SMTP id
 y2-20020a05683009c200b006061e0acc8dmr14017603ott.265.1653553180686; Thu, 26
 May 2022 01:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com>
In-Reply-To: <Yo8cLxktTytqAEV3@atomide.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 26 May 2022 10:19:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
Message-ID: <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > better or worse :)
> >
> > PIO is always the last resort :-) And now it proves it again. With
> > PIO_ONLY the system doesn't stall.
>
> OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> is. Or maybe there's something using stack for buffers being passed to
> dma again that breaks with vmap stack.
>

In order to confirm this theory, could you please try rebuilding your
kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
before?
