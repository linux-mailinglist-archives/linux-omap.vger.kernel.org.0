Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BA2539CF7
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 08:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349750AbiFAGIT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 02:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243583AbiFAGIS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 02:08:18 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D733A5F6;
        Tue, 31 May 2022 23:08:17 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-306b5b452b1so7510627b3.1;
        Tue, 31 May 2022 23:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIg3Agwj0lv1Ovj0+uJVN2RThv4snjY10SoUPu90d6Q=;
        b=E8Pn7wEhBA7UUbUKWYp/6kaUoFeWLX+rNGPsvG7ityirdlwKd3J6p+DTa6kFqXrAVM
         jq7BNrJB/4Yzi6b2tF8ADSPHx0JKzJdNQAeZOOguVUFPSRxIpYm7pxlxBvIVfexdyJpQ
         2LUnQjmCdIWCBhvw86e4IvqVHz1VaJcjLIbxm7kimSCYBxWMg6lwFqAuZ1ZFoNvDJf2I
         6IH8F+1i4sYyu4FnM8AAwTMN3GBwWdQdWWtmJPD0SK3ZAK4yWGOFz5bo+ZSZwbkQuAlH
         BZFEgU2PS/SvCTmR3/wv2ITIXPqKvtoRhA7H+QRj6U7NNFnHSVwcbP5SQT7EA0HEl48T
         yYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIg3Agwj0lv1Ovj0+uJVN2RThv4snjY10SoUPu90d6Q=;
        b=3gmeZ6f+jM42Cn4Yg0N3PwfdxQkJDBEj1nFHfeXOFrepdv6j+DLrKSsw1gOGZBMD8P
         bVeTKVVnJuSJRyWq41v21McAQslo+nANSZTSJjcbGasfTFrxUX4Bm7qK0Babj110/GXz
         R0YHavr3wX8iMDdhlkJq/NFB182b6KG4IZKC2DL/RMT79pDsNpfRfUD31BZnGGdLrLRb
         lpmmvO2H+HfLQWv+EGO69oZ8ESZfIvYZM/ZoS9E3lBefjB9uvOfCtM+Tdf+LfZ9CojQS
         oaLl3fEGdmOynSY3JeUaGBL1Pci3pdkUf1xR8br3mOmtuUGzmFo+Ej05rij3BSmv8RmE
         8KaQ==
X-Gm-Message-State: AOAM532NDGr0HJRBNISipQWB+WJXR6K6nQMrsRsldJDnKzjx4PDMCCOe
        mWwo/CyuRLygePGVbW7FzWUSFLt6z7mxDGBV8hagpW3x
X-Google-Smtp-Source: ABdhPJxBjyPQjxT0htPDNEDKDTsNVs0WVxuFeapdBYPyYvk3cWDHR7gt78mvtng45kr9k0MXZ4TzUg/JWnuYIOQSb9I=
X-Received: by 2002:a81:184b:0:b0:30c:846e:e2b with SMTP id
 72-20020a81184b000000b0030c846e0e2bmr12384622ywy.97.1654063696148; Tue, 31
 May 2022 23:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
 <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 1 Jun 2022 08:08:04 +0200
Message-ID: <CAGm1_kuYGMAbO0aB52hRwZp6qALALQ4LvMkNuC=F9Pk4P5BdXg@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
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

On Tue, May 31, 2022 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 31, 2022 at 10:28 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, May 5, 2022 at 7:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Hi,
> > >
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > > > Hi Tony, all,
> > > >
> > > > During the kernel boot I see the following error. The device is still
> > > > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > > > issue?
> > >
> > > Thanks for reporting it, I was not aware of this one. Might be worth
> > > bisecting. Adding linux-mmc and Ulf.
> >
> > After enabling the CONFIG_DMA_API_DEBUG option, I also get the following error:
>
> > [    7.603288]  dma_map_sg_attrs from sdhci_pre_dma_transfer+0xcc/0x134
> > [    7.609705]  sdhci_pre_dma_transfer from mmc_blk_mq_issue_rq+0x2f4/0xa58
> > [    7.616462]  mmc_blk_mq_issue_rq from mmc_mq_queue_rq+0x124/0x258
> > [    7.622604]  mmc_mq_queue_rq from blk_mq_dispatch_rq_list+0x1b8/0x8ac
> > [    7.629104]  blk_mq_dispatch_rq_list from
> > blk_mq_do_dispatch_sched+0x2ec/0x350
> > [    7.636387]  blk_mq_do_dispatch_sched from
> > __blk_mq_sched_dispatch_requests+0x118/0x170
> > [    7.644448]  __blk_mq_sched_dispatch_requests from
> > blk_mq_sched_dispatch_requests+0x34/0x5c
> > [    7.652859]  blk_mq_sched_dispatch_requests from
> > __blk_mq_run_hw_queue+0xf8/0x230
> > [    7.660402]  __blk_mq_run_hw_queue from process_one_work+0x284/0x72c
>
> This is the blk_mq code taking things off the queue, so we don't really
> know how they got put on there at this point. To find that, we'd need to
> annotate the mmc code with the same kind of check to test the buffer
> address whenever something gets submitted on the blk_mq queue.
>
> Looking at the calls to sg_init*(), I found sdio_io_rw_ext_helper(), which
> is what all sdio commands pass through. We could annotate that using
>
> diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
> index 79dbf90216b5..4ab063c50649 100644
> --- a/drivers/mmc/core/sdio_io.c
> +++ b/drivers/mmc/core/sdio_io.c
> @@ -322,6 +322,11 @@ static int sdio_io_rw_ext_helper(struct sdio_func
> *func, int write,
>         if (!func || (func->num > 7))
>                 return -EINVAL;
>
> +       WARN_ON_ONCE(memory_intersects(_stext, _etext, buf, size));
> +       WARN_ON_ONCE(memory_intersects(__start_rodata, __end_rodata,
> buf, size));
> +       WARN_ON_ONCE(object_is_on_stack(buf));
> +       WARN_ON_ONCE(is_vmalloc_or_module_addr(buf));
> +
>         /* Do the bulk of the transfer using block mode (if supported). */
>         if (func->card->cccr.multi_block && (size > sdio_max_byte_size(func))) {
>                 /* Blocks per command is limited by host count, host transfer
>
>  Does that show something new?
>
> If this is a block device, the change won't help, but I can't find a good place
> to hook into that at the moment. mmc_mq_queue_rq() might work, but
> I think that is still called asynchronously.

No, the patch provides the same output.

Yegor
