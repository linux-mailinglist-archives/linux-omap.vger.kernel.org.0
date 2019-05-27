Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5042BA70
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 20:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfE0S7K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 14:59:10 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40644 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfE0S7K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 14:59:10 -0400
Received: by mail-oi1-f193.google.com with SMTP id r136so12517252oie.7
        for <linux-omap@vger.kernel.org>; Mon, 27 May 2019 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pNRoKcCuhIS9xIyaBQiqtrKyyTh6R7Fw5zl+s0X/dUo=;
        b=gKOUUUqljOmFKZwwkNiJMssB7zEQx/HIPvONJgqrTqcgqm3CbWTTjUyxD+onvjwDUr
         wYx5jDVtdmhtx35/EcLcmouG5N/2imBpmZ5HbEbJl6LcNxo5YDy9g8KNhePS2nybkb+h
         3r06cFVLvtbG1m9IhNeMjm5Dw4FTmXaQ7iJk/7TKMvNvCiJh6Zslc1F3IdJuK7ZetiAK
         ug8KDxoAcmvoUwZr3zYqPFhSsRArzrztTVnUNRxzdMZE+wQOfZ0PTrrJzrqbI71XAVrW
         ZkhTSn6/lYF53MIJ16yvQ+V7XgtIFZxzjhh9PFt72VHVJF82n8gi1LR6nsKS+KjPHzex
         aFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNRoKcCuhIS9xIyaBQiqtrKyyTh6R7Fw5zl+s0X/dUo=;
        b=RucfvkqEhqivRr8eKym38KHbOrOYKhBwKPHo79a++PV5aXXQlE0ymsOBkRaTgtDTRY
         4/LG16sdNuOamfG6gpzCW0HcgnwR2hRf+m9jELTqUhAgLPLP+8VaIhXLTLIgLLp+Qbuc
         I452T3qXFysOU1nWXAgFLYUaavQJMPBswYVGlWBrH5XKcmCs/REOx/nxc6cQR6MVSLlB
         EcPe0ADvrTJrYRyXXS2rOy4NZjctGCKBPNVRfjkvzMyM5njr7IuN9wlbBHLFHtYhMhJ9
         fIBGZZyjRtMxZ4lnxfh7Vz2XuNRVBINELuu9a6qm2xhJGgwZcKsqK+QOyk6Y0UHidvcR
         eqZQ==
X-Gm-Message-State: APjAAAXEDlVJsxaMA94KwI+MnosgSeRgl5nAMAJbZ4mXu8/7Em+AxkBe
        /DBkMgwHtdRgDLlsW23qwhud9zvKmf8Lcdxd7crkVA==
X-Google-Smtp-Source: APXvYqyzJK4hUa2yxcAoRiPaUD9iZ3DRriWHQF2zFxo5NNhy614LaZ0av+lp+kKrLz3zxvzQ4SL4+LlLAoamnY5sKzA=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr277691oib.170.1558983549317;
 Mon, 27 May 2019 11:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190520190533.GA28160@Red> <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red> <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
 <8977e2bb-8d9e-f4fd-4c44-b4f67e0e7314@redhat.com> <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
 <20190527063250.GI5447@atomide.com> <5dbec436-4356-415e-eb1c-0f506af89744@roeck-us.net>
In-Reply-To: <5dbec436-4356-415e-eb1c-0f506af89744@roeck-us.net>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 27 May 2019 19:58:58 +0100
Message-ID: <CAFEAcA-n8-LV2=hQwQOvRDT+pro7iBQD8i-QBszWHuW56VQsvg@mail.gmail.com>
Subject: Re: [Qemu-devel] Running linux on qemu omap
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 27 May 2019 at 16:56, Guenter Roeck <linux@roeck-us.net> wrote:
> I'd be happy to use a different (supported) branch, but the Linaro branch
> was the only one I could find that supports those boards. Unfortunately,
> qemu changed so much since 2.3 that it is all but impossible to merge
> the code into mainline qemu without spending a lot of effort on it.

Even back at 2.3 it wasn't possible to merge the code into mainline
without spending a lot of effort -- that's why it was not merged :-)

thanks
-- PMM
