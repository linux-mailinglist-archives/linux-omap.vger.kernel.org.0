Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 313B065F41D
	for <lists+linux-omap@lfdr.de>; Thu,  5 Jan 2023 20:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbjAETIx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Jan 2023 14:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbjAETIw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Jan 2023 14:08:52 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFB65E668
        for <linux-omap@vger.kernel.org>; Thu,  5 Jan 2023 11:08:50 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z4-20020a17090a170400b00226d331390cso1863880pjd.5
        for <linux-omap@vger.kernel.org>; Thu, 05 Jan 2023 11:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUd4QuugkUbEoOVF42omoODChxWnG0+L8jsWb0GiBQI=;
        b=HNS1xuFrho2Wup+tqbvpTLJjPhwn53PVeMrnok/M2O9kq4WDo1FjVI5BDxRI/YR5My
         i+G+skJ4OufZfDOcVJXwIgk3jvokRlH2mvmEtRVN1224mSJDzy3ukbi1YRVeaEkvMYeC
         dZvpgz61uNcn2y8b7rrHwxaKmeX1s6AQZgLDgkq3UCdK8Tm8fc+CKK6oP4j9Sd6T503X
         Oqg783CG7UdHY+UENpNDk1rUGGB8K8CP7kKzeTY9/tDFSR9WqAB0LHr8PXM+0toJw9+h
         5M5wegniHnStngpKn+op0EAbvrTKR6qfQJKwGDSaq+UM/2AoHFxl9qyBolj5MYhzdd+M
         bczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUd4QuugkUbEoOVF42omoODChxWnG0+L8jsWb0GiBQI=;
        b=yv63o2YNZEpOyMUQyfOlHZ6OUmIZ4xDYk0ec9j4hIurqY97cyGf2v3aOwMRZ3FRIug
         AkQh1dF5OwZBfmJ7FtL6KE36y0fYyyvc0gzb75qQRKDlfoSQnGatKfCSdadXVrYiv7SW
         zakXbebnS6LZXmXe77K/7UGyX6HNKVp19cdc1FLlcfdnlcr2uer/ijegOH2lg3nqhC1y
         MeZzINi9QkV4j8TFP0ffe+/1q3ZlG3ui3+KokRogPrvyNqxnurZ3iO3KkCzj6PEiivcF
         1GKl1o6d8dshEoT7mfAydCF4dQYQN67GK8YVfCA0MH4T/z4OkJncApQoZZZfEYTM5kSD
         2v1A==
X-Gm-Message-State: AFqh2kr0ELLXPLVziwkBpFYFTuwhjN8bx2n5hQ12ggju7VpNVvOc8lau
        AAoFyQcB8CmCfFYakoU/ALPUVHHA6O0MPeY45YYSoMxn
X-Google-Smtp-Source: AMrXdXv8yRomnvOThcq74GW9RsBsvk9/xdwvAsBFmUubP6eXkNaLD7XdF5+QPKpdpUbeCMIqRg5CMqFTUBjKWOwvtd8=
X-Received: by 2002:a17:902:7e41:b0:192:5aae:c828 with SMTP id
 a1-20020a1709027e4100b001925aaec828mr2120359pln.125.1672945729669; Thu, 05
 Jan 2023 11:08:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
 <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de>
In-Reply-To: <5DD8AC17-A7FD-4D44-953E-F2EF84C6896D@messlink.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 5 Jan 2023 13:08:38 -0600
Message-ID: <CAHCN7xJZgy1HKp-sHtqZeKAa2uKFtLLGeEguJoZRB+RswEfgJg@mail.gmail.com>
Subject: Re: omap_hsmmc RX DMA errors
To:     "H. Nikolaus Schaller" <hns@messlink.de>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
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

On Thu, Jan 5, 2023 at 12:17 PM H. Nikolaus Schaller <hns@messlink.de> wrote:
>
> Hi Adam,
> happy new year!
>
> Am 05.01.2023 um 18:54 schrieb Adam Ford <aford173@gmail.com>:
>
> I am trying to test the 6.0 kernel on an AM3517-EVM, but I am seeing
> some DMA RX errors:
>
> [    1.730682] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
> [    1.738403] omap_hsmmc 480b4000.mmc: RX DMA channel request failed
>
>
> I think I remember there was an issue that more an more devices were switched active by default
> to use DMA until the 32 channels of an OMAP are filled up. Which subsystem is hit by this
> limitation may vary and depends if they are properly disabled on the specific board DTS.
>
> See: https://git.goldelico.com/?p=letux-kernel.git;a=commit;h=048b9bc86b9a080258460c4ab2989660233c4c8c
>
> (I must admit that it is not yet upstreamed).
>
> I tried changing the omap3.dtsi file to use the newer sdhci-omap
> controller instead of the older hsmmc driver since it has support for
> the omap3.
>
>
> This would then only be a workaround but not a solution.
>
>  That seemed to fix the issue:
>
> [    2.141967] omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver
> [    2.183074] mmc1: SDHCI controller on 480b4000.mmc [480b4000.mmc]
> using External DMA
> [    2.184631] mmc0: SDHCI controller on 4809c000.mmc [4809c000.mmc]
> using External DMA
>
> Would there be an objection if I migrate the OMAP3.dtsi file to the
> newer driver?  I wasn't sure if there was a reason this family was
> being held back from the newer driver.
>
>
> AFAIR Tony wanted to retire the older driver anyways.

That was my impression and it appears that the AM35x has already
migrated to it.  I wasn't sure what was holding us back.  In theory,
we could add the compatible flags to the new driver and mark them as
deprecated so the new driver would work with older device trees if
there was push-back on changing the device trees.  I know sometimes
there are concerns about using older device trees and the interaction
with the compatible flags make it a bit more complex.

adam

>
> Best regards,
> Nikolaus
>
