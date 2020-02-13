Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F094A15CD5C
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 22:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgBMVeA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 16:34:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37206 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbgBMVd7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Feb 2020 16:33:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so8530364wru.4
        for <linux-omap@vger.kernel.org>; Thu, 13 Feb 2020 13:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thrfidZEXfFD2ylg+vGXSjTreZQAX0NX3YGDxc6rNSg=;
        b=pcr2ELWAOW3MYGXvvBfDBoRM3qbzHOybRv9WbmKycoQa37rKhRF10aLaXGi249l6iS
         ARkoY8V3FMzw/a/h9madJHc0Au9LYSL85VXUMTMd39Ux9GuOkx8cxAUB7/ly5y5NzrNS
         Tck0J2JXltDadRBBPPv7p6lc5sdxKWipFZLTdvv8O6Lp9sl+pVRdN+QxQ+wMLRaSvpJ+
         WVgcBFgbH9SyinnWl/BU0T12s7qVNKVSNOutpswWaMNQEkfBKbFZXVDi3897bnNcPr2M
         xfJqP+vS87iPr/LytrK/2SXbbpmD2qVbwKbospaYTl8FBXFjf+WuJdrpdYgcRsNTK95U
         IY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thrfidZEXfFD2ylg+vGXSjTreZQAX0NX3YGDxc6rNSg=;
        b=YsrnDanRLK4FmCU5HjGkReRKVdywJ3gib4TxgxpRQtOfoOcVaIxv/K356YF8n5+kU0
         +l/X9RU47Hq6bhYlxMYDROK9LXwIHrBzY8tPgx0N7Qigy0CUybyDHQGkMjDIJVvhIbi4
         Y/RbZTOofFouSPumXZNaI2+Q1ms+XIKQvQ1fnozV5gIWb8ZLGCLZ7BVssK4L83vWkjIl
         6XFL/Jz3ctZ/MH4VETR++msJKUBclkdGYCKzJ6t6TTcE92FEBDgPfNthM+iuQsOWUWRu
         Iov2bQM/6f8WYxB5VGRPjwqSQXwGUaODRIUXWUhZWJmXSVx26EYB5qTp+8cz2KEkgSnA
         PaLw==
X-Gm-Message-State: APjAAAW1+UKsD9glE8rRX9+bajOP2220Gg3vB7dq9zlLrPogPTYOxZQz
        jxy/NFP48fyjsbZ4F/KOXacQzoI11TgtDn3TNtmzGQ==
X-Google-Smtp-Source: APXvYqzr00y2DFZH5q6ouHgsRGIlUhbotdyNjCkLctIPWaycNmnAKQS7K2YoXX/AfBSCa4EPho4zGte6nnlUhEioJ/g=
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr8318827wrr.208.1581629638081;
 Thu, 13 Feb 2020 13:33:58 -0800 (PST)
MIME-Version: 1.0
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
 <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com> <20200207163623.GA64767@atomide.com>
 <da14d6bb-f241-2dd4-8e94-886217a40ed7@wizzup.org> <20200207165344.GB64767@atomide.com>
 <20200207170149.GC64767@atomide.com> <op.0fmv4jevhxa7s4@supervisor.net28> <8a19bde5-f49f-ad58-3b3b-6df8a764f1f2@wizzup.org>
In-Reply-To: <8a19bde5-f49f-ad58-3b3b-6df8a764f1f2@wizzup.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 13 Feb 2020 21:33:47 +0000
Message-ID: <CAKv+Gu8Yh2Y5Rg6rVtL5zsm1CJhgRKjug3NW4j_uuuO+YhMzRA@mail.gmail.com>
Subject: Re: Nokia N900 on 5.4 and 5.5
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     "Arthur D." <spinal.by@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 8 Feb 2020 at 02:48, Merlijn Wajer <merlijn@wizzup.org> wrote:
>
> Hi,
>
> On 07/02/2020 21:20, Arthur D. wrote:
> > Hi.
> >
> > I was able to build linux-5.5 and run it on N900 with no problems.
> > Even WiFi works, mmc0 is in place too. It seems you're doing something
> > wrong.
>
> Well, I didn't try mmc0 on 5.5 (since it was also non-booting due to
> issue below), so I will have to try that this weekend. The steps I
> applied to build either kernels (5.1 with our patches, 5.4.18 and 5.5.2
> are identical, except for the defconfig for our 5.1 branch)
>
> > Were you able to build linux-5.1 with your scripts and run it on the
> > phone? I mean the pure linux-5.1 without configs and changes done
> > in https://github.com/maemo-leste/n9xx-linux.
> >
> > BTW, I didn't find STACKPROTECTOR_PER_TASK option to be enabled in
> > omap2plus_defconfig.
>
> Well, I can assure you it was turned on on my system after a
> omap2plus_defconfig. I do run Gentoo Hardened on my daily systems, so
> perhaps that somehow makes a difference in what defconfig is picked.
>
> Either way - the option is turned on by default after I make
> omap2plus_defconfig, and it breaks appended DTB loading, so I hope we
> can look at fixing that.
>

The STACKPROTECTOR_PER_TASK Kconfig option is only selectable if the
prerequisite GCC headers are found on your system which are needed to
build GCC plugins.

Is there any way you can enable early serial output one one of these
boards, to see if you are making it through the decompressor all the
way into the kernel?
