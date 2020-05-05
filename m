Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7D81C62D8
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 23:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgEEVRb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 17:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729265AbgEEVRb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 17:17:31 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA0BC061A10;
        Tue,  5 May 2020 14:17:30 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id d7so2235847ioq.5;
        Tue, 05 May 2020 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ObvnibH/bA7L+qUHQk3KzdXE6hU6sK12JK5IVLdHK8k=;
        b=Bc5EqmMGLylJiaUpxVrcIqbvJgQ80wtohLMo5qPOCf/qeuHWKdQdlI9l3yA66sKUZh
         GUT/GEyHNiKgftZOvBHqvEAl3kNfoPE+EWnAZZjhBCn+S9kqWwPPHXZEMbTM7aS1hRJl
         7bl1ySWpt1tr/aA5f03mB9hJRFL/irZAk8J9VgoSWpnBAE0MmlhkAb/ZuUI3EL0ahb2A
         fWNpu7BzEYGagww1iC/xlFc1W2k+/e81+MVRGwLbHZKh9StpaI80jl0XeHzTf+Ow2J0r
         f7a0T+Tw68OBuETkcKU6Oy0XCnDIXfBvZvpehkfYL0Xkw4SgZP5x3rzIrt+2eWlk3xFF
         6brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ObvnibH/bA7L+qUHQk3KzdXE6hU6sK12JK5IVLdHK8k=;
        b=TTkGnRAkmTkFP0bSYnq/M0K9YinbqiHKJmAAW1TjUPNw0GApjGVCxKRlwmH6TmEEGl
         1xtcWD3cR2D9/Uq8ztmJ6bwrAwGwFghi8TUWRfP0DV4hZB+j55BLAf6BkVIy6V0VE3ud
         wEcpwEgcH4DKw4dZErmBTwO/9IvyZStPGxCPfioVyXECSupWWVRUqirVP2MYfowOtnwO
         IidBF5+/Q1jLDJ6Q2fYw1v6ZWu1L9h5qaZA68BnnpQxFJxEF2eDxDcHKJHt3LaTAwAVp
         dC94P6MIQt125K/KbI0Q9HCTmnG26F1jL0X9cOBRoUHRMdW1sg1FA95Mew+BZe0+hO16
         W2mw==
X-Gm-Message-State: AGi0PuYPExvQELhKXFdBt13rA8im+GeIbkCces/I7LuikReYn+JUtGMI
        LtR+X+8Jq5C4/iAJ5uq1+TH1nP/U2PdW0ArwOmcyXUyW1sQ=
X-Google-Smtp-Source: APiQypLQ75JK91aDvaW1893+YhytZDhE4HmtF1tn18BlEcLC9Zvi2aFGbd0/Iqk8RU8KgOFEGBQguZGcfBjiml1iWho=
X-Received: by 2002:a6b:dd16:: with SMTP id f22mr5398940ioc.178.1588713450141;
 Tue, 05 May 2020 14:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200504230100.181926-1-aford173@gmail.com> <20200505184223.GR37466@atomide.com>
In-Reply-To: <20200505184223.GR37466@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 5 May 2020 16:17:19 -0500
Message-ID: <CAHCN7xJxg+uO4h2RcapyjormTMzXFwoMUOi7rh2hUsScJtK56Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 5, 2020 at 1:42 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [200504 16:02]:
> > Various OMAP3 boards have two AES blocks, but only one is currently
> > available, because the hwmods are only configured for one.
> >
> > This patch migrates the hwmods for the AES engine to sysc-omap2
> > which allows the second AES crypto engine to become available.
> >
> >   omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
> >   omap-aes 480a6000.aes1: will run requests pump with realtime priority
> >   omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
> >   omap-aes 480c5000.aes2: will run requests pump with realtime priority
>
> Great :) Looks like I'm getting the following though:
>
> DTC     arch/arm/boot/dts/am3517-craneboard.dtb
> arch/arm/boot/dts/omap3.dtsi:160.39-184.5: ERROR (phandle_references):
> /ocp@68000000/target-module@480a6000:
> Reference to non-existent node or label "aes1_ick"
>
> Is this patch maybe missing a change for am3717 for the aes1_ick?

I am guessing it's the same issue that plagues the am3517 with a note
in the hwmods that stated noone seems to know which am3517's support
it and which don't.  The RNG was disabled on the 3517, so I am
guessing I'll do the same for AES.
I should have posted it as an RFC, because I don't have the proper IRQ
setup for the newly supported AES engine.  The interrupts that are
used for the original AES are listed as 'Resereved' in the AM3517 TRM.
I assume the second engine uses different interrupts.  I don't suppose
anyone know what it should be?

adam
>
> Regards,
>
> Tony
