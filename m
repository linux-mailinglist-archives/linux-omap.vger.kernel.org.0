Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94A2C23F7
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 17:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731872AbfI3PKY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 11:10:24 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35110 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731867AbfI3PKX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 11:10:23 -0400
Received: by mail-io1-f67.google.com with SMTP id q10so39311096iop.2;
        Mon, 30 Sep 2019 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDc8+7cL7Y/4C0a6+07Pf5UoiAcCuQN9j9naZA92m/0=;
        b=XAxgqcVCJ0KTsEs61oTy/OJohBiI9uvP3rdzYsBtljp2uXLIhWrCfKkri/Tu5Wl+Wr
         BaRtLcYL7krs2ngV78Nkhx6J8pM/8T1eofwTwlgYcg6rheQnSzc9IASx3Fm4mkFvIUG2
         Lo2Gn/siHlqy+GFLeYsW3+m1RYN+O2WSyflAEtRyXDs+9xQuCvZUUOcjRsONfB81CuZT
         FnY1zzPD7jtNJWcLhLUps8URe4kC+hK4GvFY/C8F1d+yLgMutc0q6Nxd61Obgu1tGIpT
         psffbZDtzaaf7lUDzIdZeoevfZxGTm6B3IBZW2QrS1x9P6/W10IsX6W4vbDcXN/Zszbt
         6wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDc8+7cL7Y/4C0a6+07Pf5UoiAcCuQN9j9naZA92m/0=;
        b=nDkpsZYx0Dtm0UrjjEiED9SW5aucuepE5E6SWMZ9jAqc13vwlvp8/ATQ6Bc3ZKTZhm
         yAU2vCzqQiHP0P8IF0o6+8lDZAQCqtZHT7B80xMV9Dgg/3yqwctLzS/SEm4l0bhDs5aS
         3VZDIaD1YGgGWZnfcgnj6aCUdqcxtE4X//wFEZzBFQhpAnGvzxKOwIjjtbMmnikgIU1o
         gTtJrANhWoYB5tnS9rRJVPLvlwa6F6nkU7dz+pcubKPB77jrqx/hMhItvyFw3vTe8af2
         eZZHetbrfi1B9+Y8z9WQNVNv6wXGCDPWImUsoHc1ij4C+cbfoIzBoFOzN5sFEOrSiwS7
         bdcA==
X-Gm-Message-State: APjAAAW5ScqRWFwJPxqwpEKQy7Pj9LHg0nwLoRoESbLBmCSK1B3XfgM/
        GdI6kNj008NdKrgmA/ExF+Pfmdwywsh8/oWL4Ko=
X-Google-Smtp-Source: APXvYqyzDMlPXrOMXU8uR89U0O8jpXzWwYfcO5kKUr3rMEw1nkiaNwzvwL+uFQHt7SWZhkPxpu0e2/wrwcUd0IP2oeU=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr823617iof.58.1569856222518;
 Mon, 30 Sep 2019 08:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com> <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
In-Reply-To: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Sep 2019 10:10:11 -0500
Message-ID: <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 30, 2019 at 9:27 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 30/09/2019 17:20, Tomi Valkeinen wrote:
>
> > Let's see what Tero says, but yeah, something is odd here. I expected
> > the max divider to be 16 with Tero's patch, but I don't see it having
> > that effect. I can get the div to 31.
> >
> > You can see this from the clock register 0x48004e40 (CM_CLKSEL_DSS). The
> > lowest bits are the divider, 5 to 0. The TRM says max div is 32.
> >
> > Tero said for him the dividers > 16 didn't "stick" to the register. I'm
> > now wondering if he has an old beagleboard with OMAP34xx, which has max
> > div 16.
>
> So testing a bit more here, I can see the DSS working fine and fps as
> expected when I write values directly to CM_CLKSEL_DSS:5:0, with
> dividers up to 31. With 32, DSS breaks. The TRM (AM/DM37x) says value 32
> is valid.

I wonder if it's somehow being masked with bits 4:0 instead of 5:0
which could potentially make the divider 0 and that value doesn't
appear to be valid.

adam

>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
