Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4420B65F466
	for <lists+linux-omap@lfdr.de>; Thu,  5 Jan 2023 20:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbjAET0a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Jan 2023 14:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235871AbjAETZw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Jan 2023 14:25:52 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217C9A1AD
        for <linux-omap@vger.kernel.org>; Thu,  5 Jan 2023 11:21:36 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id e21so16496015pfl.1
        for <linux-omap@vger.kernel.org>; Thu, 05 Jan 2023 11:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=anTQVD3X4zF2upUn1tcEwV/mJI4PB0AVRnQsdQTju5M=;
        b=UsWkcTfNBnOIYTq8ddIEOhXoubIag8i0uvlE5D3SmoMuWlayEFOqQjO50xHJ7uHUqP
         W+XmpL7FU2Vsa/RBhVPhJcJSs63N3KIRWlAPcO96YO6K/DhOtMDIZzMiI/Kv/dIvmTKi
         1N2bN9Jtxp92XK1bR61D4GUdMftaVB01ZVeCVm+agQMPFNKWQmm+1W2m74e23DNA2oZx
         FkenAJPgfCXzIgBv9h5Z1xrcYaLOJOFo6jqlGM5h4DAPqfbzWdgm8rm7a5kp4o+O7Mzi
         vJLP0HEI3JT3t8XK9MKx8BsRvbVSBob+geySIkG9EaeGUGmZF8BqdUJ0/J7V/BZ7Mnzu
         w0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=anTQVD3X4zF2upUn1tcEwV/mJI4PB0AVRnQsdQTju5M=;
        b=4aPdKcgdL7frhvsXgvz6aqYWzaneNJp4VAPZ8yGOKNEkL9QFWQvFc8QqgLLq8aDySs
         AG56447YYm+uNCqZyoUcReWK/+QaZXmbZl43BRDIDR4xV7WKsoScKZZ+R0YbAgPIdDgp
         ynx+UbVQenJ4e0IY0V7UwHaCyPcStnNcJsepEzn8F56EmBRFGGyGxQBj3bRGdbRXLTk1
         hVdXUM0RIETedpBBeKC1c3xsFOyWGa2pgpVbqVXFkdJA27rIGllzJ52A+/KtpGGKonPr
         ckgkOHKb5o0JHoxL4rkQokEjd98MknHAgoV3NFpFLfTZF00BhTRPgf+T3u0QtGwHKlKY
         iH5Q==
X-Gm-Message-State: AFqh2kr3Qcy3pMu6TFbMY1585Loa17kCPkEeCxrMtCfy2YyaA+4nq2C7
        aqZsQokeeCnnLKS4Nf/tFVD9Ax9X37E6vsBlPeSfv2A2
X-Google-Smtp-Source: AMrXdXtakQssV1mmo6hadhg4aGzbpcECYAJAi/Ad9+muXNvkeuaCVWz0LMzR5SkgU+bHRk/Pbcx5iR673l8HoAFpPIA=
X-Received: by 2002:aa7:973a:0:b0:580:e35e:f3f3 with SMTP id
 k26-20020aa7973a000000b00580e35ef3f3mr2216489pfg.53.1672946438303; Thu, 05
 Jan 2023 11:20:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de> <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
In-Reply-To: <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 5 Jan 2023 13:20:27 -0600
Message-ID: <CAHCN7xLrDGMNKyXw6Eb9LJSHm_wDF2N3PjDKUtZ6LKTvQOxfFw@mail.gmail.com>
Subject: Re: omap_hsmmc RX DMA errors
To:     "H. Nikolaus Schaller" <hns@messlink.de>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jan 5, 2023 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Thu, Jan 5, 2023 at 12:17 PM H. Nikolaus Schaller <hns@messlink.de> wrote:
> >
> > Hi Adam,
> > happy new year!

Happy new year to you too!

> >
> > Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
> >
> > I am trying to test the 6.0 kernel on an AM3517-EVM, but I am seeing
> > some DMA RX errors:
> >
> > [    1.730682] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
> > [    1.738403] omap_hsmmc 480b4000.mmc: RX DMA channel request failed
> >
> >
> > I think I remember there was an issue that more an more devices were switched active by default
> > to use DMA until the 32 channels of an OMAP are filled up. Which subsystem is hit by this
> > limitation may vary and depends if they are properly disabled on the specific board DTS.
> >
> > See: https://git.goldelico.com/?p=letux-kernel.git;a=commit;h=048b9bc86b9a080258460c4ab2989660233c4c8c
> >
> > (I must admit that it is not yet upstreamed).
> >
> > I tried changing the omap3.dtsi file to use the newer sdhci-omap
> > controller instead of the older hsmmc driver since it has support for
> > the omap3.
> >
> >
> > This would then only be a workaround but not a solution.
> >
> >  That seemed to fix the issue:
> >
> > [    2.141967] omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver
> > [    2.183074] mmc1: SDHCI controller on 480b4000.mmc [480b4000.mmc]
> > using External DMA
> > [    2.184631] mmc0: SDHCI controller on 4809c000.mmc [4809c000.mmc]
> > using External DMA
> >
> > Would there be an objection if I migrate the OMAP3.dtsi file to the
> > newer driver?  I wasn't sure if there was a reason this family was
> > being held back from the newer driver.
> >
> >
> > AFAIR Tony wanted to retire the older driver anyways.
>
> That was my impression and it appears that the AM35x has already

correction AM335x (not AM35x)

> migrated to it.  I wasn't sure what was holding us back.  In theory,
> we could add the compatible flags to the new driver and mark them as
> deprecated so the new driver would work with older device trees if
> there was push-back on changing the device trees.  I know sometimes
> there are concerns about using older device trees and the interaction
> with the compatible flags make it a bit more complex.
>
> adam
>
> >
> > Best regards,
> > Nikolaus
> >
