Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4DB199FF5
	for <lists+linux-omap@lfdr.de>; Tue, 31 Mar 2020 22:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCaUaE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Mar 2020 16:30:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32802 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgCaUaE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 Mar 2020 16:30:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id f20so23469483ljm.0;
        Tue, 31 Mar 2020 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMMU+s7iMJHk7FqiEPYs8vBGLtrPTwaKOmVYBPS58SI=;
        b=oCEM7chcd+lHmzehO9870OYGvbHYP+SrlPe8vT9W5h1K/gAO4EB62vGpsYuQvmqsgp
         y1zHuyXDQc5RL+hpq2GIJAOFI1psotTuSMjwuEe9eQGaMWOVmr1VgqSEDwShH9zLkHns
         eKe+xUMFNPEgw2bewiNRQSo7aJqlpO9Z8qTwAZasK8fHgvTPHEmlqsudvpDo01ugR5w5
         ZpN0lDtxTuVSOPz+WunHvxhd2f3DTi47KJSuTSYkHG8ya68xsU75QojO5rfvZgh+BBik
         AFKdOX9kF6pjG0Xot8xdOr0oBsQaNLKV/s9cLJ70qwbS80L3S1eFoA8QgEa2UsCEoe6y
         ez3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMMU+s7iMJHk7FqiEPYs8vBGLtrPTwaKOmVYBPS58SI=;
        b=hn/QfH1FVeAA6toSJ/U+iJ9k7WV77FWw56hXt5wvnQNEfp8j2V0Uh++jLJuaYSnwU2
         QxvleV6TlZeklYNfoKERGCAKUcjS6ETYHm75dcOdEai01iXkUkL86kzfZPM8fZFI2tMb
         nP6McjEmQ0ZX+YRtFFP86U/c82qTzlyUQHafvVEODgF9YzzE8reUGbN3Zo6VD7Xz/1l4
         IcYLZSr1MlzxlzkQDXgWk2begjZH/nMc4JE1aKn0fCNOgQBpDwVtyknBIk29mrRSkIs5
         YU4w+kEIzDbfTHzgYtgvE2TbzjZjVpJ+Xlmbt3dLEWxkAPzd/AvFTygyo84FWI9fTnnl
         JC4A==
X-Gm-Message-State: AGi0Pua0uaHFpv0UIhOAlEW0Msi0mMpLRngh1UhJHFeWYLDknJtCB6b1
        p+vp79Pad6gzKee7SKjUOdCWBb5As5NtvnfkKsM=
X-Google-Smtp-Source: APiQypJndi6nOWadfiPbOYHTode1edEee9bR6lQDxX095dN6jrdJVnUQM8J+A0BuXGOJI40dvo2K8Uy1Df/LML7D+lc=
X-Received: by 2002:a05:651c:1aa:: with SMTP id c10mr11590837ljn.53.1585686601679;
 Tue, 31 Mar 2020 13:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191120220559.18914-1-c-robey@ti.com> <41c73bc1-99ae-6797-5bb7-7acc0f6518c0@ti.com>
 <20191212170452.GV35479@atomide.com> <CAEf4M_C05Hwc_BEL6MaFNNEW0Cf2kc-LvMi9qdKxL7hVAFFDGQ@mail.gmail.com>
 <20200331184647.GF37466@atomide.com>
In-Reply-To: <20200331184647.GF37466@atomide.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Tue, 31 Mar 2020 22:30:30 +0200
Message-ID: <CAEf4M_BxY0JgWXRRp48gFgWWcN2uJd7q4kXOCmOBziGpWYCvoA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: am5729: beaglebone-ai: adding device tree
To:     Tony Lindgren <tony@atomide.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Caleb Robey <c-robey@ti.com>, linux-omap@vger.kernel.org,
        Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Tom Rini <trini@konsulko.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 31, 2020 at 8:46 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Drew Fustini <pdp7pdp7@gmail.com> [200331 18:39]:
> > On Thu, Dec 12, 2019 at 6:06 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > On 21/11/2019 00:05, Caleb Robey wrote:
> > > > > From: Jason Kridner <jdk@ti.com>
> > > > >
> > > > > BeagleBoard.org BeagleBone AI is an open source hardware single
> > > > > board computer based on the Texas Instruments AM5729 SoC featuring
> > > > > dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
> > > > > signal processor (DSP), quad-core embedded vision engine (EVE),
> > > > > Arm Cortex-M4 processors, dual programmable realtime unit
> > > > > industrial control subsystems and more. The board features 1GB
> > > > > DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
> > > > > 1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
> > > > > headers.
> > > > >
> > > > > For more information, refer to:
> > > > > https://beaglebone.ai
> > > > >
> > > > > This patch introduces the BeagleBone AI device tree.
> > > > >
> > > > > Note that the device use the "ti,tpd12s016" component which is
> > > > > software compatible with "ti,tpd12s015". Thus we only use the
> > > > > latter driver.
> > > >
> > > > Ah. thanks. I see my comments resolved here.
> > > > no more comments to net part from my side.
> > >
> > > Just FYI, Jason had one pending comment on the earlier version
> > > about the compatible property to use.
> > >
> > > So I'm assuming there will be a new version posted, tagging
> > > this one as read.
> >
> > It came to my attention today when talking with Jason Kridner and
> > Robert Nelson that we did not get the BeagleBone AI device tree
> > upstream yet.
> >
> > I am having trouble identifying what the pending comment was from the
> > original patch series.
> >
> > Was it related to this compatible string?
> >
> > > +       compatible = "beagleboard.org,am5729-beagleboneai", "ti,am5728",
>
> Yes I think Jason had some comment on the compatible string
> to use.

Ah, I see it now [1]:

> Probably need to change "beagleboard.org," to "beagle," as of today.
> With the new yaml stuff for defining device tree entries, having the
> period (.) in the vendor identifier can be a bit confusing. I altered
> my submission to avoid this.

so I think this should work:

compatible = "beagleboard-org,am5729-beagleboneai", "ti,am5728",

We'll get it resubmitted.

Thanks,
Drew

[1] https://lore.kernel.org/linux-devicetree/CA+T6QPm-DNG_QoAMWw_zUDUkZCfhbBTgygnoPAykf3mgK7opaA@mail.gmail.com/
