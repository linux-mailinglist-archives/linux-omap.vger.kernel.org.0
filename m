Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021FE199E23
	for <lists+linux-omap@lfdr.de>; Tue, 31 Mar 2020 20:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCaSiL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Mar 2020 14:38:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46280 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgCaSiK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 Mar 2020 14:38:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id r7so15405323ljg.13;
        Tue, 31 Mar 2020 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/jwDOe+5jnEC+le3jpCg1Ia6gNwhPXykp3nmWWhaOs=;
        b=efL3HT8pfTGSmpyjNAyFLdEXEf+iJsj0as5yEpNO7JudauMQa/KZj6D7xFxcKKnjhV
         iPsBeft+PnbfJC+Vp6nLBwnlZ5tKQ+8ZBNF9YgWR7+3eFhLFJVkmXf+5gj2SEd4dqa3s
         lkgGvPRBtmheVxe7N6FgijtF4pjZ9WlVZMf8zzO5uaB3URHQiV8pFOwzP1Rvzbdv9Tr9
         Pd3REBTMmX+KxQgz/+GobUY/Nl/bjrmfSreT2c2ZkyqAMIIyNTUESippgbxRjAskm82a
         cb7RqxivclSsiqz92iezds6lQlwNzWvgnITilpL2P9XR8heTGadXxSI7dCJihYX/6iMf
         HvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/jwDOe+5jnEC+le3jpCg1Ia6gNwhPXykp3nmWWhaOs=;
        b=Il+9K3N2EH3lr64ps1nFPg4bqyNfRoi6lOSP6Vg+jrvv1S/9c+T4RgONi48CnhAlCi
         4h9+fD67Xw2n9LVkVtmntwPWgTYjqeOjDGbzobUCo+LjnO6Yr4hpiKfbn3H+T2Dh6upV
         9mfQcFWHZaNjXqivkydT9pfhfIOQBPdVRqpOYRhf2AADsNU9USx0xo51tXLV04OhdLDg
         b0uMqB9IgJi1Q6Q6c7DFjnbYRy1FGkmAtpZfSWN4CRhDzCaix1K0p3IPcE0z5cNxJ6KZ
         SDoLluUi9RS3ybfuDbj5dtrG0Xn8zViJvoq4wqIg1Day9YPILJ4HhRn4EEGkC+XZj9xW
         Hlqw==
X-Gm-Message-State: AGi0PuYOqDW7bRTOoKDcudl4f2tIcXLcgt9tOZa97CVNuNl4CiA9f9E6
        Jy//MEwFFQ5nd8b0JPuBg4VeUTIbC8nJxWEdj1E=
X-Google-Smtp-Source: APiQypKLpnll7mCTK5hJByNZ+I2zToNbaBev7/ujZB1Z7zORv+AAXOLY5C1GQuLB78hus+630w3uQzds8XU6gpqabLM=
X-Received: by 2002:a2e:3c0a:: with SMTP id j10mr10921764lja.205.1585679888664;
 Tue, 31 Mar 2020 11:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191120220559.18914-1-c-robey@ti.com> <41c73bc1-99ae-6797-5bb7-7acc0f6518c0@ti.com>
 <20191212170452.GV35479@atomide.com>
In-Reply-To: <20191212170452.GV35479@atomide.com>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Tue, 31 Mar 2020 20:38:38 +0200
Message-ID: <CAEf4M_C05Hwc_BEL6MaFNNEW0Cf2kc-LvMi9qdKxL7hVAFFDGQ@mail.gmail.com>
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

On Thu, Dec 12, 2019 at 6:06 PM Tony Lindgren <tony@atomide.com> wrote:
> > On 21/11/2019 00:05, Caleb Robey wrote:
> > > From: Jason Kridner <jdk@ti.com>
> > >
> > > BeagleBoard.org BeagleBone AI is an open source hardware single
> > > board computer based on the Texas Instruments AM5729 SoC featuring
> > > dual-core 1.5GHz Arm Cortex-A15 processor, dual-core C66 digital
> > > signal processor (DSP), quad-core embedded vision engine (EVE),
> > > Arm Cortex-M4 processors, dual programmable realtime unit
> > > industrial control subsystems and more. The board features 1GB
> > > DDR3L, USB3.0 Type-C, USB HS Type-A, microHDMI, 16GB eMMC flash,
> > > 1G Ethernet, 802.11ac 2/5GHz, Bluetooth, and BeagleBone expansion
> > > headers.
> > >
> > > For more information, refer to:
> > > https://beaglebone.ai
> > >
> > > This patch introduces the BeagleBone AI device tree.
> > >
> > > Note that the device use the "ti,tpd12s016" component which is
> > > software compatible with "ti,tpd12s015". Thus we only use the
> > > latter driver.
> >
> > Ah. thanks. I see my comments resolved here.
> > no more comments to net part from my side.
>
> Just FYI, Jason had one pending comment on the earlier version
> about the compatible property to use.
>
> So I'm assuming there will be a new version posted, tagging
> this one as read.

It came to my attention today when talking with Jason Kridner and
Robert Nelson that we did not get the BeagleBone AI device tree
upstream yet.

I am having trouble identifying what the pending comment was from the
original patch series.

Was it related to this compatible string?

> +       compatible = "beagleboard.org,am5729-beagleboneai", "ti,am5728",

thanks,
drew

--
Drew Fustini
BeagleBoard.org Foundation
https://beagleboard.org/about
