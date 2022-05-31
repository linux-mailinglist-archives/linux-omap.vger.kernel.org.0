Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8480538D9E
	for <lists+linux-omap@lfdr.de>; Tue, 31 May 2022 11:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245133AbiEaJX2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 May 2022 05:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbiEaJX1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 May 2022 05:23:27 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ADE84A36;
        Tue, 31 May 2022 02:23:25 -0700 (PDT)
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVMuN-1oLVCl0Kff-00SOpX; Tue, 31 May 2022 11:23:24 +0200
Received: by mail-yb1-f175.google.com with SMTP id e184so13387227ybf.8;
        Tue, 31 May 2022 02:23:23 -0700 (PDT)
X-Gm-Message-State: AOAM530gl9raOUCyEQtXzortFjZnKLHf4MKLTnwhZ+DW6Y3qcsUfKOlP
        Mu59gNhsfOSSwOMtZ1ISNLx2iehd0yOhazt6fTw=
X-Google-Smtp-Source: ABdhPJy2WeVx5escgbLBHPL+xX7FkHWJ5a9Cb5IuOJ36ql8gY3EG8c+Uyzjg2vO3q+l5b5UOkDbD8UXn3eaqQgJGNk8=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr13966429ybf.106.1653989002683; Tue, 31
 May 2022 02:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
In-Reply-To: <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 31 May 2022 11:23:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
Message-ID: <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FAPJmN6vNQL+buJ7UgbCKzgVj2wowhaoTk99KB+OLI1HUeUKxLJ
 ph6U6jOVfTlviazlerdMNTfislODMXlUK/xLTpasvzrKjTBO1i9yo2W8OaLGGjIGyvLUhBn
 7vytzfh+DHPBGu3Zhs+yRFhmz2z8SIKZElmESO6CNixjdXttOPbeMCx3Irn1rOUtYkpQ39d
 QHM5umLVd2vtTeQaYDT4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EFfR2+rKU0k=:PWyAtQAhzTLrzSIe9+gfnJ
 q4KmgPTuCnf4QjnuEo+wbl+nlv0N4e15FoRCHrng8jfibC/jo9PdhMSDNaAI56qEfLvtDuSFa
 awutuJP52r7vEi/Ga7mSQ7YOhmKn0xxAaeFlC4qC0Onoj7BkImRRpWYjwgyMq4jO+kCCYzR5u
 lzjFwyurp4oeICBjsFwv1aPN7pUsEjwfVY7Oqq4/BiepMwezXM2AKtD5xgfl5HEHx8QYZJ2+G
 TdU/DcFhgCx1SBusx5qRvAVsXAnvNzeUlvRxdvkjc5zY+1AigDtrNocX1hfbMfrvNz5Xnm9DG
 U+tDS5219jFr55b8t0uSJ6icjlZ84FabfIq6wxzl0k+EDz3vxMNOdXvjNREsiso431RSrAKzX
 H55Pt/NctLq4fhleIzLvWYHCkEU3S+fUWl5V3a0btbghKwX+HdaPYrhOaSTVSfc8ci0cybpQz
 FGVfEO9QCpq3MNp+BTLm9QlgNXnFCCSpRYYiys5HJElM6T1nOumJEGl3yGcxyAaqNg1P4X8+1
 0ZT6Dgw79Z2uYBOkt6RIdzDKg2re+F5/KOWrkwde+gJ75burVNShw9Q6PqvTJpjdN3y24pT+l
 RcaxVFSXM1P4QafNZkEJ+GyTMOrJSC6Jy0CnOBJfrVVxNB4VyHujjacKk887Y0hyVMJfZQdAR
 8GjXU/xpZFoT0f0EHXu0YS3ahHQFz2ubCp/HR71vYMapqiMvV0Sr7LwHnVAwKCTuO+/jJ34pA
 l4R7dV1GAk0QBCOZCg6mS9f8XGLO1+QTFRBmqg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 31, 2022 at 10:28 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Thu, May 5, 2022 at 7:03 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > > Hi Tony, all,
> > >
> > > During the kernel boot I see the following error. The device is still
> > > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > > issue?
> >
> > Thanks for reporting it, I was not aware of this one. Might be worth
> > bisecting. Adding linux-mmc and Ulf.
>
> After enabling the CONFIG_DMA_API_DEBUG option, I also get the following error:

> [    7.603288]  dma_map_sg_attrs from sdhci_pre_dma_transfer+0xcc/0x134
> [    7.609705]  sdhci_pre_dma_transfer from mmc_blk_mq_issue_rq+0x2f4/0xa58
> [    7.616462]  mmc_blk_mq_issue_rq from mmc_mq_queue_rq+0x124/0x258
> [    7.622604]  mmc_mq_queue_rq from blk_mq_dispatch_rq_list+0x1b8/0x8ac
> [    7.629104]  blk_mq_dispatch_rq_list from
> blk_mq_do_dispatch_sched+0x2ec/0x350
> [    7.636387]  blk_mq_do_dispatch_sched from
> __blk_mq_sched_dispatch_requests+0x118/0x170
> [    7.644448]  __blk_mq_sched_dispatch_requests from
> blk_mq_sched_dispatch_requests+0x34/0x5c
> [    7.652859]  blk_mq_sched_dispatch_requests from
> __blk_mq_run_hw_queue+0xf8/0x230
> [    7.660402]  __blk_mq_run_hw_queue from process_one_work+0x284/0x72c

This is the blk_mq code taking things off the queue, so we don't really
know how they got put on there at this point. To find that, we'd need to
annotate the mmc code with the same kind of check to test the buffer
address whenever something gets submitted on the blk_mq queue.

Looking at the calls to sg_init*(), I found sdio_io_rw_ext_helper(), which
is what all sdio commands pass through. We could annotate that using

diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
index 79dbf90216b5..4ab063c50649 100644
--- a/drivers/mmc/core/sdio_io.c
+++ b/drivers/mmc/core/sdio_io.c
@@ -322,6 +322,11 @@ static int sdio_io_rw_ext_helper(struct sdio_func
*func, int write,
        if (!func || (func->num > 7))
                return -EINVAL;

+       WARN_ON_ONCE(memory_intersects(_stext, _etext, buf, size));
+       WARN_ON_ONCE(memory_intersects(__start_rodata, __end_rodata,
buf, size));
+       WARN_ON_ONCE(object_is_on_stack(buf));
+       WARN_ON_ONCE(is_vmalloc_or_module_addr(buf));
+
        /* Do the bulk of the transfer using block mode (if supported). */
        if (func->card->cccr.multi_block && (size > sdio_max_byte_size(func))) {
                /* Blocks per command is limited by host count, host transfer

 Does that show something new?

If this is a block device, the change won't help, but I can't find a good place
to hook into that at the moment. mmc_mq_queue_rq() might work, but
I think that is still called asynchronously.

       Arnd
