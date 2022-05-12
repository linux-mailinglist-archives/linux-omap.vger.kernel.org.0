Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C65524A26
	for <lists+linux-omap@lfdr.de>; Thu, 12 May 2022 12:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352509AbiELKVM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 May 2022 06:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352572AbiELKVE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 May 2022 06:21:04 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975DB2CE0D;
        Thu, 12 May 2022 03:21:02 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id e3so4783345ios.6;
        Thu, 12 May 2022 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FXp069BhAhaqu9+rnJ0bPsp9cWfgDzKQDHjc5fhjNoY=;
        b=PMJFawy6Pcud0h53JYQ6dkgAxtDKyks70dw+oJ362P4FzJ22KrVIE8NF+/LwqcBUrw
         K4WIN/7WBHdO9/EChDubQkoIvh53PmQ7DTrZjJx15QCMxUNaEQ9QUibXRUeIl2mctyns
         dYhhsVb9c6fAfhcZ+k7t3ON6VX+hliEtDgq6aGBFCsV3AleamfM8P6ovgOEWHT82n2eJ
         VcIo3QR0mSW6ryjNP9WkhthlDBhmDK8EtXtIT33ymFHDxb+RHrY4M/iUp1s7VSYxaL0R
         eOGgKEaz2F0IEJCeB2aK4RNgSRWqZGVrbThjWt5D2Jv4zoZJf9LRryoiQmSO/8Na2eGR
         hdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FXp069BhAhaqu9+rnJ0bPsp9cWfgDzKQDHjc5fhjNoY=;
        b=mH8qC2joUPYmMnr5ImDRILZN9/w4SZvU9/+mgqOh6Ca/UBjn/7US65H7zdPsZHTFza
         Js4X1PYSXQfLMkVaivsI9LfcIRwHnB3DD4RJ1i03swUmP+4FVRU1XXrlNphXVslsRRbs
         IH3t4Y6/GRjB5NpiywaS/pyIvw+oICP52dQZzyBmzaO9zKuL3pS+KGNw9Rc78cvNb31M
         Pnfws41Ljj+ghKTzxhKK+UpqI8lIrP9qPT1qrZRFupu2DJzspuP9i8pInrSSEXoiTUYs
         pAKJegcRB1WsbE/ZGJ02WXMvQCiU2WGr6/0V8x3ltw05rQQqH9d2h0yR7F6ynH7CWcIR
         RRjg==
X-Gm-Message-State: AOAM532TF2h0bJrZBxf5IWWSXeBl9vQ74babC9PUr4ffEmmy9Po2kTQt
        fVaUtteXPwxBbb8uwb/sEyYk6fop40PkNvSFJv0=
X-Google-Smtp-Source: ABdhPJx+ZC9Ocd0QOwPxWtN+gib4b3QQY/gcHZCB5uo0ioGQZSGik5W42eagd2fuSjktwqlukVOUy4sT3f/4WlexuTU=
X-Received: by 2002:a02:94e6:0:b0:32b:2c45:61d with SMTP id
 x93-20020a0294e6000000b0032b2c45061dmr15537595jah.74.1652350861851; Thu, 12
 May 2022 03:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 12 May 2022 12:20:51 +0200
Message-ID: <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>, Ard Biesheuvel <ardb@kernel.org>,
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

Hi Arnd,

On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > Hi Tony, all,
> > > > >
> > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > stalls as soon as I invoke the following commands (initializing
> > > > > USB-to-CAN converter):
> > > > >
> > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > ip link set slcan0 up
>
> Oh, I missed this part at first and only looked at the backtrace.
> Which CAN driver
> are you using? It's likely a problem in the kernel driver.

I am using the slcan driver [1].

> CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> just see it by looking at the right source file.

I'll try to get more debug info with CONFIG_DMA_API_DEBUG.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/can/slcan.c?h=v5.18-rc6

Yegor
>        Arnd
