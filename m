Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FCD44DEA5
	for <lists+linux-omap@lfdr.de>; Fri, 12 Nov 2021 00:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhKKXvU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Nov 2021 18:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhKKXvT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Nov 2021 18:51:19 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3985C061766
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 15:48:29 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id w22so9068633ioa.1
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 15:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JJWVJalP8CdFuuTjj01mh7dvetDFFkhbScBxvOmImE=;
        b=eSPxiY6MEyQX62rXAkb0w5NNZxOWa7d9ff+SnhlWhS0oTPRJBa2CcaipLWPc0J0gKP
         l053mItULP8bYA7RJDTqKIuh/aUAXRYJq7/ITIAGvRYRnTF+9kbGLe7DBD/rhP/0a1Em
         gAQFu3Lzm+26xVXYz2R/xCLPJIf1sko7Ns7Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JJWVJalP8CdFuuTjj01mh7dvetDFFkhbScBxvOmImE=;
        b=fU9Jr/oueRgblZP1OqlIYPc92G3o/taE4UFAMxBqhF9mnKqMKH06uLp8kHINEW0kT7
         Awo4JwHZAIX/o5KZbxPu0Q69MExF8SIiwr7iTlGRI05n78yRbcmhDqfxb0hxLaxn2Igw
         Tjsx5aOLa0vT0PH3LHO4gS7gqt55tL+ZYzOGjyz/dwGF/LTS5otdEaaYSuwx/IDBJPRc
         QQneRrdnxJWPCOgiNfvQBOideotsDoKG9ITOWca1SKas2FO2Ymq27aW9wwyjTjyJ9VOR
         Ph122/zhUvQ0DA7/ka8y1wJUCNTljmaMIPQQY9s7qmAZMYI3myRrbLItJipTEIeKNOxQ
         +1Sg==
X-Gm-Message-State: AOAM531Lo06utITTkjvcHT7MiFjMvjKHRfzVey56FQBBgQJQT6ARsK8q
        FzDRTP/Oi0+Y1HRWaGAwnsOGg08J2SEp6Q==
X-Google-Smtp-Source: ABdhPJxCLRwQQWBodsANRfk2gUIbN9kkGUOiHXAp+hFj7T6GrfgYuZ0k8Is7lt7xz9fgwC1exOU+5w==
X-Received: by 2002:a05:6602:14cd:: with SMTP id b13mr7374685iow.203.1636674509374;
        Thu, 11 Nov 2021 15:48:29 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id o1sm2713577ilj.41.2021.11.11.15.48.29
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 15:48:29 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id i12so7356015ila.12
        for <linux-omap@vger.kernel.org>; Thu, 11 Nov 2021 15:48:29 -0800 (PST)
X-Received: by 2002:a05:6e02:1a67:: with SMTP id w7mr6255484ilv.165.1636674497968;
 Thu, 11 Nov 2021 15:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20210813195228.2003500-1-mka@chromium.org> <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
In-Reply-To: <20210813125146.v16.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 11 Nov 2021 15:48:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
Message-ID: <CAD=FV=UFUFqojhws0MBqrq41gU9ww1h-T+OjzebFKVwzeC+LYQ@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, Aug 13, 2021 at 12:52 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
>  config USB_DWC3
>         tristate "DesignWare USB3 DRD Core Support"
> -       depends on (USB || USB_GADGET) && HAS_DMA
> -       select USB_XHCI_PLATFORM if USB_XHCI_HCD
> +       depends on ((USB && USB_XHCI_PLATFORM) || USB_GADGET) && HAS_DMA

Technically you don't need the "USB &&", right? Since
USB_XHCI_PLATFORM is defined in 'usb/host/Kconfig' and that's only
even included if USB is defined. So it can be just:

depends on (USB_XHCI_PLATFORM || USB_GADGET) && HAS_DMA

That's not terribly important, though, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
