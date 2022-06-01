Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC1A53A5AB
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 15:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244807AbiFANKf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 09:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbiFANKe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 09:10:34 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E98A2651;
        Wed,  1 Jun 2022 06:10:31 -0700 (PDT)
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mbj3Y-1nNsuh2bvy-00dHNg; Wed, 01 Jun 2022 15:10:29 +0200
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-30c143c41e5so17929127b3.3;
        Wed, 01 Jun 2022 06:10:29 -0700 (PDT)
X-Gm-Message-State: AOAM533Pit5BA6ILZlKJkSh4DPFXILP63RQiNngdloEoeMez5g7PuF26
        hDuZZ0lV8tUdvrkmd8krkUbaAQ3B9avvv9mZElM=
X-Google-Smtp-Source: ABdhPJzosfvbdJ5Di8+MP0zgnpuq38luOXBffT9OoDdz9r9355+pTDnsEc0z8E4YvxZV4OxUHzJEK6B8QiMeHymLDDQ=
X-Received: by 2002:a0d:cfc7:0:b0:300:26d2:30eb with SMTP id
 r190-20020a0dcfc7000000b0030026d230ebmr44535348ywd.320.1654089028304; Wed, 01
 Jun 2022 06:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
 <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
 <CAGm1_kuYGMAbO0aB52hRwZp6qALALQ4LvMkNuC=F9Pk4P5BdXg@mail.gmail.com>
 <CAK8P3a2kEWU+rS55QXwOq04pRv2oEQAdqcGsDj1or04DQ4Uqag@mail.gmail.com> <CAGm1_ksYy=fueypVJDfVhf=J-cY8r1yJpBYO9cEK5_CTfn5xQA@mail.gmail.com>
In-Reply-To: <CAGm1_ksYy=fueypVJDfVhf=J-cY8r1yJpBYO9cEK5_CTfn5xQA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 1 Jun 2022 15:10:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0tK5bm7uXBAPfydMBVzO8=eUiBOKbivQMZVDkgjJ2uBg@mail.gmail.com>
Message-ID: <CAK8P3a0tK5bm7uXBAPfydMBVzO8=eUiBOKbivQMZVDkgjJ2uBg@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:58aATKFXWXUufymP5AjXJWub7VGT4c4dc3uKA7OshodRgb8Zy7D
 lDdYvRyTZBqvzfnqB5EciQBvkvnAkdM9dKZDX1BtSDwpf1Wo2J1mGKOFZmFJYTrIYgz23Xt
 2v3k/XMoJAlKwB2EaEyB0qvUWLikKe4BRdJdfS7QtmpHCdMIfr3+emX0+eGpb9lP6UONgYT
 gbGAm3ImCSko80MilIKJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vD1JL6/UGSY=:TMHnJSdqFTJE0jNJip8/ny
 FwotG30DfGEbg+E1UdB4rvUW/rXrlaD0FXPYxS7kQm+KeT8fsNUgYL3DJ2i6GnQyIDVLfVwTN
 N8EzNBs2pcQZItZo4U8PVO5INKQJ1jepsLfz3lVBwQT1t1s+JgCHsKG2yjNl8ZJfUrfB6UZsk
 FfEGFUHzknhkKiLQNj70kPqdflplRVN9TtxdlQzGnKpORri+1jlYywqJEeRTvF/fK2so3/Aa7
 5QmKvzier0l54eSponR7O2fiTjKNBg520pTdFue4I+Ih0RROUjkHNUeATTrMU4vqGyyd/rJVv
 /zWQ2FMsx1gH/Jm8oa7ok6qAOIvtmz8V4VG6j/FqiwpSuz7NhG/Mygq1Bl536Ydr7QZkBbXv4
 CmH41wqgpUXORBJ+47jahDmeQQzP5UxMvIZWbA1LzjsDCNJ9iqCWCC3wg+mxCjzH2kEqmduxu
 U/a/gjURUloq7J0pMaFS7HA1V6P3/7eblocKSDG57stpoFZyMBLSrIDTKGyzDE2Ox1P5Rd5hT
 xRv2OIGMdxDt9FLR/jw0/FCA+21954/gzUS838W2HzI/JdXoRLJnyCSpedVQDjrAhRaEPJskw
 2tRNCcPHbkGN9iYYLeASD2SpGWvMY3WXF6wZQgghchOqkcX4YXC1NICikC0kZJZGDRFwCTBvU
 UfvdfZ6XtND3jD7+meEpIEh5EAvubgEGeUHyGTeUlyQRa3chklIaNRvbh3WLL8bL98HKC4ClH
 GBTgm/rvMjHxEg2GFCZYWQ207pWgQQ+8WtfUug==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 1, 2022 at 8:49 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Wed, Jun 1, 2022 at 8:45 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Jun 1, 2022 at 8:08 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Tue, May 31, 2022 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Tue, May 31, 2022 at 10:28 AM Yegor Yefremov
> > > >
> > > > +       WARN_ON_ONCE(memory_intersects(_stext, _etext, buf, size));
> > > > +       WARN_ON_ONCE(memory_intersects(__start_rodata, __end_rodata,
> > > > buf, size));
> > > > +       WARN_ON_ONCE(object_is_on_stack(buf));
> > > > +       WARN_ON_ONCE(is_vmalloc_or_module_addr(buf));
> > > > +
> > > >         /* Do the bulk of the transfer using block mode (if supported). */
> > > >         if (func->card->cccr.multi_block && (size > sdio_max_byte_size(func))) {
> > > >                 /* Blocks per command is limited by host count, host transfer
> > > >
> > > >  Does that show something new?
> > > >
> > > > If this is a block device, the change won't help, but I can't find a good place
> > > > to hook into that at the moment. mmc_mq_queue_rq() might work, but
> > > > I think that is still called asynchronously.
> > >
> > > No, the patch provides the same output.
> >
> > Can you say what devices are attached to the mmc controller? Is it
> > an eMMC block device, an SDIO device, or both?
>
> From DTS point of view: MMC and WiFi (SDIO). Physically, only MMC
> (removable SDcard).

Ok, I see. Actually I suppose I should have ruled out SDIO as the source
of the problem because the backtrace clearly listed the blk_mq layer.

This might instead work:

index 4e67c1403cc9..e8f1d89bd019 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -1401,6 +1401,11 @@ static void mmc_blk_data_prep(struct mmc_queue
*mq, struct mmc_queue_req *mqrq,
                struct scatterlist *sg;

                for_each_sg(brq->data.sg, sg, brq->data.sg_len, i) {
+                       void *v = sg_virt(sg);
+
+                       WARN_ONCE(memory_intersects(_stext, _etext, v,
sg->length), "dma in .text: %p\n", v);
+                       WARN_ONCE(memory_intersects(__start_rodata,
__end_rodata, v, sg->length), "dma in .rodata: %p\n", v);
+
                        data_size -= sg->length;
                        if (data_size <= 0) {
                                sg->length += data_size;

Maybe also try passing "no_hash_pointers" on the command line to have
the warning
print the actual pointer value. If that is indeed part of the kernel
vmlinux image, you
should be able to find the address in System.map.

      Arnd
